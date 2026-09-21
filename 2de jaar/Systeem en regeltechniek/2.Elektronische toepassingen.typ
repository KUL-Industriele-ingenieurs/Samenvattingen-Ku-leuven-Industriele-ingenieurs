#import "../../school-template.typ": *

// ============================================================================
//  W3 (SYS) — Elektronische toepassingen
//  Slides: 2.SYSCON_slides_02_electronic_applications
//  Structuur-skelet. Oude versie: _OLD/2.electronic_applications.typ
// ============================================================================

= Elektronische toepassingen <ch:elektronische-toepassingen>


// eerst introductie over de inhoud van de les, herhaling van de vorige les en hoe dit vervolgt in deze les.

Nu hebben we de basis behandeld van systeemtheorie. we gaan nu kijken naar hoe we systemen kunnen implementeren in de praktijk. Hierbij bekijken we eerst elektronische-toepassingen.

een transferfunctie toont hoe een systeem zich gedraagt waarbij je een relatie hebt tussen input en output. Zie het circuit hieronder:

#figure(
  image("assets/Simpel Circuit.png", width: 5cm),
  caption: [Simpel Circuit],
  label: <fig:Simpel-Circuit>,
)

Waarbij $H(s) = frac(V_"out", V_"in")$ de transferfunctie is van het circuit.

We weten natuurlijk dat dit een simpele spanningsdeler is waarbij

$ V_"in" = Z_1 + Z_2 dot I $ $ V_"out" = Z_2 dot I $

Dit maakt dat we de transferfunctie kunnen berekenen als volgt:

$ H(s) = frac(V_"out", V_"in") = frac(Z_2, Z_1 + Z_2) $

Wat we eigenlijk nu gedaan hebben is ons circuit omzetten naar een transferfunctie. Waarbij we de laplace tranformatie hebben genomen van $V_"in"$ en $V_"out"$.

We kunnen dus elektrische circuits naar laplace omzetten en zo hebben we een veel beter beeld van het systeem en is het veel makkelijker rekenen.

== Filters <sec:filters>

Elektrinische circuit geven ons de kracht om filters te maken. Met filers kun je bepaalde signalen doorlaten of blokkeren. Stel je hebt enorm veel achtergrond ruis op een lage frequentie, dan maak je een high pass filter die de lage frequenties blokkeert en de hoge frequenties doorlaat.

#figure(
  image("assets/Filtes.png", width: 15cm),
  caption: [Filters],
  label: <fig:Filtes>,
)


=== Passieve vs. actieve filters <sec:passieve-actieve-filters>

Filters bouw je op twee manieren, afhankelijk van welke bouwelementen je gebruikt:

/ Passieve filters: Enkel *passieve* componenten — weerstanden ($R$), spoelen
  ($L$) en condensatoren ($C$). Ze hebben *geen voeding* nodig en kunnen het
  signaal *niet versterken*: de uitgang is altijd kleiner dan of gelijk aan de
  ingang (versterking $|H| <= 1$). Eenvoudig en goedkoop, maar het signaal
  verzwakt en de filter wordt "belast" door wat erachter hangt.

/ Actieve filters: Combineren passieve componenten met een *actief* element,
  meestal een *operationele versterker (op-amp)*. Die heeft een externe *voeding*
  nodig en kan daardoor het signaal *versterken* ($|H| > 1$ mogelijk). Bovendien
  ontkoppelt de op-amp de filter van de volgende trap, zodat schakelingen elkaar
  niet beïnvloeden.

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    inset: 0.7em,
    align: (left + horizon, left + horizon, left + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("f2f2f2") } else { none },
    table.header([*Eigenschap*], [*Passief*], [*Actief*]),
    [Componenten], [$R$, $L$, $C$], [$R$, $C$ + op-amp],
    [Voeding nodig?], [Nee], [Ja (op-amp)],
    [Versterking], [$|H| <= 1$ (verzwakt)], [$|H| > 1$ mogelijk],
    [Belasting volgende trap], [Beïnvloedt de filter], [Ontkoppeld (buffer)],
    [Complexiteit / kost], [Laag], [Hoger],
    [Typisch gebruik], [Hoge frequenties, vermogen], [Lage frequenties, signaalverwerking],
  ),
  caption: [Passieve vs. actieve filters in een notendop.],
) <fig:passief-vs-actief>

In beide gevallen blijft de aanpak dezelfde. We zetten het circuit om naar het
*Laplace-domein* en bepalen de transferfunctie $H(s)$ die het frequentiegedrag
beschrijft.

== Elektrische Circuits in Laplace-domein <sec:elektrische-circuits-in-laplace-domein>

Ik heb daarnet getoont dat we onze elektrische circuits kunnen omzetten naar laplace.

We maken eigenlijk een transferfunctie van de weerstanden van het circuit want we weten dat die uiteindelijk de spanning en dus het signaal gaan vervormen.

#figure(
  image("assets/Passieve & Actieve Filters.png", width: 12cm),
  caption: [Passieve & Actieve Filters],
  label: <fig:Passieve-Actieve-Filters>,
)

Elk bouwelement heeft in de tijd een $v$–$i$-verband. Via de rekenregels van
Laplace ($dif slash dif t arrow.r s$ en $integral dif t arrow.r 1 slash s$) wordt
dat telkens een *gewone vermenigvuldiging* $V(s) = Z(s) dot I(s)$, met $Z(s)$ de
*impedantie* — de "weerstand" van het element in het Laplace-domein.

#figure(
  table(
    columns: (auto, 1.4fr, 1.4fr, 1fr),
    inset: 0.7em,
    align: (left + horizon, center + horizon, center + horizon, center + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("f2f2f2") } else { none },
    table.header([*Element*], [*Tijdsdomein* $v(t)$], [*Laplace* $V(s)$], [*Impedantie* $Z(s)$]),
    [Weerstand $R$], [$v = R med i$], [$V(s) = R med I(s)$], [$R$],
    [Spoel $L$], [$v = L dv(i, t)$], [$V(s) = s L med I(s)$], [$s L$],
    [Condensator $C$], [$v = 1/C integral i dif t$], [$V(s) = frac(1, s C) I(s)$], [$frac(1, s C)$],
  ),
  caption: [De $v$–$i$-relaties in de tijd worden in het Laplace-domein simpele vermenigvuldigingen $V(s) = Z(s) I(s)$.],
) <fig:impedanties>

In het Laplace-domein gedraagt elk element zich dus als een "weerstand" $Z(s)$:
je kan de wet van Ohm en de regels voor serie-/parallelschakeling rechtstreeks
toepassen, en zo van het hele circuit één transferfunctie maken.

Hieronder een vergelijking waarbij je twee 2de orde systemen hebben een *mechanisch* en een *elektrisch* systeem. Het mechanische systeem is een massa-veer-dempersysteem en het elektrische systeem is een RLC-circuit.

#figure(
  image("assets/Mechanisch & Elektrisch systeem .png", width: 13cm),
  caption: [Mechanisch & Elektrisch systeem ],
  label: <fig:Mechanisch-Elektrisch-systeem>,
)


== Filter analyse <sec:filter-analyse>

// nu dat we filter hebben gezien en mechanische vergelijking met elektrisch systeem ga ik uitleggen hoe je een filter analyseerd gefocused op actieve filters met een op-amp. We gaan kijken naar de transferfunctie van een actief filter en hoe we die kunnen analyseren. met uitieindelijkk het begin van een bode plot met uitlag dat je dit nog niet moet snappen en we gaan dit in de volgende les verder uitdiepen.

