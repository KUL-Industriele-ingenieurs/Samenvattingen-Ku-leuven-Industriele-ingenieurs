#import "../../school-template.typ": *
#import "@preview/zap:0.5.0" as zap

#let conduction-diagram() = {
  cetz.canvas({
    import cetz.draw: *

    // Wall with gradient to show temp difference
    rect((0, 0), (4, 3), fill: gradient.linear(red.lighten(30%), blue.lighten(30%)), stroke: none, name: "wall")
    line((0, 0), (0, 3), stroke: 2pt)
    line((4, 0), (4, 3), stroke: 2pt)

    // Heat Flux Arrow
    line((-1.5, 1.5), (5.5, 1.5), mark: (end: ">", fill: black), stroke: (thickness: 2pt), name: "Q")
    content("Q.start", anchor: "south", padding: 0.2, text(weight: "bold")[$dot(Q)$])

    // Temperatures
    content((0, 3.3), text(fill: red, weight: "bold")[$T_1$])
    content((4, 3.3), text(fill: blue, weight: "bold")[$T_2$])

    // Dimensions
    line((0, -0.3), (4, -0.3), mark: (start: "|", end: "|"), name: "L")
    content("L.mid", anchor: "north", padding: 0.2, [$L$])

    // Material Property
    content("wall.center", box(fill: white.transparentize(20%), inset: 4pt, radius: 2pt)[$k$, $A$])
  })
}

#let convection-diagram() = {
  cetz.canvas({
    import cetz.draw: *

    // Surface
    line((-0.5, 0), (6.5, 0), stroke: (thickness: 3pt, paint: gray), name: "surface")
    for x in range(0, 13) {
      line((-0.5 + x * 0.5, 0), (-0.2 + x * 0.5, -0.3), stroke: gray)
    }
    content((3, -0.8), [Surface ($T_s$)])

    // Fluid Streamlines
    for y in (0.8, 1.6, 2.4) {
      line((-1, y), (7, y), stroke: (paint: blue, thickness: 1pt), mark: (end: ">", fill: blue))
    }
    content((-1.5, 1.6), text(fill: blue)[Fluid \ $T_oo, h$])

    // Heat Transfer Arrows (Wavy or rising)
    let wave-arrow(x) = {
      line((x, 0.2), (x, 2.5), stroke: (paint: red, thickness: 1.5pt, dash: "dotted"), mark: (end: ">", fill: red))
    }

    wave-arrow(1.5)
    wave-arrow(3)
    wave-arrow(4.5)

    content((5.5, 1.5), text(fill: red)[$dot(Q)_"conv"$], box: true, fill: white, inset: 2pt)
  })
}

#let radiation-diagram() = {
  cetz.canvas({
    import cetz.draw: *

    // Surface 1
    line((0.5, 0.5), (0.5, 3.5), stroke: (thickness: 2pt, paint: red))
    content((0.5, 3.8), text(fill: red)[$T_1$])

    // Surface 2
    line((5.5, 0.5), (5.5, 3.5), stroke: (thickness: 2pt, paint: blue))
    content((5.5, 3.8), text(fill: blue)[$T_2$])

    // Radiation Waves
    let rad-wave(y, dir) = {
      let color = if dir == 1 { red } else { blue }
      let start = if dir == 1 { 0.7 } else { 5.3 }
      let end = if dir == 1 { 5.3 } else { 0.7 }

      // Bezier to simulate wave? No, just dashed line
      line((start, y), (end, y), stroke: (paint: color, dash: "dashed"), mark: (end: ">", fill: color))
    }

    rad-wave(1, 1) // 1 -> 2
    rad-wave(1.5, -1) // 2 -> 1
    rad-wave(2, 1) // 1 -> 2
    rad-wave(2.5, -1) // 2 -> 1
    rad-wave(3, 1) // 1 -> 2

    content((3, 0), text(fill: orange)[$dot(Q)_"rad"$])
  })
}

#let physical-system-combined() = {
  cetz.canvas({
    import cetz.draw: *

    // Wall (Conduction)
    rect((0, 0), (3, 3), fill: gradient.linear(red.lighten(20%), red.lighten(50%)), stroke: none)
    line((0, 0), (0, 3), stroke: 2pt)
    line((3, 0), (3, 3), stroke: 2pt)
    content((1.5, 1.5), [$k, L$])

    // Temperatures
    content((0, 3.2), text(fill: red)[$T_1$])
    content((3, 3.2), text(fill: red.darken(20%))[$T_2$])

    // Fluid (Convection)
    line((3, 0), (6.5, 0), stroke: (dash: "dashed")) // Bottom boundary

    // Streamlines
    for y in (0.5, 1.5, 2.5) {
      line((3.5, y), (7, y), stroke: (paint: blue, thickness: 1pt), mark: (end: ">", fill: blue))
    }
    content((5.5, 2.8), text(fill: blue)[$T_oo, h$])

    // Heat Flux Arrow
    line((-0.5, 1.5), (6, 1.5), mark: (end: ">"), stroke: (thickness: 2pt))
    content((-0.8, 1.5), [$dot(Q)$])
  })
}


= Herhaling Warmte en strmoingen
== Conductie

#figure(
  conduction-diagram(),
  caption: [Conductie door een muur],
) <fig:conductie>

#frm(
  "Conductie",
  [ $ dot(Q) = (Delta T) / R_(t h) $
    $ R_(t h) = L / (k A) $
    $ Delta T = T_1 - T_2 $ ],
  [$dot(Q)$ = warmteflux [W], $R_(t h)$ = thermische weerstand [K/W], L = lengte [m], k = warmtegeleidingscoëfficiënt [W/(m K)], A = oppervlakte [$m^2$], $Delta$ T = temperatuurverschil [K]],
)


Het is net zoals bij elektrische netwerken

#figure(
  image("vergelijking elektrisch en heat flow.png", width: 5cm),
  caption: [vergelijking elektrisch en heat flow],
  label: <fig:vergelijking-elektrisch-en-heat-flow>,
)



== convectie

#figure(
  convection-diagram(),
  caption: [Convectie over een oppervlak],
)

#frm(
  "Convectie",
  [
    $ dot(Q) = h A Delta T $
    $ Delta T = T_s - T_oo $
  ],
  [$dot(Q)$ = warmteflux [W], h = warmteoverdrachtscoëfficiënt [$W/(m^2 K)$], A = oppervlakte [$m^2$], Delta T = temperatuurverschil [K], $T_s$ = oppervlaktemperatuur [K], $T_oo$ = omgevingstemperatuur [K]],
)

== Radiatie

#figure(
  radiation-diagram(),
  caption: [Stralingsuitwisseling tussen twee oppervlakken],
)

#frm(
  "Radiatie",
  [
    $ dot(Q) = epsilon sigma A (T_s^4 - T_oo^4) $
    $ Delta T = T_s - T_oo $
    $ T_s^4 - T_oo^4 = (T_s^2 + T_oo^2)(T_s^2 - T_oo^2) = (T_s^2 + T_oo^2)(T_s - T_oo)(T_s + T_oo) $
    $ dot(Q) = epsilon sigma A (T_s^2 + T_oo^2)(T_s + T_oo) Delta T $
    $ h_r = epsilon sigma (T_s^2 + T_oo^2) (T_s + T_oo) $
  ],
  [$dot(Q)$ = warmteflux [W], $epsilon$ = emissiviteit [-], $sigma$ = Stefan-Boltzmann constante [$5.67 dot 10^(-8) W/(m^2 K^4)$], A = oppervlakte [$m^2$], $Delta T$ = temperatuurverschil [K], $T_s$ = oppervlaktemperatuur [K], $T_oo$ = omgevingstemperatuur [K]],
)

$epsilon = 1$ voor een zwarte straler.

Ontwikkel die haken uit en je krijgt dan terug terug $dot(Q) = h_r A Delta T$.

De warmteoverdrachtscoëfficiënt voor straling $h_r$ is hier dan heel afhankelijk van de temperatuur:
$ h_r = epsilon sigma (T_s^2 + T_oo^2) (T_s + T_oo) $


== alles tesamen

Al deze warmteoverdrachten kunnen ook tesamen voorkomen. Dit kan gemodelleerd worden als een elektrisch circuit (thermisch circuit), waarbij de warmteflux $dot(Q)$ analoog is aan de stroom $I$, het temperatuurverschil $Delta T$ aan de spanning $U$, en de thermische weerstand $R_(t h)$ aan de elektrische weerstand $R$.

#figure(
  physical-system-combined(),
  caption: [Gecombineerd systeem (conductie + convectie)],
) <fig:alles-tesamen>

De totale weerstand is de som van de weerstanden in serie:
$ R_(t o t) = R_"cond" + R_"conv" = L/(k A) + 1/(h A) $

Dan geldt:
$ dot(Q) = (T_1 - T_oo) / R_(t o t) $

Soms krijg je de oppervlakte niet, en dan kan voeg je die niet in, in de formules:

$ dot(q) = dot(Q)/A = (T_1 - T_oo) / r_(t o t) $
$ r_(c o n v) = 1/h $
met $r_(c o n v) = R_(c o n v) dot A$ met eenheden [$m^2 K/W$]
$ r_(c o n d) = L/k $
met $r_(c o n d) = R_(c o n d) dot A$ met eenheden [$m^2 K/W$]

= Andere geometrie conductie
== Spherische conductie

$ dot(Q)_c o n d = -k A frac(d T, d r) = -k 4 pi r^2 frac(d T, d r) $
$ R_c o n d = frac(r_2 - r_1, 4 pi k r_1 r_2) $

#grid(
  columns: 2,
  image("sphere.png", width: 3cm), image("resistancesphere.png", width: 3cm),
) // CENTER THESE


$ R_t o t = R_c o n d + R_c o n v + R_r a d $

$
  R_t o t = frac(r_2 - r_1, 4 pi k r_1 r_2) + frac(1, h A) + frac(1, epsilon sigma A) (T_s - T_s u r r)^{-1} (T_s^2 + T_s u r r^2)^{-1} (T_s + T_s u r r)^{-1}
$

== Cilindrische conductie

$ dot(Q)_c o n d = -k A frac(d T, d r) = -k 2 pi r l frac(d T, d r) $
$ R_c o n d = frac(r_2 - r_1, 2 pi l k r_1 r_2) $



$ R_t o t = R_c o n d + R_c o n v + R_r a d $

$
  R_t o t = frac(r_2 - r_1, 2 pi l k r_1 r_2) + frac(1, h A) + frac(1, epsilon sigma A) (T_s - T_s u r r)^{-1} (T_s^2 + T_s u r r^2)^{-1} (T_s + T_s u r r)^{-1}
$


#figure(
  image("multilayer cilinder & circkel.png", width: 10cm),
  caption: [multilayer cilinder & circkel],
  label: <fig:multilayer-cilinder-circkel>,
)

Bij steady state heb je een standaard Heat rate transfer $dot(Q)$.
Pas dus dezelfde dingen toe als bij elektrische netwerken.

Omdat de warmtestroom $dot(Q)$ constant is doorheen het hele netwerk (net zoals stroom $I$ in een serieschakeling), kun je de temperatuurval over één specifieke weerstand berekenen als je $dot(Q)$ kent:

$ Delta T_i = dot(Q) R_i $

Of als ratio ten opzichte van het totaal:

$
  dot(Q) = (Delta T_"tot") / R_"tot" = (Delta T_i) / R_i arrow.r.double Delta T_i = frac(R_i, R_"tot") dot Delta T_"tot"
$

Dit is analoog aan de *spanningsdeler* in elektriciteit.

Je weerstanden kunnen ook in parallel geschakeld zijn. Dan geldt:

$ 1 / R_t o t = sum(1 / R_i) $

#figure(
  image("parallel-serie.png", width: 6cm),
  caption: [parallel-serie],
  label: <fig:parallel-serie>,
)

== Kritische radius voor isolerende lichaam

#figure(
  image("kritische insulatie.png", width: 5cm),
  caption: [kritische insulatie],
  label: <fig:kritische-insulatie>,
)

Je ziet dat er een kritische punt is waarbij je een kritisch radius hebt. Vanaf een bepaald punt verhoog je de warmteoverdracht $dot(Q)$
en daarna vermindering. Dit komt omdat de warmteoverdracht door conductie afneemt en de warmteoverdracht door convectie toeneemt.

#concept(title: "Kritische radius")[
  De warmteoverdracht door conductie neemt af als de dikte van de isolatie toeneemt. De warmteoverdracht door convectie neemt toe als de dikte van de isolatie toeneemt.
  De kritische radius is de dikte van de isolatie waarbij de warmteoverdracht maximaal is.
]


* Voor een cilinder:*

$ r_c = k / h $

* Voor een bol:*

$ r_c = 2 k / h $

#voorbeeld(title: "Kritische radius")[
  Stel we hebben een elektrische draad met diameter $D = 3 "mm"$ en een isolatielaag ($k = 0.15 "W"/(m dot K)$). De draad heeft een temperatuur van $120 degree$ en de omgeving is $20 degree$ met $h = 10 "W"/(m^2 dot K)$.

  *Bereken de kritische radius:*
  $ r_c = k / h = (0.15 "W"/(m dot K)) / (10 "W"/(m^2 dot K)) = 0.015 "m" = 15 "mm" $

  De straal van de draad is $r_1 = 1.5 "mm"$.
  Aangezien $r_1 < r_c$, zal het toevoegen van isolatie (tot $15 "mm"$) de warmteoverdracht *verhogen* in plaats van verlagen! Pas voorbij $r_c$ zal de isolatie effectief isoleren.
]

#figure(
  image("kritische insulatie.png", width: 5cm),
  caption: [kritische insulatie],
  label: <fig:kritische-insulatie>,
)

Je ziet dat er een kritische punt is waarbij je een kritisch radius hebt. Vanaf een bepaald punt verhoog je de warmteoverdracht $dot(Q)$
en daarna vermindering. Dit komt omdat de warmteoverdracht door conductie afneemt en de warmteoverdracht door convectie toeneemt.

== Vinnen en warmteoverdracht

#figure(
  image("fins.png", width: 3.5cm),
  caption: [fins],
  label: <fig:fins>,
)

#frm(
  "Vinnen",

  $ dot(Q)= h A_s (T_s - T_infinity) $,

  "Vinnen helpen omdat je heat transfer $dot(Q)$ veel hoger is door het grote oppervlakte.",
)


Dit wordt gebruikt in computer, auto's, en eigenlijk alles wat warmte moet afgeven aan de omgeving.

*Vinnen vergelijking*

#figure(
  image("vinnen-vergelijking.png", width: 5cm),
  caption: [vinnen-vergelijking],
  label: <fig:vinnen-vergelijking>,
)
#theorie(title: "Fin Equation Derivation")[
  We bekijken een volume-element van de vin met lengte $Delta x$, oppervlakte $A_c$ en omtrek $P$.

  *Energiebalans:*
  Rate of heat conduction into element = Rate of heat conduction from element + Rate of heat convection from element

  $ dot(Q)_(c o n d, x) = dot(Q)_(c o n d, x + Delta x) + dot(Q)_(c o n v) $

  Waarbij:
  $ dot(Q)_(c o n v) = h (P Delta x) (T - T_infinity) $

  Als we dit herschrijven en de limiet nemen voor $Delta x -> 0$:
  $ (dot(Q)_(c o n d, x + Delta x) - dot(Q)_(c o n d, x)) / (Delta x) + h P (T - T_infinity) = 0 $
  $ (d dot(Q)_(c o n d)) / (d x) + h P (T - T_infinity) = 0 $

  Gebruik Fourier's wet ($dot(Q)_(c o n d) = -k A_c (d T) / (d x)$):
  $ d / (d x) (k A_c (d T) / (d x)) - h P (T - T_infinity) = 0 $

  Als $k$ en $A_c$ constant zijn:
  $ (d^2 T) / (d x^2) - (h P) / (k A_c) (T - T_infinity) = 0 $

  *Differentiaalvergelijking:*
  We definiëren de excess temperatuur $theta(x) = T(x) - T_infinity$.
  Dan is $(d T)/(d x) = (d theta)/(d x)$ en $(d^2 T)/(d x^2) = (d^2 theta)/(d x^2)$.

  Dit geeft de standaard vin-vergelijking:
  $ (d^2 theta) / (d x^2) - m^2 theta = 0 $

  Waarbij:
  $ m^2 = (h P) / (k A_c) $
]
*De Oplossing van de vinnen vergelijking*

$ theta(x) = C_1 e^(m x) + C_2 e^(-m x) $
Met boundry condition
$ theta(0) = theta_b = T_b - T_infinity $

#figure(
  image("fin.png", width: 5cm),
  caption: [fin],
  label: <fig:fin>,
)
=== Model 1 Oneindige lange vin
#frm(
  "Oneindig lange vin ($L -> infinity$)",

  [
    $ m = sqrt(h P / (k A_c)) $
    $ frac(theta(x), theta_b) = e^(-m x) $
    $ dot(Q) = -k A_c frac(d theta, d x) = -k A_c (-m theta_b) = k A_c m theta_b = sqrt(h P k A_c) (T_b - T_infinity) $
  ],

  [Bij een oneindig lange vin is de temperatuur aan de tip gelijk aan de omgevingstemperatuur ($T(L) = T_infinity$). $theta_b = T_b - T_infinity$.],
)


=== Model 2 Onmerkbare heat loss van vin top

$ frac(d theta, d x) = O $



=== Model 3 Gegeven temperatuur aan de tip

$ T_f i n t i p = T_L $
$ arrow.b.double $
$ theta(L) = theta_L = T_L - T_infinity $

=== Model 4 Convectie van de vin top

Je moet een deel toevoegen aan de vin waar je aanneem dat je vin isolerende is (geen convenctie) dus je voegt een deel toe zodat je conductie compenseert voor de convectie.

$ L_c = L + frac(A_c, p) $
$ L_c, r e c = L + frac(t, 2) $
$ L_c, c y l i n d e r = L + frac(D, 4) $


#figure(
  image("2026-02-17-17-29-30.png", width: 5cm),
  caption: [2026-02-17-17-29-30],
  label: <fig:2026-02-17-17-29-30>,
)

=== Fin Efficiencie

#figure(
  image("fin efficiencie.png", width: 5cm),
  caption: [fin efficiencie],
  label: <fig:fin-efficiencie>,
)

$ dot(Q)_v i n m a x = h A_c (T_s - T_infinity) $
























