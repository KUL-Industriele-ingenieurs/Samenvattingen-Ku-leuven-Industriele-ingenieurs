#import "../../school-template.typ": *

= Inleiding <ch:inleiding>

== Info vak

#let fig-uurrooster = image("Uurrooster.png", width: 6cm)
#let boxed-uurrooster = box(fig-uurrooster, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-uurrooster)[
  Dit vak is een voortzetting van MathSYS.
  Alles rond systemen moet je dus al kennen.

  Dit vak gaat over systemen. Hoe kun je dingen controlleren
  zoals drones.

  Je systeem krijgt dus inputs en moeten dan gewenste outputs geven.
  Bij een drone moet je afhankelijk van sensoren die de versnelling, snelheid, positie, draaing en yaw meten, de juiste inputs geven aan de motoren zodat je drone stabiel blijft en doet wat je wilt.
]

== Exameninfo
Je hebt twee delen
- *Geschreven deel*
- *Oral deel*: Je krijgt een taak over systemen waar je code gaat moeten schrijven en uitleggen. Je moet ook het systeem on the fly kunnen aanpassen. Je moet ook kunnen uitleggen wat je doet en waarom.

Je mag de code maken met AI of code van anderen gebruiken, maar je moet wel kunnen uitleggen wat je code doet en waarom je het zo hebt gedaan.

Je hebt *Slides, Notities Prof, Videolessen, Oefeningen* als studiemateriaal.
Je hebt geen boek.

Het einddoel. Dit is een voorbeeld van een Feedback systeem.
Dit is het einddoel van dit vak.

#figure(
  image("feedback-systeem.png", width: 50%),
  caption: [Feedback regelsysteem — het einddoel van dit vak],
) <fig:feedback-systeem>

Er is dus constante feedback van de temperatuur waardoor het systeem geregeld kan worden.

#figure(
  image("systeemanalyse-overzicht.png", width: 6cm),
  caption: [Overzicht systeemanalyse],
) <fig:systeemanalyse>

Je maakt systemen in de tijd met differentiële vergelijkingen. Je analyseert systemen met Laplace transformaties.

#let fig-laplace = image("laplace-transformatie.png", width: 5cm)
#let boxed-laplace = box(fig-laplace, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-laplace)[
  Impulsresponsie $delta$ $arrow.r$ Transferfunctie $H(s)$ $arrow.r$ Polen en nullen (zie MathSYS).

  Je ontwerpt systemen met regeltechniek. Je implementeert systemen met code.
]

#let fig-dcgain = image("dc-gain-polen-nullen.png", width: 9cm)
#let boxed-dcgain = box(fig-dcgain, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-dcgain)[
  De polen bepalen de stabiliteit van het systeem. Je wilt dat alle polen in het linkse deel van het complexe vlak liggen. Je wilt ook dat ze ver van de imaginaire as liggen zodat je systeem snel reageert.

  De nullen bepalen de versterking van het systeem. Je wilt dat ze ver van de imaginaire as liggen zodat je systeem niet te veel versterkt.

  De $K$ is niet de DC-versterking.
]

= Systemen

== Eerste orde systemen

#oefening(title: "Eerste orde systemen — Wagentje")[

  #figure(
    image("eerste-orde-wagentje.png", width: 50%),
    caption: [Eerste orde systeem: wagentje met wrijving],
  ) <fig:eerste-orde-wagentje>

  *Stap 1 — Differentiaalvergelijking opstellen:*

  De kracht $f(t)$ drijft het wagentje aan, terwijl de wrijving $beta v(t)$ tegenwerkt. Volgens Newton:
  $ f(t) - beta v(t) = m v'(t) $

  *Stap 2 — Laplace transformatie* (met nul beginvoorwaarden $v(0) = 0$):

  Elke term apart transformeren: $v'(t) arrow.r s V(s)$, dus:
  $ F(s) - beta V(s) = m s V(s) $

  *Stap 3 — Isoleer $V(s)$:*

  Breng alle termen met $V(s)$ naar één kant:
  $ F(s) = m s V(s) + beta V(s) = V(s) (m s + beta) $
  $ arrow.r.double V(s) = frac(F(s), m s + beta) $

  *Stap 4 — Transferfunctie afleiden:*

  Deel teller en noemer door $m$ om de standaardvorm te bekomen:
  Net zoals bij MATHSYS.
  $ H(s) = Y(s)/X(s) $
  $ arrow.r.double H(s) = frac(V(s), F(s)) = frac(1, m s + beta) = frac(1 slash m, s + beta slash m) $

  We herkennen de standaardvorm van een eerste orde systeem $H(s) = frac(K_(d c), tau s + 1)$ met:
  $ K_(d c) = frac(1, beta) quad quad tau = frac(m, beta) $

  *Stap 5 — Systeemeigenschappen bepalen:*

  DC-versterking (vul $s = 0$ in):
  $ H(0) = frac(1, beta) = K_(d c) $

  De pool ligt bij:
  $ p = -frac(beta, m) = -frac(1, tau) $

  Hoe groter $beta slash m$, hoe sneller het systeem reageert (pool verder van de oorsprong).

  // ── CeTZ plot: first-order step response ──
  #figure(
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (8, 4),
        x-label: $t$,
        y-label: $v(t) slash v_(infinity)$,
        x-tick-step: 1,
        y-tick-step: 0.2,
        y-min: 0, y-max: 1.1,
        x-min: 0, x-max: 6,
        {
          // tau = 1
          plot.add(
            domain: (0, 6), samples: 200,
            label: $tau = 1$,
            style: (stroke: blue + 1.5pt),
            x => 1 - calc.exp(-x / 1),
          )
          // tau = 2
          plot.add(
            domain: (0, 6), samples: 200,
            label: $tau = 2$,
            style: (stroke: red + 1.5pt),
            x => 1 - calc.exp(-x / 2),
          )
          // tau = 0.5
          plot.add(
            domain: (0, 6), samples: 200,
            label: $tau = 0.5$,
            style: (stroke: green + 1.5pt),
            x => 1 - calc.exp(-x / 0.5),
          )
          // 63% lijn
          plot.add-hline(0.63, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.8pt)))
          // 95% lijn
          plot.add-hline(0.95, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.8pt)))
        },
      )
    }),
    caption: [Stapresponsie eerste orde systeem: na $tau$ is 63% bereikt, na $3tau$ is 95% bereikt],
  ) <fig:stapresponsie-eerste-orde>

  Na $tau = m/beta$ seconden is 63% van de eindwaarde bereikt. \
  Na $3 tau$ seconden is 95% van de eindwaarde bereikt.
]

#oefening(title: "Voorbeeldoefening eerste orde")[
  #figure(
    image("oefening-eerste-orde.png", width: 12cm),
    caption: [Voorbeeldoefening eerste orde systeem],
  ) <fig:oefening-eerste-orde>
    *Gegeven:* $6 z'(t) + 2 z(t) = 4 u(t) + 3$, evenwicht bij $z = 3$ en $t = 0$. De ingang $u(t)$ wordt plots met 1 verhoogd.

    *Gevraagd:* Vind de transferfunctie van de variatie en de respons.

  *Stap 1 — Evenwichtspunt bepalen:*

  In evenwicht geldt $z'(t) = 0$, dus:
  $ 6 dot 0 + 2 z(0) = 4 u(0) + 3 $
  $ 2 dot 3 = 4 u(0) + 3 quad arrow.r quad u(0) = frac(3, 4) $

  *Stap 2 — Variatie-vergelijking opstellen:*

  Definieer de variaties: $Delta z(t) = z(t) - z(0)$ en $Delta u(t) = u(t) - u(0)$. Trek de evenwichtsvergelijking af:
  $ 6 Delta z'(t) + 2 Delta z(t) = 4 Delta u(t) $

  De constanten vallen weg (ze veranderen niet).

  *Stap 3 — Laplace transformatie:*
  $ 6 s Z_Delta (s) + 2 Z_Delta (s) = 4 U_Delta (s) $
  $ Z_Delta (s) (6 s + 2) = 4 U_Delta (s) $

  *Stap 4 — Transferfunctie:*
  $ T_(p u)(s) = frac(Z_Delta (s), U_Delta (s)) = frac(4, 6 s + 2) = frac(2, 3 s + 1) $

  We herkennen de standaardvorm met:
  $ K_(d c) = frac(4, 2) = 2 quad quad tau = frac(6, 2) = 3 $
]

== Tweede orde systemen

#let fig-mvd = image("massa-veer-demper.png", width: 4cm)
#let boxed-mvd = box(fig-mvd, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed-mvd)[
  Een massa-veer-demper systeem bestaat uit een massa $m$ verbonden met een veer (stijfheid $k$) en een demper (dempingscoëfficiënt $c$). De ingang is een kracht $u(t)$, de uitgang is de verplaatsing $z(t)$.
]

*Stap 1 — Differentiaalvergelijking opstellen:*

Som van krachten op de massa (Newton): veerkracht + dempingskracht + externe kracht:
$ m dv(z, t, 2) + c dv(z, t) + k z(t) = u(t) $

*Stap 2 — Laplace transformatie* (met nul beginvoorwaarden):

Elke afgeleide transformeren: $z''(t) arrow.r s^2 Z(s)$, $z'(t) arrow.r s Z(s)$:
$ m s^2 Z(s) + c s Z(s) + k Z(s) = U(s) $

*Stap 3 — Isoleer $Z(s)$:*

Neem $Z(s)$ gemeenschappelijk:
$ Z(s) (m s^2 + c s + k) = U(s) $
$ arrow.r.double Z(s) = frac(U(s), m s^2 + c s + k) $

*Stap 4 — Transferfunctie:*
$ H(s) = frac(Z(s), U(s)) = frac(1, m s^2 + c s + k) $

We nemen aan dat alles stabiel is (alle polen liggen in het linkse halfvlak).

*Stap 5 — Standaardvorm identificeren:*

Deel teller en noemer door $m$ en vergelijk met de standaardvorm:
$ H(s) = frac(1 slash m, s^2 + c/m s + k/m) quad "vergelijk met" quad frac(K_(d c) dot omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2) $

Hieruit lezen we de parameters af:
$ omega_n = sqrt(k / m) quad quad 2 zeta omega_n = frac(c, m) quad arrow.r quad zeta = frac(c, 2 sqrt(k m)) $

*Stap 6 — Polen berekenen:*

De polen vinden we via de abc-formule op de noemer $s^2 + 2 zeta omega_n s + omega_n^2 = 0$:
$ D = (2 zeta omega_n)^2 - 4 omega_n^2 = 4 omega_n^2 (zeta^2 - 1) $
$ arrow.r.double p_(1,2) = frac(-2 zeta omega_n plus.minus sqrt(D), 2) = -zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1) $

Het teken van $(zeta^2 - 1)$ bepaalt het type polen:

*Classificatie op basis van $zeta$:*
- $zeta > 1 arrow.r$ reële polen (overgedempt)
- $zeta = 1 arrow.r$ één dubbele reële pool (kritisch gedempt)
- $0 < zeta < 1 arrow.r$ twee complexe polen (ondergedempt)
- $zeta = 0 arrow.r$ zuiver imaginaire polen (randstabiel)
- $zeta < 0 arrow.r$ instabiel systeem

// ── CeTZ plot: second-order step response for different zeta ──
#figure(
  cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (8, 4),
      x-label: $omega_n t$,
      y-label: $y(t)$,
      x-tick-step: 2,
      y-tick-step: 0.5,
      y-min: 0, y-max: 2.0,
      x-min: 0, x-max: 15,
      {
        // zeta = 0.2 (underdamped)
        plot.add(
          domain: (0, 15), samples: 300,
          label: $zeta = 0.2$,
          style: (stroke: blue + 1.5pt),
          x => {
            let zeta = 0.2
            let wd = calc.sqrt(1 - calc.pow(zeta, 2))
            1 - calc.exp(-zeta * x) * (calc.cos(wd * x) + zeta / wd * calc.sin(wd * x))
          },
        )
        // zeta = 0.5 (underdamped)
        plot.add(
          domain: (0, 15), samples: 300,
          label: $zeta = 0.5$,
          style: (stroke: green + 1.5pt),
          x => {
            let zeta = 0.5
            let wd = calc.sqrt(1 - calc.pow(zeta, 2))
            1 - calc.exp(-zeta * x) * (calc.cos(wd * x) + zeta / wd * calc.sin(wd * x))
          },
        )
        // zeta = 1.0 (critically damped)
        plot.add(
          domain: (0, 15), samples: 300,
          label: $zeta = 1.0$,
          style: (stroke: red + 1.5pt),
          x => 1 - (1 + x) * calc.exp(-x),
        )
        // zeta = 2.0 (overdamped)
        plot.add(
          domain: (0, 15), samples: 300,
          label: $zeta = 2.0$,
          style: (stroke: orange + 1.5pt),
          x => {
            let zeta = 2.0
            let s1 = -zeta + calc.sqrt(calc.pow(zeta, 2) - 1)
            let s2 = -zeta - calc.sqrt(calc.pow(zeta, 2) - 1)
            1 + (s1 * calc.exp(s2 * x) - s2 * calc.exp(s1 * x)) / (s2 - s1)
          },
        )
        // Steady-state lijn
        plot.add-hline(1.0, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.8pt)))
      },
    )
  }),
  caption: [Stapresponsie tweede orde systeem voor verschillende dempingsverhoudingen $zeta$],
) <fig:stapresponsie-tweede-orde>

#figure(
  image("pool-nulpunten-kaart.png", width: 60%),
  caption: [Pool-nulpunten kaart voor tweede orde systeem],
) <fig:pool-nulpunten-kaart>

Dus de formule kan omgezet worden naar:
$ H(s) = frac(K_(d c) dot omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2) $

met:
$ omega_n = sqrt(k / m) quad quad zeta omega_n = frac(c, m) quad quad zeta = frac(c, 2 sqrt(k m)) $

#oefening(title: "Oefening tweede orde systeem")[
  #let fig-oef2 = image("oefening-tweede-orde.png", width: 7cm)
  #let boxed-oef2 = box(fig-oef2, inset: (right: 0.5em, bottom: 0.5em))

  #wrap-content(boxed-oef2)[
    *Gegeven:* $m = 1 "kg"$, $k = 1 "N/m"$. Vind de transferfunctie en plot de stapresponsie voor:
    - a) $c = 4 "Ns/m"$
    - b) $c = 2 "Ns/m"$
    - c) $c = 1 "Ns/m"$
  ]

  *Stap 1 — Transferfunctie:*

  Met $m = 1$ en $k = 1$:
  $ H(s) = frac(1, s^2 + c s + 1) $

  *Stap 2 — Standaardparameters:*
  $ omega_n = sqrt(k / m) = sqrt(1) = 1 "rad/s" $

  *a) $c = 4$ Ns/m:*
  $ zeta = frac(c, 2 sqrt(k m)) = frac(4, 2) = 2 quad arrow.r quad "overgedempt" (zeta > 1) $
  $ H(s) = frac(1, s^2 + 4 s + 1) $
  Polen: $p_(1,2) = -2 plus.minus sqrt(3) approx -0.27, -3.73$

  *b) $c = 2$ Ns/m:*
  $ zeta = frac(2, 2) = 1 quad arrow.r quad "kritisch gedempt" (zeta = 1) $
  $ H(s) = frac(1, s^2 + 2 s + 1) = frac(1, (s + 1)^2) $
  Dubbele pool: $p = -1$

  *c) $c = 1$ Ns/m:*
  $ zeta = frac(1, 2) = 0.5 quad arrow.r quad "ondergedempt" (0 < zeta < 1) $
  $ H(s) = frac(1, s^2 + s + 1) $
  Polen: $p_(1,2) = -0.5 plus.minus j frac(sqrt(3), 2) approx -0.5 plus.minus 0.87 j$
]
