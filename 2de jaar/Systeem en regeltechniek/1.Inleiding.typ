#import "../../school-template.typ": *

// ============================================================================
//  W2 — Inleiding, systemen en transferfuncties
//  Slides: 1.SYSCON_slides_01 (Sessie 0: vakinfo + Sessie 1)
//  Grotendeels herhaling van MathSYS: eerste en tweede orde systemen met
//  hun standaardvormen. Inhoud deels hergebruikt uit _OLD/1.Inleiding.typ
// ============================================================================

= Inleiding, systemen en transferfuncties <ch:inleiding>

== Vak- en exameninfo <sec:vakinfo>

#let fig-uurrooster = image("assets/Uurrooster.png", width: 7cm)
#let boxed-uurrooster = box(fig-uurrooster, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-uurrooster)[
  Dit vak is een voortzetting van *MathSYS*: alles rond systemen, Laplace,
  transferfuncties, polen en nullen wordt als gekend verondersteld. Deze eerste
  les is dan ook vooral *herhaling* — we frissen eerste en tweede orde systemen
  op samen met hun standaardvormen, want die vormen de basis voor de rest.

  De rode draad van het vak: hoe *controleer* je een systeem (bv. een drone)?
  Een systeem krijgt inputs en moet gewenste outputs leveren. Bij een drone
  meet je via sensoren versnelling, snelheid, positie en oriëntatie, en geef je
  op basis daarvan de juiste inputs aan de motoren zodat ze stabiel blijft.
]

*Examen.* Twee delen:
- *Geschreven deel (80%)* — focus op oefeningen.
- *Mondeling deel (20%)* — verdediging van een taak (rond de paasvakantie) over een systeem waarvoor je code schrijft. Je moet het systeem _on the fly_ kunnen aanpassen en uitleggen *wat* je doet en *waarom*.

Je mag de code maken met *AI of code van anderen*, maar je moet ze volledig *kunnen uitleggen*. Studiemateriaal: *slides, notities van de prof, videolessen en oefeningen* — er is geen boek _maar ja daar is deze samenvattingen voor_.

== Feedback control: het einddoel <sec:feedback-doel>

Het einddoel van dit vak: snappen wat een *feedback control systeem* is, kunnen bepalen of het *stabiel* is, en zo'n systeem zelf kunnen *opstellen*.

#figure(
  image("assets/feedback-systeem.png", width: 60%),
  caption: [Feedback regelsysteem — het einddoel van dit vak],
) <fig:feedback-systeem>

Bij een temperatuurregeling vergelijkt een controller de gemeten temperatuur met de gewenste (referentie) temperatuur en stuurt op basis van dat verschil de verwarming aan. Door de *constante terugkoppeling* van de gemeten temperatuur kan het systeem zichzelf bijregelen.

== Systeemanalyse: tijds- vs frequentiedomein <sec:systeemanalyse>

#figure(
  image("assets/systeemanalyse-overzicht.png", width: 11cm),
  caption: [Overzicht systeemanalyse: tijdsdomein vs frequentiedomein],
) <fig:systeemanalyse>

Een systeem kan je op twee manieren beschrijven:
- In het *tijdsdomein* met een *differentiaalvergelijking*. De oplossing met een delta-input (zero-state) is de *impulsresponsie* $h(t)$.
- In het *frequentiedomein* met de *transferfunctie* $H(s)$ via de Laplace-transformatie (of $H(j omega)$ via Fourier).

#let fig-laplace = image("assets/laplace-transformatie.png", width: 8cm)
#let boxed-laplace = box(fig-laplace, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-laplace)[
  De brug tussen beide: impulsresponsie $h(t)$ $arrow.r$ transferfunctie $H(s)$
  $arrow.r$ polen en nullen (zie MathSYS).

  Je *modelleert* systemen in de tijd met differentiaalvergelijkingen, je
  *analyseert* ze in het frequentiedomein via Laplace, je *ontwerpt* ze met
  regeltechniek en je *implementeert* ze met code.
]

== Transferfunctie, polen en nullen <sec:transferfunctie>

Een systeem in evenwicht voor $t = 0$ heeft een constante input $f(0)$ en output $v(0)$. We werken met de *variaties* rond dat evenwicht:
$ Delta f(t) = f(t) - f(0) arrow.r F(s) quad quad Delta v(t) = v(t) - v(0) arrow.r V(s) $

De *transferfunctie* is de verhouding van de Laplace-getransformeerde output op input:
$ T(s) = H(s) = frac(V(s), F(s)) $

met:
- $H(s)$ --- transferfunctie [-]
- $F(s)$ --- Laplace van de input­variatie
- $V(s)$ --- Laplace van de output­variatie

=== DC-gain, polen en nullen

Een transferfunctie is een rationale functie in $s$. Geschreven met de wortels van teller en noemer:
$ H(s) = K dot frac((s - z_1)(s - z_2) dots.h, (s - p_1)(s - p_2) dots.h) $

met:
- $K$ --- versterkingsfactor [-]
- $z_i$ --- *nullen*: $s arrow.r z_i arrow.r.double H(s) arrow.r 0$
- $p_i$ --- *polen*: $s arrow.r p_i arrow.r.double H(s) arrow.r infinity$

#let fig-dcgain = image("assets/dc-gain-polen-nullen.png", width: 8cm)
#let boxed-dcgain = box(fig-dcgain, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-dcgain)[
  De *DC-versterking* is de waarde van de transferfunctie bij $s = 0$:
  $ K_(d c) = H(0) $
  Ze bepaalt hoe sterk het systeem reageert op een *constante* input. Groot
  $K_(d c)$ $arrow.r$ grote output bij kleine constante input; klein $K_(d c)$
  $arrow.r$ kleine output.

  De *polen* (uit de noemer) bepalen de stabiliteit en het dynamisch gedrag:
  - polen in het *linkse* halfvlak $arrow.r$ *stabiel*;
  - polen in het *rechtse* halfvlak $arrow.r$ *instabiel*;
  - polen op de imaginaire as $arrow.r$ *marginaal stabiel*.
]

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

== Eerste orde transferfunctie <sec:eerste-orde>

=== Voorbeeld: bewegend wagentje

We bekijken een wagentje met massa $m$, aangedreven door een kracht $f(t)$ (input) en afgeremd door wrijving evenredig met de snelheid $v(t)$ (output). De wrijvingscoëfficiënt is $beta$.

#figure(
  image("assets/eerste-orde-wagentje.png", width: 45%),
  caption: [Eerste orde systeem: wagentje met wrijving],
) <fig:eerste-orde-wagentje>

=== Vergelijkingen

*Stap 1 — Differentiaalvergelijking (Newton).* De kracht $f(t)$ drijft aan, de wrijving $beta v(t)$ werkt tegen:
$ f(t) - beta v(t) = m v'(t) $

*Stap 2 — Laplace-transformatie* (nul beginvoorwaarden, $v(0) = 0$). Elke term apart, met $v'(t) arrow.r s V(s)$:
$ F(s) - beta V(s) = m s V(s) $

*Stap 3 — Isoleer $V(s)$.* Breng alle termen met $V(s)$ samen:
$ F(s) = V(s)(m s + beta) quad arrow.r.double quad V(s) = frac(F(s), m s + beta) $

*Stap 4 — Transferfunctie:*
$ H(s) = frac(V(s), F(s)) = frac(1, m s + beta) $

=== Standaardvorm

Om de standaardvorm $H(s) = frac(K_(d c), tau s + 1)$ te bekomen, delen we teller en noemer door $beta$:
$ frac(K_(d c), tau s + 1) quad arrow.l.r.double quad H(s) = frac(1 slash beta, (m slash beta) s + 1) $

We herkennen meteen:
$ K_(d c) = frac(1, beta) quad quad tau = frac(m, beta) $

met:
- $K_(d c) = H(0) = 1 slash beta$ --- DC-versterking [-]
- $tau = m slash beta$ --- tijdconstante [s]

De pool ligt bij $p = -beta slash m = -1 slash tau$. Hoe groter $beta slash m$, hoe sneller het systeem reageert (pool ligt verder van de oorsprong).

=== Staprespons

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
  $ T_(p u)(s) = frac(Z_Delta (s), U_Delta (s)) = frac(4, 6 s + 2) = frac(2, 3 s + 1) $

  We herkennen de standaardvorm met $K_(d c) = 2$ en $tau = 3$.

  *Key insight:* werk altijd met *variaties* rond het evenwicht — de constante termen verdwijnen en je houdt een zuivere eerste orde transferfunctie over.
]

== Tweede orde transferfunctie <sec:tweede-orde>

=== Voorbeeld: massa-veer-demper

Een massa-veer-demper bestaat uit een massa $m$ verbonden met een veer (stijfheid $k$) en een demper (dempingscoëfficiënt $c$). De input is een kracht $u(t)$, de output de verplaatsing $z(t)$.

#figure(
  image("assets/massa-veer-demper.png", width: 40%),
  caption: [Massa-veer-demper systeem],
) <fig:massa-veer-demper>

=== Vergelijkingen

*Stap 1 — Differentiaalvergelijking (Newton).* Som van de krachten op de massa:
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
  H(s) = frac(1 slash m, s^2 + (c slash m) s + k slash m) quad "vs." quad frac(K_(d c) dot omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2)
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
  image("assets/pool-nulpunten-kaart.png", width: 60%),
  caption: [Pool-nulpunten kaart voor een tweede orde systeem],
) <fig:pool-nulpunten-kaart>

#oefening(title: "Oefening tweede orde — massa-veer-demper")[
  *Gegeven:* $m = 1 "kg"$, $k = 1 "N/m"$. Bepaal de transferfunctie en het type demping voor (a) $c = 4$, (b) $c = 2$, (c) $c = 1$ Ns/m.

  Met $m = 1$, $k = 1$: $H(s) = frac(1, s^2 + c s + 1)$ en $omega_n = sqrt(k slash m) = 1$ rad/s.

  *a) $c = 4$:* $zeta = frac(4, 2) = 2 > 1$ $arrow.r$ *overgedempt*. Polen $approx -0.27, -3.73$.

  *b) $c = 2$:* $zeta = frac(2, 2) = 1$ $arrow.r$ *kritisch gedempt*. Dubbele pool $p = -1$.

  *c) $c = 1$:* $zeta = frac(1, 2) = 0.5$ $arrow.r$ *ondergedempt*. Polen $-0.5 plus.minus 0.87 j$.

  *Key insight:* dezelfde $omega_n$, maar $zeta$ (via de demper $c$) bepaalt of de respons oscilleert of niet.
]
