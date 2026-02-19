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
  image("mechanics en electronisch.png", width: 8cm),
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

      let w = 10
      let h = 5

      // Axes
      line((0, 0), (w, 0), stroke: 0.8pt, mark: (end: ">", fill: black))
      line((0, -0.5), (0, h), stroke: 0.8pt, mark: (end: ">", fill: black))

      // Axis labels
      content((w + 0.3, -0.2), $omega$)
      content((-0.6, h - 0.2), [dB])

      // Horizontal grid
      for y in (1, 2, 3, 4) {
        line((0, y), (w, y), stroke: (paint: luma(200), thickness: 0.3pt))
      }

      // dB labels
      content((-0.6, 4), [0])
      content((-0.8, 2.6), [-3])

      // 0 dB flat region
      line((0, 4), (4, 4), stroke: (paint: blue, thickness: 1.5pt))

      // -3 dB point
      circle((4, 2.6), radius: 0.1, fill: red, stroke: red)

      // Roll-off -20 dB/decade
      line((4, 2.6), (9, 0.2), stroke: (paint: blue, thickness: 1.5pt))

      // Cut-off frequency marker
      line((4, 0), (4, 2.6), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      content((4, -0.5), text(fill: blue)[$1 slash (R C)$])

      // -20 dB/decade label
      content((7, 2), text(fill: red, size: 9pt)[-20 dB/decade])

      // Dashed line at -3 dB
      line((0, 2.6), (4, 2.6), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
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

      let w = 10
      let h = 5

      // Axes
      line((0, 0), (w, 0), stroke: 0.8pt, mark: (end: ">", fill: black))
      line((0, -0.5), (0, h), stroke: 0.8pt, mark: (end: ">", fill: black))

      // Axis labels
      content((w + 0.3, -0.2), $omega$)
      content((-0.6, h - 0.2), [dB])

      // Horizontal grid
      for y in (1, 2, 3, 4) {
        line((0, y), (w, y), stroke: (paint: luma(200), thickness: 0.3pt))
      }

      // dB labels
      content((-0.6, 4), [0])
      content((-0.8, 2.6), [-3])

      // +20 dB/decade rise region
      line((1, 0.2), (6, 2.6), stroke: (paint: blue, thickness: 1.5pt))

      // -3 dB point
      circle((6, 2.6), radius: 0.1, fill: red, stroke: red)

      // 0 dB flat region (high frequencies pass)
      line((6, 4), (w, 4), stroke: (paint: blue, thickness: 1.5pt))

      // Cut-off frequency marker
      line((6, 0), (6, 2.6), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      content((6, -0.5), text(fill: blue)[$1 slash (R C)$])

      // +20 dB/decade label
      content((3, 2.2), text(fill: red, size: 9pt)[+20 dB/decade])

      // Dashed line at -3 dB
      line((0, 2.6), (6, 2.6), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
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

