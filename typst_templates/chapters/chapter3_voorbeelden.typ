// chapter3_voorbeelden.typ
// Derde hoofdstuk - Voorbeelden
// Dit bestand wordt geladen via #include "chapters/chapter3_voorbeelden.typ"

#import "../../school-template.typ": *

= Voorbeelden <ch:voorbeelden>

Dit hoofdstuk bevat enkele voorbeelden van berekeningen en code.

== Berekeningen

#voorbeeld(title: "Matrix berekening")[
  $ mat(1, 2; 3, 4) dot vec(x, y) = vec(a, b) $
]

#oefening(title: "Oefening 1")[
  *Gegeven:* $m = 2 "kg"$, $v = 10 "m/s"$

  *Gevraagd:* Bereken de kinetische energie.

  *Oplossing:*
  $ E_k = 1/2 m v^2 = 1/2 times 2 "kg" times (10 "m/s")^2 = 100 "J" $
]

== Code

#codeblock(lang: "python", title: "berekening.py")[
  ```python
  def kinetische_energie(m, v):
    return 0.5 * m * v**2

  E = kinetische_energie(2, 10)
  print(f"Energie: {E} J")
  ```
]

#examenbox[Vergeet niet de eenheden te vermelden bij elke berekening!]
