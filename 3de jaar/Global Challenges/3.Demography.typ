#import "../../school-template.typ": *

= Demography <ch:demography>

== Introductie <sec:introductie-demographie>

De menselijke populatie is de laatste 100 jaar enorm hard gegroeid, tot nu ongeveer 8 miljard mensen.

Als we aan dit tempo blijven doorgroeien, kan onze planeet die populatie niet meer dragen.

In dit deel bekijken we de factoren achter de bevolkingsgroei en of we die kunnen beïnvloeden.

_Een aanrader over overbevolking: #link("https://www.youtube.com/watch?v=NMo3nZHVrZ4")[Kurzgesagt]._


=== Industriele revolutie <sec:industrial-revolution>

Tijdens de industriële revolutie daalde de kindersterfte. Er overleven meer kinderen, dus groeit de bevolking.

Na een tijd krijgen mensen minder kinderen. We bekijken waarom mensen vroeger veel kinderen kregen en wat een maatschappij doet overschakelen naar kleinere gezinnen.

We vergelijken de evolutie van kindersterfte en vruchtbaarheid in West-Europa met die in andere delen van de wereld. Daarmee voorspellen we hoe de populatie zal evolueren en of we dat zelf kunnen beïnvloeden.


=== Resources <sec:resources>

- *Gapminder*: quizzen over wereldwijde misvattingen en interactieve datatools (https://www.gapminder.org/tools/). Veel figuren in deze module komen daaruit.
- *Our World in Data*: data over demografie, milieu en economie, met korte artikels als context.
- *World Bank*: data per land, regio en de hele wereld (https://data.worldbank.org/).


=== Populatie groei

Wanneer we de populatie plotten over de tijd, zien we voor het grootste deel van het bestaan van de mensheid (±300.000 jaar) een heel vlakke curve. Tot ongeveer 10.000 jaar geleden waren er maximaal 20 à 30 miljoen mensen op aarde.

De laatste 200 jaar stijgt de populatie gigantisch, tot ongeveer 8 miljard mensen vandaag.

#figure(
  image("assets/Populatiegroei-tegenover-de-tijd.png", width: 10cm),
  caption: [Populatiegroei-tegenover-de-tijd],
  label: <fig:Populatiegroei-tegenover-de-tijd>,
)

#table(
  columns: 2,
  align: (left, right),
  table.header([*Periode*], [*Wereldbevolking*]),
  [Romeinse tijd], [270 miljoen],
  [1500], [500 miljoen],
  [1960], [3 miljard],
  [2020], [8 miljard],
)

Dat is een 10x vergroting in 200 jaar. Het laatste decennium kwamen er evenveel mensen bij als er 200 jaar geleden in totaal waren.

Daarom denken veel mensen dat populatiegroei een groot probleem is. De redenering: mensen krijgen veel kinderen, die kinderen krijgen weer kinderen, en uiteindelijk kan geen enkel systeem op aarde die populatie onderhouden.

#wrap-figure(
  image("assets/The-population-bomb-book-cover.png", width: 3cm),
  caption: [The-population-bomb-book-cover],
  label: <fig:The-population-bomb-book-cover>,
)[
  *Thomas Malthus* stelde het probleem eind 18e eeuw als eerste zo: binnen enkele decennia zou de aarde de bevolking niet meer kunnen voeden, met conflict en hongersnood als gevolg.

  In de jaren 1960 herhaalde *Paul Ehrlich* dit in zijn boek "The Population Bomb". Hij voorspelde dat de draagkracht van de aarde tegen 2000 overschreden zou zijn, met massale hongersnood als gevolg.

  Ook vandaag zeggen wereldleiders dat populatiegroei een probleem is, bijvoorbeeld Emmanuel Macron en Prins William.

  Het verleden doortrekken naar de toekomst geeft geen inzicht. We moeten de *mechanismes* van bevolkingsgroei begrijpen. Dan kunnen we voorspellen hoeveel mensen er in 2100 zullen zijn en of we de groei kunnen afremmen.
]

== Geschiedenis van mortaliteit

=== Exponentiele groei <sec:exponentiele-groei>

#concept(title: "Exponentiele groei")[
  Bij exponentiële groei komt er elke tijdstap een vaste fractie bij van wat er al is:

  $ (d N)/(d t) = r N $

  met:
  - $N$: de hoeveelheid (geld, mensen, besmettingen) [-]
  - $r$: de groeivoet, de fractie die per tijdseenheid bijkomt [1/jaar]
  - $t$: de tijd [jaar]

  Zo berekent een bank je interest. Bij 10 % interest groeit 100 euro zo:

  #table(
    columns: 3,
    align: center,
    table.header([*Jaar*], [*Bedrag*], [*Interest (10 %)*]),
    [1], [100], [10],
    [2], [110], [11],
    [3], [121], [12,1],
    [10], [235,8], [23,6],
    [20], [611,6], [61,2],
    [30], [1586,3], [158,6],
  )

  Twee eigenschappen:
  + Je kan *elk getal* bereiken als je lang genoeg wacht, ongeacht $r$ of de beginwaarde.
  + De groei *versnelt*: hoe meer er is, hoe meer er bijkomt.

  Een recent voorbeeld is COVID-19: meer besmettingen geven in de volgende tijdstap nog meer besmettingen.
]

Pessimistische analisten gebruiken exponentiële groei voor de bevolking. Als elk gezin 4 kinderen krijgt, verdubbelt de bevolking elke 30 jaar. Blijft dat duren, dan wordt de bevolking oneindig groot.

Of dat klopt, zie je op een *semi-logaritmische grafiek*: de y-as gaat in stappen van 1, 10, 100, 1000, ... Exponentiële groei is daarop een rechte lijn (@fig:Semi-logaritmische-grafiek).

#figure(
  image("assets/Semi-logaritmische-grafiek.png", width: 11cm),
  caption: [Dezelfde exponentiële groei op een gewone (links) en een semi-logaritmische grafiek (rechts)],
  label: <fig:Semi-logaritmische-grafiek>,
)

#figure(
  image("assets/Superexponentiele-groei.png", width: 12cm),
  caption: [Superexponentiele-groei],
  label: <fig:Superexponentiele-groei>,
)

Zelfs op de semi-log grafiek buigt de curve naar boven. Dat is *superexponentiële groei*: de bevolking groeit sneller dan exponentieel. Zo'n groei kan het systeem waarop ze steunt overweldigen, waardoor de draagkracht overschreden wordt. De pessimisten hebben dus een punt.

Groeit de bevolking (8 miljard) nog een eeuw met 1 % per jaar, dan zijn we met meer dan 20 miljard in 2122. Of de aarde dat aankan, weten we niet.

De vraag is of we het verleden zomaar mogen doortrekken naar de toekomst. Dat beantwoorden we in de volgende stukken.

=== Populatiegroei in verschillende landen <sec:populatiegroei-in-verschillende-landen>

Populatiegroei volgt vaak een (super)exponentiële curve, maar verschilt sterk tussen landen.

#figure(
  image("assets/Populatie-Japan-Ethiopie-Duitsland.png", width: 11cm),
  caption: [Populatie van Japan, Ethiopië en Duitsland sinds 1800 (Gapminder)],
  label: <fig:Populatie-Japan-Ethiopie-Duitsland>,
)

- *Duitsland*: de groei start vroeg, is niet zo sterk en vertraagt na een tijd.
- *Japan*: de groei start later en is sterker, maar daalt snel. Na 2010 krimpt de bevolking zelfs.
- *Ethiopië*: de groei start pas rond 1950 en is tot vandaag heel steil.

Per continent (@fig:Superexponentiele-groei) zie je een trage groei en dan een sterke stijging vanaf ±1700 in West-Europa, iets later in Azië. Dat komt door de industriële revolutie.


=== Industriele revolutie en mortaliteit <sec:industriele-revolutie>

Vanaf het begin van de industriële revolutie (18e eeuw, Engeland) daalde de mortaliteit. In ±150 jaar halveerde ze in Groot-Brittannië. Alle landen die industrialiseerden, volgen hetzelfde patroon.

#figure(
  image("assets/Daling-van-mortaliteit-vanaf-de-industriele-revolutie.png", width: 10cm),
  caption: [Daling-van-mortaliteit-vanaf-de-industriele-revolutie],
  label: <fig:Daling-van-mortaliteit-vanaf-de-industriele-revolutie>,
)

De drijver is *energie*: met steenkool en later olie haalden mensen veel meer energie uit hun omgeving. Hoe groot dat verschil is:
- Een mijnwerker die een heel jaar zwaar werkt, levert evenveel energie als 16 L diesel. Een auto tanken = 3 à 5 jaar mijnwerk.
- Een gezinswoning heeft ±100 mensen nodig die continu fietsen om alle toestellen, verwarming en verlichting te laten draaien.

Door die energie veranderde de manier van produceren volledig:

#table(
  columns: 3,
  align: left,
  table.header([], [*Landelijke maatschappij*], [*Industriële maatschappij*]),
  [Productie], [lokaal, op de boerderij], [geconcentreerd in fabrieken],
  [Energie], [spierkracht], [fossiele brandstoffen],
  [Opleiding], [vak geleerd van de ouders], [fabriek leidt zelf op],
  [Macht], [landeigenaars (boeren als pachters of lijfeigenen)], [kapitaal: eigenaars van de fabrieken],
  [Wonen], [op het platteland], [dicht bij de fabriek, in de stad],
)

Fabrieksarbeiders kennen het vak niet van thuis. Opgeleide arbeiders zijn productiever en hebben minder ongevallen, dus fabrieken die opleiden winnen de concurrentie. Opleiding geeft ook *extra vaardigheden*. Mensen kunnen:
+ beter nadenken en discussiëren
+ beter begrijpen waardoor ze ziek worden
+ beter een medische behandeling volgen
+ beter hun noden uitdrukken
+ beter een gezin plannen

Ook de maatschappij reorganiseerde:
- Alle arbeiders werken samen in één fabriek. Ze organiseren zich in *vakbonden* en onderhandelen met de fabriekseigenaars.
- Mensen trekken naar de stad (*urbanisatie*).
- *Religie* wordt minder belangrijk, want ze helpt je niet vooruit in een industriële maatschappij.
- De kapitaalbezitters financieren *wetenschap en technologie* om hun fabrieken efficiënter te maken. Die kennis wordt ook gebruikt voor gezondheidszorg, voeding, voedselbewaring en een betere administratie.

#figure(
  image("assets/Maatschappelijke-structuur-vanaf-industriele-revolutie.png", width: 11cm),
  caption: [Maatschappelijke-structuur-vanaf-industriele-revolutie],
  label: <fig:Maatschappelijke-structuur-vanaf-industriele-revolutie>,
)

Meer kennis en een andere organisatie van de maatschappij samen doen de mortaliteit sterk dalen.

=== Relation longevity - mortality <sec:relation-longevity-mortality>

De *mortaliteit* is het aantal mensen dat per jaar sterft per 1000 inwoners. Ze zegt ook iets over de levensverwachting: bij een hoge mortaliteit leef je waarschijnlijk niet lang.

Neem een populatie van 1000 mensen in evenwicht (de grootte verandert niet) met een mortaliteit van 30 ‰. Er sterven dan 30 mensen per jaar, en er worden er ook 30 geboren. Elk jaar heb je een kans van 30/1000, of 1 op 33, om te sterven. Gemiddeld blijf je dus 33 jaar in de populatie.

#frm(
  "Levensverwachting bij evenwicht",
  $ L = 1/m $,
  [met:
    - $L$: gemiddelde levensduur [jaar]
    - $m$: mortaliteit, als fractie per jaar [1/jaar]
  ],
)

#voorbeeld(title: "Mortaliteit 25 ‰ en 10 ‰")[
  Bij 25 ‰ is de gemiddelde levensduur $1/0.025 = 40$ jaar.

  Bij 10 ‰ is de gemiddelde levensduur $1/0.01 = 100$ jaar.
]

=== Daling van mortaliteit en de factoren erachter <sec:mortality-decline>

De mortaliteit daalde niet door één factor, maar door veranderingen in gezondheid, sanitatie, voeding en onderwijs samen.

#table(
  columns: 2,
  align: left,
  table.header([*Factor*], [*Voorbeeld*]),
  [Geneeskunde], [*Pokkenvaccin*. Lady Montagu, Brits ambassadeur in Turkije, zag dat Turken zich beschermden met korsten van pokkenpatiënten en paste het toe op haar eigen zoon. Eind 18e eeuw maakte *Jenner* een veilig vaccin met koepokken, omdat melkmeisjes met koepokken geen pokken kregen. Pokken doodden 8 à 20 % van de middeleeuwse bevolking.],
  [Sanitatie], [*John Snow* zag dat een cholera-uitbraak startte bij mensen die water haalden aan hetzelfde waterpunt. Hij sloot het af en de uitbraak stopte. Na de *Great Stink* in Londen (1860) bouwde de overheid zuiveringswerken voor de Theems.],
  [Voeding], [*Sterilisatie* van voedsel bestaat sinds 1810. Daarvoor zijn ook fabrieken nodig, bv. voor glazen bokalen. *Von Liebig* toonde dat plantengroei beperkt wordt door het nutriënt dat ontbreekt: bemesten verhoogt de opbrengst sterk.],
  [Gezondheidszorg], [Eind 19e eeuw voerde *Bismarck* in Duitsland de eerste ziektewet in. Ziekenfondsen met bijdragen van werkgevers en werknemers betaalden zieke werknemers.],
  [Onderwijs], [In Engeland ging in 1850 minder dan 20 % van de kinderen van 6 tot 12 jaar naar school, eind 19e eeuw meer dan 80 %. Wie geschoold is, werkt beter in de fabriek en volgt beter een behandeling.],
)

#figure(
  image("assets/Onderwijs-en-geboortecijfer-Engeland.png", width: 11cm),
  caption: [Schoolgaande kinderen (6–14 jaar) en geboortecijfer in Engeland, 1760–1920],
  label: <fig:Onderwijs-en-geboortecijfer-Engeland>,
)

Vanaf 1855 stijgt het aandeel schoolgaande kinderen van ±10 % naar ±80 % rond 1905 (@fig:Onderwijs-en-geboortecijfer-Engeland). Vanaf ±1880 daalt het geboortecijfer van 35 ‰ naar 20 ‰.

Telkens is de *wetenschappelijke denkwijze* of _scientific method_ nodig: waarnemen, een verband vermoeden en het testen. Enkele eeuwen eerder had men het Turkse middel als tovenarij afgedaan.

#important[Geen enkele maatregel volstond alleen: de *combinatie* van al deze veranderingen deed de mortaliteit zo sterk dalen.] Daardoor verdubbelde over iets meer dan een eeuw de levensverwachting van ±33 naar ±65 jaar (in Engeland van 33 jaar in 1725 naar 62 jaar in 1905). Het meeste van deze stijging kwam vooral door de daling van kindersterfte. In 1900 overleefden in West-Europa ±80 % van de kinderen hun vijfde verjaardag, in 2000 ±99 %.

#important[De stijging komt door de verandering in hoe de maatschappij georganiseerd is, niet doordat mensen rijker werden.] Een minimum aan middelen is nodig, want een riolering kost geld. Maar een land hoeft niet heel rijk te zijn: de levensverwachting in de VS ligt zelfs iets lager dan in Cuba.

=== Verspreiding van de mortaliteitsdaling <sec:spread-of-mortality-decline>

De *demografische transitie* begint altijd met een daling van de mortaliteit. In geen enkel land daalde de vruchtbaarheid vóór de mortaliteit.

De mortaliteitsdaling volgde de verspreiding van de industriële revolutie (@fig:Verspreiding-industriele-revolutie):

#figure(
  image("assets/Verspreiding-industriele-revolutie.png", width: 11cm),
  caption: [Verspreiding van de industriële revolutie over Europa (Encyclopædia Britannica)],
  label: <fig:Verspreiding-industriele-revolutie>,
)

#table(
  columns: 2,
  align: left,
  table.header([*Start van de daling*], [*Landen*]),
  [2e helft 18e eeuw], [Engeland, waar de industriële revolutie begon],
  [1e helft 19e eeuw], [België, Zweden, de VS en Canada; Duitsland iets later],
  [eind 19e – begin 20e eeuw], [verder naar het oosten (Rusland) en het zuiden],
  [na WO I], [het grootste deel van Azië en Latijns-Amerika],
  [na WO II], [Afrika ten zuiden van de Sahara],
)

== Geschiedenis van vruchtbaarheid <sec:history-of-fertility>

=== Timing van de vruchtbaarheidsdaling <sec:timing-fertility-decline>

De vruchtbaarheid daalt pas *decennia na* de mortaliteit. De maatschappij moet zich eerst aanpassen aan de hogere levensverwachting voor er minder kinderen geboren worden.

#table(
  columns: 2,
  align: left,
  table.header([*Start van de daling*], [*Landen*]),
  [eind 19e eeuw], [Engeland (±100 jaar na de start van de mortaliteitsdaling), snel gevolgd door de rest van West-Europa, de VS en Canada],
  [begin 20e eeuw], [Zuid-Europa (Middellandse Zee) en het oosten (Rusland)],
  [na WO II], [het grootste deel van Azië en Latijns-Amerika],
  [na 1990], [Afrika ten zuiden van de Sahara],
)

*De Franse uitzondering*: in Frankrijk daalden mortaliteit en vruchtbaarheid allebei al vanaf het einde van de 18e eeuw. Frankrijk is zo het eerste land waar het aantal geboortes daalde. Waarom dat gebeurde, is nog een wetenschappelijk debat.

Een belangrijke factor is waarschijnlijk de *Franse Revolutie* (1789). Die maakte een einde aan de feodale maatschappij en legde de nadruk op vrijheid, gelijkheid, solidariteit en ook *autonomie*. Jonge gezinnen konden zo zelf beslissen, en ze kregen snel minder kinderen. Daardoor groeide de Franse bevolking tijdens de demografische transitie veel minder dan in andere Europese landen.

=== Vruchtbaarheid en kindersterfte <sec:fertility-and-child-mortality>

Na de industriële revolutie daalt de mortaliteit meteen. De vruchtbaarheid daalt pas enkele decennia tot bijna een eeuw later. Twee vragen: waarom was de vruchtbaarheid zo hoog, en waarom daalde ze?

Vandaag leven we in een *kinderarme maatschappij*: jonge mensen willen 0, 1, 2 of soms 3 kinderen.

Vroeger, in een arme landelijke maatschappij, waren er geen pensioenen en geen gezondheidszorg. Je kinderen moesten voor je oude dag zorgen. Tegelijk haalde maar ±50 % van de kinderen hun vijfde verjaardag, en nog minder werden volwassen.

#voorbeeld(title: "Hoeveel kinderen bij 50 % kindersterfte?")[
  Je wil 2 volwassen kinderen voor je oude dag. Met 4 kinderen overleven er gemiddeld 2. Maar de kans dat er minder dan 2 overleven, is nog ±20 %.

  Om redelijk zeker 2 volwassen kinderen te hebben, heb je 6 à 7 kinderen nodig. Daarvan overleven er gemiddeld 3 à 3,5. Dat geeft *snelle bevolkingsgroei*: elk gezin dekt zijn eigen risico af, en samen laten ze de bevolking groeien.
]

#table(
  columns: 3,
  align: left,
  table.header([], [*Landelijke maatschappij*], [*Post-industriële maatschappij*]),
  [Kindersterfte], [±50 %], [< 1 %],
  [Oude dag], [je kinderen zorgen voor je], [pensioen en gezondheidszorg],
  [Rol van een kind], [een bron van steun], [een investering: school, eten, kleren, tijd],
  [Ouders], [voltijds kinderen opvoeden], [eigen carrière],
  [Kinderen per vrouw], [6 à 7], [0 à 2, soms 3],
)

Er is dus geen sterke reden meer voor veel kinderen. In veel landen, vooral in Zuidoost-Azië, ligt het aantal kinderen per vrouw nu onder 2, in Zuid-Korea zelfs onder 1. Dat is onder het vervangingsniveau (_replacement rate_), dus de bevolking van bv. Japan en Zuid-Korea gaat dalen.

== Toekomst Prospects <sec:toekomst-prospects>

=== Factoren achter de vruchtbaarheidsdaling <sec:fertility-decline-factors>

==== Kindersterfte verlagen

De belangrijkste factor is *kindersterfte verlagen*. Dat is tegenintuïtief: wie de bevolkingsgroei wil afremmen, moet ervoor zorgen dat meer kinderen overleven.

De wereld gaat hier snel vooruit (@fig:Kindersterfte-1961 en @fig:Kindersterfte-2020). Kindersterfte ligt bijna overal onder 15 %, in de meeste landen ver onder 10 %. Alleen in Afrika ten zuiden van de Sahara is ze nog hoger.

#grid(
  columns: 2,
  gutter: 1em,
  [#figure(
    image("assets/Kindersterfte-1961.png", width: 100%),
    caption: [Kindersterfte in 1961],
  ) <fig:Kindersterfte-1961>],
  [#figure(
    image("assets/Kindersterfte-2020.png", width: 100%),
    caption: [Kindersterfte in 2020],
  ) <fig:Kindersterfte-2020>],
)

De meeste kinderen sterven aan *infectieziektes*, die vaak te voorkomen zijn (@fig:Doodsoorzaken-kinderen). Goed gevoede kinderen zijn ook beter bestand tegen die ziektes. Met zulke eenvoudige middelen kan kindersterfte overal onder 2 % zakken, en we zijn op weg. Zo hangt vruchtbaarheid ook samen met *voedsel*: betere voeding → minder kindersterfte → minder kinderen.

#figure(
  image("assets/Doodsoorzaken-kinderen.png", width: 13cm),
  caption: [Doodsoorzaken van kinderen onder 5 jaar, 1990 en 2017 (Our World in Data)],
  label: <fig:Doodsoorzaken-kinderen>,
)

==== Rijkdom, huwelijksleeftijd en onderwijs

Het aantal kinderen per vrouw hangt samen met drie andere factoren (@fig:Vruchtbaarheid-vs-inkomen, @fig:Vruchtbaarheid-vs-huwelijksleeftijd, @fig:Vruchtbaarheid-vs-schooljaren):
- *Rijkdom*: rijkere landen hebben minder kinderen.
- *Huwelijksleeftijd*: vrouwen die later trouwen, krijgen minder kinderen.
- *Onderwijs van vrouwen*: het sterkste en belangrijkste verband.

#grid(
  columns: 3,
  gutter: 0.6em,
  [#figure(
    image("assets/Vruchtbaarheid-vs-inkomen.png", width: 100%),
    caption: [Kinderen per vrouw tegenover inkomen],
  ) <fig:Vruchtbaarheid-vs-inkomen>],
  [#figure(
    image("assets/Vruchtbaarheid-vs-huwelijksleeftijd.png", width: 100%),
    caption: [Kinderen per vrouw tegenover huwelijksleeftijd],
  ) <fig:Vruchtbaarheid-vs-huwelijksleeftijd>],
  [#figure(
    image("assets/Vruchtbaarheid-vs-schooljaren.png", width: 100%),
    caption: [Kinderen per vrouw tegenover schooljaren (vrouwen 25–34 jaar)],
  ) <fig:Vruchtbaarheid-vs-schooljaren>],
)

Waarom onderwijs van vrouwen het aantal kinderen verlaagt:
+ Opgeleide vrouwen gebruiken *contraceptie* correcter.
+ Tijdens de studie krijgt bijna niemand kinderen.
+ Na de studie willen ze een job of carrière, en dan blijft er minder tijd voor kinderen.
+ Ze willen dat hun kinderen minstens dezelfde kansen krijgen. Ze investeren dus veel tijd en geld per kind: huiswerk, schoolgeld, en kinderen die later gaan werken.

Kwaliteitsvol onderwijs voor vrouwen, gevolgd door toegang tot de arbeidsmarkt, verlaagt het aantal kinderen het snelst.

==== Contraceptie

Het bewijs voor contraceptie is gemengd. In België daalde de vruchtbaarheid al tot ±2 kinderen per vrouw in 1938 (@fig:Vruchtbaarheid-Belgie), terwijl er toen nergens ter wereld moderne contraceptie bestond. Na WO II steeg ze tijdens de babyboom weer tot iets boven 3.

#figure(
  image("assets/Vruchtbaarheid-Belgie.png", width: 11cm),
  caption: [Kinderen per vrouw in België, 1811–2022 (Gapminder)],
  label: <fig:Vruchtbaarheid-Belgie>,
)

Toch helpt contraceptie wel in ontwikkelingslanden. Vrouwen met veel kinderen zeggen vaak dat ze er minder hadden gewild: wie 6 kinderen heeft, zegt bv. dat 4 genoeg was geweest.

#concept(title: "Ongewenste vruchtbaarheid (unwanted fertility)")[
  Het verschil tussen het werkelijke aantal kinderen en het gewenste aantal. Vaak is dat 1 à 2 kinderen per vrouw (@fig:Gewenste-ongewenste-vruchtbaarheid).
]

#figure(
  image("assets/Gewenste-ongewenste-vruchtbaarheid.png", width: 11cm),
  caption: [Gewenste en ongewenste geboortes per vrouw in Latijns-Amerika],
  label: <fig:Gewenste-ongewenste-vruchtbaarheid>,
)

Met beschikbare contraceptie en de juiste informatie daalt de ongewenste vruchtbaarheid heel snel. Overheden kunnen zo de vruchtbaarheid sneller doen dalen.

==== Waarom het tijd kost

Een vruchtbaarheidsdaling kun je stimuleren, maar niet afdwingen. Ze duurt altijd decennia: sneller dan in de 19e eeuw, maar nog steeds traag.

- *Mortaliteit* daalt snel: iedereen wil zo lang mogelijk leven, dus betere geneeskunde of voeding wordt meteen aanvaard. Daar is geen religieuze of culturele weerstand tegen.
- *Vruchtbaarheid* hangt niet af van technologie, maar van *sociale en culturele normen*. In een maatschappij met veel kinderen is het vreemd om er maar 1 of 2 te hebben, en soms duwen mannen op meer kinderen. Die normen veranderen traag.

#important[Om de vruchtbaarheid in het globale Zuiden te verlagen:]
+ Kindersterfte verlagen.
+ Vrouwen onderwijs en opleiding geven.
+ Aanvaarden dat het tijd kost. Dat het Westen vindt dat mensen minder kinderen moeten krijgen, overtuigt hen niet.

=== Snelheid van de vruchtbaarheidsdaling <sec:speed-of-fertility-decline>

De vruchtbaarheid daalt traag, omdat ze een sociaal-cultureel proces is. Kindersterfte hangt meer af van beschikbare kennis en technologie (gezonde voeding, geneeskunde, ...). De snelheid verschilt per regio.

#figure(
  image("assets/Duur-vruchtbaarheidsdaling-6-naar-3.png", width: 11cm),
  caption: [Tijd nodig om van meer dan 6 naar minder dan 3 kinderen per vrouw te gaan (Our World in Data)],
  label: <fig:Duur-vruchtbaarheidsdaling-6-naar-3>,
)

In het Verenigd Koninkrijk duurde de daling van meer dan 6 naar minder dan 3 kinderen per vrouw 95 jaar, in Iran maar 10 jaar (@fig:Duur-vruchtbaarheidsdaling-6-naar-3).

#figure(
  image("assets/Demografische-transitie-ontwikkeld-vs-ontwikkelend.png", width: 14cm),
  caption: [Sterftecijfer (stippellijn) en geboortecijfer (volle lijn) in ontwikkelde en ontwikkelingslanden; de gearceerde zone is de bevolkingsgroei],
  label: <fig:Demografische-transitie-ontwikkeld-vs-ontwikkelend>,
)

#table(
  columns: 3,
  align: left,
  table.header([], [*Ontwikkelde landen*], [*Ontwikkelingslanden*]),
  [Geboorte- en sterftecijfer vóór de transitie], [al iets lager], [heel hoog],
  [Daling van de mortaliteit], [traag: kennis en technologie moesten nog ontwikkeld worden], [snel: de kennis bestond al],
  [Daling van de vruchtbaarheid], [traag], [traag (sociaal-cultureel)],
  [Bevolkingsgroei (@fig:Demografische-transitie-ontwikkeld-vs-ontwikkelend)], [relatief klein], [veel groter],
)

@fig:Geboortecijfer-Ecuador-Thailand-Belgie toont hetzelfde met echte data: het geboortecijfer van België daalt al vanaf de 19e eeuw, dat van Thailand en Ecuador pas na WO II, maar veel steiler.

#figure(
  image("assets/Geboortecijfer-Ecuador-Thailand-Belgie.png", width: 11cm),
  caption: [Geboortecijfer (per 1000 inwoners) in Ecuador, Thailand en België, 1800–2015 (Gapminder)],
  label: <fig:Geboortecijfer-Ecuador-Thailand-Belgie>,
)

=== Veroudering/vergrijzing van de bevolking <sec:aging-population>

Tijdens de demografische transitie daalt eerst de mortaliteit en dan de vruchtbaarheid. Daardoor volgen er twee fasen:

#table(
  columns: 3,
  align: left,
  table.header([], [*Jonge fase*], [*Oude fase*]),
  [Bevolking], [veel jonge volwassenen, weinig ouderen], [veel ouderen, weinig kinderen (na 1 à 1,5 eeuw)],
  [Economische groei], [groeispurt van 7 à 10 % per jaar, decennialang], [1 à 3 % per jaar, soms geen groei],
  [Voorbeeld], [het Westen na WO II, China 2005–2020], [Europa en Noord-Amerika vandaag],
  [Wat nodig is], [goed economisch beleid en onderwijs voor de jongeren], [geld voor zorg aan ouderen, blijven investeren in onderwijs],
)

In de jonge fase kunnen veel mensen produceren, terwijl ze voor weinig ouderen moeten zorgen. Een land kan zo rijk worden, maar dat gebeurt niet vanzelf: de overheid moet de juiste voorwaarden scheppen.

#grid(
  columns: 2,
  gutter: 1em,
  [#figure(
    image("assets/Bevolkingspiramide-wereld-1950.png", width: 100%),
    caption: [Wereldbevolking per leeftijd en geslacht, 1950],
  ) <fig:Bevolkingspiramide-wereld-1950>],
  [#figure(
    image("assets/Bevolkingspiramide-Europa-NA-2070.png", width: 100%),
    caption: [Europa en Noord-Amerika per leeftijd en geslacht, 2070 (prognose)],
  ) <fig:Bevolkingspiramide-Europa-NA-2070>],
)

In de oude fase zijn veel mensen niet meer productief en hebben ze zorg nodig (@fig:Bevolkingspiramide-Europa-NA-2070). Hoe sneller het aandeel 60-plussers groeit, hoe trager het BBP per inwoner groeit (@fig:Vergrijzing-en-BBP-groei).

#figure(
  image("assets/Vergrijzing-en-BBP-groei.png", width: 10cm),
  caption: [Verband tussen de groei van het aandeel 60-plussers en de groei van het BBP per inwoner],
  label: <fig:Vergrijzing-en-BBP-groei>,
)

Dat valt mee: 1 à 3 % groei komt bovenop een grote welvaart die er al is, dus deze landen worden nog rijker. Ze moeten wel blijven investeren in het onderwijs van de jongeren, want die moeten het land later draaiende houden.

== Links met andere global challenges <sec:demografie-links>

#figure(
  image("assets/Demografie-Links.png", width: 9cm),
  caption: [De verbanden tussen demografie en de andere uitdagingen in het gelaagde model],
  label: <fig:Demografie-Links>,
)

/ Klimaat en biodiversiteit: Bevolkingsgroei verhoogt de vraag naar grondstoffen, voedsel, ruimte en energie. Dat verhoogt de druk op klimaat, biodiversiteit en de andere planetaire grenzen.

/ Migratie: Naast de vruchtbaarheid bepalen ook mensen die een land in- en uittrekken de bevolkingsgroei.

/ Voedselzekerheid: Voedselzekerheid is nodig om kindersterfte te verlagen, en dus ook de vruchtbaarheid en de bevolkingsgroei. Tegelijk moet een groeiende wereldbevolking (duurzaam) gevoed worden, zonder meer landbouwgrond.

/ Ongelijkheid: Sociale en economische ongelijkheid beïnvloeden sterk het aantal kinderen per vrouw en de toegang tot (basis)gezondheidszorg.

/ Energie: De industriële revolutie en de beschikbaarheid van energie hadden een grote invloed op de bevolkingsdynamiek.

/ Global governance: Global governance kan de ontwikkeling van samenlevingen sterk beïnvloeden.
