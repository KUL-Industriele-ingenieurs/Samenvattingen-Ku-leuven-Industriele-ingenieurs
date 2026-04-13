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

Dragen niet bij aan *exports*. _wel essensiteel maar economisch gezien dragen ze niet bij direct, wel indirect. Zoals medisch personeel die mensen gezond en werkend houd etc etc._

Onze lonen zijn ook hoog vergeleken met andere landen. Het is dus heel moeilijk om
competitief te zijn met andere landen. Als we spreken over *automatiseren*
neem dat misschien een job af maar het zorgt ervoor dat we competitief kunnen blijven met andere landen.

#figure(
  image("importexport.png", width: 8cm),
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

  Als een ingenieur 20-jaar na jou het syteem beheert moet die weten wat het allemaal betekent. In dit vak leer je *standardisering* van de productielijn.
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
  image("basisdiagram.png", width: 15cm),
  caption: [basisdiagram],
  label: <fig:basisdiagram>,
)

Elk geautomatiseerd systeem heeft twee soorten aansluitingen op de controller:

- / Inputs van het controlesysteem: De _controle-ingangen_ (bv. knoppen en schakelaars bediend door de operator) en de _sensorsignalen_ (bv. eindschakelaars, druksensoren). Ze vertellen de controller wat er in de machine of het proces gaande is.
- / Outputs van het controlesysteem: De _actuatoren_ (bv. motoren, kleppen, cilinders) die de machine fysiek laten bewegen, en de _visualisatie_ (bv. pilot lamps, HMI-schermen) die de operator feedback geven over de toestand van het systeem.

=== Logic Control Systemen (on/off-besturing)

Logic control systemen (bv. PLC, relais) werken met *discrete, digitale signalen*: een signaal is ofwel aan (1) ofwel uit (0). Dit maakt ze ideaal voor aan/uit-sturing van machines.

- / Veel digitale signalen: Drukknopen, eindschakelaars, lampen, relais, contactors, kleppen (valves), ... Elk van deze componenten heeft slechts twee toestanden.
- / 24 VDC als standaardspanning: In industriële omgevingen is 24 V gelijkstroom de standaard voor bekabeling van digitale I/O. Dit is veilig voor operators en compatibel met de meeste PLC-modules.
- / Hardwareplatformen: PLC's, relaisschakelingen en (elektro-)pneumatische systemen zijn typische realisaties van logische besturing.
- / Sequenties: De logica is vaak sequentieel — stap na stap wordt een actie uitgevoerd afhankelijk van resultaten van vorige stappen. Denk aan een machine die eerst klem, dan boor, dan loslaatbeweging uitvoert.

=== Regeltechniek (PID-controllers)

PID-controllers werken niet met aan/uit-signalen, maar met *continue, analoge signalen*. Ze meten een proceswaarde en sturen continu bij om een gewenste setpoint te bereiken (bv. temperatuurregeling).

- / Één analoge ingang, één analoge uitgang: De controller leest één meetwaarde (bv. temperatuur) en stuurt één actuator (bv. verwarmingselement) aan. Dit in tegenstelling tot logische besturing waarbij je tientallen digitale signalen beheert.
- / Standaard signaalbereiken: Analoge signalen in de industrie hebben gestandaardiseerde bereiken: $0"–"20"mA"$, $4"–"20"mA"$ (meest gebruikt, want 0 mA wijst op een kabelfout), $0"–"10"V$ en $-10"–"+10"V$.
- / Temperatuursensoren: *Pt100* en *Pt1000* (weerstandsthermometers, nauwkeurig voor lage temperaturen) en *thermokoppels* (voor hoge temperaturen, bv. in ovens).
- / Temperatuurregelaar: Een dedicated *temperature controller* — een klein apparaat dat de PID-logica zelf uitvoert zonder PLC, typisch voor enkelvoudige regelkringen.

#wrap-figure(
  image("automatisering pyramide.png", width: 8cm),
  caption: [automatisering pyramide],
  label: <fig:automatiseringpyramide>,
)[
  PLC zijn de bijna de grond van heel het automatisering. Zij zijn de dingen die connecteren aan de sensor en de basic logic doen. Alles dat meerdere stappen moet volgen, langduration moet werken en makkelijk vervangbaar moet zijn, wordt meestal gedaan met een PLC.
]

== Een goed controle systeem kiezen

+ *Specifieke controllers, CNC, robot controllers, ...*
+ *Labview:* Een systeem waarmee je sensoren kunt controlleren vanaf een pc. Goede voor een labo omgeving.
+ *Pneumatische controllers*
  #figure(
    image("pneumatische controller.png", width: 5cm),
    caption: [pneumatische controller],
    label: <fig:pneumatischecontroller>,
  )
+ *Relays:* Heeft de simpleste logica nog simpler dan een PLC. Alleen bruikbaar voor simpele logica.
  #figure(
    image("relats.png", width: 5cm),
    caption: [relays],
    label: <fig:relays>,
  )
+ *PLC:* Programmable Logic Controller. Geeft meer controle in productiesystemen. Je kunt het bezien als een simpele computer die je gaat programmeren gelijkaardig aan een arduino of microcontroller. Maar deze is toegepast in automatisering voor zijn betrouwbaarheid.
+ *Mechanische automatisering/CAM operated controls*: Enorm betrouwbaar, de beste oplossingen voor simpele producten _bv. bouten, moeren, ..._
  #figure(
    image("mechanicaltoolrelays.png", width: 5cm),
    caption: [mechanicaltoolrelays],
    label: <fig:mechanicaltoolrelays>,
  )
+ *Programmeerbare Relays:*
+ *IPC's*: Industrial PC, wordt meestal nog aangestuurd door een PLC maar is goed voor complexe software.
+ *SCADA*: Supervisory Control And Data Acquisition. Je bekijkt digitaal al je controle systemen om beter overzicht te krijgen.
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
+ *Mechatronics*: Een vage term die meerdere dingen kan betekenen, PID, PLC, Cyber-Physical Systems, ... Het gaat algemeen over dingen die door elektronica worden gecontrolleerd worden #keyterm[Mechatronics] genoemd.


== Industrie 4.0

+ Eerste industrie revolutie: Mechanisatie door water en stoomkracht.
+ Tweede industrie revolutie: Massaproductie door elektriciteit.
+ Derde industrie revolutie: Automatisering door computers en IT _PLC, PID-controllers, sensoren_.
+ Vierde industrie revolutie: Cyber-Physical Systems, IoT, AI, ...


== RDS Reference Designation System, Hoe ga je componten benoemen?


#figure(
  image("klassesRDS.png", width: 15cm),
  caption: [klassesRDS],
  label: <fig:klassesRDS>,
)

Je defineert je component in klasses. Dit is de *een letter code* die de functie van het component beschrijft. Voor elk aspect wordt een letter geven _Bv. EN 81346_

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
- $K$: Relays, een elektromagnetische schakelaar die een circuit opent of sluit.
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

== PLC introductie

PLC is een heel basis introductie tot computers.
Hoe connecteren machines met elkaar? Inputs en outputs, IO.
Deze worden allemaal aangehaald in deze introductie.

#concept(title: "PLC (Programmable Logic Controller)")[
  Dit is gespecialiseerde mini-computer die geen scherm, toetsenbord of muis heeft, maar wel een aantal ingangen en uitgangen.
  Deze worden gebruikt in industriële omgevingen om machines en processen te automatiseren.
]

#wrap-figure(
  image("PLC2.png", width: 5cm),
  caption: [PLC],
  label: <fig:PLC2>,
)[
  Een PLC heeft een *CPU* en input en output *I/O*.
  IO is niet persee deel van de PLC maar kan ook andere modules zijn.
  IO heb je ook op je eigen computer, HDMI, USB, ...

  Je hebt dan *Digital I/O* en *Analog I/O*.
  Digital I/O is een binaire input of output, bijvoorbeeld een schakelaar die aan of uit is.
  Analog I/O is een continue waarde, bijvoorbeeld een temperatuur sensor die een waarde tussen 0 en 100 graden geeft.

  Een PLC kan bijvoorbeeld de airco harder zetten in een kamer als die kamer te warm is.
  Dit kan van op afstand gebeuren, bijvoorbeeld via een netwerk, een app, sensor, ...

  Je krijgt inputs van sensoren of knoppen. Deze worden via logic verwerkt en geven een output.
]

Een PLC is *programmeerbaar*, wat betekent dat je
een programma kunt schrijven dat bepaalt hoe de PLC reageert op verschillende inputs
en hoe het de outputs aanstuurt.

Je connecteert aan een PLC met bijvoorbeeld een laptop via een seriële kabel, USB, of netwerkverbinding.
Je schrijft een programma op je laptop en uploadt dat naar de PLC, waarna de PLC het
programma uitvoert en de machines aanstuurt op basis van de logica die je hebt geprogrammeerd.

#wrap-figure(
  image("image1.png", width: 6cm),
  caption: [Controle systeem voorbeeld],
  label: <fig:image1>,
)[
  We leggen deze figuur uit met een eenvoudig voorbeeld.
  Je hebt een doodgewone knop die je kan indrukken.
  Jij als *operator* geef controle inputs aan de knop,
  bijvoorbeeld door hem in te drukken.

  *De logic controller (PLC)* ontvangt deze input en
  verwerkt deze volgens een vooraf gedefinieerd programma.

  De knop krijgt info door sensors die bijvoorbeeld info geven of
  de knop al dan niet is ingedrukt van de machine.

  Als de knop is ingedrukt gaat er een *logic action* gebeuren waarbij de *machine* een actie uitvoert,
  bijvoorbeeld een motor starten of een lamp laten branden.
  De *operator* krijgt feedback van de *machine*, bijvoorbeeld door een lamp die gaat branden of een geluidssignaal.
]

== Relays

Een relay is het meest fundamentele element in logic control.

Relays: Een elektromagnetische schakelaar die een circuit opent of sluit.
Een relay wordt aangestuurd door knoppen, switches en sensors. Hiermee bouw je de basis van elk sturingssysteem.

// TODO: uitleg over hoe relays werken.
#TODO("Uitleg over hoe relays werken")

== Knoppen en switches

De inputs die een relay aansturen zijn knoppen en switches.

Een main switch wordt aangegeven met *Q*.
Knoppen en switches die acties uitvoeren worden aangegeven met *S*.
Deze worden meestal in een tube geplaatst zodat ze niet per ongeluk kunnen worden ingedrukt.

#figure(
  image("sort of buttons and switched.png", width: 13cm),
  caption: [Soorten knoppen en switches],
  label: <fig:sortofbuttons>,
)

Je hebt meerdere soorten switches:

/ Push button: een knop die je indrukt en loslaat, zoals een deurbel.
/ Detent switch: een schakelaar die in een bepaalde positie blijft staan, zoals een lichtschakelaar.
/ Rotary switch: een schakelaar die je draait.
/ Pilot lamp: Informatie die de operator terug krijgt _bv. Staat de machine aan?_

Hoe de schakeling is getekend bepaalt zijn functie.

#figure(
  image("Voorbeeld circuit.png", width: 5cm),
  caption: [Voorbeeld circuit],
  label: <fig:voorbeeldcircuit>,
)

Dit circuit hierboven toont *twee* switches *S1* en *S2* die beide *normally open (NO) * zijn. Ze moeten beide gesloten zijn voor dat de lamp *P1* aan gaat.

== Signal time Diagram


Zoals gezien in elektronica kun je diagrammen maken om het gedrag van signalen over tijd te visualiseren.
#figure(
  image("Time-diagram.png", width: 15cm),
  caption: [Time-diagram],
  label: <fig:Time-diagram>,
)



== Timer en Timing Relays

#concept(title: "Timers")[

  Timers gaan pas na een bepaalde tijd af of aan na een verandering in signaal.

  Je kunt twee soorten timers hebben:
  / On delay timer (TON): De output gaat pas na een bepaalde tijd actief.
  / Off delay timer (TOF): De output gaat pas na een bepaalde tijd inactief.

  Hiervoor bestaan #keyterm[Speciale relays: Timing relays].
]
#wrap-figure(
  image("Timing relays.png", width: 3cm),
  caption: [Timing relays],
  label: "fig:timingrelays",
)[
  Timing relays geven ons controle over een tijdsinterval of het signaal af gaat of aan gaat.

  De timers gaan als volgt:
  - / TON (Timer On Delay): *TON(timer) KT1* met de input *A1* en output *A2*. Het moment dat *A1* actief wordt, start de timer en na de ingestelde tijd gaat *A2* actief. Het is de timer met het kruis $X$.
  - / TOF (Timer Off Delay): *TOF(timer) KT1* met de input *A1* en output *A2*. Het moment dat *A1* inactief wordt, start de timer en na de ingestelde tijd gaat *A2* inactief. Het symbool is de timer met een volledige ingevulde blok.

  #examenbox[Deze symbolen kennen, je moet ze kunnen snappen op het examen]
]

== Relay VS PLC — Waarom kiezen we voor PLC's?

Relay-systemen werken, maar worden snel complex en moeilijk te onderhouden. Een PLC vervangt klassieke relay-logica door software.

Je gaat dan #keyterm[Ladder logic] toepassen zodat je sequentiële logica kunt programmeren. _zie meer in je labo_

#figure(
  image("relayvsPLC.png", width: 16cm),
  caption: [Relay VS PLC],
  label: <fig:relayvsPLC>,
)

Een relay is een fysiek systeem maar met een PLC met een LAD implementatie _zie figuur @fig:relayvsPLC _is dit
een vervanging van klassieke relays.

==== Ladder logic


#wrap-figure(
  image("Ladder logic.png", width: 4cm),
  caption: [Ladder logic],
  label: <fig:Ladder-logic>,
)[
  Ladder logic is de manier hoe je sequentiele operaties gaat programmeren. Hierbij ga je stap voor stap logica bouwen. Je gaat pas naar de volgende stap als je condities voor die stap *True* zijn.

  Je bepaald eerst je begin condities (memory M0.0, sensoren, knoppen, etc.). _De labo's gaan hier meer op in. Herbekijk kort de slides voor voorbeelden en uitwerking en TIA portal._
]

== Logic control met PLC

=== PLC naam variabele


In een bedrijf wordt vaak een standaard gebruikt voor het benoemen van programmablokken en variabelen. Deze zijn vaak verschillend, maar gebaseerd op een aantal principes die internationaal gebruikelijk zijn. We leggen hier een standaard vast gebaseerd op `plcopen_coding_guidelines_version_1.0.pdf`.

+ *Algemene vorm*: `EerstePrefix_TweedePrefix_UniekeVariabeleBeschrijving`
+ Variabele- en bloknamen zijn in het Engels.
+ We gebruiken `UpperCamelCasing` om spaties te vermijden.
+ We gebruiken underscores om zones (prefixes) te scheiden.
+ In de eerste zone geven we het formaat van de variabele aan in kleine letters (~SystemHungarian), bv. `x` staat voor een bool. Soms verkiezen we hier de Simatic-nomenclatuur.
+ In de tweede zone geven we het geheugentype aan.
+ Ten slotte beschrijven we in de laatste zone de variabele zo correct mogelijk met een unieke naam. Als de variabele verwijst naar een component in de stroomschema's, beginnen we de naam met de referentie-aanduiding (RDS).
+ Voor de leesbaarheid zijn alle prefixes in kleine letters. Meestal is dit slechts één letter, en door `UpperCamelCasing` is het volgende karakter een hoofdletter, wat anders tot verwarring zou leiden.


*Scan cycle*
#wrap-figure(
  image("scancycle.png", width: 2cm),
  caption: [scancycle],
  label: <fig:scancycle>,
)[
  Een PLC gaat de inputs lezen PII, gaat het process uitvoeren OB1 en dan de outputs schrijven PIQ.

  Zo een scan duurt *1-30ms.*
]









