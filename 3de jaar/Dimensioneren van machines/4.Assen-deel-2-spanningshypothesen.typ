#import "../../school-template.typ": *

= Assen deel 2: spanningshypothesen <ch:assen-2>

// Bron: Slides/4.Assen deel 2 - spanningshypothesen.DIMA.pdf (Roloff/Matek H3, H11)
// Notes: 4.Hydrostatische vormingsenergie, 4.Tangientiale spanningstoestand,
//        4.Understanding Failure Theories (Tresca, von Mises etc...)

== Schuifspanningshypothese (SH, Tresca) <sec:sh>

#TODO[slides 4–5: de Tresca-spanning is een vergelijkingsspanning]

#frm(
  "Tresca-spanning",
  $ sigma_"Tresca" = sqrt(sigma_b^2 + 4 tau_t^2) < sigma_R $,
  [geen echte spanning: een uniaxiale spanning die je kan vergelijken met de trekproef],
)

== Normaalspanningshypothese (NH) <sec:nh>

#TODO[slides 7–11: NH, Tresca en NH op een aandrijfas]

#frm(
  "Normaalspanningshypothese",
  $ sigma_I < sigma_R $,
  [met: $sigma_I$ --- grootste hoofdspanning [MPa]],
)

=== Hydrostatische druk <sec:hydrostatisch>

#TODO[slide 12]

=== 3D cirkel van Mohr <sec:mohr-3d>

#TODO[slides 13–17: drie vlakspanningstoestanden één voor één]

#figure(
  image("assets/L4-mohr-3d.png", width: 12cm),
  caption: [Maximale normaalspanning met de 3D cirkel van Mohr (slide 15)],
) <fig:L4-mohr-3d>

=== Absolute maximale afschuifspanning <sec:abs-tau-max>

#TODO[slides 18–22]

== Maximale-rekhypothese (RH) <sec:rh>

#TODO[slides 24–27]

== Hypothese van vormveranderingsenergie (VEH, von Mises) <sec:veh>

#TODO[slides 29–37: hydrostatische vs. deviatorische component]

#frm(
  "Vormveranderingsenergie",
  $ W_"verv" = (nu + 1) / (3 E) (sum sigma_i^2 - sum sigma_i sigma_j) < W_"krit" = (nu + 1) / (3 E) sigma_R^2 $,
  [met: $nu$ --- coëfficiënt van Poisson [-], $E$ --- elasticiteitsmodulus [MPa], $sigma_i$ --- hoofdspanningen [MPa]],
)

Afleiding voor een as (buiging + torsie), uit de Mohr-cirkel met $a = sigma_b slash 2$ en $b = sqrt((sigma_b slash 2)^2 + tau_b^2)$:

$ sigma_I = a + b, quad sigma_(I I) = a - b, quad sigma_(I I I) = 0 $
$ sum sigma_i^2 - sum sigma_i sigma_j = (a+b)^2 + (a-b)^2 - (a+b)(a-b) = a^2 + 3 b^2 = sigma_b^2 + 3 tau_b^2 $

#frm(
  "Von Mises-spanning",
  $ sigma_v = sqrt(sigma_b^2 + 3 tau_b^2) < sigma_R $,
  [met: $sigma_b$ --- buigspanning [MPa], $tau_b$ --- torsiespanning [MPa]],
)

== Samenvatting <sec:hypothesen-samenvatting>

#figure(
  image("assets/L4-samenvatting-hypothesen.png", width: 12cm),
  caption: [Belangrijkste hypothesen (slide 38)],
) <fig:L4-samenvatting-hypothesen>
