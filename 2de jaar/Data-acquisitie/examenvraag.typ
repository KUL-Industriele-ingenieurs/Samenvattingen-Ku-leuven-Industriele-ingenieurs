#import "../../school-template.typ": *

// Examenvraag in de gewone #examenbox: opties met een vakje, het juiste vakje
// ingekleurd, daaronder waarom. Zonder opties (open/theorievraag) wordt de
// laatste parameter het uitgewerkte antwoord.
//   #examenvraag("23-24 vraag 1", [Een transducer is ...],
//     opties: ([..], [..], [..], [..]), juist: "B")[uitleg]

#let _groen = schoolGreen.darken(15%)

#let _vakje(juist) = box(
  width: 0.8em,
  height: 0.8em,
  baseline: 0.1em,
  radius: 1pt,
  stroke: 0.6pt + if juist { _groen } else { schoolGray },
  fill: if juist { _groen } else { none },
  if juist { align(center + horizon, text(fill: white, size: 0.65em, weight: "bold")[✓]) },
)

#let examenvraag(bron, vraag, opties: (), juist: none, uitleg) = examenbox({
  [#text(weight: "bold")[#bron:] #vraag]
  if opties.len() > 0 {
    let letters = ("A", "B", "C", "D", "E", "F")
    v(0.3em)
    grid(
      columns: (auto, auto, 1fr),
      column-gutter: 0.5em,
      row-gutter: 0.6em,
      ..opties
        .enumerate()
        .map(((i, optie)) => {
          let j = letters.at(i) == juist
          let opmaak = c => if j { text(fill: _groen, weight: "bold", c) } else { c }
          (_vakje(j), opmaak[#letters.at(i)], opmaak(optie))
        })
        .flatten(),
    )
  }
  v(0.3em)
  [#text(weight: "bold")[#if opties.len() > 0 [Waarom:] else [Antwoord:]] #uitleg]
})
