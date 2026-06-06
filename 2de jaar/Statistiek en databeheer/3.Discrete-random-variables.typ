#import "../../school-template.typ": *

= Hoofdstuk 4 Discrete random variables <ch:discrete-random-variables>

== Inhoud <sec:inhoud>

We gaan een notatie definiëren voor discrete random variabelen en de kansverdeling _binomiaal_ en _poisson_ verdeling.

== Random variable <sec:random-variable>

Dit zijn concepten die beschrijven hoe we de uitkomsten van een experiment voorstellen en of we deze uitkomsten kunnen _tellen_ of _meten_.

#concept(title: "Random variable")[

  Dit is een variabele die een numerieke waarde toekent aan elke mogelijke uitkomst van een experiment.

  Bijvoorbeeld, een serie van twee keer munt opgooien heeft 4 mogelijke uitkomsten:
  - Kop - Kop
  - Kop - Munt
  - Munt - Kop
  - Munt - Munt

  Als de random variabele $X$ "het aantal keer kop" voorstelt, kan deze de volgende waarden aannemen:
  $ X = 2, 1, 1, 0 $

  Je hebt bij random variabelen twee grote types:

  + *Discrete random variable* (#keyterm[Tellen])

    Dit zijn variabelen met uitkomsten die we kunnen *tellen* en die uitsluitend vaste, losstaande waarden aannemen. Er zitten als het ware gaten of "sprongen" tussen de mogelijke waarden. Ze behoren vaak tot de verzameling van de #keyterm[natuurlijke getallen].
    $ X = x_1, x_2, x_3, x_4 dots x_n $

    Voorbeelden, dit zijn vaak "volledige" getallen:
    - 0, 1, 2, 3...
    - Aantallen van iets
    - Aantal worpen, goals, ...

  + *Continue random variable* (#keyterm[Meten])

    Dit zijn variabelen die we over het algemeen *meten* en die niet telbaar zijn. Ze kunnen namelijk eender welke numerieke waarde aannemen binnen een bepaald interval (inclusief alle decimalen). Dit is een element van de verzameling van alle #keyterm[reële getallen].
    $ X epsilon.alt RR $

    Voorbeelden, dit zijn getallen waar in theorie oneindig veel decimalen op kunnen zitten:
    - 1,23456789...
    - Lengtes of afstanden
    - Gewichten, tijd of temperaturen
]

== Kansverdeling van discrete random variables <sec:kansverdeling>

Een kansverdeling is hoe de kansen verdeeld worden afhankelijk van meerdere events. De kansverdeling van kop of munt is gewoon 50/50. Je kunt deze kansen dan plotten in een grafiek.

De kansverdeling van twee dobbelstenen kopen ziet er als volgt uit:

#figure(
  image("assets/kansverdeling-2dobbelstenen.png", width: 8cm),
  caption: [kansverdeling-2dobbelstenen],
  label: <fig:kansverdeling-2dobbelstenen>,
)

Je ziet dat de kans op 7 het grootst is. Dit komt omdat er meer combinaties zijn om 7 te gooien.


== Verwachte waarden van discrete random variables <sec:expected-values>

Wat is nu het gemiddelde van die kansverdeling? Wat is de spreiding? Hoe gaan we hier nu meer werken? Dit is al deels gezien in _intro tot statistiek_. De ideeën worden dus niet herhaal. Maar de formules zijn anders omdat we niet met normaal verdelingen werken.


- #term[Gemiddelde]: \
  $ mu = E(X) = sum x p (x) = sum_i=1^n n c_1 (p x_i) $ \
  Je sommeert over alle mogelijke waarden van $x$ maal de kans dat $x$ _p(x)_ deze waarde heeft.

- #term[Variatie]: \
  $ sigma^2 = E[(x-mu)^2] = sum(x-mu)^2 p(x) = sum_i=1^n (x_i-mu)^2 p(x_i) = n p (1-p) $ \
  Je bekijkt alle verschillen tussen $x$ en $mu$ en vermenigvuldigt dit met de kans dat $x$ _p(x)_ deze waarde heeft.

- #term[Standaardafwijking]: \
  $ sigma = sqrt(sigma^2) = sqrt(n p (1-p)) $ \
  Je neemt de wortel van de variatie om de standaardafwijking te vinden.



Afhankelijk van de verdeling zijn er verschillende regels. De meest bekende zijn de #keyterm("Chebyshev's rule") en de #keyterm("empirische regel").

Bij de empirische regel heb je een gelijke verdeling langs het gemiddelde.

Bij de Chebyshev's rule heb je geen gelijke verdeling langs het gemiddelde.

#frm(
  "Chebyshev's rule en de empirische regel",
  [
    $ P(|mu - sigma| < underline(x) < mu + sigma) >= overbrace(0, "chebyshev") | approx overbrace(0.68, "emperical") $

    $
      P(|mu - 2 sigma| < underline(x) < mu + 2 sigma) >= overbrace(3/4, "chebyshev") | approx overbrace(0.95, "emperical")
    $

    $
      P(|mu - 3 sigma| < underline(x) < mu + 3 sigma) >= overbrace(8/9, "chebyshev") | approx overbrace(0.997, "emperical")
    $
  ],
  [
    Met $mu$ en $sigma$ de gemiddelde en standaardafwijking.
  ],
)

Dit toont dat afhankelijk van hoe ver je gaat van je gemiddelde, de kans dat je waarde hierbinnen valt groter wordt.

#figure(
  image("assets/cheby VS emperical.png", width: 10cm),
  caption: [cheby VS emperical],
  label: <fig:cheby-vs-emperical>,
)


#oefening(title: "Huidskanker behandeling")[
  Medisch onderzoek heeft aangetoond dat een bepaald type chemotherapie in 70% van de gevallen succesvol is bij de behandeling van huidkanker. Veronderstel dat vijf patiënten met huidkanker worden behandeld met dit type chemotherapie, en laat $x$ het aantal succesvolle genezingen van de vijf zijn. De kansverdeling (pmf) voor het aantal $x$ succesvolle genezingen van de vijf is gegeven in de volgende tabel:

  #align(center)[
    #table(
      columns: 7,
      [$x$], [0], [1], [2], [3], [4], [5],
      [$p(x)$], [0.002], [0.029], [0.132], [0.309], [0.360], [0.168],
    )
  ]
  #wrap-figure(
    image("assets/histrogram-huidskankeroefening.png", width: 5cm),
    caption: [histrogram-huidskankeroefening],
    label: <fig:histrogram-huidskankeroefening>,
  )[

    * Wat is het gemiddelde $mu = E(x)$?*

    $ mu = E(x) = sum x p(x) $
    $
      mu & = 0(0.002) + 1(0.029) + 2(0.132) \
         & + 3(0.309) + 4(0.360) + 5(0.168) \
         & = 3.50
    $

    *Wat is de standaardafwijking $sigma$?*

    $
      sigma^2 = E[(x - mu)^2] = sum (x - mu)^2 p(x) \
      + (3-3.5)^2(0.309) + (4-3.5)^2(0.360) + \ (5-3.5)^2(0.168) \
      = 1.05
    $

    $ sigma = sqrt(1.05) approx 1.02 $
  ]

  *Gebruik Chebyshev's rule of empirical rule*

  $ mu +- 2 sigma = [1.46, 5.54] $

  - Minstens 75% (Chebyshev)
  - Ongeveer 95% (Empirical rule)

  _In de video gebruiken ze de chebyshev's regel maar je kunt ook zeggen dat het een gelijke verdeling is en dus kun je de empirische regel gebruiken._

  $ p(2) + p(3) + p(4) + p(5) = 0.96 $

  $ P(1.46 < x < 5.54) = 0.96 $
]


== Binomiale verdeling
Een binomiale verdeling wordt geclassificeerd door deze eigenschappen:

+ Er zijn n onafhankelijke experimenten
+ Elk experiment heeft maar twee mogelijke uitkomsten (daarom *bi*-nomiale)
+ De kans op succes is altijd hetzelfde
+ De kans op falen is altijd hetzelfde
+ Het onderzoek is onafhankelijk
+ De binomiale random variable x is het aantal $S's$ in n experimenten.



#voorbeeld(title: "Niet binomiale verdeling")[
  *Gegeven:*
  n = 2
  mannen = 6
  vrouwen = 4

  $P(S) = "succes"$
  $P(F) = "falen"$

  $P(S_1) = 4/10 = 0.4$ _de kans dat de eerste persoon een vrouw is_\
  $P(S_2|S_1) = 3/9 = 0.333$ _de kans dat de tweede persoon een vrouw is als de eerste persoon een vrouw was_\
  $P(S_2|S_1) != P(S_2)$ _dus niet onafhankelijk_

  $P(F_1) = 0.6$ _de kans dat de eerste persoon geen vrouw is_\
  $P(S_2|F_1) = 4/9 = 0.444$ _de kans dat de tweede persoon een vrouw is als de eerste persoon geen vrouw was_\
  $P(S_2|F_1) != P(S_2)$ _dus niet onafhankelijk_

  Het zijn afhankelijk events $==>$ niet binomiale verdeling.
]

#voorbeeld(title: "Fitness test")[
  *Probleem:* \
  De Heart Association beweert dat slechts 10% van de Amerikaanse volwassenen ouder dan 30 jaar voldoet aan de minimumvereisten vastgesteld door de President's Council on Fitness, Sports, and Nutrition. Veronderstel dat vier volwasse nen willekeurig worden gekozen en elk de fitheidstest afleggen.

  *Gegeven:*\
  $N = 10 dot 10^6$
  $n = 4$

  $P(S_1) = N/n$
  $P(S_2|S_1) = (N-1)/(n-1) approx 0.1$
  $P(S_2|S_1) != P(S_2)$ _dus niet onafhankelijk_


  Als $n/N <= 0.05 ==> "Neem aan onafhankelijk"$

  We gaan nu een paar testen doen. Wat is de kans dat er 4 van de 4 mensen $P(4/4)$ fit zijn?
  En wat zijn de kansen dat 3 van de 4 mensen $P(3/4)$ fit zijn?

  $P(4) = 0.1^4 = 0.0001$
  $P(3) = 4 * 0.1^3 * 0.9 = 0.0036$

  $P(A inter B inter C) = P(A) * P(B) * P(C) ("Onafhankelijke events")$

  Dus ze zijn onafhankelijk omdat we zo een grote populatie hebben dus het effect dat 1 persoon slaagt of niet heeft zo goed als geen effect op de rest.

  *4/4 slaagt* (maar een event dat dit gebeurt)\
  $P(S_1,S_2,S_3,S_4) = P(S_1) * P(S_2) * P(S_3) * P(S_4) = 0.1^4 = 0.0001$

  *3/4 slaagt* (er zijn 4 events dat dit gebeurt)\
  + $ P(S_1,S_2,S_3,F_4) = P(S_1) * P(S_2) * P(S_3) * P(F_4) = 0.1^3 * 0.9 = 0.0009 $
  + $ P(S_1,S_2,F_3,S_4) = P(S_1) * P(S_2) * P(F_3) * P(S_4) = 0.1^3 * 0.9 = 0.0009 $
  + $ P(S_1,F_2,S_3,S_4) = P(S_1) * P(F_2) * P(S_3) * P(S_4) = 0.1^3 * 0.9 = 0.0009 $
  + $ P(F_1,S_2,S_3,S_4) = P(F_1) * P(S_2) * P(S_3) * P(S_4) = 0.1^3 * 0.9 = 0.0009 $

  *De kansen optellen*\
  $ P(3) = 0.9 dot 10^-3 + 0.9 dot 10^-3 + 0.9 dot 10^-3 + 0.9 dot 10^-3 = 3.6 dot 10^-3 = 0.0036 $

  $ arrow.r.double P(3) = 4 * 0.1^3 * 0.9 = 0.0036 $
]
Je weet dat je kansen van de 4 events hetzelfde zijn maar voor grotere getallen wordt dit te veel werk. Hoeveel weet je nu hoeveel events er mogelijk zijn?

Hiervoor is de #keyterm[Combitationele formule]:

#frm(
  "Combitationele formule",
  [
    $ C binom(n, k) = n! / (k! (n-k)!) $
  ],
  [
    $C$ is de operatie combinatoriek, $n$ is het aantal experimenten en $k$ is het aantal successen.
  ],
)

Voor deze oefening

$ C binom(4, 3) = 4! / (3! (4-3)!) = 4! / (3! 1!) = 4 $

$ C(4,4) = 4! / (4! (4-4)!) = 4! / (4! 0!) = 1 $

Dit speelt in op de distributie van de binominale verdeling:

#frm(
  "Binomiale kansen verdeling",
  [
    $ p(x) = binom(n, x) p^x q^(n-x) $
    $ binom(n, x) = n! / (x!(n-x)!) $
  ],
  [
    Met $n$ het aantal experimenten, $x$ het aantal successen, $p$ de kans op succes en $q = 1-p$
  ],
)

#concept(title: "faculteit")[
  De faculteit is een wiskundenotatie voor het volgende en wordt veel toegepast in kansrekenen:
  $ n! = n(n-1)(n-2)...(1) $
  $ 0! = 1 $
]

== Gemiddelde, spreiding en verdeling van binomiale verdeling

#theorie(title: "pmf (probability mass function) en cdf  (cumulative distribution function)")[

  #wrap-figure(
    image("assets/binomiale-verdeling.png", width: 7cm),
    caption: [binomiale verdeling],
    label: <fig:binomiale-verdeling>,
  )[

    *pmf* zijn de bars. Ze zijn puur de kans van die specifiek random variable.

    *cdf* is de integratie van de pmf. Alle vorige kansen worden opgeteld. Als alle vorige kansen opgeteld zijn is de cdf 1.
  ]
]

Herhaling van vorige sectie:

- #term[Gemiddelde]: \
  $ mu = E(X) = sum x p (x) = sum_i=1^n n c_1 (p x_i) $ \
  Je sommeert over alle mogelijke waarden van $x$ maal de kans dat $x$ _p(x)_ deze waarde heeft.

- #term[Variatie]: \
  $ sigma^2 = E[(x-mu)^2] $ =$ sum(x-mu)^2 p(x) = sum_i=1^n (x_i-mu)^2 p(x_i) = n p (1-p) $ \
  Je bekijkt alle verschillen tussen $x$ en $mu$ en vermenigvuldigt dit met de kans dat $x$ _p(x)_ deze waarde heeft.

- #term[Standaardafwijking]: \
  $ sigma = sqrt(sigma^2) = sqrt(n p (1-p)) $ \
  Je neemt de wortel van de variatie om de standaardafwijking te vinden.


#voorbeeld(title: "4.13 enquête van 20 stemmen")[

  *Probleem:*\
  Er wordt een enquête gemaakt met 20 stemmen. stel dat 60% van alle mensen stemmen op een canidaat. Hoeveel van de 20 stemmen gaan op die canidaat gestemt hebben en wat is de binomiale verdeling?

  *Gegeven:*\
  $n = 20$ _aantal stemmen_\
  $p = 0.6$ _kans dat een stem op die canidaat gaat_\
  $mu = E(x) = n dot p = 20 * 0.6 = 12$

  $sigma^2 = E[(x-mu)^2] = sum(x-mu)^2 p(x) = sum_i=1^n (x_i-mu)^2 p(x_i) = n p (1-p) = 20 * 0.6 * 0.4 = 4.8$

  $sigma = sqrt(sigma^2) = sqrt(n p (1-p)) = sqrt(20 * 0.6 * 0.4) = sqrt(4.8) = 2.19$

  *Binomial distribution with n = 20 and p = 0.6:*
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (9, 5.5),
        x-label: $n$,
        y-label: [probability or cumulative],
        x-tick-step: 5,
        y-tick-step: 0.2,
        x-min: -1,
        x-max: 21,
        y-min: 0,
        y-max: 1.05,
        {
          plot.add-bar(
            (
              (0, 0.0000),
              (1, 0.0000),
              (2, 0.0000),
              (3, 0.0000),
              (4, 0.0003),
              (5, 0.0013),
              (6, 0.0049),
              (7, 0.0146),
              (8, 0.0355),
              (9, 0.0710),
              (10, 0.1171),
              (11, 0.1597),
              (12, 0.1797),
              (13, 0.1659),
              (14, 0.1244),
              (15, 0.0746),
              (16, 0.0350),
              (17, 0.0123),
              (18, 0.0031),
              (19, 0.0005),
              (20, 0.0000),
            ),
            style: (stroke: none, fill: schoolBlue),
          )
          plot.add(
            (
              (0, 0.0000),
              (1, 0.0000),
              (2, 0.0000),
              (3, 0.0000),
              (4, 0.0003),
              (5, 0.0016),
              (6, 0.0065),
              (7, 0.0210),
              (8, 0.0565),
              (9, 0.1275),
              (10, 0.2447),
              (11, 0.4044),
              (12, 0.5841),
              (13, 0.7500),
              (14, 0.8744),
              (15, 0.9490),
              (16, 0.9840),
              (17, 0.9964),
              (18, 0.9995),
              (19, 1.0000),
              (20, 1.0000),
            ),
            label: "cdf",
            style: (stroke: (paint: schoolBlue, dash: "dashed", thickness: 1.5pt)),
            mark: "o",
            mark-style: (fill: schoolBlue, stroke: schoolBlue),
            mark-size: 0.15,
          )
        },
      )
    })
  ]

  Wat is nu de kans dat minder dan 10 mensen stemmen op die canidaat?

  Bekijk de cumulatieve verdeling:
  $ P(X < 10) approx 0.2447 $

]

== Poisson verdeling
Een Poisson verdeling gebruikt ook random variablen maar is anders dan de binomiale verdeling.

Een paar voorbeelden:
- Accidenten per maand op een druk kruispunt
- De hoeveelheid zieken bomen in een bos per viekante kilomter


een paar dingen die de Poisson verdeling categoriseren:
+ Experiment is een *Optellend* nummer van events
+ Events zijn onafhankelijk
+ De hoeveelheid events is onafhankelijk van de tijds of plaatseenheid (in een bos met zieken bomen moet je aannemen dat het constant is overal)
+ De gemiddelde wordt voorgesteld met $lambda$

#frm(
  "Poisson verdeling",
  [
    $p(x) = frac(lambda^x e^(-lambda), x!) | (x = 0, 1, 2, ...) | mu = lambda | sigma^2 = lambda$

    Het gemiddelde van de Poisson verdeling is:
    $mu = sum_(x=0)^infinity x p(x) arrow.r lambda$

    De variatie van de Poisson verdeling is:
    $sigma^2 = sum_(x=0)^infinity (x-mu)^2 p(x) arrow.r lambda$
  ],
  [
    $p(x)$ is de kans dat $x$ events gebeuren.
  ],
)

Het gemiddelde en de variatie zijn gelijk.

#examenbox("Je moet deze niet kunnen afleiden gewoon ter illustratie")

#voorbeeld(title: "4.14 Walvissen spotten")[
  *Gegeven*\
  je kunt de populatie van walvissen benaderen door ze te spotten.

  x = hoeveel spottingen er gedaan zijn.
  Neem aan dat x ongeveer een poisson verdeling heeft met $lambda = 2.6$

  _Het gemiddelde en de variatie zijn gelijk_\
  $mu = lambda = 2.6$
  $sigma^2 = lambda = 2.6$
  $sigma = sqrt(lambda) = sqrt(2.6) = 1.6$



  *Vraag*\



  *Poisson distribution with $lambda = 2.6$:*
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      plot.plot(
        name: "ppt",
        size: (9, 5.5),
        x-label: [random variables],
        y-label: [probability or cumulative],
        x-tick-step: 2,
        y-tick-step: 0.2,
        x-min: -0.5,
        x-max: 10.5,
        y-min: 0,
        y-max: 1.05,
        {
          plot.add-bar(
            (
              (0, 0.0743),
              (1, 0.1931),
              (2, 0.2510),
              (3, 0.2176),
              (4, 0.1414),
              (5, 0.0735),
              (6, 0.0319),
              (7, 0.0118),
              (8, 0.0038),
              (9, 0.0011),
              (10, 0.0003),
            ),
            bar-width: 0.8,
            style: (stroke: none, fill: schoolBlue),
          )
          plot.add(
            (
              (0, 0.0743),
              (1, 0.2674),
              (2, 0.5184),
              (3, 0.7360),
              (4, 0.8774),
              (5, 0.9510),
              (6, 0.9828),
              (7, 0.9947),
              (8, 0.9985),
              (9, 0.9996),
              (10, 0.9999),
            ),
            style: (stroke: (paint: schoolBlue, dash: "dashed", thickness: 1.5pt)),
            mark: "o",
            mark-style: (fill: schoolBlue, stroke: schoolBlue),
            mark-size: 0.15,
            label: "cdf",
          )
        },
      )
    })
  ]
]

== Snelle herhaling

#examenbox[
  Onderstaande tabel krijg je op het examen. Dit vormt een samenvatting van alles wat we tot nu toe gezien hebben rond discrete willekeurige variabelen.
]

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: (left, left, center, center),
    stroke: none,
    inset: 10pt,
    table.hline(stroke: 1pt),
    table.header([*Random Variable*], [*Probability Distribution*], [*Mean*], [*Variance*]),
    table.hline(stroke: 0.5pt),
    [_General Discrete:_],
    [Table, formula, or graph for $p(x)$],
    [$sum_("all " x) x dot p(x)$],
    [$sum_("all " x) (x - mu)^2 dot p(x)$],
    [_Binomial:_], [$p(x) = binom(n, x) p^x q^(n-x)$], [$n p$], [$n p q$],
    [_Poisson:_], [$p(x) = (lambda^x e^(-lambda)) / x!$], [$lambda$], [$lambda$],
    table.hline(stroke: 1pt),
  )
]













