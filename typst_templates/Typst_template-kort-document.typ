#import "../school-template.typ": *

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

// Symbol definitions (first use shows box, subsequent uses render inline)
#sym($alpha$, "Hoekversnelling", "rad/s²")
#sym($F$, "Kracht", "N")

$ integral_0^infinity e^(-x^2) d x = sqrt(pi) / 2 $

We hebben ook shortcuts voor verzamelingen:
$ RR, ZZ, QQ, CC, NN $

// Formularium entries (collected and printed at the end)
#frm("Wet van Ohm", $U = I dot R$, [
  $U$ = spanning (V), $I$ = stroomsterkte (A), $R$ = weerstand (Ω)
])

#frm("Wet van Newton", $F = m dot a$, [
  $F$ = kracht (N), $m$ = massa (kg), $a$ = versnelling (m/s²)
])

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

#oefening(title: "Oefening 1")[
  Bereken de stroom door een weerstand van $R = 10 #unit("Ω")$ bij een spanning van $U = 5 #unit("V")$.
]

#examenbox[Vergeet niet de eenheden te vermelden bij elke berekening!]

#TODO("Voeg meer voorbeelden toe")
#NOTE("Dit is een opmerking voor de auteur")

// Subsequent use of sym just renders inline: the force is #sym($F$, "Kracht", "N").


#printformularium()

#printsymbols()
