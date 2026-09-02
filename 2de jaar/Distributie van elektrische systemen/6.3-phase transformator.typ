#import "../../school-template.typ": *

= 3-phase transformator <ch:3-phase-transformator>

Alles dat we hiervoor geleerd hebben over het #keyterm[versimpeld model] van transformatoren geldt ook voor #keyterm[3-phase transformatoren]. Het enige verschil is dat we nu 3 transformatoren hebben in plaats van 1.

== Herhaling driefasig <sec:3-fase-herhaling>

Dit hebben we al gezien in wisselstromen en wordt ook nog herhaald in netten. Maar het is belangrijk om goed te snappen voor 3-fase transformatoren.

=== Wye connectie <sec:wye-connectie>

#wrap-figure(
  image("assets/WYE-connectie.png", width: 10cm),
  caption: [Sterschakeling],
  label: <fig:WYE-connectie>,
)[
  Een #keyterm[sterschakeling] (wye) kenmerkt zich door een centraal *sterpunt* (de *neutraal*) waar de drie fasewikkelingen samenkomen.

  - #keyterm[Fasespanning] ($V_f$ of $V_"LN"$): gemeten over één wikkeling, tussen een fase en het sterpunt.
  - #keyterm[Lijnspanning] ($V_l$ of $V_"LL"$): gemeten tussen twee fasen.

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
  image("assets/Delta-connectie.png", width: 10cm),
  caption: [Driehoekschakeling],
  label: <fig:Delta-connectie>,
)[
  Een #keyterm[driehoekschakeling] (delta) kenmerkt zich doordat de drie fasewikkelingen in een *gesloten lus* staan. Elke wikkeling is aangesloten tussen twee actieve lijnen, hierdoor is er geen *neutraal* nodig of aanwezig.

  - #keyterm[Fasespanning] ($V_f$): gemeten over één wikkeling. Hier is dat meteen de lijnspanning, want elke wikkeling hangt tussen twee fasen.

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


== Topologieën <sec:topologieën>

#concept(title: "Topologieën")[

  Alle manieren hoe je een 3-phase transformator kan gebruiken:

  - Wye-Wye
  - Delta-Delta
  - Wye-Delta
  - Delta-Wye
]



#wrap-figure(
  image("assets/Wye-wye 3 fase transformator.png", width: 8cm),
  caption: [Wye-wye 3-fase transformator],
  label: <fig:Wye-wye-3-fase-transformator>,
)[

  De makkelijkste manier is om gewoon 3 transformators te nemen en deze in Wye-Wye te schakelen.

  Het is niet de meest optimale manier.

  #concept(title: "Transformatiefactor k")[
    Elke wikkeling in de 3-fase transformator heeft een #keyterm[transformatiefactor] $k$. Dit is de verhouding tussen de primaire en secundaire wikkeling per fase:
    $ k = V_1 / V_2 = N_1 / N_2 $
  ]
]

#wrap-figure(
  image("assets/3 Cores in 1.png", width: 8cm),
  caption: [3 Cores in 1],
  label: <fig:3-cores-in-1>,
)[

  Stel je voor dat we alle cores in een zetten. Dan heb je een veel meer efficiënte manier want je gebruikt minder materiaal en windingen.
  Dit is een efficiënter Wye configuratie.

  Een three-leg core-type transformator is een transformator waarbij de drie fasewikkelingen op drie aparte benen van een gemeenschappelijke kern zijn gewikkeld.

  #figure(
    image("assets/3-leg transformator.png", width: 12cm),
    caption: [3-leg transformator],
    label: <fig:3-leg-transformator>,
  )

  De som van alle voltages zijn nul.

  $ V_A + V_B + V_C = 0 $

  Herinner je nog de relatie tussen voltage en flux:

  $ phi = frac(V, j omega N) $

  We weten dat de voltage in relatie staat met onze flux $phi$.

  $ phi_A = frac(V_A, j omega N_1) $
  $ phi_B = frac(V_B, j omega N_1) $
  $ phi_C = frac(V_C, j omega N_1) $

  Dus:

  $ bold(phi_A + phi_B + phi_C = 0) $

  Dit is logisch want de som van alle voltages zijn nul.

]

Je hebt nog veel andere soorten constructie types zoals #keyterm[Shell-type] en #keyterm[5-leg-core-type].

#figure(
  image("assets/andere transformator constructie types.png", width: 8cm),
  caption: [andere transformator constructie types],
  label: <fig:andere-transformator-constructie-types>,
)

Waarom zouden we deze nodig hebben als 3-leg core-type al duid dat de som van de fluxen nul is?

Dat is alleen voor #keyterm[gebalanceerde] systemen. Als het systeem niet gebalanceerd is, zijn andere types ook handig.


== Wikkelingsconfiguraties <sec:winding-configuraties>

#wrap-figure(
  image("assets/Wye-Wye connectie.png", width: 8cm),
  caption: [Wye-Wye connectie],
  label: <fig:Wye-Wye-connectie>,
)[

  Dit is een voorbeeld van een Wye-Wye connectie. Je ziet dat alle wikkelingen in parallel staan.

  Herinner je nog alle ratio's:

  $ frac(V_1, V_2) = frac(N_1, N_2) $

  $ frac(I_1, I_2) = frac(N_2, N_1) $

  de voltage's zijn verschillend van elkaar met 120 graden. $V_A = hat(V) e^(j 0), V_B = hat(V) e^(j 120), V_C = hat(V) e^(j 240)$

  De uitgaande voltage's zijn ook verschillend met 120 graden en worden verhoogt met die ratio $n = N_2 / N_1$.
]


=== Schematische representatie <sec:schematische-representatie>


#wrap-figure(
  image("assets/Schematische configuratie.png", width: 10cm),
  caption: [Schematische configuratie],
  label: <fig:schematische-configuratie>,
)[

  We gaan verplaatsen van de fysieke representatie naar de schematische representatie.

  De capital letters zijn de #keyterm[primaire zijde] en de kleine letters zijn de #keyterm[secundaire zijde].

  De dot $circle.filled$ zijn de polariteit van de transformator.

  De flux $phi$ tussen de twee wikkelingen A en a zijn hetzelfde
]


In onze representaties hebben we alle soorten wikkelingen en topologieën:
- Wye-Wye
- Delta-Delta
- Wye-Delta
- Delta-Wye



#figure(
  image("assets/Wye-wye.png", width: 8cm),
  caption: [Wye-wye],
  label: <fig:Wye-wye>,
)

_Note: er is geen neutraal hier getekent maar deze wordt wel vaak toegevoegd_


#figure(
  image("assets/Delta-Delta.png", width: 8cm),
  caption: [Delta-Delta],
  label: <fig:Delta-Delta>,
)

Je ziet bij Delta delta dat de transformatoren geconnecteerd worden aan elkaar.


=== Wye Wye <sec:wye-wye>

Je ziet wat er in gaat hetzelfde is wat er uit gaat met de windingfactor $N_1/N_2$. Met een faseverschuiving van 120 graden tussen elke spanning.

#figure(
  image("assets/Wye Wye configuratie.png", width: 10cm),
  caption: [Wye Wye configuratie],
  label: <fig:Wye-Wye-configuratie>,
)

De flux over de wikkelingen tussen A en a, B en b, C en c zijn hetzelfde.

$ k = V_A / V_a = V_B / V_b = V_C / V_c = N_1 / N_2 $

=== Delta-Wye <sec:delta-wye>

Deze is wat moeilijker te bepalen omdat de windingen aan één kant met elkaar verbonden zijn. We volgen deze stappen:

+ We tekenen eerst de relaties tussen onze spanningen. De spanning $V_{A B}$ is de primaire spanning over de wikkeling (Delta).
+ We zien op onze fasor dat deze in fase staat met de secundaire fasespanning $V_a$ (Wye), omdat ze op dezelfde kern zitten.
+ We bepalen de verhouding $k$:

$ k = frac(V_A, V_a) = frac(V_(A B), V_(a b)) = 1/sqrt(3) frac(N_1, N_2) $


#wrap-figure(
  image("assets/Delta Wye.png", width: 10cm),
  caption: [Delta Wye],
  label: <fig:Delta-Wye>,
)[

  De spanningen hebben nog steeds dezelfde relatie afhakelijk van de wikkelingsratio $n = N_2 / N_1$.

  De voltage $V_(A B)$ is de primaire spanning tussen lijn A en B. En we weten van delta connectie dat $V_l = V_f$.

  Dus in onze phasordiagram gaat $V_(A B)$ in relatie staan met de secundaire spanning $V_(a)$.
]
#wrap-figure(
  image("assets/Phasor wye.png", width: 3.5cm),
  caption: [Phasor wye],
  label: <fig:Phasor-wye>,
)[

  Onze secundaire winding is een *wye connectie*. Als we de phasordiagram van een wye bekijken dan zien we dat $V_(a b)$ 30 graden voorloopt op $V_(a)$.

  We weten van wye connectie dat:

  $ V_(a b) = sqrt(3) underbrace(V_(a), frac(N_2, N_1) V_(A B)) $

  in rekening brengen met de primaire winding:

  $ V_(a b) = sqrt(3) frac(N_2, N_1) V_(A B) $

  $ k = frac(V_(A B), V_(a b)) = frac(1, sqrt(3)) frac(N_1, N_2) $

]

#concept(title: "Kloknummer")[

  #wrap-figure(
    image("assets/Klok nummer.png", width: 5cm),
    caption: [Klok nummer],
    label: <fig:Klok-nummer>,
  )[

    De clocknumber is een manier om de faseverschuiving tussen de primaire en secundaire winding te beschrijven.


    $ "clocknumber" = 12/360 * (phi_1 - phi_2) $

    Waar $phi_1$ en $phi_2$ de faseverschuivingen van de primaire en secundaire winding zijn.

    Elk nummer is een faseverschuiving van 30 graden.

    Dus bij Delta-Wye is de clocknumber 11. DY11 want er is een 30° verschuiving tussen de primaire en secundaire winding hun #keyterm[lijnspanningen].

    als er een neutral is kan staat er nog eeen N bij . Bijvoorbeeld DYN11.
  ]
]


=== De vier combinaties <sec:vier-combinaties>

Primair en secundair kunnen elk in ster of in driehoek staan, dus er zijn vier combinaties. De hoofdletter is de #strong[hoogspannings]zijde, de kleine letter de laagspanningszijde, en `n` erachter betekent dat het sterpunt uitgevoerd is.

#table(
  columns: (auto, auto, auto, 1fr),
  align: (left, center, center, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Groep*], [*HV*], [*LV*], [*Kenmerk*]),
  table.hline(stroke: 0.5pt),
  [`Yy0`], [ster], [ster], [Geen faseverschuiving. Beide sterpunten kunnen uitgevoerd worden (`YNyn0`).],
  [`Dy11`], [driehoek], [ster], [Secundair loopt $30 degree$ vóór. De driehoek vangt de derde harmonische op, de ster geeft een nulgeleider.],
  [`Yd1`], [ster], [driehoek], [Secundair loopt $30 degree$ achter. Typisch aan de zendzijde van een transmissienet.],
  [`Dd0`], [driehoek], [driehoek], [Geen faseverschuiving, geen nulpunt aan beide zijden.],
  table.hline(stroke: 1pt),
)

#belangrijk[De $30 degree$ komt er telkens omdat je aan één zijde lijnspanningen met fasespanningen vergelijkt.] Bij ster is de lijnspanning de vectoriële som van twee fasespanningen, en die staat $30 degree$ verdraaid. Bij driehoek vallen lijn- en fasespanning samen.

#align(center)[
  #grid(
    columns: 2,
    gutter: 0.8cm,
    figure(
      image("assets/DEE_dy_variant.png", width: 7.5cm),
      caption: [Een andere manier om de driehoek te sluiten geeft een ánder kloknummer.],
      label: <fig:dy-variant>,
    ),
    figure(
      image("assets/DEE_yd_voorbeeld.png", width: 7.5cm),
      caption: [Ster-driehoek: de secundaire lijnspanning is meteen de wikkelingsspanning.],
      label: <fig:yd-voorbeeld>,
    ),
  )
]

#waarschuwing[
  Dezelfde twee wikkelingssoorten kunnen #belangrijk[verschillende kloknummers] geven, afhankelijk van hoe je de driehoek sluit en welke klemmen je aan elkaar knoopt. `Dy1` en `Dy11` gebruiken allebei een driehoek en een ster. Lees het kloknummer dus altijd uit de #strong[tekening] af, en gok het niet uit de lettercombinatie.
]

#oefening(title: "Yd1: spanningen, stromen en verhouding")[
  *Gegeven.* Een `Yd1`-transformator hangt aan een lijnspanning van $33 "kV"$ en trekt $15 "A"$ bij $"PF" = 1$. De windingsverhouding is $N_1 \/ N_2 = 8$.

  *Gevraagd.* De secundaire wikkelings- en lijnspanning, de secundaire wikkelings- en lijnstroom, de faseverschuiving, en de transformatieverhouding $k$.

  *Stap 1: van lijn naar wikkeling aan de primaire zijde.* De primaire is een #strong[ster], dus de wikkeling ziet de fasespanning:
  $ V_(1,"wik") = V_(1 ell) / sqrt(3) = (33 000)/sqrt(3) = 19 053 "V" $

  *Stap 2: door de transformator.* De windingsverhouding werkt op de wikkelingsspanningen:
  $ V_(2,"wik") = V_(1,"wik") / (N_1 \/ N_2) = (19 053)/8 = 2382 "V" $

  *Stap 3: van wikkeling naar lijn aan de secundaire zijde.* De secundaire is een #strong[driehoek], en daar is de lijnspanning gelijk aan de wikkelingsspanning:
  $ V_(2 ell) = V_(2,"wik") = 2382 "V" $

  *Stap 4: de stromen, in omgekeerde richting.* Primair in ster: de lijnstroom is de wikkelingsstroom, dus $I_(1,"wik") = 15 "A"$. De windingsverhouding werkt omgekeerd op de stroom:
  $ I_(2,"wik") = I_(1,"wik") dot (N_1 \/ N_2) = 15 dot 8 = 120 "A" $

  Secundair in driehoek, dus de lijnstroom is $sqrt(3)$ keer de wikkelingsstroom:
  $ I_(2 ell) = sqrt(3) dot 120 = 208 "A" $

  *Stap 5: faseverschuiving.* Kloknummer $1$ betekent dat de secundaire $1 times 30 degree = 30 degree$ #strong[achterloopt] op de primaire. Dat geldt voor de spanningen én voor de stromen.

  *Stap 6: de transformatieverhouding.* $k$ gaat over de #strong[lijn]grootheden, niet over de windingen:
  $ k = V_(1 ell) / V_(2 ell) = (33 000)/2382 = #"13,9" $

  Controle via de stromen: $I_(2 ell) \/ I_(1 ell) = 208 \/ 15 = #"13,9"$. #belangrijk[Merk op dat $k = #"13,9"$ niet gelijk is aan $N_1 \/ N_2 = 8$.] Het verschil is precies de $sqrt(3)$ die aan de sterzijde tussen lijn en wikkeling zit.
]

=== Zigzag (Yzn11) <sec:zigzag>

Bij een #keyterm[zigzag] is elke secundaire fase in twee halve wikkelingen gesplitst die op #strong[twee verschillende kernbenen] zitten, in tegengestelde zin in serie. De secundaire fasespanning is dus het verschil van twee spanningen die $120 degree$ uit elkaar liggen, en niet één wikkelingsspanning zoals bij een gewone ster.

#figure(
  image("assets/DEE_zigzag_Yzn11.png", width: 100%),
  caption: [Zigzag: de fasordriehoek primair, het wikkelingsschema, en de resulterende secundaire ster. De $n$-klem is uitgevoerd, vandaar `Yzn11`.],
  label: <fig:zigzag-Yzn11>,
)

De verhouding volgt uit dat verschil. Noem $N_2$ het totale aantal windingen per secundaire fase, dus $N_2 \/ 2$ per halve wikkeling:

$ V_a = (N_2 \/ 2)/N_1 (V_A - V_B) $

$V_A$ en $V_B$ liggen $120 degree$ uit elkaar, dus $|V_A - V_B| = sqrt(3) V_A$:

$ V_a = sqrt(3)/2 N_2/N_1 V_A $

$ k = V_A/V_a = V_B/V_b = V_C/V_c = 2/sqrt(3) N_1/N_2 $

met: $k$ = transformatieverhouding $[-]$, $N_1$ = windingen per primaire fase $[-]$, $N_2$ = windingen per secundaire fase, samen over de twee halve wikkelingen $[-]$.

Tegenover een `Yy0` met dezelfde windingen ligt de secundaire spanning dus een factor $sqrt(3)\/2 = #"0,87"$ lager. Voor dezelfde spanning heb je $2\/sqrt(3) = #"1,15"$ keer zoveel secundaire windingen nodig.

#waarschuwing[
  Slide 37 van deck 05 zegt letterlijk dat de zigzag #strong[buiten de leerstof] valt; de slides zitten verborgen in de pptx. Ze staan hier voor de volledigheid.
]

=== Voorbeeld oefeningen <sec:voorbeeld-oefeningen>

#voorbeeld(title: "Nog een Delta Wye")[
  Dit is nog een Delta Wye. Dus we gaan die weer stap voor stap oplossen

  + We tekenen eerst de relaties tussen onze spanningen.
  + We zien op onze fasor dat er een 30° verschuiving is tussen $V_(A)$ en $V_(a)$

  $ k = frac(V_A, V_a) = frac(V_(A B), V_(a b)) = 1/sqrt(3) frac(N_1, N_2) $
  #figure(
    image("assets/Nog een Delta Wye.png", width: 12cm),
    caption: [Nog een Delta Wye],
    label: <fig:Nog-een-Delta-Wye>,
  )

  Nu wat is de #keyterm[klok nummer] van deze configuratie? We weten dat de faseverschuiving tussen de primaire en secundaire winding hun #keyterm[lijnspanningen] 30 graden is. Maar anders met de vorige oefening staat de richting van onze fasor omgekeerd en dus ook die hoek 30°. Dus de clocknumber is 1. DY1
]


#voorbeeld(title: "Wye-Delta")[

  Nu een wye naar delta. We gebruiken exact dezeflde stappen. We werken van binnen uit waarbij we eerst de windingen bekijken omdat we hun relaties kennen. _Vergeet niet dat we ideale transformatoren aannemen_

  Je ziet op de figuur hieronder dat we voltage is omgedraait omdat de neutraal op de positieve kant is gestoken en dat bezien we als onze nul-voltage.


  #figure(
    image("assets/Wye-Delta.png", width: 12cm),
    caption: [Wye-Delta],
    label: <fig:Wye-Delta>,
  )

  Opnieuw dezelfde formule:

  $ k = frac(V_A, V_a) = frac(V_(A B), V_(a b)) = sqrt(3) frac(N_1, N_2) $


  Je kunt de fasor standaard tekenen of ervoor zorgen dat je phasor je negatieve spanning in rekening brengt. Weet dat

  $ V_(A B) = (-V_A) - (-V_B) = V_B - V_A $

  #figure(
    image("assets/Oplossing Wye-Delta.png", width: 10cm),
    caption: [Oplossing Wye-Delta],
    label: <fig:Oplossing-Wye-Delta>,
  )

  En je ziet dat $V_(A B)$ nu 30 graden verschoven zijn en onze voltages zijn omgedraait dus onze kloknummer is Yd7. Herinner dat het kloknummer bekeken wordt het faseverschil tussen de primaire en secundaire winding hun #keyterm[lijnspanningen]. $V_(A B)$ en $V_(a b)$



]
