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

=== Industriële Sensoren

Sensoren zetten een fysieke procesgrootheid om in een elektrisch signaal voor de controller.

#concept(title: "Overzicht van sensortypes")[
  - *Mechanische eindschakelaars (Limit switches)*: Mechanisch bediend met rol of hefboom. Betrouwbare positiedetectie bij transportbanden of deuren. Eenvoudig en ongevoelig voor elektrische storingen.
  - *Niveauschakelaars (Level switches)*: Vlotter op hefboom of ketting voor hoog/laag niveaudetectie in tanks.
  - *Debietschakelaars (Flow switches)*: Membraan dat schakelt bij een drukval over een restrictie bij stromend medium.
  - *Thermische schakelaars (Thermal cutout / Klixon)*: Bimetaalschakelaar die direct afschakelt bij oververhitting.
  - *Benaderingsschakelaars (Proximity switches - contactloos)*:
    - *Inductief*: Bouwt een hoogfrequent wisselend magnetisch veld op. Een naderend metalen voorwerp wekt wervelstromen (*eddy currents*) op die energie aan het veld onttrekken. *Detecteert uitsluitend metalen/geleiders*. Ongevoelig voor stof en olie.
    - *Capacitief*: Werkt met een wisselend elektrisch veld. Naderende materialen veranderen de capaciteit van de sensor. *Detecteert alle materialen* (metalen, vloeistoffen, hout, kunststof). Gevoeliger voor omgevingsvervuiling en vocht.
    - *Optisch*: Zender (LED/laser) en ontvanger (fototransistor/fotodiode). Drie uitvoeringen: retro-reflectief (met reflector), diffuus reflecterend (op het object zelf), en zender-ontvanger (through-beam). Ook beschikbaar met optische vezels (*fibre-optic*) voor krappe ruimtes.
    - *Ultrasoon*: Verstuurt en ontvangt hoogfrequente geluidsgolven. Meet looptijd van de echo. Universeel inzetbaar, ongevoelig voor kleur, transparantie of stof.
    - *Magnetisch (Reed-contact vs. Hall-effect)*:
      - *Reed-contact*: Twee magnetiseerbare contactlipjes in een glazen buisje. Goedkoop, maar bevat mechanische delen en heeft een beperkte schakelsnelheid en levensduur.
      - *Hall-effect sensor*: Elektronische halfgeleidersensor die een spanning genereert onder invloed van een magnetisch veld. Geen bewegende delen, extreem hoge schakelfrequentie en onbeperkte levensduur.

==== Flush of non-flush monteren <sec:flush-nonflush>

Een naderingsschakelaar detecteert niet alleen jouw object, maar ook het metaal waarin hij zelf geschroefd zit. Daarom bestaan er twee bouwvormen, en het datablad zegt welke je hebt:

- #keyterm[Flush] (bündig): het veld komt alleen recht vooruit. Je mag de sensor tot aan de kop in metaal verzinken.
- #keyterm[Non-flush]: het veld puilt opzij uit, dus hij moet #strong[uitsteken]. Rond de kop moet een vrije zone blijven, en ook vóór de sensor moet een strook vrij blijven van ander metaal.

Monteer je een non-flush sensor toch vlak, dan ziet hij het omliggende metaal in plaats van het object en schakelt hij permanent.

#figure(
  image("assets/OIS_flush_nonflush.png", width: 9cm),
  caption: [Links flush: de sensor mag vlak in het metaal. Rechts non-flush: rondom en vóór de kop moet een vrije zone blijven, uitgedrukt in veelvouden van de schakelafstand $s_n$ en de diameter $d$.],
  label: <fig:flush-nonflush>,
)

Vuistregel bij het vastzetten: draai de moeren aan tot het einde van de schroefdraad.
]

#figure(
  grid(
    columns: 2,
    gutter: 0.5cm,
    figure(
      image("assets/proximity-switch.png", width: 5cm),
      caption: [Inductieve/capacitieve benaderingsschakelaar],
      label: <fig:proximity-switch>,
    ),
    figure(
      image("assets/fibre-optical proximity switch.png", width: 7cm),
      caption: [Optische sensor met glasvezelversterker],
      label: <fig:fibre-optical-proximity-switch>,
    ),
  ),
  caption: [Industriële benaderingsschakelaars],
)

#figure(
  grid(
    columns: 2,
    gutter: 0.5cm,
    figure(
      image("assets/reed contact.png", width: 5cm),
      caption: [Mechanisch Reed-contact],
      label: <fig:reed-contact>,
    ),
    figure(
      image("assets/hall-effect sensor.png", width: 10cm),
      caption: [Halfgeleider Hall-effect sensor],
      label: <fig:hall-effect-sensor>,
    ),
  ),
  caption: [Magnetische positiedetectie],
)

#figure(
  image("assets/symbolen switches.png", width: 15cm),
  caption: [IEC-standaardsymbolen voor industriële schakelaars en sensoren],
  label: <fig:symbolen-switches>,
)

== Interfacing van I/O-componenten

Het correct aansluiten van I/O-signalen tussen sensoren, actuatoren en de PLC vereist aandacht voor stroomrichting, spanningsniveaus en reactiesnelheid.


=== Soorten signalen


Er bestaan PNP-, NPN- en universele ingangen. #belangrijk[Leer handleidingen lezen], want dat is de enige manier om te weten wat een toestel verwacht.

De regel waar alles op neerkomt:

#belangrijk[Eén verbinding kan pas een signaal doorgeven als een tweede verbinding dient als spanningsreferentie en de kring sluit.]

Daaruit volgt de praktijk:

- Stuur je een stuurspanning uit de kast naar de ingang van een toestel, dan moet je #strong[ook de nul van die kast] naar dat toestel doortrekken. Anders is er geen referentie en sluit de kring niet.
- Je kan natuurlijk voor elke spanning een extra SMPS (Switched-Mode Power Supply) bijzetten. Soms zit die al ingebouwd, bijvoorbeeld in een VFD (Variable Frequency Drive): daar is vaak een galvanisch gescheiden laagspanning beschikbaar van $24 "V"$, $12 "V"$ of $5 "V"$ om mee te interfacen.

=== Smart I/O-kaarten

Een gewone PLC-ingang of -uitgang is #belangrijk[te traag] om een SSR (Solid State Relay) of optocoupler op zijn maximale snelheid te lezen of te schakelen. De scancyclus van de CPU is daarvoor gewoon te lang.

De oplossing is een #keyterm[smart I/O-kaart]: een klem met een eigen microcontroller. Het klassieke voorbeeld uit de slides is de Beckhoff KL2541. Wat zo'n kaart kan:

- werken met een cyclustijd die veel korter is dan die van de PLC-CPU;
- uitgangspulsen lezen op hoge frequentie, bijvoorbeeld encoderpulsen;
- uitgangspulsen moduleren met PWM;
- resultaten in een buffer opslaan, of met een gebufferde waarde werken;
- via de backplane-bus met de CPU communiceren.

#belangrijk[Leg de intelligentie in de klem zodra de snelheid van het signaal boven de scancyclus van de PLC uitkomt.] Alles wat trager is, programmeer je gewoon in de PLC.

Andere smart I/O-kaarten die de slides noemen:

- motion drive (stepper, VFD);
- PWM-uitgangskaart;
- snelle tellerkaart;
- encoder-interfacekaart;
- PID-regelaarkaart;
- communicatiekaart, met een zend- en een ontvangbuffer.

=== Smart I/O op de PLC zelf <sec:smart-io-plc>

Ook zonder aparte kaart heeft een moderne PLC al wat snelle hardware aan boord:

- #keyterm[HSC]-ingangen (High Speed Counter);
- pulsuitgangen;
- de hoofdcommunicatie-interface, bijvoorbeeld de Profinet-aansluitingen.

=== Universele in- en uitgangen

#wrap-figure(
  image("assets/OIS_universal_inputs_clean.png", width: 10cm),
  caption: [Driedraadsaansluiting van een velddevice. Links een NPN-sensor (sinking) op een sourcing ingangsmodule, met de common naar $24 "V"$. Rechts een PNP-sensor (sourcing) op een sinking module, met de common naar $0 "V"$. De ene component levert de stroom, de andere neemt ze op.],
  label: <fig:universal-inputs>,
)[
  Bij het interfacen levert het ene component de stroom (source) en neemt het andere ze op (sink). Samen vormen ze een gesloten stroomweg, en pas dan wordt de ingang actief.

  Sommige producten kunnen #keyterm[allebei]. Zo'n universele ingang werkt dankzij #strong[bidirectionele dioden] die parallel geschakeld zijn: de stroom mag in beide richtingen lopen.

  - *Sink wiring* (positieve logica): de common van de digitale ingangen gaat naar $24 "V"$. Zo sluit je bijvoorbeeld PNP-sensoren aan.
  - *Source wiring:* de common van de digitale ingangen gaat naar $0 "V"$.

  Waarom dat handig is:
  + *Flexibiliteit bij aansluiten*, bijvoorbeeld als je het toestel later wil hergebruiken voor iets anders.
  + *Minder risico op schade.* Een verkeerde aansluiting kan een gewone in- of uitgang vernielen; een universele ingang overleeft dat.
]









