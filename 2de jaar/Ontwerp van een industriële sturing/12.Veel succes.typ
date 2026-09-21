#import "../../school-template.typ": *

// Laatste pagina. Namen hier aanpassen als er een auteur bijkomt.
#let auteurs = ("Ruben Ryckaert", "Andere Auteur")

#pagebreak()

#v(1fr)

#align(center)[
  #text(size: 24pt, style: "italic")[Veel succes met de examens!]

  #v(1cm)

  #text(size: 13pt)[
    #for (i, naam) in auteurs.enumerate() [
      #if i > 0 [ \ ]
      --- #naam
    ]
  ]
]

#v(1fr)
