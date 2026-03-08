#import "../../school-template.typ": *


= De ideale transformator

In dit hoofdstuk bestuderen we alle effecten van transformatoren. We nemen geen verliezen mee.

#wrap-figure(
  image("idealtransform.png", width: 5cm),
  caption: [idealtransform],
  label: <fig:idealtransform>,
)[We leggen een *AC-spanning* aan op de primaire wikkeling. Hierdoor ontstaat er een *wisselende magnetische flux* in de kern. Deze wisselende magnetische flux induceert dan weer een *wisselende spanning* op de secundaire wikkeling.\ Dit is het principe van de *elektromagnetische inductie*.

  $ v_1 = V_1 dot cos(omega t) $

  Het resulterende magnetisch veld is:

  $ v_2 = frac(N_2, N_1) v_1 = frac(N_2, N_1) V_1 dot cos(omega t) $
  $ = V_2 dot cos(omega t) $
]

We gaan moeten integreren.

$ phi = 1/(N_1) integral.cont_0^t v_1 d t = V_1/(omega N_1) sin(omega t) $

$ = V_2/(omega N_2) sin(omega t) + phi_(D C) $

$ N phi = frac(V, omega) arrow.r.double phi = frac(V, omega N) $

We zien dat $phi$ 90 graden achterloopt op $v_1$ en $v_2$.

#figure(
  cetz.canvas({
    plot.plot(
      size: (6, 3),
      x-tick-step: 1.5708,
      y-tick-step: 1,
      x-min: -0.5,
      x-max: 6.5,
      y-min: -1.2,
      y-max: 1.4,
      x-format: x => if calc.abs(x) < 0.1 [0] else if calc.abs(x - 1.5708) < 0.1 [$pi/2$] else if calc.abs(x - 3.1415)
        < 0.1 [$pi$] else if calc.abs(x - 4.712) < 0.1 [$3pi/2$] else if calc.abs(x - 6.283) < 0.1 [$2pi$] else [],
      {
        plot.add(
          domain: (0, 6.28),
          style: (stroke: blue + 1.5pt),
          label: [$v(t) prop cos(omega t)$],
          x => calc.cos(1rad * x),
        )
        plot.add(
          domain: (0, 6.28),
          style: (stroke: red + 1.5pt),
          label: [$phi(t) prop sin(omega t)$],
          x => calc.sin(1rad * x),
        )
        // Duid de toppen aan
        plot.add-vline(0, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
        plot.add-vline(1.5708, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
        plot.add-hline(1, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))

        // Markeer het verschil tussen de toppen
        plot.add(
          ((0, 1.1), (1.5708, 1.1)),
          style: (stroke: (paint: green.darken(30%), thickness: 1.5pt)),
          label: [$Delta = pi/2$],
        )
      },
    )
  }),
  caption: [Faseverschil: Flux $phi(t)$ bereikt zijn top $pi/2$ later dan de spanning $v(t)$],
  label: <fig:flux-phase-lag>,
)


== Loads

=== No load
geen enkele weerstand gezet op de secundaire wikkeling dus de enige weerstand $R_c$ is de weerstand van de kern.

#figure(
  image("no load.png", width: 6cm),
  caption: [no load],
  label: <fig:no-load>,
)

Herinner je Hopkinson's wet:

$N_1 i_1 - N_2 i_2 = H l = phi dot R_c$

maar we weten dat er geen load is op de secundaire winding, dus $i_2 = 0$.

$ i_1 = phi dot R_c / N_1 $

We hebben een ideale transformator, dus $R_c = 0 (mu -> infinity)$ dus $arrow.r.double$ $i_1 = 0$.

=== Loaded


#wrap-figure(
  image("loaded-transformer.png", width: 6cm),
  caption: [loaded-transformer],
  label: <fig:loaded-transformer>,
)[
  Er is nu wel een spanning over de secundaire wikkeling, dus er zal ook een stroom lopen.

  $ v_1 arrow.r.double phi $

  $ v_2 = N_2/N_1 v_1 $

  $ i_2 = N_1/N_2 i_1 $

  $ v_2 arrow.r.double i_2 $
]

#figure(
  image("loaded transformer.png", width: 5cm),
  caption: [loaded transformer],
  label: <fig:loaded-transformer>,
)

== Phasors (herhaling)

Phasors helpen om wisselstromen weer te geven. We nemen aan bij phasoren dat de frequentie $f$ gelijk blijft over verschillende stromen en voltages. Als dit zo is dan kunnen we het begin van de stroom of voltage weergeven als een vector in het reël $RR$ en imaginair deel $ZZ$. _Zie wisselstroom_ waar het ook veel is toegepast.

$ e^(j theta) = underbrace(cos(theta), "Reëel") + j underbrace(sin(theta), "Imaginair") $


#align(center)[
  #table(
    columns: 3,

    align: (center, center, center),
    [Time domain], [x(t)], [$hat(X) cos(omega t + theta)$],
    [Phase domain], [$hat(X)$], [$hat(X)e^(j theta)$],
  )
]







//todo voeg voorbeeld toe phasor



#voorbeeld(title: "Voltage en flux")[

  $ v = N frac(d phi, d t) $

  $ arrow.t.b.double $

  $ underline(V) = j omega N phi arrow.r phi = frac(underline(V), j omega N) = -j frac(underline(V), omega N) $

  //add phasor diagram

]

