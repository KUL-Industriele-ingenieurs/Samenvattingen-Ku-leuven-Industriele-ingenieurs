// school-template.typ
// Typst template for KU Leuven Industrial Engineering Summaries
// Mirrors the styling of school-macros.sty v4.2

// --- External Packages (from Typst Universe) ---
#import "@preview/unify:0.7.1": num, numrange, qty, qtyrange  // siunitx equivalent
#import "@preview/physica:0.9.5": *     // Physics math: derivatives, brakets, etc.
#import "@preview/cetz:0.4.2"
#let cetz = cetz
#import "@preview/cetz-plot:0.1.3": chart, plot  // Plotting (pgfplots equivalent)
#let chart = chart
#let plot = plot
#import "@preview/wrap-it:0.1.1": wrap-content, wrap-top-bottom
#import "@preview/muchpdf:0.1.2": muchpdf
#import "@preview/equate:0.3.2"
#import "@preview/cetz-venn:0.1.4"
#import "@preview/oasis-align:0.3.3": *

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
  width: 5cm,
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

  let boxed = box(fig-with-label, width: width, inset: (
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
#let schoolBlue = rgb(41, 98, 155)
#let schoolRed = rgb(180, 40, 40)
#let schoolGreen = rgb(39, 174, 96)
#let schoolOrange = rgb(230, 126, 34)
#let schoolTeal = rgb(0, 150, 136)
#let schoolGray = rgb(100, 100, 100)
#let deepblue = rgb(41, 128, 185)

// --- Modern Color Palette ---
#let schoolPurple = rgb(155, 89, 182)
#let brandblue = rgb(52, 152, 219)
#let amber = rgb(243, 156, 18)
#let coral = rgb(230, 126, 34)
#let slate = rgb(52, 73, 94)
#let lightgray = rgb(236, 240, 241)

// --- VS Code Dark Theme Palette ---
#let codeBackground = rgb(30, 30, 30)
#let vscodeBlue = rgb(86, 156, 214)
#let vscodeGreen = rgb(106, 153, 85)
#let vscodeOrange = rgb(206, 145, 120)
#let vscodePurple = rgb(197, 134, 192)
#let vscodeYellow = rgb(220, 220, 170)
#let vscodeGray = rgb(133, 133, 133)
#let vscodeWhite = rgb(212, 212, 212)

// --- Template Function ---
#let project(
  title: "",
  course: "",
  authors: (),
  academic_year: "",
  body,
) = {
  // Metadata
  set document(author: authors, title: title)

  // Page setup
  set page(
    paper: "a4",
    margin: (left: 2cm, right: 2cm, top: 2.5cm, bottom: 2.5cm),
    numbering: "1",
    header: context {
      let page_num = counter(page).get().first()
      if page_num > 1 {
        set text(size: 9pt * 0.92, font: ("Fira Sans", "Arial"))
        let headers = query(selector(heading.where(level: 1)).before(here()))
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
  set text(font: "Charter", lang: "nl", size: 11pt)
  set par(leading: 0.63em, first-line-indent: 0pt, spacing: 1.2em, justify: true)
  set heading(numbering: "1.1")

  show raw: set text(font: ("Fira Code", "Fira Mono"), size: 0.85em)
  // Math uses Typst's default New Computer Modern Math (serif, matching Charter body text)

  // Override emptyset to use sans-serif glyph for visual consistency
  show sym.emptyset: set text(font: "Fira Sans")

  // Link styling: URLs in schoolBlue, internal refs in black with underline
  show link: it => text(fill: schoolBlue)[#underline(it)]
  show ref: it => underline(it)

  // Caption styling: small Fira Sans, bold label
  show std-figure.caption: set text(size: 0.9em * 0.92, font: "Fira Sans", weight: "bold")

  // List styling: match LaTeX tightened spacing
  set list(indent: 2em, body-indent: 0.5em, spacing: 0.6em)
  set enum(indent: 2em, body-indent: 0.5em, spacing: 0.6em)

  show heading: set text(font: "Fira Sans", weight: "bold")

  show heading.where(level: 1): it => [
    #v(8pt)
    #text(size: 13.2pt)[#if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body]
    #v(-6pt)
    #line(length: 100%, stroke: 0.5pt)
    #v(3pt)
  ]

  show heading.where(level: 2): it => [
    #v(6pt)
    #text(size: 11pt)[#if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body]
    #v(2pt)
  ]

  show heading.where(level: 3): it => [
    #v(4pt)
    #text(size: 10.1pt)[#if it.numbering != none { counter(heading).display(it.numbering) + h(0.5em) }#it.body]
    #v(2pt)
  ]

  // Title Page
  align(center + horizon)[
    #v(-5cm)
    #text(size: 2.5em, weight: "bold", font: "Fira Sans", fill: black)[#title]
    #v(0.5cm)
    #text(size: 1.5em, font: "Fira Sans")[#course]
    #v(2cm)
    #text(size: 1.2em)[#authors.join(", ")]
    #v(1cm)
    #text(size: 1.2em)[#academic_year]
    #v(4em)
    #image("Ku Leuven logo.png", width: 50%)
    #v(2cm)
    #text(size: 1.1em, font: "Fira Sans")[KU Leuven] \
    #text(size: 0.9em, font: "Fira Sans")[Faculteit Industriële Ingenieurswetenschappen]
  ]
  pagebreak()

  // Disclaimer / Intro
  align(center)[
    #block(
      fill: luma(250),
      inset: 12pt,
      radius: 4pt,
      stroke: (left: 3pt + schoolBlue),
      [
        #set align(left)
        *Disclaimer:* Deze samenvattingen zijn beschikbaar op GitHub. \
        Draag gerust bij: #link("https://github.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs")[GitHub Repository]
      ],
    )
  ]
  v(2em)

  // Table of Contents (styled to match LaTeX)
  {
    set text(font: ("Charter", "serif"))
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

  // Content
  body
}
// --- Custom Boxes (Mirrors tcolorbox schoolbox) ---

#let schoolbox(title, color, icon, body, bg: white) = {
  v(12pt)
  // Title strip
  block(
    width: 100%,
    spacing: 0pt,
    above: 0pt,
    below: 0pt,
    {
      // Title tab - offset to the right
      move(dx: 8pt, block(
        fill: color,
        inset: (x: 10pt, y: 5pt),
        radius: (top-left: 4pt, top-right: 4pt),
        below: 0pt,
        text(fill: white, weight: "bold", font: "Fira Sans", size: 10pt)[#icon #title],
      ))
    },
  )
  // Body
  block(
    width: 100%,
    fill: bg,
    stroke: (
      left: 0.5pt + color,
      right: 0.5pt + color,
      bottom: 0.5pt + color,
      top: 0.5pt + color,
    ),
    radius: (bottom-left: 2pt, bottom-right: 2pt, top-right: 2pt),
    inset: 12pt,
    above: 0pt,
    breakable: true,
    body,
  )
  v(12pt)
}

#let theorie(title: "Theorie", body) = schoolbox(title, schoolBlue, "📘", body)
#let voorbeeld(title: "Voorbeeld", body) = schoolbox(title, schoolGreen, "✏️", body)
#let waarschuwing(title: "Let Op!", body) = schoolbox(title, schoolRed, "⚠️", body, bg: schoolRed.lighten(95%))
#let concept(title: "Concept", body) = schoolbox(title, schoolTeal, "💡", body, bg: schoolTeal.lighten(95%))
#let form(title: "Formule", body) = schoolbox(title, schoolOrange, "∑", body)
#let theorem(title: "Theorem", body) = schoolbox(title, deepblue, "📖", body)
#let oefening(title: "Oefening", body) = schoolbox(title, schoolGreen, "✏️", body)

// --- Code Block (VS Code Style) ---

#let codeblock(lang: "txt", title: none, body) = {
  v(12pt)
  block(
    width: 100%,
    clip: true,
    radius: 4pt,
    fill: codeBackground,
    stroke: 0.5pt + codeBackground,
    [
      // Title bar with traffic light circles
      #block(
        width: 100%,
        inset: (x: 10pt, y: 6pt),
        fill: codeBackground,
        below: 0pt,
        grid(
          columns: (40pt, 1fr),
          align: horizon,
          stack(
            dir: ltr,
            spacing: 4pt,
            circle(radius: 2.5pt, fill: rgb(255, 95, 86)),
            circle(radius: 2.5pt, fill: rgb(255, 189, 46)),
            circle(radius: 2.5pt, fill: rgb(39, 201, 63)),
          ),
          align(center, text(fill: vscodeGray, font: "Fira Sans", size: 8pt, weight: "bold")[
            #if title != none { title } else { lang }
          ]),
        ),
      )
      // Code body
      #block(
        width: 100%,
        inset: 10pt,
        above: 0pt,
        {
          set text(
            fill: vscodeWhite,
            font: ("Fira Code", "FiraCode Nerd Font", "FiraCode Nerd Font Mono", "Fira Mono", "Consolas"),
            size: 9pt * 0.85,
          )
          body
        },
      )
    ],
  )
  v(12pt)
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

// frm: Display a formula box (orange) and register it for the formularium
// Usage: #frm("Wet van Ohm", $U = I dot R$, [Beschrijving...])
#let frm(title, formula, description) = {
  _formularium_counter.step()
  context {
    let idx = _formularium_counter.get().first()
    let pg = here().page()
    [#metadata(none)#label("frm-" + str(idx))]
    _formularium_entries.update(entries => {
      entries.push((title: title, formula: formula, description: description, idx: idx, page: pg))
      entries
    })
  }
  schoolbox(title, schoolOrange, "∑", [
    #set align(center)
    #text(size: 1.2em)[#formula]
    #v(2pt)
    #set align(left)
    #text(size: 0.9em)[#description]
  ])
}

// Section divider for formularium (blue line with centered title)
#let _formularium_divider(title) = {
  v(10pt)
  block(width: 100%, {
    grid(
      columns: (1fr, auto, 1fr),
      column-gutter: 1em,
      align(horizon, line(length: 100%, stroke: 0.6pt + schoolBlue)),
      text(size: 0.9em, weight: "bold", font: "Fira Sans", fill: schoolBlue)[#title],
      align(horizon, line(length: 100%, stroke: 0.6pt + schoolBlue)),
    )
  })
  v(6pt)
}

// Formularium card (used in the printed formularium) — matches LaTeX \formulariumcard
#let _formularium_card(entry) = {
  v(4pt)
  block(width: 100%, [
    #grid(
      columns: (1fr, auto),
      [*#entry.title*], link(label("frm-" + str(entry.idx)), text(size: 0.75em, fill: schoolBlue)[p.#entry.page]),
    )
    #v(2pt)
    #align(center, text(size: 1.1em)[#entry.formula])
    #v(2pt)
    #text(size: 0.8em, style: "italic")[#entry.description]
  ])
  v(4pt)
}

// Print formularium (single column)
#let printformularium() = {
  heading(numbering: none)[Formularium]
  context {
    let entries = _formularium_entries.final()
    if entries.len() == 0 {
      emph[Nog geen formules geregistreerd.]
    } else {
      for entry in entries {
        _formularium_card(entry)
      }
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
      columns(2, {
        for entry in entries {
          _formularium_card(entry)
        }
      })
    }
  }
}

// ============================================================================
//                           SYMBOL SYSTEM (sym)
// ============================================================================

// State to collect symbol entries and track which symbols have been defined
#let _symbol_entries = state("symbol-entries", ())
#let _symbol_defined = state("symbol-defined", ())

// sym: Define a symbol on first use (shows inline box), subsequent uses just render the symbol
// Usage: #sym($alpha$, "Hoekversnelling", "rad/s²")
#let sym(symbol, description, unit) = {
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
      block(
        width: 100%,
        fill: white,
        stroke: none,
        inset: (x: 6pt, y: 4pt),
        [
          #block(
            width: 100%,
            stroke: (left: 3pt + schoolGray),
            inset: (left: 8pt, rest: 4pt),
            [
              *$#symbol$* --- #description #h(1fr) #text(size: 0.85em, fill: schoolGray, font: "Fira Sans")[#unit]
            ],
          )
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
#let keyterm(content) = text(fill: schoolBlue.darken(20%), weight: "bold")[#content]

// --- Exam & Annotation Helpers ---
#let examenbox(body) = block(
  inset: (x: 0pt, y: 0.5em),
  [#text(fill: schoolRed, weight: "bold", font: "Fira Sans")[⚠ EXAMENTIP:] #emph(body)],
)

#let TODO(msg) = text(fill: red, weight: "bold", font: "Fira Sans")[\[TODO: #msg\]]
#let FIXME(msg) = text(fill: red, weight: "bold", font: "Fira Sans")[\[FIXME: #msg\]]
#let NOTE(msg) = text(fill: schoolOrange, weight: "bold", font: "Fira Sans")[\[NOTE: #msg\]]
#let citeme = text(fill: red, font: "Fira Sans")[\[CITATIE NODIG\]]
