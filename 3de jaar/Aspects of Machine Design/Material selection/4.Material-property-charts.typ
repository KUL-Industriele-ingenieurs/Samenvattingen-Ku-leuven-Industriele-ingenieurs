#import "../../../school-template.typ": *

= Material property charts <ch:charts>

== Combinaties van eigenschappen <sec:combinaties>

Je zoekt zelden op één eigenschap. Meestal zoek je een *combinatie van eigenschappen*. Drie voorbeelden van de slides:
- *stijfheidsbeperkt ontwerp met lage massa*: $E$ en $rho$. Een voorbeeld is de bodemplaat van een racewagen: licht, maar ze mag niet veel doorbuigen;
- *warmtewisselaar*: warmtegeleiding $lambda$ en corrosiebestendigheid;
- *veer*: sterkte en taaiheid.

== Bar charts en property charts <sec:bar-property>

Een *bar chart* zet één eigenschap uit per materiaal, gegroepeerd per familie (zie @sec:dichtheid).

#figure(image("assets/Bar-chart-E-modulus.png", width: 10cm), caption: [Bar chart: één eigenschap ($E$) per materiaal.])
 Een *material property chart* of *Ashby-grafiek* zet twee eigenschappen tegen elkaar uit. Elke familie vormt een gekleurd ovaal. De naam komt van prof. Ashby (Cambridge), die de systematische procedure opstelde.

#figure(
  image("assets/Modulus-density-chart.png", width: 9cm),
  caption: [Ashby-grafiek van de elasticiteitsmodulus $E$ tegenover de dichtheid $rho$.],
  label: <fig:e-rho>,
)

*Waarom dubbellogaritmisch?* De assen zijn bewust logaritmisch:
- Op lineaire assen worden de ovalen extreem uitgerekt en zijn ze niet meer te herkennen.
- Een machtsfunctie zoals $E^(1 slash 3) slash rho = C$ wordt op log-log-assen een *rechte*. De helling van die rechte heb je nodig in de rankingstap (@sec:grafisch).

== Modulus–dichtheid <sec:modulus-dichtheid>

De $E$–$rho$-grafiek gebruik je bij stijfheidsbeperkte ontwerpen met minimale massa. De gestippelde *guidelines* (hellingen 1, 2 en 3) zijn lijnen waarop materialen even goed presteren bij een minimale massa. Welke helling je kiest, hangt af van de vorm van het onderdeel (trekstang, balk of plaat, zie @sec:mi). Hoe verder je zo'n lijn naar *linksboven* verschuift, hoe lichter en stijver het materiaal.

#figure(
  image("assets/Modulus-density-chart-detail.png", width: 10cm),
  caption: [Gedetailleerde $E$–$rho$-grafiek met subklassen en guidelines voor minimale massa.],
  label: <fig:e-rho-detail>,
)

Waar een familie op de grafiek ligt, volgt uit @sec:matrix. De dichtheid komt vooral uit het atoomgewicht, de modulus uit de bindingsstijfheid en de bindingsdichtheid.

== Eigenschappen manipuleren <sec:manipuleren>

Dit deel en de rest van het hoofdstuk zijn nog niet in de les besproken. De tekst volgt de slides.

$E$ en $rho$ veranderen op drie manieren:
- *Samenstelling*: de aard van de binding en de pakking (ionair, covalent, waterstof).
  - *Kristallijne materialen* (metalen, keramiek): metaalbinding tegenover ionaire of covalente bindingen. Hun ovalen zijn klein, want ze zijn weinig gevoelig voor de microstructuur.
  - *Polymeren en elastomeren*: C-ketens met waterstofbruggen. Crosslinking en de kristalliniteit spelen mee.
- *Microstructuur*: bv. de verhouding amorf/kristallijn.
- *Architectuur*: hoe je materialen combineert tot hybriden.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Samenstelling-kristal.png", width: 100%), caption: [Kristallijn: ionair/covalent (bv. MgO).]),
  figure(image("assets/Samenstelling-polymeerbindingen.png", width: 100%), caption: [Polymeer: covalente ketens met zwakke waterstofbruggen.]),
  figure(image("assets/Samenstelling-amorf-kristallijn.png", width: 100%), caption: [Amorfe en kristallijne zones.]),
)
#figure(image("assets/Chart-samenstelling.png", width: 9cm), caption: [Invloed van samenstelling en microstructuur op de $E$–$rho$-grafiek.])


*Composieten* zijn "vast–vast hybriden". Hun modulus ligt tussen een boven- en een ondergrens:

#figure(image("assets/Chart-composieten.png", width: 7cm), caption: [Composiet: $E$ ligt tussen $E_l$ en $E_u$, tussen matrix en vezel.])

#frm("Grenzen voor de modulus van een composiet", $E_u = f E_f + (1 - f) E_m quad quad E_l = (f / E_f + (1 - f) / E_m)^(-1)$, [met: $E_u$, $E_l$ = boven- en ondergrens [GPa], $f$ = volumefractie vezels [-], $E_f$ = modulus van de vezels [GPa], $E_m$ = modulus van de matrix [GPa]])

*Schuimen* zijn "vast–lucht hybriden". Hun modulus daalt kwadratisch met de relatieve dichtheid:

#figure(image("assets/Chart-schuimen.png", width: 7cm), caption: [Schuim: bij een relatieve dichtheid van 0,1 daalt $E$ met een factor 100.])

#frm("Modulus van een schuim", $E_"foam" / E_"solid" = (rho_"foam" / rho_"solid")^2$, [met: $E$ = elasticiteitsmodulus [GPa], $rho$ = dichtheid [kg/m³] van het schuim en van het volle materiaal])

== Andere property charts <sec:andere-charts>

#table(
  columns: (auto, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Grafiek*], [*Wat toont ze*],
  [Sterkte–dichtheid], [welk materiaal de hoogste sterkte per massa heeft],
  [Modulus–sterkte], [contouren met een constante vloei- of breukrek $sigma_f slash E$],
  [Specifieke modulus–specifieke sterkte], [$E slash rho$ tegenover $sigma_f slash rho$; gebruikt in de luchtvaart],
  [Breuktaaiheid–modulus], [$K_(1c)$ tegenover $E$],
  [Breuktaaiheid–sterkte], [met $d_y = K_(1c)^2 slash (pi sigma_f^2)$: de grootte van de plastische zone aan de scheurtip],
  [Verliescoëfficiënt–modulus], [demping $eta$ tegenover $E$],
  [Warmtegeleiding–elektrische resistiviteit], [metalen volgen de wet van Wiedemann–Franz: $lambda prop 1 slash rho_e$],
  [Warmtegeleiding–thermische diffusiviteit], [$lambda$ tegenover $a = lambda slash (rho c_p)$],
  [Uitzetting–warmtegeleiding], [uitzettingscoëfficiënt $alpha = (dif l) slash (l dif T)$ tegenover $lambda$],
  [Maximale gebruikstemperatuur], [bar chart van $T_max$; daarboven wordt het materiaal onbruikbaar],
  [Wrijving en slijtage], [constante van Archard $k_a$ tegenover de hardheid $H$. De maximale contactdruk is $P_max = C H$, met $C$ een constante],
  [Kost], [bar charts van de prijs per kg en per volume],
)

#figure(image("assets/Chart-samenstelling-microstructuur-architectuur.png", width: 10cm), caption: [Overzicht: samenstelling, microstructuur en architectuur bepalen waar een materiaal ligt.])

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Chart-sterkte-dichtheid.png", width: 100%), caption: [Sterkte–dichtheid]),
  figure(image("assets/Chart-modulus-sterkte.png", width: 100%), caption: [Modulus–sterkte]),
  figure(image("assets/Chart-specifiek.png", width: 100%), caption: [Specifieke modulus–specifieke sterkte]),
)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Chart-K1c-E.png", width: 100%), caption: [Breuktaaiheid–modulus]),
  figure(image("assets/Chart-K1c-sterkte.png", width: 100%), caption: [Breuktaaiheid–sterkte]),
  figure(image("assets/Chart-verlies-E.png", width: 100%), caption: [Verliescoëfficiënt–modulus]),
)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Chart-lambda-rhoe.png", width: 100%), caption: [Warmtegeleiding–resistiviteit]),
  figure(image("assets/Chart-lambda-a.png", width: 100%), caption: [Warmtegeleiding–diffusiviteit]),
  figure(image("assets/Chart-alpha-lambda.png", width: 100%), caption: [Uitzetting–warmtegeleiding]),
)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Chart-Tmax.png", width: 100%), caption: [Maximale gebruikstemperatuur]),
  figure(image("assets/Chart-slijtage-hardheid.png", width: 100%), caption: [Slijtage–hardheid]),
  figure(image("assets/Chart-kost-kg.png", width: 100%), caption: [Prijs per kg]),
)
#grid(
  columns: (1fr),
  gutter: 10pt,
  figure(image("assets/Chart-kost-volume.png", width: 100%), caption: [Prijs per volume]),
)
#figure(image("assets/Wrijving-ruwheid.png", width: 6cm), caption: [Wrijving: het echte contactoppervlak $A_r$ is veel kleiner dan het nominale $A_n$.])
