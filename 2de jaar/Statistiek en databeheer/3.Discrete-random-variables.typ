#import "../../school-template.typ": *

= Hoofdstuk 4 Discrete random variables <ch:discrete-random-variables>

== Inhoud <sec:inhoud>

We gaan een notatie definiëren voor discrete random variabelen en de kansverdeling _binomiaal_ en _poisson_ verdeling.

== Random variable <sec:random-variable>

Dit zijn gewoon manieren over hoe we de uitkomsten van een experiment kunnen voorstellen. Je kunt oftewel discrete of continue random variabelen hebben. Gewoon de namen voor oftewel #keyterm[natuurlijke getallen] of #keyterm[reële getallen].

#concept(title: "Random variable")[

  Dit is een variable dat een numerieke waarde toekent aan elk mogelijke uitkomst van een experiment.

  Een kop of munt heeft 4 mogelijke uitkomsten:
  - Kop - Kop
  - Kop - Munt
  - Munt - Kop
  - Munt - Munt

  De random variable X kan dan de volgende waarden aannemen:
  $ X = 2, 1, 1, 0 $

  Je hebt hier twee types:

  + *discrete random variable*

    Dit is een element van de verzameling van alle #keyterm[natuurlijke getallen].
    $ X = x_1, x_2, x_3, x_4 dots x_n $


    Dit zijn volledige numbers zoals:
    - 1,2,3...
    - aantallen van iets
    - Worpen, goals, ...

  + *continue random variable*

    Dit is een element van de verzameling van alle #keyterm[reële getallen].
    $ X epsilon.alt RR $

    Dit zijn getallen met een oneindig aantal decimalen zoals:
    - 1,23456789...
    - lengtes
    - gewichten
    - ...
]

== Kansverdeling van discrete random variables <sec:kansverdeling>

Een kansverdeling is hoe de kansen verdeeld worden afhankelijk van meerdere events. De kansverdeling van kop of munt is gewoon 50/50. Je kunt deze kansen dan plotten in een grafiek.

De kansverdeling van twee dobbelstenen kopen ziet er als volgt uit:

#figure(
  image("kansverdeling-2dobbelstenen.png", width: 6cm),
  caption: [kansverdeling-2dobbelstenen],
  label: <fig:kansverdeling-2dobbelstenen>,
)

Je ziet dat de kans op 7 het grootst is. Dit komt omdat er meer combinaties zijn om 7 te gooien.


== Verwachte waarden van discrete random variables <sec:expected-values>

Wat is nu het gemiddelde van die kansverdeling? Wat is de spreiding? Hoe gaan we hier nu meer werken? Dit is al deels gezien in _intro tot statistiek_. De ideeën worden dus niet herhaal. Maar de formules zijn anders omdat we niet met normaal verdelingen werken.


$mu = E(X) = sum(x p (x) = sum_i=1^n n c_1 (p x_i))$

$ sigma^2 = E[(x-mu)^2] = sum(x-mu)^2 p(x) = sum_i=1^n (x_i - mu)^2 p(x_i) = n p (1-p) $

$ sigma = sqrt(sigma^2) = sqrt(n p (1-p)) $


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
  image("cheby VS emperical.png", width: 10cm),
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

  *$mu = E(x)$?*

  $ mu = E(x) = sum x p(x) $
  $
    mu & = 0(0.002) + 1(0.029) + 2(0.132) \
       & + 3(0.309) + 4(0.360) + 5(0.168) \
       & = 3.50
  $

  #figure(
    image("histrogram-huidskankeroefening.png", width: 6cm),
    caption: [histrogram-huidskankeroefening],
    label: <fig:histrogram-huidskankeroefening>,
  )

  *$sigma$?*

  $
    sigma^2 & = E[(x - mu)^2] = sum (x - mu)^2 p(x) \
            & = (0-3.5)^2(0.002) + (1-3.5)^2(0.029) + (2-3.5)^2(0.132) \
            & + (3-3.5)^2(0.309) + (4-3.5)^2(0.360) + (5-3.5)^2(0.168) \
            & = 1.05
  $

  $ sigma = sqrt(1.05) approx 1.02 $

  *Gebruik Chebyshev's rule of empirical rule*

  $ mu +- 2 sigma = [1.46, 5.54] $

  - Minstens 75% (Chebyshev)
  - Ongeveer 95% (Empirical rule)

  _In de video gebruiken ze de chebyshev's regel maar je kunt ook zeggen dat het een gelijke verdeling is en dus de empirische regel gebruiken._

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










