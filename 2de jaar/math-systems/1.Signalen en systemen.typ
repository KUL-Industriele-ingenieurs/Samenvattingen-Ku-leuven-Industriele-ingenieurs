#import "../../school-template.typ": *

// ============================================================================
//  Les 1 — Introductie tot de cursus + Signalen en systemen
//  Slides: vakinhoud, cursusmateriaal, evaluatie
//  Deel 1: Inleiding
// ============================================================================

= Signalen en systemen --- een eerste kennismaking <ch:inleiding>

== Introductie tot de cursus <sec:vakinfo>

=== Vakinhoud <sec:vakinhoud>

Het vak is opgebouwd uit *drie delen*: een inleidend deel, een deel met de
wiskundige *technieken* (transformaties) en een deel *systeemtheorie* waarin die
technieken op systemen worden losgelaten.

#figure(
  table(
    columns: (auto, auto, 1fr),
    inset: 0.5em,
    align: (center + horizon, center + horizon, left + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("1f4e79") } else { none },
    table.header(
      text(fill: white)[*Deel*], text(fill: white)[*Hfst.*], text(fill: white)[*Onderwerp*]
    ),
    table.cell(rowspan: 1)[*1*\ Inleiding], [1], [Signalen en systemen --- een eerste kennismaking],
    table.cell(rowspan: 4)[*2*\ Wiskundige\ technieken], [2], [Signalen --- basissignalen en bewerkingen],
    [3], [De Laplacetransformatie],
    [4], [De Fouriertransformatie],
    [5], [De Fourierreeks],
    table.cell(rowspan: 2)[*3*\ Wiskundige\ systeemtheorie], [6], [Lineaire Tijdsinvariante Continue (LTC) systemen],
    [7], [Eigenwaarden en eigenvectoren],
  ),
  caption: [Vakinhoud Wiskunde voor Systemen],
) <fig:vakinhoud>

=== Cursusmateriaal <sec:cursusmateriaal>

- *Cursustekst* --- P. Hellings en T. van Waterschoot, _Wiskunde voor Systemen_,
  KU Leuven Campus Groep T, ed. 2023-2024. Verkrijgbaar bij Industria
  Kursusdienst; PDF met watermerk op Toledo.
- *Oefeningenbundel* --- T. van Waterschoot, _Wiskunde voor Systemen:
  Oefeningen_, KU Leuven Campus Groep T, ed. 2023-2024. PDF beschikbaar op
  Toledo.
- *Slides* --- M. Taseska en T. van Waterschoot, _Slides Wiskunde voor
  Systemen_, KU Leuven, ed. 2021-2022. Beschikbaar op Toledo.
- *Hoorcollegevideo's* (Engels) --- beschikbaar op Toledo.

#waarschuwing[
  Al dit materiaal is auteursrechtelijk beschermd. Respecteer het auteursrecht
  en verspreid het niet verder.
]

=== Evaluatie <sec:evaluatie>

*Examenvorm:*

- Schriftelijk examen tijdens de *1e examenperiode* (januari).
  - Examenvragen: $plus.minus 30 %$ theorie, $plus.minus 70 %$ oefeningen.
  - *Gesloten boek*, formularium (zie Toledo) en rekenmachine toegestaan.
- Herexamen tijdens de *3de examenperiode* (aug.--sept.).
- #underline[*Examenrichtlijnen en voorbeeldexamen vind je op Toledo.*]

*Evaluatie:*

- Eindcijfer $=$ 100 % examencijfer.
- Eindcijfer is een *geheel getal* op schaal tot 20
  (#link("https://www.kuleuven.be/onderwijs/oer/2025/")[OER 2025]).
- Geslaagd: eindcijfer $>= 10\/20$.

#concept(title: "Aanpak voor het examen")[
  Met 70 % oefeningen valt of staat je punt bij het *maken* van oefeningen. Ga
  naar de oefenzittingen en werk de oefeningenbundel en de voorbeeldexamens op
  Toledo stap voor stap door. Leer ook je *formularium* kennen: je mag het
  meenemen, maar alleen als je weet wát erin staat en wanneer je het gebruikt,
  wint het je tijd.
]

== Wat is een systeem? <sec:wat-is-een-systeem>

#concept(title: "Systeem")[
  Een *systeem* is een verband dat een *excitatie* (input) omzet in een
  *respons* (output). Het is *causaal*: de input veroorzaakt de output, niet
  omgekeerd.
]

#figure(
  fletcher.diagram(
    node-stroke: 0.8pt,
    node-fill: white,
    spacing: 3em,
    {
      import fletcher: node, edge
      node((0, 0), [Excitatie], stroke: none)
      edge((0, 0), (1, 0), "->", label: text(size: 0.8em)[Input])
      node((1, 0), [*Systeem*], stroke: schoolBlue, fill: schoolBlue.lighten(95%), inset: 1em)
      edge((1, 0), (2, 0), "->", label: text(size: 0.8em)[Output])
      node((2, 0), [Respons], stroke: none)
    },
  ),
  caption: [Schematische voorstelling van een systeem],
) <fig:systeem-diagram>

Een *auto* is een eenvoudig voorbeeld: je geeft gas (input) en de auto versnelt
(output). In het tijdsdomein beschrijf je dat verband met een
differentiaalvergelijking. Voor een eerste-orde model met massa $m$ en
weerstandsfactor $b$:

$ m (dif v(t)) / (dif t) = k_u u(t) - b v(t) $

met:
- $v(t)$ --- snelheid van de wagen [m/s]
- $u(t)$ --- ingangssignaal, de stand van het gaspedaal [-]
- $k_u$ --- omzettingsconstante van pedaalstand naar kracht [N]
- $m$ --- massa van de wagen [kg]
- $b$ --- weerstandsfactor (wrijving, luchtweerstand) [N·s/m]

// TODO: signaal vs. systeem — definitie van een signaal, continu vs. discreet
// TODO: voorbeelden van systemen uit andere domeinen (elektrisch, thermisch)
// TODO: waarom transformaties? motivatie voor Laplace/Fourier als brug naar Deel 2
