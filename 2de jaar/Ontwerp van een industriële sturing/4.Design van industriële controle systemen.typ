#import "../../school-template.typ": *


= Design van industriële controle systemen <ch:design-van-industriële-controle-systemen>

Dit hoofdstuk koppelt sensoren en actuatoren aan een PLC: welke spanning de ingang verwacht, hoe de stroom door de kring loopt, en welk component je ertussen zet als de spanningen niet overeenkomen.

#concept(title: "Spanningsverschil en referentiepotentiaal")[
  #align(center)[
    #figure(
      image("assets/voltageverschil.png", width: 7.5cm),
      caption: [Elke meting is een verschil tussen twee punten: de multimeter meet tussen de twee gekozen aansluitingen, niet tegenover "de aarde" op zich.],
      label: <fig:voltageverschil>,
    )
  ]

  Een elektrische spanning is altijd een *potentiaalverschil* tussen twee punten:
  - / L (Line / Fase): De actieve wisselspanningsgeleider.
  - / N (Neutral / Nulgeleider): De nulleider, verbonden met het sterpunt van de transformator.
  - / PE (Protective Earth / Aarding): Veiligheidsgeleider verbonden met de aarde, dient als veiligheidsreferentie ($0 "V"$).

  Een stuurkring kan pas een signaal overdragen als er een gesloten stroomkring is via een gedeelde spanningsreferentie (massa of $0 "VDC"$).

  In- en uitgangen worden ingedeeld op basis van stroomrichting:
  - / Sourcing (PNP-logica): De aansluiting levert de stroom (+24 V).
  - / Sinking (NPN-logica): De aansluiting voert de stroom af naar massa (0 V).
  - / Universeel (Bidirectioneel): De ingang kan zowel sourcing als sinking signalen verwerken via antiparallelle optocouplers.
]

== Een PLC connecteren

#figure(
  image("assets/Een PLC connecteren.png", width: 12cm),
  caption: [Correct aangesloten PLC-ingangskring met gesloten retourpad naar de gemeenschappelijke massa],
  label: <fig:een-plc-connecteren>,
)

#wrap-figure(
  image("assets/Foute PLC schakeling.png", width: 10cm),
  caption: [Foutieve schakeling: ontbrekende massareferentie verhindert dat de stroomkring sluit],
  label: <fig:Foute-PLC-schakeling>,
)[
  Een ingangskaart detecteert pas een logische 1 wanneer er effectief stroom door de interne optocoupler vloeit. Zonder gesloten retourpad naar de $0 "VDC"$ blijft de ingang inactief.

  Twee fouten staan op de figuur aangeduid. De referentiespanning van de voeding hangt nergens aan, dus de kring kan niet sluiten. En PE is niet hetzelfde als de $0 "V"$: de beschermingsgeleider is een veiligheidsgeleider, geen retourweg voor je signalen.
]

#wrap-figure(
  image("assets/PLC-logic.png", width: 10cm),
  caption: [Spanningsniveaus van de S7-1500-ingangen. De ingangskarakteristiek volgt IEC 61131: type 1 voor AC, type 3 voor DC.],
  label: <fig:PLC-logic>,
)[
  Tussen de twee spanningsgebieden zit een zone waar de kaart niets garandeert. Sommige componenten dekken meteen het hele bereik $10 - 30 "VDC"$; dan hoef je niets te doen.
]

== Componenten met een andere spanning aansluiten

#wrap-figure(
  image("assets/interface relay.png", width: 4.5cm),
  caption: [Interface relay voor potentiaalscheiding],
  label: <fig:interface-relay>,
)[
  Een *interface relay* (tussenrelais) stuurt een signaal door naar componenten met een hoger vermogen of een ander spanningsniveau (bv. $24 "VDC" arrow 230 "VAC"$), en biedt *galvanische scheiding* tussen besturings- en vermogenskringen.

  Het is een smal relais met meestal één uitgangscontact, soms een wisselcontact of een paar contacten. Die contacten zijn zo goed als altijd potentiaalvrij. Je zet er een als je twee kringen elektrisch wil scheiden, bijvoorbeeld om te vermijden dat elektrische storing van de ene kring op de andere overgaat, of om kringen op verschillende spanning te koppelen.
]

#wrap-figure(
  image("assets/different-voltages-wanneer.png", width: 7cm),
  caption: [Welk koppelcomponent kies je? Twee vragen volstaan: hoe vaak schakelt het, en hoeveel stroom loopt er.],
  label: <fig:different-voltages-wanneer>,
)[
  De grens tussen "laag" en "hoog" ligt niet in een getal vast. Het mechanische contact van een relais of contactor slijt door het schakelen zelf, dus zodra je snel moet schakelen kom je bij halfgeleiders uit.
]

=== SSR (Solid State Relay) en Optocouplers <sec:ssr-optocoupler>

#wrap-figure(
  image("assets/SSR.png", width: 7cm),
  caption: [Solid State Relay (SSR) met interne optocoupler en triac/MOSFET],
  label: <fig:SSR>,
)[
  Een *SSR* is een elektronisch vermogensrelais op basis van halfgeleiders (triac, thyristor of MOSFET) met optische isolatie:
  - Geen bewegende mechanische contacten, dus *geen contactdender* en *geen vlambogen*.
  - Geschikt voor miljoenen snelle schakelcycli zonder slijtage.
]

#wrap-figure(
  image("assets/optocoupler.png", width: 7cm),
  caption: [Optocoupler: optische signaaloverdracht via IR-LED en fototransistor],
  label: <fig:optocoupler>,
)[
  Een *optocoupler* zorgt voor galvanische scheiding tussen twee elektrische kringen.

  Een infrarood-LED stuurt licht naar een fototransistor. Wordt de LED aangestuurd, dan gaat de fototransistor in verzadiging en geleidt de stroom aan de secundaire zijde.

  Optocouplers sturen ook *analoge* signalen door. In *lineaire mode* is de uitgang evenredig met de ingang, zodat een optocoupler een *stroomtransformator* in een meetkring kan vervangen en ook DC doorgeeft; bij hoge frequenties treedt vervorming op. In de SMPS uit @sec:smps koppelt een optocoupler zo de DC-uitgangsspanning terug naar de PWM, zonder de galvanische scheiding op te geven.

  Omdat er niets mechanisch beweegt, ligt de maximale schakelfrequentie veel hoger dan bij een tussenrelais. Daardoor kan je met een optocoupler ook communicatie-, encoder- of PWM-signalen doorgeven. Naast de spanning- en stroomgrenzen is die schakelfrequentie dus de belangrijkste keuzeparameter. Zoals bij de meeste transistoruitgangen werkt hij alleen op DC, en let op het verschil tussen PNP en NPN.
]



== Sourcing en Sinking

#concept(title: "Wet en droog contacten")[

  - *Wet contact*: three wire PNP or NPN.
  - *Dry contact*: “Potential free”, not linked to
  the sensor supply, e.g. a mechanical switch.
  Can switch any voltage (AC/DC/polarity)
  within the limits set by the datasheet.

]

=== Transistor als schakelaar

Dit is vooral herhaling van elektronica.

Een transistor heeft drie aansluitingen: de *basis* (B) bepaalt of de transistor geleidt of niet, de *collector* (C) is de ingang en de *emitter* (E) de uitgang. De basis kijkt naar het spanningsverschil met de emitter.

/ PNP: de stroom loopt van *emitter naar collector*. De basis moet lager staan dan de emitter.

$ E arrow.r C $

/ NPN: de stroom loopt van *collector naar emitter*. De basis moet hoger staan dan de emitter.

$ C arrow.r E $
#align(
  center,
  grid(
    columns: 2,
    image("assets/Transitorswitch.png", width: 8cm), image("assets/NPN & PNP.png", width: 8cm),
  ),
)

=== 3-draad sensor: PNP vs NPN

Om het verschil tussen PNP en NPN te begrijpen, kijk je naar wat de sensor met de *zwarte signaaldraad* doet als hij geactiveerd wordt.

==== PNP (sourcing)
*Ezelsbruggetje:* de *P* staat voor #emph(text(blue)[Positief]) en #emph(text(blue)[Power]).

Detecteert de sensor iets, dan zet hij $+24 "V"$ op de zwarte draad. De stroom vloeit *uit* de sensor naar de verbruiker, dus de sensor is de *bron* (source). De verbruiker hangt tussen de zwarte draad en de $0 "V"$ (blauw). Omdat de sensor stroom levert, moet de ingangskaart ze *opnemen*.

==== NPN (sinking)
*Ezelsbruggetje:* de *N* staat voor #emph(text(blue)[Negatief]) en #emph(text(blue)[Nul volt]).

Detecteert de sensor iets, dan verbindt hij de zwarte draad met de $0 "V"$. De stroom vloeit *van* de verbruiker *naar* de sensor, dus de sensor neemt de stroom op (sink). De verbruiker hangt al aan de $+24 "V"$ (bruin) en wacht tot de zwarte draad hem met de $0 "V"$ verbindt. Omdat de sensor stroom opneemt, moet de ingangskaart ze *leveren*.

#table(
  columns: (1fr, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  stroke: none,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Type*], [*Signaal op zwarte draad*], [*Rol van de sensor*],
  [PNP], [+24 V (High)], [Levert stroom (Source)],
  [NPN], [0 V (Low)], [Ontvangt stroom (Sink)],
)

#examenbox[
  *Belangrijk voor het labo:*
  Meestal gebruiken we in Europa *PNP* sensoren voor PLC's. Waarom? Omdat bij een draadbreuk of kortsluiting naar de massa (0V) een NPN sensor per ongeluk "geactiveerd" zou kunnen lijken, wat onveilig is. Bij PNP is 0V gewoon "geen signaal".

  *Draadkleuren (IEC standaard):*
  - #text(fill: rgb("#8B4513"))[Bruin]: +24 VDC (Voeding)
  - #text(fill: blue)[Blauw]: 0 VDC (Massa/Referentie)
  - #text(fill: black)[Zwart]: Signaal / Output
]

#align(
  center,
  grid(
    columns: 2,
    gutter: 1cm,
    figure(
      image("assets/3-draad PNP sensor.png", width: 6cm),
      caption: [PNP: de zwarte draad krijgt $+24 "V"$],
      label: <fig:3-draad-PNP-sensor-nieuw>,
    ),
    figure(
      image("assets/3-draad NPN sensor.png", width: 5cm),
      caption: [NPN: de zwarte draad wordt met $0 "V"$ verbonden],
      label: <fig:3-draad-NPN-sensor-nieuw>,
    ),
  ),
)

=== 2-draadssensoren <sec:2-draad-sensoren>

#wrap-figure(
  image("assets/Twee draad sensor.png", width: 10cm),
  caption: [2-draadssensor in serie met de belasting.],
  label: <fig:Twee-draad-sensor>,
)[
  Een 2-draadssensor wordt direct in serie geschakeld met de ingangskring. Hij heeft geen aparte massa-aansluiting:
  - *In rust (open)*: Er vloeit een minimale #keyterm[lekstroom] ($I_"leak"$) door de kring om de interne elektronica van de sensor te voeden.
  - *In geleiding (gesloten)*: Er blijft een kleine #keyterm[restspanning] ($U_"drop"$) over de sensor staan.

  _Aandachtspunt:_ De PLC-ingang moet de restspanning en lekstroom tolereren volgens IEC 61131-2 Type 1/2/3.
]

=== 3- en 4-draadssensoren <sec:3-4-draad-sensoren>

- *3-draadssensor*: Beschikt over aparte voedingslijnen (#text(fill: rgb("#8B4513"))[bruin] = $+24 "VDC"$, #text(fill: blue)[blauw] = $0 "VDC"$) en één schakeluitgang (#text(fill: black)[zwart] = signaal).
- *4-draadssensor*: Bevat een extra vierde ader (#text(fill: gray)[wit]) met een tweede uitgang, zodat de sensor tegelijk een N.O.- en een N.C.-signaal levert. #belangrijk[De draadkleuren, wit inbegrepen, moet je van buiten kennen voor het labo en het examen.]

=== Veiligheidsaspect: Waarom PNP de Europese standaard is <sec:waarom-pnp>

#wrap-figure(
  image("assets/Wiring IEC.png", width: 7.5cm),
  caption: [IEC bedradingslogica: PNP (positieve logica, sourcing) vs. NPN (negatieve logica, sinking).],
  label: <fig:Wiring-IEC>,
)[
  In de Europese industrie is *PNP (positieve logica / sourcing input)* de absolute standaard voor machineveiligheid:
  - *Draadbreuk of aardfout bij PNP:* Raakt de signaaldraad los of maakt hij sluiting naar het chassis ($0 "V"$), dan valt de spanning weg naar $0 "V"$. De PLC leest een logische 0 (de veilige toestand).
  - *Aardfout bij NPN:* Raakt een signaaldraad van een NPN-sensor het metalen chassis ($0 "V"$), dan wordt de stroomkring gesloten en "denkt" de PLC dat de sensor geactiveerd is. Dit kan leiden tot onbedoeld herstarten of doorlopen van gevaarlijke bewegingen.
]

== Discrete sensoren <sec:discrete-sensoren>

=== Wanneer moet een switch NO/NC (normaal open/normaal gesloten) zijn? <sec:no-nc-keuze>

- In de onveilige toestand zal het besturingssysteem het gevaar stoppen. Een draadbreuk geeft een 0 aan de ingang en moet overeenkomen met de onveilige toestand.
- De veilige toestand is dus 1: een actief signaal aan de ingang betekent dat het veilig is.
- Het gebruik van "geen signaal" als bevestiging van een veilige situatie is onbetrouwbaar.

#voorbeeld(title: "Tank hoog en laag niveau alarm")[
  #examenbox("Examenvraag")
  #wrap-figure(
    image("assets/tank.png", width: 7cm),
    caption: [Tank met twee vlotterschakelaars: het hoogniveaualarm is N.C., het laagniveaualarm N.O.],
    label: <fig:tank>,
  )[

    We hebben een tank met twee vlotterschakelaars (float switches) om problemen te vermijden:

    - *Pomp vult reservoir (Hoog niveau alarm)*:
      - Water stijgt boven maximum = *ONVEILIG*.
      - Geactiveerde schakelaar = onveilige toestand = 0.
      - Niet-geactiveerd = 1 $arrow.r$ Dus *NC* (Normaal Gesloten).

    - *Pomp haalt water uit reservoir (Laag niveau alarm)*:
      - Zolang er genoeg water is = *VEILIG*. Het water activeert de schakelaar.
      - Geactiveerde schakelaar = veilige toestand = 1.
      - Niet-geactiveerd = 0 $arrow.r$ Dus *NO* (Normaal Open).

    *Conclusie*: Een ingenieur bestelt een NC hoog niveau alarm en een NO laag niveau vlotterschakelaar.

    Dezelfde redenering geeft meteen de bedrading van de bedieningsknoppen: een #strong[stopknop] is N.C., een #strong[startknop] is N.O. Het meest voorkomende defect is een gebroken draad, en die moet de machine stoppen, niet starten.
  ]
]

=== Industriële sensoren <sec:industriele-sensoren>

Sensoren zetten een fysische procesgrootheid om in een elektrisch signaal voor de controller.
- *Mechanische eindschakelaar*: rol of hefboom. Betrouwbaar voor positiedetectie, ongevoelig voor elektrische storing.
- *Niveauschakelaar*: vlotter op hefboom of ketting, hoog/laag in een tank.
- *Debietschakelaar*: membraan dat schakelt bij de drukval over een restrictie.
- *Thermische schakelaar (Klixon)*: bimetaal dat afschakelt bij oververhitting.

=== Benaderingsschakelaars (proximity switches) <sec:benaderingsschakelaars>

#grid(
  columns: (1fr, 3.8cm),
  gutter: 12pt,
  align: horizon,
  [
    Een *proximity switch* is een elektronische sensor die detecteert wanneer een object binnen een bepaalde afstand komt, zonder fysiek contact te maken. In industriële automatisering veel gebruikt om de aanwezigheid, positie of beweging van onderdelen te registreren.
  ],
  figure(
    image("assets/proximity-switch.png", width: 3.2cm),
    caption: [Proximity switch],
    label: <fig:proximity-switch>,
  ),
)

==== Inductieve proximity switch <sec:sensor-inductief>

#grid(
  columns: (1fr, 3.8cm),
  gutter: 12pt,
  align: horizon,
  [
    Speciaal ontworpen om *metalen objecten* te detecteren (vooral magnetische materialen).
    - De sensor bevat een spoel (meestal E-vormig, $L(s)$) die via een interne oscillator een wisselend magnetisch veld opwekt buiten de sensor.
    - Wanneer een metalen voorwerp dit veld binnendringt, ontstaan er *wervelstromen* (eddy currents). Deze verbruiken energie en zetten die om in warmte.
    - Het veranderde energieverbruik van de spoel wordt gemeten door een interne stroomdetectiekring, waarna de sensor schakelt. Contactloos en uiterst betrouwbaar zolang het materiaal voldoende geleidend is.
  ],
  figure(
    image("assets/inductieve-werking.png", width: 3.4cm),
    caption: [Werking inductieve sensor],
    label: <fig:inductieve-werking>,
  ),
)

==== Capacitieve proximity switch <sec:sensor-capacitief>

#grid(
  columns: (1fr, 3.8cm),
  gutter: 12pt,
  align: horizon,
  [
    Geschikt voor zowel *geleidende als niet-geleidende* materialen (kunststoffen, vloeistoffen, hout, etc.).
    - Creëert een wisselend elektrisch veld ($C(s)$); wanneer een object dit veld verstoort, verandert de capaciteit en wordt dit geregistreerd.
    - Schakelafstand is meestal beperkt (tot ca. $40 "mm"$).
    - Door de hoge gevoeligheid vaak uitgerust met een regelschroef aan de buitenkant om de sensor aan te passen aan stoffige of vochtige omgevingen.
  ],
  figure(
    image("assets/capacitieve-werking.png", width: 3.0cm),
    caption: [Werking capacitieve sensor],
    label: <fig:capacitieve-werking>,
  ),
)

==== Optische proximity switch <sec:sensor-optisch>

#grid(
  columns: (1fr, 4.4cm),
  gutter: 12pt,
  align: horizon,
  [
    Werkt door middel van lichtdetectie (zoals bewakingspoortjes in winkels).
    - *Through-beam (zender-ontvanger)*: staan recht tegenover elkaar; hoogste bereik.
    - *Retro-reflective*: werkt met een reflector aan de overkant.
    - *Diffuus*: licht weerkaatst op het object zelf; meest gebruikt, maar korter bereik door energieverlies bij verspreide reflectie.
    - *Glasvezel (fiber)*: licht kan via flexibele fiberkabels getransporteerd worden zodat de detector elders (bv. in de kast) kan staan.
  ],
  figure(
    image("assets/OIS_optisch_werking.png", width: 4.2cm),
    caption: [Werkingsprincipes optische sensoren],
    label: <fig:optische-werking>,
  ),
)

==== Ultrasonische proximity switch <sec:sensor-ultrasoon>

#grid(
  columns: (1fr, 4.8cm),
  gutter: 12pt,
  align: horizon,
  [
    - Gebruikt *geluidsgolven* om objecten te detecteren; alternatief voor optische sensoren in omgevingen met veel stof, rook of damp waar lichtsensoren niet betrouwbaar zijn.
    - *Aandachtspunt*: in tanks kunnen de uitgezonden golven weerkaatsen en storingen of meetfouten veroorzaken.
  ],
  figure(
    image("assets/OIS_ultrasonisch_sensor.png", width: 4.4cm),
    caption: [Werking ultrasonische sensor],
    label: <fig:ultrasonisch-sensor>,
  ),
)

==== Hall-effect proximity switch <sec:sensor-hall>

#grid(
  columns: (1fr, 4.2cm),
  gutter: 12pt,
  align: horizon,
  [
    Werkt op basis van het Hall-effect. In de sensor stroomt stroom door een geleidend halfgeleiderplaatje.
    - Zodra er een magneet in de buurt komt, buigt het magnetisch veld de ladingdragers af.
    - Hierdoor ontstaat de *Hall-spanning* ($V_H$) loodrecht op de stroomrichting om de nabijheid van het magnetisch object contactloos te detecteren.
  ],
  figure(
    image("assets/hall-effect sensor.png", width: 3.8cm),
    caption: [Hall-effect proximity switch],
    label: <fig:hall-effect-sensor>,
  ),
)

==== Reed-contact <sec:reed-contact>

#examenbox[
  *Examenvoorbeeld: Leg uit hoe een reed contact werkt?*
  
  Bij dit type sensor moet de behuizing *niet-magnetisch* zijn (glas of aluminium), anders vormt het een kooi van Faraday en verstoort het het interne magnetisch veld. Binnenin bevinden zich twee haarfijne ferromagnetische plaatjes bij een permanente magneet die veldlijnen concentreert (zoals een snelweg). Breng je een externe magneet in de buurt, dan trekt het magnetisch veld $B$ de twee metalen staven naar elkaar toe tot ze elkaar raken en het contact sluit.
]

#grid(
  columns: (1fr, 4.0cm),
  gutter: 12pt,
  align: horizon,
  [
    *Verschil Reed contact vs. Hall-sensor:*
    Zowel een reed contact als een Hall-sensor kunnen gebruikt worden voor magnetische objecten. Een Hall-sensor heeft *geen bewegende delen* en kan hoge frequenties aan. Als de snelheid hoger ligt dan *300 Hz* is een reed contact niet meer nauwkeurig door mechanische traagheid en dender.
  ],
  figure(
    image("assets/reed contact.png", width: 3.6cm),
    caption: [Mechanisch reed contact],
    label: <fig:reed-contact>,
  ),
)

==== Monteren proximity switch <sec:flush-nonflush>

#grid(
  columns: (1fr, 5.2cm),
  gutter: 12pt,
  align: horizon,
  [
    Niet alle proximity switches worden op dezelfde manier gemonteerd; raadpleeg steeds de datasheet:
    - *Flush*: mag vlak met het montageoppervlak gemonteerd worden.
    - *Non-flush*: moet *uitsteken* uit het metaal met een vrije zone rondom en vóór de kop.
    
    *Vuistregel:* draai de schroeven/moeren steeds vast tot aan het eind van de schroefdraad.
  ],
  figure(
    image("assets/OIS_flush_nonflush.png", width: 4.8cm),
    caption: [Flush vs. Non-flush montage],
    label: <fig:flush-nonflush>,
  ),
)

==== IEC-aansluitingen en -symbolen <sec:sensor-symbolen>

#figure(
  image("assets/symbolen switches.png", width: 9.0cm),
  caption: [IEC-standaardsymbolen voor industriële schakelaars en sensoren],
  label: <fig:symbolen-switches>,
)

== Interfacing van I/O-componenten

Bij het aansluiten van sensoren en actuatoren op de PLC let je op drie dingen: *stroomrichting*, *spanningsniveau* en *reactiesnelheid*.

=== Soorten signalen <sec:interfacing-signalen>

Er bestaan PNP-, NPN- en universele ingangen. #belangrijk[Leer handleidingen lezen], want dat is de enige manier om te weten wat een toestel verwacht.

De regel waar alles op neerkomt:

#belangrijk[Eén verbinding kan pas een signaal doorgeven als een tweede verbinding dient als spanningsreferentie en de kring sluit.]

Daaruit volgt de praktijk:
- Stuur je een stuurspanning uit de kast naar de ingang van een extern toestel, dan moet je #strong[ook de nul ($0 "V"$) van die kast] naar dat toestel doortrekken. Anders is er geen referentie en sluit de kring niet.
- Je kan natuurlijk voor elke spanning een extra SMPS (Switched-Mode Power Supply) bijzetten. Soms zit die al ingebouwd, bijvoorbeeld in een VFD (Variable Frequency Drive): daar is vaak een galvanisch gescheiden laagspanning beschikbaar van $24 "V"$, $12 "V"$ of $5 "V"$ om mee te interfacen.

=== Smart I/O-kaarten <sec:smart-io-kaarten>

#grid(
  columns: (1fr, 3.5cm),
  gutter: 12pt,
  align: horizon,
  [
    Een gewone PLC-ingang of -uitgang is #belangrijk[te traag] om hoogfrequente signalen te verwerken. De scancyclus van de CPU ($1 - 20 "ms"$) is daarvoor te lang.

    De oplossing is een #keyterm[smart I/O-kaart]: een klem met een eigen microcontroller (zoals de Beckhoff KL5101 voor encoders of KL2541 voor stappenmotoren).
    
    Wat zo'n kaart autonoom kan:
    - cyclustijd in het microseconde-bereik;
    - snelle pulsen tellen (bv. encoders tot $4 "MHz"$);
    - pulsen moduleren met PWM of PTO;
    - resultaten bufferen en autonome regeltaken uitvoeren;
    - via de backplane communiceren met de hoofd-CPU.

    #belangrijk[Leg de intelligentie in de klem zodra de snelheid van het signaal boven de scancyclus van de PLC uitkomt.] Alles wat trager is, programmeer je gewoon in de PLC.
  ],
  figure(
    image("assets/OIS_kl5101_klemmen.png", width: 3.2cm),
    caption: [Beckhoff smart I/O klem],
    label: <fig:beckhoff-smart-io>,
  ),
)

Andere smart I/O-kaarten:
- motion drive (stepper, VFD);
- PWM-uitgangskaart;
- snelle tellerkaart (HSC);
- PID-regelaarkaart;
- communicatiekaart met zend- en ontvangstbuffer.

=== De ASi-bus <sec:asi-bus>

#grid(
  columns: (1fr, 4.0cm),
  gutter: 10pt,
  align: horizon,
  [
    In plaats van elke sensor en actuator apart naar de stuurkast te bedraden, kan je ze op een #keyterm[ASi-bus] (Actuator Sensor Interface) aansluiten. De modules klemmen op één #strong[tweedraads profielkabel], die gelijktijdig de voeding ($30 "VDC"$) én de communicatie draagt.

    Je gebruikt dit systeem waar verspreid over de machine telkens een paar I/O-punten nodig zijn (zoals bij transportbanden of verpakkingsmachines). De winst zit in de *doordringtechniek (vampierklemmen)*: klemmen op de kabel gaat veel sneller dan afzonderlijke draden trekken. Bovendien is de kabel asymmetrisch geprofileerd zodat verkeerd ompolen onmogelijk is.
  ],
  figure(
    image("assets/OIS_asi_kabel.png", width: 3.6cm),
    caption: [Geprofileerde AS-i kabel],
    label: <fig:asi-kabel>,
  ),
)

=== Smart I/O op de PLC zelf <sec:smart-io-plc>

#grid(
  columns: (1fr, 4.2cm),
  gutter: 10pt,
  align: horizon,
  [
    Ook zonder aparte kaart heeft een moderne PLC al wat snelle hardware aan boord:
    - *HSC-ingangen* (High Speed Counter): tellen van snelle pulsen (bv. tanden op een as) via hardware-interrupts;
    - *Pulsuitgangen* (PTO / PWM): voor directe positionering of modulatie;
    - *Geïntegreerde interfaces*: bv. Profinet- of EtherCAT-poorten.
  ],
  figure(
    image("assets/OIS_plc_hsc.png", width: 3.8cm),
    caption: [HSC-ingang op PLC],
    label: <fig:plc-hsc>,
  ),
)

=== Universele in- en uitgangen

#figure(
  image("assets/OIS_universal_inputs_clean.png", width: 12cm),
  caption: [Driedraadsaansluiting van een velddevice. Links een NPN-sensor (sinking) op een sourcing ingangsmodule, met de common naar $24 "V"$. Rechts een PNP-sensor (sourcing) op een sinking module, met de common naar $0 "V"$. De ene component levert de stroom, de andere neemt ze op.],
  label: <fig:universal-inputs>,
)

Bij het interfacen levert het ene component de stroom (source) en neemt het andere ze op (sink). Samen vormen ze een gesloten stroomweg, en pas dan wordt de ingang actief.

Sommige producten kunnen #keyterm[allebei]. Zo'n universele ingang werkt dankzij #strong[bidirectionele dioden] die parallel geschakeld zijn: de stroom mag in beide richtingen lopen.

- *Sink wiring* (positieve logica): de common van de digitale ingangen gaat naar $24 "V"$. Zo sluit je bijvoorbeeld PNP-sensoren aan.
- *Source wiring:* de common van de digitale ingangen gaat naar $0 "V"$.

Waarom dat handig is:
+ *Flexibiliteit bij aansluiten*, bijvoorbeeld als je het toestel later wil hergebruiken voor iets anders.
+ *Minder risico op schade.* Een verkeerde aansluiting kan een gewone in- of uitgang vernielen; een universele ingang overleeft dat.










