#import "../../school-template.typ": *


= Design van industriële controle systemen <ch:design-van-industriële-controle-systemen>

In dit deel wordt gezien hoe we industriële systemen kunnen ontwerpen en hoe we ze gaan connecteren.

#concept(title: "Voltage verschil")[
  #align(center)[
    #grid(
      columns: 2,
      align: center,
      figure(
        image("voltageverschil.png", width: 6cm),
        caption: [voltageverschil],
        label: <fig:voltageverschil>,
      ),

      figure(
        image("stopcontact.png", width: 6cm),
        caption: [stopcontact],
        label: <fig:stopcontact>,
      ),
    )
  ]

  Een stopcontact heeft 3 pinnen:
  - / L: de fase
  - / N: de nul
  - / PE: de aarding, deze is geconnecteerd via een kabel in het gebouw naar de grond zodat je een constante spanningsverschil hebt. We beschouwen dit als de absolute nul 0V.

  _Dit is geen nulvolt. Spanningen flucturen en er bestaat geen nul in het universium maar we bekijken het wel zo_

  Een connectie kan alleen een signaal geven wanneer er een tweede connectie als voltagedrop is. Je PLC moet dus een referentie volt hebben zodat het outputs kan genereren.

  Inputs en outputs kunnen:
  - / Sourcing: de input levert de spanning
  - / Sinking: de input trekt de spanning
  - / universeel: de input kan beide

  Een stopcontact zijn voltage is wisselspanning.
]

== Een PLC connecteren

#figure(
  image("Een PLC connecteren.png", width: 12cm),
  caption: [Een PLC connecteren],
  label: <fig:een-plc-connecteren>,
)

_In de slides is hij gewoon simpele schakeling aan het uitleggen.
Als iets niet geconnecteerd $arrow.r$ dan gaat hij niet aan staan (crazy right)_

*Foute PLC schakeling*

#figure(
  image("Foute PLC schakeling.png", width: 8cm),
  caption: [Foute PLC schakeling],
  label: <fig:Foute-PLC-schakeling>,
)

#examenbox[
  In de figuur zie je dat de plc outputs direct geconnecteerd zijn met de 24V. Dit is niet logisch. Je sensoren gaan altijd aan gaan. Je moet een referencie volt hebben en die connecteren aan de grond voor een spanningsverschil te hebben.

]

*PLC-signalen*\
PLC's wordt met de tabel hieronder getoont wanneer een spanningsval groot genoeg is zodat de PLC het kan detecteren.

#figure(
  image("PLC-logic.png", width: 8cm),
  caption: [PLC-logic],
  label: <fig:PLC-logic>,
)

== Compenten connecteren met andere voltages

*Interface relay*\
In de industrie werken meeste elektrische componenten met 24V.
Maar wat als je component 5V accepteerd? _Vele sensoren werken alleen met 5V_ Dan moet je de spanning laten dalen zodat je de sensor power kunt geven.

Een #keyterm[Interface relay] wordt gebruikt om een signaal door te sturen naar componenten van een hogere power, andere voltage of wanneer er een *Galvanische scheiding* tussen de circuits nodig is.

#figure(
  image("interface relay.png", width: 5cm),
  caption: [Interface relay],
  label: <fig:interface-relay>,
)

Hieronder een figuur zodat je weet wanneer je welk component gebruikt afhankelijk van je omgeving.

#figure(
  image("different-voltages-wanneer.png", width: 10cm),
  caption: [Different voltages wanneer],
  label: <fig:different-voltages-wanneer>,
)

Je ziet dat afhanklijk van de stroom en frequentie je een andere component moet gebruiken.


*Controller actuators*\
Als we lage voltage gebruiken voor ons circuit kunnen we deze niet connecteren aan de output van de PLC.
Hiervoor kunnen we een #keyterm[Controller actuator] gebruiken. Een contactor of SSR (solid state relay) kan gebruikt worden om ze te controlleren. _Zie tabel hierboven_

*SSR (Solid State Relay) /optocoupler*
Een SSR is een optocoupler maar dan voor grotere stromen en voltages. Hij heeft ook een *N.O (Normally Open)* configuratie.

SSR' hebben geen mechanische bewegende delen alleen semiconductors en elektrische componenten. Je hebt dus veel betere switching (geen bouncing) een geen risk van grote voltage verschillen.

#figure(
  image("SSR.png", width: 7cm),
  caption: [SSR],
  label: <fig:SSR>,
)


#figure(
  image("controlling actuator.png", width: 5cm),
  caption: [controlling actuator],
  label: <fig:controlling-actuator>,
)

*Optocoupler*\
Een #keyterm[Optocoupler] heeft een licht emitterende kant (IR-LED) en een licht ontvangende kant (fototransistor).

Het licht dat die maakt activeert $->$ een fotosensor en dan laat die stroom $A$ door.

Een optocoupler is een *Switch*: in saturatie mode is de LED ON of OFF. De output transator is volledig ON of OFF. Meestal is een optocoupler *N.O (Normally Open)*. Die gaat meestal altijd aan zijn buiten als er een signaal is.

#figure(
  image("optocoupler.png", width: 5cm),
  caption: [optocoupler],
  label: <fig:optocoupler>,
)

Optocouplers kunnen ook #keyterm[Analoge] signalen doorsturen. In #keyterm[Lineaire mode] kan je een lineaire relatie $f(x) = x$ maken zodat de intensiteit van de output gelijk is aan de input. Je kunt dan analoge signalen doorgeven. Ze kunnen hierdoor een transformator vervangen in meetcircuits, en kunnen ook DC doorsturen.



== Sourcing en Sinking

#concept(title: "Wet en droog contacten")[

  - *Wet contact*: three wire PNP or NPN.
  - *Dry contact*: “Potential free”, not linked to
  the sensor supply, e.g. a mechanical switch.
  Can switch any voltage (AC/DC/polarity)
  within the limits set by the datasheet.

]

=== Transitor als switch

Dit is vooral herhaling van elektronica.

Je hebt een base (B) _kijkt of de transitor gesloten of open moet zijn_, collector (C) _de ingang van de transitor_ en emmittor (E) _de uitgang van de transitor_.

Een base ziet het verschil oftewel tussen de grond of de input.

+ / PNP: base ziet het verschil tussen de grond. (afhankelijk van de weerstand en stroom door basetak)
+ / NPN: base ziet het verschil tussen de base en de input. (afhankelijk van de weerstand en stroom door basetak)

#align(
  center,
  grid(
    columns: 2,
    image("Transitorswitch.png", width: 8cm), image("NPN & PNP.png", width: 8cm),
  ),
)

=== 3-draad sensor: PNP vs NPN

Om het verschil tussen PNP en NPN te begrijpen, kijk je naar wat de sensor met de *zwarte signaaldraad* doet als hij geactiveerd wordt.

==== PNP (Sourcing) — De "Positieve" sensor
*Ezelsbruggetje:* De *P* staat voor #emph(text(blue)[Positief]) en #emph(text(blue)[Power]).
*Werking:* Denk aan de sensor als een *kraan*. Wanneer de sensor iets detecteert, zet hij de kraan open en "spuit" er +24V uit de zwarte draad.
*Stroomzin:* De stroom vloeit *uit* de sensor naar de verbruiker (bijv. een PLC-ingang). De sensor is de *bron* (source).
*Aansluiting:* De verbruiker (load) zit tussen de zwarte draad en de 0V (blauw).

==== NPN (Sinking) — De "Negatieve" sensor
*Ezelsbruggetje:* De *N* staat voor #emph(text(blue)[Negatief]) en #emph(text(blue)[Nul volt]).
*Werking:* Denk aan de sensor als een *afvoer* of een putje. Wanneer de sensor iets detecteert, zet hij de afvoer open naar de 0V (massa).
*Stroomzin:* De stroom vloeit *van* de verbruiker *naar* de sensor toe. De sensor "slikt" de stroom in. De sensor is de *gootsteen* (sink).
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
      image("3-draad PNP sensor.png", width: 7cm),
      caption: [PNP: De kraan staat open (+24V)],
      label: <fig:3-draad-PNP-sensor-nieuw>,
    ),
    figure(
      image("3-draad NPN sensor.png", width: 7cm),
      caption: [NPN: De afvoer staat open (0V)],
      label: <fig:3-draad-NPN-sensor-nieuw>,
    ),
  ),
)

=== 2-draad sensor

Een twee draad kan gebruikt worden voor zowel *Sourcing* als *Sinking*. Het heeft geen connectie met de referenties voltage.

#figure(
  image("Twee draad sensor.png", width: 15cm),
  caption: [Twee draad sensor],
  label: <fig:Twee-draad-sensor>,
)


=== Sourching 3&4 draad sensor


=== Sinking 3&4 draad sensor

=== Wiring IEC positive/negative logic

#figure(
  image("Wiring IEC.png", width: 12cm),
  caption: [Wiring IEC],
  label: <fig:Wiring-IEC>,
)


== PNP is veiliger

== Discrete sensoren

=== Wanneer moet een switch NO/NC (normaal open/normaal gesloten) zijn?

- In de onveilige toestand zal het besturingssysteem het gevaar stoppen. Een draadbreuk geeft een 0 aan de ingang en moet overeenkomen met de onveilige toestand.
- De veilige toestand zal bijgevolg 1 zijn: een actief signaal aan de ingang komt overeen met de veilige toestand.
- Het gebruik van "geen signaal" als bevestiging van een veilige situatie is onbetrouwbaar.

#voorbeeld(title: "Tank hoog en laag niveau alarm")[
  #examenbox("Examenvraag")
  #wrap-figure(
    image("tank.png", width: 5cm),
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
Deze zijn gebasseerd op #keyterm[Mechanische beweging]. Ze hebben vaak volt free contacten. Dit is meestal een switch van de input voltage.

#examenbox[Je gaat al deze sensoren moeten kennen en hun werkingen moeten kunnen uitleggen.]

+ / Limit switches: robust switches, mechanically operated by a roll on a lever.They are used to reliably detect less accurate positions, e.g. at the end of a conveyor belt.
+ / Level switch: a switch operated by a float on a lever or a chain.
+ / Flow switch: a membrane moves because of a pressure difference over an orifice.
+ / Thermal switch: thermal reset or thermal cutout (TCO) or Klixon
+ / Proximity switches: Contactless detection.

  #figure(
    image("proximity-switch.png", width: 5cm),
    caption: [proximity-switch],
    label: <fig:proximity-switch>,
  )
+ / Optische sensor:
  Werkt met een LED en photo diode

  Dit kan werken oftwel via een LED met photodiode. Die gaan rood of infrarood light sturen en bij reflectie kan die dat opnemen. Goed voor korte afstanden. Of met fibre-optic proximity-switch.

  #figure(
    image("fibre-optical proximity switch.png", width: 10cm),
    caption: [fibre-optical proximity switch],
    label: <fig:fibre-optical-proximity-switch>,
  )

+ / Ultrasone sensor:
  Werkt met geluidsgolven. Terugkerende geluidsgolven worden opgevangen door de sensor. _heel universeel_

+ / Inductieve sensor:
  Werkt met magnetische velden. Een *Wisselend* magnetisch veld wordt opgewerkt en metaal dat dichtbij komt via #keyterm[eddy current] warmt dat metaal op. Dit kan de sensor opnemen. _detecteert alleen metaal_

+ / Capacitieve sensor:
  Werkt met *Wisselend* elektrische velden. Een object gaat en elektrisch veld verstoren en de capaciteit gaat veranderen. Die verandering kan gedetecteerd worden.

  Het nadeel is dat het veel gevoeliger is voor de omgevingsfactoren. Een inductieve schakelaar detecteerd alleen *geleidende* objecten wat soms wensbaar is.

  _Smartphones werken met dit effect als je het scherm aanraakt._



  #figure(
    image("reed contact.png", width: 5cm),
    caption: [reed contact],
    label: <fig:reed-contact>,
  )
+ / Reed contact:
  Magnetische sensor, binnenin de sensor is de piston cilinder gemagnetizeerd. Als er een magneet dichtbij komt gaat de piston cilinder magnetisch worden en de contacten gaan sluiten. Je ziet dat je een N-pool en S-pool hebt op dat reed contact.

+ / Hall sensor:
  Gaat ook zoals een reed-sensor een magnetisch veld detecteren. _Concucerend met de reed-switch_

  Er is geen enkele beweging in de sensor en kan het dus veel snellere frequenties $f$ aan. Reed contact hebben mechanische delen en dus kan het snelle schakelen niet aan.

  #figure(
    image("hall-effect sensor.png", width: 10cm),
    caption: [hall-effect sensor],
    label: <fig:hall-effect-sensor>,
  )
  Bekijk de slides _pg 40-57_ voor meer info over elke sensor.

  #examenbox[Je moet deze sensoren op het examen kunnen geven en weten wanneer ze gebruikt worden, hoe ze werken en verschillen tussen de sensoren.]

#figure(
  image("symbolen switches.png", width: 12cm),
  caption: [symbolen switches],
  label: <fig:symbolen-switches>,
)

== Interfacing components

Hoe zorgen we ervoor dat we deftig onze inputs en outputs kunenn connecteren. Dit is IO (Input/Output). Als we spreken over alle soorten IO en hoe we sensoren, controllers en PLC's connecteren spreken we van een IO interface.


=== Soorten signalen


#TODO[Voeg toe van slides]
// todo:voeg toe van slides.









