#import "../../school-template.typ": *


= Continue willekeurige variabelen <ch:continuee-willekeurige-variabelen>

#concept(title: "Discreet vs. Continu")[
  - *Discreet = "Telbaar" (Meestal gehele getallen)*: In het vorige hoofdstuk hebben we de kansberekening van #keyterm[discrete willekeurige variabelen] bekeken (binomiale en Poisson-verdeling). Dit zijn variabelen met uitkomsten die we kunnen *tellen* en die uitsluitend vaste, losstaande waarden aannemen (zoals $x = 0, 1, 2...$). Er zitten "gaten" of "sprongen" tussen de mogelijke uitkomsten (bv. aantal auto's, aantal keren kop). Ook getallenreeksen zoals schoenmaten (38, 38.5, 39, 39.5) zijn discreet, zolang je van de ene naar de volgende waarde "springt".
  - *Continu = "Ononderbroken" (Reële getallen)*: In dit hoofdstuk stappen we over op #keyterm[continue willekeurige variabelen]. Dit zijn variabelen die we over het algemeen *meten* (bijv. tijd, temperatuur, lengte) en die niet telbaar zijn. De waarden lopen vloeiend door zonder onderbrekingen. Tussen élke twee waarden zit nog een oneindig aantal andere waarden. Ze zijn irrationaal (Niet omzetbaar in een fractie _ $1/2$_) en kunnen eender welke numerieke waarde aannemen binnen een bepaald interval (inclusief alle decimalen). Dit komt overeen met de verzameling van de reële getallen ($RR$). We gaan hier de #keyterm[normale verdeling], #keyterm[Standaard normaal verdeling] en de #keyterm[uniforme verdeling] bekijken.
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

    $ mu = E(x) = integral_(-infinity)^(infinity) (x * f(x) d x) $
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
De unifrome kansverdeling

