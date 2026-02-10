// school-template.typ
// Typst template for KU Leuven Industrial Engineering Summaries
// Mirrors the styling of school-macros.sty v4.2

#let schoolBlue = rgb(41, 98, 155)
#let schoolRed = rgb(180, 40, 40)
#let schoolGreen = rgb(39, 174, 96)
#let schoolOrange = rgb(230, 126, 34)
#let schoolTeal = rgb(0, 150, 136)
#let schoolGray = rgb(100, 100, 100)
#let deepblue = rgb(41, 128, 185)

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
    header: locate(loc => {
      let page_num = counter(page).at(loc).first()
      if page_num > 1 {
        set text(size: 9pt, font: "Fira Sans")
        let headers = query(selector(heading.where(level: 1)).before(loc), loc)
        let last_header = if headers.len() > 0 { headers.last().body } else { [] }
        
        grid(
          columns: (1fr, 1fr),
          align(left, last_header),
          align(right, text(weight: "bold")[#page_num])
        )
        v(-0.5em)
        line(length: 100%, stroke: 0.3pt)
      }
    }),
  )

  // Typography
  set text(font: "Bitstream Charter", lang: "nl", size: 11pt)
  set par(leading: 0.65em, justify: true) // Approx 1.15 line spacing
  
  show heading: set text(font: "Fira Sans", weight: "bold")
  
  show heading.where(level: 1): it => [
    #v(12pt)
    #text(size: 1.5em)[#it.body]
    #v(4pt)
    #line(length: 100%, stroke: 0.5pt)
    #v(6pt)
  ]
  
  show heading.where(level: 2): it => [
    #v(10pt)
    #it.body
    #v(4pt)
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
      ]
    )
  ]
  v(2em)

  // Outline
  outline(indent: auto)
  pagebreak()

  // Content
  body
}

// --- Custom Boxes (Mirrors tcolorbox schoolbox) ---

#let schoolbox(title, color, icon, body) = {
  v(12pt)
  block(
    width: 100%,
    breakable: true,
    stack(
      // Attached Title (Approximate)
      move(dx: 10pt, dy: 8pt,
        block(
          fill: color,
          inset: (x: 8pt, y: 4pt),
          radius: (top-left: 2pt, top-right: 2pt, bottom-right: 2pt, bottom-left: 0pt),
          text(fill: white, weight: "bold", font: "Fira Sans", size: 10pt)[#icon #title]
        )
      ),
      // Box Body
      block(
        width: 100%,
        fill: white,
        stroke: 0.5pt + color,
        radius: 2pt,
        inset: (top: 14pt, rest: 12pt),
        body
      )
    )
  )
  v(12pt)
}

#let theorie(title: "Theorie", body) = schoolbox(title, schoolBlue, "📘", body)
#let voorbeeld(title: "Voorbeeld", body) = schoolbox(title, schoolGreen, "✏️", body)
#let waarschuwing(title: "Let Op!", body) = schoolbox(title, schoolRed, "⚠️", body)
#let concept(title: "Concept", body) = schoolbox(title, schoolTeal, "💡", body)
#let form(title: "Formule", body) = schoolbox(title, schoolOrange, "∑", body)
#let theorem(title: "Theorem", body) = schoolbox(title, deepblue, "📖", body)

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
      // Title bar with circles
      block(
        width: 100%,
        inset: (x: 10pt, y: 6pt),
        fill: codeBackground,
        grid(
          columns: (40pt, 1fr),
          stack(dir: ltr, spacing: 4pt,
            circle(radius: 2.5pt, fill: rgb(255, 95, 86)),
            circle(radius: 2.5pt, fill: rgb(255, 189, 46)),
            circle(radius: 2.5pt, fill: rgb(39, 201, 63)),
          ),
          align(center, text(fill: vscodeGray, font: "Fira Sans", size: 8pt, weight: "bold")[
            #if title != none { title } else { lang }
          ])
        )
      )
      // Code
      block(
        width: 100%,
        inset: 10pt,
        text(fill: vscodeWhite, font: "Fira Mono", size: 9pt)[
          #body
        ]
      )
    ]
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

// --- Styling Helpers ---
#let important(content) = text(fill: schoolRed, weight: "bold")[#content]
#let term(content) = text(fill: schoolBlue, weight: "bold")[#content]
#let keyterm(content) = text(fill: schoolBlue.darken(20%), weight: "bold")[#content]