#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/4.strain_gages_part1.pdf (+ slide 9 van deel 2) | Samenvatting DAQ p.13
//       Samenvatting 1ste versie p.1-2 | examenvragen 2016, 2019, 25-26

= Rekstroken deel 1 <ch:rekstroken-1>

Een *rekstrook* (strain gage) meet hoeveel een materiaal uitrekt of inkrimpt. Het is een dunne draad of folie (bv. $25 thin mu"m"$) die op het materiaal wordt gelijmd. Rekt het materiaal, dan rekt de draad mee en verandert zijn weerstand.

== Werking <sec:rekstrook-werking>

De weerstand van een draad volgt uit de wet van Pouillet:

$ R = (rho L) / A $

met:
- $rho$ --- soortelijke weerstand van het materiaal [$Omega$m]
- $L$ --- lengte van de draad [m]
- $A$ --- doorsnede van de draad [m²]

Rekt de draad uit, dan verandert de weerstand door *drie effecten*:
+ de *lengte* $L$ neemt toe, dus $R$ stijgt;
+ de *diameter* $D$ neemt af, dus $A$ daalt en $R$ stijgt;
+ het *piëzoresistieve effect*: de soortelijke weerstand $rho$ zelf verandert door de mechanische spanning in het materiaal.

Een rekstrook moet in het *elastische gebied* blijven. Daar is de rek evenredig met de spanning, en na het ontlasten keert het materiaal terug naar zijn oorspronkelijke vorm.

#figure(
  image("assets/L4-spanning-rek.png", width: 8cm),
  caption: [Spanning-rekdiagram: de rekstrook werkt in het lineaire elastische gebied, onder de vloeigrens (slide 3)],
  label: <fig:L4-spanning-rek>,
)

== De gage factor <sec:gage-factor>

=== Afleiding <sec:gf-afleiding>

De *rek* is de relatieve verlenging $epsilon = (d L) \/ L$. Bij uitrekken wordt de draad ook dunner. Hoeveel, zegt de *constante van Poisson* $nu$:

$ nu = - ((d D) \/ D) / ((d L) \/ L) $

met:
- $nu$ --- constante van Poisson [-]
- $D$ --- diameter van de draad [m]

*Stap 1 --- differentieer $R = rho L \/ A$.* Een kleine verandering van elk van de drie factoren geeft
$ (d R) / R = (d rho) / rho + (d L) / L - (d A) / A $

*Stap 2 --- de doorsnede.* $A$ hangt van de diameter in het kwadraat af ($A = pi D^2 \/ 4$), dus
$ (d A) / A = 2 (d D) / D = -2 nu epsilon $

*Stap 3 --- invullen en delen door $epsilon$.* Zo vind je de *gage factor* (GF), de gevoeligheid van de rekstrook:

#frm(
  "Gage factor",
  $"GF" = ((d R) \/ R) / ((d L) \/ L) = 1 + 2 nu + ((d rho) \/ rho) / ((d L) \/ L)$,
  [$1$ = langer, $2 nu$ = dunner, de laatste term = piëzoresistief effect.],
)

met:
- $"GF"$ --- gage factor [-]
- $(d R) \/ R$ --- relatieve weerstandsverandering [-]
- $(d L) \/ L = epsilon$ --- rek [-], vaak in microstrain: $1 thin mu epsilon = 10^(-6)$

Kennen we GF en meten we $d R \/ R$, dan volgt de rek meteen: $epsilon = (d R \/ R) \/ "GF"$. De relatieve weerstandsverandering is dus *evenredig* met de relatieve verlenging.

=== Grenzen van $nu$ <sec:poisson-grenzen>

Bij het uitrekken verandert ook het volume. Met dezelfde benadering (kleine $epsilon$, $(nu epsilon)^2 approx 0$) volgt
$ d V = A L epsilon (1 - 2 nu) $

Het volume kan bij uitrekken niet afnemen, dus $0 <= nu <= 0.5$. Een *vloeistof* is onsamendrukbaar: $d V = 0$, dus $nu = 0.5$.

#examenvraag("2019 vraag 3, 25-26 vraag 14", [De gage factor van vloeistoffen is ...],
  opties: ([$0.5$], [$0$], [$2$], [$1$]),
  juist: "C",
)[Een vloeistof heeft $nu = 0.5$ en geen piëzoresistief effect ($d rho = 0$). Dan is $"GF" = 1 + 2 dot 0.5 + 0 = 2$. Een metaalfolie komt ook op ongeveer $2$ uit, maar via een andere weg: $nu approx 0.3$ geeft $1.6$, en het piëzoresistieve effect levert de rest.]

#examenvraag("juni 2016 vraag 2", [De gage factor ...],
  opties: (
    [neemt evenredig toe met de constante van Poisson],
    [neemt evenredig af met de constante van Poisson],
    [neemt toe, maar niet evenredig],
    [neemt af, maar niet evenredig],
  ),
  juist: "A",
)[In $"GF" = 1 + 2 nu + dots$ staat $nu$ in de eerste macht, met factor 2. Fysisch: een grotere $nu$ betekent dat de draad sterker dwars inkrimpt, dus dat $A$ meer daalt en $R$ extra stijgt.]

== Materialen <sec:gf-materialen>

#table(
  columns: (auto, auto, auto, auto),
  align: (left, left, center, center),
  table.header([*Materiaal*], [*Samenstelling*], [*GF*], [*Temp.coëff. [$10^(-5)$/°C]*]),
  [Constantan], [Ni45 Cu55], [2.1], [$plus.minus 2$],
  [Isoelastic], [Ni36 Cr8 (Mn,Si,Mo)4 Fe32], [3.52--3.6], [+17],
  [Karma], [Ni74 Cr20 Fe3 Cu3], [2.1], [+2],
  [Manganin], [Cu84 Mn12 Ni4], [0.3--0.47], [$plus.minus 2$],
  [Alloy 479], [Pt92 W8], [3.6--4.4], [+24],
  [Nikkel], [Ni100], [$-12$ tot $-20$], [670],
  [Nikkel-chroom], [Ni80 Cr20], [2.1--2.63], [10],
  [Silicium], [p-type], [100--170], [70 tot 700],
  [Silicium], [n-type], [$-100$ tot $-140$], [70 tot 700],
  [Germanium], [p-type], [102], [],
  [Germanium], [n-type], [$-150$], [],
)

Drie dingen vallen op:
- *Metalen* zitten rond $"GF" approx 2$ tot $4$: hier is de vormverandering ($1 + 2 nu$) de belangrijkste bijdrage.
- *Halfgeleiders* hebben een GF van $100$ en meer: het piëzoresistieve effect domineert. Een p-type geeft een positieve GF, een n-type een negatieve: de weerstand *daalt* dan bij rek.
- Halfgeleiders zijn wel veel *temperatuurgevoeliger*. Constantan is net populair omdat zijn temperatuurcoëfficiënt bijna nul is.

Ook de gage factor zelf hangt van de temperatuur af, typisch $0.01 %"/K"$ ($100 "ppm/K"$). Dat effect is meestal te verwaarlozen, behalve in zeer nauwkeurige meetsystemen.

#examenvraag("juni 2016 vraag 4", [De gage factor van rekstrookjes ...],
  opties: (
    [is nooit 0],
    [is nooit groter dan 2],
    [is onafhankelijk van de temperatuur],
    [kan negatief zijn],
  ),
  juist: "D",
)[Een n-type halfgeleider heeft een GF van $-100$ tot $-140$ (en nikkel $-12$ tot $-20$). B is fout: halfgeleiders halen meer dan $100$. C is fout: de GF heeft zelf een temperatuurcoëfficiënt.]

#examenvraag("2016 vraag 18", [De gage factor ...],
  opties: (
    [is nooit negatief],
    [is nooit nul],
    [is nooit groter dan 2],
    [is onafhankelijk van de temperatuur],
  ),
  juist: "B",
)[De andere drie zijn aantoonbaar fout (zie de vorige vraag). Let op: in deze versie staat "kan negatief zijn" niet tussen de opties, dus blijft "nooit nul" over.]
