// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Inleiding <ch:inleiding>

Dit is een voorbeeld van een modulair Typst document. Door je document op te splitsen
in meerdere bestanden wordt het makkelijker om te navigeren en te onderhouden.

== Waarom modulair werken?

#concept(title: "Voordelen van modulaire documenten")[
  - *Overzichtelijkheid*: Elk hoofdstuk in een apart bestand
  - *Snellere navigatie*: Typst compileert snel, maar aparte bestanden zijn makkelijker te vinden
  - *Samenwerking*: Meerdere auteurs kunnen aan verschillende hoofdstukken werken
  - *Herbruikbaarheid*: Hoofdstukken kunnen in andere documenten worden hergebruikt
]

== Structuur van dit project

De mappenstructuur voor dit voorbeeld:

#codeblock(lang: "txt", title: "Project structuur")[
  typst_templates/
  |-- Typst_template-lang-document.typ  // Hoofdbestand
  |-- chapters/
      |-- chapter1_inleiding.typ
      |-- chapter2_theorie.typ
      |-- chapter3_voorbeelden.typ
]

== Hoe te compileren

#oefening(title: "Compilatie instructies")[
  + Open `Typst_template-lang-document.typ` in VS Code
  + Gebruik de Tinymist extensie voor live preview
  + Of compileer via de terminal:
    ```
    typst compile Typst_template-lang-document.typ
    ```
]

#examenbox[Bij grote documenten zoals een thesis is modulair werken essentieel.
Begin er vroeg mee om later problemen te vermijden.]
