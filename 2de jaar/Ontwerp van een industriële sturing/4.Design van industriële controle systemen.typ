#import "../../school-template.typ": *


= Design van industriële controle systemen <ch:design-van-industriële-controle-systemen>


In dit deel wordt gezien hoe we industriële systemen kunnen ontwerpen en hoe we ze gaan connecteren.

#concept(title: "Voltage verschil")[
  #align(center)[
    #grid(
      columns: 2,
      align: center,
      figure(
        image("assets/voltageverschil.png", width: 6cm),
        caption: [voltageverschil],
        label: <fig:voltageverschil>,
      ),

      figure(
        image("assets/stopcontact.png", width: 6cm),
        caption: [stopcontact],
        label: <fig:stopcontact>,
      ),
    )
  ]

  Een stopcontact heeft 3 pinnen:
  - / L: de fase
  - / N: de nul
  - / PE: de aarding, deze is geconnecteerd via een kabel in het gebouw naar de grond zodat je een constante spanningsverschil hebt. We beschouwen dit als de absolute nul 0V.

  _Strikt genomen is dat geen nul volt: spanningen fluctueren en een absolute nul bestaat niet. We rekenen er wel mee als referentie._

  Een aansluiting geeft pas een signaal wanneer er een tweede aansluiting is waarover de spanning kan vallen. Je PLC heeft dus een spanningsreferentie nodig om uitgangen te kunnen sturen.

  Inputs en outputs kunnen:
  - / Sourcing: de aansluiting levert de stroom
  - / Sinking: de aansluiting neemt de stroom op
  - / Universeel: de aansluiting kan allebei

  De spanning op een stopcontact is wisselspanning.
]

== Een PLC connecteren

#figure(
  image("assets/Een PLC connecteren.png", width: 12cm),
  caption: [Een PLC connecteren],
  label: <fig:een-plc-connecteren>,
)

_In de slides is hij gewoon simpele schakeling aan het uitleggen.
Als iets niet geconnecteerd $arrow.r$ dan gaat hij niet aan staan (crazy right)_

*Foute PLC schakeling*

#figure(
  image("assets/Foute PLC schakeling.png", width: 8cm),
  caption: [Foute PLC schakeling],
  label: <fig:Foute-PLC-schakeling>,
)

#examenbox[
  In de figuur hangen de PLC-uitgangen rechtstreeks aan de 24 V. Dat werkt niet: de sensoren staan dan altijd aan. Je hebt een spanningsreferentie nodig, verbonden met de massa, zodat er een spanningsverschil kan ontstaan.
]

*PLC-signalen*\
De tabel hieronder toont vanaf welke spanning een PLC een signaal als 0 of als 1 leest.

#figure(
  image("assets/PLC-logic.png", width: 8cm),
  caption: [PLC-logic],
  label: <fig:PLC-logic>,
)

== Componenten met een andere spanning aansluiten

*Interface relay*\
In de industrie werken de meeste elektrische componenten op 24 V. Maar wat als je component maar 5 V aankan? _Veel sensoren werken enkel op 5 V._ Dan moet je de spanning omlaag brengen om de sensor te voeden.

Een *interface relay* stuurt een signaal door naar componenten met een hoger vermogen of een andere spanning, of wanneer je een *galvanische scheiding* tussen de circuits nodig hebt.

#figure(
  image("assets/interface relay.png", width: 5cm),
  caption: [Interface relay],
  label: <fig:interface-relay>,
)

De figuur hieronder toont welk component je kiest in welke situatie.

#figure(
  image("assets/different-voltages-wanneer.png", width: 10cm),
  caption: [Different voltages wanneer],
  label: <fig:different-voltages-wanneer>,
)

Afhankelijk van de stroom en de schakelfrequentie kom je bij een ander component uit.


*Controller actuators*\
Werkt je kring op lage spanning, dan kan je de last niet rechtstreeks aan de PLC-uitgang hangen.
Daarvoor gebruik je een *stuurorgaan* tussen de PLC en de last: een contactor of een SSR (Solid State Relay). _Zie tabel hierboven._

*SSR (Solid State Relay) /optocoupler*
Een SSR is in feite een optocoupler voor grotere stromen en spanningen, in een *N.O.* (Normally Open) uitvoering.

Een SSR heeft geen bewegende delen, alleen halfgeleiders. Daardoor schakelt hij veel netter: geen contactdender (bouncing) en geen vlamboog.

#figure(
  image("assets/SSR.png", width: 7cm),
  caption: [SSR],
  label: <fig:SSR>,
)


#figure(
  image("assets/controlling actuator.png", width: 5cm),
  caption: [controlling actuator],
  label: <fig:controlling-actuator>,
)

*Optocoupler*\
Een *Optocoupler* heeft een licht emitterende kant (IR-LED) en een licht ontvangende kant (fototransistor).

Het licht dat die maakt activeert $->$ een fotosensor en dan laat die stroom $A$ door.

Een optocoupler is een *Switch*: in saturatie mode is de LED ON of OFF. De output transator is volledig ON of OFF. Meestal is een optocoupler *N.O (Normally Open)*. Die gaat meestal altijd aan zijn buiten als er een signaal is.

#figure(
  image("assets/optocoupler.png", width: 5cm),
  caption: [optocoupler],
  label: <fig:optocoupler>,
)

Optocouplers kunnen ook *Analoge* signalen doorsturen. In *Lineaire mode* kan je een lineaire relatie $f(x) = x$ maken zodat de intensiteit van de output gelijk is aan de input. Je kunt dan analoge signalen doorgeven. Ze kunnen hierdoor een transformator vervangen in meetcircuits, en kunnen ook DC doorsturen.



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

==== PNP (Sourcing) — De "Positieve" sensor
*Ezelsbruggetje:* De *P* staat voor #emph(text(blue)[Positief]) en #emph(text(blue)[Power]).
*Werking:* Denk aan de sensor als een *kraan*. Wanneer de sensor iets detecteert, zet hij de kraan open en "spuit" er +24V uit de zwarte draad.
*Stroomzin:* De stroom vloeit *uit* de sensor naar de verbruiker (bijv. een PLC-ingang). De sensor is de *bron* *(source)*.
*Aansluiting:* De verbruiker (load) zit tussen de zwarte draad en de 0V (blauw).

==== NPN (Sinking) — De "Negatieve" sensor
*Ezelsbruggetje:* De *N* staat voor #emph(text(blue)[Negatief]) en #emph(text(blue)[Nul volt]).
*Werking:* Denk aan de sensor als een *afvoer* of een putje. Wanneer de sensor iets detecteert, zet hij de afvoer open naar de 0V (massa).
*Stroomzin:* De stroom vloeit *van* de verbruiker *naar* de sensor toe. De sensor "slikt" de stroom in. De sensor is de *gootsteen* *(sink)*.
*Aansluiting:* De verbruiker (load) moet al aan de +24V (bruin) hangen en wacht tot de zwarte draad hem verbindt met de 0V.

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
      caption: [PNP: De kraan staat open (+24V)],
      label: <fig:3-draad-PNP-sensor-nieuw>,
    ),
    figure(
      image("assets/3-draad NPN sensor.png", width: 5cm),
      caption: [NPN: De afvoer staat open (0V)],
      label: <fig:3-draad-NPN-sensor-nieuw>,
    ),
  ),
)

=== 2-draad sensor

Een twee draad kan gebruikt worden voor zowel *Sourcing* als *Sinking*. Het heeft geen connectie met de referenties voltage.

#figure(
  image("assets/Twee draad sensor.png", width: 16cm),
  caption: [Twee draad sensor],
  label: <fig:Twee-draad-sensor>,
)

=== 3 & 4 Draad sensoren <sec:3-4-draad-sensoren>

=== Wiring IEC positive/negative logic <sec:wiring-iec-positive-negative-logic>

#figure(
  image("assets/Wiring IEC.png", width: 12cm),
  caption: [Wiring IEC],
  label: <fig:Wiring-IEC>,
)


== PNP is veiliger

== Discrete sensoren

=== Wanneer moet een switch NO/NC (normaal open/normaal gesloten) zijn?

- In de onveilige toestand zal het besturingssysteem het gevaar stoppen. Een draadbreuk geeft een 0 aan de ingang en moet overeenkomen met de onveilige toestand.
- De veilige toestand is dus 1: een actief signaal aan de ingang betekent dat het veilig is.
- Het gebruik van "geen signaal" als bevestiging van een veilige situatie is onbetrouwbaar.

#voorbeeld(title: "Tank hoog en laag niveau alarm")[
  #examenbox("Examenvraag")
  #wrap-figure(
    image("assets/tank.png", width: 5cm),
    caption: [tank],
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

  ]
]

=== Connecteren I/O (input/output) naar een PLC

Nu weten we het volgende:
- Een stop button moet N C gewired zijn (Normaal Gesloten).
- Een start button moet N O gewired zijn (Normaal Open).
- Het grootste defect is een gebroken draad en zou de machine stoppen.

=== Sensoren

*Discrete sensoren*\
Deze zijn gebasseerd op *Mechanische beweging*. Ze hebben vaak volt free contacten. Dit is meestal een switch van de input voltage.

#examenbox[Je gaat al deze sensoren moeten kennen en hun werkingen moeten kunnen uitleggen.]

+ / Limit switches: robust switches, mechanically operated by a roll on a lever.They are used to reliably detect less accurate positions, e.g. at the end of a conveyor belt.
+ / Level switch: a switch operated by a float on a lever or a chain.
+ / Flow switch: a membrane moves because of a pressure difference over an orifice.
+ / Thermal switch: thermal reset or thermal cutout (TCO) or Klixon
+ / Proximity switches: Contactless detection.

  #figure(
    image("assets/proximity-switch.png", width: 5cm),
    caption: [proximity-switch],
    label: <fig:proximity-switch>,
  )
+ / Optische sensor:
  Werkt met een LED en photo diode

  Dit kan werken oftwel via een LED met photodiode. Die gaan rood of infrarood light sturen en bij reflectie kan die dat opnemen. Goed voor korte afstanden. Of met fibre-optic proximity-switch.

  #figure(
    image("assets/fibre-optical proximity switch.png", width: 10cm),
    caption: [fibre-optical proximity switch],
    label: <fig:fibre-optical-proximity-switch>,
  )

+ / Ultrasone sensor:
  Werkt met geluidsgolven. Terugkerende geluidsgolven worden opgevangen door de sensor. _heel universeel_

+ / Inductieve sensor:
  Werkt met magnetische velden. Een *Wisselend* magnetisch veld wordt opgewerkt en metaal dat dichtbij komt via *eddy current* warmt dat metaal op. Dit kan de sensor opnemen. _detecteert alleen metaal_

+ / Capacitieve sensor:
  Werkt met *Wisselend* elektrische velden. Een object gaat en elektrisch veld verstoren en de capaciteit gaat veranderen. Die verandering kan gedetecteerd worden.

  Het nadeel is dat het veel gevoeliger is voor de omgevingsfactoren. Een inductieve schakelaar detecteerd alleen *geleidende* objecten wat soms wensbaar is.

  _Smartphones werken met dit effect als je het scherm aanraakt._



  #figure(
    image("assets/reed contact.png", width: 5cm),
    caption: [reed contact],
    label: <fig:reed-contact>,
  )
+ / Reed contact:
  Magnetische sensor, binnenin de sensor is de piston cilinder gemagnetizeerd. Als er een magneet dichtbij komt gaat de piston cilinder magnetisch worden en de contacten gaan sluiten. Je ziet dat je een N-pool en S-pool hebt op dat reed contact.

+ / Hall sensor:
  Gaat ook zoals een reed-sensor een magnetisch veld detecteren. _Concucerend met de reed-switch_

  Er is geen enkele beweging in de sensor en kan het dus veel snellere frequenties $f$ aan. Reed contact hebben mechanische delen en dus kan het snelle schakelen niet aan.

  #figure(
    image("assets/hall-effect sensor.png", width: 10cm),
    caption: [hall-effect sensor],
    label: <fig:hall-effect-sensor>,
  )
  Bekijk de slides _pg 40-57_ voor meer info over elke sensor.

  #examenbox[Je moet deze sensoren op het examen kunnen geven en weten wanneer ze gebruikt worden, hoe ze werken en verschillen tussen de sensoren.]

#figure(
  image("assets/symbolen switches.png", width: 12cm),
  caption: [symbolen switches],
  label: <fig:symbolen-switches>,
)

== Interfacing components

Hoe zorgen we ervoor dat we deftig onze inputs en outputs kunenn connecteren. Dit is IO (Input/Output). Als we spreken over alle soorten IO en hoe we sensoren, controllers en PLC's connecteren spreken we van een IO interface.


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

Bij het interfacen levert het ene component de stroom (source) en neemt het andere ze op (sink). Samen vormen ze een gesloten stroomweg, en pas dan wordt de ingang actief.

Sommige producten kunnen #keyterm[allebei]. Zo'n universele ingang werkt dankzij #strong[bidirectionele dioden] die parallel geschakeld zijn: de stroom mag in beide richtingen lopen.

- *Sink wiring* (positieve logica): de common van de digitale ingangen gaat naar $24 "V"$. Zo sluit je bijvoorbeeld PNP-sensoren aan.
- *Source wiring:* de common van de digitale ingangen gaat naar $0 "V"$.

Waarom dat handig is:

+ *Flexibiliteit bij aansluiten*, bijvoorbeeld als je het toestel later wil hergebruiken voor iets anders.
+ *Minder risico op schade.* Een verkeerde aansluiting kan een gewone in- of uitgang vernielen; een universele ingang overleeft dat.

#figure(
  image("assets/OIS_universal_inputs.png", width: 12cm),
  caption: [Universele ingangen. Links de common van de digitale ingangen naar $24 "V"$ (sink wiring), rechts naar $0 "V"$ (source wiring).],
  label: <fig:universal-inputs>,
)









