#import "../../school-template.typ": *

// ============================================================================
//  Hoofdstuk 3 — De Laplacetransformatie
//  Deel 2: Wiskundige technieken
//  Skelet overgezet uit _OLD/chapters/4_Laplacetransformatie.tex
// ============================================================================

= De Laplacetransformatie <ch:laplace>

== Wat is de Laplacetransformatie? <sec:wat-is-laplace>

#concept(title: "Aanrader")[
  Deze video legt de Laplacetransformatie op een mooie wiskundige manier uit:
  #link("https://www.youtube.com/watch?v=j0wJBEZdwLs")[youtube.com/watch?v=j0wJBEZdwLs].
]

// TODO: definitie eenzijdige/tweezijdige Laplace, convergentiegebied (ROC),
// motivatie: differentiaalvergelijking → algebraïsche vergelijking in $s$

== Eigenschappen van de Laplacetransformatie <sec:laplace-eigenschappen>

// TODO: lineariteit, tijdsverschuiving, frequentieverschuiving, schaling,
// differentiatie- en integratiestelling, begin- en eindwaardestelling

=== Convolutiestelling <sec:laplace-convolutie>

// TODO: convolutie in tijdsdomein = product in s-domein

== Inverse Laplacetransformatie <sec:inverse-laplace>

// TODO: partieelbreuksplitsing, tabelgebruik, complexe polen

== Laplace bij eerste- en tweede-orde systemen <sec:laplace-systemen>

=== Eerste-orde ODE oplossen met Laplace <sec:laplace-eerste-orde-ode>

In @sec:eerste-orde-ldv losten we de standaardvorm
$ y'(t) = k y(t) + f(t) $
op via een integrerende factor, met als resultaat
@eq:algemene-oplossing-eerste-orde --- een integraal die je telkens
opnieuw moet uitrekenen. Met Laplace verdwijnt die integraal volledig: een
differentiaalvergelijking wordt een *algebraïsche* vergelijking in $s$, die
je gewoon oplost naar $Y(s)$.

*Transformeer de ODE.* Met de differentiatiestelling
$cal(L){y'(t)} = s Y(s) - y(0)$ (@sec:laplace-eigenschappen) wordt de
standaardvorm:
$ s Y(s) - y(0) = k Y(s) + F(s) $

*Los algebraïsch op naar $Y(s)$* (breng alle $Y(s)$-termen samen):
$ Y(s)(s - k) = F(s) + y(0) quad => quad
  Y(s) = underbrace(F(s)/(s-k), "nultoestandsrespons")
  + underbrace(y(0)/(s-k), "nulinvoerrespons") $

met:
- *nultoestandsrespons* --- het deel van $Y(s)$ dat van de ingang $F(s)$
  komt (alsof $y(0)=0$): het Laplace-equivalent van de *particuliere*
  oplossing van daarnet
- *nulinvoerrespons* --- het deel dat van de beginvoorwaarde $y(0)$ komt
  (alsof $f(t)=0$): het equivalent van de *homogene* oplossing

Geen integraal meer nodig: je haalt $Y(s)$ rechtstreeks uit tabelwerk en
partieelbreuksplitsing (@sec:inverse-laplace).

*Toepassing: de wagen.* We nemen het wagen-voorbeeld uit
@sec:voorbeeld-wagen-ode over, met $f(t) equiv F$ constant voor $t>0$:
$ v'(t) = -beta/m v(t) + F/m $

*Stap 1 --- transformeer* (met $v(0)$ de beginsnelheid):
$ s V(s) - v(0) = -beta/m V(s) + 1/m F(s) $

*Stap 2 --- vermenigvuldig met $m$ om de breuken weg te werken:*
$ m s V(s) - m v(0) = -beta V(s) + F(s) $

*Stap 3 --- breng de $V(s)$-termen samen en los op:*
$ V(s)(m s + beta) = F(s) + m v(0) quad => quad
  V(s) = underbrace(F(s)/(m s + beta), "nultoestandsrespons")
  + underbrace((m v(0))/(m s + beta), "nulinvoerrespons") $

*Nulinvoerrespons.* Met het standaard Laplace-paar
$1/(s+a) <-> e^(-a t) u(t)$:
$ cal(L)^(-1) {(m v(0))/(m s + beta)} = cal(L)^(-1) {v(0)/(s+beta/m)}
  = v(0) e^(-beta/m t) u(t) $
Bij ons is de wagen initieel in rust, $v(0)=0$, dus deze term valt
volledig weg --- net als $K=0$ bij de integrerende-factor-aanpak.

*Nultoestandsrespons.* De ingang is een stapfunctie met amplitude $F$:
$f(t) = F u(t) => F(s) = F/s$. Invullen en partieelbreuksplitsen:
$ F(s)/(m s + beta) = F/(s(m s + beta)) = A/s + B/(m s + beta) $
Tellers gelijkstellen, $F = A(m s + beta) + B s$: bij $s=0$ volgt
$A = F/beta$; de coëfficiënt van $s$ vergelijken geeft $B = -(F m)/beta$.
Dus:
$ F/(s(m s + beta)) = F/beta dot 1/s - F/beta dot 1/(s + beta/m) $
Terugtransformeren met dezelfde twee standaardparen
($1/s <-> u(t)$ en $1/(s+a) <-> e^(-a t)u(t)$):
$ v(t) = F/beta u(t) - F/beta e^(-beta/m t) u(t)
  = F/beta (1-e^(-beta/m t)) u(t) $

*Vergelijk met @sec:voorbeeld-wagen-ode:* exact hetzelfde antwoord,
$v(t) = F/beta (1-e^(-beta/m t))$ voor $t>0$ --- enkel met minder rekenwerk
(algebra in plaats van een integraal), en met de stapfunctie $u(t)$ er nu
expliciet bij, omdat Laplace het signaal formeel voor alle $t$ beschrijft
(en dus ook stelt dat $v(t)=0$ voor $t<0$).

*RC-circuit --- zelfde recept.* Met dezelfde stappen op
$v_o'(t) = -1/(R C) v_o (t) + 1/(R C) v_i (t)$ (@sec:voorbeeld-rc-ode), met
$v_o (0) = 0$ en $v_i (t) = V_i u(t) => V_i (s) = V_i \/ s$:
$ V_o (s) = (V_i \/ s)/(R C s + 1) = V_i/(R C) dot 1/(s(s+1/(R C))) $
Dezelfde partieelbreuksplitsing (patroon identiek, met $a=1\/(R C)$) geeft
opnieuw
$ v_o (t) = V_i (1 - e^(-t\/(R C))) u(t) $
--- dezelfde uitkomst als in @sec:voorbeeld-rc-ode.

*Key insight:* de integrerende-factor-methode en Laplace zijn twee wegen
naar exact dezelfde oplossing. Laplace wint het in de praktijk: zodra je de
eigenschappen en een tabel van paren kent (@sec:laplace-eigenschappen,
@sec:inverse-laplace), reduceert *elke* eerste-orde ODE tot algebra ---
transformeren, oplossen naar $Y(s)$, partieelbreuken, terugtransformeren ---
zonder ooit nog een integraal met de hand te moeten uitrekenen.

// TODO: standaardvormen, tijdconstante $tau$, dempingsfactor $zeta$ en
// eigenpulsatie $omega_n$, stap- en impulsresponsie voor tweede-orde
// systemen
