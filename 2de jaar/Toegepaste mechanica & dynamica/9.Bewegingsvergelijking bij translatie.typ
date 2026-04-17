#import "../../school-template.typ": *

= Bewegingsvergelijking bij translatie <ch:beweging-bij-translatie>

Een starre lichaam (een vlak) heeft drie bewegingsmogelijkheden:
- *Translatie* in x-richting
- *Translatie* in y-richting
- *Rotatie* om de z-as

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // De vorm van het starre lichaam
    let body = ((0, 0), (3, 0.5), (4, 2.5), (2, 4), (0.5, 3.5), (-1, 2))
    catmull(..body, close: true, fill: gray.lighten(80%), stroke: 1pt + gray)

    // Massamiddelpunt G
    circle((2, 2), radius: 0.05, fill: black, name: "G")
    content((2, 2), $G$, anchor: "north-east", padding: .1)

    // Punt P
    circle((1, 1), radius: 0.05, fill: black, name: "P")
    content((1, 1), $P$, anchor: "north-east", padding: .1)

    // Positievector r_i
    line("P", "G", stroke: (dash: "dashed"), mark: (end: "stealth"), name: "r_i")
    content((1.5, 1.5), $arrow(r)_i$, anchor: "south-east")

    // Versnelling a_P
    line("P", (0, 0.5), stroke: blue, mark: (end: "stealth"))
    content((0, 0.5), $arrow(a)_P$, anchor: "east")

    // Krachten
    line((3.5, 3), (4.5, 3.5), stroke: red, mark: (end: "stealth"))
    content((4.5, 3.5), $arrow(F)_1$, anchor: "west")

    line((0.2, 3.2), (-0.5, 4), stroke: red, mark: (end: "stealth"))
    content((-0.5, 4), $arrow(F)_2$, anchor: "south")

    // Rotatie
    arc((2, 2), start: 45deg, stop: 135deg, radius: 1, mark: (end: "stealth"), name: "rot")
    content("rot.mid", $alpha, omega$, anchor: "south", padding: .2)
  })
]

#frm(
  "Translatie",
  [
    $ sum F_x = m dot a_x $
    $ sum F_y = m dot a_y $
  ],
  [
    waarbij $a_x$ en $a_y$ de versnelling zijn van het massamiddelpunt.
  ],
)

Nu we de vergelijkingen voor *translatie* kennen, moeten we die voor de *rotatie* bepalen.
Hoe bekomen we een gelijkaardige vergelijking voor de som van alle momenten?

We vertrekken van de tweede wet van Newton voor elk deeltje $i$ in het starre lichaam:
$ arrow(F)_i + arrow(f)_i = m_i arrow(a)_i $
waarbij $arrow(F)_i$ de uitwendige krachten zijn en $arrow(f)_i$ de inwendige krachten tussen de deeltjes onderling.

Het moment $arrow(M)_P$ ten opzichte van een willekeurig punt $P$ is het kruisproduct van de positievector $arrow(r)_i$ (vanaf $P$) met de krachten:
$ arrow(r)_i crossproduct arrow(F)_i + arrow(r)_i crossproduct arrow(f)_i = arrow(r)_i crossproduct m_i arrow(a)_i $

Bij sommatie over alle deeltjes vallen de inwendige momenten weg ($sum cancel(arrow(r)_i crossproduct arrow(f)_i) = 0$):
$ sum arrow(M)_P = sum (arrow(r)_i crossproduct m_i arrow(a)_i) $

De versnelling $arrow(a)_i$ van elk deeltje kan geschreven worden als functie van de versnelling van punt $P$ (gegeven dat het een star lichaam is):
$ arrow(a)_i = arrow(a)_P + arrow(alpha) crossproduct arrow(r)_i - omega^2 arrow(r)_i $

Invullen in de momentenvergelijking geeft:
$
  sum arrow(M)_P = sum m_i arrow(r)_i crossproduct (arrow(a)_P + arrow(alpha) crossproduct arrow(r)_i - omega^2 arrow(r)_i)
$

Aangezien $cancel(arrow(r)_i crossproduct arrow(r)_i) = 0$, vereenvoudigt dit tot:
$
  sum arrow(M)_P = (sum m_i arrow(r)_i) crossproduct arrow(a)_P + sum m_i [arrow(r)_i crossproduct (arrow(alpha) crossproduct arrow(r)_i)]
$

Wanneer we $P$ kiezen als het *massamiddelpunt* $G$, dan is $cancel(sum m_i arrow(r)_i) = 0$ (per definitie van het massamiddelpunt). Voor een vlakke beweging (waarbij $arrow(alpha)$ loodrecht op het vlak staat) herleidt de laatste term zich tot $I_G alpha$.

== Equivalent Krachtensysteem

Het principe van de bewegingsvergelijkingen berust op het feit dat de som van alle *uitwendige krachten* en *momenten* op een star lichaam equivalent is aan de *kinetische respons* van dat lichaam. Dit noemen we vaak het d'Alembert-principe in een specifieke vorm: we kunnen elk complex systeem van krachten reduceren tot een resulterende kracht in het massamiddelpunt en een resulterend moment.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    let body_pts = ((0, 0), (2, 0.5), (2.5, 2), (1, 2.5), (-0.5, 1.5))

    // Links: Uitwendige krachten
    group({
      translate((-2, 0))
      catmull(..body_pts, close: true, fill: gray.lighten(90%), stroke: 0.5pt + gray)
      circle((1, 1.25), radius: 0.05, fill: black, name: "G1")
      content("G1", $G$, anchor: "north", padding: 0.1)

      line((2, 1.5), (3, 1.8), stroke: red, mark: (end: "stealth"))
      content((3, 1.8), $arrow(F)_1$, anchor: "west")

      line((0, 2.2), (-0.5, 3), stroke: red, mark: (end: "stealth"))
      content((-0.5, 3), $arrow(F)_2$, anchor: "south")

      content((1, -0.5), [ *Uitwendige Krachten* ])
    })

    // Equivalent symbool
    content((1.5, 1.25), text(size: 20pt)[$approx$])

    // Rechts: Kinetisch equivalent (Inertie)
    group({
      translate((4, 0))
      catmull(..body_pts, close: true, fill: blue.lighten(95%), stroke: 0.5pt + blue)
      circle((1, 1.25), radius: 0.05, fill: black, name: "G2")
      content("G2", $G$, anchor: "north", padding: 0.1)

      // m*a_G
      line("G2", (2.5, 2), stroke: (paint: blue, thickness: 1.5pt), mark: (end: "stealth"), name: "ma")
      content("ma.end", $m arrow(a)_G$, anchor: "west")

      // I*alpha
      arc(
        (1, 1.25),
        start: 45deg,
        stop: 315deg,
        radius: 0.6,
        stroke: (paint: blue, thickness: 1.5pt),
        mark: (end: "stealth"),
        name: "Ialpha",
      )
      content("Ialpha.mid", $I_G alpha$, anchor: "west", padding: 0.2)

      content((1, -0.5), [ *Kinetisch Equivalent* ])
    })
  })
]

=== Waarom mag dit?
Elk systeem van krachten op een star lichaam kan wiskundig gereduceerd worden naar een *kracht-koppel systeem* in een willekeurig punt. Door specifiek het massamiddelpunt $G$ te kiezen, ontkoppelen we de vergelijkingen:
1. De *translatie* wordt enkel bepaald door de som van de krachten ($sum arrow(F) = m arrow(a)_G$).
2. De *rotatie* wordt enkel bepaald door de som van de momenten rond $G$ ($sum arrow(M)_G = I_G arrow(alpha)$).

Zonder deze keuze van $G$ zouden de vergelijkingen "gekoppeld" zijn, wat betekent dat een translatie-versnelling een extra moment zou veroorzaken in de rotatievergelijking (zoals we zagen in de term $(sum m_i arrow(r)_i) crossproduct arrow(a)_P$ die enkel nul is als $P=G$).

== Algemene Momentenvergelijking (Punt $P$)

In veel oefeningen is het makkelijker om momenten te nemen rond een punt $P$ dat geen massamiddelpunt is (bijvoorbeeld een steunpunt of een rollend contact). Het principe blijft hetzelfde: de uitwendige momenten zijn gelijk aan de kinetische momenten:

$ sum vec(M)_P = sum (cal(M)_k)_P $

Waarbij $sum (cal(M)_k)_P$ de som is van de momenten van de kinetische vectoren ($m vec(a)_G$ en $I_G alpha$) ten opzichte van punt $P$. Voor een star lichaam in het vlak wordt dit:

$ sum M_P = I_G alpha + vec(r)_(G\/P) times m vec(a)_G $

In scalaire vorm (zoals vaak gebruikt in de kinetische schema's):
$ sum M_P = I_G alpha + m (a_G)_x (y_G - y_P) + m (a_G)_y (x_G - x_P) $
*(Let op de tekens van de momentarmen afhankelijk van de rotatierichting!)*

#waarschuwing(title: "Kinetisch Schema")[
  Bij het oplossen van complexe vraagstukken is het aan te raden om zowel een **Vrijlichaamsschema (VLS)** als een **Kinetisch Schema (KS)** te tekenen.
  - In het **VLS** teken je alle uitwendige krachten ($vec(F)$) en momenten ($M$).
  - In het **KS** teken je de kinetische resultanten $m vec(a)_G$ en het traagheidsmoment $I_G alpha$.
  De vergelijking $sum M_P = sum (cal(M)_k)_P$ stelt simpelweg dat het moment van alles in je VLS gelijk moet zijn aan het moment van alles in je KS.
]

#frm(
  "Rotatie",
  [
    $ sum M_z = I_z dot alpha $
  ],
  [
    waarbij $I_z$ het traagheidsmoment is rond de z-as door het massamiddelpunt.
  ],
)
