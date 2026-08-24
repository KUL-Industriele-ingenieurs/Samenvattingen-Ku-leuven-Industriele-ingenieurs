#import "../../school-template.typ": *

= Analoge signalen integreren <ch:analoge-signalen>

#chapter-outline()

Tot hier was alles binair: een knop is ingedrukt of niet, een cilinder staat uit of in. Maar temperatuur, druk en niveau zijn *continue* grootheden. Hoe je die meet, was data-acquisitie. Hier gaat het over iets anders: hoe krijg je de meetwaarde *betrouwbaar van het veld tot in de PLC*, over tientallen meters kabel en met frequentieomvormers en schakelende spoelen in de buurt?

De industriële standaardbereiken zijn $0"–"20 "mA"$, $4"–"20 "mA"$, $0"–"10 "V"$ en $-10"–"+10 "V"$. Van die vier is $4"–"20 "mA"$ veruit het meest gebruikt, en de rest van dit hoofdstuk legt uit waarom.

== Waarom je geen spanningsingangen gebruikt

Neem een Pt100, een weerstand die $100 Omega$ meet bij $0 degree"C"$ en toeneemt met $0.385 Omega slash degree"C"$. Je wil de temperatuur kennen, dus je wil de *weerstand* kennen. Sluit je die met twee draden aan op een kaart in de stuurkast, dan loopt de meetstroom door diezelfde twee draden, en de spanningsval over die draden zit gewoon mee in je meting.

#figure(
  grid(
    columns: 1,
    row-gutter: 0.6em,
    image("assets/pt100-2draads.png", width: 8cm),
    image("assets/pt100-3draads.png", width: 8cm),
  ),
  caption: [Boven de 2-draadsaansluiting: de meetstroom loopt door de meetdraden. Onder de 3-draadsaansluiting: $V_2$ meet de val over één draad, $V_1$ die over de Pt100 plus één draad],
  label: <fig:pt100-aansluiting>,
)

Hoe erg dat is, reken je snel uit. Neem $4 "m"$ koperdraad met een sectie van $0.1 "mm"^2$, samen goed voor $0.68 Omega$:

$ Delta T = frac(R_"draad", alpha) = frac(0.68 Omega, 0.385 Omega slash degree"C") = 1.8 degree"C" $

met:
- $R_"draad"$: totale weerstand van de heen- en teruggaande meetdraad $[Omega]$
- $alpha$: temperatuurcoëfficiënt van de Pt100, $0.385 Omega slash degree"C"$ $[Omega slash degree"C"]$
- $Delta T$: systematische meetfout die je er gratis bij krijgt $[degree"C"]$

Ter vergelijking: de sensor zelf haalt in klasse AA een fout van $plus.minus (0.1 + 0.0017 dot |T|)$, dus $0.1 degree"C"$ bij $0 degree"C"$ en $0.27 degree"C"$ bij $100 degree"C"$. De draad alleen al is dus zeven keer slechter dan de sensor. En het wordt erger: die draadweerstand *drift* ook, want koper verandert zelf met de omgevingstemperatuur. Over $plus.minus 50 degree"C"$ is dat ongeveer $20 %$ van $0.68 Omega$, dus $0.13 Omega$ of nog eens $0.34 degree"C"$ die alle kanten op beweegt.

Er zijn drie manieren om daaraan te ontsnappen:

/ 3-draads: de klassieke industriële oplossing. $V_2$ meet de val over één draad, $V_1$ die over de Pt100 plus diezelfde draad. De weerstand van de sensor volgt dan uit $V_1 - V_2$, waardoor de draadweerstand wegvalt.
/ 4-draads: twee draden voeren de meetstroom, twee andere meten de spanning over de sensor met een hoge impedantie, zodat er praktisch geen stroom door de meetdraden loopt. Het nauwkeurigst, maar nog altijd gevoelig voor EMI (elektromagnetische interferentie).
/ Transmitter: zet elektronica in de kop van de thermowell die de zwakke sensorwaarde meteen omzet naar een stroomsignaal. Dan is de kabel naar de kast geen meetprobleem meer.

#concept(title: "Key insight")[
  Bij een *spanningssignaal* telt elke spanningsval onderweg mee in je meting, en die val hangt af van kabellengte, sectie en temperatuur. Bij een *stroomsignaal* is dat niet zo: in een gesloten lus is de stroom overal dezelfde, wat er ook tussen zit. Daarom stuurt de industrie stroom, niet spanning.
]

== Temperatuursensoren in het veld

=== Thermokoppel

Een *thermokoppel* bestaat uit twee draden van verschillende metalen die samenkomen in het meetpunt, de *hot junction*. Het andere uiteinde is het referentiepunt, de *cold junction*, dat op een gekende constante temperatuur zit. Wanneer de temperatuur in het meetpunt stijgt, wekken de twee metalen een verschillende spanning op (het *Seebeck-effect*), en het spanningsverschil is evenredig met de temperatuur van de hot junction.

Je gebruikt een thermokoppel wanneer je *extreme temperaturen* moet meten of wanneer *lage latentie* belangrijk is. Verlengen doe je met speciale compensatiekabel, niet met gewone draad, want elke overgang naar een ander metaal maakt zelf weer een thermokoppel.

=== Pt100 en Pt1000

Een Pt100 is een PTC (Positive Temperature Coefficient) weerstand van $100 Omega$ bij $0 degree"C"$. De Pt1000 is dezelfde sensor met een tien keer hogere basiswaarde, waardoor de draadweerstand relatief tien keer minder doorweegt. Beide zijn nauwkeuriger dan een thermokoppel bij gematigde temperaturen, en beide worden in 2-, 3- of 4-draadsuitvoering aangesloten.

=== Thermowell en transmitter

Het signaal van een temperatuursensor is heel zwak, en de signaaldraden zijn gevoelig voor externe elektrische en elektromagnetische velden. Een *thermowell* is de buis waarin je de sensor steekt: die schermt de velden af én scheidt de sensor van het proces, zodat je hem kan vervangen zonder de installatie te openen. In de kop van de thermowell zit meestal ruimte voor de *transmitter* die het zwakke signaal omzet naar $4"–"20 "mA"$.

#examenbox[
  Een transmitter zet om naar een *stroomsignaal*. Een transducer zet om naar een standaard *spanningssignaal* (bv. $0"–"10 "V"$), en dat blijft gevoelig voor storing.
]

== De 4-20 mA-lus

#wrap-figure(
  image("assets/4-20mA-lus-componenten.jpeg", width: 8cm),
  caption: [De vier taken in een 4-20 mA-lus],
  label: <fig:4-20ma-lus>,
  width: 8cm,
)[
  In een stroomlus moeten vier taken ingevuld zijn, en één component kan er meerdere tegelijk vervullen:

  + Een *sensor* die een procesgrootheid meet.
  + Een *transmitter* die die meting omzet naar $4"–"20 "mA"$.
  + Een *voeding* die de spanning levert, dus die stroom *sourcet*.
  + Een *ontvanger*, de last in de kring, die stroom *sinkt*.

  En dat alles in een *gesloten* lus, want anders loopt er geen stroom.
]

Het beginpunt is $4 "mA"$ en niet $0 "mA"$. Dat heet *live zero*: bij $0 %$ van de meetwaarde loopt er nog altijd stroom. Meet de ingang minder dan $3.8 "mA"$, dan is dat geen lage meetwaarde maar een *kabelbreuk*, en de sturing kan daarop reageren. Met een $0"–"20 "mA"$ signaal kan je die twee niet uit elkaar houden.

=== Hoeveel spanning heeft je lus nodig?

De lusvoeding moet genoeg spanning leveren om $20 "mA"$ door *alle* weerstanden in de kring te duwen. Een typische analoge ingang is $250 Omega$ of $500 Omega$, en de kabel telt ook mee.

#oefening(title: "Voedingsspanning van een stroomlus")[
  Eén analoog signaal wordt in serie gelezen door drie toestellen: een ampèremeter, de analoge ingang van een frequentieomvormer en de analoge ingang van een PLC. Samen met de kabel geeft dat $100 Omega + 250 Omega + 500 Omega$.

  *Denkproces.* In een serieschakeling loopt overal dezelfde stroom, dus tel je gewoon de weerstanden op en pas je de wet van Ohm toe op het slechtste geval, namelijk volle schaal $= 20 "mA"$.

  $ R_"tot" = 100 Omega + 250 Omega + 500 Omega = 850 Omega $

  $ U_"min" = R_"tot" dot I_"max" = 850 Omega dot 20 dot 10^(-3) "A" = 17 "V" $

  met:
  - $R_"tot"$: som van alle weerstanden in de lus, inclusief kabel $[Omega]$
  - $I_"max"$: de stroom bij volle schaal, altijd $20 "mA"$ $["A"]$
  - $U_"min"$: minimale spanning die de voeding moet kunnen leveren $["V"]$

  Een analoge voeding levert typisch $10$ tot $35 "VDC"$, dus $17 "V"$ is haalbaar. Kwam je boven de $35 "V"$ uit, dan moet je toestellen uit de lus halen.
]

Zo'n voeding moet bovendien *stabiel* zijn, zonder pieken of ruis. Deel ze dus niet met schakelende spoelen, lange onafgeschermde kabels of ongefilterde drives.

=== Schalen van het meetbereik

Het bereik van een sensor komt bijna nooit overeen met wat je nodig hebt. Dat is normaal, en je lost het op in de schaling.

#oefening(title: "Niveaumeting in een watervat")[
  Je wil het niveau meten in een open watervat van $0$ tot $16.6 "m"$. Er bestaan enkel sensoren met een bereik van $0$ tot $10 "m"$ of van $0$ tot $20 "m"$. Op het scherm wil je nette waarden zien, dus $0"–"100 %$.

  *Denkproces.* De sensor van $0"–"10 "m"$ valt af, want die zit al vol bij $10 "m"$ terwijl het vat $16.6 "m"$ hoog is. Blijft de sensor van $0"–"20 "m"$ over, die zijn volledige bereik lineair op $4"–"20 "mA"$ afbeeldt. Je moet dus weten welke stroom hoort bij een vol vat.

  $ I = 4 "mA" + 16 "mA" dot frac(h, h_"bereik") $

  met:
  - $h$: het gemeten niveau $["m"]$
  - $h_"bereik"$: het volledige meetbereik van de sensor, hier $20 "m"$ $["m"]$
  - $16 "mA"$: de spanwijdte van het signaal, van $4$ tot $20 "mA"$ $["mA"]$

  Bij een vol vat:

  $ I = 4 "mA" + 16 "mA" dot frac(16.6 "m", 20 "m") = 4 "mA" + 13.28 "mA" = 17.28 "mA" $

  In de PLC schaal je dus $4"–"17.28 "mA"$ naar $0"–"100 %$, en niet $4"–"20 "mA"$. Doe je dat laatste, dan leest een vol vat af als $83 %$.
]

=== Voor- en nadelen

*Voordelen.* De $4"–"20 "mA"$ lus is de dominante standaard in de industrie, is eenvoudig aan te sluiten en te configureren, en de live zero maakt een kabelfout meteen zichtbaar. Ze is weinig gevoelig voor achtergrondruis, en de spanningsval over de verbinding heeft geen invloed op de meetwaarde, waardoor het signaal over lange afstanden kan.

*Nadelen.* Eén lus draagt maar *één* procesgrootheid. En omdat het een stroomlus is, kan je ontvangers niet parallel hangen zoals bij een spanningssignaal: wil je de waarde op meerdere plaatsen verwerken, dan moeten de toestellen in *serie*. Daarbij mag maar één toestel een massareferentie hebben; alle andere hebben een differentiële ingang nodig. De isolatievereisten lopen daardoor snel op naarmate je meer lussen hebt.

== Actieve en passieve transmitters

Dit is het punt waar in het labo het vaakst iets misloopt: de vraag is telkens *wie de stroom levert*, de sensor of de ingangskaart.

#figure(
  grid(
    columns: 2,
    column-gutter: 0.5cm,
    align: top,
    image("assets/ai-4-20mA-2draads-passief.jpeg", width: 7.5cm),
    image("assets/ai-4-20mA-4draads-actief.jpeg", width: 7.5cm),
  ),
  caption: [Links een 2-draads *passieve* transmitter: de kaart is de spanningsbron. Rechts een 4-draads *actieve* transmitter met eigen voeding: de kaart is de last],
  label: <fig:ai-actief-passief>,
)

/ 2-draads, passief: de sensor gedraagt zich als een *variabele weerstand*. De ingangskaart levert de spanning en de sensor stelt in hoeveel stroom er loopt. Je hebt geen externe voeding nodig; men noemt dit ook *loop-powered*.
/ 3-draads: twee draden voor de voeding en één signaaldraad. Sluit je aan op een *single-ended* ingang. Let op de stroomrichting van de signaaldraad om te zien of de sensor sourcing (meest voorkomend) of sinking is.
/ 4-draads, actief: twee draden voor de voeding en twee voor het signaal. De sensor is zelf de bron en de ingangskaart is de *last*.

#examenbox[
  Vuistregels: een thermokoppel is een 2-draads *actieve spanningstransmitter*. Drie- en vierdraads $4"–"20 "mA"$ sensoren zijn meestal actief. Een tweedraads $4"–"20 "mA"$ sensor is bijna altijd *passief*, want tweedraads actieve stroomtransmitters zijn zeldzaam. Lees dus altijd twee handleidingen: die van de sensor én die van de kaart.
]

Moet een passieve tweedraadssensor toch op een ingang die een actieve transmitter verwacht, dan schakel je er een externe voeding bij en sluit je aan zoals bij een vierdraadssensor. Het werkt, maar het is een stuk slechter voor de EMC.

== Analoge ingangskaarten

Binnenin is een analoge meting *altijd* een spanningsmeting tussen twee potentiaalpunten, ook bij een ingang die "single ended" heet. Drie- en vierdraadsaansluitingen dienen om de sensor te voeden; bij de eigenlijke meting zijn er altijd maar twee draden betrokken.

- Voor een *spanningsmeting* gebruikt de kaart een grote weerstand, zodat ze geen energie uit de bron trekt.
- Voor een *stroommeting* gebruikt ze een kleine weerstand als *shunt*, om de stroom om te zetten naar een spanning die de ADC (Analog-to-Digital Converter) kan lezen.

=== Single-ended en differentieel

/ Single-ended: de referentiemassa ligt meestal intern vast, verbonden met het $0 "V"$ power contact van de klemmenrij. Eén draad voert het signaal, de andere is de gedeelde massa.
/ Differentieel: de kaart meet het *verschil* tussen twee ingangen, $I+$ en $I-$, zonder gedeelde massa. Dat is wat je nodig hebt zodra meerdere ontvangers in serie in dezelfde lus hangen, want dan kan er maar één een massareferentie hebben.

Bij differentiële ingangen is de *common mode voltage* belangrijk: dat is de gemiddelde spanning van de twee ingangen van de interne op-amp. De *CMRR* (Common-Mode Rejection Ratio) geeft aan hoe goed de kaart signalen onderdrukt die op beide ingangen tegelijk staan, zoals ruis, terwijl ze het verschil versterkt. Kanalen op dezelfde module verdragen daarbij maar een beperkt verschil in referentie.

#examenbox[
  Staan er $+$ en $-$ op een analoge ingang, kijk dan eerst of het een differentiële of een single-ended ingang is. Bij een differentiële ingang geven ze de polariteit van de interne ampèremeter aan. Bij een single-ended ingang kan $+$ evengoed "stroomingang" betekenen, wat iets heel anders is.
]

Sluit signaaldraden aan met *afgeschermde twisted pair*, en gebruik een stabiele voeding. Bij Beckhoff KL-modules is het bovendien opletten: enkel een paar types (KL3051, KL3052, KL3041, KL3042 en KL3454) voeden de stroomlus zelf en horen dus bij een passieve transmitter. Alle andere analoge ingangen gedragen zich als een vaste weerstand en hebben een externe voeding nodig. Sommige analoge klemmen onderbreken ook de $24 "V"$ voedingsrail naar de volgende module, waardoor je een voedingsklem (bv. KL9100) moet bijplaatsen.

== Alternatieve sensor- en actorinterfaces <sec:sensor-actor-interfaces>

Naast de klassieke $4$--$20 "mA"$-lus bestaan er andere manieren om een analoge sensor aan te sluiten. Die noem je samen #keyterm[sensor/actor interfaces]. De slides noemen er twee: #keyterm[HART] en #keyterm[IO-Link].

Een IO-Link-toestel kan een intelligente sensor of actuator zijn, een hub, of, dankzij de #strong[bidirectionele] communicatie, ook een mechatronische component zoals een grijper of een voeding met IO-Link-aansluiting.

#belangrijk["Intelligent" betekent hier dat het toestel gegevens over zichzelf bijhoudt] die je via het protocol kan lezen of schrijven:

- identificatiegegevens, zoals een typeaanduiding en een serienummer;
- parametergegevens, zoals gevoeligheden, schakelvertragingen of karakteristieken.

Het voordeel: je kan een sensor uitlezen en instellen zonder hem fysiek aan te raken, en na vervanging schrijf je de parameters gewoon opnieuw weg.

== De KL5101 encoder-interface <sec:kl5101>

De Beckhoff KL5101 is het voorbeeld uit de slides van een #keyterm[smart I/O]-klem voor een incrementele encoder (zie ook @sec:smart-io-plc). De klem kan pulsen tellen in het algemeen, of specifiek als encoder-interface werken.

De ingangen:

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Ingang*], [*Functie*]),
  table.hline(stroke: 0.5pt),
  [A, /A], [pulsingang, in encoder- én in tellermodus],
  [B, /B], [in encodermodus: de faseverschoven pulsingang; in tellermodus: de telrichting ($+5 "V"$ of open contact = op, $0 "V"$ = neer)],
  [C, /C], [nulpuntpuls voor het latchregister van de klem],
  [External Latch $24 "V"$], [externe latch-ingang],
  table.hline(stroke: 1pt),
)

#belangrijk[Let op de spanningsniveaus: A, /A, B, /B en C, /C werken op $5 "V"$], ook wanneer je de klem als gewone teller gebruikt. De externe latch werkt daarentegen op $24 "V"$.

De dubbele benaming A en /A is geen toeval: dat is #strong[differentiële signalering] uit @sec:differentiele-signalering. Elke puls komt over twee draden met tegengestelde polariteit, zodat ingekoppelde storing wegvalt in het verschil. Bij een encoder met snelle pulsen over een lange kabel is dat noodzakelijk.
