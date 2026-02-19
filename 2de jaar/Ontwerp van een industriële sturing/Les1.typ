// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Imports en Exports <chap:imports>

In een land heb is een mens producties als ze
*exports* creeren. Dit wordt ervoor dat geld binnenkomt in het land.

Voor dingen buiten het land te gebruiken ga je dingen *importeren*.

Je hebt eigenlijk maar een kleine hoeveelheid mensen die echt productief zijn voor
exports want mensen zoals
- medische personeel
- leerkrachten
- politie
- brandweer
- ambtenaren
- ...

Dragen niet bij aan *exports*.

Onze lonen zijn ook hoog vergeleken met andere landen. Het is dus heel moeilijk om
competitief te zijn met andere landen. Als we spreken over *automatiseren*
neem dat misschien een job af maar het zorgt ervoor dat we competitief kunnen blijven met andere landen.

#figure(
  image("importexport.png", width: 5cm),
  caption: [import en export],
  label: <fig:importexport>,
)

#wrap-figure(
  image("Geld binnen en buiten.png", width: 6cm),
  caption: [Geld binnen en buiten],
  label: <fig:geldbinnenenbuiten>,
)[
  De hoogte van de pijl toont de waarde van het product.
  Je neem raw materials binnen en je verhoogt de waarde door productie.
  Het enige dat dus geld binnenbrengt is *Productie*.

  Je kunt productie dus niet stoppen want het is uiteindelijk de motor van het bedrijf.

  Een industriële ingenieur moet ervoor zorgen dat de productielijn gestandardiseerd is.
  Documentatie, gestandaardiseerde componenten, ...

  Als een ingenieur 20jaar na jou het syteem beheert moet die weten wat het allemaal betekent. In dit vak leer je standardisering van de productielijn.
]

#concept(title: "IT en OT")[
  OT = Operational Technology
  IT = Information Technology

  In de OT mag het niet stilvallen. Het mag niet de oorzaak zijn dat iets stilvalt
  In de IT valt dingen wel stil. Websites, services zoals netflix kunnen soms gewoon platliggen.

  In OT spreken we vna operation time van 20-30 jaar.
]

== Ontwerp doelstellingen

Natuurlijk kunnen deze vereisten variëren afhankelijk van de betrokken industrie of installatie.

- *Betrouwbaarheid in een industriële omgeving*: Betrouwbare componenten, robuuste constructie, EMC, IP, ...
- *Ontwerp voor systeemondersteuning op lange termijn*: Onderdelen (van de fabrikant, Unis, ...) EN (nieuw) personeel (opleiding), die gedurende 20 jaar beschikbaar zullen zijn (op korte termijn, onderdelen geleverd < 2u). Beheer documentatie.
- *Ontwerp voor snelle herstelling*: Gebruik standaardcomponenten, methodologie en programmeertaal (LAD) over verschillende machines heen. Gebruik hetzelfde type componenten (insteekbaar/socket) over de machines heen. _bv. Relays hebben kun bewegende delen die snel vervangen kunnen worden_
- *Lage engineeringkosten & flexibiliteit*: Verminder de engineeringtijd: Gebruik kant-en-klare componenten en oplossingen, focus de engineeringinspanning op klant-specifieke vereisten. Een hogere componentkost is vaak acceptabel. Gebruik modulaire componenten voor flexibele oplossingen, wijzigingen in de vereisten zijn te verwachten.

== Basis diagram geautomatiseerd systeem.

#figure(
  image("basisdiagram.png", width: 5cm),
  caption: [basisdiagram],
  label: <fig:basisdiagram>,
)

#concept(title: "Basis diagram geautomatiseerd systeem.")[
  - Inputs of the control system: Control inputs and signals of sensors/switches.
  - Outputs of the control system: Actuators and Visualisation
]


#concept(title: "TypicalforLogic Control Systems:")[
  - Many digital signals: push buttons, switches, lamp, relay,contactor, Valve, ...
  - 24VDC
  - PLC, relais, (electro-)pneumatics…
  - Sequences
]

#concept(title: "Typical forControl Theory (PID controllers):")[
  - One analog reading, one analog output.
  - 0_20mA, 4_20mA, 0_10V and -10+10V.
  - For temperature measurement alsoPt100, Pt1000,Thermocouple.
  - TemperatureController.
]

#figure(
  image("automatisering pyramide.png", width: 5cm),
  caption: [automatisering pyramide],
  label: <fig:automatiseringpyramide>,
)

== Een goed controle systeem kiezen

+ *Specifieke controllers, CNC, robot controllers, ...*
+ *Labview:* Een systeem waarmee je sensoren kunt controlleren vanaf een pc. Goede voor een labo omgeving.
+ *Pneumatische controllers*
  #figure(
    image("pneumatische controller.png", width: 5cm),
    caption: [pneumatische controller],
    label: <fig:pneumatischecontroller>,
  )
+ *Relays*
  #figure(
    image("relats.png", width: 5cm),
    caption: [relays],
    label: <fig:relays>,
  )
+ *PLC:* Programmable Logic Controller.
+ *Mechanische automatisering/CAM operated controls*: Enorm betrouwbaar, de beste oplossingen voor simpele producten _bv. bouten, moeren, ..._
  #figure(
    image("mechanicaltoolrelays.png", width: 5cm),
    caption: [mechanicaltoolrelays],
    label: <fig:mechanicaltoolrelays>,
  )
+ *Programmeerbare Relays:*
+ *IPC's*: Industrial PC, wordt meestal nog aangestuurd door een PLC maar is goed voor complexe software.
+ *SCADA*: Supervisory Control And Data Acquisition
  #figure(
    image("Scada.png", width: 5cm),
    caption: [Scada],
    label: <fig:Scada>,
  )
  #figure(
    image("scada2.png", width: 5cm),
    caption: [scada2],
    label: <fig:scada2>,
  )
+ *DCS*: Distributed Control System, Inplaats dat alles centraal wordt gestuurd zorgt DCS dat systemen niet afhankelijk zijn van 1 centrale controller. Dus als er iets misgaat met 1 controller valt de rest van het systeem niet stil. Dit wordt veel gebruikt in de chemische industrie.
+ *Mechatronics*: Een vage term die meerdere dingen kan betekenen, PID, PLC, Cyber-Physical Systems, ...


= Industrie 4.0

+ Eerste industrie revolutie: Mechanisatie door water en stoomkracht.
+ Tweede industrie revolutie: Massaproductie door elektriciteit.
+ Derde industrie revolutie: Automatisering door computers en IT _PLC, PID-controllers, sensoren_.
+ Vierde industrie revolutie: Cyber-Physical Systems, IoT, AI, ...


= RDS Reference Designation System, Hoe ga je componten benoemen?


#figure(
  image("klassesRDS.png", width: 10cm),
  caption: [klassesRDS],
  label: <fig:klassesRDS>,
)

Je defineert je component in klasses. Dit is de *Een letter code* die de functie van het component beschrijft.

Voor elk aspect wordt een letter geven _Bv. EN 81346_

#oefening(
  title: "klassen RDS",
)[

  Als schakelbord =N-A1 een stroomonderbreker -Q1 bevat, dan is de volledige aanduiding van de stroomonderbreker =N1-A1-Q1 (of eenvoudiger =N-A1Q1, of =N-A1.Q1). Als diezelfde stroomonderbreker een relais -K12 bevat, is de volledige referentie =N-A1.Q1.K12.

  - +C1+A3+B6 (of +C1.A3.B6): Locatie B6 maakt deel uit van A3 maakt deel uit van C1
  - =A1=B1 (of =A1.B1): Subsysteemfunctie B1 maakt deel uit van systeemfunctie A1
  - -G1-M5 (of –G1.M5): Motor 5 maakt deel uit van systeem G1


  - 147K1 is de eerste relay K die je vindt op pagina 147
]

Een paar belangrijke letters:
- $K$: Relais, een elektromagnetische schakelaar die een circuit opent of sluit.
- $S$: Schakelaar, knoppen en schakelaars die acties uitvoeren.
- $P$: Meetinstrument, weergave-apparaat of testapparaat (bijv. Lamp).
- $Q$: Stroomonderbreker of hoofdschakelaar.

= Logic control
Uiteindelijk gaan we leren een elektrische circuit zelf op te stellen.

#concept(title: "Soorten circuits")[
  Je hebt verschillende soorten circuits:

  - *Combinatorisch circuit*: De uitgang hangt uitsluitend af van de huidige toestand van de ingangen, bv. AND-functie.
  - *Geheugencircuit*: De uitgang hangt niet alleen af van de huidige toestand van de ingangen, bv. Start-Stop.
    - In complexere systemen kunnen bepaalde toestanden over het hoofd worden gezien.
    - Beperkte mogelijkheden voor bv. gedrag na een noodstop.
    - Deze oplossingen worden snel te complex. Om dit te vermijden, gebruiken we zo weinig mogelijk geheugens, net genoeg om alle noodzakelijke condities te definiëren als combinaties van ingangen en geheugentoestanden.
  - *Sequentie*: Een snelle standaard oplossingsmethode voor het programmeren van sequentiële besturingssystemen (met behulp van een PLC). De methode zorgt ervoor dat het gedrag voorspelbaar en goed gedefinieerd is. Bv. Sequential function chart (SFC).
]

== Knoppen en switches

/ Relays: Een elektromagnetische schakelaar die een circuit opent of sluit.
== Relays

== Signal time Diagram

== Timer
* On delay timer:
* Off delay timer


#examenbox("Strikvraag:")

= Logic control met PLC

== PLC naam veriable


In een bedrijf wordt vaak een standaard gebruikt voor het benoemen van programmablokken en variabelen. Deze zijn vaak verschillend, maar gebaseerd op een aantal principes die internationaal gebruikelijk zijn. We leggen hier een standaard vast gebaseerd op `plcopen_coding_guidelines_version_1.0.pdf`.

+ *Algemene vorm*: `EerstePrefix_TweedePrefix_UniekeVariabeleBeschrijving`
+ Variabele- en bloknamen zijn in het Engels.
+ We gebruiken `UpperCamelCasing` om spaties te vermijden.
+ We gebruiken underscores om zones (prefixes) te scheiden.
+ In de eerste zone geven we het formaat van de variabele aan in kleine letters (~SystemHungarian), bv. `x` staat voor een bool. Soms verkiezen we hier de Simatic-nomenclatuur.
+ In de tweede zone geven we het geheugentype aan.
+ Ten slotte beschrijven we in de laatste zone de variabele zo correct mogelijk met een unieke naam. Als de variabele verwijst naar een component in de stroomschema's, beginnen we de naam met de referentie-aanduiding (RDS).
+ Voor de leesbaarheid zijn alle prefixes in kleine letters. Meestal is dit slechts één letter, en door `UpperCamelCasing` is het volgende karakter een hoofdletter, wat anders tot verwarring zou leiden.


#concept(title: "Scan cycle")[
  #figure(
    image("scancycle.png", width: 5cm),
    caption: [scancycle],
    label: <fig:scancycle>,
  )

  Een PLC gaat de inputs lezen PII, gaat het process uitvoeren OB1 en dan de outputs schrijven PIQ.

  Zo een scan duurt 1 tot 30ms.

  // TODO vergroot uitleg

]



#examenbox("Kennen het een Scan cycle werkt voor het examen")

== Relay VS PLC

#figure(
  image("relayvsPLC.png", width: 10cm),
  caption: [relayvsPLC],
  label: <fig:relayvsPLC>,
)

Een relay is een fysiek systeem maar met een PLC met een LAD implementatie _zie figuur @fig:relayvsPLC _is dit een vervanging van klassieke relays.



//todo: Uitleg geven over hoe je best ladder circuits maakt met SSE
















