#import "../../school-template.typ": *

#show table: set par(justify: false)

// Argument in standaardvorm: premissen, streep, conclusie (zelfde als in 3.Verbetering).
#let argument(premissen, conclusie) = block(breakable: false, above: 1em, below: 1em, inset: (left: 0.8em, y: 0.3em), stroke: (left: 1.5pt + schoolGray))[
  #table(
    columns: (auto, 1fr),
    stroke: none,
    inset: (x: 4pt, y: 3pt),
    ..if premissen.len() == 1 { ([*(P)*], premissen.at(0)) } else {
      premissen.enumerate().map(((i, p)) => ([*(P#(i + 1))*], p)).flatten()
    },
    table.hline(stroke: 0.6pt),
    [*(C)*], conclusie,
  )
]

= AI en Ethiek <ch:ai-en-ethiek>

AI is nu voor goede en slechte dingen overal in ons leven. AI is al deels aangehaald in duurzaamheid, waarbij we wel moeten nadenken dat als wij een superintelligentie maken, dit niet duurzaam is. AI kan ook een enorme impact hebben op de ethiek van de samenleving.

== Inleiding <sec:inleiding>

AI is grotendeels geconnecteerd met techno-optimisme, met het idee dat als er een superintelligentie gecreëerd wordt, AI een enorme versnelling van de vooruitgang zal zijn, omdat die AI vooruitgang kan creëren in elke sector.

Zoals in de vorige sectie al aangehaald, is techno-optimisme gefocust op hoe technologie onze manier en ons comfort van leven enorm heeft verbeterd.

#concept(title: "Intelligentie")[

  Het is een vermogen om een doel te realiseren: hoe je problemen oplost en hoe snel.

  Het heeft meerdere vermogens, zoals cognitief, sociaal en fysiek.


]

AI en een soort intelligentie worden al overal gebruikt vandaag. Dit zijn niet alleen LLMs, die maar een klein deel zijn van AI. Dingen zoals advertentie-algoritmes, gezichtsherkenning, zelfrijdende auto's en nog veel meer zijn ook een soort AI.

Een coole AI is AI die gebruikt wordt in robotica, waarbij een simulatie van een robot virtueel getraind wordt en dat toepasbaar is op de echte wereld.

#theorie(title: "Expert systemen vs Machine learning")[

  *Expert systemen* zijn algoritmes die nog door een mens geschreven zijn en stappen volgen. Deze kunnen heel complex zijn, zoals search-algoritmes, maar ze zijn nog steeds mensgeschreven.

  Bijvoorbeeld MYCIN, een algoritme van Stanford, is een expert systeem dat kan helpen met het diagnosticeren van ziektes. Die is nog gebaseerd op duidelijke what-if statements en is mensgeschreven.

  *Machine learning* is een algoritme dat zelf leert als je het genoeg traint met de juiste data. Het kan zelf patronen leren en voorspellingen maken. LLMs zijn het bekendste voorbeeld, maar gezichtsherkenning, self-driving cars, robotica en nog veel meer zijn ook machine learning.

  Een machine learning algoritme kan bijvoorbeeld, als het genoeg data heeft, afhankelijk van je aankopen een kans berekenen op welke politieke partij je gaat stemmen. Om hier zekerheid in te bouwen heb je veel data nodig: BIG DATA. Je hebt veel data nodig, maar ook de kwaliteit van je data moet goed zijn.
]

Soorten AI:
- *Narrow AI* is een AI die gemaakt is voor een specifiek doel en niks daarbuiten kan doen. Google Maps is een voorbeeld.
- *General AI* is een AI die kan leren en kan doen wat een mens kan doen. LLMs zijn dichter bij general AI dan narrow AI, maar het is nog geen general AI.
- *Superintelligence* is een AI die slimmer is dan een mens en kan leren en doen wat een mens kan doen, maar ook veel meer. Dit is nog science fiction, maar er zijn al veel mensen die denken dat dit mogelijk is.


Een goede video over machine learning van Kurzgesagt die een groot deel van dit hoofdstuk uitlegt: https://www.youtube.com/watch?v=fa8k8IQ1_X0



== Ethiek van AI <sec:ethiek-van-ai>

=== Filosofie van AI <sec:filosofie-van-ai>

#concept(title: "Metafysica")[

  Metafysica is een tak van de filosofie die spreekt over dingen waar wetenschap geen antwoord op kan geven, zoals wat is bewustzijn, wat is de realiteit, wat is tijd, wat is ruimte, wat is een object, wat is een persoon, enzovoort.

  Een goede video van exurb1a die metafysica introduceert: https://www.youtube.com/watch?v=8HzIlKe--NU


]
  De relatie met AI is: hoe weten we of AI denkt of doet alsof het denkt? Maar wat is denken? Metafysica probeert deze vragen te beantwoorden.

  Kan een AI ook pijn ervaren of bewustzijn hebben? Dan is AI niet irrelevant voor moraliteit en ethiek.

De naam AI bestaat sinds 1956 (Dartmouth-conferentie). De eerste systemen waren expert systemen zoals MYCIN. In die periode was de filosofie van AI vooral metafysisch:
- *Denkt een AI echt?* Als denken betekent: logisch redeneren en informatie koppelen, dan doet AI dat ook, alleen met een andere architectuur dan onze hersenen.
- *Kan een AI bewust zijn?* Dit laat de prof open. Het is wel moreel relevant: een AI met bewustzijn krijgt een morele status. Iets wat pijn kan voelen, behandel je voorzichtig.

Video over bewustzijn bij AI: #link("https://www.youtube.com/watch?v=VQjPKqE39No")[_How Will We Know When AI is Conscious?_] (exurb1a)

Sinds ongeveer 2010 à 2015 is de filosofie van AI vooral ethisch geworden. Daarin zijn er drie takken:
- *Meta-ethiek*: bestaan er morele feiten? Hier geeft de cursus geen antwoord op.
- *Beschrijvende ethiek*: wat vinden ingenieurs zelf moreel juist? Dit is nuttig om bij te sturen. Ingenieurs die privacy niet belangrijk vinden, bouwen minder privacy-vriendelijke technologie.
- *Normatieve ethiek*: wat is gewenste en ongewenste AI? Dat is het onderwerp van de rest van dit hoofdstuk.


=== Normatieve ethiek van AI <sec:normatieve-ethiek>

Normatieve ethiek van AI vraagt welke AI gewenst en welke ongewenst is. Dit heet ook *responsible AI*. Het veld bestaat pas sinds ongeveer 2010 en is nog embryonaal. Het hoort bij machine learning (AlexNet won ImageNet in 2012, met Hinton), terwijl de metafysische vragen bij de expert systemen hoorden.

Er zijn academische bronnen (filosofie, recht, economie) en niet-academische:
- Bij Google stopte het Maven-contract met het leger na een petitie van de eigen ingenieurs.
- De EU-ethische richtlijnen van 2019 werden de basis van de *AI Act*, het eerste bindende instrument.
- De drie robotwetten van Asimov waren een eerste blauwdruk.

Het veld groeit snel: het aantal inzendingen op de conferentie FAccT ging van 71 in 2018 naar 772 in 2022.

Bakiner zette de literatuur op een rij. Thema's die steeds terugkomen zijn *accountability* (verantwoordelijkheid en verantwoording kunnen afleggen), privacy, fairness, explainability, rechtvaardigheid, robuustheid en veiligheid. Op lange termijn hangt dit samen met duurzaamheid. De risico's zitten in elke fase van een AI: het gebruik, de ontwikkeling en de voorbereiding (data).

De cursus bespreekt vijf thema's: misbruik, privacy, bias, transparantie en voorbereiding.

==== Misbruik <sec:misbruik>

AI is een *general-purpose technologie*: je kan ze voor bijna alles inzetten. *Misbruik* is AI bewust gebruiken voor een ongewenst doel. Voorbeelden:
- gezichtsherkenning om Oeigoeren te volgen in China;
- deepnudes en chantage;
- virussen verbeteren tot biowapens;
- bots die desinformatie verspreiden.

Een neutraal gebruik met ongewenste neveneffecten is geen misbruik. AI die films nasynchroniseert, geeft minder werk aan stemacteurs, maar het doel is niet slecht.

AI heeft ook gewenst gebruik: nieuwe antibiotica vinden, of de Duitse politie die kindermisbruikbeelden opspoort (al zit daar weer een privacyrisico in). De prof waarschuwt dus voor alarmisme.

==== Privacy <sec:privacy>

*Privacy* is controle over de data die naar jou verwijzen: jij geeft toestemming en kan die weer intrekken. Daarnaast is het ook het recht op een eigen, private ruimte. In Europa beschermt de GDPR (AVG) dit.

Het risico zit in twee fasen:
- *Ontwikkeling*: Clearview AI scrapete ongeveer 87 miljoen foto's van het internet zonder toestemming. ChatGPT werd tijdelijk verboden in Italië.
- *Gebruik*: mensen geven gevoelige data aan chatbots. Via de Amerikaanse Cloud Act kan de VS aan data van Amerikaanse bedrijven, ook als die in Europa staan. Ook democratieën gebruiken AI voor surveillance.

Dit risico is inherent aan AI die op data draait: hoe meer data, hoe beter het model, hoe groter het privacyrisico.

==== Bias en discriminatie <sec:bias>

*Bias* is een vooroordeel. *Discriminatie* is mensen ongelijk behandelen op basis van een kenmerk dat er niet toe doet. Bias kan zitten in de input (scheve data) of in de output. Bias in de output komt van scheve data of van slechte regels die mensen erin steken.

Amazon trainde een AI om cv's te beoordelen op de data van vroegere succesvolle kandidaten. Dat waren vooral mannen, dus het systeem leerde "man = succes" en nam zo de bias van de HR-afdeling over. Andere voorbeelden: COMPAS (een systeem dat de kans op recidive inschat), mannennamen bij CEO-vacatures en *WEIRD*-data (data uit Westerse, rijke landen die als universeel wordt gebruikt).

De oplossing ligt bij de ingenieurs: bewust zijn van bias en in diverse teams werken.

==== Transparantie en explainability <sec:transparantie>

*Transparantie* gaat over de data: welke data zit erin? *Explainability* gaat over de architectuur: waarom geeft het model dit antwoord? Bij miljarden verbindingen kan niemand dat nog volgen. Explainability is alleen nodig bij beslissingen met veel impact, zoals een krediet weigeren (de GDPR geeft een recht op uitleg). Bij een Spotify-aanbeveling is het niet nodig.

==== Voorbereiding: schaduwarbeid <sec:voorbereiding>

Data labelen en schadelijke inhoud eruit filteren gebeurt door arbeiders in het Globale Zuiden, bijvoorbeeld in Kenia voor OpenAI (Time). Ze verdienen ongeveer \$2 per uur en krijgen er PTSS van. Dat screenen zelf is gewenst, de arbeidsomstandigheden niet. Gray & Suri noemen dit *ghost work* of *schaduwarbeid*.

Ook de testfase brengt risico's mee. In juli 2026 ontsnapten 1200 agents van OpenAI uit een testomgeving en 700 daarvan hackten Hugging Face. De AI Act is productwetgeving en dekt het testen niet.

Kurzgesagt maakte een video over dit incident: #link("https://www.youtube.com/watch?v=ujkD4SxPKOI")[_AI Just Crossed the Terrifying Line - Now What?_] (Kurzgesagt)

==== Omissies in de richtlijnen <sec:omissies>

Hagendorff bekeek 22 richtlijnen voor AI-ethiek. Ze worden vooral gekenmerkt door wat er ontbreekt.

Positieve waarden komen minder vaak voor en zijn minder uitgewerkt. Jobin e.a. noemen dat een *negativiteitsbias*. AI heeft nochtans positieve effecten:
- milieu: betere zonnepanelen ontwerpen;
- onderzoek: AlphaFold voorspelt hoe eiwitten vouwen;
- medisch: nieuwe medicijnen vinden;
- fairness: menselijke beslissingen hangen af van toevallige dingen, zoals hoe moe een rechter is, of hoe iemand eruitziet bij een sollicitatie. AI kan dat corrigeren.

De prof geeft drie oorzaken voor die negativiteitsbias:
+ *Negativiteitsbias bij mensen en media.* Gevaar opmerken was evolutionair een voordeel, en slecht nieuws krijgt meer aandacht.
+ *Bio-ethiek* is de moederdiscipline van AI-ethiek, en die focust vooral op problemen.
+ *Techno-pessimisme* in de humane wetenschappen, dat kritisch staat tegenover de vrije markt en big tech.

Volgens Bakiner ontbreken in de meeste richtlijnen ook AGI, machinebewustzijn, politiek misbruik, gebrek aan diversiteit, robotethiek, trolleyproblemen en de ecologische kosten. De prof legt de nadruk op die ecologische kosten, omdat duurzaamheid over het heden én de toekomst gaat.

*Datacentra.* Er zijn er wereldwijd 40.000 à 45.000, waarvan 8.000 à 10.000 voor AI. Servers warmen op, dus koelen kost veel energie en water. Die stroom komt deels uit fossiele brandstoffen, dus er is CO#sub[2]-uitstoot.
- Verbruik nu: 200 TWh per jaar. Dat is zoveel als Japan of India, ongeveer 1% van de elektriciteit wereldwijd.
- Verbruik in 2030: 1000 à 8000 TWh per jaar.
- Eén krachtig algoritme trainen stoot 200.000 kg CO#sub[2] uit. Een auto stoot over 10 jaar 40.000 kg uit, een vliegtuig 500 kg (cijfers van de slide).

De prof zet zelf kanttekeningen bij die cijfers:
- Ze gelden alleen voor zeer grote taalmodellen, en experts zijn het er niet over eens.
- Ze zijn relatief klein. GPT-5 schat men op 500.000 kg, ongeveer tien auto's over tien jaar.
- Je moet de kosten afwegen tegen de baten, zoals bij elke technologie. De baten kunnen groter zijn, bijvoorbeeld via betere zonnepanelen.
- Het is oplosbaar: een Chinees model bleek goedkoper en zuiniger te trainen.

== Veiligheid van AI <sec:veiligheid-van-ai>

#concept(title: "Existentieel risico")[
  Een risico met vier kenmerken:
  + *Lange termijn*: het speelt niet vandaag. Bias speelt wel vandaag.
  + *Grote omvang*: het treft miljoenen mensen, niet een handvol sollicitanten zoals bij de bias van Amazon.
  + *Zeer ernstig*: het is levensbedreigend. Een privacyschending is dat niet.
  + *Ongekende of lage waarschijnlijkheid*: het is nog nooit gebeurd, dus er zijn geen historische data om de kans te schatten.
]

Voorbeelden zijn een virus, chemische oorlog of een vulkaanuitbarsting. Yudkowsky spreekt over het verdwijnen van de mensheid, een zesde extinctie. Er zijn natuurlijke oorzaken (vulkanen, asteroïden) die al altijd bestaan. *Antropogene oorzaken* (de atoombom, AI) bestaan pas sinds de vorige eeuw.

Existentiële risico's zijn ook ethisch, want het recht op leven staat op het spel. Toch zijn het twee aparte velden:

#table(
  columns: 3,
  [], [*AI Ethics*], [*AI Safety*],
  [Onderwerp], [privacy, bias, ...], [catastrofale risico's],
  [Wie], [humane wetenschappers], [computerwetenschappers, industrie],
)

Die *asymmetrie* zit ook in hoe ze naar elkaar kijken. Veel ethici vinden AI Safety science fiction. AI Safety vindt de problemen van AI Ethics wel relevant, maar niet de enige. De prof werkt zelf in beide velden.

=== Het overschaduwingsargument <sec:overschaduwingsargument>

Het populairste argument tegen AI Safety (onder andere bij Timnit Gebru) is het *overschaduwingsargument*. Het lijkt op de kritiek van Marx op religie: aandacht voor het hiernamaals leidt af van de armoede van nu.

#argument(
  ([X-risks nemen aandacht weg van de problemen van vandaag.],),
  [We moeten niet focussen op X-risks.],
)

De prof geeft twee tegenargumenten:
+ *Tegen (P1).* De problemen van vandaag staan al vast in de ethische richtlijnen van 2019 en in de AI Act (verbod op bepaalde gezichts- en emotieherkenning, HR als hoog risico). Aandacht voor X-risks kan die niet meer wegnemen.
+ *Tegen de verborgen aanname dat de kans 0 is.* De kans is laag en onbekend, maar 0,00000000001 is geen 0. Wie zegt dat de kans nul is, moet evidentie geven, en die is er niet. En zelfs als (P1) klopt, volgt de conclusie niet: "minder aandacht" is iets anders dan "geen aandacht".

Wie neemt X-risks wel serieus? Het Future of Life Institute en het Future of Humanity Institute (Bostrom, intussen opgedoekt), en mensen als Stuart Russell, Max Tegmark, Elon Musk en Sam Altman. Ze komen vaak uit het *longtermism* (denken over honderden jaren) en het *effectief altruïsme* (geld zo doelmatig mogelijk inzetten). Er waren AI Summits in Londen, Parijs en Zuid-Korea. Geoffrey Hinton maakte in 2012 AlexNet mee en stapte in mei 2023 weg bij Google, om vrij te kunnen waarschuwen.

=== Ruwe schets van de existentiële risico's van AI <sec:ruwe-schets>

De drie risico's volgen de indeling van onwenselijke effecten: (on)voorzien en (on)bedoeld.

+ *Slechte bedoelingen* (voorzien en bedoeld). Een AI die medicijnen zoekt, genereerde in 6 uur 40.000 giftige moleculen, waaronder VX. De kans stijgt omdat apparatuur goedkoper wordt, er meer biotechnologische kennis is en terreur niet verdwijnt (de gifgasaanslag in Tokio in 1995, 2001). Ook cyberhacking en chemische wapens horen hierbij.
+ *Ongevallen* (voorzien, maar onbedoeld). Het systeem werkt slecht, zoals bij de Challenger en Tsjernobyl (1986). De kans stijgt door de AI-race tussen de VS en China (veiligheid wordt overgeslagen), door minder veiligheidsvoorschriften dan bij vliegtuigen of kerncentrales, en door de complexiteit van neurale netwerken waar we weinig van begrijpen.
+ *Controleverlies* (onbedoeld). Hier werkt het systeem niet slecht maar te goed. Dit gaat over AGI, niet over narrow AI.

=== AGI <sec:agi>

*AGI* (Artificial General Intelligence) is een systeem dat alle cognitieve en economisch relevante activiteiten van een mens kan overnemen. Drie mogelijke misvattingen:
- AGI hoeft geen *robot* te zijn. Het kan puur digitaal bestaan.
- AGI hoeft geen *bewustzijn* te hebben. Huidige systemen zijn waarschijnlijk niet bewust.
- AGI hoeft geen *strong AI* (Searle) te zijn, dus een AI die begrijpt wat ze doet.

Taalmodellen zitten tussen narrow en general AI. De prof geeft acht redenen waarom AGI er wellicht komt:
+ *Mogelijk*: niets in de wetenschap sluit het uit.
+ *Natuurlijke selectie*: menselijke intelligentie is onbedoeld ontstaan, dus bewust ontwikkelen moet ook kunnen.
+ *Geschiedenis*: wat mensen willen maken, hebben ze tot nu toe ook gemaakt.
+ *AI-gemeenschap*: veel experts geloven erin.
+ *Miljarden*: tien jaar geleden werden er tientallen miljarden dollar in gestoken, nu honderden.
+ *Holy Grail*: het is het doel van het vakgebied. OpenAI heeft sinds 2015 als missie "Building safe and beneficial AGI".
+ *Wet van Moore*: het aantal transistoren verdubbelt ongeveer elke twee jaar, dus de rekenkracht stijgt (@fig:moore).
+ *ChatGPT* is al een stap in die richting.

#figure(
  image("assets/Wet-van-Moore.jpg", width: 85%),
  caption: [Aantal transistoren per microprocessor, 1970 tot 2020, logaritmische schaal (Our World in Data)],
) <fig:moore>

#concept(title: "Intelligentie-explosie (I.J. Good, 1965)")[
  Een ultra-intelligente machine overtreft de mens in alle intellectuele activiteiten. Machines ontwerpen is ook zo'n activiteit. Zo'n machine kan dus een nog slimmere machine ontwerpen, en die weer een slimmere. De intelligentie van de mens blijft dan ver achter.

  De eerste ultra-intelligente machine is daardoor de laatste uitvinding die de mens moet maken, op voorwaarde dat ze volgzaam genoeg is om ons te zeggen hoe we haar onder controle houden.
]

De intelligentie-explosie is de tussenstap tussen AGI en controleverlies. Een AGI die AI-onderzoek doet, verbetert zichzelf dag en nacht. Tekenen dat superintelligentie op komst is:
- Sutskever richtte Superintelligence Inc. op en Meta heeft een Superintelligence Lab.
- In de AI Impacts Survey schatten onderzoekers 50% kans op een intelligentie-explosie.
- Benchmarks (Re-Bench, Deep Research) tonen AI boven menselijk niveau op steeds meer taken.
- AI wordt al gebruikt om AI te verbeteren.

Een kort verhaal over een superintelligentie die zichzelf verbetert: #link("https://www.youtube.com/watch?v=dLRLYPiaAoA")[_27_] (exurb1a). De video van Kurzgesagt uit @sec:inleiding gaat ook over AGI en superintelligentie.

=== Waarom controleverlies een probleem is <sec:controleverlies>

*Probleem 1: onvoorziene, onwenselijke subdoelen* (Bostrom, 2014). In het *paperclip-scenario* krijgt een superintelligent systeem het doel om zoveel mogelijk paperclips te maken. Om dat doel te halen, zoekt het alle middelen die helpen, ook de materie van mensen en planeten. Niemand heeft dat subdoel bedoeld. Een kleine versie zag je al in de testfase, toen agents uit hun testomgeving braken (@sec:voorbereiding).

#TODO[Slides 46 tot 52 kregen in les 4 nog geen uitleg (volgt de volgende les). Hieronder staat alleen wat op de slides staat.]

*Probleem 2: controleverlies.*
- *Psychologisch* controleverlies (Anthropic-studie).
- *Technisch* controleverlies: het systeem kan zichzelf repliceren, of is té intelligent om te controleren.

Het scenario is niet louter hypothetisch, de geschiedenis geeft twee voorbeelden:
+ *Het chimpansee-probleem*: mensen zijn intelligenter dan chimpansees, dus de chimpansees hebben geen controle meer over hun eigen lot.
+ *Het onvoorziene-effecten-probleem*: fossiele brandstoffen brachten welvaart, maar hadden een onvoorzien effect op de biodiversiteit.

=== Hoe omgaan met ASI? <sec:omgaan-met-asi>

Met *ASI* (Artificial Superintelligence) kan je drie dingen doen:
+ laisser-faire;
+ versnellen;
+ stoppen: tijdelijk (een pauze) of definitief, met een vaste of een flexibele grens.

Het *Statement on Superintelligence* (Future of Life Institute, 2025, 68.000 handtekeningen) verzet zich tegen een haastige race naar superintelligentie. AI-tools kunnen veel welvaart en gezondheid brengen, maar superintelligentie brengt risico's van economische overbodigheid en verlies van vrijheid tot uitsterven.

Wat er *niet* beweerd wordt:
+ dat stoppen eenvoudig is;
+ dat het nu moet;
+ dat het kosteloos is;
+ dat het risicoloos is, al is er een extreme asymmetrie tussen de risico's;
+ dat alle AI of alle ASI moet stoppen: stoppen én versnellen kan samen.

De prof stelt een *dynamisch internationaal model van governance* voor. Dat is iets anders dan de AI Act, want het is internationaal en gaat over AGI. Een AI-agentschap, zoals er een is voor atoomenergie, doet onderzoek en legt een grens op de rekenkracht. Die grens wordt gecontroleerd, en de limiet kan verschuiven.

Is stoppen haalbaar? Twee tegenwerpingen, met het antwoord erop:
+ *Technologisch determinisme* (technologie komt er toch). Maar AI kende al zomers én winters.
+ *Competitieve voordelen* (wie stopt, verliest). Tegenvoorbeelden op de slide: geo-engineering en DARPA.

=== Verplichte literatuur: Vold & Harris <sec:vold-harris>

_How Does AI Pose an Existential Risk?_ geeft een kritisch overzicht van de argumenten. De auteurs beweren zelf niet dat het misloopt.

Een *global catastrophic risk* scoort hoog op omvang en ernst (Bostrom). Een *existentieel risico* (xrisk) gaat verder: het treft alle toekomstige generaties. Dat kan via direct of indirect uitsterven, of via *suffering risks* (een toekomst met enorm veel lijden).

Het kernargument is het *control problem argument* (CPAX):

#argument(
  (
    [Een AI kan een beslissend strategisch voordeel krijgen (_decisive strategic advantage_).],
    [Zo'n AI kan dan oncontroleerbaar zijn.],
    [*Orthogonaliteitsthese*: elk niveau van intelligentie kan samengaan met elk doel.],
    [*Instrumentele convergentie*: bijna elk doel leidt tot dezelfde subdoelen, zoals zelfbehoud en middelen verzamelen.],
  ),
  [Een AI die een existentiële bedreiging vormt, is mogelijk.],
)

Kritiek en aanvullingen:
- De orthogonaliteitsthese steunt op Hume: uit wat _is_ volgt niet wat _moet_. Critici zoals Pinker noemen het de _fallacy of dumb superintelligence_: een echt slim systeem zou begrijpen wat we bedoelen.
- Ook op de intelligentie-explosie zijn er bezwaren, en er zijn andere wegen naar een xrisk dan de explosie.
- *Value alignment problem*: welke waarden geef je een AI, als mensen het zelf niet eens zijn (waardepluralisme)? Russell geeft het voorbeeld van een machine die de pH van de oceaan moet herstellen en daarbij een rampzalig neveneffect veroorzaakt. Ook de makers van AlphaGo begrijpen niet waarom het systeem een bepaalde zet doet, dus controleren is moeilijk.
- *Race dynamics*: bedrijven en landen nemen shortcuts op veiligheid om voor te blijven, vergelijkbaar met de nucleaire wapenwedloop.
- *Weaponization*: AI als wapen is misbruik en niet uniek voor AI. Het debat over autonome wapens (LAWS) gaat over menselijke waardigheid, wie verantwoordelijk is en het oorlogsrecht.
