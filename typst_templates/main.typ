#import "school-template.typ": *

#show: project.with(
  title: "Typst Samenvatting Voorbeeld",
  course: "Ingenieurswetenschappen",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

= Inleiding
Dit document laat zien dat de styling van Typst nu overeenkomt met de LaTeX-versie. We gebruiken dezelfde kleuren, lettertypes en box-stijlen.

== Waarom Typst?
Typst is extreem snel. Je ziet je wijzigingen direct in de preview zonder te wachten op een trage LaTeX compiler.

#theorie(title: "De Basis")[
  In Typst gebruik je `#` voor functies en `$` voor wiskunde. Het lettertype is *Bitstream Charter*, net als in de LaTeX samenvattingen.
]

= Wiskunde
Wiskunde is krachtig en intuïtief.

$ integral_0^infinity e^(-x^2) d x = sqrt(pi) / 2 $

We hebben ook shortcuts voor verzamelingen:
$ RR, ZZ, QQ, CC, NN $

#form(title: "Wet van Ohm")[
  $ U = I dot R $
  #v(4pt)
  Hierbij is:
  - $U$ de spanning in Volt (#unit("V"))
  - $I$ de stroomsterkte in Ampère (#unit("A"))
  - $R$ de weerstand in Ohm (#unit("Ω"))
]

= Code Voorbeeld
Je kunt code blokken toevoegen die eruit zien als VS Code:

#codeblock(lang: "python", title: "berekening.py")[
  def hallo_wereld():
      print("Hallo Ingenieurs!")
      
  x = 5 + 10
  print(f"Resultaat: {x}")
]

= Andere Blokken

#voorbeeld(title: "Matrix berekening")[
  $ mat(1, 2; 3, 4) dot vec(x, y) = vec(a, b) $
]

#waarschuwing[
  Let op de eenheden bij je berekeningen!
]

#concept(title: "Systeemtheorie")[
  Een systeem is stabiel als alle polen in het linkerhalfvlak liggen.
]
