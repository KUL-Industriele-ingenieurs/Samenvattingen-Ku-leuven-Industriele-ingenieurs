#import "../../school-template.typ": *

= 3-phase transformator <ch:3-phase-transformator>

Alles dat we hiervoor geleerd hebben over het #keyterm[versimpeld model] van transformatoren geldt ook voor #keyterm[3-phase transformatoren]. Het enige verschil is dat we nu 3 transformatoren hebben in plaats van 1.

== 3-fase herhaling <sec:3-fase-herhaling>

Dit hebben we al gezien in wisselstromen en wordt ook nog herhaald in netten. Maar het is belangrijk om goed te snappen voor 3-fase transformatoren.

=== WYE connectie <sec:wye-connectie>

#wrap-figure(
  image("assets/WYE-connectie.png", width: 10cm),
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
  image("assets/Delta-connectie.png", width: 10cm),
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

  $ markhl(phi_A + phi_B + phi_C = 0) $

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


== Winding configuraties <sec:winding-configuraties>

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


=== Voorbeeld oefeningen <sec:voorbeeld-oefeningen>

#voorbeeld(title: "Nog een Delta Wye")[
  Dit is nog een Delta Wye. Dus we gaan die weer stap voor stap oplossen

  + We tekenen eerst de relaties tussen onze spanningen.
  + We zien op onze fasor dat er een 30° verschuiving is tussen $V_(A)$ en $V_(a)$

  $ k = frac(V_A, V_a) = frac(V_(A B), V_(a b)) = 1/sqrt(3) frac(N_1, N_2) $
  #figure(
    image("assets/Nog een Delta Wye.png", width: 10cm),
    caption: [Nog een Delta Wye],
    label: <fig:Nog-een-Delta-Wye>,
  )

  Nu wat is de #keyterm[klok nummer] van deze configuratie? We weten dat de faseverschuiving tussen de primaire en secundaire winding hun #keyterm[lijnspanningen] 30 graden is. Maar anders met de vorige oefening staat de richting van onze fasor omgekeerd en dus ook die hoek 30°. Dus de clocknumber is 1. DY1
]


#voorbeeld(title: "Wye-Delta")[

  Nu een wye naar delta. We gebruiken exact dezeflde stappen. We werken van binnen uit waarbij we eerst de windingen bekijken omdat we hun relaties kennen. _Vergeet niet dat we ideale transformatoren aannemen_

  Je ziet op de figuur hieronder dat we voltage is omgedraait omdat de neutraal op de positieve kant is gestoken en dat bezien we als onze nul-voltage.


  #figure(
    image("assets/Wye-Delta.png", width: 5cm),
    caption: [Wye-Delta],
    label: <fig:Wye-Delta>,
  )

  Opnieuw dezelfde formule:

  $ k = frac(V_A, V_a) = frac(V_(A B), V_(a b)) = sqrt(3) frac(N_1, N_2) $


  Je kunt de fasor standaard tekenen of ervoor zorgen dat je phasor je negatieve spanning in rekening brengt. Weet dat

  $ V_(A B) = (-V_A) - (-V_B) = V_B - V_A $

  #figure(
    image("assets/Oplossing Wye-Delta.png", width: 5cm),
    caption: [Oplossing Wye-Delta],
    label: <fig:Oplossing-Wye-Delta>,
  )

  En je ziet dat $V_(A B)$ nu 30 graden verschoven zijn en onze voltages zijn omgedraait dus onze kloknummer is Yd7. Herinner dat het kloknummer bekeken wordt het faseverschil tussen de primaire en secundaire winding hun #keyterm[lijnspanningen]. $V_(A B)$ en $V_(a b)$



]
