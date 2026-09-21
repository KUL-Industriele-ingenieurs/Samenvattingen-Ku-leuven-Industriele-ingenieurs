#import "../../school-template.typ": *

// ============================================================================
//  W7 (CON) — Feedback en P-control: statische analyse
//  Slides: 6.SYSCON_slides_session6_NL_Pcontrol_2 (slides 5-24)
// ============================================================================

= Feedback en P-control: statische analyse <ch:feedback-p-control>


== Waarom $K_c$ niet oneindig groot mag <sec:limieten>

We hebben nu geleerd over onze processen en hoe we die regelen met een
P-regelaar:

$ u(t) = K_c dot epsilon(t) + b, quad epsilon(t) = r(t) - z(t) $ <eq:p-controller>

met:
- $u(t)$ --- stuuractie naar de actuator, de MV (Manipulated Variable)
- $epsilon(t)$ --- regelfout
- $r(t)$ --- setpoint (SP); $z(t)$ --- proceswaarde, de PV (Process Variable)
- $K_c$ --- regelaarversterking [actuator/sensor]
- $b$ --- bias: $u$ wanneer $epsilon = 0$

De bias kies je zo dat $z = r$ voor één koppel $(r, d)$: zet $dot(z) = 0$, vul
$u = K_c (r - z) + b$ in en eis $z = r$.

#oefening(title: "Oefening 1 — bias")[
  *Gegeven:* $11 dot(z) + 5 z = 10 / 3 u + 5 d$, met $r = 4$ en $d = 3$.

  Steady state ($dot(z) = 0$) en $z = r$:
  $
    5 r = 10 / 3 b + 5 d quad arrow.r quad 20 = 10 / 3 b + 15 quad arrow.r quad
    b = 15 / 10 = 3 / 2
  $
]

Met $K_c = 3$ wordt de gesloten lus $11 dot(z) + 15 z = 10 r + 20$, dus voor een
stap naar $r = 5$:

$ 15 z = 70 quad arrow.r quad z = 70 / 15 = 4.667 $

Dat is niet $5$: er blijft een *statische fout*. Verhoog je $K_c$ naar $300$, dan
wordt $11 dot(z) + 1005 z = 1000 r + 20$ en

$ 1005 z = 5020 quad arrow.r quad z = 5020 / 1005 = 4.999 $

Looks perfect. Het probleem zit in $u(t)$, niet in $z(t)$.

#figure(
  grid(
    columns: 2,
    column-gutter: 0.6em,
    cetz.canvas({
      let tau3 = 11.0 / 15.0
      let tau300 = 11.0 / 1005.0
      plot.plot(
        size: (5.6, 3.8),
        x-label: text(size: 7pt)[$t$ [s]],
        y-label: text(size: 7pt)[$z(t)$],
        x-min: 0,
        x-max: 10,
        y-min: 3.9,
        y-max: 5.15,
        x-tick-step: 2,
        y-tick-step: 0.25,
        grid: true,
        legend: "inner-south-east",
        legend-style: (item: (spacing: 0.15), padding: 0.2em),
        {
          plot.add(
            domain: (0, 10),
            samples: 400,
            style: (stroke: schoolBlue + 1.5pt),
            label: text(size: 6pt)[$K_c = 3$],
            t => if t < 1 { 4.0 } else { 4.66667 - 0.66667 * calc.exp(-(t - 1) / tau3) },
          )
          plot.add(
            domain: (0, 10),
            samples: 800,
            style: (stroke: schoolRed + 1.5pt),
            label: text(size: 6pt)[$K_c = 300$],
            t => if t < 1 { 4.0 } else { 4.999 - 0.999 * calc.exp(-(t - 1) / tau300) },
          )
          plot.add-hline(5.0, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.6pt)))
          plot.annotate({
            cetz.draw.content((8.6, 5.06), text(size: 6pt, fill: gray)[$r = 5$])
            cetz.draw.content((6.2, 4.55), text(size: 6pt, fill: schoolBlue)[statische fout])
          })
        },
      )
    }),
    cetz.canvas({
      let tau3 = 11.0 / 15.0
      let tau300 = 11.0 / 1005.0
      plot.plot(
        size: (5.6, 3.8),
        x-label: text(size: 7pt)[$t$ [s]],
        y-label: text(size: 7pt)[$u(t)$ (log-schaal)],
        x-min: 0,
        x-max: 10,
        y-min: 1,
        y-max: 500,
        y-mode: "log",
        x-tick-step: 2,
        y-tick-step: 1,
        grid: true,
        legend: "inner-east",
        legend-style: (item: (spacing: 0.15), padding: 0.2em),
        {
          plot.add(
            domain: (0, 10),
            samples: 400,
            style: (stroke: schoolBlue + 1.5pt),
            label: text(size: 6pt)[$K_c = 3$],
            t => if t < 1 { 1.5 } else {
              3.0 * (5.0 - (4.66667 - 0.66667 * calc.exp(-(t - 1) / tau3))) + 1.5
            },
          )
          plot.add(
            domain: (0, 10),
            samples: 2000,
            style: (stroke: schoolRed + 1.5pt),
            label: text(size: 6pt)[$K_c = 300$],
            t => if t < 1 { 1.5 } else {
              300.0 * (5.0 - (4.999 - 0.999 * calc.exp(-(t - 1) / tau300))) + 1.5
            },
          )
          plot.annotate({
            cetz.draw.content((2.3, 190), anchor: "west", text(size: 6pt, fill: schoolRed)[piek $u approx 301.5$])
            cetz.draw.line(
              (2.2, 190),
              (1.15, 290),
              stroke: (paint: schoolRed, thickness: 0.6pt),
              mark: (end: "stealth", fill: schoolRed),
            )
            cetz.draw.content((5.5, 3.1), anchor: "west", text(size: 6pt, fill: schoolBlue)[$u arrow.r 2.5$])
          })
        },
      )
    }),
  ),
  caption: [Servoprobleem: stap van $r = 4$ naar $r = 5$ op $t = 1$. Links is
    $z(t)$ met $K_c = 300$ inderdaad zo goed als perfect. Rechts zie je de prijs:
    de regelaar vraagt op het stapmoment een stuuractie van ruim $300$ eenheden,
    terwijl er met $K_c = 3$ maar $4.5$ nodig was.],
) <fig:servo-kc>

Om die $4.999$ te halen vraagt de regelaar ruim $300$ eenheden stuuractie. Maar
sensoren en actuatoren hebben een limiet op hun output: een klep gaat van $0$ tot
$100 %$, een stroomlus van $4$ tot $20$ mA, een sensor meet tussen $z_(s,min)$ en
$z_(s,max)$. We moeten dus weten hoe groot we $K_c$ mogen maken.

Boven de grens plakt de actuator vast: dat is *saturatie*.

#frm(
  "P-regelaar met actuatorlimieten",
  $
    u_A = cases(
      u_(A,min) & "als" K_c epsilon + b < u_(A,min),
      K_c epsilon + b & "als" u_(A,min) <= K_c epsilon + b <= u_(A,max),
      u_(A,max) & "als" K_c epsilon + b > u_(A,max),
    )
  $,
  [met $u_(A,min), u_(A,max)$ de werkgrenzen van de actuator en
    $z_(s,min), z_(s,max)$ het meetbereik van de sensor.],
)

$u_A$ tegenover $z_s$ geeft de *regelaarkarakteristiek*: het statisch gedrag van
de regelaar.

#figure(
  cetz.canvas({
    import cetz.draw: *
    let ax = x => x / 100 * 9 // 0-100 % -> 0-9 cm
    let ay = y => y / 100 * 4.5 // 0-100 % -> 0-4.5 cm

    // --- assen ---
    line((0, 0), (10.2, 0), mark: (end: "stealth", fill: black))
    line((0, 0), (0, 5.6), mark: (end: "stealth", fill: black))
    content((10.4, 0), anchor: "west", text(size: 8pt)[$z_s$ (PV) [\% tot. range]])
    content((0, 5.9), anchor: "south", text(size: 8pt)[$u_A$ (MV) [\% tot. range]])

    // --- hulplijnen ---
    for (x, lbl) in ((30, $z_(s,min)$), (70, $z_(s,max)$)) {
      line((ax(x), 0), (ax(x), ay(105)), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
      content((ax(x), -0.75), text(size: 7pt, fill: gray)[#lbl])
    }
    line((0, ay(50)), (ax(50), ay(50)), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
    line((ax(50), 0), (ax(50), ay(50)), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))

    // --- karakteristiek ---
    line((0, ay(100)), (ax(30), ay(100)), stroke: (paint: schoolRed, thickness: 2pt))
    line((ax(30), ay(100)), (ax(70), ay(0)), stroke: (paint: schoolRed, thickness: 2pt))
    line((ax(70), ay(0)), (ax(100), ay(0)), stroke: (paint: schoolRed, thickness: 2pt))

    // --- werkpunt (r, b) ---
    circle((ax(50), ay(50)), radius: 0.09, fill: schoolBlue, stroke: none)
    content((ax(50) + 0.15, ay(50) + 0.45), anchor: "west", text(size: 7pt, fill: schoolBlue)[$(r, b)$])

    // --- labels op de assen ---
    content((-0.25, ay(100)), anchor: "east", text(size: 7pt)[$u_(A,max) = 100%$])
    content((-0.25, ay(50)), anchor: "east", text(size: 7pt)[bias])
    content((-0.25, ay(0)), anchor: "east", text(size: 7pt)[$u_(A,min) = 0%$])
    content((ax(50), -0.35), text(size: 7pt)[$r$ [\%]])
    content((ax(100), -0.35), text(size: 7pt)[$100%$])

    // --- proportionele band aanduiden ---
    line(
      (ax(30), ay(112)),
      (ax(70), ay(112)),
      mark: (start: "stealth", end: "stealth", fill: schoolOrange),
      stroke: (paint: schoolOrange, thickness: 1pt),
    )
    content((ax(50), ay(122)), text(size: 8pt, fill: schoolOrange)[*werkgebied = PB*])

    // --- saturatiezones ---
    content((ax(14), ay(88)), text(size: 7pt, fill: gray)[saturatie])
    content((ax(86), ay(12)), text(size: 7pt, fill: gray)[saturatie])
  }),
  caption: [Regelaarkarakteristiek $u_A$ versus $z_s$: het statisch gedrag van de
    P-regelaar. Buiten de proportionele band zit de actuator in saturatie en
    regelt hij niet meer. Het punt $(r, b)$ ligt altijd op deze lijn.],
) <fig:control-characteristic>

== Proportionele band (PB) <sec:proportionele-band>

#frm(
  "Proportionele band (PB)",
  $
    "PB" = 100 / (K_(c,%)) = 100 / K_c dot (u_(A,max) - u_(A,min)) / (z_(s,max) - z_(s,min))
    space [%]
  $,
  [met $"PB"$ de proportionele band [\%], $K_c$ de versterking in natuurlijke
    eenheden [actuator/sensor] en $K_(c,%)$ dezelfde versterking in \%/\%
    (dimensieloos). In \%FSD vervalt de breuk: $"PB" = 100 slash K_(c,%)$.],
)

Dit is de regio waarbij onze sensor en actuator mogen werken. Erbuiten staat de
uitgang op $0 %$ of $100 %$ en regelt de regelaar niet meer.

#oefening(title: "Oefening 2 — proportionele band")[
  *Gegeven:* $K_c = 4.8 " mA/V"$, sensorbereik $0$--$10$ V, actuatorbereik
  $4$--$20$ mA.

  $ "PB" = 100 (1 / 4.8 dot 16 / 10) = 33.33 % $
]

== SCC en SPC <sec:spc-scc>

#theorie(title: "SCC en SPC")[
  De *SCC* (Static Control Characteristic) is onze regelaar geplot: welke $u_%$
  geeft de P-regelaar bij een $z_%$, voor een gegeven $r_%$ en $b_%$?
  $ u_% = K_(c,%) (r_% - z_%) + b_% $
  De *SPC* (Static Process Characteristic) is het gedrag van ons proces: alle
  evenwichten $(u, z)$ bij een gegeven verstoring $d$. Je vindt ze door alle
  afgeleiden nul te zetten.

  Het *snijpunt* is het enige mogelijke evenwicht.
]

PB is altijd positief, $K_c$ mag negatief zijn. Negatieve terugkoppeling betekent
dat de hellingen van SPC en SCC een tegengesteld teken hebben: bij een
direct-acting proces (SPC stijgt) moet de SCC dalen, en omgekeerd. Het minteken in
$(r_% - z_%)$ zorgt daar bij positieve $K_c$ vanzelf voor.

Beide plotten we in hetzelfde vlak: $z$ (PV) op de $x$-as, $u$ (MV) op de $y$-as,
allebei in \%FSD. Dat percentage is gewoon waar je zit tussen de limieten van de
sensor of de actuator.

#frm(
  "%FSD (Full Scale Deflection)",
  $
    u_% = 100 (u - u_min) / (u_max - u_min) quad "en analoog" quad
    z_% = 100 (z - z_min) / (z_max - z_min)
  $,
  [met $u_min, u_max$ de actuatorgrenzen en $z_min, z_max$ de sensorgrenzen. Voor
    een *verandering* $Delta z$ vervalt de aftrek in de teller.],
)

#oefening(title: "Oefening 3 — %FSD")[
  *Gegeven:* sensor met bereik 10--30 °C.

  *a)* PV $= 15$ °C:
  $ z_% = 100 dot (15 - 10) / (30 - 10) = 25 % $

  *b)* PV stijgt van 15 °C naar 30 °C, dus $Delta z = 15$ °C:
  $ Delta z_% = 100 dot 15 / (30 - 10) = 75 % $
]

=== Oefening 4: niveauregeling van een tank <sec:oefening-tank>

Nu hebben we alles. We gaan verder met een oefening.

#figure(
  image("assets/syscon06_tank_niveauregeling.png", width: 42%),
  caption: [De tank uit oefening 4. De regelaar (LC) meet het niveau (PV),
    vergelijkt met $r(t)$ en stuurt via de feed valve de instroom $F_(i n,u)(t)$;
    $F_(i n,d)(t)$ is de verstoring, $F_(o u t)(t)$ de uitstroom.],
) <fig:tank>

#oefening(title: "Oefening 4 (a) — de SPC")[\
  *Gegeven:*
  $
    A / c dot (dif z(t)) / (dif t) + z(t) = 1 / c u(t) + 1 / c d(t),
    quad A = 1 " m"^2, quad c = 0.1 space "m"^2"/s", quad d = 0.04 space "m"^3"/s"
  $
  Actuator: $4$ mA $arrow.r 0$ m#super[3]/s en $20$ mA $arrow.r 0.1$ m#super[3]/s. \
  Sensor: $0.2$ m $arrow.r 0$ V en $1.5$ m $arrow.r 5$ V.

  *Stap 1 --- afgeleiden nul zetten:*
  $
    A z'(t) + c z(t) = u(t) + d(t) quad arrow.r quad 0.1 z = u + 0.04 quad arrow.r
    quad z = 10 u + 0.4
  $

  *Stap 2 --- omrekenen naar \%FSD:*
  $ u_% = 100 u / (0.1 - 0) = 1000 u quad arrow.r quad u = 0.001 u_% $
  $ z_% = 100 (z - 0.2) / (1.5 - 0.2) quad arrow.r quad z = 0.013 z_% + 0.2 $

  *Stap 3 --- substitueren:*
  $ 0.013 z_% + 0.2 = 0.01 u_% + 0.4 quad arrow.r quad 0.01 u_% = 0.013 z_% - 0.2 $
  $ #box(stroke: schoolBlue + 0.8pt, inset: 6pt, $ "SPC:" quad u_% = 1.3 z_% - 20 $) $

  Los altijd op naar $u_%$: $z_% = 0.77 u_% + 15.4$ is dezelfde rechte, maar met
  de assen verwisseld.
]

#oefening(title: "Oefening 4 (b)(c) — bias en SCC")[\
  *Gegeven:* zelfde tank, $r = 1$ m.

  *b) Bias.* Voor evenwicht zonder fout is $b = u$:
  $
    r_% = 100 dot (1 - 0.2) / (1.5 - 0.2) = 61.54 % quad arrow.r quad
    b_% = 1.3 dot 61.54 - 20 = 60 % "FSD"
  $

  *c) SCC bij $"PB" = 50 %$.* In \%FSD is $"PB" = 1 slash K_(c,%)$, dus
  $K_(c,%) = 2$:
  $ u_% = 2 (61.54 - z_%) + 60 $
  $ #box(stroke: schoolBlue + 0.8pt, inset: 6pt, $ "SCC:" quad u_% = -2 z_% + 183.1 $) $
]

#figure(
  cetz.canvas({
    plot.plot(
      size: (8, 5),
      x-label: text(size: 8pt)[$z_%$ (PV) [\%]],
      y-label: text(size: 8pt)[$u_%$ (MV) [\%]],
      x-min: 0,
      x-max: 100,
      y-min: 0,
      y-max: 100,
      x-tick-step: 20,
      y-tick-step: 20,
      grid: true,
      legend: "south",
      legend-style: (item: (spacing: 0.2), padding: 0.2em),
      {
        // SPC: u% = 1.3 z% - 20   (binnen bereik: z% van 15.4 tot 92.3)
        plot.add(
          domain: (15.38, 92.31),
          style: (stroke: schoolRed + 1.5pt),
          label: text(size: 7pt)[SPC: $u_% = 1.3 z_% - 20$],
          x => 1.3 * x - 20,
        )
        // SCC: u% = -2 z% + 183.1  (binnen bereik: z% van 41.5 tot 91.5)
        plot.add(
          domain: (41.54, 91.54),
          style: (stroke: schoolBlue + 1.5pt),
          label: text(size: 7pt)[SCC: $u_% = -2 z_% + 183.1$],
          x => -2 * x + 183.08,
        )
        // snijpunt
        plot.add(
          ((61.54, 60.0),),
          style: (stroke: none),
          mark: "o",
          mark-style: (fill: schoolGreen, stroke: schoolGreen),
          mark-size: 0.18,
          label: text(size: 7pt)[evenwicht $(r_%, b_%)$],
        )
        plot.add-vline(61.54, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.5pt)))
        plot.add-hline(60.0, style: (stroke: (paint: gray, dash: "dashed", thickness: 0.5pt)))
      },
    )
  }),
  caption: [SPC en SCC van de tank in het $z_% - u_%$-vlak. Het snijpunt op
    $(61.5 %, 60 %)$ is het enige evenwicht. Omdat de bias precies voor
    $r = 1$ m berekend is, valt het snijpunt exact op $(r_%, b_%)$ en is er
    *geen statische fout*.],
) <fig:spc-scc>

== Wat als we de parameters veranderen? <sec:parameters>

De SPC ligt vast bij het proces en $d$; alleen de SCC beweegt.

*Case 1 --- $r_% = 50 %$, bias blijft $60 %$:* $u_% = -2 z_% + 160$, snijpunt op
$z_% = 54.5 %$ $arrow.r$ statische fout van $4.5 %$FSD.

*Case 2 --- ook de PB gehalveerd tot $25 %$*, dus $K_(c,%) = 4$:
$u_% = -4 z_% + 260$, snijpunt op $z_% = 52.8 %$ $arrow.r$ fout nog $2.8 %$FSD.

#figure(
  cetz.canvas({
    plot.plot(
      size: (9, 5),
      x-label: text(size: 8pt)[$z_%$ (PV) [\%]],
      y-label: text(size: 8pt)[$u_%$ (MV) [\%]],
      x-min: 0,
      x-max: 100,
      y-min: 0,
      y-max: 100,
      x-tick-step: 20,
      y-tick-step: 20,
      grid: true,
      legend: "south",
      legend-style: (item: (spacing: 0.2), padding: 0.2em),
      {
        plot.add(
          domain: (15.38, 92.31),
          style: (stroke: schoolRed + 1.5pt),
          label: text(size: 7pt)[SPC],
          x => 1.3 * x - 20,
        )
        plot.add(
          domain: (41.54, 91.54),
          style: (stroke: schoolBlue + 1.2pt),
          label: text(size: 7pt)[SCC1: $r_% = 61.5$, PB $= 50%$],
          x => -2 * x + 183.08,
        )
        plot.add(
          domain: (30.0, 80.0),
          style: (stroke: (paint: schoolPurple, thickness: 1.2pt, dash: "dashed")),
          label: text(size: 7pt)[SCC2: $r_% = 50$, PB $= 50%$],
          x => -2 * x + 160.0,
        )
        plot.add(
          domain: (40.0, 65.0),
          style: (stroke: schoolGreen + 1.2pt),
          label: text(size: 7pt)[SCC3: $r_% = 50$, PB $= 25%$],
          x => -4 * x + 260.0,
        )
        plot.add-vline(50.0, style: (stroke: (paint: black, dash: "dashed", thickness: 0.7pt)))
        plot.add(
          ((54.55, 50.9), (52.83, 48.68)),
          style: (stroke: none),
          mark: "o",
          mark-style: (fill: schoolOrange, stroke: schoolOrange),
          mark-size: 0.15,
          label: text(size: 7pt)[nieuwe evenwichten],
        )
        plot.annotate({
          cetz.draw.content((70, 16), anchor: "west", text(
            size: 6.5pt,
            fill: schoolOrange,
          )[fout kleiner bij kleinere PB])
          cetz.draw.line(
            (69, 16),
            (55.5, 45),
            stroke: (paint: schoolOrange, thickness: 0.6pt),
            mark: (end: "stealth", fill: schoolOrange),
          )
          cetz.draw.content((48, 88), anchor: "east", text(size: 6.5pt)[$r_% = 50%$])
        })
      },
    )
  }),
  caption: [De SPC blijft liggen, de SCC beweegt. Verzet je $r$ zonder de bias te
    herrekenen (SCC2), dan valt het snijpunt naast de stippellijn $z_% = 50 %$ en
    ontstaat er een statische fout. Halveer je daarbovenop de PB (SCC3), dan wordt
    de lijn steiler en kruipt het snijpunt dichter naar het setpoint.],
) <fig:parameters>
