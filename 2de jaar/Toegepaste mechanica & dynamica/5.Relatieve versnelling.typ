#import "../../school-template.typ": *

= Relatieve versnelling

In de vorige hoofdstukken bekeken we de relatieve snelheid $v$.
In dit hoofdstuk gaan we verder met de relatieve versnelling $a$.

$ v_B = v_A + v_frac(B, A, style: "horizontal") $
$ arrow.b.double (d/(d t)) $
$
  a_B = a_A + underbrace(a_frac(B, A, style: "horizontal"), a_frac(B, A, style: "horizontal")t + a_frac(B, A, style: "horizontal")n)
$

We kunnen $a_frac(B, A, style: "horizontal")$ opdelen in twee versnelllngen: de tangentiële versnelling $a_frac(B, A, style: "horizontal")t$ en de normale versnelling $a_frac(B, A, style: "horizontal")n$.

#figure(
  image("assets/Relatieve versnelling.png", width: 6cm),
  caption: [Relatieve versnelling],
  label: <fig:Relatieve-versnelling>,
)

Je kunt dan net zoals bij snelheid de versnelling opsplitsen relatief tot een ander punt.
B wordt een getransleert in relatie met A en dan wordt er een rotatie toegepast op B in relatie met A. Daar komen dan de tangentiële versnelling en de normale versnelling vandaan.

#figure(
  image("assets/relatieve versnelling opdeling.png", width: 10cm),
  caption: [relatieve versnelling opdeling],
  label: <fig:relatieve-versnelling-opdeling>,
)

De formules bij de tangentiële en normale versnelling zijn:

#frm(
  "Tangentiele & normale versnelling",
  [$
    a_frac(B, A, style: "horizontal")t = d/(d t) (v_frac(B, A, style: "horizontal")) = d/ (d t) (omega crossproduct r_frac(B, A, style: "horizontal")) = alpha crossproduct r_frac(B, A, style: "horizontal")
  $\ $
    a_frac(B, A, style: "horizontal")n = omega crossproduct (omega crossproduct r_frac(B, A, style: "horizontal")) = -omega^2 r_frac(B, A, style: "horizontal")
  $],
  [
    met $alpha$ de hoekversnelling, $r_frac(B, A, style: "horizontal")$ de afstand van A tot B, en $omega$ de hoeksnelheid.
  ],
)

* Te samen*
$ a_B = a_A + alpha crossproduct r_frac(B, A, style: "horizontal") - omega^2 r_frac(B, A, style: "horizontal") $

== OR bij versnelling

Stel je nu een OR voor bij de vorige tekening. Je ziet dat A een snelheid $a_A$ en een snelheid heeft $v_A$ en dat B een versnelling $a_frac(B, A, style: "horizontal")$ en ook een snelheid $v_B$ heeft. De hoeksnelheid $omega arrow.ccw.half$ is in een tegengestelde richting als de hoekversnelling $alpha arrow.cw.half$.
#figure(
  image("assets/snelheid en versnelling.png", width: 8cm),
  caption: [snelheid en versnelling],
  label: <fig:snelheid-en-versnelling>,
)
Je hebt hier dus twee heel andere fenomenen want de snelheid tegenover de OR en de versnelling tegenover A zijn niet hetzelfde.
Dus om de absolute versnelling van B te vinden heb je de relatieve versnelling tegenover A nodig maar ook de absolute versnelling van A nodig.

$ a_B = a_A + a_frac(B, A, style: "horizontal") $
$ arrow.b.double $
$ a_B = a_A + a_frac(B, A, style: "horizontal")t + a_frac(B, A, style: "horizontal")n $
$ arrow.b.double $
$ a_B = a_A + alpha crossproduct r_frac(B, A, style: "horizontal") - omega^2 r_frac(B, A, style: "horizontal") $

== Oefeningen
#TODO[oefeningen toevoegen]
