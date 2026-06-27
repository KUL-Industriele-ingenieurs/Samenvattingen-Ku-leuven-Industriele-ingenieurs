#import "../../school-template.typ": *

// ============================================================================
//  W2 — Inleiding, systemen en transferfuncties
//  Slides: 1.SYSCON_slides_01 (Sessie 0: vakinfo + Sessie 1)
//  Grotendeels herhaling van MathSYS: eerste en tweede orde systemen met
//  hun standaardvormen. Inhoud deels hergebruikt uit _OLD/1.Inleiding.typ
// ============================================================================

= Inleiding, systemen en transferfuncties <ch:inleiding>

== Vak- en exameninfo <sec:vakinfo>

Dit vak is een voortzetting van *MathSYS*: alles rond systemen, Laplace,
transferfuncties, polen en nullen wordt als gekend verondersteld. Deze eerste
les is dan ook vooral *herhaling* — we frissen eerste en tweede orde systemen
op samen met hun standaardvormen, want die vormen de basis voor de rest.

Wat is nu het doel van het vak, de vraag is hoe *controleer* je een systeem (bv. een drone)?
Een systeem krijgt inputs en moet gewenste outputs leveren. Bij een drone
meet je via sensoren versnelling $a$, snelheid $v$, positie $x$ en oriëntatie $theta$, en geef je
op basis daarvan de juiste inputs aan de motoren zodat ze stabiel blijft.

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    inset: 0.5em,
    align: (center + horizon, center + horizon, left + horizon, center + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("1f4e79") } else { none },
    table.header(
      text(fill: white)[*Week*], text(fill: white)[*Datum*], text(fill: white)[*Onderwerp*], text(fill: white)[*Deel*]
    ),
    [W2], [18/02], [Inleiding, systemen en transferfuncties], table.cell(rowspan: 4)[*SYS*],
    [W3], [25/02], [Elektronische toepassingen],
    [W4], [04/03], [Bode- en Nyquistdiagrammen],
    [W5], [11/03], [Bode, Nyquist en feedback],
    [W6], [18/03], [P-regeling en statische analyse van feedbacksysteem met P-regeling], table.cell(rowspan: 7)[*CON*],
    [W7], [25/03], [Closed-loop feedback],
    [W8], [01/04], [Closed-loop TF, PID-regeling],
    [W9], [22/04], [Bode-plot analyse],
    [W11], [29/04], [Tuning],
    [W12], [06/05], [Vooruitblik op root locus],
    [W13], [13/05], [Oefeningen, open vragen, bespreking examen],
  ),
  caption: [Lesplanning: deel *SYS* (systemen) en deel *CON* (control)],
) <fig:uurrooster>

=== Exameninfo <sec:exameninfo>
Het examen bestaat uit twee delen:
- *Geschreven deel (80%)* — focus op oefeningen.
- *Mondeling deel (20%)* — verdediging van een taak (rond de paasvakantie) over een systeem waarvoor je code schrijft. Je moet het systeem _on the fly_ kunnen aanpassen en uitleggen *wat* je doet en *waarom*.

Je mag de code maken met *AI of code van anderen*, maar je moet ze volledig *kunnen uitleggen*. Zorg dus dat je heel de oefenening snapt en dat je op verschillende soorten vragen kunt antwoorden bijvoorbeeld: _Waar heb je je delayfeedback geplaatst in simulink en waarom? Wat toont dit deel van de grafiek aan, wat voor soort transferfunctie $H(s)$ wijst dit?_

Studiemateriaal: *slides, notities van de prof, videolessen en oefeningen* — er is geen boek _maar ja daar is deze samenvattingen voor_.

== Feedback control: het einddoel <sec:feedback-doel>

Het einddoel van dit vak: snappen wat een *feedback control systeem* is, kunnen bepalen of het *stabiel* is, en zo'n systeem zelf kunnen *opstellen*.

#figure(
  image("assets/feedback-systeem.png", width: 60%),
  caption: [Feedback regelsysteem — het einddoel van dit vak],
) <fig:feedback-systeem>

Bij een temperatuurregeling vergelijkt een controller de gemeten temperatuur met de gewenste (referentie) temperatuur en stuurt op basis van dat verschil de verwarming aan. Door de *constante terugkoppeling* van de gemeten temperatuur kan het systeem zichzelf bijregelen.

Je gaat hiervoor controllers maken, je hebt er drie P (Propotional), I (Integral) en D (Derivative). Zij gaan de actie van je actuatoren bepalen (Zoals de airco die aan gaat afhankelijk van afwijking $epsilon(t)$ van gewenste temperatuur $r(t)$) met de gemeten temperatuur $z(t)$. Hier komen we later op terug

== Systeemanalyse: tijds- vs frequentiedomein <sec:systeemanalyse>

#figure(
  image("assets/systeemanalyse-overzicht.png", width: 11cm),
  caption: [Overzicht systeemanalyse: tijdsdomein vs frequentiedomein],
) <fig:systeemanalyse>

Voor we systemen kunnen *regelen* (het hoofddoel van SysCon), moeten we ze eerst
kunnen *beschrijven*. Een systeem is in essentie een "black box" die een *input*
omzet in een *output*: je geeft er iets in (een kracht, een spanning, een
gewenste temperatuur) en er komt iets uit (een snelheid, een stroom, de
werkelijke temperatuur). De vraag is telkens: hoe reageert de output op de
input? Daar bestaan twee complementaire manieren voor, en het is dezelfde
informatie, gewoon vanuit een andere bril bekeken.

Een systeem kan je op twee manieren beschrijven:

- In het *tijdsdomein* met een *differentiaalvergelijking*. Je beschrijft hoe de
  output in de tijd evolueert. De oplossing met een delta-input (zero-state) is
  de *impulsresponsie* $h(t)$: de "vingerafdruk" van het systeem. Is niet makkelijk om mee te werken want je krijgt dan complexe differentiaalvergelijkingen die je moet oplossen. Daarom werken we in dit vak bijna altijd in het frequentiedomein. Hiervoor heeft laplace een oplossing: de Laplace-transformatie zet die differentiaalvergelijking om in een algebraïsche breuk in $s$.

- In het *frequentiedomein* met de *transferfunctie* $H(s)$ via de
  Laplace-transformatie (of $H(j omega)$ via Fourier). Hier kijk je niet naar de
  tijd, maar naar hoe het systeem reageert op verschillende frequenties $omega$.

*Waarom twee domeinen?* In het tijdsdomein is een systeem vaak een lastige
differentiaalvergelijking om op te lossen. De Laplace-transformatie zet die
vergelijking om in een gewone *algebraïsche* breuk in $s$ — optellen, delen en
combineren van systemen wordt dan simpel rekenen in plaats van afgeleiden nemen.
Daarom werken we in dit vak bijna altijd in het frequentiedomein.

Het centrale begrip dat beide verbindt is de *transferfunctie*. Een
transferfunctie is een functie in het Laplace-domein die de verhouding tussen de
output en de input van een systeem beschrijft:
$ H(s) = frac("Output", "Input") = frac(V(s), F(s)) $

Met andere woorden: vermenigvuldig je de getransformeerde input met $H(s)$, dan
krijg je de getransformeerde output. $H(s)$ vat dus het volledige gedrag van het
systeem samen in één compacte uitdrukking — en uit die uitdrukking lezen we
straks de *polen*, *nullen* en *DC-versterking* af, die ons alles vertellen over
snelheid, stabiliteit en versterking van het systeem.



== Transferfunctie, polen en nullen <sec:transferfunctie>

Vlugge herhaling van Laplace. De transformatie
$ F(s) = cal(L){f(t)} = integral_0^infinity f(t) e^(-s t) dif t $
zet een functie van de tijd om in een functie van $s$. Het nut: afleiden,
integreren en convolueren in de tijd worden simpele *algebra* in $s$.

=== Rekenregels

#table(
  columns: (1.4fr, 1.6fr, 2fr),
  inset: 0.5em,
  align: (left + horizon, center + horizon, left + horizon),
  stroke: 0.6pt + rgb("d9d9d9"),
  fill: (_, row) => if row == 0 { rgb("f2f2f2") } else { none },
  [*Eigenschap*], [*Tijdsdomein* $f(t)$], [*Laplace-domein* $F(s)$],
  [Lineariteit], [$a f(t) + b g(t)$], [$a F(s) + b G(s)$],
  [Afgeleide], [$f'(t)$], [$s F(s) - f(0)$],
  [Tweede afgeleide], [$f''(t)$], [$s^2 F(s) - s f(0) - f'(0)$],
  [Integraal], [$integral_0^t f(tau) dif tau$], [$frac(F(s), s)$],
  [Tijdsverschuiving], [$f(t - a) u(t - a)$], [$e^(-a s) F(s)$],
  [Frequentieverschuiving], [$e^(-a t) f(t)$], [$F(s + a)$],
  [Schaling], [$f(a t)$], [$frac(1, a) F(s slash a)$],
  [Convolutie], [$(f * g)(t)$], [$F(s) dot G(s)$],
  [Beginwaarde], [$f(0^+)$], [$lim_(s arrow.r infinity) s F(s)$],
  [Eindwaarde], [$lim_(t arrow.r infinity) f(t)$], [$lim_(s arrow.r 0) s F(s)$],
)

#concept(title: "Kern")[
  Afleiden = *×$s$*, integreren = *÷$s$*. Zo wordt een differentiaalvergelijking
  een gewone breuk (de transferfunctie), en convolutie in de tijd wordt
  vermenigvuldigen in $s$: $V(s) = H(s) dot F(s)$.
]

=== Transformatieparen

Standaardfuncties om te herkennen (van rechts naar links = inverse Laplace):

#table(
  columns: (2fr, 2fr),
  inset: 0.5em,
  align: (center + horizon, center + horizon),
  stroke: 0.6pt + rgb("d9d9d9"),
  fill: (_, row) => if row == 0 { rgb("f2f2f2") } else { none },
  [*$f(t)$ (tijd)*], [*$F(s)$ (Laplace)*],
  [$delta(t)$ — impuls], [$1$],
  [$u(t)$ — eenheidsstap], [$frac(1, s)$],
  [$t$ — ramp], [$frac(1, s^2)$],
  [$t^n$], [$frac(n!, s^(n+1))$],
  [$e^(-a t)$], [$frac(1, s + a)$],
  [$t e^(-a t)$], [$frac(1, (s + a)^2)$],
  [$sin(omega t)$], [$frac(omega, s^2 + omega^2)$],
  [$cos(omega t)$], [$frac(s, s^2 + omega^2)$],
  [$e^(-a t) sin(omega t)$], [$frac(omega, (s + a)^2 + omega^2)$],
  [$e^(-a t) cos(omega t)$], [$frac(s + a, (s + a)^2 + omega^2)$],
)

*Onthoud vooral:*
- *Nul beginvoorwaarden* (we werken met variaties): $f'(t) arrow.r s F(s)$, $f''(t) arrow.r s^2 F(s)$.
- *Stap = $1 slash s$*, dus een stap-respons is $V(s) = H(s) slash s$.
- *$e^(-a s)$* = een *dode tijd* (delay) van $a$ seconden.
- *Inverse Laplace* via partieelbreuken + de parentabel.

=== Wat doet een delta-input?

Een *impuls* $delta(t)$ is de "puurste" test. Omdat $cal(L){delta(t)} = 1$:
$ V(s) = H(s) dot underbrace(F(s), = 1) = H(s) quad arrow.r.double quad h(t) = cal(L)^(-1){H(s)} $

De output *is* dus de transferfunctie zelf. In de tijd heet dat de
*impulsresponsie* $h(t)$: de "vingerafdruk" van het systeem. Voor elke andere
input geldt $V(s) = H(s) F(s)$.

Een systeem in evenwicht voor $t = 0$ heeft een constante input $f(0)$ en output $v(0)$. We werken met de *variaties* rond dat evenwicht:
$ Delta f(t) = f(t) - f(0) arrow.r F(s) quad quad Delta v(t) = v(t) - v(0) arrow.r V(s) $

De *transferfunctie* is de verhouding van de Laplace-getransformeerde output op input:
$ T(s) = H(s) = frac(V(s), F(s)) $

met:
- $H(s)$ --- transferfunctie [-]
- $F(s)$ --- Laplace van de input­variatie
- $V(s)$ --- Laplace van de output­variatie

=== DC-gain, polen en nullen

Een transferfunctie is een rationale functie in $s$: de *nullen* $z_i$ zijn de
wortels van de *teller* (boven), de *polen* $p_i$ de wortels van de *noemer*
(onder).

#figure(
  $
    H(s) = K dot frac(
      overbrace(#text(fill: green.darken(20%))[$(s - z_1)(s - z_2) dots.h$], #text(fill: green.darken(20%))[teller $arrow.r$ *nullen* $z_i$: $H(z_i) = 0$]),
      underbrace(#text(fill: red.darken(10%))[$(s - p_1)(s - p_2) dots.h$], #text(fill: red.darken(10%))[noemer $arrow.r$ *polen* $p_i$: $H(p_i) = infinity$]),
    )
  $,
  caption: [Nullen (teller) trekken $H$ naar $0$, polen (noemer) blazen $H$ op tot $infinity$. De polen bepalen de stabiliteit.],
) <fig:polen-nullen>

met $K$ de versterkingsfactor. De *DC-versterking* is de waarde bij $s = 0$:
$ K_(d c) = H(0) $
Groot $K_(d c)$ $arrow.r$ grote output bij kleine constante input; klein
$K_(d c)$ $arrow.r$ kleine output.

De *polen* (uit de noemer) bepalen de stabiliteit en het dynamisch gedrag:
- polen in het *linkse* halfvlak $arrow.r$ *stabiel*;
- polen in het *rechtse* halfvlak $arrow.r$ *instabiel*;
- polen op de imaginaire as $arrow.r$ *marginaal stabiel*.

#concept(title: "Link naar Bode-plots")[
  Dezelfde polen en nullen bepalen ook *hoe* het systeem op elke frequentie
  reageert — wat je later in het *Bode-plot* (W4–W5) ziet. Vuistregel: bij de
  frequentie van een *pool* knikt de versterking naar beneden ($-20$ dB/decade,
  het systeem *verzwakt*), bij een *nul* naar boven ($+20$ dB/decade, het systeem
  *versterkt*). Polen en nullen zijn dus dé sleutel tot zowel *stabiliteit* als
  *frequentiegedrag*.
]

=== Stabiliteit: waar liggen de polen?

Elke pool $p = sigma plus.minus j omega$ geeft in de tijd een term $e^(sigma t)$.
Het teken van het *reële deel* $sigma$ beslist alles: $sigma < 0$ dooft uit
(stabiel), $sigma > 0$ loopt op (instabiel). Het $s$-vlak vat dit samen:

#figure(
  cetz.canvas({
    import cetz.draw: *
    // assen
    line((-4, 0), (4, 0), mark: (end: ">"), name: "re")
    line((0, -2.6), (0, 2.6), mark: (end: ">"))
    content((4.25, 0), $sigma$)
    content((0, 2.9), $j omega$)
    // stabiel halfvlak (links) inkleuren
    rect((-3.8, -2.4), (0, 2.4), fill: rgb("d7ecd9"), stroke: none)
    rect((0, -2.4), (3.8, 2.4), fill: rgb("f8d7da"), stroke: none)
    // assen opnieuw bovenop
    line((-4, 0), (4, 0), mark: (end: ">"))
    line((0, -2.6), (0, 2.6), mark: (end: ">"))
    // labels gebieden
    content((-1.9, 2.05), text(fill: green.darken(20%), size: 9pt)[*stabiel* ($sigma<0$)])
    content((1.9, 2.05), text(fill: red.darken(10%), size: 9pt)[*instabiel* ($sigma>0$)])
    content((0, -2.95), text(size: 8pt, fill: gray)[imaginaire as = marginaal stabiel])
    // polen
    let pole(x, y, c) = {
      let r = 0.12
      line((x - r, y - r), (x + r, y + r), stroke: c + 1.5pt)
      line((x - r, y + r), (x + r, y - r), stroke: c + 1.5pt)
    }
    pole(-2.5, 1.2, green.darken(20%))
    pole(-2.5, -1.2, green.darken(20%))
    pole(2.2, 0.9, red.darken(10%))
    pole(2.2, -0.9, red.darken(10%))
    pole(0, 1.6, rgb("b8860b"))
    pole(0, -1.6, rgb("b8860b"))
  }),
  caption: [Het $s$-vlak: polen links = uitdovend (stabiel), rechts = oplopend (instabiel), op de as = blijvende oscillatie.],
) <fig:s-vlak>

Hoe verder een pool naar *rechts* schuift, hoe sneller de output *explodeert*;
hoe verder naar *links*, hoe sneller ze *uitdooft*:

#figure(
  cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (11, 5),
      x-label: $t " [s]"$,
      y-label: $y(t)$,
      x-tick-step: 1,
      y-tick-step: 1,
      y-min: -3,
      y-max: 4,
      x-min: 0,
      x-max: 5,
      legend: "inner-north-west",
      legend-style: (stroke: 0.5pt + gray, fill: white.transparentize(10%)),
      {
        // stabiel: negatieve pool, uitdovende oscillatie
        plot.add(
          domain: (0, 5),
          samples: 200,
          label: $sigma < 0$ + " (stabiel)",
          style: (stroke: green.darken(15%) + 2pt),
          x => (
            calc.exp(-0.7 * x) * calc.cos(4 * x)
          ),
        )
        // marginaal: pool op as, blijvende oscillatie
        plot.add(
          domain: (0, 5),
          samples: 200,
          label: $sigma = 0$ + " (marginaal)",
          style: (stroke: rgb("b8860b") + 2pt),
          x => (
            calc.cos(4 * x)
          ),
        )
        // instabiel: positieve pool, oplopende oscillatie
        plot.add(
          domain: (0, 5),
          samples: 200,
          label: $sigma > 0$ + " (instabiel)",
          style: (stroke: red.darken(10%) + 2pt),
          x => (
            calc.exp(0.6 * x) * calc.cos(4 * x)
          ),
        )
        plot.add-hline(0, style: (stroke: (paint: gray, thickness: 0.6pt)))
      },
    )
  }),
  caption: [Zelfde oscillatie, ander reëel deel $sigma$: stabiel dooft uit, marginaal blijft, instabiel loopt op (groter en groter).],
) <fig:stabiliteit-respons>

De twee standaardvormen die we in dit vak voortdurend gebruiken:

#table(
  columns: (1fr, 2fr, 2fr),
  inset: 0.5em,
  align: (left + horizon, center + horizon, center + horizon),
  stroke: 0.6pt + rgb("d9d9d9"),
  fill: (col, row) => if row == 0 { rgb("f2f2f2") } else { none },
  [*Orde*], [*Transferfunctie*], [*Parameters*],
  [Eerste orde], [$H(s) = frac(K_(d c), tau s + 1)$], [$K_(d c)$ = DC-versterking, $tau$ = tijdconstante],

  [Tweede orde],
  [$H(s) = frac(K_(d c) dot omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2)$],
  [$K_(d c)$ = DC-versterking, $omega_n$ = eigenfrequentie, $zeta$ = dempingsratio],
)

Bijna elk systeem dat we tegenkomen valt terug op één van deze twee vormen — of
een combinatie ervan. Daarom bekijken we ze nu apart: eerst het *eerste orde*
systeem (één pool, geen oscillatie), daarna het *tweede orde* systeem (twee
polen, mogelijk oscillerend). Telkens volgen we dezelfde route: van
differentiaalvergelijking $arrow.r$ transferfunctie $arrow.r$ standaardvorm
$arrow.r$ gedrag.

== Eerste orde transferfunctie <sec:eerste-orde>

=== Voorbeeld: bewegend wagentje

We bekijken een wagentje met massa $m$, aangedreven door een kracht $f(t)$ (input) en afgeremd door wrijving evenredig met de snelheid $v(t)$ (output). De wrijvingscoëfficiënt is $beta$.

#figure(
  image("assets/eerste-orde-wagentje.png", width: 45%),
  caption: [Eerste orde systeem: wagentje met wrijving],
) <fig:eerste-orde-wagentje>

=== Vergelijkingen

*Stap 1 — Differentiaalvergelijking (Newton).* De kracht $f(t)$ drijft aan, de wrijving $beta v(t)$ werkt tegen:
$ sum F = m a(t) = m v'(t) = underbrace(f(t) - beta v(t), "Som van de krachten") $
$ => f(t) - beta v(t) = m v'(t) $

*Stap 2 — Laplace-transformatie* (nul beginvoorwaarden, $v(0) = 0$). Elke term apart, met $v'(t) arrow.r s V(s)$:
$ F(s) - beta V(s) = m s V(s) $

*Stap 3 — Isoleer $V(s)$.* Breng alle termen met $V(s)$ samen:
$ F(s) = V(s)(m s + beta) quad arrow.r.double quad V(s) = frac(F(s), m s + beta) $

*Stap 4 — Transferfunctie:*
$ H(s) = frac(V(s), F(s)) = frac(1, m s + beta) $

=== Standaardvorm

Als we onze transferfunctie $H(s)$ dan eindelijk hebben moeten we de parameters van ons systeem dan evalueren en in de standaardvorm gieten. We hebben:
$ H(s) = frac(1, m s + beta) $

Om de standaardvorm $H(s) = frac(K_(d c), tau s + 1)$ te bekomen, delen we teller en noemer door $beta$ want nummer moet met + 1 eindigen:
$ frac(K_(d c), tau s + 1) quad arrow.l.r.double quad H(s) = frac(1 slash beta, (m slash beta) s + 1) $

We herkennen meteen:
$ K_(d c) = frac(1, beta) quad quad tau = frac(m, beta) $

met:
- $K_(d c) = H(0) = 1 slash beta$ --- DC-versterking [-]
- $tau = m slash beta$ --- tijdconstante [s]

De pool ligt bij $p = -beta slash m = -1 slash tau$. Hoe groter $beta slash m$, hoe sneller het systeem reageert (pool ligt verder van de oorsprong).

=== Staprespons en tijdconstante $tau$

Bij een stap-input ($F(s) = 1 slash s$) krijg je in het tijdsdomein een *gedempte exponentiële* naar de eindwaarde. De tijdconstante $tau$ bepaalt hoe snel:

#figure(
  cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (10, 5.5),
      x-label: $t " [s]"$,
      y-label: $v(t) slash v_infinity$,
      x-tick-step: 1,
      y-tick-step: 0.2,
      y-min: 0,
      y-max: 1.1,
      x-min: 0,
      x-max: 6,
      grid: true,
      legend: "inner-south-east",
      legend-style: (stroke: 0.5pt + gray, fill: white.transparentize(10%)),
      {
        // 63%- en 95%-referentielijnen
        plot.add-hline(0.63, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.8pt)))
        plot.add-hline(0.95, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.8pt)))
        // staprespons voor drie tijdconstanten
        plot.add(domain: (0, 6), samples: 200, label: $tau = 0.5$, style: (stroke: green.darken(10%) + 2pt), x => (
          1 - calc.exp(-x / 0.5)
        ))
        plot.add(domain: (0, 6), samples: 200, label: $tau = 1$, style: (stroke: blue + 2pt), x => 1 - calc.exp(-x / 1))
        plot.add(domain: (0, 6), samples: 200, label: $tau = 2$, style: (stroke: red + 2pt), x => 1 - calc.exp(-x / 2))
        // markeer (tau, 63%) voor tau = 1
        plot.add(
          ((1, 0.63),),
          style: (stroke: none),
          mark: "o",
          mark-style: (fill: blue, stroke: blue),
          mark-size: 0.18,
        )
        // labels bij de referentielijnen
        plot.annotate({
          content((5.4, 0.555), text(size: 8pt, fill: gray)[63% (na $tau$)])
          content((5.4, 1.01), text(size: 8pt, fill: gray)[95% (na $3 tau$)])
        })
      },
    )
  }),
  caption: [Staprespons eerste orde: na $tau$ is 63% bereikt, na $3 tau$ is 95% bereikt. Kleinere $tau$ = snellere respons.],
) <fig:stapresponsie-eerste-orde>

Vuistregel: na $tau$ seconden is *63%* van de eindwaarde bereikt, na $3 tau$ seconden *95%*.

=== Oefening

#oefening(title: "Voorbeeldoefening eerste orde")[
  #figure(
    image("assets/oefening-eerste-orde.png", width: 11cm),
    caption: [Voorbeeldoefening eerste orde systeem],
  ) <fig:oefening-eerste-orde>

  *Gegeven:* $6 z'(t) + 2 z(t) = 4 u(t) + 3$, evenwicht bij $z = 3$ op $t = 0$. De ingang $u(t)$ wordt plots met 1 verhoogd. \
  *Gevraagd:* de transferfunctie van de variatie en de respons.

  *Stap 1 — Evenwichtspunt.* In evenwicht is $z'(t) = 0$:
  $ 2 dot 3 = 4 u(0) + 3 quad arrow.r quad u(0) = frac(3, 4) $

  *Stap 2 — Variatie-vergelijking.* Met $Delta z = z - z(0)$ en $Delta u = u - u(0)$; trek de evenwichtsvergelijking af (constanten vallen weg):
  $ 6 Delta z'(t) + 2 Delta z(t) = 4 Delta u(t) $

  *Stap 3 — Laplace:*
  $ Z_Delta (s)(6 s + 2) = 4 U_Delta (s) $

  *Stap 4 — Transferfunctie:*
  $ H(s) = frac(Z_Delta (s), U_Delta (s)) = frac(4, 6 s + 2) = frac(2, 3 s + 1) $

  We herkennen de standaardvorm met $K_(d c) = 2$ en $tau = 3$.

  *Key insight:* werk altijd met *variaties* rond het evenwicht — de constante termen verdwijnen en je houdt een zuivere eerste orde transferfunctie over.
]

== Tweede orde transferfunctie <sec:tweede-orde>

Een tweede orde systeem heeft twee polen en kan dus oscillerend gedrag vertonen. De standaardvorm is:
$ H(s) = frac(K_(d c) dot omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2) $

=== Voorbeeld: massa-veer-demper

Een massa-veer-demper bestaat uit een massa $m$ verbonden met een veer (stijfheid $k$) en een demper (dempingscoëfficiënt $c$). De input is een kracht $u(t)$, de output de verplaatsing $z(t)$.

#figure(
  image("assets/massa-veer-demper.png", width: 40%),
  caption: [Massa-veer-demper systeem],
) <fig:massa-veer-demper>

De eigenfrequentie $omega_n$ en dempingsratio $zeta$ bepalen het gedrag van het systeem:
- $omega_n = sqrt(k / m)$ --- eigenfrequentie [rad/s]: *hoe snel* het systeem reageert.
- $zeta = c / (2 sqrt(k m))$ --- dempingsratio [-]: *hoeveel* het overschiet en oscilleert.

Twee onafhankelijke knoppen dus: $omega_n$ rekt de tijd-as uit of in (snelheid),
$zeta$ bepaalt de vorm (overshoot vs traag).

#figure(
  stack(
    dir: ltr,
    spacing: 0.6em,
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (5.4, 3.8),
        x-label: $t " [s]"$,
        y-label: $z(t)$,
        x-tick-step: 2,
        y-tick-step: 0.5,
        y-min: 0,
        y-max: 1.6,
        x-min: 0,
        x-max: 8,
        legend: "inner-south-east",
        legend-style: (stroke: 0.5pt + gray, fill: white.transparentize(10%)),
        {
          let resp(wn, x) = {
            let zeta = 0.4
            let wd = wn * calc.sqrt(1 - zeta * zeta)
            1 - calc.exp(-zeta * wn * x) * (calc.cos(wd * x) + zeta / calc.sqrt(1 - zeta * zeta) * calc.sin(wd * x))
          }
          plot.add(domain: (0, 8), samples: 250, label: $omega_n = 0.5$, style: (stroke: blue + 1.5pt), x => resp(
            0.5,
            x,
          ))
          plot.add(
            domain: (0, 8),
            samples: 250,
            label: $omega_n = 1$,
            style: (stroke: green.darken(10%) + 1.5pt),
            x => resp(1, x),
          )
          plot.add(domain: (0, 8), samples: 250, label: $omega_n = 2$, style: (stroke: red + 1.5pt), x => resp(2, x))
          plot.add-hline(1.0, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.7pt)))
        },
      )
    }),
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (5.4, 3.8),
        x-label: $t " [s]"$,
        y-label: $z(t)$,
        x-tick-step: 2,
        y-tick-step: 0.5,
        y-min: 0,
        y-max: 1.8,
        x-min: 0,
        x-max: 12,
        legend: "inner-south-east",
        legend-style: (stroke: 0.5pt + gray, fill: white.transparentize(10%)),
        {
          let under(zeta, x) = {
            let wd = calc.sqrt(1 - zeta * zeta)
            1 - calc.exp(-zeta * x) * (calc.cos(wd * x) + zeta / wd * calc.sin(wd * x))
          }
          let over(zeta, x) = {
            let s1 = -zeta + calc.sqrt(zeta * zeta - 1)
            let s2 = -zeta - calc.sqrt(zeta * zeta - 1)
            1 + (s1 * calc.exp(s2 * x) - s2 * calc.exp(s1 * x)) / (s2 - s1)
          }
          plot.add(domain: (0, 12), samples: 300, label: $zeta = 0.2$, style: (stroke: blue + 1.5pt), x => under(
            0.2,
            x,
          ))
          plot.add(
            domain: (0, 12),
            samples: 300,
            label: $zeta = 0.7$,
            style: (stroke: green.darken(10%) + 1.5pt),
            x => under(0.7, x),
          )
          plot.add(domain: (0, 12), samples: 300, label: $zeta = 2.0$, style: (stroke: red + 1.5pt), x => over(2.0, x))
          plot.add-hline(1.0, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.7pt)))
        },
      )
    }),
  ),
  caption: [*Links:* grotere $omega_n$ $arrow.r$ snellere respons (zelfde vorm, $zeta = 0.4$). *Rechts:* kleinere $zeta$ $arrow.r$ meer overshoot en oscillatie ($omega_n = 1$).],
) <fig:omega-zeta-effect>


=== Vergelijkingen

*Stap 1 — Differentiaalvergelijking (Newton).* Som van de krachten op de massa:
$ sum F = m a(t) = m x''(t) = underbrace(u(t) - c x'(t) - k x(t), "Som van de krachten") $
$ m dv(z, t, 2) + c dv(z, t) + k z(t) = u(t) $

*Stap 2 — Laplace $cal(L)$* (nul beginvoorwaarden), met $z''(t) arrow.r s^2 Z(s)$ en $z'(t) arrow.r s Z(s)$:
$ m s^2 Z(s) + c s Z(s) + k Z(s) = U(s) $

*Stap 3 — Isoleer $Z(s)$:*
$ Z(s)(m s^2 + c s + k) = U(s) quad arrow.r.double quad Z(s) = frac(U(s), m s^2 + c s + k) $

*Stap 4 — Transferfunctie:*
$ H(s) = frac(Z(s), U(s)) = frac(1, m s^2 + c s + k) $

=== Standaardvorm

Deel teller en noemer door $m$ en vergelijk met de standaardvorm:
$
  H(s) = frac(1 slash m, s^2 + (c slash m) s + k slash m) quad arrow.l.r.double quad frac(K_(d c) dot omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2)
$

Hieruit lezen we de parameters af:
$ omega_n = sqrt(k / m) quad quad zeta = frac(c, 2 sqrt(k m)) $

met:
- $omega_n$ --- eigenfrequentie [rad/s]
- $zeta$ --- dempingsratio [-]
- $K_(d c) = 1 slash k$ --- DC-versterking [m/N]

=== Pool-nulpunt kaart

De polen volgen uit de noemer $s^2 + 2 zeta omega_n s + omega_n^2 = 0$:
$ p_(1,2) = -zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1) $

Het teken van $(zeta^2 - 1)$ bepaalt het type polen, en dus het gedrag:
- $zeta > 1$ $arrow.r$ twee reële polen — *overgedempt*
- $zeta = 1$ $arrow.r$ dubbele reële pool — *kritisch gedempt*
- $0 < zeta < 1$ $arrow.r$ twee complexe polen — *ondergedempt* (oscillatie)
- $zeta = 0$ $arrow.r$ zuiver imaginaire polen — *marginaal stabiel*
- $zeta < 0$ $arrow.r$ *instabiel*

Wat betekenen die drie stabiele gevallen concreet? Denk aan een deur met een
dranger:

/ Ondergedempt ($0 < zeta < 1$): Te weinig demping. Het systeem *schiet voorbij*
  de eindwaarde en *oscilleert* er een paar keer rond voor het tot rust komt
  (zoals een deur die doorslaat en heen en weer klappert). De polen zijn complex:
  $p = -zeta omega_n plus.minus j omega_n sqrt(1 - zeta^2)$. Het *reële deel*
  $-zeta omega_n$ zorgt voor de uitdoving, het *imaginaire deel* voor de
  oscillatie. Snel, maar met *overshoot*.

/ Kritisch gedempt ($zeta = 1$): De *grens*. Het systeem bereikt de eindwaarde
  zo *snel mogelijk zonder* over te schieten of te oscilleren. Eén dubbele reële
  pool $p = -omega_n$. Dit is vaak het ideale compromis: maximale snelheid,
  geen overshoot.

/ Overgedempt ($zeta > 1$): Te véél demping. Het systeem kruipt *traag* naar de
  eindwaarde, zonder overshoot (zoals een deur met een te strakke dranger die
  loom dichtgaat). Twee reële polen die ver uit elkaar liggen; de *traagste*
  (dichtst bij de oorsprong) domineert. Veilig, maar sloom.

De twee uitersten zijn $zeta = 0$ (*marginaal stabiel*: blijvende oscillatie,
geen demping) en $zeta < 0$ (*instabiel*: de oscillatie loopt op). Hoe kleiner
$zeta$, hoe meer overshoot; hoe groter $zeta$, hoe trager. Onderstaande grafiek
toont dit voor enkele waarden:

#figure(
  cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (8, 4),
      x-label: $omega_n t$,
      y-label: $y(t)$,
      x-tick-step: 2,
      y-tick-step: 0.5,
      y-min: 0,
      y-max: 2.0,
      x-min: 0,
      x-max: 15,
      {
        plot.add(domain: (0, 15), samples: 300, label: $zeta = 0.2$, style: (stroke: blue + 1.5pt), x => {
          let zeta = 0.2
          let wd = calc.sqrt(1 - calc.pow(zeta, 2))
          1 - calc.exp(-zeta * x) * (calc.cos(wd * x) + zeta / wd * calc.sin(wd * x))
        })
        plot.add(domain: (0, 15), samples: 300, label: $zeta = 0.5$, style: (stroke: green + 1.5pt), x => {
          let zeta = 0.5
          let wd = calc.sqrt(1 - calc.pow(zeta, 2))
          1 - calc.exp(-zeta * x) * (calc.cos(wd * x) + zeta / wd * calc.sin(wd * x))
        })
        plot.add(domain: (0, 15), samples: 300, label: $zeta = 1.0$, style: (stroke: red + 1.5pt), x => (
          1 - (1 + x) * calc.exp(-x)
        ))
        plot.add(domain: (0, 15), samples: 300, label: $zeta = 2.0$, style: (stroke: orange + 1.5pt), x => {
          let zeta = 2.0
          let s1 = -zeta + calc.sqrt(calc.pow(zeta, 2) - 1)
          let s2 = -zeta - calc.sqrt(calc.pow(zeta, 2) - 1)
          1 + (s1 * calc.exp(s2 * x) - s2 * calc.exp(s1 * x)) / (s2 - s1)
        })
        plot.add-hline(1.0, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.8pt)))
      },
    )
  }),
  caption: [Staprespons tweede orde voor verschillende dempingsratio's $zeta$],
) <fig:stapresponsie-tweede-orde>

#figure(
  image("assets/pool-nulpunten-kaart.png", width: 80%),
  caption: [Pool-nulpunten kaart voor een tweede orde systeem],
) <fig:pool-nulpunten-kaart>

=== Oefening

#oefening(title: "Oefening tweede orde — massa-veer-demper")[
  *Gegeven:* $m = 1 "kg"$, $k = 1 "N/m"$. Bepaal de transferfunctie en het type demping voor (a) $c = 4$, (b) $c = 2$, (c) $c = 1$ Ns/m.

  Met $m = 1$, $k = 1$: $H(s) = frac(1, s^2 + c s + 1)$ en $omega_n = sqrt(k slash m) = 1$ rad/s.

  *a) $c = 4$:* $zeta = frac(c, 2 sqrt(k m)) = frac(4, 2) = 2 > 1$ $arrow.r$ *overgedempt*. Polen $approx -0.27, -3.73$.

  *b) $c = 2$:* $zeta = frac(2, 2) = 1$ $arrow.r$ *kritisch gedempt*. Dubbele pool $p = -1$.

  *c) $c = 1$:* $zeta = frac(1, 2) = 0.5$ $arrow.r$ *ondergedempt*. Polen $-0.5 plus.minus 0.87 j$.

  *Key insight:* dezelfde $omega_n$, maar $zeta$ (via de demper $c$) bepaalt of de respons oscilleert of niet.
]
