#import "../../school-template.typ": *

// ============================================================================
//  Hoofdstuk 2 — Signalen: basissignalen en bewerkingen
//  Deel 2: Wiskundige technieken
//  Inhoud deels overgezet uit _OLD/chapters/3_Inleiding systemen.tex
// ============================================================================

= Signalen --- basissignalen en bewerkingen <ch:signalen>

== Wat is een signaal? <sec:wat-is-een-signaal>

// TODO: definitie signaal, continu vs. discreet, periodiek vs. aperiodiek,
// even/oneven, energie- vs. vermogensignalen

== Basissignalen <sec:basissignalen>

=== Stapfunctie (Heaviside-functie) <sec:stapfunctie>

De stapfunctie is een blok dat op een bepaald tijdstip $t_0$ van 0 naar 1
springt.

$ u(t - t_0) = cases(
  0 quad & t < t_0,
  1 quad & t >= t_0,
) $

met:
- $t_0$ --- tijdstip van de sprong [s]
- $u(t - t_0)$ --- amplitude, dimensieloos [-]

#figure(
  cetz.canvas({
    import cetz.draw: *
    // assen
    line((-1, 0), (4, 0), mark: (end: "straight"), name: "x")
    content((4.2, 0), $t$)
    line((0, -0.5), (0, 2), mark: (end: "straight"))
    content((0, 2.3), $u(t - t_0)$)
    // ticks
    line((2, 0.1), (2, -0.1))
    content((2, -0.4), $t_0$)
    line((0.1, 1), (-0.1, 1))
    content((-0.35, 1), $1$)
    // functie
    line((-1, 0), (2, 0), stroke: schoolBlue + 1.5pt)
    line((2, 1), (4, 1), stroke: schoolBlue + 1.5pt)
    line((2, 0), (2, 1), stroke: (dash: "dashed", paint: gray))
    // punten
    circle((2, 0), radius: 0.07, fill: white, stroke: schoolBlue + 1pt)
    circle((2, 1), radius: 0.07, fill: schoolBlue, stroke: schoolBlue)
  }),
  caption: [Stapfunctie $u(t - t_0)$],
) <fig:heaviside>

=== Dirac-deltafunctie <sec:dirac>

De Dirac-deltafunctie is een puls die oneindig smal en oneindig hoog is. De
integraal eronder is altijd gelijk aan 1.

$ delta(t): quad cases(
  delta(t) = 0 quad & t != 0,
  integral_(-oo)^(+oo) delta(t) dif t = 1 quad & #[]
) $

#figure(
  cetz.canvas({
    import cetz.draw: *
    line((-1, 0), (4, 0), mark: (end: "straight"))
    content((4.2, 0), $t$)
    line((0, -0.5), (0, 2), mark: (end: "straight"))
    content((0, 2.3), $delta(t)$)
    line((0, 0.1), (0, -0.1))
    content((-0.3, -0.35), $0$)
    line((0, 0), (0, 1.5), stroke: schoolBlue + 1.5pt, mark: (end: "straight"))
  }),
  caption: [Dirac-deltafunctie $delta(t)$],
) <fig:dirac>

#concept(title: "Waarom de delta zo belangrijk is")[
  De deltafunctie is de "kortst mogelijke tik" die je een systeem kunt geven.
  De respons daarop --- de *impulsresponsie* $h(t)$ --- is de vingerafdruk van
  een LTC-systeem: ken je $h(t)$, dan ken je de respons op *elk* ingangssignaal
  via de convolutie (@sec:convolutie).
]

// TODO: overige basissignalen — rechthoekpuls, driehoekpuls, sinc,
// complexe exponentiële $e^(j omega t)$

== Bewerkingen op signalen <sec:bewerkingen>

// TODO: tijdsverschuiving, tijdsschaling, tijdsomkering, optellen,
// vermenigvuldigen

=== Convolutie <sec:convolutie>

Een convolutie is het schuiven van een functie over een andere functie.

$ (f * g)(t) = integral_(-oo)^(+oo) f(tau) g(t - tau) dif tau $

met:
- $f, g$ --- de twee signalen die geconvolueerd worden
- $tau$ --- integratievariabele (schuifparameter) [s]
- $t$ --- tijdstip waarop de convolutie geëvalueerd wordt [s]

// TODO: grafische interpretatie (spiegelen → verschuiven → vermenigvuldigen →
// integreren), eigenschappen (commutatief, associatief, distributief)

== Filters <sec:filters>

// TODO: laag-, hoog-, band-doorlaat en bandsper; ideaal vs. realiseerbaar
// (wordt verder uitgewerkt bij de Fouriertransformatie, @sec:filters-fourier)
