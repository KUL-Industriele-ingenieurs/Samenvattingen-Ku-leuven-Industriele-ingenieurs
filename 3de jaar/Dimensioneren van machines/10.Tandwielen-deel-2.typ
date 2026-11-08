#import "../../school-template.typ": *

// Opent een animatie (mp4 in assets/animaties/) via raw.githubusercontent.com
#let animatie(bestand, tekst) = link(
  "https://raw.githubusercontent.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs/MAIN/3de%20jaar/Dimensioneren%20van%20machines/assets/animaties/" + bestand,
)[*Animatie:* #tekst]

= Tandwielen deel 2 <ch:tandwielen-2>

// Bron: Slides/10.Tandwielen deel 2.DIMA.pdf (Roloff/Matek H20 & H21)

== Kinematische hoofdeis en vertandingsregel <sec:kinematische-hoofdeis>

Geef je de tanden een willekeurige vorm, dan verandert de overbrengingsverhouding $i$ tijdens één ingrijping. Bij het eerste, middelste en laatste contact ligt het contactpunt telkens op een andere straal. Dat geeft een *snelheidsrimpel* en een *koppelrimpel*.

#concept(title: "Vertandingsregel (kinematische hoofdeis)")[
  De normaal op de gemeenschappelijke raaklijn in het contactpunt C van de twee tandflanken gaat altijd door de pool P van de relatieve beweging (Kennedy), en P verschuift niet. Gevolg: een *constante overbrengingsverhouding*.
]

Twee tandprofielen voldoen aan deze regel: het *cycloïde profiel* en het *evolvente profiel*. Beide worden opgebouwd uit een kromme die ontstaat door te rollen.

== Krommen <sec:krommen>

- *Cycloïde* (orthocycloïde): de kromme die een punt op een cirkel beschrijft als die cirkel zonder slip over een vaste rechte rolt.
- *Epicycloïde*: een rolcirkel rolt zonder slip over de *buitenkant* van een vaste cirkel.
- *Hypocycloïde*: een rolcirkel rolt zonder slip over de *binnenkant* van een grotere vaste cirkel.
- *Evolvente*: een punt op een rechte die zonder slip over een vaste cirkel rolt. Je krijgt dezelfde kromme door een strak gespannen touw van een cilinder af te wikkelen. Die cirkel heet de *basiscirkel*. De raaklijn aan de evolvente staat altijd loodrecht op het touw.

== Cycloïde vertanding <sec:cycloide-vertanding>

Het profiel ontstaat door twee rolcirkels te laten rollen op en in de steekcirkels van het tandwielpaar. Elke flank bestaat uit twee stukken die in hetzelfde punt op de steekcirkel beginnen:

+ Een rolcirkel rolt *op* de steekcirkel. Een punt op de rolcirkel tekent een epicycloïde. Het stuk tussen steekcirkel en kopcirkel wordt de *kop* van de tand.
+ Een rolcirkel rolt *in* de steekcirkel en tekent een hypocycloïde. Het stuk tussen steekcirkel en voetcirkel wordt de *voet*.
+ Kop en voet samen vormen één flank. Spiegel je de flank en sluit je af met kop- en voetcirkel, dan heb je één tand. Die herhaal je $z$ keer.

Het tegenwiel maak je met *dezelfde twee rolcirkels*. De rolcirkel die de voet van wiel 1 tekent, tekent ook de kop van wiel 2. Daardoor passen die twee flanken altijd op elkaar. Het contactpunt loopt over de rolcirkels.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#figure(image("assets/L10-cycloide-rolcirkels.png", width: 100%), caption: [Twee rolcirkels op en in de steekcirkels (slide 11)]) <fig:L10-cycloide-rolcirkels>],
  [#figure(image("assets/L10-cycloide-flank.png", width: 100%), caption: [Kop (epicycloïde, rood) en voet (hypocycloïde, groen) vormen samen één tand]) <fig:L10-cycloide-flank>],
)

#animatie("L10-cycloide-profiel.mp4", [epicycloïde, hypocycloïde, opbouw van de tand en het tandwielpaar])

#table(
  columns: (1fr, 1fr),
  align: left,
  table.header([*Voordelen*], [*Nadelen*]),
  [Contact convex op concaaf: de bolle kop (epicycloïde) drukt op de holle voet (hypocycloïde). Het contactvlak is groter, dus minder slijtage en een hogere belastbaarheid.],
  [Moeilijk uitwisselbaar: een wiel past alleen bij een tegenwiel met dezelfde rolcirkels.],
  [Klein aantal tanden mogelijk (tot 3). De voet heeft geen ondergrens zoals de basiscirkel bij de evolvente.],
  [De asafstand moet exact kloppen. Schuift ze, dan rollen de steekcirkels niet meer op elkaar en gaat de normaal niet meer door een vaste pool.],
  [],
  [Moeilijk te maken: elke flank bestaat uit twee krommen die per tandaantal anders zijn. Wordt zeer zelden gebruikt.],
)

== Evolvente vertanding <sec:evolvente-vertanding>

Bij de evolvente vertanding is één evolvente het hele tandprofiel, voor zowel voet als kop. De straal $r_b$ van de basiscirkel bepaalt de vorm van de evolvente volledig.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#figure(image("assets/L10-evolvente-touw.png", width: 100%), caption: [Evolvente: strak touw afwikkelen van de basiscirkel. Elke roze lijn is een stand van het touw.]) <fig:L10-evolvente-touw>],
  [#figure(image("assets/L10-evolvente-geometrie.png", width: 100%), caption: [Evolvente als functie van de evolventehoek (slide 21)]) <fig:L10-evolvente-geometrie>],
)

Het afgewikkelde touw $|b c|$ is even lang als de boog op de basiscirkel, dus $tan alpha = |b c| slash |O c| = theta$. Daaruit volgt de *evolventefunctie* en de plaats van elk punt $b$ van de flank:

#frm(
  "Evolventefunctie",
  $ "inv"(alpha) = tan alpha - alpha $,
  [met: $alpha$ --- evolventehoek (drukhoek op straal $r$) [rad], $theta$ --- afgewikkelde hoek, $theta = tan alpha$ [rad]],
)

#frm(
  "Punt op de evolvente",
  $ x_b = r_b / (cos alpha) cos("inv"(alpha)) #h(2em) y_b = r_b / (cos alpha) sin("inv"(alpha)) $,
  [met: $r_b$ --- straal van de basiscirkel [mm], $r = r_b slash cos alpha$ --- straal van het punt $b$ [mm]],
)

Laat je $r$ lopen van $r_b$ tot de kopcirkel, dan krijg je één flank. Onder de basiscirkel bestaat geen evolvente.

=== Snelheidsanalyse <sec:snelheidsanalyse>

Het contactpunt van twee evolventes ligt altijd op de *ingrijplijn*: de gemeenschappelijke raaklijn aan beide basiscirkels. De normaal op de tandflanken valt samen met die lijn en gaat dus steeds door de pool P.

In het contactpunt moeten de snelheidscomponenten loodrecht op de flank gelijk zijn ($v_(n 1) = v_(n 2)$), anders gaan de tanden door elkaar of komen ze los. Met $cos beta = r_(b 1) slash R_1$:

#frm(
  "Overbrengingsverhouding evolvente",
  $ v_(n 1) = omega_1 R_1 cos beta = omega_1 r_(b 1) = omega_2 r_(b 2) quad => quad i = omega_1 / omega_2 = r_(b 2) / r_(b 1) = l_2 / l_1 $,
  [met: $R_1$ --- afstand van het middelpunt van wiel 1 tot het contactpunt [mm], $beta$ --- hoek tussen de snelheid $v_1$ en de normaal [rad], $r_(b 1), r_(b 2)$ --- stralen van de basiscirkels [mm], $l_1, l_2$ --- afstanden van de middelpunten tot de pool P [mm]],
)

Geen enkele term hangt af van waar het contactpunt ligt, dus $i$ is constant. Ligt het contactpunt in P, dan is $beta = gamma$ en $v_1 = v_2$: daar rollen de tanden zuiver. Overal elders glijden ze over elkaar.

#figure(
  image("assets/L10-snelheidsanalyse.png", width: 13cm),
  caption: [Snelheidsanalyse bij ingrijping in de pool: zuiver rollen (slide 26)],
) <fig:L10-snelheidsanalyse>

=== Redenering van Groenendijk <sec:groenendijk>

Groenendijk bewijst hetzelfde met een gekruiste riem tussen de twee basiscirkels:

+ De riem voldoet aan de kinematische hoofdeis. Alle punten van de riem hebben dezelfde snelheid, dus $v_p = r_(b 1) omega_1 = r_(b 2) omega_2$. Is $omega_1$ constant, dan ook $omega_2$. Met Kennedy: $P_(12)$ ligt op de lijn $P_(10) P_(20)$ én op de riem ($P_(13) P_(23)$), en dat snijpunt ligt vast.
+ Knip de riem door in een punt p, hou beide uiteinden strak en beweeg heen en weer. Aan weerszijden van p ontstaat een evolvente.
+ Laat p met constante snelheid over de riem bewegen. De twee evolventes raken elkaar altijd in p, op de riem. Een profiel uit evolventen voldoet dus aan de kinematische hoofdeis.

#figure(
  image("assets/L10-groenendijk.png", width: 11cm),
  caption: [Redenering van Groenendijk, stap 3 (slide 34)],
) <fig:L10-groenendijk>

=== Ingrijplijn en drukhoek <sec:drukhoek>

Het contactpunt beschrijft een rechte: de ingrijplijn. Het contactvlak staat altijd loodrecht op die lijn. De ingrijplijn is dus ook de werklijn van de drukkracht tussen de tanden. De hoek met de raaklijn aan de steekcirkels heet daarom de *drukhoek* $alpha$, genormeerd op $20 degree$.

#frm(
  "Krachten op de tand",
  $ F_r = tan(20 degree) dot F_t approx 0.36 dot F_t $,
  [met: $F_t$ --- tangentiële kracht, levert het koppel [N], $F_r$ --- radiale kracht, levert geen koppel en belast alleen de lagers [N]],
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#figure(image("assets/L10-drukhoek.png", width: 100%), caption: [Drukhoek en ontbinding van de tandkracht (slide 38)]) <fig:L10-drukhoek>],
  [#figure(image("assets/L10-heugel-snijden.png", width: 100%), caption: [Een heugel met rechte flanken snijdt de evolventen uit. Rood: de berekende evolvente.]) <fig:L10-heugel-snijden>],
)

#animatie("L10-evolvente-profiel.mp4", [touw afwikkelen, van flank naar tandwiel, ingrijplijn, snijden met een heugel en ondersnijding])

#table(
  columns: (1fr, 1fr),
  align: left,
  table.header([*Voordelen*], [*Nadelen*]),
  [Genormeerd: tandwielen met dezelfde $m$ en $alpha$ zijn uitwisselbaar.],
  [Minimaal aantal tanden nodig om *ondersnijding* te vermijden. Bij te weinig tanden snijdt de heugel ook de voet van de tand weg ($z < 17$ bij $alpha = 20 degree$).],
  [De asafstand mag verschuiven: $i = r_(b 2) slash r_(b 1)$ verandert niet.],
  [],
  [Fabricage met een heugelprofiel: één heugel met rechte flanken maakt elk tandaantal.],
  [],
)

De evolvente vertanding is de standaard in de machinebouw.

== Normalisatie van het evolvente profiel <sec:normalisatie>

#frm(
  "Basiscirkel en basissteek",
  $ r_b = r cos alpha approx 0.94 r #h(2em) p_b = p cos alpha $,
  [met: $r$ --- straal van de steekcirkel (rolcirkel) [mm], $p$ --- steek, gemeten op de steekcirkel [mm], $p_b$ --- basissteek, gemeten op de basiscirkel [mm], $alpha = 20 degree$ --- drukhoek [-]],
)

Omgekeerd is $r approx 1.06 r_b$: steekcirkel en basiscirkel verschillen ongeveer 6~%.

Het contact begint in A en eindigt in E, waar de kopcirkels de ingrijplijn snijden. $|A E|$ is de *ingrijpweg*.

#frm(
  "Ingrijpquotiënt",
  $ epsilon = (|A E|) / p_b $,
  [met: $|A E|$ --- lengte van de ingrijpweg [mm], $p_b$ --- basissteek [mm]. $epsilon < 1$: afwisselend contact en geen contact. $epsilon > 1$: voortdurend contact. $epsilon = 2$: steeds 2 tandparen in contact.],
)

Beide wielen moeten dezelfde steek hebben, anders passen de tanden niet in elkaar:

$ z_1 p_b = pi d_(b 1) = 2 pi r_(b 1) #h(2em) z_1 p = pi d_1 #h(2em) z_2 p = pi d_2 $

Daarom normaliseert men de *modulus* $m$. Dat is de basismaat voor de opbouw van een tandwiel.

#frm(
  "Modulus",
  $ m = p / pi = d / z $,
  [met: $p$ --- steek [mm], $d$ --- diameter van de steekcirkel [mm], $z$ --- aantal tanden [-]],
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  [#figure(image("assets/L10-genormaliseerd-tandwiel.png", width: 100%), caption: [Genormaliseerd tandwiel (slide 41)]) <fig:L10-genormaliseerd-tandwiel>],
  [#table(
    columns: 2,
    align: left,
    table.header([*Maat*], [*Waarde*]),
    [steek $p$], [$pi m$],
    [kophoogte], [$m$],
    [voethoogte], [$1.25 m$],
    [speling (clearance) $c_p$], [$0.25 m$],
    [tandwijdte $s_p$], [$p slash 2$],
    [kuilwijdte $e_p$], [$p slash 2$],
  )],
)
