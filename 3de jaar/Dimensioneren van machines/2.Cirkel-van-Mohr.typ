#import "../../school-template.typ": *

= Cirkel van Mohr <ch:cirkel-van-mohr>

// Bron: Slides/2.Cirkel van Mohr.DIMA.pdf
// Notes: 2.DIMA uitwerking cirkel van Mohr, 2.Cirkel van Mohr uitleg.DIMA.pdf

== Herhaling gecombineerde belasting <sec:herhaling-gecombineerd>

#TODO[slides 3–7: analyse van faling, pure torsie, pure trek]

== Afleiding <sec:mohr-afleiding>

#TODO[slides 8–9: transformatieformules (@sec:vlakke-spanningstoestand) kwadrateren en optellen geeft een cirkel]

#frm(
  "Cirkel van Mohr: centrum en straal",
  $ C = (sigma_x + sigma_y) / 2 #h(2em) R = sqrt(((sigma_x - sigma_y) / 2)^2 + tau_(x y)^2) $,
  [met: $C$ --- centrum op de $sigma$-as [MPa], $R$ --- straal [MPa]],
)

== Constructie <sec:mohr-constructie>

#TODO[slides 10–15: x-vlak $A(sigma_x, tau_(x y))$, y-vlak $B(sigma_y, -tau_(x y))$; $tau$-as naar beneden; element over $theta$ draaien = $2 theta$ op de cirkel]

#figure(
  image("assets/L2-constructie-mohr.png", width: 12cm),
  caption: [Constructie van de cirkel van Mohr en hoofdspanningen (slide 13)],
) <fig:L2-constructie-mohr>

#frm(
  "Aflezen op de cirkel van Mohr",
  $ sigma_(I, I I) = C plus.minus R #h(2em) tau_max = R $ + $ theta_p = 1/2 arctan tau_(x y) / ((sigma_x - sigma_y) slash 2) #h(2em) theta_s = -1/2 arctan ((sigma_x - sigma_y) slash 2) / tau_(x y) $,
  [met: $theta_p$ --- hoek naar de hoofdspanningen [rad], $theta_s$ --- hoek naar $tau_max$ [rad], $theta_s = theta_p - 45 degree$],
)

== Toepassingen <sec:mohr-toepassingen>

=== Pure torsie <sec:mohr-torsie>

#TODO[slides 16–19]

#frm(
  "Pure torsie op een ronde as",
  $ tau_(x theta) = (T rho) / J = (2 T) / (pi rho^3) #h(2em) sigma_(I, I I) = plus.minus (2 T) / (pi rho^3), quad theta_p = plus.minus 45 degree $,
  [met: $T$ --- torsiemoment [N·mm], $rho$ --- straal [mm], $J = pi rho^4 slash 2$ --- polair traagheidsmoment [mm⁴]],
)

=== Pure normaalspanning <sec:mohr-normaal>

#TODO[slides 20–22: $sigma_x = N slash A$, $tau_max = sigma_x slash 2$ onder 45°]

=== Dunwandige drukvaten <sec:drukvaten>

#TODO[slides 23–27: cilindrisch en sferisch drukvat]

#figure(
  image("assets/L2-drukvaten.png", width: 12cm),
  caption: [Krachten in een dunwandig drukvat (slide 23)],
) <fig:L2-drukvaten>

== Dimensioneren van een as <sec:mohr-as>

#TODO[slides 28–34: buiging + torsie → straal $r$]

#frm(
  "Spanningen in een ronde as",
  $ sigma_x = (M_z r) / (pi r^4 slash 4) = (4 M_z) / (pi r^3) #h(2em) tau = (T_x r) / (pi r^4 slash 2) = (2 T_x) / (pi r^3) $,
  [met: $M_z$ --- buigmoment [N·mm], $T_x$ --- torsiemoment [N·mm], $r$ --- straal van de as [mm]],
)

#frm(
  "Minimale straal van een as (buiging + torsie)",
  $ r >= root(3, 2 / (pi sigma_max) (M_z + sqrt(M_z^2 + T_x^2))) #h(2em) r >= root(3, 2 / (pi tau_(max,"mat")) sqrt(M_z^2 + T_x^2)) $,
  [links op $sigma_I < sigma_max$, rechts op $tau_max < tau_(max,"mat")$],
)

== Conclusie <sec:mohr-conclusie>

#TODO[slide 35]
