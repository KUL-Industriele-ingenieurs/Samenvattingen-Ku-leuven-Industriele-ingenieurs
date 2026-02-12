#import "../../school-template.typ": *

= Vlakke beweging van een star lichaam

== Star lichaam

#let fig-star = image("star-lichaam.png", width: 3cm)
#let boxed-star = box(fig-star, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-star)[
  #concept(title: "Definities")[
    - *Puntdeeltje*: Heeft een massa $m$ maar geen afmetingen $x, y, z$.
    - *Star lichaam*: Heeft een massa $m$ en afmetingen $x, y, z$ die constant blijven ten opzichte van elkaar.
    - *Vlakke beweging*: Alle deeltjes van het lichaam bewegen in een vlak, bijvoorbeeld het $x$-$y$-vlak. De rotatie staat loodrecht op dit vlak, bijvoorbeeld rond de $z$-as.
  ]
]

Type vlakke bewegingen:

- *Translatie*: Alle deeltjes van het lichaam bewegen in dezelfde richting en met dezelfde snelheid. Er is geen rotatie.
- *Rotatie*: Alle deeltjes van het lichaam bewegen in cirkels rond een gemeenschappelijke rotatieas. Er is geen translatie.
- *Algemene beweging*: Een combinatie van translatie en rotatie. De beweging kan complex zijn, waarbij het lichaam zowel beweegt als roteert.

== Translatie (rechtlijnig of kromlijnig)

Wordt met vectoren beschreven. Positie $arrow(r)$, snelheid $arrow(v)$ en versnelling $arrow(a)$ zijn vectoren die de beweging van het lichaam in het vlak beschrijven.

Bij een translatie bewegen alle punten identiek. Als je punt A kent, ken je alle andere punten:

- *Positie:* $quad arrow(r_B) = arrow(r_A) + arrow(r_(B slash A))$
- *Snelheid:* $quad arrow(v_B) = arrow(v_A)$
- *Versnelling:* $quad arrow(a_B) = arrow(a_A)$

De positie wordt bij elkaar opgeteld, maar er is geen verandering in richting. Dus de snelheid en versnelling zijn hetzelfde voor elk punt in het lichaam.

== Rotatie

Wordt met hoeken en hoeksnelheden beschreven. De hoek $theta$ beschrijft de oriëntatie van het lichaam.

#let fig-rotatie = image("rotatie.png", width: 5cm)
#let boxed-rotatie = box(fig-rotatie, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-rotatie)[
  De hoeksnelheid $omega$ beschrijft hoe snel het lichaam roteert (1 omwenteling = $2 pi$ rad = $360 degree$).

  De hoekversnelling $alpha$ beschrijft hoe snel de hoeksnelheid verandert.
]

#frm("Kinematische vergelijkingen (constante versnelling)", $omega = omega_0 + alpha t$, [
  Lineair en roterend equivalent:

  $ v = v_0 + a t quad quad & omega = omega_0 + alpha t $
  $ x = x_0 + v_0 t + frac(1, 2) a t^2 quad quad & theta = theta_0 + omega_0 t + frac(1, 2) alpha t^2 $
  $ v^2 = v_0^2 + 2 a (x - x_0) quad quad & omega^2 = omega_0^2 + 2 alpha (theta - theta_0) $
])

#frm("Relatie lineair – roterend", $v = omega r$, [
  $ v = omega r quad quad a_t = alpha r quad quad a_n = omega^2 r $
])

#oefening(title: "Stilstaand touw aan wiel")[
  #let fig-oef-wiel = image("oefening-touw-wiel.png", width: 6cm)
  #let boxed-oef-wiel = box(fig-oef-wiel, inset: (right: 0.5em, bottom: 0.5em))

  #wrap-content(boxed-oef-wiel)[
    *Gegeven:* $R = 0.2 "m"$, $a = 4t " m/s"^2$, $omega_0 = 0$

    *Gevraagd:* $omega(t)$ en $theta(t)$
  ]

  *Stap 1 — Tangentiële versnelling bepalen:*

  $ a_t = alpha R quad arrow.r quad alpha = frac(a_t, R) = frac(4t, 0.2) = 20t " rad/s"^2 $

  *Stap 2 — Hoeksnelheid via integratie:*

  $ omega = integral_0^t alpha thin d t = integral_0^t 20t thin d t = 10 t^2 + C $

  Met $omega_0 = 0$ volgt $C = 0$, dus:
  $ omega(t) = 10 t^2 " rad/s" $

  *Stap 3 — Hoek via integratie:*

  $ theta = integral_0^t omega thin d t = integral_0^t 10 t^2 thin d t = frac(10 t^3, 3) + D $

  Met $theta_0 = 0$ volgt $D = 0$, dus:
  $ theta(t) = frac(10 t^3, 3) " rad" $
]

== Algemene beweging

Algemene vlakke beweging is een combinatie van translatie en rotatie. De positie, snelheid en versnelling van elk punt in het lichaam worden beschreven door zowel de translatie- als de rotatiecomponenten te combineren.

== Contactpunten

#let fig-contact = image("contactpunt-tandwielen.png", width: 5cm)
#let boxed-contact = box(fig-contact, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-contact)[
  Bij contactpunten (bv. tandwielen) geldt: de snelheid aan het contactpunt is gelijk voor beide lichamen, want de tanden grijpen in elkaar.

  Dus $v_"contact"$ en $a_t$ zijn gelijk. Maar $a_n$ is *niet* hetzelfde, want de straal kan verschillen ($a_n = omega^2 r$).
]

#figure(
  image("contactpunt-versnellingen.png", width: 30%),
  caption: [Snelheden en versnellingen bij contactpunten van tandwielen],
) <fig:contactpunt-versnellingen>

#oefening(title: "Rotatie om vast punt")[
  #let fig-oef-l = image("oefening-rotatie-l-vorm.png", width: 8cm)
  #let boxed-oef-l = box(fig-oef-l, inset: (right: 0.5em, bottom: 0.5em))

  #wrap-content(boxed-oef-l)[
    *Gegeven:* $omega = 6 "rad/s"$, $alpha = 0.5 "rad/s"^2$

    *Gevraagd:* Snelheid $v$ en versnelling $a$ van punt A.
  ]

  *Stap 1 — Afstand AB bepalen:*

  $ A B = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5 "m" $

  *Stap 2 — Snelheid berekenen:*

  $ v = omega dot r = 6 times 5 = 30 " m/s" $

  *Stap 3 — Versnellingen berekenen:*

  $ a_t = alpha dot r = 0.5 times 5 = 2.5 " m/s"^2 $
  $ a_n = omega^2 dot r = 6^2 times 5 = 180 " m/s"^2 $

  *Stap 4 — Totale versnelling:*

  $ a = sqrt(a_t^2 + a_n^2) = sqrt(2.5^2 + 180^2) = sqrt(6.25 + 32400) approx 180.02 " m/s"^2 $

  *Alternatieve methode (vectorproduct):*

  $ arrow(v) = arrow(omega) times arrow(r_(A slash B)) = (-6 hat(k)) times (3 hat(i) + 4 hat(j)) $
  $ arrow(v) = -18 hat(j) + 24 hat(i) quad arrow.r quad |arrow(v)| = sqrt(24^2 + 18^2) = 30 " m/s" $
]
