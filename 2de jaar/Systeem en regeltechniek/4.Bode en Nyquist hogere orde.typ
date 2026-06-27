#import "../../school-template.typ": *

// ============================================================================
//  W5 (SYS) — Bode- en Nyquistplots voor hogere-orde systemen
//  Slides: 4.SYSCON_slides_04
//  Structuur-skelet. Oude versie: _OLD/4.Bode Plots.typ
// ============================================================================

= Bode- en Nyquistplots voor hogere-orde systemen <ch:bode-nyquist-hogere-orde>


== Hoger orde bode plots <sec:hoger-orde-bode-plots>

// kort gedeeltde over hoe meedere orde bode plots eruit zien waarbij we polen en nullen hun effecten op bode plot met elkaar combineren. We gaan ook kijken naar hoe we een bode plot kunnen tekenen van een gegeven transferfunctie met polen en nullen.

=== Voorbeeldoefening

*Gegeven:*

$ H(s) = frac(1+5s, s(1+10s) ) $

*Gevraagd:*
1. vind DC gainm poles en nullen
2. Bepaal de amplitude over meedere frequenties en teken de amplitude bode plots
3. Teken de asymptoten

*Oplossing:*



== Samenvatting alle bode plot teken regels <sec:samenvatting-bode-plot-teken-regels>

Elke transferfunctie is een *product* van eenvoudige bouwstenen (polen en nullen,
eventueel in de oorsprong, plus een tijdsvertraging). Omdat de Bode-plot met
*decibels* en *fase* werkt, mag je die bouwstenen gewoon *optellen*: teken per
factor de asymptoten en tel ze grafisch op. Onderstaande tabel vat de regels per
bouwsteen samen.

#figure(
  table(
    columns: (1.3fr, 2fr, 2fr),
    inset: 0.6em,
    align: (left + horizon, left + horizon, left + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("1f4e79") } else { none },
    table.header(
      text(fill: white)[*Systeem*],
      text(fill: white)[*Amplitude (magnitude)*],
      text(fill: white)[*Fase*],
    ),

    [*Pool in oorsprong* \ $H(s) = 1 / (tau s)$],
    [$-20$ dB/dec; gaat door $0$ dB bij $omega = 1 slash tau$.],
    [Constant op $-90 degree$ voor alle $omega$.],

    [*Nul in oorsprong* \ $H(s) = tau s$],
    [$+20$ dB/dec; gaat door $0$ dB bij $omega = 1 slash tau$.],
    [Constant op $+90 degree$ voor alle $omega$.],

    [*Reële pool* \ $H(s) = K / (1 + tau s)$],
    [
      - laagfrequent: asymptoot op $0$ dB
      - hoogfrequent: asymptoot $-20$ dB/dec
      - knik (breekpunt) bij $omega = 1 slash tau$
    ],
    [
      - laag: $0 degree$, hoog: $-90 degree$
      - rechte lijn van $0.1 dot (1 slash tau)$ tot $10 dot (1 slash tau)$
    ],

    [*Reële nul* \ $H(s) = 1 + tau s$],
    [
      - laagfrequent: asymptoot op $0$ dB
      - hoogfrequent: asymptoot $+20$ dB/dec
      - knik bij $omega = 1 slash tau$
    ],
    [
      - laag: $0 degree$, hoog: $+90 degree$
      - rechte lijn van $0.1 slash tau$ tot $10 slash tau$
    ],

    [*Ondergedempte polen* \ $H(s) = frac(K_(d c) omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2)$],
    [
      - laag: $0$ dB, hoog: $-40$ dB/dec
      - knik bij $omega = omega_n$
      - *piek* bij $omega_n$ als $zeta < 0.7$
    ],
    [
      - laag: $0 degree$, hoog: $-180 degree$
      - lijn van $omega_n dot 10^(-zeta)$ tot $omega_n dot 10^(zeta)$
    ],

    [*Tijdsvertraging* \ $H(s) = e^(-t_d s)$],
    [Geen verandering ($0$ dB).],
    [
      - daalt lineair: fase $= -omega t_d$ rad $= -omega t_d dot 180 slash pi space degree$
      - op een log-as lijkt dit exponentieel te dalen
    ],
  ),
  caption: [Overzicht: hoe elke bouwsteen de amplitude- en fase-Bode-plot beïnvloedt.],
) <fig:bode-regels>

*Hoe gebruik je dit?* Schrijf $H(s)$ als een product van deze bouwstenen, teken
voor elke factor de amplitude- en fase-asymptoten, en tel ze op. De *breekpunten*
($omega = 1 slash tau$ of $omega = omega_n$) zijn telkens de frequenties waar een
asymptoot van helling verandert. Een handige controle: de totale helling op hoge
frequentie is $-20 dot (#h(0.1em) "aantal polen" - "aantal nullen") $ dB/dec.
