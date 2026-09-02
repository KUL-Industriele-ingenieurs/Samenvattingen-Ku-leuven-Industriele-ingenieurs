#import "../../school-template.typ": *


= De ideale transformator

Hier nemen we de transformator zonder verliezen: alle flux blijft in de kern, de wikkelingen hebben geen weerstand.

#wrap-figure(
  image("assets/idealtransform.png", width: 5cm),
  caption: [idealtransform],
  label: <fig:idealtransform>,
)[We leggen een *AC-spanning* aan op de primaire wikkeling. Hierdoor ontstaat er een *wisselende magnetische flux* in de kern. Deze wisselende magnetische flux induceert dan weer een *wisselende spanning* op de secundaire wikkeling.\ Dit is het principe van de *elektromagnetische inductie*.

  $ v_1 = V_1 dot cos(omega t) $

  De resulterende geïnduceerde spanning is:

  $ v_2 = frac(N_2, N_1) v_1 = frac(N_2, N_1) V_1 dot cos(omega t) $
  $ = V_2 dot cos(omega t) $
]

Volgens de wet van Faraday ($v = N dif phi / dif t$) kunnen we de flux vinden door de spanning te integreren:

#frm(
  "Fluxberekening",
  $phi = 1/(N_1) integral v_1 d t$,
  [waarbij $phi$ de magnetische flux is [Wb], $v_1$ de primaire spanning [V] en $N_1$ het aantal windingen [-].],
)

$ phi = V_1/(omega N_1) sin(omega t) = V_2/(omega N_2) sin(omega t) $

#examenbox[De flux $phi$ loopt *90 graden achter* op de spanning $v$. Dat heet *lagging*.]

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


== Belastingen

=== Nullast
Er is geen belasting (open keten) aangesloten op de secundaire wikkeling. De enige "weerstand" die overblijft is de magnetische weerstand (reluctantie $R_c$) van de kern.

#figure(
  image("assets/no load.png", width: 6cm),
  caption: [no load],
  label: <fig:no-load>,
)

Herinner je Hopkinson's wet:

$N_1 i_1 - N_2 i_2 = H l = phi dot R_c$

maar we weten dat er geen load is op de secundaire winding, dus $i_2 = 0$.

$ i_1 = phi dot R_c / N_1 $

We hebben een ideale transformator, dus $R_c = 0 (mu -> infinity)$ dus $arrow.r.double$ $i_1 = 0$.

=== Belast


#wrap-figure(
  image("assets/loaded-transformer.png", width: 6cm),
  caption: [loaded-transformer],
  label: <fig:loaded-transformer>,
)[
  Omdat er een belasting is, kan er nu een secundaire stroom $i_2$ lopen.

  Doordat de kern ideaal is ($R_c = 0$), zegt de wet van Hopkinson dat $N_1 i_1 - N_2 i_2 = 0$. Hieruit volgt direct de stroomverhouding:

  $ i_2 = N_1/N_2 i_1 $

  Terwijl de spanning meeschaalt met de windingen, schaalt de stroom dus omgekeerd evenredig:

  $ v_2 = N_2/N_1 v_1 $
]

#figure(
  image("assets/loaded transformer.png", width: 5cm),
  caption: [loaded transformer],
  label: <fig:loaded-transformer>,
)

Om het effect van deze belastingen op de transformator beter te begrijpen, moeten we de theorie rond wisselstroom herhalen.

== Phasors (herhaling)

Phasors helpen om wisselstromen en wisselspanningen eenvoudig voor te stellen en te berekenen. We nemen aan bij phasoren dat de frequentie $f$ gelijk blijft over verschillende stromen en voltages. Als dit zo is dan kunnen we het begin van de stroom of voltage weergeven als een vector in het reël $RR$ en imaginair deel $ZZ$. _Zie wisselstroom_ waar het ook veel is toegepast.

$ e^(j theta) = underbrace(cos(theta), "Reëel") + j underbrace(sin(theta), "Imaginair") $


#align(center)[
  #table(
    columns: 3,

    align: (center, center, center),
    [Time domain], [x(t)], [$hat(X) cos(omega t + theta)$],
    [Phase domain], [$hat(X)$], [$hat(X)e^(j theta)$],
  )
]


#voorbeeld(title: "Voltage en flux")[

  $v(t) = V cos(omega t)$\
  $phi(t) = V/(omega N) sin(omega t)$

  Als we dit plotten krijgen we dit:

  #figure(
    image("assets/plot v phi.png", width: 5cm),
    caption: [plot v phi],
    label: <fig:plot-v-phi>,
  )

  Je ziet dat phi 90 graden achterloopt *Lagging* op v.

]

== RLC circuits (herhaling) <sec:RLC-circuits>

#keyterm[ELI ICE] zegt toont of voor een inductor of een capacitor de stroom voorloopt of achterloopt op de spanning. LI -> stroom loopt achter op spanning, iC -> stroom loopt voor op spanning.

=== RL <sec:RL>
#figure(
  image("assets/RL-circuit.png", width: 5cm),
  caption: [RL-circuit],
  label: <fig:RL-circuit>,
)
We gaan KVL toepassen op een RL circuit:

$ v(t) = R i(t) + L (d i(t))/(d t) $

met $v(t) = V cos(omega t)$ en $i(t) = I cos(omega t + theta)$.

De spanning over de spoel wordt geïnduceerd door de verandering van de stroom.
Om dit met phasoren te berekenen, transformeren we de differentiaalvergelijking naar het complexe domein (rekening houdend met amplitudes en fasehoeken):


$ V = R I + underbrace(j omega L, "imaginair") I $

Onze L is imaginair omdat $frac(d cos(omega t + theta), d t) = -omega sin(omega t + theta)$ en de sinus loopt 90 graden achter de cosinus.
$ V = I (R + j omega L) $
$ Z = R + j omega L $
$ I = V/Z $

#figure(
  image("assets/Phasor RL.png", width: 5cm),
  caption: [Phasor RL],
  label: <fig:Phasor-RL>,
)

Voor een condensator loopt dezelfde redenering, met $Z = R - j/(omega C)$.

== Power <sec:power>

Het schijnbaar vermogen $S$ is complex, dus het heeft ook een fasor. Je berekent het met de #belangrijk[complex toegevoegde] van de stroom:

#wrap-figure(
  image("assets/phasorPower.png", width: 5cm),
  caption: [Vermogendriehoek: $P$ reëel, $j Q$ imaginair, $S$ de schuine zijde onder hoek $phi$.],
  label: <fig:phasorPower>,
)[
  $ S = V dot I^* = V I e^(j (phi_V - phi_I)) = V I e^(j phi) $
  $ S = underbrace(V I cos phi, P) + j underbrace(V I sin phi, Q) $

  met:
  - $S$: schijnbaar vermogen [VA]
  - $P$: actief vermogen, het tijdsgemiddelde van het ogenblikkelijk vermogen [W]
  - $Q$: reactief vermogen [var]
  - $phi = phi_V - phi_I$: fasehoek tussen spanning en stroom [rad]
  - $cos phi$: arbeidsfactor [-]
]

#waarschuwing[
  *Let op de toegevoegde.* $S = V I^*$, #strong[niet] $V I$. Vermenigvuldigen met de toegevoegde trekt de fasehoeken van elkaar af; hoeken optellen betekent niets. Staat de spanning of de stroom toevallig op fase nul, dan krijg je alleen het teken van $Q$ verkeerd. In alle andere gevallen komt je $cos phi$ er volledig naast te liggen.

  Een naijlende stroom geeft een positieve $phi$ en dus een positieve $Q$.
]


=== Toegepast op de ideale transformator <sec:ideal-transformator>

We weten dat een transformator de spanning verhoogt of verlaagt afhankelijk van de verhouding van het aantal windingen. Hoe heeft dit impact op het vermogen?

#figure(
  image("assets/Model-phasors.png", width: 5cm),
  caption: [Model-phasors],
  label: <fig:Model-phasors>,
)
$ frac(V_1, V_2) = frac(N_1, N_2) $

$ frac(I_1, I_2) = frac(N_2, N_1) $

We zien dat als de spanning verlaagt dat de stroom verhoogt en omgekeerd en de lagging of gaining van de stroom blijft hetzelfde -> Het vermogen blijft dus hetzelfde.

== Impedantietransformatie <sec:impedantie-transformatie>

#figure(
  image("assets/Impedantie transformator.png", width: 8cm),
  caption: [Impedantie transformator],
  label: <fig:Impedantie-transformator>,
)

We zoeken wat de impedantie '$Z'$ is. Dus de impedantie equivalent als de impedantie van de transformator en de load na de transformatie.

We weten van #keyterm[Wet van Ohm] dat $Z = V/I$. We passen dit toe om onze formules van de transformator:

$
  Z' & = V_1/I_1 \
     & = ((N_1/N_2) V_2) / ((N_2/N_1) I_2) \
     & = (N_1/N_2)^2 V_2/I_2 \
   Z & = V_2/I_2 \
     & arrow.b.double \
  Z' & = (N_1/N_2)^2 Z
$

Het omgekeerde geldt ook:
$ Z = (N_2/N_1)^2 Z' $


=== Samenvatting alle formules

#figure(
  image("assets/Samenvatting ideale transformatoren.png", width: 12cm),
  caption: [Samenvatting ideale transformatoren],
  label: <fig:Samenvatting-ideale-transformatoren>,
)



