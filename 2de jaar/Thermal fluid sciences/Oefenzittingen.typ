// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

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
    content("Q.start", anchor: "south", padding: 0.2, text(weight: "bold")[$Q$])

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

    content((5.5, 1.5), text(fill: red)[$Q_"conv"$], box: true, fill: white, inset: 2pt)
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

    content((3, 0), text(fill: orange)[$Q_"rad"$])
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
    content((-0.8, 1.5), [$Q$])
  })
}


= Oefenzittingen <ch:oefenzittingen>

== Oefenzitting 1 <sec:oefenzitting1>

=== Conductie

#figure(
  conduction-diagram(),
  caption: [Conductie door een muur],
)

// TODO: #15 figuur toevoegen van cilinder


#frm(
  "Conductie",
  [ $ Q = (Delta T) / R_(t h) $
    $ R_(t h) = L / (k A) $
    $ Delta T = T_1 - T_2 $ ],
  [Q = warmteflux [W], $R_(t h)$ = thermische weerstand [K/W], L = lengte [m], k = warmtegeleidingscoëfficiënt [W/(m K)], A = oppervlakte [$m^2$], $Delta$ T = temperatuurverschil [K]],
)

Het is hetzelfde principe als de wet van ohm:
$ I = U / R $

De weerstand is anders voor welke soort warmte overdracht dat je hebt.



=== Convectie

#figure(
  convection-diagram(),
  caption: [Convectie over een oppervlak],
)


#frm(
  "Convectie",
  [
    $ Q = h A Delta T $
    $ Delta T = T_s - T_oo $
  ],
  [Q = warmteflux [W], h = warmteoverdrachtscoëfficiënt [$W/(m^2 K)$], A = oppervlakte [$m^2$], Delta T = temperatuurverschil [K], $T_s$ = oppervlaktemperatuur [K], $T_oo$ = omgevingstemperatuur [K]],
)


=== Radiatie

#figure(
  radiation-diagram(),
  caption: [Stralingsuitwisseling tussen twee oppervlakken],
)


#frm(
  "Radiatie",
  [
    $ Q = epsilon sigma A (T_s^4 - T_oo^4) $
    $ Delta T = T_s - T_oo $
    $ T_s^4 - T_oo^4 = (T_s^2 + T_oo^2)(T_s^2 - T_oo^2) = (T_s^2 + T_oo^2)(T_s - T_oo)(T_s + T_oo) $
    $ Q = epsilon sigma A (T_s^2 + T_oo^2)(T_s + T_oo) Delta T $
    $ h = epsilon sigma (T_s^2 + T_oo^2) (T_s + T_oo) $
  ],
  [Q = warmteflux [W], $epsilon$ = emissiviteit [-], $sigma$ = Stefan-Boltzmann constante [$W/(m^2 K^4)$], A = oppervlakte [$m^2$], $Delta T$ = temperatuurverschil [K], $T_s$ = oppervlaktemperatuur [K], $T_oo$ = omgevingstemperatuur [K]],
)

$epsilon = 1$ voor een zwarte straler.

Ontwikkel die haken uit en je krijgt dan terug terug $Q = h A Delta T$.

De h van straling is hier dan heel afhankelijk van de temperatuur.
$ h = epsilon sigma (T_s^2 + T_oo^2) (T_s + T_oo) $

=== Alles te samen


Al deze warmteoverdrachten kunnen ook tesamen voorkomen. Dit kan gemodelleerd worden als een elektrisch circuit (thermisch circuit), waarbij de warmteflux $Q$ analoog is aan de stroom $I$, het temperatuurverschil $delta T$ aan de spanning $U$, en de thermische weerstand $R_(t h)$ aan de elektrische weerstand $R$.


De totale weerstand is de som van de weerstanden in serie:
$ R_(t o t) = R_"cond" + R_"conv" = L/(k A) + 1/(h A) $

Dan geldt:
$ Q = (T_1 - T_oo) / R_(t o t) $


Soms krijg je de oppervlakte niet, en dan kan voeg je die niet in, in de formules

$ q = Q/A = (T_1 - T_oo) / r_(t o t) $
$ r_(c o n v) = 1/h $
met $r_(c o n v) = R_(c o n v) / A$ met eenheden [$m^2 K/W$]
$ r_(c o n d) = L/k $
met $r_(c o n d) = R_(c o n d) / A$ met eenheden [$m^2 K/W$]

=== Typische Problemen

#oefening

#oefening("Oefening 1.2: Isolatie van een pijp", (
  #figure(
    image("Oefening 1.2.png", width: 50%),
    caption: [Oefening 1.2],
  ) <fig:Oefening1.2>

  *Gegeven:*
  - Lengte pijp $L = 50 "m"$
  - Diameter pijp $D_1 = 10 "cm" = 0.1 "m"$ (dus $r_1 = 0.05 "m"$)
  - Temperatuur oppervlak $T_s = 150 °$
  - Omgevingstemperatuur $T_oo = 15 °$
  - Convectie coëfficiënt $h = 20 "W"/(m^2 dot "K")$
  - Thermische conductiviteit isolatie $k = 0.035 "W"/(m dot "K")$

  *Gevraagd:*
  - Bepaal de vereiste isolatiedikte om het warmteverlies met 90% te verminderen.

  *Oplossing:*

  1. *Bereken warmteverlies zonder isolatie ($Q_"ongeïsoleerd"$):*
    $ A_"opp" = pi D_1 L = pi dot 0.1 "m" dot 50 "m" approx 15.71 m^2 $
    $
      Q_"ongeïsoleerd" = h A_"opp" (T_s - T_oo) = 20 "W"/(m^2 dot "K") dot 15.71 m^2 dot (150 - 15) "K" approx 42412 "W"
    $

  2. *Bepaal doel warmteverlies ($Q_"geïsoleerd"$):*
    We willen 90% van het warmteverlies besparen, dus het nieuwe verlies is 10% van het oorspronkelijke:
    $ Q_"geïsoleerd" = 0.10 dot Q_"ongeïsoleerd" = 0.10 dot 42412 "W" = 4241.2 "W" $

  3. *Thermische weerstand netwerk:*
    Voor een geïsoleerde pijp hebben we twee weerstanden in serie: conductie door de isolatie en convectie aan de buitenkant.

    #figure(
      zap.circuit({
        import zap: *
        node("Ts", (0, 0), label: $T_s$)
        resistor("Rcond", "Ts", (rel: (2.5, 0)), label: $R_"cond"$, i: $Q$)
        resistor("Rconv", (rel: (0, 0)), (rel: (2.5, 0)), label: $R_"conv"$)
        node("Too", (rel: (0, 0)), label: $T_oo$)
      }),
      caption: [Thermisch weerstandscircuit],
    )

    De totale weerstand moet zijn:
    $ R_"tot" = (T_s - T_oo) / Q_"geïsoleerd" = 135 "K" / 4241.2 "W" approx 0.03183 "K/W" $

  4. *Los op voor de buitenstraal ($r_2$):*
    De formule voor de totale weerstand is:
    $ R_"tot" = R_"cond" + R_"conv" = (ln(r_2/r_1)) / (2 pi k L) + 1 / (h 2 pi r_2 L) $

    Invullen van de waarden:
    $ 0.03183 = (ln(r_2/0.05)) / (2 pi dot 0.035 dot 50) + 1 / (20 dot 2 pi dot r_2 dot 50) $

    Vereenvoudigen:
    $ 0.03183 = (ln(20 r_2)) / 11.0 + 1 / (6283.2 r_2) $

    Dit is een transcendente vergelijking die iteratief opgelost moet worden.
    Proberen van waarden (trial and error of numeriek):
    - Bij $r_2 = 0.06 "m"$ ($6 "cm"$): $R approx 0.021$ (te laag)
    - Bij $r_2 = 0.07 "m"$ ($7 "cm"$): $R approx 0.036$ (iets te hoog)

    Nauwkeurige oplossing:
    $ r_2 approx 0.0692 "m" = 6.92 "cm" $

  5. *Bereken dikte:*
      $ "Dikte" = r_2 - r_1 = 6.92 "cm" - 5.0 "cm" = 1.92 "cm" $
)

#belangrijk[
  *Opmerking over vraagtypes:*
  Dit is een voorbeeld van een *ontwerpprobleem* (design problem), waarbij je de geometrie (zoals dikte $L$ of straal $r$) zoekt om een bepaalde warmteflux $Q$ of totale weerstand $R_"tot"$ te bereiken.
  Dit staat tegenover een *rating problem*, waarbij de geometrie en materiaaleigenschappen gekend zijn en je de prestatie ($Q$, $T$, etc.) berekent.
]


