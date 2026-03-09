#import "../../school-template.typ": *

= Electronic Applications <ch:electronic_applications>

#concept(title: "filter")[

  Je hebt meerdere soorten filters
  - *Low pass filter*: Laat alleen lage frequenties door $arrow.r.double$ 1 cut-off frequentie.
  - *High pass filter*: Laat alleen hoge frequenties door $arrow.r.double$ 1 cut-off frequentie.
  - *Band pass filter*: Laat alleen een bandbreedte aan frequenties door $arrow.r.double$ 2 cut-off frequenties.
  - *Band stop filter*: Laat alleen een bandbreedte aan frequenties tegen $arrow.r.double$ 2 cut-off frequenties.
  - *All pass filter*: Laat alle frequenties door maar ze hebben een frequentie phase response
  Je gaat je frequentie transformeren _Bv. geluidseffecten_.
  #figure(
    image("filters.png", width: 8cm),
    caption: [filters],
    label: <fig:filters>,
  )

  #figure(
    image("allpass-filter.png", width: 8cm),
    caption: [allpass-filter],
    label: <fig:allpass-filter>,
  )
]

#examenbox("In dit vak gaan we niet filters zitten designen maar je moet wel filters snappen")


== Passieve VS actieve filters

Passieve filters gaan geen gebruik gaan maken van *OP-amps* _Bv. Resistors, capaciteiten, spoelen_

Elektronische circuits kunnen ook in een systeem worden opgezet waar je afhankelijk van de input je een bepaalde output gaat krijgen. Het idee is dus exact hetzelfde als systemen.

$ v_(i n) = Delta v + v_(o u t) $
$ arrow.b.double ("Laplace") $
$ H(s) = frac(v_(o u t), v_(i n)) $

De output is afhankelijk van de impedantie (R, C, L). Als we de Laplace transform nemen met de wet van ohm waarbij de de effecten van C en L in rekening brengen.

Een capaciteit gaat afhankelijk van hoeveel lading dat er in de capaciteit zit een voltage opleggen dus

Een spoel gaat een voltage opleggen afhankelijk van de verandering van de stroom.

$ V = i dot R $
$ "Laplace" integral -> 1/s $
$ "Laplace" d/(d t) -> s $




#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt,
    table.header([], [*Time domain*], [*Laplace domain*]),
    [Resistor], [$v = R i$], [$V = R I$],
    [Capacitor], [$v = 1/C integral i d t$], [$V = 1/(s C) I$],
    [Coil], [$v = L (d i)/(d t)$], [$V = L s I$],
  ),
  caption: [Voltage-current relations for passive components],
)

De overgang van het tijdsdomein naar het Laplacedomein volgt twee basisregels:
- *Integratie* $integral (dot) d t$ wordt een *deling door $s$*: $1/s$
- *Afgeleide* $d/(d t) (dot)$ wordt een *vermenigvuldiging met $s$*: $s$

Gewone vermenigvuldigingen (zoals $R dot i$) blijven ongewijzigd — vervang enkel de kleine-letter tijdsignalen door hoofdletters ($i(t) -> I(s)$, $v(t) -> V(s)$).

Bij actieve ja je die wel gebruiken. _Bv. OP-amps, transistors_


*Equivalent mechanica en electronische systemen*
Als we electronische systemen vergelijken met mechanische systemen gaan veel dingen die we in *MATHSYS* overgaan naar electronische systemen.

#figure(
  image("mechanics en electronisch.png", width: 12cm),
  caption: [mechanics en electronisch],
  label: <fig:mechanics-en-electronisch>,
)

$ arrow.b.double $

#figure(
  table(
    columns: 2,
    align: (center, center),
    stroke: 0.5pt,
    table.header([*Mass springsystem*], [*LRC-circuit*]),
    [$m dot x''(t) + c dot x'(t) + k x(t) = f(t)$], [$L dot q''(t) + R dot q'(t) + 1/C dot q(t) = v_("in")(t)$],
    [$H(s) = display(1/(m s^2 + c s + k))$], [$H(s) = display(1/(L s^2 + R s + 1\/C))$],
  ),
  caption: [Vergelijking massa-veer systeem en LRC-circuit],
)

Je ziet dat er duidelijke vergelijkingen zijn

- *massa* $m$ is analoog aan *spoel* $L$
- *demping* $c$ is analoog aan *weerstand* $R$
- *veerconstante* $k$ is analoog aan *capaciteit* $1/C$
- *positie* $x(t)$ is analoog aan *lading* $q(t)$

=== Passieve filters

#concept(title: "Impedantie in het Laplacedomein")[
  In het Laplacedomein gedraagt elk passief component zich als een "weerstand" met een *impedantie* $Z(s)$. De spanning-stroom relatie wordt simpelweg:
  $ V(s) = Z(s) dot I(s) $

  Dit betekent dat je *alle DC-circuitregels* (KVL, KCL, spanningsdeler, ...) gewoon kan toepassen, maar met $Z$ in plaats van $R$:

  #figure(
    table(
      columns: 3,
      align: (center, center, center),
      stroke: 0.5pt,
      table.header([*Component*], [*Impedantie $Z(s)$*], [*Afleiding*]),
      [Resistor], [$Z = R$], [$V = R I arrow.r Z = V\/I = R$],
      [Capacitor], [$Z = display(1/(s C))$], [$integral arrow.r 1\/s$, dus $V = 1\/(s C) I$],
      [Spoel], [$Z = L s$], [$d\/(d t) arrow.r s$, dus $V = L s I$],
    ),
    caption: [Impedanties van passieve componenten],
  )
]

We maken een simpele voorbeeld oefening met een spanningsdeler:

We zoeken naar *de transferfunctie* $H(s)$ dat betekent dat er dus geen enkele belansting is op ons systeem. In een electronisch circuit betekent dat geen stroom.

#oefening(title: "Spanningsdeler — Bewijs transferfunctie")[
  #figure(
    image("spanningsdeler.png", width: 5cm),
    caption: [spanningsdeler],
    label: <fig:spanningsdeler>,
  )

  *Gegeven*: Een circuit met twee impedanties $Z_1$ en $Z_2$ in serie, met $V_("out")$ gemeten over $Z_2$.

  *Gevraagd*: $ H(s) = (V_("out")(s)) / (V_("in")(s)) $

  Dit is net hetzelfde als bij mechanische systemen

  $ ~ H(s) = Y(s) / X(s) $

  *Oplossing*:

  _Stap 1_ — Pas *KVL* toe: de totale spanning over de serieschakeling is:
  $ V_("in")(s) = I(s) dot (Z_1 + Z_2) $

  _Stap 2_ — De uitgangsspanning is de spanningsval over $Z_2$:
  $ V_("out")(s) = I(s) dot Z_2 $

  _Stap 3_ — Deel $V_("out")$ door $V_("in")$, de stroom $I(s)$ valt weg:
  $
    H(s) = (V_("out")(s)) / (V_("in")(s)) = (cancel(I(s)) dot Z_2) / (cancel(I(s)) dot (Z_1 + Z_2)) = Z_2 / (Z_1 + Z_2)
  $

  Dit is exact dezelfde spanningsdeler-formule als bij DC, maar nu met impedanties!

  Dus de transferfunctie toont dus gewoon simpel dat de verhouding tussen de uitgang en ingang. Bij dit simpel circuit is dat gewoon een spanningsdeler
]


#oefening(title: "eerste order passive filter")[

  *Gegeven*: Een RC-circuit met weerstand $R$ in serie en condensator $C$ naar ground. De uitgangsspanning $v_o$ wordt gemeten over $C$.
  #figure(
    image("low-pass filter.png", width: 5cm),
    caption: [low-pass filter],
    label: <fig:low-pass-filter>,
  )

  *Transferfunctie*

  Uit de spanningsdeler met $Z_1 = R$ en $Z_2 = 1/(s C)$:

  $ H(s) = Z_2 / (Z_1 + Z_2) = display(1/(s C)) / (R + display(1/(s C))) = 1 / (s R C + 1) $

  *Frequentierespons*

  Vervang $s = j omega$:

  $ H(j omega) = 1 / (j omega R C + 1) $

  De magnitude is:
  $ |H(j omega)| = 1 / sqrt(1 + (omega R C)^2) $

  - $lim_(omega -> 0) |H| = 1$ (0 dB) — lage frequenties passeren volledig
  - $omega = 1/(R C)$: $|H| = 1/sqrt(2)$ (-3 dB) — dit is de *cut-off frequentie*
  - $lim_(omega -> infinity) |H| approx 1/(omega R C)$ — afname van *-20 dB/decade*

  *Polen en nulpunten*

  De pool van $H(s)$ ligt bij:
  $ p = -1/(R C) $

  Er zijn *geen nulpunten* (teller is constant). Eén pool $arrow.r$ eerste-orde systeem.

  *Bode magnitude plot*

  #figure(
    cetz.canvas({
      import cetz.draw: *

      plot.plot(
        size: (10, 6),
        x-label: $log(omega)$,
        y-label: [dB],
        x-tick-step: 1,
        y-tick-step: 5,
        y-min: -25,
        y-max: 5,
        x-min: -1,
        x-max: 3,
        {
          // Asymptotisch bode-diagram: 0 dB vlak, dan -20 dB/dec
          plot.add(
            style: (stroke: blue + 1.5pt),
            label: [Asymptotisch],
            ((-.5, 0), (1, 0), (3, -40)),
          )
          // Werkelijke curve |H(jω)|
          plot.add(
            domain: (-1, 3),
            samples: 200,
            style: (stroke: (paint: red, thickness: 1pt, dash: "dashed")),
            label: [Exact],
            x => -10 * calc.log(1 + calc.pow(calc.pow(10, x), 2), base: 10),
          )
          // -3 dB referentielijn
          plot.add-hline(-3, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
          // Cut-off frequentie markering
          plot.add-vline(1, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
        },
      )
      content((7.2, 2.8), text(fill: blue, size: 8pt)[$omega_c = 1 slash (R C)$])
      content((8.5, 4.5), text(fill: red, size: 8pt)[$-20 "dB/dec"$])
    }),
    caption: [Bode magnitude plot van een eerste orde RC low-pass filter],
  )
]

#oefening(title: "High pass filter")[

  *Gegeven*: Een RC-circuit met condensator $C$ in serie en weerstand $R$ naar ground. De uitgangsspanning $v_o$ wordt gemeten over $R$.

  #figure(
    image("high-pass filter.png", width: 6cm),
    caption: [high-pass filter],
    label: <fig:high-pass-filter>,
  )

  *Transferfunctie*

  Uit de spanningsdeler met $Z_1 = 1/(s C)$ en $Z_2 = R$:

  $ H(s) = Z_2 / (Z_1 + Z_2) = R / (display(1/(s C)) + R) = (s R C) / (s R C + 1) $

  *Frequentierespons*

  Vervang $s = j omega$:

  $ H(j omega) = (j omega R C) / (j omega R C + 1) $

  De magnitude is:
  $ |H(j omega)| = (omega R C) / sqrt(1 + (omega R C)^2) $

  - $lim_(omega -> 0) |H| = 0$ ($-infinity$ dB) — lage frequenties worden geblokkeerd
  - $omega = 1/(R C)$: $|H| = 1/sqrt(2)$ (-3 dB) — dit is de *cut-off frequentie*
  - $lim_(omega -> infinity) |H| approx 1$ (0 dB) — hoge frequenties passeren volledig

  *Polen en nulpunten*

  Pool: $ p = -1/(R C) $
  Nulpunt: $ z = 0 $

  Het nulpunt in de oorsprong zorgt ervoor dat DC-signalen ($omega = 0$) volledig worden geblokkeerd.

  *Bode magnitude plot*

  #figure(
    cetz.canvas({
      import cetz.draw: *

      plot.plot(
        size: (10, 6),
        x-label: $log(omega)$,
        y-label: [dB],
        x-tick-step: 1,
        y-tick-step: 5,
        y-min: -25,
        y-max: 5,
        x-min: -1,
        x-max: 3,
        {
          // Asymptotisch bode-diagram: +20 dB/dec dan 0 dB vlak
          plot.add(
            style: (stroke: blue + 1.5pt),
            label: [Asymptotisch],
            ((-1, -40), (1, 0), (3, 0)),
          )
          // Werkelijke curve |H(jω)|
          plot.add(
            domain: (-1, 3),
            samples: 200,
            style: (stroke: (paint: red, thickness: 1pt, dash: "dashed")),
            label: [Exact],
            x => -10 * calc.log(1 + calc.pow(calc.pow(10, -x), 2), base: 10),
          )
          // -3 dB referentielijn
          plot.add-hline(-3, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
          // Cut-off frequentie markering
          plot.add-vline(1, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
        },
      )
      content((7.2, 2.8), text(fill: blue, size: 8pt)[$omega_c = 1 slash (R C)$])
      content((3.5, 4.5), text(fill: red, size: 8pt)[$+20 "dB/dec"$])
    }),
    caption: [Bode magnitude plot van een eerste orde RC high-pass filter],
  )
]

=== Actieve filters

Bij *Actieve filters* gaan we Op-amps aan toevoegen.
Deze hebben geen inductors nodig en zijn meestal makkelijker om te designen dan passieve filters.

#examenbox("Belangrijk ook voor het examen")

#belangrijk("NOOIT KLC toepassen op de uitgang van je op-amp!")

*Onthou* de transferfunctie is wat het systeem gaat veranderein aan een input. Dus wat we nu aan het doen is deze filters hun verandering wiskundig berekenen

#figure(
  image("actieve-filters.png", width: 15cm),
  caption: [Actieve filters],
  label: <fig:actieve-filters>,
)

*Voltage follower* ($H(s) = 1$): De uitgang volgt exact de ingang. De op-amp buffert het signaal — geen versterking, maar wel een hoge ingangsimpedantie en lage uitgangsimpedantie. Nuttig om belasting te voorkomen.

*Inverting amplifier* ($H(s) = -R_b / R_a$): De ingang gaat via $R_a$ naar de $-$ ingang. Feedback via $R_b$. De op-amp dwingt $V_- = V_+ = 0$ (virtuele ground):
$ I = V_("in") / R_a = -V_("out") / R_b arrow.r.double H(s) = -R_b / R_a $

*Non-inverting amplifier* ($H(s) = 1 + R_a / R_b$): De ingang zit op de $+$ ingang. De op-amp dwingt $V_- = V_+$. Via de spanningsdeler $R_a, R_b$ op de $-$ ingang:
$ V_- = V_("out") dot R_b / (R_a + R_b) = V_("in") arrow.r.double H(s) = 1 + R_a / R_b $

Hoe op-amps zich gaan gedragen is dat ze er alles aan gaan doen om het voltage verschil tussen de $+$ en $-$ ingang 0 te maken. Dus we gaan de $+$ ingang op een bepaalde voltage zetten en dan gaan we de $-$ ingang proberen op diezelfde voltage te krijgen. _zie eerste jaar electronica_

#figure(
  image("active-filters2.png", width: 14cm),
  caption: [Summing amplifiers (MISO systemen)],
  label: <fig:actieve-filters2>,
)

*Inverterende summing amplifier* (links): Meerdere ingangen ($v_1, v_2$) worden opgeteld via aparte weerstanden ($R_1, R_2$) naar de $-$ ingang. Elke ingang levert een stroom $I_k = V_k / R_k$. De totale stroom vloeit door $R$:
$ V_("out") = -( R/R_1 V_1 + R/R_2 V_2) $
Als $R_1 = R_2 = R$: simpele optelling $V_("out") = -(V_1 + V_2)$.

*Niet-inverterende summing amplifier* (rechts): Combinatie van $+$ en $-$ ingangen, zodat:
$ V_("out") = a V_1 + b V_2 - c V_3 $
waarbij de coëfficiënten afhangen van de weerstandsverhoudingen. Dit is een *MISO-systeem* (Multiple Input, Single Output).

#figure(
  image("actieve filters 3.png", width: 12cm),
  caption: [Integrator en differentiator],
  label: <fig:actieve-filters-3>,
)

*Integrator (inverterend)*: Vervang $R_b$ door een condensator $C$. De impedantie van de feedback wordt $Z_C = 1/(s C)$:
$ H(s) = -Z_C / R = -1 / (s R C) $
Dit is een *integrator* — laagdoorlaat met oneinige DC-versterking. In het tijdsdomein: $v_("out")(t) = -1/(R C) integral v_("in")(t) d t$.

*Differentiator (inverterend)*: Vervang $R_a$ door een condensator $C$. De impedantie van de ingang wordt $Z_C = 1/(s C)$:
$ H(s) = -(s R C) $
Dit is een *differentiator* — hoogdoorlaat. In het tijdsdomein: $v_("out")(t) = -R C (d v_("in")(t))/(d t)$.



#oefening(title: "Hoogfilter + laag filter = Bandpass")[
  #figure(
    image("hoog+laagfilter = bandpass.png", width: 10cm),
    caption: [hoog+laagfilter = bandpass],
    label: <fig:hoog-laagfilter-bandpass>,
  )

  Dit circuit bestaat uit twee *niet-inverterende op-amp schakelingen* in cascade. We splitsen het op en lossen elk deel apart op via KCL bij de $+$ en $-$ terminal.

  #text(size: 1.2em)[*Deel 1: Hoogdoorlaat filter (bovenste circuit)*]

  #line(length: 100%)


  $C_B$ in serie en $R_B$ naar ground vormen een HP-filter aan de $+$ ingang. $R_1$ en $R_f$ bepalen de versterking.

  *KCL bij $V_+$* — stromen die $V_+$ verlaten:
  $ underbrace((V_+ - V_i) dot s C_B, "door" C_B) + underbrace(V_+ / R_B, "door" R_B) = 0 $

  $ V_+ (s C_B + 1/R_B) = V_i dot s C_B $

  $ arrow.r.double V_+ = V_i dot (s R_B C_B) / (s R_B C_B + 1) $

  *KCL bij $V_-$* — stromen die $V_-$ verlaten:
  $ underbrace(V_- / R_1, "door" R_1) + underbrace((V_- - V_1) / R_f, "door" R_f) = 0 $

  $ V_- (1/R_1 + 1/R_f) = V_1 / R_f $

  $ arrow.r.double V_- = V_1 dot R_1 / (R_1 + R_f) $

  *Virtuele short* $V_+ = V_-$:
  $ V_i dot (s R_B C_B) / (s R_B C_B + 1) = V_1 dot R_1 / (R_1 + R_f) $

  $ arrow.r.double H_1(s) = V_1 / V_i = (1 + R_f / R_1) dot (s R_B C_B) / (s R_B C_B + 1) $

  Dit is een *hoogdoorlaat* met versterking $(1 + R_f / R_1)$ en cut-off $omega_(c 1) = 1 / (R_B C_B)$.

  #text(size: 1.2em)[*Deel 2: Laagdoorlaat filter (onderste circuit)*]

  #line(length: 100%)

  $R_A$ in serie en $C_A$ naar ground vormen een LP-filter aan de $+$ ingang. $R_1$ en $R_f$ bepalen de versterking.

  *KCL bij $V_+$* — stromen die $V_+$ verlaten:
  $ underbrace((V_+ - V_1) / R_A, "door" R_A) + underbrace(V_+ dot s C_A, "door" C_A) = 0 $

  $ V_+ (1/R_A + s C_A) = V_1 / R_A $

  $ arrow.r.double V_+ = V_1 / (s R_A C_A + 1) $

  *KCL bij $V_-$* — stromen die $V_-$ verlaten:
  $ underbrace(V_- / R_1, "door" R_1) + underbrace((V_- - V_o) / R_f, "door" R_f) = 0 $

  $ arrow.r.double V_- = V_o dot R_1 / (R_1 + R_f) $

  *Virtuele short* $V_+ = V_-$:
  $ V_1 / (s R_A C_A + 1) = V_o dot R_1 / (R_1 + R_f) $

  $ arrow.r.double H_2(s) = V_o / V_1 = (1 + R_f / R_1) dot 1 / (s R_A C_A + 1) $

  Dit is een *laagdoorlaat* met versterking $(1 + R_f / R_1)$ en cut-off $omega_(c 2) = 1 / (R_A C_A)$.

  #text(size: 1.2em)[*Totale transferfunctie*]
  #line(length: 100%)

  Beide in serie $arrow.r$ vermenigvuldigen:
  $ H(s) = H_1(s) dot H_2(s) = (1 + R_f / R_1)^2 dot (s R_B C_B) / ((s R_B C_B + 1)(s R_A C_A + 1)) $

  *Frequentierespons* — vervang $s = j omega$:

  $
    |H(j omega)| = (1 + R_f / R_1)^2 dot (omega R_B C_B) / (sqrt(1 + (omega R_B C_B)^2) dot sqrt(1 + (omega R_A C_A)^2))
  $

  - $lim_(omega -> 0) |H| = 0$ — lage frequenties geblokkeerd (HP)
  - $omega_(c 1) < omega < omega_(c 2)$: $|H| approx (1 + R_f / R_1)^2$ — doorlaatband
  - $lim_(omega -> infinity) |H| = 0$ — hoge frequenties geblokkeerd (LP)

  *Bode magnitude plot*

  #figure(
    cetz.canvas({
      import cetz.draw: *

      plot.plot(
        size: (12, 6),
        x-label: $log(omega)$,
        y-label: [dB],
        x-tick-step: 1,
        y-tick-step: 5,
        y-min: -25,
        y-max: 5,
        x-min: -1,
        x-max: 5,
        {
          // Asymptotisch bode-diagram bandpass
          plot.add(
            style: (stroke: blue + 1.5pt),
            label: [Asymptotisch],
            ((-1, -40), (1, 0), (3, 0), (5, -40)),
          )
          // Werkelijke curve |H(jω)| bandpass (HP × LP)
          plot.add(
            domain: (-1, 5),
            samples: 300,
            style: (stroke: (paint: red, thickness: 1pt, dash: "dashed")),
            label: [Exact],
            x => {
              let w_ratio_hp = calc.pow(10, x - 1) // ω / ω_c1
              let w_ratio_lp = calc.pow(10, x - 3) // ω / ω_c2
              let hp = -10 * calc.log(1 + 1 / calc.pow(w_ratio_hp, 2), base: 10)
              let lp = -10 * calc.log(1 + calc.pow(w_ratio_lp, 2), base: 10)
              hp + lp
            },
          )
          // -3 dB referentielijn
          plot.add-hline(-3, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
          // Cut-off frequenties
          plot.add-vline(1, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
          plot.add-vline(3, style: (stroke: (paint: gray, thickness: 0.5pt, dash: "dashed")))
        },
      )
      content((5.8, 2.5), text(fill: blue, size: 8pt)[$omega_(c 1)$])
      content((10, 2.5), text(fill: blue, size: 8pt)[$omega_(c 2)$])
      content((3.5, 4.5), text(fill: red, size: 8pt)[$+20 "dB/dec"$])
      content((11, 4.5), text(fill: red, size: 8pt)[$-20 "dB/dec"$])
    }),
    caption: [Bode magnitude plot van de bandpass filter],
  )
]




