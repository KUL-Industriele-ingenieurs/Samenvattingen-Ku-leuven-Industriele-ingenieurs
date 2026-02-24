#import "../../school-template.typ": *

= Relatieve beweging: snelheid

Een relatieve snelheid is de snelheid die een bewegende observator ziet tegenover een andere bewegend deeltje.

#wrap-figure(
  image("relative-velocity.png", width: 8cm),
  caption: [relative-velocity],
  label: <fig:relative-velocity>,
)[

  == Positie

  #frm(
    "positie van punt b ten opzichte van punt a",
    [
      $ r_b = r_a + r_frac(b, a, style: "horizontal") $
    ],
    [
      Met $r_frac(b, a, style: "horizontal")$ is de relatieve positie van punt b ten opzichte van punt a
    ],
  )
]

Maar hoe berekenen we nu de relatieve snelheid?


== Snelheid

#wrap-figure(
  image("relatieve-verplaatsing2.png", width: 8cm),
  caption: [relatieve-verplaatsing2],
  label: <fig:relatieve-verplaatsing2>,
)[

  We gaan een klein verschil in tijd nemen en analyseren wat er gebeurt.
  verplaatsingen worden dus voorgesteld met $d r$
  De vaste rod is een vaste afstand tussen A en B.
  Je ziet dat er een nieuwe vector komt door $d arrow(r)_frac(b, a, style: "horizontal")$. Dit is de relatieve verplaatsing van punt b ten opzichte van punt a.

  We zien dus dat

  $ d arrow(r)_b = d arrow(r)_a + d arrow(r)_frac(b, a, style: "horizontal") $

  de hoek $d theta$ is de verandering in hoek en heeft een relatie met $d arrow(r)_frac(b, a, style: "horizontal")$ en $r$

  Bij heel kleine verschillen in hoeken geld:

  $ d r_frac(b, a, style: "horizontal") = r d theta $

  $d vec(r)_b$ is dus een deel verplaatsing en rotatie.

  Nu gaan we differentiëren naar tijd:

  $ d arrow(r)_b / d t = d arrow(r)_a / d t + markhl(d arrow(r)_frac(b, a, style: "horizontal") / d t, tag: #<d1>) $
  $
    markhl(d arrow(r)_frac(b, a, style: "horizontal") / d t, tag: #<d2>) = omega times r_frac(a, b, style: "horizontal")
    #annot((<d1>, <d2>), pos: right, dx: 2em, leader-connect: "elbow")[Substitutie]
  $

  $ arrow(v)_b = arrow(v)_a + arrow(v)_frac(b, a, style: "horizontal") $

  $ markrect(arrow(v)_b = arrow(v)_a + omega times r_frac(a, b, style: "horizontal")) $


  #frm(
    "verband snelheden van twee punten op hetzelfde starre lichaam",
    [
      $ arrow(v)_b = arrow(v)_a + omega times r_frac(a, b, style: "horizontal") $
      $ arrow(v)_b = arrow(v)_a + arrow(v)_frac(b, a, style: "horizontal") $

    ],
    [
      Met $arrow(v)_frac(b, a, style: "horizontal")$ is de relatieve snelheid van punt b ten opzichte van punt a

      *Zorg dat je w en r niet omdraait. Cross-product is niet commutatief.*
    ],
  )

  #theorie(title: "Cross product regels")[
    $ i times i = 0 $
    $ i times j = k $
    $ i times k = -j $
    $ j times i = -k $
    $ j times j = 0 $
    $ j times k = i $
    $ k times i = j $
    $ k times j = -i $
    $ k times k = 0 $
  ]
]


#belangrijk(
  "Vergeet niet voor deze formule, een starre lichaam is een vlak waar deeltjes op bewegen. Als je de bewegingen kunt projecteren op een vlak gebruik je best deze formules",
)

#TODO("LES VOORBEREIDEN VOLGENDE KEER")

#TODO("oefening 1  toevoegen")

#TODO("oefening 2 toevoegen")

#TODO("oefening 3 toevoegen")

#TODO("oefening 4 toevoegen")


