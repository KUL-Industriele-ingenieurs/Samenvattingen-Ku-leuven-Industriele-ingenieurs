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
differentiaalvergelijking. Newton's tweede wet ($m a = sum F$) geeft, met
een aandrijfkracht $f(t)$ van de motor en een wrijvingskracht evenredig met
de snelheid:

$ m (dif v(t)) / (dif t) = f(t) - beta v(t) $

met:
- $v(t)$ --- snelheid van de wagen [m/s]
- $f(t)$ --- ingangskracht, geleverd door de motor (bepaald door de stand
  van het gaspedaal) [N]
- $m$ --- massa van de wagen [kg]
- $beta$ --- weerstandsfactor (wrijving, luchtweerstand) [N·s/m]

== Eerste-orde systemen modelleren <sec:eerste-orde-systemen>

De ODE (Ordinary Differential Equation, gewone differentiaalvergelijking) van
de wagen is van de *eerste orde*: er komt enkel een eerste afgeleide in voor.
Die klasse los je niet telkens opnieuw op --- je herschrijft ze naar de
standaardvorm $y'(t) = k y(t) + f(t)$ en past de kant-en-klare
oplossingsformule @eq:algemene-oplossing-eerste-orde toe. Die formule staat,
samen met haar afleiding, in de herhaling: @sec:eerste-orde-ldv en
@sec:afleiding-integrerende-factor.

Hier gebruiken we die formule om te laten zien wat ze *fysisch* betekent, en
dat twee compleet verschillende systemen er precies dezelfde wiskunde uit
krijgen.

#figure(
  cetz.canvas({
    import cetz.draw: *
    cetz-plot.plot.plot(
      size: (9, 4),
      axis-style: "school-book",
      x-min: 0, x-max: 4, y-min: 0, y-max: 1.2,
      x-tick-step: 1, y-tick-step: 0.5,
      x-label: $t \/ tau$, y-label: $y(t) \/ X_infinity$,
      {
        cetz-plot.plot.add(
          domain: (0, 4), samples: 140,
          style: (stroke: schoolBlue + 1.6pt),
          t => 1 - calc.exp(-t),
        )
        cetz-plot.plot.add(
          domain: (0, 4), samples: 2,
          style: (stroke: (paint: schoolGray, thickness: 1pt, dash: "dashed")),
          t => 1,
        )
      },
    )
  }),
  caption: [Genormaliseerde stapresponsie $y(t)\/X_infinity = 1 - e^(-t\/tau)$
    van een eerste-orde systeem met nulinitiatie: na $t=tau$ is $63%$ van de
    eindwaarde $X_infinity$ bereikt, na $t=4tau$ vrijwel $100%$],
) <fig:stapresponsie-eerste-orde>

=== Voorbeeld: de wagen (mechanisch) <sec:voorbeeld-wagen-ode>

Herschrijf de ODE van hierboven, $m (dif v)/(dif t) = f(t) - beta v(t)$,
naar de standaardvorm door te delen door $m$:

$ v'(t) = -beta/m v(t) + f(t)/m $

Dus $k = -beta\/m$.

*Beginvoorwaarde:* de wagen vertrekt in rust, $v(0) = 0 => K = 0$.
*Ingang:* het gaspedaal wordt op $t=0$ ingedrukt tot een vaste stand en
blijft daar, dus de motor levert een constante kracht: $f(t) equiv F$ voor
$t > 0$ (een stapfunctie).

*Toepassen van @eq:algemene-oplossing-eerste-orde* (met $K=0$):
$ v(t) = integral_0^t F/m e^(-beta/m (t-tau)) dif tau $

De integraal is van de vorm $integral_0^t e^(-a(t-tau)) dif tau
= 1/a (1 - e^(-a t))$ (substitutie $u=t-tau$), met $a = beta\/m$:

$ v(t) = F/m dot m/beta (1 - e^(-beta/m t)) = F/beta (1 - e^(-beta/m t)) $

*Key insight:* als $t -> oo$ gaat $v(t) -> F\/beta$ --- de eindsnelheid
waarbij de aandrijvende kracht $F$ precies de wrijvingskracht $beta v$
balanceert ($v'=0$). De tijdconstante $tau = m\/beta$ bepaalt hoe snel die
evenwichtstoestand bereikt wordt.

=== Voorbeeld: RC-circuit opladen (elektrisch) <sec:voorbeeld-rc-ode>

Hetzelfde recept werkt voor een compleet ander fysisch systeem: een
condensator $C$ die oplaadt via een weerstand $R$.

Uit de maasvergelijking (KVL) en de condensatorrelatie $Q = C v_o (t)$, met
$i(t) = (dif Q)/(dif t) = C v_o'(t)$:

$ v_i (t) = R i(t) + v_o (t) = R C v_o'(t) + v_o (t) $

Naar standaardvorm:
$ v_o'(t) = -1/(R C) v_o (t) + 1/(R C) v_i (t) $

met:
- $v_i (t)$ --- ingangsspanning (bronspanning) [V]
- $v_o (t)$ --- uitgangsspanning, over de condensator [V]
- $R$ --- weerstand [$Omega$], $C$ --- capaciteit [F]

Dus $k = -1\/(R C)$ en $f(t) = v_i (t) \/ (R C)$.

*Beginvoorwaarde:* condensator initieel ontladen, $v_o (0) = 0 => K = 0$.
*Ingang:* de bronspanning wordt op $t=0$ ingeschakeld (bv. schakelaar
gesloten) en blijft constant: $v_i (t) equiv V_i$ voor $t>0$.

*Toepassen* (identieke integraal als bij de wagen, met $a = 1\/(R C)$):
$ v_o (t) = integral_0^t V_i / (R C) e^(-(t-tau)\/(R C)) dif tau
  = V_i (1 - e^(-t\/(R C))) $

*Key insight:* wiskundig exact dezelfde vorm als de wagen --- enkel de
symbolen verschillen. De analogie:

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    inset: 0.5em,
    align: (left + horizon, center + horizon, center + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("1f4e79") } else { none },
    table.header(
      text(fill: white)[*Rol*], text(fill: white)[*Wagen*], text(fill: white)[*RC-circuit*]
    ),
    [Tijdconstante $tau$], [$m\/beta$], [$R C$],
    [Eindwaarde $X_infinity$], [$F \/ beta$], [$V_i$],
    [Antwoord], [$v(t) = X_infinity (1-e^(-t\/tau))$], [$v_o (t) = X_infinity (1-e^(-t\/tau))$],
  ),
  caption: [Analogie mechanisch $<->$ elektrisch: zelfde wiskundige
    structuur (@fig:stapresponsie-eerste-orde), andere fysische betekenis],
) <fig:analogie-wagen-rc>

Zodra je de generieke vorm $y(t) = X_infinity (1-e^(-t\/tau))$ herkent, hoef
je de integraal nooit meer opnieuw uit te rekenen: je leest gewoon $tau$ en
$X_infinity$ af uit je eigen $k$ en $f(t)$.

// TODO: signaal vs. systeem — definitie van een signaal, continu vs. discreet
// TODO: voorbeelden van systemen uit andere domeinen (thermisch)
// TODO: waarom transformaties? motivatie voor Laplace/Fourier als brug naar Deel 2
