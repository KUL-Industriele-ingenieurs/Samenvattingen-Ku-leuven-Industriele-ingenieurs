// school-template.typ
// Typst template for KU Leuven Industrial Engineering Summaries
// Mirrors the styling of school-macros.sty v4.2

// --- External Packages (from Typst Universe) ---
#import "@preview/unify:0.8.1": num, numrange, qty, qtyrange  // siunitx equivalent
// physica < 0.9.7 gebruikt `angle.l`, dat sinds Typst 0.15 niet meer bestaat.
// Elke aanroep van #braket / #ket / #bra brak daarop. Niet terugzetten naar 0.9.5.
#import "@preview/physica:0.9.8": *     // Physics math: derivatives, brakets, etc.
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#let cetz = cetz
#let chart = cetz-plot.chart
#let plot = cetz-plot.plot
#import "@preview/wrap-it:0.1.1": wrap-content, wrap-top-bottom
#import "@preview/equate:0.3.3"
#import "@preview/cetz-venn:0.2.0"
#import "@preview/oasis-align:0.4.1": *
#import "@preview/zap:0.6.0"
#let zap = zap
#import "@preview/mannot:0.4.0"
#let markrect = mannot.markrect
#let mark = mannot.mark
#let markul = mannot.markul
#let markhl = mannot.markhl
#let annot = mannot.annot
#let annot-cetz = mannot.annot-cetz
#import "@preview/fletcher:0.5.8"
#let fletcher = fletcher
#import "@preview/merman:0.1.0"
#let merman = merman

// --- Iconen (flat, SVG via Heroicons, spiegelt school-macros.sty) ---
// heroic levert de iconen als gebundelde SVG's: geen font installeren nodig,
// werkt out-of-the-box, en #hi neemt de kleur van de omringende tekst over.
#import "@preview/heroic:0.1.2": hi
#let ic-book = hi("book-open")
#let ic-pen = hi("pencil-square")
#let ic-warning = hi("exclamation-triangle")
#let ic-idea = hi("light-bulb")
#let ic-calc = hi("calculator")
#let ic-code = hi("code-bracket")
#let ic-exam = hi("exclamation-circle")

// Shadow standard figure to support label argument for consistency with wrap-figure
#let std-figure = figure
#let figure(body, label: none, ..args) = {
  let fig = std-figure(body, ..args)
  if label != none {
    [#fig #label]
  } else {
    fig
  }
}

// Helper: wrap-figure
// Helper: wrap-figure
// Usage: #wrap-figure(image("..."), caption: [...], label: <...>, width: 50%)[ Body text... ]
#let wrap-figure(
  content,
  caption: none,
  label: none,
  width: auto,
  align: right,
  body,
) = {
  let fig = figure(content, caption: caption)
  // Attach label if provided
  let fig-with-label = if label != none {
    [#fig #label]
  } else {
    fig
  }

  context {
    // Meet alleen de figuurinhoud, niet het bijschrift. Een bijschrift breekt
    // afhankelijk van de beschikbare breedte, dus measure() gaf per
    // layout-iteratie een andere waarde: "a measured element did not stabilize"
    // gevolgd door "document did not converge within five attempts".
    let applied-width = if width == auto { measure(content).width } else { width }

    let boxed = box(fig-with-label, width: applied-width, inset: (
      left: if align == right { 1em } else { 0pt },
      right: if align == left { 1em } else { 0pt },
      bottom: 0.5em,
    ))

    wrap-content(
      boxed,
      body,
      align: align,
    )
  }
}
#let schoolBlue = rgb(41, 98, 155)
#let schoolRed = rgb(180, 40, 40)
#let schoolGreen = rgb(39, 174, 96)
#let schoolOrange = rgb(230, 126, 34)
#let schoolTeal = rgb(0, 150, 136)
#let schoolGray = rgb(100, 100, 100)
#let deepblue = rgb(41, 128, 185)

// --- Modern Color Palette ---
// Aliassen, bewust geen nieuwe waarden: `coral` was een tweede naam voor
// exact dezelfde RGB als schoolOrange, en brandblue/deepblue/schoolBlue zijn
// drie blauwen die nauwelijks van elkaar te onderscheiden zijn. Gebruik in
// nieuwe documenten de school*-namen; deze staan er voor bestaande bestanden.
#let schoolPurple = rgb(155, 89, 182)
#let brandblue = rgb(52, 152, 219)
#let amber = rgb(243, 156, 18)
#let coral = schoolOrange
#let slate = rgb(52, 73, 94)
#let lightgray = rgb(236, 240, 241)

// --- JetBrains / IntelliJ Light Theme (codeblokken) ---
// Gelijkgetrokken met school-macros.sty. De oude donkere VS Code-achtergrond
// combineerde met Typst's standaard (lichte) syntax highlighting: donkerblauwe
// keywords en donkergroene strings op bijna-zwart waren niet te lezen, en op
// papier vrat het een pak toner.
#let codeBackground = rgb(250, 250, 250) // body-achtergrond
#let codeTitleBar = rgb(237, 239, 242) // titelbalk
#let codeBorder = rgb(218, 222, 228) // randlijn
#let codeText = rgb(8, 8, 8) // gewone code
#let codeComment = rgb(140, 140, 140) // commentaar (IntelliJ #8C8C8C)

// --- VS Code Dark Theme Palette (bewaard voor compatibiliteit) ---
#let vscodeBlue = rgb(86, 156, 214)
#let vscodeGreen = rgb(106, 153, 85)
#let vscodeOrange = rgb(206, 145, 120)
#let vscodePurple = rgb(197, 134, 192)
#let vscodeYellow = rgb(220, 220, 170)
#let vscodeGray = rgb(133, 133, 133)
#let vscodeWhite = rgb(212, 212, 212)

// Hoeveel hoofdtitels in de linkermarge steken (spiegelt \schoolTitleOutdent
// in school-macros.sty).
#let titleOutdent = 0.9em

// Titel van het hoofdstuk waar we in zitten. Wordt gezet door de level-1
// heading rule en gelezen door frm(), zodat het formularium per hoofdstuk kan
// groeperen. Bewust via state en niet via query()/counter().at(): state volgt
// documentvolgorde en is niet layout-afhankelijk, terwijl een introspectie-
// query binnen frm de paginering laat terugkoppelen op de inhoud.
#let _current_chapter = state("school-current-chapter", none)

// --- Template Function ---
#let project(
  title: "",
  course: "",
  authors: (),
  academic_year: "",
  show_disclaimer: true,
  show_outline: true,
  short_title: false,
  body,
) = {
  // Metadata
  set document(author: authors, title: title)

  // Page setup
  set page(
    paper: "a4",
    margin: (left: 1.5cm, right: 1.5cm, top: 2cm, bottom: 2cm),
    numbering: "1",
    // Paginanummer staat in de header (zoals school-macros.sty). `footer: none`
    // onderdrukt de tweede, dubbele weergave onderaan; `numbering` blijft nodig
    // zodat de inhoudsopgave en verwijzingen paginanummers kunnen tonen.
    footer: none,
    header: context {
      let page_num = counter(page).get().first()
      if page_num > 1 {
        set text(size: 9pt * 0.92, font: ("Fira Sans", "Liberation Sans"))
        // Niet `.before(here())`: de header staat bovenaan de pagina, dus een
        // hoofdstuk dat op deze pagina begint valt daarbuiten en de kopregel
        // loopt een hoofdstuk achter. Filteren op paginanummer wel correct.
        let this-page = here().page()
        let headers = query(heading.where(level: 1)).filter(h => h.location().page() <= this-page)
        let last_header = if headers.len() > 0 { headers.last().body } else { [] }

        grid(
          columns: (1fr, 1fr),
          align(left, last_header), align(right, text(weight: "bold")[#page_num]),
        )
        v(-0.5em)
        line(length: 100%, stroke: 0.3pt)
      }
    },
  )

  // Typography: Charter (body) + Fira Sans (headers) + Fira Code 0.85 (code)
  // Charter, Fira Sans & Fira Code loaded from project fonts/ directory
  set text(font: ("Charter", "Libertinus Serif"), lang: "nl", size: 11pt)
  set par(leading: 0.63em, first-line-indent: 0pt, spacing: 1.2em, justify: true)
  // "1.1" zonder sluitpunt, gelijk aan \thesection in school-macros.sty.
  // Stond op "1.1.", waardoor Typst "3." / "3.1." zette en LaTeX "3" / "3.1".
  set heading(numbering: "1.1")

  show raw: set text(font: ("Fira Code", "Liberation Mono"), size: 1em)
  // Math uses Typst's default New Computer Modern Math (serif, matching Charter body text)

  // Override emptyset to use sans-serif glyph for visual consistency
  show sym.emptyset: set text(font: ("Fira Sans", "Liberation Sans"))

  // Links en kruisverwijzingen: kleur draagt de betekenis, geen onderstreping.
  // Onderstreepte tekst leest op papier als een kapotte hyperlink en botst met
  // de streep onder elke H1. Zet `underline` hier terug als je het toch wil.
  show link: set text(fill: schoolBlue)
  show ref: set text(fill: schoolBlue)

  // Nummering "hoofdstuk.figuur" (bv. 2.1). De teller wordt per hoofdstuk
  // gereset in de level-1 heading rule hieronder.
  //
  // Dit verving een handgeschreven `show std-figure` rule die het bijschrift
  // zelf opbouwde. Die had drie fouten: het supplement stond hardgecodeerd op
  // het Engelse "Figure", het hele bijschrift werd vet, en een @verwijzing
  // toonde de kale figuurteller ("Figure 3") terwijl het bijschrift
  // "Figure 3.5" zei. Via de ingebouwde nummering klopt alles vanzelf en volgt
  // het supplement de taalinstelling (lang: "nl") -> "Figuur" / "Tabel".
  set std-figure(numbering: n => numbering("1.1", counter(heading).get().first(), n))

  // Caption styling: klein Fira Sans, alleen het label vet (spiegelt
  // \captionsetup{font={small,sf}, labelfont=bf} in school-macros.sty)
  show std-figure.caption: it => text(
    size: 0.9em * 0.92,
    font: ("Fira Sans", "Liberation Sans"),
  )[#strong[#it.supplement #context it.counter.display(it.numbering)#it.separator]#it.body]

  // List styling: match LaTeX tightened spacing
  set list(indent: 2em, body-indent: 0.5em, spacing: 0.6em)
  set enum(indent: 2em, body-indent: 0.5em, spacing: 0.6em)

  show heading: set text(font: ("Fira Sans", "Liberation Sans"), weight: "bold")

  show heading.where(level: 1): it => {
    // Reset figure counters on every new chapter
    counter(std-figure.where(kind: image)).update(0)
    counter(std-figure.where(kind: table)).update(0)
    counter(std-figure.where(kind: raw)).update(0)
    _current_chapter.update(it.body)
    // Alleen niveau 1 krijgt een liniaal. H1 en H2 hadden allebei een
    // volledige liniaal en lagen met 13.2 vs 11 pt te dicht bij elkaar (11 pt
    // is exact de broodtekstgrootte), waardoor de hierarchie wegviel.
    // Negatieve linkerinspring: hoofdtitels steken iets in de marge, zodat de
    // structuur al zichtbaar is als je door het document bladert. Zet
    // titleOutdent op 0pt om het uit te schakelen.
    pad(left: -titleOutdent, block(below: 0.95em, breakable: false)[
      #v(18pt)
      #text(size: 15pt)[#if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body]
      #v(-11pt)
      #line(length: 100% + titleOutdent, stroke: 0.6pt)
    ])
  }

  show heading.where(level: 2): it => block(below: 0.9em, breakable: false)[
    #v(16pt)
    #text(size: 12.2pt)[#if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body]
  ]

  show heading.where(level: 3): it => block(below: 0.8em, breakable: false)[
    #v(11pt)
    #text(size: 11pt)[#if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body]
  ]

  // Title Page
  if not short_title {
    // Verdeling met fr-spacers i.p.v. vaste cm-sprongen en een `v(-5cm)` hack.
    // Alles in Fira Sans: auteur en jaartal stonden in Charter terwijl titel en
    // vak in Fira Sans stonden. Logo van 50% naar 32% breedte.
    align(center)[
      #set text(font: ("Fira Sans", "Liberation Sans"))
      #v(3fr)
      #text(size: 2.4em, weight: "bold")[#title]
      #v(0.7cm)
      #text(size: 1.35em, fill: luma(70))[#course]
      #v(0.9cm)
      #line(length: 35%, stroke: 1pt + schoolBlue)
      #v(0.9cm)
      #text(size: 1.1em)[#authors.join(", ")]
      #v(0.35cm)
      #text(size: 1.1em, fill: luma(70))[#academic_year]
      #v(4fr)
      // De asset was 600x600 met het logo (540x193) ergens in het midden;
      // daardoor zweefde hij met veel lege ruimte eromheen. Nu bijgesneden.
      #image("assets/Ku Leuven logo.png", width: 38%)
      #v(0.8cm)
      #text(size: 1em, weight: "medium")[KU Leuven] \
      #v(-4pt)
      #text(size: 0.85em, fill: luma(70))[Faculteit Industriële Ingenieurswetenschappen]
      #v(2fr)
    ]
    pagebreak()
  } else {
    // Compact Header for short_title: true
    block(width: 100%, inset: (bottom: 5pt), {
      grid(
        columns: (1fr, auto),
        column-gutter: 1em,
        align(left + horizon)[
          #text(size: 1.8em, weight: "bold", font: "Fira Sans", fill: black)[#title] \
          #v(-2pt)
          #text(size: 1.1em, font: "Fira Sans", style: "italic", fill: luma(100))[#course] \
          #v(-2pt)
          #text(size: 1em)[#authors.join(", ")]
        ],
        align(right + horizon)[
          #image("assets/Ku Leuven logo.png", width: 80pt)
        ],
      )
      v(-12pt)
      line(length: 100%, stroke: 1.5pt + schoolBlue)
    })
  }

  if show_disclaimer {
    // Disclaimer / Intro
    block(
      width: 100%,
      fill: luma(250),
      inset: 12pt,
      radius: 4pt,
      stroke: (left: 3pt + schoolBlue),
      [
        *Disclaimer:* Deze samenvattingen zijn beschikbaar op GitHub. Ze zijn gemaakt in LaTeX en Typst. Bijdragen helpt je git, Latex en typst te leren die je zoiezo gaat nodig hebben voor groepsprojecten en je master. Je kunt bijdragen aan de documenten zodat we gezamenlijk betere samenvattingen kunnen maken.\
        Draag gerust bij: #link("https://github.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs")[GitHub Repository] \
      ],
    )
    v(2em)
  }

  if show_outline {
    // Table of Contents (styled to match LaTeX)
    {
      set text(font: ("Charter", "Libertinus Serif"))
      // Zwart. `show link` hierboven kleurt alles wat een link is schoolBlue,
      // en in de inhoudsopgave is elk item een link -- een volledig blauwe
      // inhoudstabel is onrustig en zegt niets.
      show link: set text(fill: black)
      set outline.entry(fill: repeat[.#h(4pt)])
      show outline.entry.where(level: 1): it => {
        v(8pt)
        strong(it)
      }
      show outline.entry.where(level: 2): set pad(left: 1.5em)
      show outline.entry.where(level: 3): set pad(left: 3em)
      outline(indent: auto)
    }
    pagebreak()
  }

  // Content
  body
}
// --- Custom Boxes (Mirrors tcolorbox schoolbox) ---

// Variant C: een dunne gekleurde balk links en een gekleurde titel als aanloop
// in de lopende tekst. Geen kader, geen achtergrond, geen titelbalk.
//
// Dit verving een volledig omkaderde box met gevulde titeltab. Die kostte per
// callout ~3x zoveel hoogte als de inhoud zelf, en op een pagina met een paar
// callouts werd het kader het luidste element op het blad.
//
// `bg` blijft in de signatuur staan zodat bestaande aanroepen blijven werken,
// maar er is geen achtergrond meer om te zetten.
#let schoolbox(title, color, icon: none, bg: none, body) = block(
  width: 100%,
  above: 1.25em,
  below: 1.25em,
  stroke: (left: 2pt + color),
  inset: (left: 9pt, top: 1pt, bottom: 1pt),
  {
    if title != none and title != "" {
      // Punt alleen als de titel niet al op leesteken eindigt, anders krijg je
      // "Let Op!." en "Waarom deze som?."
      let punct = if (
        type(title) == str
          and title.len() > 0
          and (
            title.last() in (".", "?", "!", ":", ";")
          )
      ) { "" } else { "." }
      text(fill: color, weight: "bold", font: ("Fira Sans", "Liberation Sans"))[
        #if icon != none [#icon #h(0.25em)]#title#punct
      ]
      h(0.35em)
    }
    body
  },
)

#let theorie(title: "Theorie", body) = schoolbox(title, schoolBlue, icon: ic-book, body)
#let voorbeeld(title: "Voorbeeld", body) = schoolbox(title, schoolGreen, icon: ic-pen, body)
#let waarschuwing(title: "Let Op!", body) = schoolbox(
  title,
  schoolRed,
  icon: ic-warning,
  bg: schoolRed.lighten(95%),
  body,
)
#let concept(title: "Concept", body) = schoolbox(title, schoolTeal, icon: ic-idea, bg: schoolTeal.lighten(95%), body)
#let form(title: "Formule", body) = schoolbox(title, schoolOrange, icon: ic-calc, body)
#let theorem(title: "Theorem", body) = schoolbox(title, deepblue, icon: ic-book, body)
#let oefening(title: "Oefening", body) = schoolbox(title, schoolGreen, icon: ic-pen, body)

// --- Code Block (JetBrains / IntelliJ Light Style) ---

#let codeblock(lang: "txt", title: none, body) = {
  v(8pt)
  block(
    width: 100%,
    clip: true,
    radius: 4pt,
    fill: codeBackground,
    stroke: 0.5pt + codeBorder,
    [
      // Titelbalk
      #block(
        width: 100%,
        inset: (x: 10pt, y: 6pt),
        fill: codeTitleBar,
        stroke: (bottom: 0.5pt + codeBorder),
        below: 0pt,
        // Titel links, taal-tag rechts. De drie macOS-stoplichtjes zijn weg:
        // in een samenvatting die geprint wordt zeggen ze niets, en de titel
        // stond zichtbaar scheef omdat hij over een kolom van 40 pt werd
        // gecentreerd naast die bolletjes.
        grid(
          columns: (1fr, auto),
          align: horizon,
          text(fill: codeText, font: "Fira Sans", size: 9.5pt, weight: "bold")[
            #ic-code #h(0.4em) #if title != none { title } else { lang }
          ],
          if title != none {
            text(fill: codeComment, font: ("Fira Code", "Liberation Mono"), size: 8.5pt)[#lang]
          },
        ),
      )
      // Code body. Geen `fill` op de tekst: dan blijft Typst's eigen syntax
      // highlighting intact. Zette dit op vscodeWhite, waardoor niet-gehighlighte
      // code wit werd en de rest in donkere kleuren op een donkere achtergrond viel.
      #block(
        width: 100%,
        inset: 10pt,
        above: 0pt,
        {
          set text(
            fill: codeText,
            font: ("Fira Code", "Liberation Mono"),
            size: 10.5pt,
          )
          body
        },
      )
    ],
  )
  v(8pt)
}

// --- Math Helpers ---

#let mat(..args) = math.mat(..args)
#let vec(..args) = math.vec(..args)
#let dif = math.dif
#let diff(num, den) = $frac(dif #num, dif #den)$
#let pdiff(num, den) = $frac(∂ #num, ∂ #den)$

#let RR = $bb(R)$
#let ZZ = $bb(Z)$
#let QQ = $bb(Q)$
#let CC = $bb(C)$
#let NN = $bb(N)$

// --- Units ---
#let unit(content) = text(font: "Fira Sans", size: 0.9em)[#content]

// ============================================================================
//                           FORMULA SYSTEM (frm)
// ============================================================================

// State to collect formularium entries
#let _formularium_entries = state("formularium-entries", ())
#let _formularium_counter = counter("formularium-counter")

// Zet een formule in displaystyle, maar alleen als het echt een losse
// vergelijking is. Sommige frm()-aanroepen geven een heel content-blok mee met
// eigen #v()-ruimte eromheen (nodig voor mannot-annotaties boven en onder de
// formule); dat in math.equation wikkelen slikte die ruimte op en liet de
// annotaties over de omringende tekst vallen.
#let _as-display(formula) = {
  if type(formula) == content and formula.func() == math.equation {
    if formula.at("block", default: false) { formula } else { math.equation(block: true, formula) }
  } else {
    formula
  }
}

// frm: Display a formula box (orange) and register it for the formularium
// Usage: #frm("Wet van Ohm", $U = I dot R$, [Beschrijving...])
#let frm(title, formula, description) = {
  _formularium_counter.step()
  context {
    let idx = _formularium_counter.get().first()
    let sect = _current_chapter.get()
    [#metadata(none)#label("frm-" + str(idx))]
    // Bewust niets positie-afhankelijks in de state: paginanummer en hoofdstuk
    // worden bij het afdrukken uit de bijbehorende <frm-N> label-locatie gehaald.
    // Ze hier opslaan koppelt de inhoud van het formularium terug op de layout
    // (het formularium verschuift zelf de paginanummers), waardoor documenten
    // met veel formules niet convergeerden: "a measured element did not
    // stabilize" / "document did not converge within five attempts".
    _formularium_entries.update(entries => {
      entries.push((title: title, formula: formula, description: description, idx: idx, section: sect))
      entries
    })
  }
  schoolbox(title, schoolOrange, icon: ic-calc, [
    #set align(center)
    // block: true -> displaystyle. Zonder dit worden breuken en integralen in
    // de krappe inline-vorm gezet, precies wat \displaystyle in LaTeX voorkomt.
    #text(size: 1.1em)[#_as-display(formula)]
    #v(2pt)
    #set align(left)
    #text(size: 0.9em)[#description]
  ])
}

// Section divider for formularium (blue line with centered title)
// Lijn - titel - lijn, zoals \printSectionFormulas in school-macros.sty.
// Bewust met inline `box(width: 1fr)` en niet met een grid van (1fr, auto, 1fr)
// met daarin `line(length: 100%)`: een relatieve lengte binnen een fr-kolom is
// een circulaire meting, en die liet documenten met een formularium niet meer
// convergeren ("a measured element did not stabilize").
#let _formularium_divider(title) = {
  v(10pt)
  block(width: 100%, {
    box(width: 1fr, line(length: 100%, stroke: 0.6pt + schoolBlue))
    h(1em)
    text(size: 0.9em, weight: "bold", font: "Fira Sans", fill: schoolBlue, baseline: -0.25em)[#title]
    h(1em)
    box(width: 1fr, line(length: 100%, stroke: 0.6pt + schoolBlue))
  })
  v(6pt)
}

// Formularium card (used in the printed formularium) — matches LaTeX \formulariumcard
#let _formularium_card(entry, page) = {
  v(4pt)
  block(width: 100%, [
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 0.5em,
      [*#entry.title*], none, link(label("frm-" + str(entry.idx)), text(size: 0.75em, fill: schoolBlue)[p.#page]),
    )
    #v(2pt)
    #align(center, text(size: 1.1em)[#_as-display(entry.formula)])
    #v(2pt)
    #text(size: 0.9em, style: "italic")[#entry.description]
  ])
  v(4pt)
}

// Doorloopt de entries en zet een sectiescheiding zodra het hoofdstuk wisselt.
// _formularium_divider bestond al maar werd nergens aangeroepen, waardoor het
// formularium één platte lijst was terwijl de LaTeX-kant per sectie groepeert.
// Groepeert per hoofdstuk, zoals \printSectionFormulas in school-macros.sty.
// De scheiding hangt alleen af van entry.section, dat in documentvolgorde is
// vastgelegd -- niet van een query hier, want daarmee ging de paginering
// terugkoppelen op de inhoud van het formularium.
#let _formularium_body(entries) = {
  let current = none
  for entry in entries {
    let sect = entry.at("section", default: none)
    if sect != current {
      if sect != none { _formularium_divider(sect) }
      current = sect
    }
    let hits = query(label("frm-" + str(entry.idx)))
    let page = if hits.len() > 0 { hits.first().location().page() } else { 0 }
    _formularium_card(entry, page)
  }
}

// Print formularium (single column)
#let printformularium() = {
  heading(numbering: none)[Formularium]
  context {
    let entries = _formularium_entries.final()
    if entries.len() == 0 {
      emph[Nog geen formules geregistreerd.]
    } else {
      _formularium_body(entries)
    }
  }
}

// Print formularium (two columns)
#let printformulariumtwocol() = {
  heading(numbering: none)[Formularium]
  context {
    let entries = _formularium_entries.final()
    if entries.len() == 0 {
      emph[Nog geen formules geregistreerd.]
    } else {
      columns(2, _formularium_body(entries))
    }
  }
}

// ============================================================================
//                           SYMBOL SYSTEM (sym)
// ============================================================================

// State to collect symbol entries and track which symbols have been defined
#let _symbol_entries = state("symbol-entries", ())
#let _symbol_defined = state("symbol-defined", ())

// symbool: Define a symbol on first use (shows inline box), subsequent uses just render the symbol
// Usage: #symbool($alpha$, "Hoekversnelling", "rad/s²")
#let symbool(symbol, description, unit) = {
  let sym_key = repr(symbol)
  context {
    let defined = _symbol_defined.get()
    if sym_key not in defined {
      // First use: show definition box and register
      let current_page = here().page()
      _symbol_defined.update(d => {
        d.push(sym_key)
        d
      })
      _symbol_entries.update(entries => {
        entries.push((symbol: symbol, description: description, unit: unit, page: current_page))
        entries
      })
      // Een compacte definitieregel. Dit was een blok in een blok met ruime
      // marges; drie symbolen na elkaar lazen als een kapotte opsomming en
      // braken de leesloop van de lopende tekst.
      block(
        width: 100%,
        above: 0.5em,
        below: 0.5em,
        stroke: (left: 2pt + schoolGray),
        inset: (left: 7pt, top: 1pt, bottom: 1pt),
        [
          *$#symbol$* --- #description #h(1fr) #text(size: 0.85em, fill: schoolGray, font: "Fira Sans")[#unit]
        ],
      )
    } else {
      // Subsequent use: just show the symbol
      $#symbol$
    }
  }
}

// Print symbol list as a table
#let printsymbols() = {
  heading(numbering: none)[Symbolenlijst]
  context {
    let entries = _symbol_entries.final()
    if entries.len() == 0 {
      emph[Nog geen symbolen geregistreerd.]
    } else {
      table(
        columns: (auto, 1fr, auto, auto),
        align: (center, left, left, right),
        stroke: none,
        inset: 6pt,
        table.hline(stroke: 1pt),
        table.header(
          text(weight: "bold", font: "Fira Sans")[Symbool],
          text(weight: "bold", font: "Fira Sans")[Beschrijving],
          text(weight: "bold", font: "Fira Sans")[Eenheid],
          text(weight: "bold", font: "Fira Sans")[Pagina],
        ),
        table.hline(stroke: 0.5pt),
        ..for entry in entries {
          (
            $#entry.symbol$,
            entry.description,
            entry.unit,
            str(entry.page),
          )
        },
        table.hline(stroke: 1pt),
      )
    }
  }
}

// --- Styling Helpers ---
#let important(content) = text(fill: schoolRed, weight: "bold")[#content]
#let belangrijk = important  // Dutch alias matching LaTeX \belangrijk
#let term(content) = text(fill: schoolBlue, weight: "bold")[#content]
// LaTeX: \keyterm{...} = \textbf{\color{schoolBlue!80!black}...}
// De oude definitie was `strong(content)` met de comment "uses the global strong
// style with darkened blue", maar er is geen `show strong` rule in dit bestand:
// keyterm was gewoon vet en week dus af van de LaTeX-kant.
#let keyterm(content) = text(fill: schoolBlue.darken(20%), weight: "bold")[#content]

// --- Exam & Annotation Helpers ---
// Zelfde rustige vorm als examenbox in school-macros.sty: blauw keyterm-label
// met icoon en cursieve tekst. Dit had een rode balk links en een rood label,
// wat een stuk schreeuweriger stond dan de LaTeX-kant.
#let examenbox(body) = block(
  width: 100%,
  above: 1.25em,
  below: 1.25em,
  [
    #keyterm[#ic-exam#h(0.25em)EXAMENTIP:]#h(0.35em)#emph(body)
  ],
)

#let TODO(msg) = text(fill: red, weight: "bold", font: "Fira Sans")[\[TODO: #msg\]]
#let FIXME(msg) = text(fill: red, weight: "bold", font: "Fira Sans")[\[FIXME: #msg\]]
#let NOTE(msg) = text(fill: schoolOrange, weight: "bold", font: "Fira Sans")[\[NOTE: #msg\]]
#let citeme = text(fill: red, font: "Fira Sans")[\[CITATIE NODIG\]]

// --- Chapter Outline (Local TOC per chapter) ---
// Usage: Place #chapter-outline() right after the level-1 heading of a chapter.
// It will render a simple table of contents showing only the level-2 sections within that chapter.
#let chapter-outline() = {
  context {
    let loc = here()
    // Find all level-1 headings in the document
    let all-h1 = query(heading.where(level: 1))

    // Find the current chapter (the last level-1 heading before this point)
    let current-chapter = none
    let current-idx = -1
    for (i, hd) in all-h1.enumerate() {
      if hd.location().position().page <= loc.position().page {
        current-chapter = hd
        current-idx = i
      }
    }

    if current-chapter == none { return }

    // Determine the boundary: the next level-1 heading (or end of document)
    let next-chapter = if current-idx + 1 < all-h1.len() {
      all-h1.at(current-idx + 1)
    } else {
      none
    }

    // Query only level-2 headings
    let sub-headings = query(heading.where(level: 2))

    // Filter to only headings within this chapter using location comparison
    // This prevents headings from an earlier chapter on the same page from leaking in
    let current-loc = current-chapter.location()
    let chapter-headings = sub-headings.filter(entry => {
      let entry-loc = entry.location()
      let ep = entry-loc.position().page
      let ey = entry-loc.position().y
      let cp = current-loc.position().page
      let cy = current-loc.position().y
      // Must be after current chapter heading
      let after-current = ep > cp or (ep == cp and ey > cy)
      // Must be before next chapter heading
      let before-next = if next-chapter != none {
        let np = next-chapter.location().position().page
        let ny = next-chapter.location().position().y
        ep < np or (ep == np and ey < ny)
      } else {
        true
      }
      after-current and before-next
    })

    if chapter-headings.len() == 0 { return }

    // Render a clean, simple outline
    v(4pt)
    text(weight: "bold", size: 10pt)[Inhoud]
    v(4pt)
    for entry in chapter-headings {
      let num = if entry.numbering != none {
        counter(heading).at(entry.location()).map(str).join(".") + ". "
      }
      block(spacing: 0.5em)[
        #num#entry.body
        #box(width: 1fr, repeat[.#h(4pt)])
        #text(size: 9pt)[#entry.location().position().page]
      ]
    }
    v(8pt)
  }
}

// --- Chapter Page Styling ---
// Eigen show rule voor de kop op deze pagina. De `set text(size: 2.5em)` die
// hier stond deed niets: de level-1 show rule in project() zet een expliciete
// tekstgrootte en wint daarvan. Resultaat was een normaal kleine kop, mét de
// liniaal en de linkeruitspringing van een gewone hoofdstuktitel, midden op
// een verder lege pagina.
#let chapter_page(title, label: none) = {
  pagebreak(weak: true)
  set page(header: none) // Hide header on chapter pages
  [
    #show heading.where(level: 1): it => {
      // Dezelfde boekhouding als de gewone level-1 rule
      counter(std-figure.where(kind: image)).update(0)
      counter(std-figure.where(kind: table)).update(0)
      counter(std-figure.where(kind: raw)).update(0)
      _current_chapter.update(it.body)
      align(center)[
        #text(size: 2.4em, font: ("Fira Sans", "Liberation Sans"), weight: "bold")[
          #if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body
        ]
        #v(0.6em)
        #line(length: 60%, stroke: 2pt + schoolBlue)
      ]
    }
    #v(1fr)
    #heading(level: 1, outlined: true)[#title]
    #if label != none { label }
    #v(1.4fr)
  ]
  pagebreak(weak: true)
}
