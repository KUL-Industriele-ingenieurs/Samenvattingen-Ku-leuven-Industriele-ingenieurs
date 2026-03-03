#import "../../school-template.typ": *


= Design van industriële controle systemen <ch:design-van-industriële-controle-systemen>

In deze les wordt er gezien hoe elektrische systemen worden opgesteld in de industrie.

#concept(title: "Voltage verschil")[
  #grid
  #figure(
    image("voltageverschil.png", width: 6cm),
    caption: [voltageverschil],
    label: <fig:voltageverschil>,
  )

  #figure(
    image("stopcontact.png", width: 6cm),
    caption: [stopcontact],
    label: <fig:stopcontact>,
  )

  Een stopcontact heeft 3 pinnen:
  - *L*: de fase
  - *N*: de nul
  - *PE*: de aarding, deze is geconnecteerd via een kabel in het gebouw naar de grond zodat je een constante spanningsverschil hebt. We beschouwen dit als de absolute nul 0V.

  _Dit is geen nulvolt. Spanningen flucturen en er bestaat geen nul in het universium maar we bekijken het wel zo_

  Inputs en outputs kunnen:
  - Sourcing: de input levert de spanning
  - Sinking: de input trekt de spanning
  - universeel: de input kan beide

  Een stopcontact zijn voltage is wisselspanning.
]


== Een PLC connecteren

#figure(
  image("Een PLC connecteren.png", width: 8cm),
  caption: [Een PLC connecteren],
  label: <fig:een-plc-connecteren>,
)

Je gaat simpelweg je PLC connecteren met de grond zodat de PLC de 24V kan detecteren.

_In de slides is hij gewoon simpele schakeling aan het uitleggen.
Als iets niet geconnecteerd $arrow.r$ dan gaat hij niet aan staan (crazy right)_



#figure(
  image("Foute PLC schakeling.png", width: 5cm),
  caption: [Foute PLC schakeling],
  label: <fig:Foute-PLC-schakeling>,
)

#examenbox[
  In de figuur zie je dat de plc outputs direct geconnecteerd zijn met de 24V. Dit is niet logisch. Je sensoren gaan altijd aan gaan. Je moet een referencie volt hebben en die connecteren aan de grond voor een spanningsverschil te hebben.

]

*PLC-signalen*\
PLC's wordt met de tabel hieronder getoont wanneer een spanningsval groot genoeg is zodat de PLC het kan detecteren.

#figure(
  image("PLC-logic.png", width: 5cm),
  caption: [PLC-logic],
  label: <fig:PLC-logic>,
)


== Andere voltages

*Interface relay*\
In de industrie werken meeste elektrische componenten met 24V.

Maar wat als je component 5V accepteerd _Vele sensoren werken alleen met 5V_ Dan moet je de spanning laten dalen zdoat je de sensor power kunt geven.

Een #keyterm[Interface relay] wordt gebruikt om een signaal door te sturen naar componenten van een hogere power, andere voltage of wanneer er een *Galvanische scheiding* tussen de circuits nodig is.

Hieronder een figuur zodat je weet wanneer je welk component gebruikt afhankelijk van je omgeving.
#figure(
  image("different-voltages-wanneer.png", width: 10cm),
  caption: [different-voltages-wanneer],
  label: <fig:different-voltages-wanneer>,
)

Je ziet dat afhanklijk van de stroom en frequentie je een andere component moet gebruiken.

#figure(
  image("interface relay.png", width: 5cm),
  caption: [interface relay],
  label: <fig:interface-relay>,
)

*Controller actuators*\
Voor het schakelen van grote stromen en voltages wordt er gebruik gemaakt van een #keyterm[Controller actuator].

#figure(
  image("controlling actuator.png", width: 5cm),
  caption: [controlling actuator],
  label: <fig:controlling-actuator>,
)

*Optocoupler*\
Een #keyterm[Optocoupler] heeft een licht emitterende kant (IR-LED) en een licht ontvangende kant (fototransistor).

Het licht dat die maakt activeert een fotosensor en dan laat die stroom $A$ door.

Een optocoupler is een *Switch*: in saturatie mode is de LED ON of OFF. De output transitor is volledig ON of OFF. Meestal is een optocoupler *N.O (Normally Open)*. Die gaat meestal altijd aan zijn buiten als er een signaal is.

#figure(
  image("optocoupler.png", width: 5cm),
  caption: [optocoupler],
  label: <fig:optocoupler>,
)

*SSR (Solid State Relay) /optocoupler*
Een SSR is een optocoupler maar dan voor grotere stromen en voltages. Hij heeft ook een *N.O (Normally Open)* configuratie.

SSR' hebben geen mechanische bewegende delen alleen semiconductors en elektrische componenten. Je hebt dus veel betere switching (geen bouncing) een geen risk van grote voltage verschillen.

#figure(
  image("SSR.png", width: 5cm),
  caption: [SSR],
  label: <fig:SSR>,
)


== Sourcing en Sinking

#concept(title: "Wet en droog contacten")[

  - *Wet contact*: three wire PNP or NPN.
  - *Dry contact*: “Potential free”, not linked to
  the sensor supply, e.g. a mechanical switch.
  Can switch any voltage (AC/DC/polarity)
  within the limits set by the datasheet.

]

*transitor als switch*\

Dit is vooral herhaling van elektronica.

Je hebt een base (B) _kijkt of de transitor gesloten of open moet zijn_, collector (C) _de ingang van de transitor_ en emmittor (E) _de uitgang van de transitor_.

Een base ziet het verschil oftewel tussen de grond of de input.

+ PNP: base ziet het verschil tussen de grond. (afhankelijk van de weerstand en stroom door basetak)
+ NPN: base ziet het verschil tussen de base en de input. (afhankelijk van de weerstand en stroom door basetak)


#figure(
  image("Transitorswitch.png", width: 5cm),
  caption: [Transitorswitch],
  label: <fig:Transitorswitch>,
)

#figure(
  image("NPN & PNP.png", width: 5cm),
  caption: [NPN & PNP],
  label: <fig:NPN-PNP>,
)


*3 Draad PNP sensor*\

Een sourcing sensor:

In de figuur is het blokje links de PNP transistor. Als hij gesloten is gaat er een 24V door de zwarte draad. Als
#figure(
  image("3-draad PNP sensor.png", width: 5cm),
  caption: [3-draad PNP sensor],
  label: <fig:3-draad-PNP-sensor>,
)



*3 Draad NPN sensor*\
#figure(
  image("3-draad NPN sensor.png", width: 5cm),
  caption: [3-draad NPN sensor],
  label: <fig:3-draad-NPN-sensor>,
)

