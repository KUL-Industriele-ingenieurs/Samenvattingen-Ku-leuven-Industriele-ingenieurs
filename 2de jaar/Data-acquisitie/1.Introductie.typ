#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/1.DAQ_introductie.pdf | Slides/2.Sensoren_karakteristieken.pdf (slides 4-9)
//       Samenvatting DAQ p.3-4 | Samenvatting 2024-2025 p.6-7 | examenvragen 2016-2025

= Introductie <ch:introductie>

*Data-acquisitie* (DAQ) is het meten van signalen uit de fysieke wereld en het omzetten ervan naar data die een computer kan verwerken. Het vak volgt die weg in vier grote blokken: *analoge sensoren*, *signaalconditionering*, *signaalverwerking* (de omzetting met een ADC of DAC) en *software-interfacing*, met als laatste stap de voorstelling van de data.

== DAQ binnen de automatisering <sec:automatiseringspiramide>

DAQ zit onderaan de *automatiseringspiramide*. Op het veldniveau (level 1) zitten de sensoren en actuatoren die rechtstreeks met het proces (level 0) praten. Daarboven komen de PLC's (control level), SCADA en HMI (supervisory level), de planning en het management. Elke laag communiceert via een gateway met de volgende, met een eigen tijdsvertraging en een eigen grootte van datapakketten: onderaan milliseconden en kleine pakketten, bovenaan uren en grote pakketten.

#figure(
  image("assets/Management-Piramide.png", width: 13cm),
  caption: [De automatiseringspiramide (links) en de vlakkere structuur van een IoT-systeem (rechts) (slide 15)],
  label: <fig:Management-Piramide>,
)

#examenvraag(
  "23-24 vraag 8, voorbeeldexamen 2024",
  [De automatiseringspiramide geeft weer dat ...],
  opties: (
    [er verschillende lagen zijn die via gateways communiceren, elk met eigen tijdsvertraging en datapakketgrootte],
    [een IoT-systeem perfect past binnen een gelaagde piramidestructuur],
    [alle niveaus directe toegang hebben tot de ruwe sensordata],
    [een PLC enkel gebruikt wordt om sensoren uit te lezen of actuatoren aan te sturen],
  ),
  juist: "A",
)[Onderaan (veldniveau) gaat het om milliseconden en kleine pakketten, bovenaan (ERP) om uren en grote pakketten, en elke laag praat via een gateway met de volgende. C zegt net het omgekeerde: in een piramide ziet alleen het veldniveau de ruwe data. B klopt niet, want IoT is net vlakker dan de piramide (rechts in @fig:Management-Piramide).]

== Structuur van een meetsysteem <sec:meetsysteem>

Elk meetsysteem bestaat uit vier bouwblokken die na elkaar staan. De ingang is de *werkelijke waarde* van de grootheid, de uitgang de *gemeten waarde*.

#figure(
  image("assets/Structuur-van-een-meetsysteem.png", width: 14cm),
  caption: [De vier bouwblokken van een meetsysteem (slide 16)],
  label: <fig:Structuur-van-een-meetsysteem>,
)

+ *Meetelement* (sensing element): staat in contact met het proces en geeft een uitgang die afhangt van de te meten grootheid. Dit is de sensor zelf. (@ch:potentiometer -- @ch:temperatuur)
+ *Signaalconditioneringselement*: zet de uitgang van de sensor om naar een vorm die beter verder te verwerken is, bv. een brug, een versterker of een filter. (@ch:signaalconditionering)
+ *Signaalverwerkingselement*: zet het geconditioneerde signaal om naar een vorm die geschikt is om voor te stellen, bv. met een ADC en een computer. (@ch:dac -- @ch:sampling)
+ *Datapresentatie-element*: toont de meetwaarde op een manier die een mens kan lezen, bv. een display of een grafiek. (@ch:interfacing)

Concreet in het labo: een Pt100-temperatuursensor (TM4441) gaat naar een analoge ingangskaart (WAGO 751451), dan naar een PLC en ten slotte naar een laptop.

#figure(
  image("assets/Fysieke-voorbeelden-van-elke-structuur.png", width: 12cm),
  caption: [Hetzelfde meetsysteem met echte toestellen: sensor, ingangskaart, PLC, laptop (slide 17)],
  label: <fig:Fysieke-voorbeelden-van-elke-structuur>,
)

Vier voorbeelden uit de slides tonen hoe de blokken bij verschillende grootheden telkens terugkomen:

#figure(
  image("assets/Voorbeelden-meetsysteem.png", width: 18cm),
  caption: [Voorbeelden van meetsystemen: (a) temperatuur met een thermokoppel, (b) snelheid met een tachogenerator, (c) debiet met een meetflens, (d) gewicht met een rekstrook op een uitkragende balk (slide 25)],
  label: <fig:Voorbeelden-meetsysteem>,
)

== Data-acquisitiesysteem <sec:daq-systeem>

Een *DAQ-systeem* is een speciaal meetsysteem: de signaalverwerking bestaat altijd uit een *analoog-digitaalomzetting* (ADC), gevolgd door software die de data verwerkt en analyseert. Het bestaat dus uit sensoren, een computer en DAQ-software.

#figure(
  image("assets/L1-daq-systeem.png", width: 12cm),
  caption: [Van fysiek signaal naar digitale code: sensor, signaalconditionering, ADC en computer (Samenvatting DAQ p.3)],
  label: <fig:L1-daq-systeem>,
)

De ADC doet drie dingen na elkaar (meer in @ch:adc en @ch:sampling):
+ *Bemonsteren* (sampling): op vaste tijdstippen de spanning meten. Het aantal metingen per seconde is de bemonsteringsfrequentie.
+ *Kwantiseren*: elke meting afronden naar een van de beschikbare niveaus. Een 12-bit ADC heeft $2^12 = 4096$ niveaus.
+ *Coderen*: aan elk niveau een binaire code toekennen.

== Classificatie van meetelementen <sec:classificatie>

=== Transducer of sensor <sec:transductor-vs-sensor>

#concept(title: "Transducer en sensor")[
  Een *transducer* wordt geactiveerd door energie in een systeem en zet die energie om naar een andere vorm, voor een ander systeem.

  Een *sensor* ontvangt een signaal of stimulus en zet die om naar een *elektrisch* signaal.
]

De twee woorden worden vaak door elkaar gebruikt, maar een sensor is specifieker: zijn uitgang is altijd elektrisch.

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  table.header([], [*Transducer*], [*Sensor*]),
  [Uitgang], [Elke energievorm], [Altijd elektrisch],
  [Voorbeeld],
  [Luidspreker: elektrisch signaal → wisselend magneetveld → trilling. Een veer: kracht → verplaatsing],
  [Thermometer met elektrische uitgang; onze zintuigen werken ook zo],
)

Een sensor kan dus uit meerdere transducers bestaan, zolang de laatste stap een elektrisch signaal geeft. In dit vak gaat het alleen over sensoren.

#examenvraag(
  "23-24 vraag 1, 25-26 vraag 6",
  [Een transducer is ...],
  opties: (
    [een speciaal type sensor dat enkel gebruikt wordt om fysische grootheden te meten],
    [een toestel dat energieomzettingen kan uitvoeren],
    [een sensor die een gemeten verplaatsing omzet in een elektrisch signaal],
    [een optioneel onderdeel van elk type sensor],
  ),
  juist: "B",
)[Een transducer zet energie om van de ene vorm naar de andere, in welke vorm ook. C beschrijft een sensor: die levert altijd een elektrisch signaal. A en D draaien de relatie om: een sensor kan transducers bevatten, niet omgekeerd.]

=== Actieve en passieve sensoren <sec:passief-vs-actief>

#concept(title: "Actieve en passieve sensor")[
  Een *actieve sensor* heeft een externe voeding nodig, de *excitatie*. Een *passieve sensor* wekt zelf zijn uitgangssignaal op en heeft *geen excitatie* nodig.
]

Zonder bronspanning of -stroom geeft een actieve sensor dus niets: denk aan een RTD, thermistor, rekstrook of LVDT. Een thermokoppel, piëzo-elektrische sensor of fotodiode levert zelf een spanning, lading of stroom.

#table(
  columns: (auto, auto, auto, auto),
  align: (left, left, center, left),
  table.header([*Grootheid*], [*Sensor*], [*Actief/passief*], [*Uitgang*]),
  table.cell(rowspan: 4)[Temperatuur], [Thermokoppel], [passief], [spanning],
  [Silicium], [actief], [spanning/stroom],
  [RTD], [actief], [weerstand],
  [Thermistor], [actief], [weerstand],
  table.cell(rowspan: 2)[Kracht/druk], [Rekstrook], [actief], [weerstand],
  [Piëzo-elektrisch], [passief], [lading],
  [Versnelling], [Accelerometer], [actief], [capaciteit],
  [Positie], [LVDT], [actief], [AC-spanning],
  [Lichtintensiteit], [Fotodiode], [passief], [stroom],
)

Uit de tabel volgt het onderscheid meteen: een sensor waarvan de *weerstand* of *capaciteit* verandert, is altijd actief. Je moet er een stroom door sturen of een spanning over zetten om die verandering te zien. Een nadeel van actieve sensoren: een fout van 1 % op de excitatie zit ook als 1 % op de uitgang. De Wheatstonebrug (@ch:rekstroken-2) vangt dat op.

#examenvraag(
  "2019 vraag 5, ook 2016 en 2017",
  [Een passieve sensor ...],
  opties: (
    [heeft geen excitatie nodig],
    [heeft een uitgang in functie van $R$],
    [heeft een uitgang in functie van $V$],
    [heeft een uitgang in functie van $I$],
  ),
  juist: "A",
)[Passief betekent dat de sensor zelf zijn signaal opwekt, zonder bronspanning of -stroom. Het type uitgang zegt niets: een thermokoppel (passief) geeft een spanning, maar een silicium-temperatuursensor (actief) ook. Een uitgang in functie van $R$ (B) wijst zelfs op een actieve sensor.]

=== Sensoren in een regellus <sec:sensoren-regellus>

In een industriële regellus staat de sensor ver van de controlekamer. Het signaal gaat via signaalconditionering naar een *4--20 mA-transmitter*, over een lange kabel naar een ontvanger, door een ADC naar de microcontroller. De terugweg naar de actuator (hier een verwarming) loopt via een DAC en opnieuw een 4--20 mA-lus.

#figure(
  image("assets/Sensoren-in-een-regellus.png", width: 9cm),
  caption: [Typische industriële regellus (slide 8 van Sensoren -- karakteristieken)],
  label: <fig:Sensoren-in-een-regellus>,
)

Twee keuzes vallen op (Samenvatting 2024-2025 p.7):
- *Stroom in plaats van spanning*: over een lange kabel valt spanning weg. Die fout zie je niet in een spanningssignaal, maar de stroom in een gesloten lus is overal dezelfde.
- *4 mA in plaats van 0 mA* als nulpunt: krijg je 0 mA binnen, dan weet je dat de kabel onderbroken is.

Meer over transmitters in @ch:signaalconditionering.

=== Slimme sensoren <sec:slimme-sensoren>

Zet je een ADC en een microcontroller mee op de sensor, dan krijg je een *slimme sensor* (smart sensor). Die kan dingen doen die anders de computer doet:
- zichzelf kalibreren,
- de karakteristiek lineariseren,
- uitwisselbaar zijn met andere sensoren,
- communiceren over een standaard digitale interface.

Omdat alles digitaal is, hangen veel slimme sensoren samen op één veldbus in plaats van elk op een eigen 4--20 mA-kabel. Dat is handig als een machine honderden sensoren heeft.

#grid(
  columns: (1.4fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L1-slimme-sensoren.png", width: 100%),
    caption: [Slimme sensoren op een veldbus (slide 9)],
    label: <fig:L1-slimme-sensoren>,
  ),
  figure(
    image("assets/L1-slimme-sensor-opbouw.png", width: 100%),
    caption: [Opbouw: sensor, versterker, ADC, microcontroller (slide 9)],
    label: <fig:L1-slimme-sensor-opbouw>,
  ),
)

#examenvraag(
  "25-26 vraag 22, ook als voorbeeld op de laatste slide",
  [Een "smart sensor" ...],
  opties: (
    [is een sensor met een digitale ingang],
    [kan geïntegreerd worden op 1 chip],
    [is een stand-alone controlesysteem],
    [is nauwkeuriger dan een basissensor],
  ),
  juist: "B",
)[Een slimme sensor is sensor + versterker + ADC + microcontroller, en dat kan samen op één chip. D is de valstrik: slimmer is niet nauwkeuriger, want het meetelement zelf blijft hetzelfde. A klopt niet: de uitgang is digitaal, niet de ingang.]
