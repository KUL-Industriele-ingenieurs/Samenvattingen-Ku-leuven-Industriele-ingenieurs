#import "../../school-template.typ": *


#oefening(title: "Oefening 1.2: Isolatie van een pijp")[
  #let exercise-1-2-diagram() = {
    cetz.canvas({
      import cetz.draw: *

      // Pipe (Inner)
      circle((0, 0), radius: 1.5, fill: gray.lighten(50%), stroke: 2pt)
      content((0, 0), [$T_s$])

      // Insulation (Outer)
      circle((0, 0), radius: 2.5, fill: orange.lighten(80%), stroke: (dash: "dashed"))
      content((0, 2), [$k$])

      // Dimensions
      line((-1.5, -3), (1.5, -3), mark: (start: "|", end: "|"), name: "D1")
      content("D1.mid", anchor: "north", padding: 0.2, [$D_1$])

      // Convection
      for a in range(0, 360, step: 45) {
        let r = 2.8
        let x = r * calc.cos(a * 1deg)
        let y = r * calc.sin(a * 1deg)
        line((x, y), (x * 1.2, y * 1.2), mark: (end: ">"), stroke: (paint: blue, dash: "dotted"))
      }
      content((3.5, 3.5), text(fill: blue)[$T_oo, h$])
    })
  }

  #figure(
    exercise-1-2-diagram(),
    caption: [Oefening 1.2: Pijp met isolatie],
  ) <fig:exercise-1-2-diagram>


  *Gegeven:*
  - Lengte pijp $L = 50 "m"$
  - Diameter pijp $D_1 = 10 "cm" = 0.1 "m"$ (dus $r_1 = 0.05 "m"$)
  - Temperatuur oppervlak $T_s = 150 degree$
  - Omgevingstemperatuur $T_oo = 15 degree$
  - Convectie coëfficiënt $h = 20 "W"/(m^2 dot "K")$
  - Thermische conductiviteit isolatie $k = 0.035 "W"/(m dot "K")$

  *Gevraagd:*
  - Bepaal de vereiste isolatiedikte om het warmteverlies met 90% te verminderen.

  *Oplossing:*

  1. *Bereken warmteverlies zonder isolatie ($dot(Q)_"ongeïsoleerd"$):*
    $ A_"opp" = pi D_1 L = pi dot 0.1 "m" dot 50 "m" approx 15.71 m^2 $
    $
      dot(Q)_"ongeïsoleerd" = h A_"opp" (T_s - T_oo) = 20 "W"/(m^2 dot "K") dot 15.71 m^2 dot (150 - 15) "K" approx 42412 "W"
    $

  2. *Bepaal doel warmteverlies ($dot(Q)_"geïsoleerd"$):*
    We willen 90% van het warmteverlies besparen, dus het nieuwe verlies is 10% van het oorspronkelijke:
    $ dot(Q)_"geïsoleerd" = 0.10 dot dot(Q)_"ongeïsoleerd" = 0.10 dot 42412 "W" = 4241.2 "W" $

  3. *Thermische weerstand netwerk:*
    Voor een geïsoleerde pijp hebben we twee weerstanden in serie: conductie door de isolatie en convectie aan de buitenkant.



    De totale weerstand moet zijn:
    $ R_"tot" = (T_s - T_oo) / dot(Q)_"geïsoleerd" = 135 "K" / 4241.2 "W" approx 0.03183 "K/W" $

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
]
