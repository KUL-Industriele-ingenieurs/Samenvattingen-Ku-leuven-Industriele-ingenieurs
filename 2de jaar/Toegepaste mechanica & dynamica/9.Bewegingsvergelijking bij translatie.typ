#import "../../school-template.typ": *

= Bewegingsvergelijking bij translatie <ch:beweging-bij-translatie>

Een starre lichaam (een vlak) heeft drie bewegingsmogelijkheden:
- *Translatie* in x-richting
- *Translatie* in y-richting
- *Rotatie* om de z-as

Herinner je dat een starre lichaam een vlak was die je niet kon vervormen en je kunt ze dus alleen laten bewegen.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // De vorm van het starre lichaam
    let body = ((0, 0), (3, 0.5), (4, 2.5), (2, 4), (0.5, 3.5), (-1, 2))
    catmull(..body, close: true, fill: blue.lighten(90%), stroke: 1.2pt + blue.lighten(40%))

    // Coördinatenstelsel (linksonder)
    let ox = -1.8
    let oy = -0.5
    circle((ox, oy), radius: 0.04, fill: black)
    line((ox, oy), (ox + 1.2, oy), mark: (end: "stealth"), stroke: 0.8pt + black)
    content((ox + 1.2, oy), $x$, anchor: "west", padding: 0.08)
    line((ox, oy), (ox, oy + 1.2), mark: (end: "stealth"), stroke: 0.8pt + black)
    content((ox, oy + 1.2), $y$, anchor: "south", padding: 0.08)

    // Massamiddelpunt G (blauw, prominent)
    circle((2, 2), radius: 0.09, fill: blue, stroke: none, name: "G")
    content((2, 2), text(fill: blue)[$G$], anchor: "north-west", padding: .12)

    // Punt P (zwart)
    circle((1, 1), radius: 0.07, fill: black, stroke: none, name: "P")
    content((1, 1), $P$, anchor: "north-east", padding: .12)

    // Positievector r van P naar G
    line("P", "G", stroke: (dash: "dashed", paint: black, thickness: 0.8pt), mark: (end: "stealth"), name: "r_PG")
    content((1.45, 1.7), $arrow(r)_(G\/P)$, anchor: "south-east")

    // Momentarmen x̄ en ȳ (stippellijn van P naar G via rechte hoek)
    line((1, 1), (2, 1), stroke: (dash: "dotted", paint: gray.darken(20%), thickness: 0.8pt))
    content((1.5, 1), $overline(x)$, anchor: "north", padding: 0.06)
    line((2, 1), (2, 2), stroke: (dash: "dotted", paint: gray.darken(20%), thickness: 0.8pt))
    content((2.08, 1.5), $overline(y)$, anchor: "west", padding: 0.05)

    // Versnelling m·a_G aan het massamiddelpunt
    line("G", (3.3, 2.7), stroke: (paint: blue, thickness: 1.5pt), mark: (end: "stealth"), name: "aG")
    content("aG.end", text(fill: blue)[$m arrow(a)_G$], anchor: "south-west", padding: 0.08)

    // Uitwendige krachten (rood)
    line((3.5, 3), (4.6, 3.6), stroke: (paint: red, thickness: 1.2pt), mark: (end: "stealth"))
    content((4.6, 3.6), text(fill: red)[$arrow(F)_1$], anchor: "west")
    line((0.2, 3.2), (-0.6, 4.1), stroke: (paint: red, thickness: 1.2pt), mark: (end: "stealth"))
    content((-0.6, 4.1), text(fill: red)[$arrow(F)_2$], anchor: "south")

    // Rotatieaanduiding bij G (α, ω)
    arc(
      (2, 2),
      start: 30deg,
      stop: 150deg,
      radius: 1.1,
      stroke: (paint: eastern, thickness: 1.2pt),
      mark: (end: "stealth"),
      name: "rot",
    )
    content("rot.mid", text(fill: eastern)[$alpha, omega$], anchor: "south", padding: .22)
  })
]


Translatie is simpel en hebben we al vaak gezien en is simpelweg de wet van Newton toegepast voor de beweging rond het massamiddelpunt:

#frm(
  "Translatie",
  [
    $ sum F_x = m dot (a_G)_x $
    $ sum F_y = m dot (a_G)_y $
  ],
  [
    waarbij $(a_G)_x$ en $(a_G)_y$ de versnelling zijn van het massamiddelpunt.
  ],
)

Nu we de vergelijkingen voor *Translatie* kennen, moeten we die voor de *rotatie* bepalen.
Hoe bekomen we een gelijkaardige vergelijking voor de som van alle momenten?

== Afleiding rotatievergelijking

We nemen een willekeurig massadeeltje $i$ en schrijven de krachten die erop werken (uitwendig $arrow(F)_i$ en inwendig $arrow(f)_i$):

$ arrow(F)_i + arrow(f)_i = m_i arrow(a)_i $

Nu vermenigvuldigen we _beide leden_ met het kruisproduct van de positievector $arrow(r)_i$ (van punt $P$ tot het massadeeltje $i$):

$ arrow(r)_i crossproduct arrow(F)_i + arrow(r)_i crossproduct arrow(f)_i = arrow(r)_i crossproduct m_i arrow(a)_i $

Bij sommatie over alle deeltjes vallen de inwendige momenten weg ($sum cancel(arrow(r)_i crossproduct arrow(f)_i) = 0$, want inwendige krachten treden op in gelijke, tegengestelde paren langs dezelfde werklijn):

$ sum arrow(M)_P = sum (arrow(r)_i crossproduct m_i arrow(a)_i) $

=== Invullen van de kinematische relatie

De versnelling $arrow(a)_i$ van elk deeltje kan als functie van de versnelling van punt $P$ geschreven worden (voor een star lichaam):
$ arrow(a)_i = arrow(a)_P + arrow(alpha) crossproduct arrow(r)_i - omega^2 arrow(r)_i $

Invullen in de momentenvergelijking:
$ (M_P)_i = m_i arrow(r)_i crossproduct (arrow(a)_P + arrow(alpha) crossproduct arrow(r)_i - omega^2 arrow(r)_i) $

De laatste term valt weg want $cancel(arrow(r)_i crossproduct arrow(r)_i) = 0$:
$ (M_P)_i = m_i [arrow(r)_i crossproduct arrow(a)_P + arrow(r)_i crossproduct (arrow(alpha) crossproduct arrow(r)_i)] $

=== Uitwerking in cartesische componenten

We schrijven $arrow(r)_i = x_i hat(i) + y_i hat(j)$, $arrow(a)_P = (a_P)_x hat(i) + (a_P)_y hat(j)$ en $arrow(alpha) = alpha hat(k)$. Het uitwendig product uitwerken geeft:
$
  (M_P)_i hat(k) = m_i [(x_i hat(i) + y_i hat(j)) crossproduct ((a_P)_x hat(i) + (a_P)_y hat(j)) \
  + (x_i hat(i) + y_i hat(j)) crossproduct (alpha hat(k) crossproduct (x_i hat(i) + y_i hat(j)))]
$

Na uitwerking van de kruisproducten:
$
  (M_P)_i hat(k) = m_i [-y_i (a_P)_x + x_i (a_P)_y + alpha x_i^2 + alpha y_i^2] hat(k)
$

Dus scalair:
$ (M_P)_i = m_i [-y_i (a_P)_x + x_i (a_P)_y + alpha r_i^2] $

waarbij $r_i^2 = x_i^2 + y_i^2$.

=== Integratie over het lichaam

Wanneer $m_i arrow d m$ en we integreren over de gehele massa $m$ van het lichaam, krijgen we:

$ sum M_P = -(integral_m y d m)(a_P)_x + (integral_m x d m)(a_P)_y + (integral_m r^2 d m) alpha $

De integralen herkennen we als:
- $integral_m y d m = overline(y) m$ (definitie massamiddelpunt)
- $integral_m x d m = overline(x) m$ (definitie massamiddelpunt)
- $integral_m r^2 d m = I_P$ (traagheidsmoment rond $P$)

#frm(
  "Momentenvergelijking rond punt P",
  [
    $ sum M_P = -overline(y) m (a_P)_x + overline(x) m (a_P)_y + I_P alpha $
  ],
  [
    waarbij $overline(x)$ en $overline(y)$ de coördinaten zijn van $G$ ten opzichte van $P$, en $I_P$ het traagheidsmoment rond de as door $P$.
  ],
)

=== Speciaal geval: $P = G$

Wanneer we $P$ kiezen als het *massamiddelpunt* $G$, dan is $overline(x) = overline(y) = 0$ en $I_P = I_G$:

#frm(
  "Rotatie rond massamiddelpunt",
  [
    $ sum M_G = I_G alpha $
  ],
  [
    De som van de momenten van alle _uitwendige_ krachten rond het massamiddelpunt is gelijk aan het product van het traagheidsmoment en de hoekversnelling.
  ],
)

=== Algemene vorm met Steiner

Wanneer punt $G$ zich op positie $(overline(x), overline(y))$ ten opzichte van $P$ bevindt, geldt volgens de stelling van Steiner dat $I_P = I_G + m(overline(x)^2 + overline(y)^2)$. Substitutie en hergroepering geeft:

$ sum M_P = overline(y) m [-(a_P)_x + overline(y) alpha] + overline(x) m [(a_P)_y + overline(x) alpha] + I_G alpha $

Volgens het kinematisch schema worden $(a_P)_x$ en $(a_P)_y$ uitgedrukt als componenten van $arrow(a)_G$:

#frm(
  "Algemene momentenvergelijking",
  [
    $ sum M_P = -overline(y) m (a_G)_x + overline(x) m (a_G)_y + I_G alpha $
  ],
  [
    waarbij $overline(x)$ en $overline(y)$ de positie van $G$ ten opzichte van $P$ zijn, en $I_G$ het traagheidsmoment rond de as door $G$.
  ],
)

== Equivalent Krachtensysteem

Het principe van de bewegingsvergelijkingen berust op het feit dat de som van alle *uitwendige krachten* en *momenten* op een star lichaam equivalent is aan de *kinetische respons* van dat lichaam. Dit noemen we vaak het d'Alembert-principe in een specifieke vorm. We kunnen elk complex systeem van krachten reduceren tot een resulterende kracht in het massamiddelpunt en een resulterend moment.

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

Zonder deze keuze van $G$ zouden de vergelijkingen "gekoppeld" zijn, wat betekent dat een translatie-versnelling een extra moment zou veroorzaken in de rotatievergelijking.

#waarschuwing(title: "Kinetisch Schema")[
  Bij het oplossen van complexe vraagstukken is het aan te raden om zowel een *Vrijlichaamsschema (VLS)* als een *Kinetisch Schema (KS)* te tekenen.
  - In het *VLS* teken je alle uitwendige krachten ($vec(F)$) en momenten ($M$).
  - In het *KS* teken je de kinetische resultanten $m vec(a)_G$ en het traagheidsmoment $I_G alpha$.
  De vergelijking $sum M_P = sum (cal(M)_k)_P$ stelt simpelweg dat het moment van alles in je VLS gelijk moet zijn aan het moment van alles in je KS.
]
