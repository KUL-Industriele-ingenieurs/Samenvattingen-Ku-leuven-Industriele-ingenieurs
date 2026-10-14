#import "../../school-template.typ": *

#show table: set par(justify: false)

// Argument in standaardvorm: premissen, streep, conclusie.
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

// Problemen met een argument: waar zit het probleem, wat is het.
#let problemen(..rijen) = table(
  columns: (27%, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 5pt),
  [*Probleem met*], [*Waarom*],
  ..rijen,
)

= Verbetering/Enhancement <ch:verbetering>
#concept(title: "Enhancement")[

  #wrap-figure(
    image("assets/Koffie.png", width: 6cm),
    caption: [Koffie],
    label: <fig:Koffie>,
  )[
    Het concept verbetering gaat over het gebruik van bepaalde producten om beter te presteren, bijvoorbeeld koffie: de cafeïne verhoogt je cognitief vermogen.

    We doen dit omdat we bepaalde dingen beter willen doen dan we normaal kunnen, zoals een koffie nemen zodat ik me beter kan concentreren of zodat ik beter presteer op school of op het werk.
  ]
]

Stel dat je dit uitbreidt en iemand neemt cocaïne of Adderall om beter te presteren. De meeste mensen gaan dit niet oké vinden, maar waarom?

Het hoofdstuk heeft vier delen: inleidende opmerkingen, algemene argumenten, specifieke argumenten en aannames.

== Inleiding tot enhancement <sec:inleiding-enhancement>

=== Vooruitgang door technologie <sec:vooruitgang>

Vandaag de dag, in 2026, kunnen we zeggen dat we eigenlijk wel goed leven, zeker als je dat vergelijkt met vroeger.

Maar in de 17de eeuw zei Leibniz al: "_We leven in de best mogelijke van alle werelden._"

Na de aardbeving en tsunami die Lissabon in 1755 verwoestten, schreef Voltaire _Candide_: een kritiek op het kritiekloze vooruitgangsoptimisme van Leibniz en zijn geloof in vooruitgang.

Maar heel veel van de ongemakken waar _Candide_ naar verwees, zijn sindsdien verdwenen: er is meer politieke stabiliteit en democratie, en de slavernij is afgeschaft. Ook gezondheidszorg en technologie hebben ons leven sterk verbeterd.

We leven in een betere wereld dankzij wetenschap en technologie, dus er is wel iets voor te zeggen dat je optimistisch kan zijn over de toekomst.

Hieronder een figuur van de daling van extreme armoede in de wereld bijvoorbeeld:

#figure(
  image("assets/Trend-van-extreme-armoede-van-1820-tot-2018.png", width: 70%),
  caption: [Aandeel van de wereldbevolking in extreme armoede, 1820–2018 (Our World in Data)],
)

Ook de levensverwachting is sterk gestegen en de kindersterfte sterk gedaald. De oude cijfers van de levensverwachting zijn wel vertekend: de hoge kindersterfte haalde het gemiddelde naar beneden, en een volwassen mens kon toen ook 50 à 60 jaar oud worden. Toch is de stijging enorm:
#grid(
  columns: 2,
  [
    #figure(
      image("assets/Levenverwachting.png", width: 100%),
      caption: [Levensverwachting bij geboorte per continent, 1770–2021 (Our World in Data)],
    )
  ],
  [
    #figure(
      image("assets/Kindersterfte-doorheen-de-tijd.png", width: 100%),
      caption: [Kindersterfte per inkomensniveau van een land: aantal kinderen dat sterft voor de leeftijd van 5 jaar, per 1000 geboortes (Our World in Data)],
    )
  ],
)


Daarbij zijn er nog technische verbeteringen: MRI-scans om kanker op te sporen, antibiotica, vaccins, ...

Er zijn dus veel redenen om *techno- en toekomstoptimistisch* te zijn.

Dat is niet hetzelfde als *techno-naïef zijn*: problemen van vandaag kunnen ook door technologie ontstaan, zoals klimaatverandering en de opkomst van AI.

Een interessante video rond dit onderwerp: #link("https://www.youtube.com/watch?v=CGmdvdXoJ-8")[_The world is awful. The world is much better. The world can be much better._] (Rational Animations)

=== Wat is enhancement? <sec:wat-is-enhancement>

We kunnen hier wat onderscheiden maken:

+ Genezen (therapie): MRI-scans voor de behandeling van tumoren $=>$ eliminatie van ziekten = gezond worden.
+ Voorkomen (therapie): injectie tegen griep $=>$ preventie van een mogelijke ziekte in de (nabije) toekomst.
+ Verbeteren (niet-therapeutisch).

Genezen en voorkomen zijn nog geen enhancement: dat zijn technologieën om mensen te helpen hun gezonde toestand te herstellen of te behouden. Enhancement is het verbeteren van cognitieve en fysieke prestaties. Het gaat dus verder dan het normale of natuurlijke menselijke vermogen, en het gebeurt met (bio)technologie. Normaal betekent hier statistisch normaal: wat de meeste mensen kunnen (bv. een IQ van 100). Denk aan een pil die je IQ verhoogt, of een behandeling die je veel sterker maakt.

*Fysieke verbetering:* sneller en langer rennen, zware lichamelijke arbeid.

*Cognitieve verbetering:* geheugen, intelligentie, langer studeren.

Een paar voorbeelden:

- Bètablokkers om harder, sneller en langer te werken.
- Nanotechnologie om neuraal weefsel te verbinden met elektronische circuits.
- Anabole steroïden om spierweefsel op te bouwen en de lichaamsmassa te vergroten.
- CRISPR om intelligente kinderen te krijgen.

De tekst noemt ook een mooier lichaam en betere morele beslissingen (_moral enhancement_). Verwant is *medicalisering*: steeds meer toestanden medisch behandelen, zoals zwangerschap en bevalling. Daar is het doel voorkomen, niet genezen.

=== Link met duurzaamheid <sec:link-duurzaamheid>

*Individueel*: het is goed voor jou om je prestaties te verhogen, voor een beter diploma en een groter inkomen.
- Versterken mogelijkheden $=>$ hoger diploma $=>$ hoger loon

*Collectief*: het is goed voor de samenleving als mensen productiever zijn.
- Versterken mogelijkheden $=>$ meer ondernemingen $=>$ meer werk $=>$ minder armoede, meer overheidsinkomsten, ...

Dat sluit aan bij de intragenerationele rechtvaardigheid uit @sec:sociale-voorwaarden.

=== Het onderwerp waar het over gaat <sec:onderwerp>

Het gaat hier specifiek over het menselijke aspect: niet over het verbeteren van computers of de levensduur van huisdieren, maar echt over de mens en zijn prestaties. Een AI kan je helpen om productiever te zijn of om een betere tekst te schrijven. Dan gaat het niet over de AI zelf, maar wel over jouw prestatie (een tekst schrijven) die erdoor verbetert.

=== Waar het niet over gaat <sec:waar-het-niet-over-gaat>

- Menselijke dieren: het gaat over mensen, niet over andere dieren.
- Betere huizen, computers, enz.: niet de technologie zelf.
- (Niet-)natuurlijke verbetering: opgroeien (natuurlijk) of onderwijs zonder technologie (niet-natuurlijk) tellen niet mee.
- Statistische normaliteit: "normaal" is wat de meerderheid kan, niet wat wenselijk is.
- Blauwe ogen, blond haar: het gaat over prestaties, niet over uiterlijk.

Het gaat om het verbeteren van de mens _door_ technologie.

== Evalueren van enhancement <sec:evalueren-enhancement>

Er zijn vier posities die je kunt innemen:

+ *Ontoelaatbaar*: "Men mag geen technologie gebruiken." Het is moreel fout, je overtreedt een norm.
+ *Toegestaan*: "Het is oké om technologie te gebruiken." Moreel neutraal $=>$ technologie is een optie, je mag maar je moet niet.
+ *Verplicht*: "Men moet technologie gebruiken." Geen morele keuze meer $=>$ meer dan optioneel.
+ *Supererogatoir*: "Het is goed om technologie te gebruiken, maar niet verplicht." Meer dan optioneel, minder dan verplicht. Als je het niet doet, krijg je geen straf, maar als je het wel doet, is het goed. (Voorbeeld van de prof: notities naar een zieke medestudent op kot brengen.)

#figure(
  text(size: 0.85em, fletcher.diagram(
    spacing: (8mm, 6mm),
    node-stroke: 0.6pt,
    node-corner-radius: 3pt,
    node-inset: 6pt,
    fletcher.node((0, 0), [*Ontoelaatbaar*]),
    fletcher.node((1, 0), [*Toegestaan*]),
    fletcher.node((2, 0), [*Supererogatoir*]),
    fletcher.node((3, 0), [*Verplicht*]),
    fletcher.edge((0, 0), (1, 0), "-|>"),
    fletcher.edge((1, 0), (2, 0), "-|>"),
    fletcher.edge((2, 0), (3, 0), "-|>"),
    fletcher.node((0, 1), text(fill: schoolGray)[Sandel \ (conservatief)], stroke: none),
    fletcher.node((1, 1), text(fill: schoolGray)[Buchanan, \ Sparrow (bijwerkingen)], stroke: none),
    fletcher.node((3, 1), text(fill: schoolGray)[Savulescu \ (liberaal)], stroke: none),
  )),
  caption: [De vier evaluatieve posities, van "mag niet" naar "moet", met de auteurs uit de literatuur],
  label: <fig:posities>,
)

=== Argumenten over enhancement <sec:argumenten-enhancement>

*Herhaling van ethiek:*

+ Deontologisch (plichtethiek, Kant): 'in principe', ongeacht de effecten. Iets is in alle gevallen goed of slecht.
+ Consequentialistisch (Bentham): goede en slechte effecten (voorzien en beoogd). Je weegt de goede en slechte aspecten af en trekt daaruit een conclusie.
+ Deugdethisch (Aristoteles): iets is goed of slecht omdat het een morele eigenschap uitdrukt (moed, loyaliteit, ...).

De meeste argumenten hebben een consequentialistisch karakter. Een moreel argument heeft altijd deze vorm:

#argument(([Deontologisch / consequentialistisch / deugdethisch argument],), [Verbetering is (on)toegestaan of verplicht])

=== Posities in de literatuur <sec:posities-literatuur>

+ Conservatief: ontoelaatbaar (Sandel) $=>$ in principe fout + consequentialistisch: slechte effecten.
+ Liberaal:
  - Toegestaan (Buchanan).
  - Toegestaan, maar er zijn bijwerkingen (Sparrow).
  - Verplicht (Savulescu), consequentialistisch: goede effecten.

=== Wat is de rol van een filosoof hier? <sec:rol-filosoof>

- Conceptuele verduidelijking (wat is enhancement?)
- Aannames detecteren (bv. dat genezen en verbeteren duidelijk te scheiden zijn)
- Argumenten onderzoeken (kloppen de premissen?)
- Redeneringen onderzoeken (volgt de conclusie echt uit de premissen?)

In de literatuur zie je dat terug in vier soorten papers: iemand stelt een positie + argument voor, een ander antwoordt met kritiek, de eerste reageert op die kritiek, en een systematisch overzicht zet alle posities en argumenten naast elkaar.

=== Hoe bekijken we een argument? <sec:hoe-argument>

#theorie(title: "Hoe een argument bekijken")[

+ Het argument in standaardvorm zetten: premissen (P) en conclusie (C).
+ Per premisse kijken wat voor claim het is. Een *beschrijvende* (empirische) claim zegt wat het geval is ("het regent niet") en kan je verifiëren of falsifiëren. Een *normatieve* (evaluatieve) claim zegt wat het geval zou moeten zijn ("je mag niet liegen").
+ Problemen zoeken: met een premisse, met de conclusie (volgt ze echt?) of met een *aanname*. Een aanname is iets wat je expliciet of impliciet voor waar neemt, zonder er een argument voor te geven.
]

#examenbox[
  "Geef een argument tegen X": (1) leg X uit in standaardvorm, (2) geef één probleem, (3) leg uit waarom het een argument tegen X is. Deel 3 is het belangrijkste.
]

#figure(
  table(
    columns: (auto, auto, auto, auto),
    stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
    inset: (x: 5pt, y: 4pt),
    align: left,
    [*Argument*], [*Soort*], [*Conclusie*], [*Karakter*],
    [Intelligent design], [algemeen], [ontoelaatbaar], [in principe (religieus)],
    [Gelijkheid], [algemeen], [ontoelaatbaar], [consequentialistisch],
    [Gezondheid], [algemeen], [ontoelaatbaar], [consequentialistisch],
    [Wapenwedloop (tekst)], [algemeen], [onwenselijk], [consequentialistisch],
    [Billijkheid], [fysieke enh.], [ontoelaatbaar], [gevolg: unfairness],
    [Welzijn], [genetische manip.], [*verplicht*], [consequentialistisch],
    [Menselijke natuur], [genetische manip.], [ontoelaatbaar], [in principe (variant van ID)],
  ),
  caption: [Overzicht van de argumenten. Enkel het welzijnsargument is een argument vóór enhancement.],
  label: <tab:overzicht-argumenten>,
)

== Algemene argumenten <sec:algemene-argumenten>

Algemene argumenten gelden voor elke vorm van enhancement. Alle drie zijn ze _tegen_.

=== Het intelligent design-argument <sec:intelligent-design-argument>

#argument(
  ([De wereld is hiërarchisch], [Het veranderen van de hiërarchie is moreel verkeerd]),
  [Verbetering is ontoelaatbaar],
)

*(P1) De wereld is hiërarchisch* is een beschrijvende claim. De wereld heeft een vaste rangorde (God, mensen, dieren, ...), en elke laag onderscheidt zich duidelijk van de andere.

Dat leunt op *essentialisme*: een essentie is een eigenschap die _alle_ en _enkel_ de leden van een groep hebben.

De tekst noemt die rangorde de *Scala Naturae* (ladder van het leven). Ze was ook een moreel ideaal: het is _goed_ om op je natuurlijke plaats te blijven. Genezen brengt je terug naar dat ideaal en mag dus, verbeteren gaat erboven en mag niet.

*(P2) Het veranderen van de hiërarchie is moreel verkeerd* is een normatieve claim. Die rust zelf op een deelargument:

#argument(
  ([De structuur van de wereld is Gods product], [Het veranderen van Gods product is respectloos]),
  [Het veranderen van de hiërarchie is moreel verkeerd],
)

Het is dus fout om de hiërarchie aan te passen, omdat je de goddelijke orde niet respecteert.

*Problemen:*

#problemen(
  [(P1) hiërarchie], [Er is (waarschijnlijk) geen unieke en universele eigenschap: volgens de evolutietheorie lopen mens en dier in elkaar over.],
  [(P2) moreel verkeerd], [Het darwinisme suggereert dat er geen intelligente ontwerper is, dus kan verbetering ook niet respectloos zijn.],
  [Aanname 1: verbetering verstoort de hiërarchie], [Niet elke verbetering is een revolutie: sneller lopen maakt je geen ander wezen.],
  [Aanname 2: God is conservatief], [Misschien wil God net dat we ons verbeteren. Dan is niet verbeteren respectloos.],
)

=== Het gelijkheidsargument <sec:gelijkheidsargument>

#argument(
  ([Verbetering versterkt of veroorzaakt ongelijkheid], [Ongelijkheid heeft een ongewenst maatschappelijk gevolg]),
  [Verbetering is ontoelaatbaar],
)

*(P1)* is een empirische claim: ze kan worden geverifieerd of gefalsifieerd.

De tekst schetst het ergste geval: de rijken worden slimmer en sterker, de armen blijven achter, en op termijn krijg je twee soorten mensen (de 'posthumane' en de rest).

*(P2)* lijkt over het algemeen correct. Het is een consequentialistische claim: ongelijkheid is hier slecht _door de gevolgen_, niet op zich.

*Problemen met (P1):*

#problemen(
  [Probleem 1], [Geen data: de technologieën bestaan nog niet (of niet lang genoeg).],
  [Probleem 2], [Sommige middelen kunnen ongelijkheid net verminderen. Je kan langer en beter werken, waardoor je een hoger loon haalt en uit de armoede raakt.],
  [Probleem 3], [Een middel kan goedkoop worden en dan voor iedereen beschikbaar zijn $arrow.r.double$ geen ongelijkheid. 
  
  _Tegenargument:_ een lagere prijs is niet gegarandeerd. Veel technologieën zijn vandaag nog altijd duur, dat kan ook zo zijn voor verbeteringstechnologie.],
)

*Problemen met (P2):*

#problemen(
  [Probleem 1], [Ongelijkheid is niet altijd slecht. Een dokter verdient meer dan anderen. Daardoor willen mensen dokter worden, en dat maakt de samenleving gezonder.],
  [Probleem 2], [De voordelen van verbetering kunnen opwegen tegen de ongelijkheid, bv. een wetenschapper die sneller een kankertherapie vindt. Dat is zelf een consequentialistische veronderstelling.],
)

*Problemen met (C):* stel dat beide premissen juist zijn, volgt er dan een verbod?

#problemen(
  [Probleem 1: zwarte markt], [Middelen worden duur en alleen rijken kunnen ze kopen: de oplossing verergert het probleem. Plus ander crimineel gedrag.],
  [Probleem 2: totale ban mislukt], [Mensen ontsnappen aan een verbod, dus de ongelijkheid blijft.],
  [Probleem 3: bewaking], [Een verbod controleren betekent mensen bewaken, en dat botst met privacy.],
)

*Probleem met de aanname: verbetering is een product van de markt (niet van de staat).* Het argument neemt aan dat de staat alleen ingrijpt bij schadelijke gevolgen. Maar de staat zorgt ook zelf voor verbetering met een eerlijke verdeling, zoals bij onderwijs. Voor enhancement kan dat met gratis toegang of subsidies.

#examenbox[
  "Geef een kritiek op het gelijkheidsargument": standaardvorm, één probleem (bv. probleem 2 met (P1)), waarom het tegen die premisse ingaat.
]

=== Het gezondheidsargument <sec:gezondheidsargument>

#argument(
  ([Enhancement heeft een onwenselijk gezondheidseffect],),
  [Enhancement is ontoelaatbaar],
)

*(P)* is een empirische claim.

#problemen(
  [(P)], [Niet waar voor alle enhancement, bv. hoogtestage in het wielrennen. Het argument is dus beperkt.],
  [Aanname: onwenselijke effecten zijn beslissend], [Het argument zegt: X is enkel toelaatbaar zonder onwenselijke effecten. Maar bergbeklimmen is ook gevaarlijk en verbieden we niet: mensen kennen het risico en beslissen zelf, *autonomie overweegt*.],
)

Wie schade genoeg vindt voor een verbod op enhancement maar niet op bergbeklimmen, maakt van enhancement een uitzondering zonder reden: *exceptionalisme*, en dus *inconsistent*.

#examenbox[
  Komt vrij zeker terug: "wat is de link tussen het gelijkheids- en het gezondheidsargument?" Leg beide uit, dan de link: allebei _tegen_ enhancement en allebei consequentialistisch.
]

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
    inset: (x: 5pt, y: 4pt),
    align: left,
    [], [*Gelijkheidsargument*], [*Gezondheidsargument*],
    [Conclusie], table.cell(colspan: 2)[enhancement is ontoelaatbaar (beide)],
    [Karakter], table.cell(colspan: 2)[consequentialistisch: slecht door de gevolgen (beide)],
    [Onwenselijk gevolg], [ongelijkheid in de samenleving], [schade aan de gezondheid],
    [Premissen], [(P1) empirisch, (P2) consequentialistisch], [(P) empirisch],
  ),
  caption: [Gelijkheids- vs. gezondheidsargument],
  label: <tab:gelijkheid-gezondheid>,
)

== Specifieke argumenten <sec:specifieke-argumenten>

Deze gelden alleen voor een bepaald type enhancement.

=== Billijkheidsargument (fysieke enhancement) <sec:billijkheids-argument>

#argument(
  ([Enhancement leidt tot unfairness],),
  [Enhancement is ontoelaatbaar],
)

*Probleem met (P):* het omgekeerde kan ook. Dat kan je zelf als argument schrijven:

#argument(
  ([Hoogtestage kan zeer duur zijn], [Sommige middelen kunnen goedkoop zijn]),
  [Middelen kunnen de kloof verkleinen],
)

Een goedkoop middel met hetzelfde effect als een dure hoogtestage maakt de sport net _eerlijker_.

*Probleem met de aanname: unfairness volstaat voor een verbod*, dus X is enkel toelaatbaar als er geen unfairness is. Maar dure hoogtestages zijn ook unfair en niet verboden. Opnieuw *exceptionalisme – inconsistentie*.

=== Welzijnsargument (genetische manipulatie) <sec:welzijns-argument>

Het enige argument _vóór_ enhancement, en het gaat het verst: verplicht (Savulescu).

#argument(
  ([Welzijn is de hoogste waarde], [Genetische manipulatie leidt tot meer welzijn]),
  [Genetische manipulatie is verplicht],
)

(P1) is normatief, (P2) is beschrijvend. Het argument werkt in twee stappen:

*1. Slechte genen* = een dispositie voor een ziekte. Als we die kans kunnen wegnemen, is het immoreel om _niet_ in te grijpen (consequentialisme: welzijn). Niet ingrijpen is dan geen optie meer.

*2. Goede genen* = geen dispositie voor een ziekte. *Consistentie*: als we naar het hoogste welzijn moeten streven, geldt dat ook voor gezonde mensen. Dus is genetische manipulatie voor iedereen verplicht.

*Probleem met (C): onwenselijk neveneffect.* Iedereen past zich aan het type mens aan dat nu succesvol is: witte mannelijke suprematie en minder diversiteit. Dat lijkt al snel op eugenetica.

=== Menselijke natuur-argument (genetische manipulatie) <sec:menselijk-natuur-argument>

Een seculiere variant van het intelligent design-argument: niet de hiërarchie, maar de menselijke natuur mag je niet aanpassen.

#argument(
  ([Menselijke natuur veranderen is ontoelaatbaar],),
  [Genetische manipulatie is ontoelaatbaar],
)

De tekst geeft ook een variant zonder God: onvolmaaktheid en kwetsbaarheid maken het leven waardevol ("Alles van waarde is weerloos", Lucebert), en dat verlies je door verbetering. Kritiek: kwetsbaarheid is ook een bron van veel ellende, en verbetering maakt je maar op één vlak minder kwetsbaar.

*Problemen met (P):*

#problemen(
  [Probleem 1], [Het concept "menselijke natuur" is _onduidelijk_ (alle mensen?), _betwijfelbaar_ (veel variatie) en _oncontroleerbaar_.],
  [Probleem 2], [Waarom zou het fout zijn? We veranderen ook ons haar of onze tanden. Wie zegt dat de natuur anders is, moet uitleggen waarom dat verschil relevant is. Anders: *exceptionalisme*.],
  [Probleem 3 (tekst)], [Verbetering zit zelf in onze natuur. De mens is een cultureel wezen dat al 2 miljoen jaar technologie gebruikt (stenen werktuigen van Oldowan). Wie de natuur als iets statisch ziet en er een norm van maakt, heeft het mis.],
)

*Problemen met (C):* stel dat (P) klopt, volgt de conclusie dan?

#problemen(
  [Probleem 1], [Menselijke natuur impliceert overerfbaarheid (via genen). Genetische manipulatie impliceert geen transfer naar je kinderen.],
  [Probleem 2], [Menselijke natuur is een populatieconcept, terwijl genetische manipulatie louter individueel kan zijn.],
)

*Probleem met de aanname: menselijke natuur is goed.* Niet noodzakelijk:
- _Evolutie en ethiek_: wat ons vroeger hielp overleven, is niet per se wat we vandaag goed vinden.
- _Onwenselijke eigenschappen_: ook agressie hoort bij onze natuur.

== Aannames <sec:aannames>

Wie tegen enhancement is (de conservatieve positie), steunt vaak op een van twee aannames:

+ Er is een duidelijk onderscheid tussen *genezen* en *verbeteren*.
+ Er is een duidelijk onderscheid tussen *voorkomen* en *verbeteren*.

De redenering is dan: therapie (genezen, voorkomen) is goed, verbeteren is slecht.

Kritiek op de aanname zegt _niet_ dat verbetering nooit een probleem is, of dat het toelaatbaar of verplicht is. Alleen dat het onderscheid geen goede basis is om te oordelen.

=== Genezen en verbeteren <sec:genezen-verbeteren>

Ziekte is een spectrum. Wanneer ben je gewoon wat benadeeld, en wanneer ben je ziek? Een scherpe grens is er niet.

Een voorbeeld: een migrainemedicijn met als neveneffect +30 IQ.

#figure(
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let x(iq) = (iq - 50) / 10 * 1.4
    rect((x(66), -0.25), (x(74), 0.25), fill: luma(225), stroke: none)
    content((x(70), 0.55), text(size: 0.75em, fill: schoolGray)[grijze zone])
    line((x(50), 0), (x(140), 0), mark: (end: ">"))
    for iq in (60, 70, 90, 100, 130) {
      line((x(iq), -0.12), (x(iq), 0.12))
      content((x(iq), -0.45), text(size: 0.8em)[#iq])
    }
    content((x(140), -0.45), text(size: 0.8em)[IQ])
    line((x(60), 0.9), (x(90), 0.9), mark: (end: ">"), stroke: schoolGreen + 1.2pt)
    content((x(75), 1.25), text(size: 0.8em, fill: schoolGreen)[genezing: OK])
    line((x(100), 0.9), (x(130), 0.9), mark: (end: ">"), stroke: schoolRed + 1.2pt)
    content((x(115), 1.25), text(size: 0.8em, fill: schoolRed)[verbetering: ontoelaatbaar])
    content((x(70), -0.9), text(size: 0.75em)[grens 70 = conventie])
  }),
  caption: [Hetzelfde medicijn, +30 IQ: bij IQ 60 noemen we het genezing, bij IQ 100 verbetering],
  label: <fig:iq-grens>,
)

- Student met IQ 100 neemt het voor het neveneffect: verbetering, dus ontoelaatbaar.
- Student met IQ 60 neemt hetzelfde middel: genezing, geen moreel probleem.

Waar stopt genezing en begint verbetering? Handboeken leggen de grens op 70, maar dat is een afspraak (conventie).

Zonder duidelijke lijn kan je niet altijd zeggen "ontoelaatbaar want verbetering" of "toelaatbaar want genezing". De aanname is geen goede basis voor ethische reflectie.

=== Voorkomen en verbeteren <sec:voorkomen-verbeteren>

Opnieuw: voorkomen is goed, verbeteren is fout, met als aanname een duidelijke grens.

Maar dezelfde technologie kan verbeteren _en_ voorkomen. De student met IQ 100 zou zonder het middel angst en depressie krijgen, met immuniteitsproblemen als gevolg. Het middel verbetert hem en voorkomt tegelijk een ziekte.

Dus kan je niet altijd oordelen op basis van het onderscheid. De aanname is opnieuw geen goede basis voor ethiek.

=== Het verschil tussen beide kritieken <sec:verschil-kritieken>

Beide kritieken zeggen dat er geen onderscheid is, maar om een andere reden:

#table(
  columns: (1fr, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { none },
  inset: (x: 5pt, y: 4pt),
  [*Genezen – verbeteren*], [*Voorkomen – verbeteren*],
  [*Onwetendheid*: we weten niet waar de grens ligt.], [*Kennis*: we weten dat het middel beide effecten heeft.],
)

== Aanvullingen uit de tekst <sec:aanvullingen-tekst>

De tekst op Toledo (hoofdstuk 9 "Verbetering") is ook leerstof. Wat in de les niet aan bod kwam en niet in de delen hierboven past, staat hier.

=== Het wapenwedloop-argument <sec:wapenwedloop-argument>

Naast de drie algemene argumenten uit @sec:algemene-argumenten[sectie] noemt de tekst een vierde argument tegen (Frank, 1985):

#argument(
  ([Men verbetert zich vooral voor een competitief voordeel: niet snel, maar sneller dan de anderen], [Als iedereen dat doet, blijft de rangorde gelijk en verspilt iedereen veel middelen]),
  [Verbetering is onwenselijk],
)

*Probleem:* het argument steunt op empirische aannames: dat de techniek bij iedereen hetzelfde effect heeft, dat iedereen ze wil gebruiken en dat de neveneffecten negatief zijn. Dat geldt niet voor alle technieken, dus als algemeen argument werkt het niet.

=== Medisch en niet-medisch verbeteren <sec:medisch-niet-medisch>

Naast de twee onderscheiden uit @sec:aannames[sectie] noemt de tekst een derde. Critici verwerpen meestal alleen _medische_ verbetering: de fiets willen ze niet verbieden. Dan moeten ze medisch van niet-medisch kunnen scheiden, en ook die grens is vaag. Bietensap kan je drinken om beter te presteren, maar een arts kan het ook aanraden tegen hoge bloeddruk.

"Medisch = oorspronkelijk ontwikkeld tegen ziekte" lost dat niet op: of een techniek voor genezing ontwikkeld werd, is historisch toeval en zegt niets over de techniek zelf.

=== Verbetering door genezing <sec:verbetering-door-genezing>

Positieve bijwerkingen vinden tegenstanders geen probleem: een migrainepatiënt mag het middel nemen, ook al stijgt zijn IQ. Je kan dat verdedigen met het verschil tussen een *geïntendeerd* en een *niet-geïntendeerd* effect.

Maar de gewone geneeskunde verbetert zelf ook: ziektes genezen verlengt het leven, en medicijnen voor ouderen laten een oud lichaam meer doen dan statistisch normaal is. Het doel van de geneeskunde en dat van de verbeterkunde hangen dus nauw samen.

#examenbox[
  Te kennen: de slides met de uitleg erbij en de tekst op Toledo (de delen met "(tekst)" en @sec:aanvullingen-tekst[sectie] komen daaruit). De literatuurlijst hoef je niet te lezen.
]
