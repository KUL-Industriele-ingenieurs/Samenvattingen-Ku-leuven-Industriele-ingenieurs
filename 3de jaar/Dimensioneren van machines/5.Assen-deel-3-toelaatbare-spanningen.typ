#import "../../school-template.typ": *

= Assen deel 3: toelaatbare spanningen <ch:assen-3>

// Bron: Slides/5.Assen deel 3 - toelaatbare spanningen.DIMA.pdf (Roloff/Matek H3, H11)
// Notes: 5.Veranderde belasting klassificatie, 5.vermoeiingssterktediagramma,Smith diagramma

== Recap: vergelijkingsspanning <sec:recap-vergelijkingsspanning>

#TODO[slide 3: uniaxiale spanning die even gevaarlijk is als de combinatie van buiging en wringing]

== Belasting en belastingssoorten <sec:belastingssoorten>

#TODO[slides 6–12: tijdsafhankelijkheid, statisch / zwellend / wisselend, bedrijfsfactor]

== Materiaaleigenschappen <sec:materiaaleigenschappen>

#TODO[slides 14–22: grootte-invloed, kerfwerking]

== Dynamische sterkte <sec:dynamische-sterkte>

#TODO[slides 24–29: vermoeiingsbreuk, ontwerp op vermoeiing]

== Statische en dynamische belasting <sec:statisch-dynamisch>

=== Vermoeiingssterktediagram van Smith <sec:smith>

#TODO[slides 31–37: $sigma_m = 0$ → wisselsterkte, $sigma_o = 0$ → zwelsterkte]

#figure(
  image("assets/L5-smith.png", width: 12cm),
  caption: [Vermoeiingssterktediagram van Smith (slide 32)],
) <fig:L5-smith>

== Veiligheid <sec:veiligheid>

#TODO[slide 38: waarden $S_min$ voor taai/bros]

#figure(
  image("assets/L5-veiligheid.png", width: 12cm),
  caption: [Bedrijfsfactor en zekerheidsfactor (slide 38)],
) <fig:L5-veiligheid>

#frm(
  "Toelaatbare spanning",
  $ sigma_"tol" = sigma_"grens" / ("bedrijfsfactor" dot "zekerheid") = sigma_"grens" / S $,
  [met: $sigma_"grens"$ --- grensspanning van het materiaal [MPa], $S$ --- veiligheidsfactor [-]],
)
