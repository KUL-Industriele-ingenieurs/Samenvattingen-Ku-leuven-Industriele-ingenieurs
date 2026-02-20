// macro_usage_guide.typ
// =============================================================================
//                    TYPST TUTORIAL VOOR SAMENVATTINGEN
//                    KU Leuven - School Template Handleiding
// =============================================================================
// Dit document is zowel een tutorial als een referentie voor alle features
// van het school-template pakket voor Typst. Het is bedoeld als leermiddel
// voor studenten die Typst willen gebruiken voor hun cursussamenvattingen.
//
// Auteur: School-Macros Project
// Versie: 1.0 (Typst Edition 2026)
// =============================================================================

#import "../school-template.typ": *

#show: project.with(
  title: "Typst Tutorial",
  course: "School Template Handleiding v1.0",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

= Snel aan de slag

== Je eerste document

Een minimaal Typst document met school-template ziet er als volgt uit:

#codeblock(lang: "typst", title: "Minimaal Voorbeeld")[
  ```
  #import "school-template.typ": *

  #show: project.with(
    title: "Mijn Samenvatting",
    course: "Vaknaam",
    authors: ("Jouw Naam",),
    academic_year: "2025-2026",
  )

  = Inleiding
  Hier begint je inhoud...

  // Appendix
  #printsymbols()
  #printformularium()
  ```
]

#waarschuwing(title: "Typst vs LaTeX")[
  Typst compileert *veel sneller* dan LaTeX en heeft een eenvoudigere syntax.
  Je hoeft geen extra compilatieronden te doen --- alles wordt in één keer verwerkt.
  Typst is ook *live-preview* in VS Code met de Tinymist extensie.
]

== Verschil met LaTeX

#theorie(title: "Waarom Typst?")[
  *Voordelen van Typst:*
  - Veel snellere compilatie (milliseconden in plaats van seconden)
  - Eenvoudigere, leesbaardere syntax
  - Ingebouwde scripting (geen aparte pakketten nodig)
  - Live preview in VS Code

  *Beperkingen:*
  - Kleiner ecosysteem dan LaTeX (minder pakketten)
  - Geen `tikz` of `circuitikz` (gebruik afbeeldingen in plaats daarvan)
  - Nog relatief nieuw, sommige features ontbreken
]

== VS Code Setup

Om met Typst te werken in VS Code heb je de *Tinymist* extensie nodig.
Deze geeft je:
- Live preview van je document
- Syntax highlighting
- Autocomplete voor Typst functies

#concept(title: "Installatie")[
  + Installeer de *Tinymist* extensie in VS Code
  + Open een `.typ` bestand
  + Klik op het preview icoon rechtsboven (of `Ctrl+K V`)
  + Je ziet nu een live preview van je document
]

= Basis Typst Syntax

== Tekstopmaak

Typst heeft een eenvoudige syntax voor tekstopmaak:

#codeblock(lang: "typst", title: "Basis Tekstopmaak")[
  ```
  *Vetgedrukt*
  _Cursief_
  #underline[Onderstreept]
  #emph[Nadruk]
  `monospace`
  #text(fill: red)[Gekleurde tekst]
  #smallcaps[Kleine Hoofdletters]

  = Heading 1
  == Heading 2
  === Heading 3
  ```
]

Resultaat:

*Vetgedrukt* \
_Cursief_ \
#underline[Onderstreept] \
#emph[Nadruk] \
`monospace` \
#text(fill: red)[Gekleurde tekst] \
#smallcaps[Kleine Hoofdletters]

== Tekstgrootte

Je kan de grootte van de tekst aanpassen met `#text(size: ...)`:

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  table.header([*Code*], [*Resultaat*]),
  [`#text(size: 6pt)[Heel klein]`], [#text(size: 6pt)[Heel klein]],
  [`#text(size: 8pt)[Klein]`], [#text(size: 8pt)[Klein]],
  [`#text(size: 10pt)[Normaal]`], [#text(size: 10pt)[Normaal]],
  [`#text(size: 14pt)[Groot]`], [#text(size: 14pt)[Groot]],
  [`#text(size: 18pt)[Groter]`], [#text(size: 18pt)[Groter]],
  [`#text(size: 24pt)[Nog groter]`], [#text(size: 24pt)[Nog groter]],
)

== Lijstjes maken

Lijstjes zijn super handig voor samenvattingen!

#codeblock(lang: "typst", title: "Opsommingen")[
  ```
  // Ongeordende lijst (bolletjes)
  - Eerste punt
  - Tweede punt
    - Genest punt

  // Geordende lijst (nummers)
  + Stap 1
  + Stap 2
    + Sub-stap
  ```
]

Resultaat:

- Eerste punt
- Tweede punt
  - Genest punt

+ Stap 1
+ Stap 2
  + Sub-stap

== Nieuwe regel of nieuwe alinea?

- *Nieuwe alinea:* Laat *één witregel* open in je code. Dit is de standaard manier!
- *Harde enter:* Gebruik `\` aan het einde van een regel.
- *Nieuwe pagina:* Gebruik `#pagebreak()`.

#codeblock(lang: "typst", title: "Regels en Alinea's")[
  ```
  Dit is de eerste alinea.

  Dit is een nieuwe alinea (witregel ertussen).

  Dit is regel 1 \
  Dit is regel 2 (harde enter met backslash)
  ```
]

== Commentaar

Alles wat je achter `//` typt, wordt genegeerd door Typst:

#codeblock(lang: "typst", title: "Commentaar")[
  ```
  Dit is tekst die in de PDF komt.
  // Dit is een notitie, dit zie je niet in de PDF.
  Hier gaat de tekst verder.
  ```
]

= Tekst Markeren & Annoteren (mannot)

De template bevat het *mannot* pakket voor handgeschreven-stijl markeringen en annotaties.

== Markeren

Gebruik de volgende functies om tekst te markeren:
- `#mark`: $mark("Verandert de tekstkleur")$.
- `#markhl`: $markhl("Markeerstift (highlight) effect")$.
- `#markrect`: $markrect("Tekent een rechthoek (kader)")$.
- `#markul`: $markul("Onderlijnt de tekst")$.

#codeblock(lang: "typst", title: "Markeren")[
  ```
  $
    mark(x, color: #red)
    + markhl(f(x))
    + markrect(e^x)
    + markul(x + 1)
  $
  ```
]

Je kunt kleuren en stijlen aanpassen:

#codeblock(lang: "typst", title: "Stijlen Aanpassen")[
  ```
  $
    mark(x, color: #green)
    + markhl(f(x), color: #purple, stroke: 1pt)
    + markrect(e^x, color: #red, fill: #blue, outset: 0.2em)
  $
  ```
]

== Annotaties

Om tekst te annoteren, moet je het eerst markeren met een unieke `tag`. Daarna gebruik je `#annot` om de notitie te plaatsen.

#codeblock(lang: "typst", title: "Annotaties")[
  ```
  $
    markhl(x, tag: #<1>)
    + markrect(y, tag: #<2>)

    #annot(<1>)[Dit is x]
    #annot(<2>, pos: top)[Dit is y]
  $
  ```
]

== Positionering

Gebruik `pos`, `dx` en `dy` om de annotatie te positioneren:
- `pos`: Positie relatief aan de markering (bv. `top`, `bottom`, `left`, `right`).
- `dx`, `dy`: Verschuiving in x- en y-richting.

#codeblock(lang: "typst", title: "Positionering")[
  ```
  $
    mark(z, tag: #<z>)
    #annot(<z>, pos: top + right, dy: -1em)[Annotatie]
  $
  ```
]

== Pijlen (Leader Lines)

Als de annotatie ver van de tekst staat, wordt automatisch een pijl getekend.
- `leader-connect: "elbow"` maakt een gehoekte pijl.
- `leader-stroke`: Stijl van de lijn (bv. `1pt + red`).
- `leader-tip` / `leader-toe`: Pijlpunten (via `tiptoe` package).

#codeblock(lang: "typst", title: "Pijlen")[
  ```
  $
    markrect(t, tag: #<t>)
    #annot(<t>, pos: bottom, dy: 2em, leader-connect: "elbow")[Tijd]
  $
  ```
]

== Meerdere Elementen

Je kunt één annotatie naar meerdere elementen laten wijzen door een array van tags mee te geven.

#codeblock(lang: "typst", title: "Meerdere Elementen")[
  ```
  $
    mark(a, tag: #<a>) + mark(b, tag: #<b>)
    #annot((<a>, <b>), pos: top, dy: -1.5em)[Variabelen]
  $
  ```
]

== Geavanceerd: CeTZ Annotaties

Voor complexe tekeningen kun je `#annot-cetz` gebruiken om direct op de gemarkeerde elementen te tekenen met CeTZ.

#codeblock(lang: "typst", title: "CeTZ Annotatie")[
  ```
  $
    mark(x, tag: #<x>)
    #annot-cetz((<x>), cetz, {
      import cetz.draw: *
      line("x.north", (0, 2), name: "l")
      content("l.end", [Punt])
    })
  $
  ```
]

= Samenwerken en Issues (GitHub)

Samenwerken aan deze samenvattingen gebeurt via GitHub. We gebruiken de VS Code extensie *GitHub Pull Requests and Issues* om dit makkelijk te maken.

== Issues Aanmaken

Als je een fout vindt of iets wilt toevoegen, kun je direct vanuit je code een "Issue" aanmaken op GitHub.

#oefening(title: "Stap-voor-stap: Issue maken")[
  + Typ in je Typst bestand een commentaar met `// @issue:` of `// TODO:`.
  + Klik op het lampje dat verschijnt (of druk `Ctrl+.`).
  + Kies *"Create issue from comment"*.
  + VS Code maakt nu automatisch een taak aan op GitHub.
]

== Aan een Issue Werken

+ Ga naar de *Source Control* tab (links, met het vertakking-icoon).
+ Kijk onderaan bij *GitHub / Issues*.
+ Rechtsklik op een issue en kies *"Start Working on Issue"*.
+ VS Code maakt automatisch een nieuwe _branch_ aan.

== Klaar? Pull Request!

+ Commit je wijzigingen ("Commit & Push").
+ Er verschijnt een knop *"Create Pull Request"*.
+ In de beschrijving kun je het issue automatisch sluiten: `Fixes #123`.

= Eenheden en Getallen (unify)

De template bevat het *unify* pakket --- het Typst-equivalent van LaTeX's `siunitx`.
Hiermee kun je getallen, eenheden en bereiken correct formatteren.

== Basis gebruik

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  table.header([*Code*], [*Resultaat*]),
  [`$qty("50", "km/h")$`], [$qty("50", "km/h")$],
  [`$qty("9.81", "m/s^2")$`], [$qty("9.81", "m/s^2")$],
  [`$qty("1.5", "kN")$`], [$qty("1.5", "kN")$],
  [`$qty("3e8", "m/s")$`], [$qty("3e8", "m/s")$],
  [`$num("1234567")$`], [$num("1234567")$],
  [`$num("3.14159")$`], [$num("3.14159")$],
  [`$num("-1.32865+-0.50273e-6")$`], [$num("-1.32865+-0.50273e-6")$],
)

== Bereiken

$numrange("1", "10")$ \
$qtyrange("20", "30", "m/s")$

Code:
#codeblock(lang: "typst", title: "Bereiken")[
  ```
  $numrange("1", "10")$
  $qtyrange("20", "30", "m/s")$
  ```
]

#examenbox[Gebruik *altijd* `qty()` of `num()` voor getallen en eenheden om consistente spatiëring en opmaak te krijgen.]


= Document Structuur & Layout

== Pagina-instellingen
Je kan de pagina-afmetingen en marges aanpassen met `#set page(...)`.
Meestal staat dit bovenaan je document.

#codeblock(lang: "typst", title: "Pagina Setup")[
  ```
  #set page(
    paper: "a4",
    margin: (x: 2cm, y: 2cm),
    numbering: "1 / 1",
  )
  ```
]

== Kolommen
Je kan tekst in kolommen zetten met de `columns()` functie of `#show: columns`.

#codeblock(lang: "typst", title: "Kolommen")[
  ```
  // Voor het hele document:
  #show: rest => columns(2, rest)

  // Of voor een specifiek blok:
  #columns(2)[
    Dit is tekst in de eerste kolom.
    #colbreak()
    Dit staat in de tweede kolom.
  ]
  ```
]

== Inhoudsopgave (Outline)
Een inhoudsopgave wordt automatisch gegenereerd op basis van je headings (`=`, `==`, ...).

#codeblock(lang: "typst", title: "TOC")[
  ```
  #outline(
    title: "Inhoud",
    indent: auto,
    depth: 3
  )
  #pagebreak()
  ```
]

== Bibliografie & Referenties
Typst heeft ingebouwde bibliografie-ondersteuning.
Upload een `.bib` bestand en link het.

#codeblock(lang: "typst", title: "Bibliografie")[
  ```
  // Linken naar het bib bestand
  #bibliography("bronnen.bib", style: "apa")

  // Citeren in de tekst
  Zoals vermeld in @netwok2020 ...
  ```
]

= Box Omgevingen

De template heeft macros om belangrijke dingen te markeren zoals definities, theorema's, oefeningen, voorbeelden en waarschuwingen. Elke box heeft een gekleurd titel-tabblad bovenaan.

== Concept (Definities)

#concept(title: "Snijsnelheid")[
  De *snijsnelheid* ($v_c$) is de omtrekssnelheid van het gereedschap ten opzichte
  van het werkstuk, uitgedrukt in $"m/min"$.
]

Code:
#codeblock(lang: "typst", title: "Concept Box")[
  ```
  #concept(title: "Snijsnelheid")[
    De *snijsnelheid* ($v_c$) is de omtrekssnelheid...
  ]
  ```
]

== Theorie (Stellingen)

#theorie(title: "Energiebehoud")[
  In een gesloten systeem zonder externe krachten blijft de totale mechanische energie behouden:
  $ E_"totaal" = E_k + E_p = "constant" $
]

Code:
#codeblock(lang: "typst", title: "Theorie Box")[
  ```
  #theorie(title: "Energiebehoud")[
    In een gesloten systeem...
    $ E_"totaal" = E_k + E_p = "constant" $
  ]
  ```
]

== Oefening (Oefeningen)

#oefening(title: "Oefening 1.1")[
  *Gegeven:* $m = 5 "kg"$, $v = 10 "m/s"$

  *Gevraagd:* Bereken de kinetische energie.

  *Oplossing:*
  $ E_k = frac(1, 2) m v^2 = frac(1, 2) times 5 times 10^2 = 250 "J" $
]

== Voorbeeld (Praktijkvoorbeelden)

#voorbeeld(title: "Praktisch voorbeeld: Fietser")[
  Een fietser met massa $80 "kg"$ rijdt met $25 "km/h"$.
  De kinetische energie is:
  $ v = 25 "km/h" = 6.94 "m/s" $
  $ E_k = frac(1, 2) times 80 times 6.94^2 = 1930 "J" approx 1.9 "kJ" $
]

== Waarschuwing (Warningbox)

#waarschuwing(title: "Veelgemaakte fout")[
  *Let op:* Vergeet niet om eenheden te converteren naar SI voordat je berekeningen maakt!
]

== Theorem

#theorem(title: "Stelling van Pythagoras")[
  In een rechthoekige driehoek geldt: $a^2 + b^2 = c^2$
]

== Alle box types overzicht

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, left, left),
  table.header([*Type*], [*Functie*], [*Kleur*]),
  [Theorie], [`#theorie(title: "...")[...]`], [Blauw],
  [Concept], [`#concept(title: "...")[...]`], [Teal],
  [Voorbeeld], [`#voorbeeld(title: "...")[...]`], [Groen],
  [Oefening], [`#oefening(title: "...")[...]`], [Groen],
  [Waarschuwing], [`#waarschuwing(title: "...")[...]`], [Rood],
  [Formule], [`#form(title: "...")[...]`], [Oranje],
  [Theorem], [`#theorem(title: "...")[...]`], [Diepblauw],
)

= Formules met \#frm

De `#frm()` functie is de kern van het formularium-systeem. Het:
+ Toont de formule in een mooie oranje box
+ Registreert de formule automatisch voor het formularium

== Gebruik

#frm("Kinetische Energie", $E_k = frac(1, 2) m v^2$, [
  met $m$ = massa ($"kg"$) en $v$ = snelheid ($"m/s"$)
])

Code:
#codeblock(lang: "typst", title: "Formularium Entry")[
  ```
  #frm("Kinetische Energie", $E_k = frac(1, 2) m v^2$, [
    met $m$ = massa ($"kg"$) en $v$ = snelheid ($"m/s"$)
  ])
  ```
]

== Meer voorbeelden

#frm("Potentiële Energie", $E_p = m g h$, [
  met $g$ = valversnelling ($"m/s²"$) en $h$ = hoogte ($"m"$)
])

#frm("Arbeid", $W = arrow(F) dot arrow(s) = F s cos theta$, [
  met $F$ = kracht ($"N"$), $s$ = verplaatsing ($"m"$), $theta$ = hoek ($"rad"$)
])

#frm(
  "Meerdere Formules",
  [
    $ F = m a $
    $ E = m c^2 $
  ],
  [
    Voorbeeld van meerdere formules in één blok.
  ],
)


== Text wrap rond figuren
Gebruik `#wrap-figure` om tekst rond een afbeelding te laten lopen.

// Voorbeeld van wrap-figure gebruik:
#wrap-figure(
  image("default-ui-image-placeholder-wireframes-260nw-1037719192.webp", width: 100%),
  caption: [Een wireframe placeholder.],
  label: <fig:wireframe>,
  width: 5cm,
  align: right,
)[
  #lorem(80)
]

Code:
#codeblock(lang: "typst", title: "Text wrap rond figuren")[
  ```
  #wrap-figure(
    image("afbeelding.png", width: 100%),
    caption: [Onderschrift],
    label: <fig:label>,
    width: 5cm,
    align: right
  )[
    Hier komt de tekst die rond de afbeelding moet lopen.
    #lorem(40)
  ]
  ```
]

#wrap-figure(
  image("test.png", width: 80%),
  caption: [test],
  label: <fig:test>,
  width: 5cm,
  align: right,
)[
  #lorem(40)
]

= Afbeeldingen Toevoegen (Nieuwe Workflow)

We gebruiken de *Paste Image* extensie voor een snellere workflow.

+ *Kopieer* een afbeelding (of screenshot).
+ *Plak* in VS Code (`Ctrl+Alt+V` of Command Palette `Paste Image`).
+ Je krijgt een popup om de *bestandsnaam* te kiezen.
+ De extensie slaat de afbeelding op in de *huidige map* en voegt automatisch de `figure` code toe!

== Snippets

Typ `fig` en druk op `Tab` om snel een standaard figuur in te voegen.
Typ `wrapfig` en druk op `Tab` om een `#wrap-figure` blok in te voegen.


== Formularium afdrukken

Aan het einde van je document kun je alle geregistreerde formules afdrukken:

#codeblock(lang: "typst", title: "Formularium Printen")[
  ```
  // Eén kolom:
  #printformularium()

  // Twee kolommen (compact):
  #printformulariumtwocol()
  ```
]

= Symbolen met \#sym

De `#sym()` functie introduceert symbolen. Bij eerste gebruik wordt een volledige uitleg getoond; daarna alleen het symbool.

== Eerste vermelding

#sym($F$, "Kracht", "N")

#sym($v$, "Snelheid", "m/s")

== Herhaald gebruik

Na de eerste vermelding toont `#sym(...)` alleen het symbool: #sym($F$, "Kracht", "N")

Dit voorkomt herhaling en houdt je document overzichtelijk.

Code:
#codeblock(lang: "typst", title: "Symbolen")[
  ```
  // Eerste gebruik (toont definitie):
  #sym($F$, "Kracht", "N")

  // Herhaald gebruik (toont alleen F):
  #sym($F$, "Kracht", "N")
  ```
]

== Symbolenlijst afdrukken

#codeblock(lang: "typst", title: "Symbolen Printen")[
  ```
  // Aan het einde van je document:
  #printsymbols()
  ```
]

= Wiskunde in Typst

Typst heeft een krachtige ingebouwde wiskundemodus. De syntax is wat anders dan LaTeX maar vaak eenvoudiger.

== Basis wiskunde

#codeblock(lang: "typst", title: "Wiskunde Basis")[
  ```
  // Inline wiskunde:
  De formule $E = m c^2$ is beroemd.

  // Display wiskunde (gecentreerd):
  $ E = m c^2 $

  // Breuken:
  $ frac(a, b) $

  // Wortels:
  $ sqrt(x) $    en    $ root(3, x) $
  ```
]

Resultaat:

De formule $E = m c^2$ is beroemd.

$ E = m c^2 $

$ frac(a, b) quad quad sqrt(x) quad quad root(3, x) $

== Verzamelingen (Math Helpers)

De template bevat snelkoppelingen voor verzamelingen:

$ #NN quad #ZZ quad #QQ quad #RR quad #CC $

Code: `$#NN$` `$#ZZ$` `$#QQ$` `$#RR$` `$#CC$`

== Afgeleiden (physica pakket)

De template bevat het *physica* pakket voor wiskundige notatie in de natuurkunde.
Dit geeft je LaTeX-achtige commando's voor afgeleiden:

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  table.header([*Code*], [*Resultaat*]),
  [`$dv(y,x)$`], [$dv(y, x)$],
  [`$dv(y,x,2)$`], [$dv(y, x, 2)$],
  [`$pdv(f,x)$`], [$pdv(f, x)$],
  [`$pdv(f,x,2)$`], [$pdv(f, x, 2)$],
  [`$grad f$`], [$grad f$],
  [`$div va(F)$`], [$div va(F)$],
  [`$curl va(F)$`], [$curl va(F)$],
  [`$laplacian f$`], [$laplacian f$],
  [`$braket(psi, phi)$`], [$braket(psi, phi)$],
)

== Matrices en Vectoren

#codeblock(lang: "typst", title: "Matrices")[
  ```
  // Matrix:
  $ mat(1, 2; 3, 4) $

  // Vector:
  $ vec(x, y, z) $

  // Pijl-vector:
  $ arrow(F) $
  ```
]

Resultaat:
$ mat(1, 2; 3, 4) quad quad vec(x, y, z) quad quad arrow(F) $

== Stelsels en Uitlijning

Gebruik `cases` voor stelsels en `&` voor uitlijning.

#codeblock(lang: "typst", title: "Stelsels & Uitlijning")[
  ```
  // Gevalonderscheid (Cases):
  $ f(x) = cases(
    x "als" x > 0,
    -x "als" x <= 0
  ) $

  // Uitlijnen op het is-gelijk-teken:
  $ a &= b + c \
      &= d + e $
  ```
]

Resultaat:
$
  f(x) = cases(
    x "als" x > 0,
    -x "als" x <= 0
  )
$
$
  a & = b + c \
    & = d + e
$


== Veelgebruikte symbolen

=== Griekse letters

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: (left, left, left, left),
  table.header([*Code*], [*Res*], [*Code*], [*Res*]),
  [`$alpha$`], [$alpha$], [`$beta$`], [$beta$],
  [`$gamma$`], [$gamma$], [`$delta$`], [$delta$],
  [`$epsilon$`], [$epsilon$], [`$theta$`], [$theta$],
  [`$lambda$`], [$lambda$], [`$mu$`], [$mu$],
  [`$pi$`], [$pi$], [`$rho$`], [$rho$],
  [`$sigma$`], [$sigma$], [`$tau$`], [$tau$],
  [`$phi$`], [$phi$], [`$omega$`], [$omega$],
  [`$Delta$`], [$Delta$], [`$Omega$`], [$Omega$],
)

=== Pijlen

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, left, left),
  table.header([*Naam*], [*Code*], [*Symbool*]),
  [Rechts], [`$arrow.r$`], [$arrow.r$],
  [Links], [`$arrow.l$`], [$arrow.l$],
  [Links & Rechts], [`$arrow.l.r$`], [$arrow.l.r$],
  [Impliceert], [`$=>$` of `$implies$`], [$=>$],
  [Equivalent], [`$<==>$` of `$iff$`], [$<==>$],
  [Mapsto], [`$|->$`], [$|->$],
  [Omhoog], [`$arrow.t$`], [$arrow.t$],
  [Omlaag], [`$arrow.b$`], [$arrow.b$],
)

=== Operatoren en Relaties

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, left, left),
  table.header([*Beschrijving*], [*Code*], [*Symbool*]),
  [Vermenigvuldigen], [`$times$` of `$dot$`], [$times$ of $dot$],
  [Kleiner/Groter gelijk], [`$<=$` / `$>=$`], [$<=$ / $>=$],
  [Ongeveer], [`$approx$`], [$approx$],
  [Niet gelijk], [`$!=$` of `$eq.not$`], [$!=$],
  [Evenredig], [`$prop$`], [$prop$],
  [Oneindig], [`$infinity$`], [$infinity$],
  [Nabla], [`$nabla$`], [$nabla$],
  [Partieel], [`$partial$`], [$partial$],
  [Som], [`$sum$`], [$sum$],
  [Integraal], [`$integral$`], [$integral$],
)

=== Logica en Verzamelingen

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, left, left),
  table.header([*Beschrijving*], [*Code*], [*Symbool*]),
  [Voor alle], [`$forall$`], [$forall$],
  [Er bestaat], [`$exists$`], [$exists$],
  [Element van], [`$in$`], [$in$],
  [Niet element], [`$in.not$`], [$in.not$],
  [Deelverzameling], [`$subset$`], [$subset$],
  [Vereniging], [`$union$`], [$union$],
  [Doorsnede], [`$sect$`], [$sect$],
  [Ledige verzameling], [`$emptyset$`], [$emptyset$],
)

#examenbox[Gebruik `$=>$` en `$<==>$` voor logische redeneringen. Deze voegen automatisch de juiste witruimte toe.]

= Cross-References

In Typst gebruik je `<label>` en `@label` voor cross-referenties:

#codeblock(lang: "typst", title: "Cross-References")[
  ```
  = Mijn Sectie <sec:intro>

  Later kun je verwijzen naar @sec:intro.

  // Figuren:
  #figure(
    image("afbeelding.png", width: 80%),
    caption: [Onderschrift],
  ) <fig:mijn-figuur>

  Zie @fig:mijn-figuur.
  ```
]

#waarschuwing(title: "Labels in Typst")[
  In Typst staan labels *na* het element (niet met `\label{}` zoals in LaTeX).
  Labels worden geschreven als `<label-naam>` en referenties als `@label-naam`.
]

= Figuren

== Standaard Figuur

#codeblock(lang: "typst", title: "Figuur")[
  ```
  #figure(
    image("afbeelding.png", width: 80%),
    caption: [Beschrijving van de afbeelding],
  ) <fig:label>
  ```
]

== Figuur naast tekst

In Typst gebruik je `grid` voor layouts met tekst naast een figuur:

#codeblock(lang: "typst", title: "Figuur naast tekst")[
  ```
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [Hier komt je tekst die naast de afbeelding staat.],
    figure(
      image("afbeelding.png", width: 100%),
      caption: [Onderschrift],
    ),
  )
  ```
]

= Tabellen

Typst heeft ingebouwde tabellen die eenvoudiger zijn dan LaTeX:

#codeblock(lang: "typst", title: "Tabel")[
  ```
  #table(
    columns: (1fr, 1fr, 1fr),
    align: (left, center, center),
    table.header(
      [*Materiaal*], [*Dichtheid*], [*E-modulus*],
    ),
    [Staal],     [7850 kg/m³], [210 GPa],
    [Aluminium], [2700 kg/m³], [70 GPa],
    [Koper],     [8960 kg/m³], [120 GPa],
  )
  ```
]

Resultaat:

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, center, center),
  table.header([*Materiaal*], [*Dichtheid*], [*E-modulus*]),
  [Staal], [$7850 "kg/m³"$], [$210 "GPa"$],
  [Aluminium], [$2700 "kg/m³"$], [$70 "GPa"$],
  [Koper], [$8960 "kg/m³"$], [$120 "GPa"$],
)

= Grafieken en Plots (cetz-plot)

De template bevat het *cetz-plot* pakket --- vergelijkbaar met `pgfplots` in LaTeX.
Hiermee kun je functiegrafieken, scatterplots, staafdiagrammen en meer maken.

== Functieplot

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (10, 6),
      x-label: $x$,
      y-label: $f(x)$,
      x-tick-step: 1,
      y-tick-step: 1,
      {
        plot.add(domain: (-3, 3), samples: 100, label: $f(x) = x^2$, x => calc.pow(x, 2))
        plot.add(domain: (-3, 3), samples: 100, label: $g(x) = 2x$, style: (stroke: red + 1.5pt), x => 2 * x)
      },
    )
  })
]

Code:
#codeblock(lang: "typst", title: "Functieplot")[
  ```
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (10, 6),
      x-label: $x$, y-label: $f(x)$,
      x-tick-step: 1, y-tick-step: 1,
      {
        plot.add(
          domain: (-3, 3), samples: 100,
          label: $f(x) = x^2$,
          x => calc.pow(x, 2),
        )
        plot.add(
          domain: (-3, 3), samples: 100,
          label: $g(x) = 2x$,
          style: (stroke: red + 1.5pt),
          x => 2*x,
        )
      },
    )
  })
  ```
]

== Trigonometrische functies

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (10, 5),
      x-label: $x$,
      y-label: $y$,
      x-tick-step: calc.pi / 2,
      y-tick-step: 0.5,
      y-min: -1.5,
      y-max: 1.5,
      {
        plot.add(domain: (0, 2 * calc.pi), samples: 100, label: $sin(x)$, style: (stroke: blue + 1.5pt), x => calc.sin(
          x,
        ))
        plot.add(domain: (0, 2 * calc.pi), samples: 100, label: $cos(x)$, style: (stroke: red + 1.5pt), x => calc.cos(
          x,
        ))
      },
    )
  })
]

== Scatterplot (data plotten)

Je kunt ook discrete datapunten plotten:

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (10, 6),
      x-label: [Tijd (s)],
      y-label: [Spanning (V)],
      x-tick-step: 1,
      y-tick-step: 1,
      {
        plot.add(
          label: [Meetdata],
          style: (stroke: schoolBlue + 1.5pt),
          mark: "o",
          mark-size: 0.15,
          (
            (0, 0.5),
            (1, 1.2),
            (2, 2.8),
            (3, 3.1),
            (4, 4.5),
            (5, 5.0),
            (6, 5.8),
            (7, 6.2),
            (8, 7.1),
            (9, 7.8),
          ),
        )
        plot.add(
          domain: (0, 9),
          samples: 50,
          label: [Lineaire fit],
          style: (stroke: (paint: red, thickness: 1pt, dash: "dashed")),
          x => 0.83 * x + 0.3,
        )
      },
    )
  })
]

Code:
#codeblock(lang: "typst", title: "Scatterplot")[
  ```
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (10, 6),
        x-label: [Tijd (s)], y-label: [Spanning (V)],
        {
          // Discrete datapunten:
          plot.add(mark: "o", mark-size: 0.15, (
            (0, 0.5), (1, 1.2), (2, 2.8), ...
          ))
          // Curve door data:
          plot.add(
            domain: (0, 9), samples: 50,
            style: (stroke: stroke(paint: red, thickness: 1pt, dash: "dashed")),
            x => 0.83 * x + 0.3,
          )
        },
      )
    })
  ]
  ```
]

== Staafdiagram (Bar chart)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    chart.barchart(
      size: (10, 5),
      label-key: 0,
      value-key: 1,
      (
        ("Staal", 210),
        ("Aluminium", 70),
        ("Koper", 120),
        ("Titanium", 116),
        ("Beton", 30),
      ),
    )
  })
]

Code:
#codeblock(lang: "typst", title: "Staafdiagram")[
  ```
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      chart.barchart(
        size: (10, 5),
        label-key: 0, value-key: 1,
        (
          ("Staal", 210),
          ("Aluminium", 70),
          ("Koper", 120),
        ),
      )
    })
  ]
  ```
]

= Extra Grafieken (Pie & Histogram)

Met `cetz-plot` kun je verschillende grafieken maken, waaronder pie charts.

#TODO("Add pie chart")
// @TODO

== Histogram (Bar Chart)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(size: (10, 6), x-label: "Categorie", y-label: "Waarde", {
      plot.add-bar(((1, 5), (2, 10), (3, 7)), bar-width: 0.8)
    })
  })
]

== CeTZ Tekeningen (TikZ equivalent)

Naast plots kun je met CeTZ ook vrije tekeningen maken:

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Coordinaatstelsel
    set-style(stroke: (paint: gray, thickness: 0.5pt))
    line((-0.5, 0), (6, 0), mark: (end: ">"), name: "x-axis")
    line((0, -0.5), (0, 5), mark: (end: ">"), name: "y-axis")
    content((6, -0.4), $x$)
    content((-0.4, 5), $y$)

    // Functie tekenen
    set-style(stroke: (paint: schoolBlue, thickness: 1.5pt))
    bezier((0.5, 0.5), (5, 4), (2, 4.5), (4, 0.5))

    // Annotaties
    set-style(stroke: (paint: schoolRed, dash: "dashed", thickness: 1pt))
    line((2.5, 0), (2.5, 3.2))
    content((2.5, -0.4), $x_0$)
    content((3, 3.5), text(fill: schoolRed, size: 9pt)[$f(x_0)$])

    // Punt markeren
    circle((2.5, 3.2), radius: 0.08, fill: schoolRed, stroke: none)
  })
]

= Code Listings

Gebruik de `#codeblock()` functie voor VS Code-achtige code blokken:

#codeblock(lang: "python", title: "Python Script")[
  ```python
  import numpy as np

  def bereken_rms(signaal):
      """Bereken Root Mean Square."""
      return np.sqrt(np.mean(signaal**2))
  ```
]

Code:
#codeblock(lang: "typst", title: "Codeblock Syntax")[
  ```
  #codeblock(lang: "python", title: "Python Script")[
  ```python
  import numpy as np
  def bereken_rms(signaal):
  return np.sqrt(np.mean(signaal**2))
  ```
  ]
  ```
]

= Veelgemaakte Fouten

#waarschuwing(title: "Vermijd deze fouten!")[
  #table(
    columns: (1fr, 1fr),
    align: (left, left),
    table.header([*Fout* ✗], [*Correct* ✓]),
    [`$ E = mc^2 $` (geen spatie)], [`$ E = m c^2 $`],
    [`50 m/s` (platte tekst)], [`$50 "m/s"$`],
    [Vergeten `*` voor vet], [`*vetgedrukt*`],
    [`\n` voor nieuwe regel], [`\` voor nieuwe regel],
    [Label vóór element], [Label *na* element: `<label>`],
  )
]

= Utility Macro's

== Workflow markers

De template bevat handige markers voor je workflow:

#TODO("Dit moet nog worden aangevuld")
#FIXME("Hier zit een fout")
#NOTE("Onthoud dit")
#citeme

Code:
#codeblock(lang: "typst", title: "Workflow Markers")[
  ```
  #TODO("Dit moet nog worden aangevuld")
  #FIXME("Hier zit een fout")
  #NOTE("Onthoud dit")
  #citeme
  ```
]

== Examentip

#examenbox[Gebruik *altijd* SI-eenheden in je antwoord op het examen!]

Code: `#examenbox[Gebruik *altijd* SI-eenheden...]`

== Belangrijke termen markeren

Gebruik `#keyterm()` om belangrijke vakbegrippen te markeren:

Dit is een #keyterm[belangrijk concept] in de theorie.

Code: `#keyterm[belangrijk concept]`

== Kolommen

Gebruik Typst's ingebouwde `columns()` voor meerdere kolommen:

#codeblock(lang: "typst", title: "Kolommen")[
  ```
  #columns(2)[
    Links kolom tekst hier...

    #colbreak()

    Rechts kolom tekst hier...
  ]
  ```
]

= LaTeX vs Typst Vergelijking

Een snelle referentie voor wie van LaTeX overstapt:

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, left, left),
  table.header([*Feature*], [*LaTeX*], [*Typst*]),
  [Vet], [`\textbf{tekst}`], [`*tekst*`],
  [Cursief], [`\textit{tekst}`], [`_tekst_`],
  [Heading], [`\section{Titel}`], [`= Titel`],
  [Sub-heading], [`\subsection{Titel}`], [`== Titel`],
  [Wiskundemodus], [`$E = mc^2$`], [`$E = m c^2$`],
  [Display math], [`\[ E = mc^2 \]`], [`$ E = m c^2 $`],
  [Breuk], [`\frac{a}{b}`], [`frac(a, b)`],
  [Label], [`\label{sec:intro}`], [`<sec:intro>`],
  [Referentie], [`\ref{sec:intro}`], [`@sec:intro`],
  [Lijst (bullets)], [`\begin{itemize}...`], [`- item`],
  [Lijst (nummers)], [`\begin{enumerate}...`], [`+ item`],
  [Afbeelding], [`\includegraphics{...}`], [`image("...")`],
  [Tabel], [`\begin{tabular}...`], [`#table(...)`],
  [Commentaar], [`% commentaar`], [`// commentaar`],
  [Nieuwe pagina], [`\newpage`], [`#pagebreak()`],
)

= Inbegrepen Pakketten (Typst Universe)

De school-template importeert automatisch enkele essentiële pakketten van #link("https://typst.app/universe")[Typst Universe]. Je hoeft ze niet apart te importeren.

== unify (siunitx equivalent)

Voor correcte opmaak van getallen, eenheden en bereiken:

#codeblock(lang: "typst", title: "unify")[
  ```
  $qty("9.81", "m/s^2")$     // getal + eenheid
  $num("1234567")$            // getal met scheidingstekens
  $numrange("1", "10")$       // getallenbereik
  $qtyrange("20", "30", "N")$ // bereik met eenheid
  ```
]

#theorie(title: "Beschikbare functies")[
  #table(
    columns: (1fr, 2fr),
    table.header([*Functie*], [*Beschrijving*]),
    [`num("...")`], [Getal met scheidingstekens en onzekerheden],
    [`qty("...", "...")`], [Getal met eenheid],
    [`numrange("...", "...")`], [Getallenbereik (bv. 1 tot 10)],
    [`qtyrange("...", "...", "...")`], [Bereik met eenheid],
  )
]

== physica (physics math)

Voor wiskundige notatie in de fysica en engineering:

#codeblock(lang: "typst", title: "physica")[
  ```
  $dv(y, x)$          // gewone afgeleide dy/dx
  $dv(y, x, 2)$       // tweede afgeleide
  $pdv(f, x)$          // partiële afgeleide
  $grad f$            // gradiënt
  $div va(F)$         // divergentie
  $curl va(F)$        // rotatie
  $laplacian f$       // Laplaciaan
  $braket(psi, phi)$  // Dirac braket
  $va(F)$             // vector (bold+arrow)
  ```
]

#concept(title: "Belangrijkste physica functies")[
  #table(
    columns: (1fr, 2fr),
    table.header([*Functie*], [*Beschrijving*]),
    [`dv(y, x)`], [Afgeleide $dv(y, x)$],
    [`pdv(f, x)`], [Partiële afgeleide $pdv(f, x)$],
    [`grad`], [Gradiënt $grad$],
    [`div`], [Divergentie],
    [`curl`], [Rotatie],
    [`laplacian`], [Laplaciaan $laplacian$],
    [`va(F)`], [Vector met pijl $va(F)$],
    [`vu(n)`], [Eenheidsvector $vu(n)$],
    [`braket(a, b)`], [Dirac braket $braket(a, b)$],
    [`ketbra(a, b)`], [Ket-bra $ketbra(a, b)$],
    [`expval(A)`], [Verwachtingswaarde $expval(A)$],
  )
]

== CeTZ (TikZ equivalent)

Voor tekeningen en diagrammen, vergelijkbaar met TikZ in LaTeX:

#codeblock(lang: "typst", title: "CeTZ Basis")[
  ```
  #import "@preview/cetz:0.4.2"
  #cetz.canvas({
    import cetz.draw: *
    // Lijn
    line((0, 0), (2, 2), stroke: blue)
    // Cirkel
    circle((1, 1), radius: 0.5, fill: red.lighten(80%))
    // Tekst
    content((1, -0.5), [Label])
  })
  ```
]

Resultaat:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (2, 2), stroke: blue + 1.5pt)
    circle((1, 1), radius: 0.5, fill: schoolBlue.lighten(80%), stroke: schoolBlue)
    content((1, -0.5), text(size: 9pt)[Label])
    rect((3, 0), (5, 2), fill: schoolGreen.lighten(85%), stroke: schoolGreen)
    content((4, 1), text(size: 9pt)[Box])
    line((2.2, 1), (2.8, 1), stroke: schoolRed + 1.5pt, mark: (end: ">"))
  })
]
#waarschuwing(title: "CeTZ is anders dan TikZ")[
  CeTZ is geïnspireerd door TikZ maar heeft een *andere syntax*.
  Je kunt geen TikZ-code direct kopiëren.
  Raadpleeg de #link("https://cetz-package.github.io/docs")[CeTZ documentatie] voor details.
]

== Andere handige pakketten

Deze pakketten zijn *niet* standaard inbegrepen, maar kun je zelf toevoegen.
Installeren doe je door ze te importeren --- Typst downloadt ze automatisch:

#codeblock(lang: "typst", title: "Extra pakket toevoegen")[
  ```
  // Bovenaan je document:
  #import "@preview/fletcher:0.5.8": diagram, node, edge
  #import "@preview/algo:0.3.6": algo, i, d, comment, code
  #import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl
  #import "@preview/codly:1.3.0": *
  #import "@preview/tablem:0.2.0": *
  ```
]

#table(
  columns: (1fr, 1fr, 2fr),
  align: (left, left, left),
  table.header([*Pakket*], [*LaTeX equivalent*], [*Beschrijving*]),
  [`fletcher`], [tikz-cd], [Diagrammen met pijlen en nodes],
  [`algo`], [algorithmicx], [Algoritmes en pseudocode],
  [`glossarium`], [glossaries], [Woordenlijst / afkortingenlijst],
  [`codly`], [minted/listings], [Mooie code blokken met lijnnummers],
  [`tablem`], [---], [Markdown-achtige tabellen],
  [`chemformula`], [mhchem], [Chemische formules en reacties],
  [`alchemist`], [chemfig], [Structuurformules tekenen],
)

=== Fletcher --- Diagrammen met pijlen

Fletcher maakt het eenvoudig om flowcharts, toestandsdiagrammen en commutatieve diagrammen te tekenen.

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#codeblock(lang: "typst", title: "Fletcher Flowchart")[
  ```
  #import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

  #diagram(
    node-stroke: 0.8pt,
    node-corner-radius: 3pt,
    spacing: (12mm, 10mm),

    node((0,0), [Start], fill: schoolGreen.lighten(80%)),
    edge("-|>"),
    node((1,0), [Invoer lezen], fill: schoolBlue.lighten(80%)),
    edge("-|>"),
    node((2,0), [Verwerken], fill: schoolBlue.lighten(80%)),
    edge("-|>"),
    node((3,0), [Uitvoer], fill: schoolOrange.lighten(80%)),
    edge("-|>"),
    node((4,0), [Stop], fill: schoolRed.lighten(80%)),

    // Feedback lus:
    edge((3,0), (2,0), [Fout?], "-|>", bend: -50deg),
  )
  ```
]

Resultaat:
#align(center)[
  #diagram(
    node-stroke: 0.8pt,
    node-corner-radius: 3pt,
    spacing: (12mm, 10mm),

    node((0, 0), [Start], fill: schoolGreen.lighten(80%)),
    edge("-|>"),
    node((1, 0), [Invoer lezen], fill: schoolBlue.lighten(80%)),
    edge("-|>"),
    node((2, 0), [Verwerken], fill: schoolBlue.lighten(80%)),
    edge("-|>"),
    node((3, 0), [Uitvoer], fill: schoolOrange.lighten(80%)),
    edge("-|>"),
    node((4, 0), [Stop], fill: schoolRed.lighten(80%)),

    edge((3, 0), (2, 0), [Fout?], "-|>", bend: -50deg),
  )
]
#v(12pt)

Een wiskundig commutatief diagram:

#codeblock(lang: "typst", title: "Commutatief Diagram")[
  ```
  #diagram(cell-size: 15mm, $
    A edge(f, ->) & B \
    C edge("u", g, ->) edge("ur", h, "-->")
  $)
  ```
]

Resultaat:
#align(center)[
  #diagram(
    cell-size: 15mm,
    $
                                A edge(f, ->) & B \
      C edge("u", g, ->) edge("ur", h, "-->")
    $,
  )
]

=== Algo --- Pseudocode en Algoritmes

De `algo` package maakt prachtige pseudocode blokken: #import "@preview/algo:0.3.6": algo as algo-fn, comment, d, i

#codeblock(lang: "typst", title: "Pseudocode Algoritme")[
  ```
  #import "@preview/algo:0.3.6": algo, i, d, comment

  #algo(
    title: "BubbleSort",
    parameters: ("A", "n"),
  )[
    for $j <- 0$ to $n - 2$:#i
      for $k <- 0$ to $n - j - 2$:#i
        if $A[k] > A[k+1]$:#i
          swap $A[k]$ and $A[k+1]$#d
        #d
      #d
    return $A$
  ]
  ```
]

Resultaat:

#algo-fn(
  title: "BubbleSort",
  parameters: ("A", "n"),
)[
  for $j <- 0$ to $n - 2$:#i
  for $k <- 0$ to $n - j - 2$:#i
  if $A[k] > A[k+1]$:#i
  swap $A[k]$ and $A[k+1]$#d
  #d
  #d
  return $A$
]

#v(8pt)

#algo-fn(
  title: "BinarySearch",
  parameters: ("A", "n", "target"),
)[
  $l <- 0$, $r <- n - 1$\
  while $l <= r$:#i
  $m <- floor((l + r) / 2)$\
  if $A[m] = "target"$:#i
  return $m$ #comment[Gevonden!]#d
  if $A[m] < "target"$:#i
  $l <- m + 1$#d
  else:#i
  $r <- m - 1$#d#d
  return $-1$ #comment[Niet gevonden]
]

=== Glossarium --- Woordenlijst

Met `glossarium` maak je een woordenlijst met afkortingen en definities:

#codeblock(lang: "typst", title: "Glossarium")[
  ```
  #import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl

  #show: make-glossary

  #let entries = (
    (key: "fem", short: "FEM", long: "Finite Element Method",
     description: "Numerieke methode voor het oplossen van PDEs."),
    (key: "cfd", short: "CFD", long: "Computational Fluid Dynamics",
     description: "Numerieke simulatie van vloeistofstroming."),
    (key: "plc", short: "PLC", long: "Programmable Logic Controller",
     description: "Industriële computer voor automatisering."),
  )
  #register-glossary(entries)

  // In je tekst:
  De @fem methode wordt vaak gebruikt in combinatie met @cfd.
  Bij een eerste vermelding wordt de volledige naam getoond.

  // Aan het einde van je document:
  #print-glossary(entries)
  ```
]

=== Tablem --- Markdown-achtige tabellen

Snelle tabellen met Markdown-syntax:

#import "@preview/tablem:0.2.0": tablem

#codeblock(lang: "typst", title: "Tablem")[
  ```
  #import "@preview/tablem:0.2.0": tablem

  #tablem[
    | *Materiaal* | *$E$ (GPa)* | *$rho$ (kg/m³)* |
    |-------------|-------------|-----------------|
    | Staal       | 210         | 7850            |
    | Aluminium   | 70          | 2700            |
    | Titanium    | 116         | 4500            |
  ]
  ```
]

Resultaat:
#align(center)[
  #tablem[
    | *Materiaal* | *$E$ (GPa)* | *$rho$ (kg/m³)* |
    |-------------|-------------|-----------------|
    | Staal       | 210         | 7850            |
    | Aluminium   | 70          | 2700            |
    | Titanium    | 116         | 4500            |
  ]
]

// =============================================================================
//                           AFBEELDINGEN NAAST ELKAAR
// =============================================================================
= Afbeeldingen naast elkaar

Gebruik `grid()` of `figure(grid(...))` om afbeeldingen naast elkaar te zetten.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("default-ui-image-placeholder-wireframes-260nw-1037719192.webp", width: 7cm),
    image("default-ui-image-placeholder-wireframes-260nw-1037719192.webp", width: 7cm),
  ),
  caption: [Twee afbeeldingen naast elkaar.],
  label: <fig:side-by-side>,
)

Code:
#codeblock(lang: "typst", title: "Side-by-side")[
  ```
  #figure(
    grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      image("left.png", width: 100%),
      text: [Hier kun je ook tekst zetten bijvoorbeeld.],
      // of nog een afbeelding:
      // image("right.png", width: 100%),
    ),
    caption: [Twee afbeeldingen naast elkaar.],
    label: <fig:side-by-side>
  )
  ```
]



// =============================================================================
//                       CUSTOMISATIE
// =============================================================================
= Customisatie (Set & Show Rules)

Met `set` pas je eigenschappen aan, met `show` verander je hoe iets eruit ziet.

== Set Rules
Gebruik `set` voor standaardwaarden (font, grootte, kleur).

#codeblock(lang: "typst", title: "Set Rules")[
  ```
  #set text(font: "Arial", size: 12pt)
  #set par(justify: true)
  #set list(marker: [--])
  ```
]

== Show Rules
Gebruik `show` om elementen volledig te herdefiniëren.

#codeblock(lang: "typst", title: "Show Rules")[
  ```
  // Verander alle "Typst" woorden in vetgedrukt blauw
  #show "Typst": name => text(blue, weight: "bold")[#name]

  // Kader rond alle afbeeldingen
  #show image: it => box(stroke: 2pt + red, it)

  // Pas headings aan
  #show heading.where(level: 1): it => [
    #set text(fill: schoolBlue)
    #block(it)
    #line(length: 100%, stroke: 1pt + schoolBlue)
  ]
  ```
]

// =============================================================================
//                       SCRIPTING & AUTOMATISATIE
// =============================================================================
= Scripting & Automatisatie

Typst is een volwaardige programmeertaal.

== Variabelen en Functies
#codeblock(lang: "typst", title: "Vars & Funcs")[
  ```
  #let naam = "Typst"
  #let optellen(a, b) = a + b

  Hallo #naam!
  1 + 2 = #optellen(1, 2)
  ```
]

== Conditionals (If/Else)
#codeblock(lang: "typst", title: "If/Else")[
  ```
  #let score = 15
  Resultaat: #if score >= 10 [Geslaagd] else [Niet geslaagd]
  ```
]

== Lussen (Loops)
Je kan itereren over arrays of getallen.

#codeblock(lang: "typst", title: "Loops")[
  ```
  #let kleuren = (red, orange, yellow, green, blue)

  #for kleur in kleuren [
    #text(fill: kleur)[■]
  ]

  // Native vormen (geen Cetz nodig):
  #for i in range(5) [
    #circle(radius: 2pt + i*1pt, fill: black.lighten(i*20%))
  ]
  ```
]

// =============================================================================
//                           ADVANCED CETZ EXAMPLES
// =============================================================================
= Geavanceerde CeTZ Voorbeelden

Hier zijn enkele geavanceerde voorbeelden van wat mogelijk is met CeTZ.

== Taylor Reeks (Fill Between)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    let f1(x) = calc.sin(x)
    let fn = (
      ($ x - x^3"/"3! $, x => x - calc.pow(x, 3) / 6),
      ($ x - x^3"/"3! - x^5"/"5! $, x => x - calc.pow(x, 3) / 6 + calc.pow(x, 5) / 120),
      (
        $ x - x^3"/"3! - x^5"/"5! - x^7"/"7! $,
        x => x - calc.pow(x, 3) / 6 + calc.pow(x, 5) / 120 - calc.pow(x, 7) / 5040,
      ),
    )

    // Set-up a thin axis style
    set-style(
      axes: (stroke: .5pt, tick: (stroke: .5pt)),
      legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%),
    )

    plot.plot(
      size: (8, 6),
      x-tick-step: calc.pi / 2,
      x-format: plot.formats.multiple-of,
      y-tick-step: 2,
      y-min: -2.5,
      y-max: 2.5,
      legend: "inner-north",
      {
        let domain = (-1.1 * calc.pi, +1.1 * calc.pi)

        for (title, f) in fn {
          plot.add-fill-between(f, f1, domain: domain, style: (stroke: none), label: title)
        }
        plot.add(f1, domain: domain, label: $ sin x $, style: (stroke: black))
      },
    )
  })
]

Code:
#codeblock(lang: "typst", title: "Taylor Reeks")[
  ```
  #cetz.canvas({
    import cetz.draw: *
    let f1(x) = calc.sin(x)
    let fn = (
      ($ x - x^3"/"3! $, x => x - calc.pow(x, 3)/6),
      // ...
    )

    set-style(axes: (stroke: .5pt, tick: (stroke: .5pt)),
              legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%))

    plot.plot(size: (8, 6),
      x-tick-step: calc.pi/2,
      y-tick-step: 2, y-min: -2.5, y-max: 2.5,
      legend: "inner-north",
      {
        let domain = (-1.1 * calc.pi, +1.1 * calc.pi)

        for ((title, f)) in fn {
          plot.add-fill-between(f, f1, domain: domain,
            style: (stroke: none), label: title)
        }
        plot.add(f1, domain: domain, label: $ sin x  $,
          style: (stroke: black))
      })
  })
  ```
]


== 3D Orthogonale Projectie
// Example by @samuelireson

#align(center)[
  #cetz.canvas(length: 2cm, {
    import cetz.draw: *
    let phi = (1 + calc.sqrt(5)) / 2

    ortho({
      hide({
        line((-phi, -1, 0), (-phi, 1, 0), (phi, 1, 0), (phi, -1, 0), close: true, name: "xy")
        line((-1, 0, -phi), (1, 0, -phi), (1, 0, phi), (-1, 0, phi), close: true, name: "xz")
        line((0, -phi, -1), (0, -phi, 1), (0, phi, 1), (0, phi, -1), close: true, name: "yz")
      })

      intersections("a", "yz", "xy")
      intersections("b", "xz", "yz")
      intersections("c", "xy", "xz")

      set-style(stroke: (thickness: 0.5pt, cap: "round", join: "round"))
      line((0, 0, 0), "c.1", (phi, 1, 0), (phi, -1, 0), "c.3")
      line("c.0", (-phi, 1, 0), "a.2")
      line((0, 0, 0), "b.1", (1, 0, phi), (-1, 0, phi), "b.3")
      line("b.0", (1, 0, -phi), "c.2")
      line((0, 0, 0), "a.1", (0, phi, 1), (0, phi, -1), "a.3")
      line("a.0", (0, -phi, 1), "b.2")

      anchor("A", (0, phi, 1))
      content("A", [$A$], anchor: "north", padding: .1)
      anchor("B", (-1, 0, phi))
      content("B", [$B$], anchor: "south", padding: .1)
      anchor("C", (1, 0, phi))
      content("C", [$C$], anchor: "south", padding: .1)
      line("A", "B", stroke: (dash: "dashed"))
      line("A", "C", stroke: (dash: "dashed"))
    })
  })
]

Code:
#codeblock(lang: "typst", title: "3D Ortho")[
  ```
  #cetz.canvas(length: 2cm, {
    import cetz.draw: *
    let phi = (1 + calc.sqrt(5)) / 2

    ortho({
      // Definieer vlakken (verborgen)
      hide({
        line((-phi, -1, 0), (-phi, 1, 0), (phi, 1, 0), (phi, -1, 0), close: true, name: "xy")
        // ...
      })

      // Bereken intersecties
      intersections("a", "yz", "xy")
      // ...

      // Teken lijnen
      set-style(stroke: (thickness: 0.5pt, cap: "round", join: "round"))
      line((0, 0, 0), "c.1", (phi, 1, 0), (phi, -1, 0), "c.3")
      // ...
    })
  })
  ```
]

== Pie Chart (Landen)
#align(center)[
  #cetz.canvas({
    let colors = gradient.linear(red, blue, green, yellow)
    let data = (
      ([Belgium], 24),
      ([Germany], 31),
      ([Greece], 18),
      ([Spain], 21),
      ([France], 23),
      ([Hungary], 18),
      ([Netherlands], 27),
      ([Romania], 17),
      ([Finland], 26),
      ([Turkey], 13),
    )

    chart.piechart(
      data,
      value-key: 1,
      label-key: none,
      radius: 3,
      stroke: none,
      slice-style: colors,
      inner-radius: 1,
      outset: 3,
      inner-label: (content: (value, label) => [#text(white, str(value))], radius: 110%),
      outer-label: (content: "%", radius: 110%),
    )
  })
]

Code:
#codeblock(lang: "typst", title: "Pie Chart")[
  ```
  #cetz.canvas({
    let colors = gradient.linear(red, blue, green, yellow)
    let data = (
      ([Belgium],     24),
      ([Germany],     31),
      ([Greece],      18),
      // ...
    )

    chart.piechart(
      data,
      value-key: 1,
      label-key: none,
      radius: 4,
      stroke: none,
      slice-style: colors,
      inner-radius: 1,
      outset: 3,
      inner-label: (content: (value, label) => [#text(white, str(value))], radius: 110%),
      outer-label: (content: "%", radius: 110%)
    )
  })
  ```
]

== Pyramid Chart (Financieel)
#align(center)[
  #cetz.canvas({
    let colors = gradient.linear(red, yellow)
    let data = (
      ([Cash], 768),
      ([Funds], 1312),
      ([Stocks], 3812),
      ([Bonds], 7167),
    )
    let total = data.map(i => i.last()).sum()

    chart.pyramid(
      data,
      value-key: 1,
      label-key: 0,
      mode: "AREA-HEIGHT",
      stroke: none,
      level-style: colors,
      inner-label: (
        content: (value, label) => align(center, stack(
          label + "\n",
          str(calc.round(value / total * 10000) / 100) + "%",
          spacing: 2pt,
          dir: ttb,
        )),
      ),
      side-label: (
        content: (value, label) => "€" + str(value),
      ),
      gap: 10%,
    )
  })
]

Code:
#codeblock(lang: "typst", title: "Pyramid Chart")[
  ```
  #cetz.canvas({
    let colors = gradient.linear(red, yellow)
    let data = (
      ([Cash],     768),
      ([Funds],    1312),
      ([Stocks],   3812),
      ([Bonds],    7167),
    )
    let total = data.map(i => i.last()).sum()

    chart.pyramid(
      data,
      value-key: 1,
      label-key: 0,
      mode: "AREA-HEIGHT",
      stroke: none,
      level-style: colors,
      inner-label: (
        content: (value, label) => align(center, stack(
          label + "\n",
          str(calc.round(value / total * 10000) / 100) + "%",
          spacing: 2pt,
          dir: ttb
        ))
      ),
      // ...
      gap: 10%
    )
  })
  ```
]

// =============================================================================
//                              APPENDICES
// =============================================================================
#pagebreak()

#printsymbols()
#printformularium()
