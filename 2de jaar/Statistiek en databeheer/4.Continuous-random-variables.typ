#import "../../school-template.typ": *


= Continue willekeurige variabelen <ch:continuee-willekeurige-variabelen>

#concept(title: "Discreet vs. Continu")[

  *Discreet = "Telbaar" (Meestal gehele getallen)*\
  In het vorige hoofdstuk hebben we de kansberekening van #keyterm[discrete willekeurige variabelen] bekeken (binomiale en Poisson-verdeling). Dit zijn variabelen met uitkomsten die we kunnen *tellen* en die uitsluitend vaste, losstaande waarden aannemen (zoals $x = 0, 1, 2...$). Er zitten "gaten" of "sprongen" tussen de mogelijke uitkomsten (bv. aantal auto's, aantal keren kop). Ook getallenreeksen zoals schoenmaten (38, 38.5, 39, 39.5) zijn discreet, zolang je van de ene naar de volgende waarde "springt".

  *Continu = "Ononderbroken" (Reële getallen)*\
  In dit hoofdstuk stappen we over op #keyterm[continue willekeurige variabelen]. Dit zijn variabelen die we over het algemeen *meten* (bijv. tijd, temperatuur, lengte) en die niet telbaar zijn. De waarden lopen vloeiend door zonder onderbrekingen. Tussen élke twee waarden zit nog een oneindig aantal andere waarden. Ze zijn irrationaal (Niet omzetbaar in een fractie _ $1/2$_) en kunnen eender welke numerieke waarde aannemen binnen een bepaald interval (inclusief alle decimalen). Dit komt overeen met de verzameling van de reële getallen ($RR$). We gaan hier de #keyterm[normale verdeling], #keyterm[Standaard normaal verdeling] en de #keyterm[uniforme verdeling] bekijken.
]

#figure(
  image("pdf vs pmf.png", width: 10cm),
  caption: [pdf vs pmf],
  label: <fig:pdf-vs-pmf>,
)

*Continue*\
$ P(a <= X <= b) = integral_(a)^(b) (f(x) d x) $

Als je alle kansen neemt onder de curve dan ga je terug 1 uitkomen _zie vorig hoofdstuk_

$ P(-infinity < X < infinity) = integral_(-infinity)^(infinity) (f(x) d x) = 1 $

Als we een random punt nemen op de verdeling dan heeft die geen enkel oppervlakte omdat je over een continue verdeling je over een intifisitimaal klein deeltje spreekt.
$P(a) = 0$

*Discreet*\
Individuele kansen bijna zoals #keyterm("Natuurlijke getallen")
$ P(X = x_i) = f(x_i) $

$ P(-infinity < X < infinity) = sum_(i=1)^(infinity) (f(x_i)) = 1 $

Individuele punten op een discrete verdeling hebben wel een bepaalde kans.
$P(X = X_i) = X_i$

== Gemiddelde, verderdeling... van continue random variabelen <sec:gemiddelde-variantie-standaardafwijking>

#frm(
  "Gemiddelde, variantie en standaardafwijking",
  [

    $ mu = E(x) = integral_(-infinity)^(infinity) (x dot f(x) d x) $
    $ sigma^2 = E((x-mu)^2) = integral_(-infinity)^(infinity) ((x-mu)^2 dot f(x) d x) $

  ],
  [
    met $mu$ het gemiddelde, $sigma^2$ de variantie en $sigma$ de standaardafwijking.
  ],
)

De ideeën van de discrete verdelingen zijn hetzelfde als die van de continue verdelingen

$ sigma^2 = E(x-mu)^2 = integral_(-infinity)^(infinity) ((x-mu)^2 dot f(x) d x) $
$ = integral_(-infinity)^(infinity) (x^2 -2x mu + mu^2) dot f(x) d x $
$ = integral_(-infinity)^(infinity) (x^2 - 2 mu + mu^2 )f(x) d x $

Integraal verdelen over de sommen:

$
  = integral_(-infinity)^(infinity) (x^2 f(x) d x) -underbracket(2 mu integral_(-infinity)^(infinity) (x f(x) d x), 1) + underbracket(mu^2 integral_(-infinity)^(infinity) (f(x) d x), 1)
$

== De uniforme verdeling <sec:uniforme-verdeling>

#wrap-figure(
  image("Uniforme verdeling.png", width: 5cm),
  caption: [Uniforme verdeling],
  label: <fig:uniforme-verdeling>,
)[
  De unifrome kansverdeling is een continue verdeling waarbij alle waarden tussen $c$ en $d$ dezelfde kans hebben. Daarom is het een "uniforme" verdeling.

]

#frm(
  "Uniforme verdeling",
  [
    $ f(x) = 1/(d-c) space space mu = (c+d)/2 $
    $ sigma = (d-c)/(2 sqrt(3)) space space P(a < X < b) = (b-a)/(d-c) $

  ],
  [
    met $c$ het minimum en $d$ het maximum. $a$ en $b$ zijn grenzen waarbinnen de kans wordt berekend.
  ],
)

= De normale verdeling <sec:normale-verdeling>

#concept(title: "Probability density function")[
  De kans dat $x$ een waarde tussen $a$ en $b$ heeft is de oppervlakte onder de kromme tussen $a$ en $b$.
]

De Probabiliteitsdichtheidsfunctie (pdf) van de normale verdeling is:

$ f(x) = 1/(sigma sqrt(2 pi)) e^(-1/2 ((x-mu)/sigma)^2) $

We zeggen dus gewoon "wat is de kans dat $x$ tussen $a$ en $b$ ligt?"
Dat is de functie $f(x)$.

waarbij:
- $mu$ het gemiddelde is
- $sigma$ de standaardafwijking is
- $ pi = 3.14159... $
- $ e = 2.71828... $

$ P(x < a) = integral_(-infinity)^(a) (1/(sigma sqrt(2 pi)) e^(-1/2 ((x-mu)/sigma)^2) d x) $

Wat gebeurt er als we nu een ander gemiddelde nemen  $u_1, u_2, u_3, ...$ met dezelfde standaardafwijking?

#figure(
  image("Drie gemiddelden.png", width: 8cm),
  caption: [Drie gemiddelden],
  label: <fig:drie-gemiddelden>,
)

en wat gebeurt er als we de standaardafwijking veranderen?

#figure(
  image("Standaardafwijking effect.png", width: 8cm),
  caption: [Standaardafwijking effect],
  label: <fig:standaardafwijking-effect>,
)

Al het oppervlakte onze een curve blijft nog steeds 1:
$ integral_(-infinity)^(infinity) f(x) d x = 1 $

== Standaard normale verdeling <sec:standaard-normale-verdeling>
In de standaard normale verdeling is het gemiddelde $mu = 0$ en de standaardafwijking $sigma = 1$.

De standaard normale verdeling heeft een speciale notatie $z$. Dit gewoon de Z-score die we gezien hebben in het eerste hoofdstuk.

#concept(title: "Z-score")[
  De Z-score is de standaardisatie van een normale verdeling. Het geeft aan hoeveel standaardafwijkingen een waarde verwijderd is van het gemiddelde.

  $ z = (x - mu)/sigma $

  Waarbij $mu$ het gemiddelde is en $sigma$ de standaardafwijking.
]

#examenbox[Op toledo staan er allemaal oefeningen van dit hoofdstuk, bekijk ze!]

== Bepaling of het een normaal verdeling is <sec:bepaling-normaal-verdeling>

Hoe gaan we nu bepalen of een verdeling normaal is? Er zijn 4 technieken:

+ Histrogram maken van je sample. Als je een symmetrische, klokvormige verdeling ziet, is het waarschijnlijk een normale verdeling

+ De intervallen tussen het gemiddelde en een waarde x bepalen. $bar(x) +- s, bar(x) +- 2s, bar(x) +- 3s$

+ De IQR (Interquartile Range) berekenen. Als de data normaal is _centraal en gelijk verdeeld_, dan zou $(I Q R)/s approx 1.33$

+ Een normaal waarschijnlijkheidsplot maken. (Dus de kans dat de data normaal verdeeld is, zou de grafiek een rechte lijn moeten zijn.)

#figure(
  image("normaal verdeling plot.png", width: 7cm),
  caption: [normaal verdeling plot],
  label: <fig:normaal-verdeling-plot>,
)

Je ziet dat je een rechte stijgende lijn krijgt, wat aantoont dat de data normaal verdeeld is.


== Joint probabiliteit functies (pmf en pdf) <sec:twee-random-variables>

=== Joint probabiliteit functie (Joint PMF)

De #keyterm[Joint Probability Mass Function] (pmf) wordt gebruikt voor twee (of meer) *discrete* willekeurige variabelen. Het geeft de kans aan dat variabelen $X_1$ en $X_2$ *gelijktijdig* specifieke waarden $x_1$ en $x_2$ aannemen.

#wrap-figure(
  image("Joint probabilty mass function.png", width: 8cm),
  caption: [Joint probability mass function],
  label: <fig:Joint-probabilty-mass-function>,
)[
  In een tabel (zoals hiernaast) staan de mogelijke waarden van $X_1$ en $X_2$ in de rijen en kolommen. De cellen in de tabel bevatten de gezamenlijke kansen $P(X_1 = x_1, X_2 = x_2)$.

  $ X_1: "hoeveelheid wifi baren op je gsm" $
  $ X_2: "De response time" $
  _We gaan dit voor de komende theorie gebruiken_

  *Voorbeeld:*
  Als $x_1 = 2$ en $x_2 = 3$, dan is de gezamenlijke kans:
  $ P_(X_1, X_2)(2, 3) = 0.1 $
]

Een Joint PMF moet voldoen aan drie belangrijke eigenschappen:

+ *Niet-negativiteit*: Voor alle waarden $(x_1, x_2)$ geldt:
  $ P_(X_1, X_2)(x_1, x_2) >= 0 $

+ *Totaliteit*: De som van alle kansen in de volledige tabel moet precies 1 zijn:
  $ sum_(x_1) sum_(x_2) P_(X_1, X_2)(x_1, x_2) = 1 $

+ *Definitie*: De functie geeft de kans op het gelijktijdig voorkomen van beide gebeurtenissen:
  $ P_(X_1, X_2)(x_1, x_2) = P(X_1 = x_1 "en" X_2 = x_2) $


=== Joint density functie

De #keyterm[Joint Probability Density Function] (pdf) beschrijft de gezamenlijke kansverdeling van twee (of meer) continue variabelen tegelijkertijd. In plaats van een lijn (zoals bij 1 variabele), moet je dit zien als een *oppervlak* boven een vlak. De kans is dan het *volume* onder dit oppervlak.

#figure(
  image("Joint PDF.png", width: 10cm),
  caption: [Joint PDF],
  label: <fig:Joint-PDF>,
)

In de figuur hierboven zie je een voorbeeld van een joint uniform verdeling:
- $X_1$ ligt tussen 5 en 10 (breedte = 5).
- $X_2$ ligt tussen 10 en 15 (hoogte = 5).
- Het gezamenlijk gebied $R$ heeft een oppervlakte van $5 times 5 = 25$.
- Omdat het totale volume 1 moet zijn, is de "hoogte" van de functie $f(x_1, x_2) = 1/25$.

De drie eigenschappen in de afbeelding betekenen het volgende:

+ *Niet-negativiteit*: $f_(X_1, X_2)(x_1, x_2) >= 0$
  De kansdichtheid kan nooit negatief zijn. Je kunt geen "negatieve kans" hebben; de grafiek ligt altijd op of boven de as.

+ *Totaliteit*: $integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) f_(X_1, X_2)(x_1, x_2) d x_1 d x_2 = 1$
  Het *totale volume* onder het volledige oppervlak moet precies 1 zijn (overeenkomend met 100% kans). In het voorbeeld: Oppervlakte (25) $times$ Hoogte (1/25) = 1.

+ *Kans als volume*: $P((X_1, X_2) "in" R) = integral_R f_(X_1, X_2)(x_1, x_2) d x_1 d x_2$
  De kans dat een resultaat $(X_1, X_2)$ in een specifiek gebied $R$ valt, is gelijk aan het *volume* van de "kolom" boven dat gebied.

=== Marginale verdelingen (pmf) en (pdf) <marginale-verdelingen>

Soms heb je de gezamenlijke (joint) verdeling van $X_1$ en $X_2$, maar wil je de verdeling van slechts één van de twee weten. Dit noemen we de #keyterm[marginale kansverdeling]. Je gaat hierbij de kansen "projecteren" op één van de assen door te sommeren (discreet) of te integreren (continu) over de andere variabele.

#figure(
  image("Margianel probability density function.png", width: 10cm),
  caption: [Marginale verdelingen],
  label: <fig:Margianel-probability-density-function>,
)

==== Marginale PMF (Discreet)
Bij discrete variabelen vind je de marginale kans door de gezamenlijke kansen in de tabel op te tellen over alle waarden van de *andere* variabele.

$ P_(X_1)(x_1) = sum_(x_2) P_(X_1, X_2)(x_1, x_2) $

*Voorbeeld:* Om de kans te vinden dat $x_1 = 2$ (het totale aantal bars), tel je de kolom van $x_1 = 2$ op:
$ P_(X_1)(x_1 = 2) = 0.1 + 0.1 + 0.03 + 0.02 = 0.25 $

Je kunt exact hetzelfde doen voor $X_2$ door horizontaal op te tellen. Dit geeft de kans op een bepaalde response time, ongeacht het aantal bars.

==== Marginale PDF (Continu)
Bij continue variabelen "sommeren" we via een integraal over de variabele die we willen "verwijderen":

$ f_(X_1)(x_1) = integral_(-infinity)^(+infinity) f_(X_1, X_2)(x_1, x_2) d x_2 $
$ f_(X_2)(x_2) = integral_(-infinity)^(+infinity) f_(X_1, X_2)(x_1, x_2) d x_1 $

In het voorbeeld van de uniforme verdeling (volume $1/25$ over $5 times 5$):
$ f_(X_1)(x_1) = integral_(10)^(15) 1/25 d x_2 = [x_2/25]_(10)^(15) = 15/25 - 10/25 = 1/5 $

==== Kansberekening en verwachtingswaarde via marginale PDF

Met de marginale PDF kunnen we kansen en verwachtingswaarden berekenen voor een individuele variabele, zelfs als we vertrokken zijn van een gezamenlijke verdeling.


*Kansberekening:*\
De kans dat $X_1$ tussen $a$ en $b$ ligt, is de integraal van de marginale PDF over dat interval. Dit komt overeen met een dubbele integraal van de joint PDF waarbij we eerst over $X_2$ integreren (om de marginale PDF te krijgen) en daarna over $X_1$.

$
  P(a < X_1 < b) = integral_a^b f_(X_1)(x_1) d x_1 = integral_a^b [ integral_(-infinity)^(+infinity) f_(X_1, X_2)(x_1, x_2) d x_2 ] d x_1
$

*Verwachtingswaarde:*\
Het gemiddelde of de verwachtingswaarde $E(X_1)$ berekenen we door $x_1$ te vermenigvuldigen met de marginale dichtheid en te integreren over het hele bereik.

$
  mu_(X_1) = E(X_1) = integral_(-infinity)^(+infinity) x_1 dot f_(X_1)(x_1) d x_1 = integral_(-infinity)^(+infinity) x_1 [ integral_(-infinity)^(+infinity) f_(X_1, X_2)(x_1, x_2) d x_2 ] d x_1
$

== Independence en covariance <sec:independence-en-covariance>

