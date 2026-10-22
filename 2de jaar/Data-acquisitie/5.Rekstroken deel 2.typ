#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/5.strain_gages_part2.pdf | Slides/13.force.pdf (brug) | Samenvatting DAQ p.14-17
//       Samenvatting 1ste versie p.2 | Voorbeeldexamen 23-24, 25-26 | examenvragen 2016-2025

// Wheatstonebrug: R1 linksboven, R2 rechtsboven, R3 rechtsonder, R4 linksonder.
// Kleuren: rood = trek (+ΔR), blauw = druk (-ΔR), grijs = vaste weerstand.
#let brug(labels, kleuren) = cetz.canvas({
  import cetz.draw: *
  let (t, l, r, b) = ((0, 1.8), (-1.8, 0), (1.8, 0), (0, -1.8))
  line(t, l)
  line(l, b)
  line(t, r)
  line(r, b)
  let posities = ((-0.9, 0.9), (0.9, 0.9), (0.9, -0.9), (-0.9, -0.9))
  for i in range(4) {
    let (x, y) = posities.at(i)
    rect((x - 0.42, y - 0.2), (x + 0.42, y + 0.2), fill: white, stroke: kleuren.at(i) + 1.2pt)
    content((x, y), text(size: 8pt, fill: kleuren.at(i))[#labels.at(i)])
  }
  line(t, (0, 2.3), (-2.8, 2.3), (-2.8, -2.3), (0, -2.3), b)
  circle((-2.8, 0), radius: 0.32, fill: white)
  content((-2.8, 0.12), text(size: 7pt)[+])
  content((-2.8, -0.14), text(size: 7pt)[−])
  content((-3.5, 0), [$V_"ex"$])
  line((-1.6, 0), (1.6, 0), stroke: (paint: schoolGreen, dash: "dashed"), mark: (start: ">", end: ">", fill: schoolGreen))
  content((0, 0.28), text(fill: schoolGreen)[$V_o$])
  for p in (t, l, r, b) { circle(p, radius: 0.06, fill: black) }
  content((-2.05, 0), [$a$])
  content((2.05, 0), [$b$])
})

= Rekstroken deel 2 <ch:rekstroken-2>

== Types rekstroken <sec:types-rekstroken>

Er zijn twee grote families: *ongebonden* rekstroken, waarbij de draden vrij gespannen zijn, en *gebonden* rekstroken, die op het materiaal worden gelijmd of aangebracht.

=== Ongebonden rekstroken <sec:unbonded>

Vier voorgespannen draden zitten tussen een vaste basis en een beweegbare plaat. Beweegt de plaat, dan rekken twee draden uit en worden er twee korter. De vier draden staan in een Wheatstonebrug (@sec:wheatstonebrug). Typische waarden: $120$ tot $1000 thin Omega$, een excitatie van $5$ tot $10 "V"$ en een uitgang van $20$ tot $50 "mV"$.

#grid(
  columns: (1.3fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L5-unbonded.png", width: 100%),
    caption: [Ongebonden rekstrook: vier voorgespannen draden in een brug (slide 11)],
    label: <fig:L5-unbonded>,
  ),
  figure(
    image("assets/L5-unbonded-draad.png", width: 90%),
    caption: [Ongebonden draad tussen twee bevestigingspunten (slide 12)],
    label: <fig:L5-unbonded-draad>,
  ),
)

#table(
  columns: (1fr, 1fr),
  table.header([*Voordelen*], [*Nadelen*]),
  [lineair in het elastische gebied \ kleine temperatuurcoëfficiënt \ AC- of DC-excitatie \ nauwkeurig \ kleine verplaatsing nodig],
  [kleine gage factor ($"GF" = 2$ tot $4$) \ gevoelig voor schokken \ kritische mechanische constructie],
)

=== Gebonden rekstroken <sec:bonded>

Er zijn vier subtypes: de gebonden metaaldraad, de metaalfolie, de opgedampte dunne metaalfilm en de halfgeleiderrekstrook.

*1. Gebonden metaaldraad.* Een draad in een meanderpatroon op een drager. Klein oppervlak, weinig lekstroom en een hoge isolatie. Het nadeel is een hoge *dwarsgevoeligheid*: de bochten aan de uiteinden liggen dwars op de meetrichting en meten ook de dwarsrek mee.

*2. Metaalfolie.* De meest gebruikte rekstrook: een geëtst foliepatroon van slechts $0.001 "mm"$ dik.
- $120$ tot $1000 thin Omega$, $1 %$ nauwkeurigheid;
- maximale rek $0.5$ tot $4 %$, in speciale gevallen tot $10 %$;
- voordelen: kleine temperatuurcoëfficiënt, weinig schokgevoelig, AC en DC, robuust;
- nadelen: kleine gevoeligheid ($"GF" approx plus.minus 2$) en een klein temperatuurbereik ($T < 70 degree"C"$), omdat de lijm zacht wordt.

De bochten van de folie zijn veel breder gemaakt dan de meetstroken: *fat end turns*. Een brede bocht heeft een grote doorsnede en dus een kleine weerstand ($R = rho L \/ A$). Ze vormt dan maar een klein deel van de totale weerstand en draagt ook weinig bij aan $Delta R$. Zo daalt de dwarsgevoeligheid tot onder $1 %$.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L5-folie-opbouw.png", width: 85%),
    caption: [Foliestrook: meetlengte, eindlussen (fat end turns), soldeerpads (slide 16)],
    label: <fig:L5-folie-opbouw>,
  ),
  figure(
    image("assets/L5-folie-patronen.png", width: 100%),
    caption: [Foliepatronen: onder 45° voor torsie, enkelvoudig, en twee richtingen (slide 17)],
    label: <fig:L5-folie-patronen>,
  ),
)

#examenvraag("2017 vraag 15", [Bij rekstrookjes wordt het probleem van hoge dwarsgevoeligheid opgelost door ...],
  opties: ([skinny end turns], [fat end turns], [gebruik van speciale lijm]),
  juist: "B",
)[Brede bochten hebben een grotere doorsnede en dus een kleinere weerstand. Hun aandeel in $Delta R$ wordt klein, en daarmee ook de dwarsgevoeligheid. A doet net het omgekeerde: smalle bochten hebben een hogere weerstand. De lijm (C) bepaalt hoe goed de rek wordt overgedragen, niet in welke richting de strook gevoelig is.]

*3. Opgedampte dunne metaalfilm* (deposited thin metal film). De strook wordt opgedampt of gesputterd op de drager en wordt er zo een deel van. Er is geen lijm nodig.
- Voordelen: zeer nauwkeurig, reproduceerbaar en minder temperatuurafhankelijk. Het dunne laagje met groot oppervlak voert warmte goed af. Met lasertrimmen haal je een hogere gevoeligheid. Lineariteit, hysteresis en stabiliteit hangen alleen nog af van de drager.
- Nadeel: klein uitgangssignaal ($"GF" = 2$).

*4. Halfgeleiderrekstrook* (piëzoresistief). Een strookje p-type silicium, of een p-type gebied dat in een n-type drager is gediffundeerd.
- Voordelen: hoge gevoeligheid ($"GF" > 100$), zeer nauwkeurig, voorspelbare temperatuurcoëfficiënt, kleine massa en dus een hoge eigenfrequentie, mini-sensoren mogelijk, zeer stabiel.
- Nadelen: klein temperatuurbereik ($T < 120 degree"C"$) en een zeer grote temperatuurcoëfficiënt.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L5-dunne-film.png", width: 100%),
    caption: [Dunne film: opdampen of sputteren (slide 20)],
    label: <fig:L5-dunne-film>,
  ),
  figure(
    image("assets/L5-halfgeleider.png", width: 70%),
    caption: [Gediffundeerde halfgeleiderrekstrook (slide 22)],
    label: <fig:L5-halfgeleider>,
  ),
)

#table(
  columns: (auto, auto, auto, 1fr),
  align: (left, center, center, left),
  table.header([*Gebonden type*], [*GF*], [*Max. $T$*], [*Typisch*]),
  [metaaldraad], [$approx 2$], [lijm], [hoge dwarsgevoeligheid],
  [metaalfolie], [$approx 2$], [$70 degree"C"$], [robuust, meest gebruikt],
  [dunne film], [$approx 2$], [hoger (geen lijm)], [zeer nauwkeurig en reproduceerbaar],
  [halfgeleider], [$> 100$], [$120 degree"C"$], [zeer gevoelig, maar zeer temperatuurgevoelig],
)

=== Speciaal type: elastische kwikbuis <sec:kwikbuis>

Een elastische buis gevuld met kwik (of een andere geleidende vloeistof). Rekt de buis, dan wordt de kwikkolom langer en dunner.
- Weerstand $0.02$ tot $2 thin Omega"/cm"$; lineair tot op $1 %$ bij $10 %$ rek, tot op $4 %$ bij $30 %$ rek.
- Voor grote verplaatsingen en kleine krachten, bv. de ademhaling van een baby meten.
- Nadelen: klein lineair bereik, moeilijk te kalibreren, blijvende rek op lange termijn, zeer klein temperatuurbereik.

== Rekenvoorbeeld: foliestrook op een stalen staaf <sec:rekstrook-voorbeeld>

#voorbeeld(title: "Signaal en ruis van een foliestrook (slides 23-26)")[
  Een foliestrook ($"GF" = 2$, $R = 120 thin Omega$, maximale stroom $30 "mA"$) zit op een stalen staaf met doorsnede $1 "cm"^2$ ($E = 210 "GPa"$). De staaf draagt $70 "kg"$, dus een spanning van $700 "N/cm"^2 = 7 dot 10^6 "Pa"$. De strook zit met een tweede weerstand van $120 thin Omega$ in serie in een kwartbrug, bij $20 degree"C"$.

  *Stap 1 --- excitatie.* Door de tak van $2 R = 240 thin Omega$ mag maximaal $30 "mA"$:
  $ E_"ex" = 240 dot 0.030 = 7.2 "V" $

  *Stap 2 --- rek en weerstandsverandering.*
  $ epsilon = sigma / E = (7 dot 10^6) / (210 dot 10^9) = 33 dot 10^(-6) = 33 thin mu epsilon $
  $ d R = "GF" dot epsilon dot R = 2 dot 33 dot 10^(-6) dot 120 = 8 thin "m"Omega $

  *Stap 3 --- uitgang van de kwartbrug* (@sec:brugtypes):
  $ e_o approx E_"ex" (d R) / (4 R) = 7.2 dot (8 dot 10^(-3)) / 480 = 120 thin mu"V" $

  *Stap 4 --- thermische ruis.* Elke weerstand geeft een ruisspanning (Johnson-ruis), hier over een bandbreedte van $100 "kHz"$:
  $ e_n = sqrt(4 k T R Delta f) = sqrt(4 dot 1.38 dot 10^(-23) dot 293 dot 120 dot 10^5) = 0.45 thin mu"V" $
  De signaal-ruisverhouding is $120 : 0.45 = 267$. Dat is aanvaardbaar.

  *Kerninzicht:* hang je $70 "g"$ op in plaats van $70 "kg"$, dan is het signaal maar $0.13 thin mu"V"$, kleiner dan de ruis. Het signaal gaat verloren. In de praktijk beperkt de ruis van de andere weerstanden en bronnen de resolutie van het meetsysteem.
]

#frm(
  "Thermische ruis (Johnson-ruis)",
  $e_n = sqrt(4 k T R Delta f)$,
  [Ruisspanning van elke weerstand; groeit met temperatuur, weerstand en bandbreedte.],
)

met:
- $k = 1.38 dot 10^(-23) "J/K"$ --- constante van Boltzmann
- $T$ --- absolute temperatuur [K]
- $R$ --- weerstand [$Omega$]
- $Delta f$ --- bandbreedte van de meting [Hz]

== De Wheatstonebrug <sec:wheatstonebrug>

=== Waarom een brug? <sec:waarom-brug>

De weerstandsverandering van een rekstrook is piepklein: in het voorbeeld hierboven $8 thin "m"Omega$ op $120 thin Omega$, dus $d R \/ R approx 10^(-4)$. Er zijn drie manieren om die te meten (Samenvatting DAQ p.14):

+ *Stroom meten*: een bron $V_"exc"$ in serie met de rekstrook. Je meet $I = V_"exc" \/ (R + d R)$: een kleine verandering bovenop een grote stroom.
+ *Spanningsdeler*: de strook in serie met een vaste $R$. De uitgang $V_"exc" (R + d R) \/ (2 R + d R)$ is ongeveer $V_"exc" \/ 2$ plus een heel klein beetje.
+ *Wheatstonebrug*: twee spanningsdelers naast elkaar. Je meet het *verschil* tussen hun middenknopen. In rust is dat exact $0$. Je meet dus alleen de verandering, zonder grote offset. *Dit is de beste methode.*

=== Brugformule <sec:brugformule>

#figure(
  brug(($R_1$, $R_2$, $R_3$, $R_4$), (black, black, black, black)),
  caption: [Wheatstonebrug: twee spanningsdelers $R_1$-$R_4$ en $R_2$-$R_3$ op dezelfde $V_"ex"$],
  label: <fig:L5-brug>,
)

Elke tak is een spanningsdeler. De spanning van knoop $a$ en knoop $b$ ten opzichte van de onderkant is $V_"ex" R_4 \/ (R_1 + R_4)$ en $V_"ex" R_3 \/ (R_2 + R_3)$. De uitgang is het verschil:

#frm(
  "Wheatstonebrug",
  $V_o / V_"ex" = R_3 / (R_2 + R_3) - R_4 / (R_1 + R_4)$,
  [In evenwicht ($R_1 R_3 = R_2 R_4$, bv. alle vier gelijk) is $V_o = 0$.],
)

=== Volle, halve en kwartbrug <sec:brugtypes>

Vervang je een of meer weerstanden door een rekstrook, dan krijg je drie opstellingen. De regel om ze juist te schakelen:

#concept(title: "Tekenregel van de brug")[
  *Overstaande armen* ($R_1$ en $R_3$, of $R_2$ en $R_4$) krijgen *hetzelfde teken*, *aangrenzende armen* het *tegengestelde* teken. Dan tellen alle bijdragen op in plaats van elkaar op te heffen.
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.5em,
  figure(
    brug(($+Delta R$, $-Delta R$, $+Delta R$, $-Delta R$), (schoolRed, schoolBlue, schoolRed, schoolBlue)),
    caption: [Volle brug: 4 actief],
  ),
  figure(
    brug(($R$, $-Delta R$, $+Delta R$, $R$), (schoolGray, schoolBlue, schoolRed, schoolGray)),
    caption: [Halve brug: 2 actief in één tak],
  ),
  figure(
    brug(($R$, $R$, $+Delta R$, $R$), (schoolGray, schoolGray, schoolRed, schoolGray)),
    caption: [Kwartbrug: 1 actief],
  ),
)

Invullen in de brugformule:

*Volle brug* --- $R_1 = R_3 = R + Delta R$ en $R_2 = R_4 = R - Delta R$. In elke tak zit één strook in trek en één in druk, dus beide noemers zijn exact $2 R$:
$ V_o / V_"ex" = (R + Delta R) / (2 R) - (R - Delta R) / (2 R) = (Delta R) / R $

*Halve brug* --- twee actieve stroken ($+Delta R$ en $-Delta R$) in dezelfde tak, twee vaste weerstanden in de andere. Die vaste tak staat altijd op $V_"ex" \/ 2$:
$ V_o / V_"ex" = (R + Delta R) / (2 R) - 1 / 2 = (Delta R) / (2 R) $

*Kwartbrug* --- één actieve strook. Nu blijft er een $Delta R$ in de noemer staan:
$ V_o / V_"ex" = (R + Delta R) / (2 R + Delta R) - 1 / 2 = (Delta R) / (4 R + 2 Delta R) approx (Delta R) / (4 R) $

#frm(
  "Uitgang van de brug",
  $V_o = V_"ex" (Delta R) / R "(vol)" quad quad V_o = V_"ex" (Delta R) / (2 R) "(half)" quad quad V_o approx V_"ex" (Delta R) / (4 R) "(kwart)"$,
  [Met $Delta R \/ R = "GF" dot epsilon$. Vol en half zijn exact lineair, kwart alleen bij benadering.],
)

#table(
  columns: (auto, auto, auto, 1fr),
  align: (left, center, center, left),
  table.header([*Brug*], [*Actief*], [*$V_o \/ V_"ex"$*], [*Eigenschap*]),
  [Vol], [4], [$Delta R \/ R$], [grootste signaal, exact lineair, temperatuur gecompenseerd],
  [Half], [2], [$Delta R \/ (2 R)$], [exact lineair, temperatuur gecompenseerd],
  [Kwart], [1], [$approx Delta R \/ (4 R)$], [niet lineair, niet gecompenseerd],
)

=== Temperatuurcompensatie <sec:temperatuurcompensatie>

Een temperatuurverandering laat elke rekstrook met dezelfde $delta$ toenemen. Zitten twee identieke stroken in *dezelfde tak* (aangrenzende armen), dan blijft de deelverhouding van die tak
$ (R + delta) / ((R + delta) + (R + delta)) = 1 / 2 $
en verandert de uitgang niet: de temperatuur valt weg in teller en noemer. Daarom zijn de halve en de volle brug vanzelf gecompenseerd. Bij een kwartbrug plaats je een *dummy-strook* in de aangrenzende arm: een identieke strook die wel de temperatuur voelt, maar niet rekt (bv. dwars op de rek of op een onbelast stuk materiaal).

#examenvraag("2016 vraag 19, juni 2016 vraag 12, 2017 vraag 11", [Hoe beperk je de temperatuurgevoeligheid van een Wheatstonebrug met rekstrookjes? In welke armen plaats je de strookjes?])[Plaats twee identieke strookjes in *dezelfde tak*, dus in aangrenzende armen, met vaste weerstanden in de andere tak. Door de temperatuur nemen beide toe met dezelfde $delta$ en blijft $(R + delta) \/ (2 R + 2 delta) = 1\/2$. In *overstaande* armen werkt het niet: dan blijft er een term $delta \/ (2 R + delta)$ staan.]

== Van kracht naar uitgangsspanning: de load-cell-oefening <sec:loadcell-oefening>

#examenbox[Dit is elk jaar de open vraag op 3 punten (zonder gokcorrectie). In januari 2025 ging ze vaak fout. Leer het stappenplan hieronder vanbuiten en oefen alle vier de examenversies.]

Een *load cell* is een stuk metaal (balk, staaf of as) met rekstroken erop. Het stappenplan is altijd hetzelfde:

+ *Kracht naar spanning in het materiaal.*
  - Trek of druk (staaf die hangt): $sigma = F \/ A$.
  - Buiging (ingeklemde balk): $sigma = M \/ Z$ met $M = F dot L$. Hier is $L$ de afstand van de kracht tot de *stroken*, niet de totale lengte.
+ *Spanning naar rek:* $epsilon = sigma \/ E$.
+ *Rek naar weerstandsverandering:* $Delta R \/ R = "GF" dot epsilon$.
+ *Welke brug?* Tel hoeveel stroken *effectief rekken*. Een strook op de neutrale lijn van een buigbalk rekt niet.
+ *Brugformule:* $V_o = V_"ex" dot Delta R \/ R$ (vol), $Delta R \/ (2R)$ (half) of $Delta R \/ (4R)$ (kwart).

#frm(
  "Weerstandsmoment",
  $Z = (b h^2) / 6 "(rechthoek)" quad quad Z = (pi d^3) / 32 "(ronde as)"$,
  [Met $sigma = M \/ Z$ de spanning aan het oppervlak, waar de rekstroken zitten.],
)

met:
- $b$, $h$ --- breedte en hoogte van de balk (in de buigrichting) [m]
- $d$ --- diameter van de as [m]

#waarschuwing[De opgaven bevatten bewust *afleiders*: de totale staaflengte (je hebt de afstand tot de stroken nodig), de constante van Poisson $nu$ (niet nodig bij buiging of zuivere trek met één strook in de lengterichting) en de weerstand $R$ (die valt weg in $Delta R \/ R$).]

#examenvraag("23-24 vraag 10, 25-26 vraag 24, voorbeeldexamen 2024 (invulvraag)", [Een rekstrookje zit op een aluminium staaf in een kwartbrug (1 actief element). Aan de staaf hangt $28 "kg"$. Staaflengte $40 "cm"$, doorsnede $2 times 2 "cm"$, $E = 70 "GPa"$, $nu = 0.3$, $"GF" = 2$, $V_"ex" = 5 "V"$, $R = 25 thin Omega$. Bepaal $V_o$ in $mu"V"$.])[
  Zuivere trek, geen buiging.
  $ F = 28 dot 10 = 280 "N" quad quad A = (0.02)^2 = 4 dot 10^(-4) "m"^2 quad quad sigma = 280 / (4 dot 10^(-4)) = 7 dot 10^5 "Pa" $
  $ epsilon = (7 dot 10^5) / (70 dot 10^9) = 10^(-5) quad quad (Delta R) / R = 2 dot 10^(-5) $
  $ V_o = V_"ex" (Delta R) / (4 R) = 5 dot (2 dot 10^(-5)) / 4 = 2.5 dot 10^(-5) "V" = bold(25 thin mu"V") $
  Neem $g = 10$: dan komen de getallen rond uit (met $9.81$ vind je $24.5 thin mu"V"$, binnen de foutenmarge van $10 %$). De staaflengte, $nu$ en $R$ zijn afleiders.
]

#examenvraag("juni 2016 vraag 18", [Load cell op buiging: de kracht grijpt aan op het uiteinde van een staaf van $15 "cm"$, op $L = 10 "cm"$ van de rekstrookjes. Hoogte en breedte zijn $1 "cm"$, $Z = b h^2 \/ 6$, $E = 200 "GPa"$, $nu = 0.3$, $"GF" = 2$, vier identieke strookjes (2 boven, 2 onder), $V_"ex" = 10 "V"$. Wat is de gevoeligheid?],
  opties: ([$50$ -- $70 thin mu"V/N"$], [$20$ -- $49 thin mu"V/N"$], [$10$ -- $19 thin mu"V/N"$], [$5$ -- $9 thin mu"V/N"$]),
  juist: "A",
)[Twee boven (trek) en twee onder (druk): een volle brug.
  $ Z = (0.01 dot 0.01^2) / 6 = 1.667 dot 10^(-7) "m"^3 quad quad Z E = 1.667 dot 10^(-7) dot 200 dot 10^9 = 3.33 dot 10^4 "Nm" $
  $ epsilon = (F dot 0.10) / (3.33 dot 10^4) = 3 dot 10^(-6) F quad quad (Delta R) / R = 2 epsilon = 6 dot 10^(-6) F $
  $ S = V_o / F = 10 dot 6 dot 10^(-6) = 60 thin mu"V/N" $
  De $15 "cm"$ en $nu = 0.3$ zijn afleiders.]

#figure(
  image("assets/L5-examen-balk.png", width: 6cm),
  caption: [Load cell van 25-26 vraag 25: strookje 1 boven, strookje 2 onder (Voorbeeldexamen 25-26)],
  label: <fig:L5-examen-balk>,
)

#examenvraag("25-26 vraag 25 (invulvraag)", [Load cell op buiging (@fig:L5-examen-balk) met 2 rekstrookjes in een brug voor maximale gevoeligheid. De kracht staat op $40 "cm"$ van de inklemming en op $30 "cm"$ van het midden van de strookjes. $b = h = 1 "cm"$, $E = 200 "GPa"$, $Z = b h^2 \/ 6$, $nu = 0.2$, $"GF" = 3$, $V_"ex" = 10 "V"$. Bereken de gevoeligheid in $mu"V/N"$.])[
  Eén strook boven ($+Delta R$) en één onder ($-Delta R$), samen in één tak: een halve brug.
  $ Z E = 3.33 dot 10^4 "Nm" quad quad epsilon = (F dot 0.30) / (3.33 dot 10^4) = 9 dot 10^(-6) F quad quad (Delta R) / R = 3 dot 9 dot 10^(-6) F = 2.7 dot 10^(-5) F $
  $ S = V_"ex" dot 1 / 2 dot 2.7 dot 10^(-5) = 1.35 dot 10^(-4) "V/N" = bold(135 thin mu"V/N") $
  Gebruik de $30 "cm"$ (moment ter hoogte van de strookjes), niet de $40 "cm"$. Met vier strookjes was het $270 thin mu"V/N"$.
]

#figure(
  image("assets/L5-examen-ronde-as.png", width: 13cm),
  caption: [Load cell als ronde as met vier strookjes en de bijhorende brug (Voorbeeldexamen 25-26, vraag 26)],
  label: <fig:L5-examen-ronde-as>,
)

#examenvraag("2024-2025 open vraag, 25-26 vraag 26 (invulvraag)", [Ronde as op buiging (@fig:L5-examen-ronde-as), vier rekstrookjes in een Wheatstonebrug. $F = 100 "N"$, $L_1 = L_2 = 30 "cm"$, $L_3 = 20 "cm"$, $L_4 = 1 "cm"$ (diameter), $E = 200 "GPa"$, $Z = pi d^3 \/ 32$ met $pi = 3$, $nu = 0.2$, $"GF" = 2$, $R = 100 thin Omega$, $V_"ex" = 5 "V"$. Bereken $V_o$ in mV, met teken.])[
  *Stap 1 --- weerstandsmoment:* $Z = (3 dot 0.01^3) \/ 32 = 9.375 dot 10^(-8) "m"^3$.

  *Stap 2 --- rek.* De kracht staat op $L_2 = 30 "cm"$ van de strookjes:
  $ M = 100 dot 0.30 = 30 "Nm" quad quad sigma = 30 / (9.375 dot 10^(-8)) = 320 "MPa" quad quad epsilon = (320 dot 10^6) / (200 dot 10^9) = 1.6 dot 10^(-3) $

  *Stap 3:* $Delta R \/ R = 2 dot 1.6 dot 10^(-3) = 3.2 dot 10^(-3)$.

  *Stap 4 --- welke brug?* Dit is de kern. $R_1$ en $R_2$ liggen op de zijkant van de as, op de *neutrale lijn*: die rekken niet. Alleen $R_4$ (boven, trek, $+Delta R$) en $R_3$ (onder, druk, $-Delta R$) zijn actief. Ze zitten samen in de rechtertak: een *halve brug*.

  *Stap 5 --- teken.* De linkertak ($R_1$, $R_2$) staat op $V_"ex" \/ 2$. De rechterknoop ($+$ van $V_o$) zit boven $R_3$:
  $ V_o = V_"ex" (R - Delta R) / (2 R) - V_"ex" / 2 = - V_"ex" (Delta R) / (2 R) = -5 dot (3.2 dot 10^(-3)) / 2 = bold(-8 "mV") $

  Vier strookjes betekent dus niet automatisch een volle brug: tel altijd hoeveel er effectief rekken. Met een volle brug zou je $16 "mV"$ vinden, met een kwartbrug $4 "mV"$. $L_1$, $L_3$, $nu$ en $R$ zijn afleiders.
]
