#import "../../school-template.typ": *

= 3-phase transformator <ch:3-phase-transformator>

Alles dat we hiervoor geleerd hebben over het #keyterm[versimpeld model] van transformatoren geldt ook voor #keyterm[3-phase transformatoren]. Het enige verschil is dat we nu 3 transformatoren hebben in plaats van 1.

== 3-fase herhaling <sec:3-fase-herhaling>

Dit hebben we al gezien in wisselstromen en wordt ook nog herhaald in netten. Maar het is belangrijk om goed te snappen voor 3-fase transformatoren.

=== WYE connectie <sec:wye-connectie>

#wrap-figure(
  image("WYE-connectie.png", width: 10cm),
  caption: [WYE-connectie],
  label: <fig:WYE-connectie>,
)[
  Een #keyterm[wye connectie] (of *sterverbinding*) kenmerkt zich door een centraal *sterpunt* (de *neutraal*) waar de drie fasewikkelingen samenkomen.

  - *Voltage tot de neutraal* (#keyterm[fasespanning], $V_f$ of $V_"LN"$): De spanning gemeten over één wikkeling, tussen een fase en het *sterpunt*.
  - *Lijn voltage* (#keyterm[lijnspanning], $V_l$ of $V_"LL"$): De spanning gemeten tussen twee actieve lijnen/fasen.

  In een #keyterm[gebalanceerd systeem] zijn de verhoudingen tussen lijn- en fasewaarden als volgt:

  #align(center)[
    #table(
      columns: 2,
      align: left,
      [*Grootheid*], [*Verband*],
      [Spanning], [$V_l = sqrt(3) dot V_f$],
      [Stroom], [$I_l = I_f$],
    )
  ]

  Hierbij is $I_l$ de #keyterm[lijnstroom] en $I_f$ de #keyterm[fasestroom] door de wikkeling. Omdat de wikkeling in serie staat met de lijn, stroomt alle lijnstroom direct de wikkeling in ($I_l = I_f$). Voor de spanning geldt dat de lijnspanning de *vectoriële som* in het driefasensysteem is van twee fasespanningen, wat de factor $sqrt(3)$ in grootte en een *faseverschuiving* van $30°$ verklaart.
]


=== Delta connectie <sec:delta-connectie>

#wrap-figure(
  image("Delta-connectie.png", width: 10cm),
  caption: [Delta-connectie],
  label: <fig:Delta-connectie>,
)[
  Een #keyterm[delta connectie] (of *driehoeksverbinding*) kenmerkt zich doordat de drie fasewikkelingen in een *gesloten lus* staan. Elke wikkeling is aangesloten tussen twee actieve lijnen, hierdoor is er geen *neutraal* nodig of aanwezig.

  - #keyterm[Fasespanning] ($V_f$): De spanning gemeten over één wikkeling.
  - *Lijn voltage* (#keyterm[lijnspanning], $V_l$ of $V_"LL"$): De spanning gemeten tussen twee actieve lijnen/fasen.

  In een #keyterm[gebalanceerd systeem] zijn de verhoudingen tussen lijn- en fasewaarden als volgt:

  #align(center)[
    #table(
      columns: 2,
      align: left,
      [*Grootheid*], [*Verband*],
      [Spanning], [$V_l = V_f$],
      [Stroom], [$I_l = sqrt(3) dot I_f$],
    )
  ]

  Hierbij is $I_l$ de #keyterm[lijnstroom] en $I_f$ de #keyterm[fasestroom] door de wikkeling. Omdat de wikkeling direct en uitsluitend tussen twee lijnen hangt, is de spanning over de wikkeling precies de lijnspanning ($V_l = V_f$). Voor de stroom geldt echter dat de stroom vanuit een lijn zich op het *knooppunt* verdeelt over twee fasewikkelingen. Vectorieel gezien is de lijnstroom het *verschil* van twee fasestromen, wat resulteert in een factor $sqrt(3)$ in de stroomgrootte en een *faseverschuiving* van $30°$.
]


