#import "../../school-template.typ": *

= Assen deel 1: draagas en aandrijfas <ch:assen-1>

// Bron: Slides/3.Assen deel 1 - draagas en aandrijfas.DIMA.pdf (Roloff/Matek H11)
// Notes: 3.Analyse assen

== Classificatie <sec:assen-classificatie>

#TODO[slides 4–10: draagassen (buiging, geen torsie) vs. aandrijfassen; toepassingen; speciale assen]

#figure(
  image("assets/L3-classificatie.png", width: 12cm),
  caption: [Classificatie: draagassen (slide 4)],
) <fig:L3-classificatie>

== Analyse draagas <sec:draagas>

#TODO[slides 12–14]

=== Dimensioneren draagas <sec:draagas-dimensioneren>

#TODO[slides 15–22]

== Analyse aandrijfas <sec:aandrijfas>

#TODO[slides 24–29: belastingen op de as]

=== Dwarskracht en buigmoment <sec:aandrijfas-VM>

#TODO[slides 30–41: evenwicht, verloop $V_y$, $M_z$, $V_z$, $M_y$]

#figure(
  image("assets/L3-dwarskracht-buigmoment.png", width: 12cm),
  caption: [Verloop interne dwarskracht en buigmoment (slide 36)],
) <fig:L3-dwarskracht-buigmoment>

=== Spanningscomponenten <sec:aandrijfas-spanningen>

#TODO[slides 42–48: spanning door $V_y$, $M_z$, $M_y$, gecombineerd $M_y$ & $M_z$, torsiemoment]

== Schuifspanningshypothese (Tresca) <sec:assen-tresca>

#TODO[slides 50–54: maximale spanning via Mohr, bepalen afschuifweerstand]

#frm(
  "Schuifspanningshypothese (Tresca)",
  $ sqrt(sigma_b^2 / 4 + tau_t^2) < tau_"krit" = sigma_R / 2 #h(1em) <=> #h(1em) sqrt(sigma_b^2 + 4 tau_t^2) < sigma_R $,
  [met: $sigma_b$ --- buigspanning [MPa], $tau_t$ --- torsiespanning [MPa], $sigma_R$ --- grensspanning uit de trekproef [MPa]],
)

== Besluit <sec:assen-1-besluit>

#TODO[slide 56]
