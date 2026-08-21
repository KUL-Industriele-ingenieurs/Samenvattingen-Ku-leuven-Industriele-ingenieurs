#import "../../school-template.typ": *

// ===========================================================================
// Native Typst-versie van assets/StatisticsFormulaChart.pdf (11 A4-liggend).
// Doel: hetzelfde officiele examenformularium, maar in het staande formaat en
// de typografie van de samenvatting, zodat het niet meer als losse ingesloten
// PDF-pagina's in het document zit.
//
// Inhoudelijk 1-op-1 met de chart 2025-2026. Voeg hier NIETS aan toe wat niet
// op de chart staat -- dan wijkt je oefenmateriaal af van wat je op het examen
// krijgt. (De chart bevat bewust geen z-, t-, F- of chi-kwadraattabellen.)
// ===========================================================================

#let fk(body) = block(
  width: 100%,
  inset: (x: 8pt, y: 6pt),
  radius: 3pt,
  fill: schoolOrange.lighten(94%),
  stroke: (left: 2pt + schoolOrange),
  body,
)

#let rij(naam, formule) = (
  text(size: 0.9em)[#naam],
  align(center)[#formule],
)

= Formularium <ch:formularium>

#NOTE("Dit is de omzetting van de officiele Formula Chart Statistics 2025-2026 (Statistics and Data Management). Controleer bij het begin van het semester of de chart ongewijzigd is.")

== Kansrekening <sec:frm-kansrekening>

#table(
  columns: (auto, 1fr),
  align: (left + horizon, center + horizon),
  stroke: 0.4pt + luma(200),
  inset: 7pt,
  ..rij([$A$ en $B$ sluiten elkaar uit], $P(A inter B) = 0$),
  ..rij([Unie: $A$ of $B$], $P(A union B) = P(A) + P(B) - P(A inter B)$),
  ..rij([Doorsnede, onafhankelijk], $P(A inter B) = P(A) P(B)$),
  ..rij([Doorsnede, afhankelijk], $P(A inter B) = P(A|B) P(B) = P(B|A) P(A)$),
  ..rij([Complement: niet $A$], $P(A^c) = 1 - P(A)$),
  ..rij([Voorwaardelijk, onafhankelijk], $P(A|B) = P(A)$),
  ..rij([Voorwaardelijk, afhankelijk], $ P(A|B) = P(A inter B) / P(B) $),
)

#fk[
  *Regel van Bayes* --- gegeven $B_1, ..., B_k$ die elkaar uitsluiten en samen alles dekken:
  $ P(B_i|A) = P(B_i inter A) / P(A) = (P(B_i) P(A|B_i)) / (P(B_1) P(A|B_1) + ... + P(B_k) P(A|B_k)) $
]

== Combinatoriek <sec:frm-combinatoriek>

- *Productregel* --- trek je één element uit elk van $k$ verzamelingen met groottes $n_1, ..., n_k$, dan is het aantal mogelijkheden $n_1 n_2 ... n_k$.
- *Permutaties* --- trek je $n$ verschillende elementen uit een verzameling van grootte $N$ én telt de volgorde mee:
  $ N! / (N-n)! $
- *Combinaties* --- trek je $n$ verschillende elementen uit een verzameling van grootte $N$ zonder rekening te houden met de volgorde:
  $ binom(N, n) = N! / (n! (N-n)!) $

== Kwantitatieve data <sec:frm-kwantitatieve-data>

#fk[
  $ sigma^2 = 1/N sum_(i=1)^N (x_i - mu)^2 wide s^2 = 1/(n-1) sum_(i=1)^n (x_i - overline(x))^2 $
  met $sigma^2$ de populatievariantie en $s^2$ de steekproefvariantie.
]

== Discrete random variabelen <sec:frm-discreet>

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left + horizon, center + horizon, center + horizon, center + horizon),
  stroke: 0.4pt + luma(200),
  inset: 6pt,
  table.header(
    text(size: 0.85em, weight: "bold")[Variabele],
    text(size: 0.85em, weight: "bold")[Kansverdeling],
    text(size: 0.85em, weight: "bold")[$mu$],
    text(size: 0.85em, weight: "bold")[$sigma^2$],
  ),
  text(size: 0.9em)[Algemeen discreet],
  text(size: 0.85em)[tabel, formule of grafiek voor $P(x)$],
  $ sum_("alle" x) x P(x) $,
  $ sum_("alle" x) (x - mu)^2 P(x) $,

  text(size: 0.9em)[Binomiaal],
  $ P(x) = binom(n, x) p^x q^(n-x) $,
  $n p$,
  $n p q$,

  text(size: 0.9em)[Poisson],
  $ P(x) = (lambda^x e^(-lambda)) / x! $,
  $lambda$,
  $lambda$,
)

met $p$ de kans op succes bij één trekking, $q = 1 - p$, $n$ het aantal trekkingen, $x$ het aantal successen, en $lambda$ het verwachte aantal gebeurtenissen per tijds-, oppervlakte- of volume-eenheid.

== Continue random variabelen <sec:frm-continu>

Algemeen, voor een continue random variabele met kansdichtheidsfunctie $f(x)$:

#fk[
  $ P(a < x < b) = integral_a^b f(x) dif x wide integral_(-oo)^(+oo) f(x) dif x = 1 wide P(x = a) = 0 $
  $ mu = E(x) = integral_(-oo)^(+oo) x f(x) dif x wide sigma^2 = E(x^2) - mu^2 = integral_(-oo)^(+oo) x^2 f(x) dif x - mu^2 $
]

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left + horizon, center + horizon, center + horizon, center + horizon),
  stroke: 0.4pt + luma(200),
  inset: 6pt,
  table.header(
    text(size: 0.85em, weight: "bold")[Variabele],
    text(size: 0.85em, weight: "bold")[Kansverdeling],
    text(size: 0.85em, weight: "bold")[$E(x) = mu$],
    text(size: 0.85em, weight: "bold")[$sigma^2$],
  ),
  text(size: 0.9em)[Uniform op $[c, d]$], $ f(x) = 1/(d-c) $, $ (c+d)/2 $, $ (d-c)^2/12 $,
  text(size: 0.9em)[Normaal], $ f(x) = 1/(sigma sqrt(2 pi)) e^(-1/2 ((x-mu)/sigma)^2) $, $mu$, $sigma^2$,
  text(size: 0.9em)[Standaardnormaal], $ f(x) = 1/sqrt(2 pi) e^(-1/2 x^2) $, $0$, $1$,
)

*Lineaire combinaties.* Zijn $X_1, ..., X_n$ random variabelen en $a_1, ..., a_n$ en $b$ reële getallen, dan geldt voor $X = a_1 X_1 + ... + a_n X_n + b$:

$ E(X) = a_1 E(X_1) + ... + a_n E(X_n) + b $

en als $X_1, ..., X_n$ bovendien onderling onafhankelijk zijn:

$ "Var"(X) = a_1^2 "Var"(X_1) + ... + a_n^2 "Var"(X_n) $

== Eén steekproef: toetsen en betrouwbaarheidsintervallen <sec:frm-een-steekproef>

=== Kwalitatieve data

Twee uitkomsten ($S$ en $F$), doelparameter $p$ = fractie $S$. Met $hat(p)$ de fractie $S$ in de steekproef en $hat(q) = 1 - hat(p)$. We veronderstellen een grote steekproef: $n hat(p) >= 15$ en $n hat(q) >= 15$.

#fk[
  $ hat(p) plus.minus z_(alpha\/2) sqrt((hat(p) hat(q))/n) wide z = (hat(p) - p_0)/sqrt(p_0 q_0 \/ n) $
  links het $(1-alpha)100 %$ betrouwbaarheidsinterval, rechts de toetsingsgrootheid.
]

#NOTE("Bij een kleine steekproef (n*p-hat < 15 of n*q-hat < 15) hoort de Wilson-correctie -- de chart vermeldt die expliciet als 'not discussed'.")

=== Kwantitatieve data

Doelparameter $mu$ = populatiegemiddelde.

*Grote steekproef* ($n >= 30$), voor elke populatieverdeling:

#fk[
  $ overline(x) plus.minus z_(alpha\/2) sigma/sqrt(n) wide z = (sqrt(n) (overline(x) - mu_0))/sigma $
  Gebruik $s$ als schatting van $sigma$ wanneer $sigma$ onbekend is.
]

*Kleine steekproef* ($n < 30$), normaal verdeelde populatie met gekende $sigma$: gebruik de methode voor grote steekproeven.

*Kleine steekproef* ($n < 30$), normaal verdeelde populatie met onbekende $sigma$:

#fk[
  $ overline(x) plus.minus t_(alpha\/2) s/sqrt(n) wide t = (sqrt(n) (overline(x) - mu_0))/s $
  Kritieke waarden uit een $t$-verdeling met $n - 1$ vrijheidsgraden.
]

== Twee steekproeven: toetsen en betrouwbaarheidsintervallen <sec:frm-twee-steekproeven>

=== Kwalitatieve data

Doelparameter $p_1 - p_2$. Onafhankelijke en grote steekproeven: $n_1 hat(p)_1 >= 15$, $n_1 hat(q)_1 >= 15$, $n_2 hat(p)_2 >= 15$, $n_2 hat(q)_2 >= 15$.

#fk[
  $ hat(p) = (x_1 + x_2)/(n_1 + n_2) wide hat(q) = 1 - hat(p) $
  $ hat(p)_1 - hat(p)_2 plus.minus z_(alpha\/2) sqrt((hat(p)_1 hat(q)_1)/n_1 + (hat(p)_2 hat(q)_2)/n_2) wide z = (hat(p)_1 - hat(p)_2 - p_0)/sqrt(hat(p) hat(q) (1/n_1 + 1/n_2)) $
]

=== Kwantitatieve data: gemiddelden vergelijken

Doelparameter $mu_1 - mu_2$.

*Gepaarde steekproeven.* Grote steekproef ($n_d >= 30$), elke verdeling van de populatie van verschillen:

#fk[
  $ overline(x)_d plus.minus z_(alpha\/2) sigma_d/sqrt(n_d) wide z = (sqrt(n_d) (overline(x)_d - D_0))/sigma_d $
  Gebruik $s_d$ als schatting van $sigma_d$ wanneer $sigma_d$ onbekend is.
]

Kleine steekproef ($n_d < 30$), normaal verdeelde populatie van verschillen met gekende $sigma_d$: gebruik de methode voor grote steekproeven. Met onbekende $sigma_d$:

#fk[
  $ overline(x)_d plus.minus t_(alpha\/2) s_d/sqrt(n_d) wide t = (sqrt(n_d) (overline(x)_d - D_0))/s_d $
  Kritieke waarden uit een $t$-verdeling met $n_d - 1$ vrijheidsgraden.
]

*Onafhankelijke steekproeven.* Grote steekproeven ($n_1 >= 30$ en $n_2 >= 30$), elke populatieverdeling:

#fk[
  $ overline(x)_1 - overline(x)_2 plus.minus z_(alpha\/2) sqrt(sigma_1^2/n_1 + sigma_2^2/n_2) wide z = (overline(x)_1 - overline(x)_2 - D_0)/sqrt(sigma_1^2/n_1 + sigma_2^2/n_2) $
  Gebruik $s_1$ en $s_2$ als schatting van $sigma_1$ en $sigma_2$ wanneer de varianties onbekend zijn.
]

Kleine steekproef ($n_1 < 30$ of $n_2 < 30$), normaal verdeelde populaties met gekende $sigma_1$ en $sigma_2$: gebruik de methode voor grote steekproeven. Onder de aanname $sigma_1 = sigma_2$:

#fk[
  $ s_p^2 = ((n_1 - 1) s_1^2 + (n_2 - 1) s_2^2)/(n_1 + n_2 - 2) $
  $ overline(x)_1 - overline(x)_2 plus.minus t_(alpha\/2) sqrt(s_p^2 (1/n_1 + 1/n_2)) wide t = (overline(x)_1 - overline(x)_2 - D_0)/sqrt(s_p^2 (1/n_1 + 1/n_2)) $
  Kritieke waarden uit een $t$-verdeling met $n_1 + n_2 - 2$ vrijheidsgraden.
]

=== Kwantitatieve data: varianties vergelijken

Doelparameter $sigma_1^2 \/ sigma_2^2$, voor onafhankelijke steekproeven uit twee normaal verdeelde populaties.

#fk[
  $ F = s_1^2/s_2^2 $
  Eenzijdige toets: neem zonder verlies van algemeenheid $H_a: sigma_1^2 > sigma_2^2$. Tweezijdige toets: neem zonder verlies van algemeenheid $s_1^2 > s_2^2$. Kritieke waarde uit een $F$-verdeling met $n_1 - 1$ vrijheidsgraden in de teller en $n_2 - 1$ in de noemer.
]

== ANOVA <sec:frm-anova>

$k$ behandelingsgemiddelden vergelijken, met

$ H_0: mu_1 = mu_2 = ... = mu_k $
$ H_a: "minstens twee behandelingsgemiddelden verschillen" $

#fk[
  $ "SST" = sum_(i=1)^k n_i (overline(x)_i - overline(x))^2 wide "MST" = "SST"/(k-1) $
  $ "SSE" = sum_(j=1)^(n_1) (x_(1j) - overline(x)_1)^2 + ... + sum_(j=1)^(n_k) (x_(k j) - overline(x)_k)^2 wide "MSE" = "SSE"/(n-k) $
  $ F = "MST"/"MSE" $
  Kritieke waarde voor $F > F_alpha$ uit een $F$-verdeling met $k - 1$ vrijheidsgraden in de teller en $n - k$ in de noemer.
]

*Bonferroni --- betrouwbaarheidsintervallen voor meervoudige vergelijkingen.* Voor elk paar behandelingen $i, j$:

#fk[
  $ overline(x)_i - overline(x)_j plus.minus t_(alpha\/(2c)) s sqrt(1/n_i + 1/n_j) $
  met $c$ het aantal paarsgewijze vergelijkingen, $s = sqrt("MSE")$, en $t_(alpha\/(2c))$ uit een $t$-verdeling met $n - k$ vrijheidsgraden.
]

== Enkelvoudige lineaire regressie <sec:frm-regressie>

*Model en aannames.* $y = beta_1 x + beta_0 + epsilon$, met $epsilon$ normaal verdeeld en onafhankelijk van $x$, waarbij $E(epsilon) = 0$ en $"Var"(epsilon) = sigma^2$.

#fk[
  $ "SS"_(x x) = sum_i (x_i - overline(x))^2 wide "SS"_(y y) = sum_i (y_i - overline(y))^2 wide "SS"_(x y) = sum_i (x_i - overline(x))(y_i - overline(y)) $
]

#fk[
  $ hat(beta)_1 = "SS"_(x y)/"SS"_(x x) wide hat(beta)_0 = overline(y) - hat(beta)_1 overline(x) $
  $ s^2 = "SSE"/(n-2) quad "met" quad "SSE" = "SS"_(y y) - hat(beta)_1 "SS"_(x y) $
  $ r = "SS"_(x y)/sqrt("SS"_(x x) "SS"_(y y)) $
  met $r$ de correlatiecoefficient, een maat voor de sterkte van het lineaire verband.
]

*Toetsen voor de helling $beta_1$:*

#fk[
  $ hat(beta)_1 plus.minus t_(alpha\/2) s/sqrt("SS"_(x x)) wide t = (hat(beta)_1 sqrt("SS"_(x x)))/s $
  Kritieke waarden uit een $t$-verdeling met $n - 2$ vrijheidsgraden.
]
