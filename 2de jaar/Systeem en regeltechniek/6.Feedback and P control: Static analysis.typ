#import "../../school-template.typ": *

// ============================================================================
//  W7 (CON) — Feedback en P-control: statische analyse
//  Slides: 6.SYSCON_slides_session6_NL_Pcontrol_2 (slides 5-24)
//  Oude versie: _OLD/6.P Control.typ
// ============================================================================

= Feedback en P-control: statische analyse <ch:feedback-p-control>

In @ch:p-control hebben we gezien *wat* een P-regelaar (proportionele regelaar)
doet met een proces. In dit hoofdstuk kijken we naar waar dat geregelde systeem
*in rust* uitkomt, en vooral: welke versterking we onszelf fysiek nog kunnen
veroorloven. We werken hier puur statisch en grafisch — de Laplace-aanpak met de
gesloten-lus transferfunctie volgt pas in @ch:closed-loop-tf.

#examenbox[Dit hoofdstuk komt sowieso terug op het examen. PB (proportionele
band), \%FSD (Full Scale Deflection).]

Het stappenplan gaat als volgt

#import "@preview/merman:0.1.0": mermaid

#mermaid("flowchart LR\n  A[\"Kies een bias\"] --> B[\"Hoe groot mag Kc zijn?\"]\n  B --> C[\"Hoe vertaal ik alles naar procenten?\"]\n  C --> D[\"Waar komt het systeem uit?\"]")

== Oefening: de bias kiezen <sec:oefening-bias>

Eerst de bias. De regelaarvergelijking is

$ u(t) = K_c dot epsilon(t) + b, quad epsilon(t) = r(t) - z(t) $ <eq:p-controller>

met:
- $u(t)$ --- stuuractie naar de actuator, de MV (Manipulated Variable)
- $epsilon(t)$ --- regelfout [zelfde eenheid als $z$]
- $r(t)$ --- referentie of setpoint (SP)
- $z(t)$ --- gemeten proceswaarde, de PV (Process Variable)
- $K_c$ --- regelaarversterking [actuator-eenheid / sensor-eenheid]
- $b$ --- bias: de stuuractie die de regelaar levert wanneer $epsilon = 0$

De bias is de stuuractie die je nodig hebt om *stil te blijven staan* op het
setpoint. Je kiest $b$ altijd voor één specifiek koppel $(r, d)$ — verander je $r$
of $d$, dan klopt je bias niet meer.

#oefening(title: "Oefening 1 — bias kiezen")[
  *Gegeven:* een eerste-orde proces dat we met een P-regelaar willen sturen:
  $ 11 (dif z(t)) / (dif t) + 5 z(t) = 10 / 3 u(t) + 5 d(t) $
  *Gevraagd:* hoe kies ik de bias voor een gewenste referentie $r = 4$ en een
  verstoring $d = 3$?

  *Stap 1 --- steady state veronderstellen.* We zoeken het evenwicht, dus
  $t arrow.r infinity$ en $z'(t) = 0$:
  $ 5 z = 10 / 3 u + 5 d $

  *Stap 2 --- de regelaar invullen.* Vervang $u$ door de standaardformule van de
  P-regelaar, $u = K_c (r - z) + b$:
  $ 5 z = 10 / 3 (K_c (r - z) + b) + 5 d $

  *Stap 3 --- eisen dat $z = r$.* Precies dát is wat we van de bias vragen: geen
  fout in evenwicht. Met $z = r$ valt $K_c (r - z)$ weg:
  $ 5 r = 10 / 3 b + 5 d $

  *Stap 4 --- invullen en oplossen naar $b$.* Met $r = 4$ en $d = 3$:
  $ 20 = 10 / 3 b + 15 quad arrow.r quad b = 15 / 10 = 3 / 2 $

  *Kerninzicht:* $K_c$ komt in de berekening van $b$ niet voor. De bias hangt
  alleen af van het *proces* en van het koppel $(r, d)$ waarvoor je ontwerpt.
]

== Wat doet een grotere $K_c$? <sec:dynamische-analyse>

De bias staat vast, nu kiezen we $K_c$. Neem $K_c = 3$ en laat de referentie op
$t = 1$ stapsgewijs van $4$ naar $5$ springen (een servoprobleem). Vul de regelaar
in de procesvergelijking in:

$ 11 (dif z) / (dif t) + 5 z = 10 / 3 (3 (r - z) + 3 / 2) + 15 = 10 r - 10 z + 5 + 15 $
$ arrow.r quad 11 (dif z) / (dif t) + 15 z = 10 r + 20 $

In steady state ($dif z slash dif t = 0$) met $r = 5$:

$ 15 z = 70 quad arrow.r quad z = 70 / 15 = 4.6666 $

We vroegen $r = 5$ en krijgen $4.667$. Dat verschil is de *statische fout*
(steady state error): ze ontstaat omdat de bias berekend is voor $r = 4$, niet
voor $r = 5$.

De stuuractie volgt uit $u = 3 (r - z) + 3 slash 2$:

$ t = 0: u = b = 3 / 2, quad
  t = 1: u = 3 (5 - 4) + 3 / 2 = 9 / 2, quad
  t arrow.r infinity: u = 3 (5 - 70 / 15) + 3 / 2 = 5 / 2 $

Wil je die fout weg? Draai $K_c$ omhoog. Met $K_c = 300$ wordt de gesloten lus
$11 dot dot(z) + 1005 z = 1000 r + 20$ en dus

$ 5 z = 5000 - 1000 z + 5 + 15 quad arrow.r quad 1005 z = 5020 quad arrow.r quad
  z = 5020 / 1005 = 4.999 $

Dat ziet er perfect uit. *Waar zit dan het probleem?* Kijk niet naar $z(t)$ maar
naar $u(t)$.

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
        x-min: 0, x-max: 10, y-min: 3.9, y-max: 5.15,
        x-tick-step: 2, y-tick-step: 0.25,
        grid: true,
        legend: "inner-south-east",
        legend-style: (item: (spacing: 0.15), padding: 0.2em),
        {
          plot.add(
            domain: (0, 10), samples: 400,
            style: (stroke: schoolBlue + 1.5pt),
            label: text(size: 6pt)[$K_c = 3$],
            t => if t < 1 { 4.0 } else { 4.66667 - 0.66667 * calc.exp(-(t - 1) / tau3) },
          )
          plot.add(
            domain: (0, 10), samples: 800,
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
        x-min: 0, x-max: 10, y-min: 1, y-max: 500,
        y-mode: "log",
        x-tick-step: 2, y-tick-step: 1,
        grid: true,
        legend: "inner-east",
        legend-style: (item: (spacing: 0.15), padding: 0.2em),
        {
          plot.add(
            domain: (0, 10), samples: 400,
            style: (stroke: schoolBlue + 1.5pt),
            label: text(size: 6pt)[$K_c = 3$],
            t => if t < 1 { 1.5 } else {
              3.0 * (5.0 - (4.66667 - 0.66667 * calc.exp(-(t - 1) / tau3))) + 1.5
            },
          )
          plot.add(
            domain: (0, 10), samples: 2000,
            style: (stroke: schoolRed + 1.5pt),
            label: text(size: 6pt)[$K_c = 300$],
            t => if t < 1 { 1.5 } else {
              300.0 * (5.0 - (4.999 - 0.999 * calc.exp(-(t - 1) / tau300))) + 1.5
            },
          )
          plot.annotate({
            cetz.draw.content((2.3, 190), anchor: "west",
              text(size: 6pt, fill: schoolRed)[piek $u approx 301.5$])
            cetz.draw.line((2.2, 190), (1.15, 290), stroke: (paint: schoolRed, thickness: 0.6pt),
              mark: (end: "stealth", fill: schoolRed))
            cetz.draw.content((5.5, 3.1), anchor: "west",
              text(size: 6pt, fill: schoolBlue)[$u arrow.r 2.5$])
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

Die piek van $301.5$ bestaat fysiek niet. Een klep gaat maar van $0$ tot
$100 %$ open, een stroomlus loopt maar van $4$ tot $20$ mA, en een sensor meet
maar tussen $z_(s,min)$ en $z_(s,max)$. De wiskunde vraagt hier iets wat de
hardware niet kan leveren.

Daarom moeten we weten *hoe groot we $K_c$ mogen maken*. Merk op dat het hier om
de versterking van de regelaar gaat, niet om de DC-gain van het proces: die
laatste ligt vast in het proces, $K_c$ is de knop waar wij aan draaien.

== Grenzen van sensor en actuator <sec:limieten-sensor-actuator>

Zodra de berekende stuuractie buiten het bereik van de actuator valt, treedt
*saturatie* (verzadiging) op: de actuator blijft gewoon aan zijn grens plakken.
De werkelijke stuuractie $u_A$ is dus stuksgewijs gedefinieerd:

#frm(
  "P-regelaar met actuatorlimieten",
  $ u_A = cases(
    u_(A,min) & "als" K_c epsilon + b < u_(A,min),
    K_c epsilon + b & "als" u_(A,min) <= K_c epsilon + b <= u_(A,max),
    u_(A,max) & "als" K_c epsilon + b > u_(A,max),
  ) $,
  [met $u_(A,min), u_(A,max)$ de werkgrenzen van de actuator (bv. $4$--$20$ mA)
   en $z_(s,min), z_(s,max)$ het meetbereik van de sensor (bv. $0$--$10$ V).],
)

Als je $u_A$ uitzet tegenover $z_s$ krijg je de *regelaarkarakteristiek* (control
characteristic): het statisch gedrag van de regelaar. Ze bestaat uit een vlak stuk
in saturatie, een schuin stuk waar de regelaar echt regelt, en weer een vlak stuk.
Dat schuine stuk is het werkgebied.

#figure(
  cetz.canvas({
    import cetz.draw: *
    let ax = (x) => x / 100 * 9      // 0-100 % -> 0-9 cm
    let ay = (y) => y / 100 * 4.5    // 0-100 % -> 0-4.5 cm

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
    line((ax(30), ay(112)), (ax(70), ay(112)), mark: (start: "stealth", end: "stealth", fill: schoolOrange),
      stroke: (paint: schoolOrange, thickness: 1pt))
    content((ax(50), ay(122)), text(size: 8pt, fill: schoolOrange)[*werkgebied = PB*])

    // --- saturatiezones ---
    content((ax(14), ay(88)), text(size: 7pt, fill: gray)[saturatie])
    content((ax(86), ay(12)), text(size: 7pt, fill: gray)[saturatie])
  }),
  caption: [Regelaarkarakteristiek $u_A$ versus $z_s$: het statisch gedrag van de
    P-regelaar. Buiten de proportionele band zit de actuator in saturatie en
    regelt hij niet meer. Het punt $(r, b)$ ligt altijd op deze lijn.],
) <fig:control-characteristic>

== De proportionele band (PB) <sec:proportionele-band>

Het schuine stuk uit @fig:control-characteristic is precies het gebied waarin
sensor én actuator *samen* mogen werken. We geven dat gebied een naam.

De *proportionele band* is de fout, uitgedrukt als percentage van het
meetbereik, die nodig is om de regelaaruitgang over zijn *volle schaal* te laten
gaan. Anders gezegd: het gebied in \% rond het setpoint waar de regelaar het
proces écht regelt — waar zijn uitgang dus niet op $0 %$ of $100 %$ vastzit.

#frm(
  "Proportionele band (PB)",
  $ "PB" = 100 / (K_(c,%)) = 100 / K_c dot (u_(A,max) - u_(A,min)) / (z_(s,max) - z_(s,min))
    space [%] quad arrow.l.r.double quad
    K_c = 100 / "PB" dot (u_(A,max) - u_(A,min)) / (z_(s,max) - z_(s,min)) $,
  [met $"PB"$ de proportionele band [\%], $K_c$ de regelaarversterking in
   natuurlijke eenheden [actuator/sensor], $K_(c,%)$ dezelfde versterking in
   \%/\% (dimensieloos), $u_(A,max) - u_(A,min)$ de actuator span en
   $z_(s,max) - z_(s,min)$ de sensor span.],
)

Let goed op *welke* $K_c$ in de formule staat. Werk je met natuurlijke
eenheden (mA per V), dan heb je de spans nodig. Werk je al in \%FSD, dan zijn
beide assen dimensieloos en valt de breuk weg: $"PB" = 100 slash K_(c,%)$. Dat is
de vorm die je in @sec:oefening-tank gebruikt.

Lees $"PB"$ dus als: *welk deel van mijn sensorbereik heb ik nodig om de
actuator van $0 %$ naar $100 %$ te sturen?* Een kleine $"PB"$ (grote $K_c$)
betekent een agressieve regelaar die na een klein foutje al volledig uitslaat —
kleine statische fout, maar snel saturatie en oscillatie. Een grote $"PB"$
(kleine $K_c$) geeft een milde, trage regelaar met een grotere statische fout.

#oefening(title: "Oefening 2 — proportionele band")[
  *Gegeven:* $K_c = 4.8 " mA/V"$, $b = 7 " mA"$, sensorbereik $0$--$10$ V,
  actuatorbereik $4$--$20$ mA. *Gevraagd:* de proportionele band.

  *Oplossing:* de spans zijn $z_(s,max) - z_(s,min) = 10 " V"$ en
  $u_(A,max) - u_(A,min) = 16 " mA"$, dus

  $ "PB" = 100 (1 / K_c dot (u_(A,max) - u_(A,min)) / (z_(s,max) - z_(s,min)))
    = 100 (1 / 4.8 dot 16 / 10) = 33.33 % $

  *Kerninzicht:* de bias $b$ doet hier niet mee. $b$ verschuift de karakteristiek
  op en neer, $K_c$ bepaalt haar helling — en dus haar breedte.
]

== De statische proceskarakteristiek en \%FSD <sec:fsd>

De *SPC* (Static Process Characteristic) is de verzameling van alle mogelijke
evenwichten $(u, z)$ van het *proces*, bij een gegeven waarde van de verstoring
$d$. Je vindt ze door in de procesvergelijking alle afgeleiden nul te zetten.

Het plan is om SPC en SCC in één grafiek te combineren. Daarvoor spreken we een
vaste conventie af:

- $z$ (de PV) op de $x$-as;
- $u$ (de OP $=$ MV) op de $y$-as;
- *allebei in \%FSD.*

Die laatste is nodig omdat de ene as in mA staat en de andere in V of meter.
*\%FSD* (Full Scale Deflection) is het percentage ten opzichte van de grenzen van
de sensor of de actuator.

#frm(
  "%FSD (Full Scale Deflection)",
  $ u_% = 100 (u - u_min) / (u_max - u_min) quad "en analoog" quad
    z_% = 100 (z - z_min) / (z_max - z_min) $,
  [met $u_%, z_%$ de waarde uitgedrukt op de volle schaal [\%], $u_min, u_max$ de
   actuatorgrenzen en $z_min, z_max$ de sensorgrenzen.],
)

Let op het verschil tussen een *waarde* en een *verandering*. Voor een
absolute waarde trek je $z_min$ af, voor een stijging $Delta z$ niet:

$ Delta z_% = 100 dot (Delta z) / (z_max - z_min) $

De noemer blijft in beide gevallen de volle span.

#oefening(title: "Oefening 3 — %FSD")[
  *Gegeven:* een sensor met bereik 10--30 °C.

  *a) De PV is 15 °C. Hoeveel is dat in %FSD?* Absolute waarde, dus met
  aftrek van $z_min$:
  $ z_% = 100 (z - z_min) / (z_max - z_min) = 100 dot (15 - 10) / (30 - 10) = 100 dot 5 / 20 = 25 % $

  *b) De PV stijgt van 15 °C naar 30 °C. Hoeveel is die stijging
  in %FSD?* Nu is $Delta z = 30 - 15 = 15$ °C een verschil, dus zonder
  aftrek:
  $ Delta z_% = 100 dot (Delta z) / (z_(s,max) - z_(s,min)) = 100 dot 15 / (30 - 10) = 100 dot 15 / 20 = 75 % $

  *Kerninzicht:* $25 %$ en $75 %$ komen uit dezelfde formule; het enige verschil
  is of je teller een positie is of een verplaatsing.
]

== SPC en SCC samen <sec:spc-scc>

De tweede lijn in dezelfde grafiek is de regelaar.

#theorie(title: "SPC en SCC")[
  De *SPC* geeft de evenwichten van het *proces*: welke $u_%$ hoort bij welke
  $z_%$ als alles stilstaat. De *SCC* (Static Control Characteristic) geeft wat de
  *regelaar* doet: welke stuuractie $u_%$ hij levert bij een proceswaarde $z_%$,
  voor een gegeven setpoint $r_%$ en bias $b_%$:
  $ u_% = K_(c,%) (r_% - z_%) + b_% $
  Het *snijpunt* van beide is het enige mogelijke evenwichtspunt van de gesloten
  lus.
]

*Denk aan het teken.* $"PB"$ is altijd positief, $K_c$ mag negatief zijn.
Negatieve terugkoppeling betekent dat de hellingen van SPC en SCC een
*tegengesteld* teken hebben:

- *direct-acting proces* (helling SPC $> 0$): SCC moet dalen — stijgt $z$ boven
  het setpoint, dan moet $u$ omlaag;
- *reverse-acting proces* (helling SPC $< 0$): SCC moet stijgen.

Het minteken in $(r_% - z_%)$ zorgt daar bij een positieve $K_c$ vanzelf voor.

=== Uitgewerkte oefening: niveauregeling van een tank <sec:oefening-tank>

Dit is de standaardoefening: proces $arrow.r$ SPC $arrow.r$ bias $arrow.r$ SCC
$arrow.r$ grafiek.

#figure(
  image("assets/syscon06_tank_niveauregeling.png", width: 42%),
  caption: [De tank uit oefening 4. De regelaar (LC) meet het niveau (PV),
    vergelijkt met $r(t)$ en stuurt via de feed valve de instroom $F_(i n,u)(t)$;
    $F_(i n,d)(t)$ is de verstoring, $F_(o u t)(t)$ de uitstroom.],
) <fig:tank>

#oefening(title: "Oefening 4 (a) — de SPC opstellen")[ \
  *Gegeven:* een tank met een regelklep als instroom en een vaste verstoring
  $d = 0.04$ m#super[3]/s:
  $ A / c dot (dif z(t)) / (dif t) + z(t) = 1 / c u(t) + 1 / c d(t),
    quad A = 1 " m"^2, quad c = 0.1 space "m"^2"/s" $
  Actuator: $4$ mA $arrow.r 0$ m#super[3]/s en $20$ mA $arrow.r 0.1$ m#super[3]/s. \
  Sensor: $0.2$ m $arrow.r 0$ V en $1.5$ m $arrow.r 5$ V.

  *Gevraagd:* teken de statische proceskarakteristiek ($x$-as $z$ in \%, $y$-as
  $u$ in \%).

  *Stap 1 --- afgeleiden nul zetten.* Statisch evenwicht betekent
  $dif z slash dif t = 0$, dus de tijdsafhankelijkheid verdwijnt:
  $ A dot z'(t) + c z(t) = u(t) + d(t) quad arrow.r quad 0.1 z = u + 0.04 $
  $ arrow.r quad z = 10 u + 0.4 $

  *Stap 2 --- omrekenen naar \%FSD.* Voor de actuator ($u_min = 0$,
  $u_max = 0.1$):
  $ u_% = 100 (u - 0) / (0.1 - 0) = 1000 u quad arrow.r quad u = 0.001 u_% $
  Voor de sensor ($z_min = 0.2$, $z_max = 1.5$):
  $ z_% = 100 (z - 0.2) / (1.5 - 0.2) quad arrow.r quad z = 0.013 z_% + 0.2 $

  *Stap 3 --- substitueren.* Vul beide uitdrukkingen in $z = 10u + 0.4$ in:
  $ 0.013 z_% + 0.2 = 10 (0.001 u_%) + 0.4 $
  $ 0.013 z_% + 0.2 = 0.01 u_% + 0.4 $
  $ 0.01 u_% = 0.013 z_% - 0.2 $
  $ #box(stroke: schoolBlue + 0.8pt, inset: 6pt, $ "SPC:" quad u_% = 1.3 z_% - 20 $) $

  *Kerninzicht:* de SPC is gewoon de statische procesvergelijking, alleen
  herschreven in percentages en met $u_%$ op de $y$-as. Positieve helling
  $arrow.r$ dit is een direct-acting proces $=>$ meer instroom geeft een hoger
  niveau.
]


#oefening(title: "Oefening 4 (b)(c) — bias en SCC")[ \
  *Gegeven:* zelfde tank, nu met setpoint $r = 1$ m. *Gevraagd:* kies de
  gepaste bias en teken de regelaarkarakteristiek voor $"PB" = 50 %$.

  *b) Bias.* We willen geen statische fout: in evenwicht moet $z = r$, dus
  $epsilon = 0$ en dus $b = u$. Zet eerst het setpoint om naar \%FSD:
  $ r_% = z_(e q,%) = 100 dot (1 - 0.2) / (1.5 - 0.2) = 61.54 % $
  Vul dat in de SPC in — dat is immers de stuuractie die het proces nodig heeft
  om dat niveau vast te houden:
  $ b_% = 1.3 dot 61.54 - 20 = 60 % "FSD" $

  *c) SCC bij $"PB" = 50 %$.* In \%FSD zijn beide assen dimensieloos, dus
  $ "PB" = 50 % = 1 / K_(c,%) quad arrow.r quad K_(c,%) = 2 $
  $ u_% = K_(c,%) (r_% - z_%) + b_% = 2 (61.54 - z_%) + 60 $
  $ #box(stroke: schoolBlue + 0.8pt, inset: 6pt, $ "SCC:" quad u_% = -2 z_% + 183.1 $) $

  *Kerninzicht:* de bias volgt altijd uit de SPC, niet uit de regelaar. Je vraagt
  het proces "wat heb je nodig om hier te blijven staan?" en dat antwoord zet je
  als $b$ in de regelaar.
]

=== Grafische lezing: waar snijden ze elkaar? <sec:spc-scc-grafiek>

#figure(
  cetz.canvas({
    plot.plot(
      size: (8, 5),
      x-label: text(size: 8pt)[$z_%$ (PV) [\%]],
      y-label: text(size: 8pt)[$u_%$ (MV) [\%]],
      x-min: 0, x-max: 100,
      y-min: 0, y-max: 100,
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

*Lezen:* kies een $z_%$ en ga verticaal omhoog. De SPC zegt hoeveel stuuractie
het proces nodig heeft om op dat niveau te blijven, de SCC hoeveel de regelaar er
geeft. Alleen waar die twee gelijk zijn kan het systeem stilstaan.

=== Wat als we de parameters veranderen? <sec:parameters-veranderen>

De SPC ligt vast: die hoort bij het proces en bij $d$. Alleen de SCC beweegt.

*Case 1 --- setpoint naar $r_% = 50 %$, bias blijft $60 %$.* De SCC schuift op met
dezelfde helling: $u_% = -2 z_% + 160$. Snijpunt met de SPC:

$ 1.3 z_% - 20 = -2 z_% + 160 quad arrow.r quad z_% = 54.5 % $

We vroegen $50 %$: een statische fout van $4.5 %$FSD.

*Case 2 --- bovendien de PB gehalveerd tot $25 %$*, dus $K_(c,%) = 4$ en
$u_% = -4 z_% + 260$:

$ 1.3 z_% - 20 = -4 z_% + 260 quad arrow.r quad z_% = 52.8 % $

De fout krimpt tot $2.8 %$FSD.

#figure(
  cetz.canvas({
    plot.plot(
      size: (9, 5),
      x-label: text(size: 8pt)[$z_%$ (PV) [\%]],
      y-label: text(size: 8pt)[$u_%$ (MV) [\%]],
      x-min: 0, x-max: 100, y-min: 0, y-max: 100,
      x-tick-step: 20, y-tick-step: 20,
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
          cetz.draw.content((70, 16), anchor: "west",
            text(size: 6.5pt, fill: schoolOrange)[fout kleiner bij kleinere PB])
          cetz.draw.line((69, 16), (55.5, 45), stroke: (paint: schoolOrange, thickness: 0.6pt),
            mark: (end: "stealth", fill: schoolOrange))
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
