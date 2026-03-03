#import "../../school-template.typ": *
= 4.External en internal forced convection <ch:External-en-internal-forced-convection>

We gaan convectie forceren. Voor lucht via een turbine en voor een vloeistof via een pomp. We gaan de richting van convectie eigenlijk tegenwerken en zo warmte transporteren.

#concept(title: "vrije-stroming snelheid en upstream snelheid")[

  *vrije-stroming*\
  De snelheid van een vloeistof relativief tot een ondergedompeled vast object ver genoeg van het object. Geen effect van het object op de snelheid $v$

  *upstream snelheid*\
  Is de snelheid van het vloeistof van voor het lichaam.

]

== Drag en warmteoverdracht external flow <sec:Drag-en-warmteoverdracht-external-flow>

Druk en frictie hebben grote impacten op de richting van convectie.

De velocity boundary layer en thermal boundary layer hebben beide een effect op convectie. De verhouding tussen de diktes van deze twee grenslagen wordt uitgedrukt met het Prandtl-nummer $P_r$. (Bijv. $P_r approx 1$ voor gassen betekent dat beide lagen ongeveer even snel groeien).

#keyterm[Drag] is de kracht tegen de beweging van het vloeistof.


#frm(
  "Drag coëfficient",
  [
    $ C_D = frac(F_D, 1/2 phi V^2 A) $
  ],
  [
    $F_D$: Drag force
    $phi$: Density
    $V$: Velocity
    $A$: Area
  ],
)

_Herhaling warmte en stromingen_

Bij lage Reynolds nummers $R e$ gaan de meeste drag door frictie zijn (wrijvingsweerstand). De frictie is evenredig met de oppervlakte $A$.
Bij complexere vormen kan de stroming loskomen van het oppervlak. Je krijgt dan achter het object een #keyterm("Wake region") (kielzog), een lagere druk zone. Dit drukverschil tussen de voorkant en achterkant van het object creëert zogenaamde vormweerstand ("pressure drag").


#figure(
  image("Wake-region.png", width: 6cm),
  caption: [Wake-region],
  label: <fig:Wake-region>,
)

== Parallel flow over vlakke plaat <sec:parallel-flow-over-flat-plate>

We zien dat warmteoverdracht een functie is van $R e$ (gerelateerd aan de dikte van de snelheidsgrenslaag) en $P_r$ (verhouding tussen de snelheids- en thermische grenslaag).

Naarmate we dichter bij het oppervlak in de grenslaag komen, neemt de snelheid af (no-slip conditie), waardoor warmteoverdracht meer op geleiding gaat lijken.

Een goede fysieke interpretatie van de thermische grenslaag is dat deze fungeert als een weerstandslaag voor warmteoverdracht (gecreëerd door de stroming en eigenschappen van de vloeistof).

Trouwens... wat als we een oneindig lange plaat hadden? Gaan de boundry layers oneindig blijven groeien?

#figure(
  image("Boundrylayer to scale.png", width: 10cm),
  caption: [Boundrylayer to scale],
  label: <fig:Boundrylayer-to-scale>,
)

Als we naar oneindig gaan gaan de boundry layers zo groot worden dat je geen convectie gaat krijgen omdat er teveel weerstand is door de boundry layers.

onze boundry layers blijven dus groeien in functie van de lengte van de plaat $x$.

*Connectie met diffusie*\

#figure(
  image("diffusie.png", width: 5cm),
  caption: [diffusie],
  label: <fig:diffusie>,
)

Je ziet bij diffusie dat je meerdere dingen kunt overbrengen. Warmte (temperatuur), massa (concentratie) en momentum (snelheid). Maar diffusie is niet perse altijd van hoog naar laag.

De #keyterm[No-slip condition] komt door de het idee van diffusie door momentum. De vloeistofmoleculen die "vastplakken" aan de wand (snelheid nul) remmen de vloeistoflagen daarboven af door middel van interne wrijving (viscositeit). Ze 'diffuseren' als het ware hun nulsnelheid naar boven, waardoor de boundary layer ontstaat.

=== Transitie naar turbulente stroming

#wrap-figure(
  image("flow vlakke plaat.png", width: 6cm),
  caption: [flow vlakke plaat],
  label: <fig:flow-vlakke-plaat>,
)[

  Bij stroming over een vlakke plaat zie je dat je stroming eerst laminair gaat stromen en dan gaat over gaan in turbulente stroming. Dit komt door de viscositeit van de vloeistof. Hoe hoger de viscositeit hoe later de overgang naar turbulente stroming.

  Wanneer is deze overgang. Het punt $x_(c r)$ is het kritisch punt waarbij de stroming turbulent wordt, deze kun je berekenen.




  $ R e_x = frac(phi V x, mu) = frac(V x, nu) $
  met $mu$ de dynamische viscositeit en $nu$ de kinematische viscositeit, $x$ de afstand langs de plaat.

  $ R e_(c r) = 5 times 10^5 = frac(phi V x_(c r), mu) $
  met $x_(c r)$ de kritische afstand.

]

=== Frictie coëfficiënt

De frictie coëfficient is afhankelijk van het Reynolds getal.
Hoe meer turbulent je stroming hoe meer frictie dat je gaat hebben.
Je coëfficient is dus afhankelijk van de geometrie en de stroming.

#wrap-figure(
  image("Heat-transfer coefficient.png", width: 5cm),
  caption: [Heat-transfer coefficient],
  label: <fig:Heat-transfer-coefficient>,
)[

  Oké je ziet dat ons vloeistof van laminair naar turbulent gaat. Welke factoren zijn hier nu in effect?

  + *Laminair:* Eerst hoge frictie coefficient $ C_(f,x) $ en dan een lage $ C_(f,x) $
  + *Transitie:* Hoge jump in frictie coefficient $ C_(f,x) $
  + *Turbulent:* Hoge frictie coefficient $ C_(f,x) $ en dan een lagere
]

Laminar: $C_f = 1.33 / R e_L^(1/2) (R e_L < 5 times 10^5)$

Turbulent: $C_f = 0.074 / R e_L^(1/5) (R e_L > 5 times 10^5)$

Rough surface, turbulent: $C_f = (1.89 - 1.62 log(epsilon/L))^(-2.5)$

- *Average friction coefficient*: $C_f = 1/L integral_0^L C_(f,x) d x$
met: $C_(f,x)$: Local friction coefficient
$L$: Characteristic length

=== Warmtestroming

- *Film temperatuur*: $T_f = (T_s + T_inf) / 2$
met: $T_s$: Oppervlakte temperatuur
$T_inf$: Vrije-stroming temperatuur

- *Heat transfer rate*: $dot(Q) = h A (T_s - T_inf)$
met: $dot(Q)$: Warmteoverdracht
$A$: Oppervlakte
$T_s$: Oppervlakte temperatuur
$T_inf$: Vrije-stroming temperatuur

- *Convectie coëfficient*: $h = frac(k Nu_L, L)$
met: $k$: Thermal conductivity
$Nu_L$: Nusselt number
$L$: Characteristic length

- *Average heat transfer coefficient*: $h_m = 1/L integral_0^L h_x d x$
met: $h_x$: Local heat transfer coefficient
$L$: Characteristic length

- *Algemene Nusselt number*: $C R e^m_L P_r^n$

Dit is de algemene nusselt number _vorige hoofdstuk_ de relatie tussen het Reynolds getal en het prandle getal. De constante $C$ en de exponenten $m$ en $n$ zijn afhankelijk van de geometrie van het object. Je kunt die op je formularium aflezen.

Laminair nusselt number: $frac(h_x x, k) = 0.332 R e_x^(1/2) P_r^(1/3)$

Turbulent nusselt number: $frac(h_x x, k) = 0.0296 R e_x^(4/5) P_r^(1/3)$

Je ziet dat de relatie van de nusselt number met de reynold number en prandtl number anders is afhankelijk van de soort stroming.

Dit is niet handig om mee te rekenen en dus gaan we dit versimplificeren. We gebruiken tabellen of voorgestelde empirische formules (gebaseerd op experimenten) met vaste constanten, afhankelijk van of de stroming laminair of turbulent is.

#frm(
  "Average Nusselt number for flow over a flat plate",
  [
    $ Nu_L = frac(h_m L, k) $

    $ Nu_L = 0.664 R e_L^(1/2) P_r^(1/3)\ ("Laminar") $

    $ Nu_L = 0.037 R e_L^(4/5) P_r^(1/3) \ ("Turbulent") $

    $ Nu_L = (0.037 R e_L^(4/5) - 871) P_r^(1/3) \ ("Laminair + turbulent") $
  ],
  [
    $h_m$: Average heat transfer coefficient
    $L$: Characteristic length
    $k$: Thermal conductivity
  ],
)

#figure(
  image("nussel number average depending on fluid type.png", width: 6cm),
  caption: [nussel number average depending on fluid type],
  label: <fig:nussel-number-average-depending-on-fluid-type>,
)

=== Unheated starting length <sec:unheated-starting-length>

#concept(title: "Unheated Starting Length")[
  Soms begint de verwarming of koeling van een plaat pas na een initiële onverwarmde sectie met lengte $xi$.
  De snelheidsgrenslaag (hydrodynamisch) begint direct op te bouwen vanaf $x=0$, maar de thermische grenslaag begint pas te groeien vanaf $x=xi$.
]

=== Uniform Heat flux <sec:uniform-heat-flux>

#concept(title: "Uniform Heat Flux ($dot(q)_s = $ constant)")[
  Hierbij is niet de oppervlaktetemperatuur constant, maar de *warmte-energie die per vierkante meter wordt afgegeven* (bijv. bij een elektrische warmteweerstand of zonnestraling).

  Omdat de convectiecoëfficiënt $h_x$ stroomafwaarts daalt (de koeling wordt slechter), *moet de lokale plaattemperatuur $T_s(x)$ stijgen* om dezelfde hoeveelheid constante warmte aan de vloeistof te kunnen overdragen.
]

$ dot(Q) = dot(q)_s A_s $ // Totale warmte (W)

$ dot(q)_s = h_x (T_s(x) - T_inf) arrow.r T_s(x) = T_inf + frac(dot(q)_s, h_x) $ // Berekening lokale oppervlaktetemperatuur


== Flow over cylinders and spheres <sec:flow-over-cylinders-and-spheres>

Nu gaan we zien wat de vloeiïng is rond ronde objecten zoals cilinders en bollen.

Bij zeer lage snelheden stroomt de vloeistof volledig rond de cilinder. De stroming in de wake region (kielzog) wordt gekenmerkt door periodieke wervelvorming en lage drukken.

De frictie drag en druk drag kan groot zijn. De grootste impact van de drag kracht bij een lage #keyterm("Reynoldsgetal") is het #keyterm("frictie drag") en bij een hoge #keyterm("Reynoldsgetal") is het #keyterm("druk drag").


#figure(
  image("algemeen drag coëfficient over cilinder en bol.png", width: 10cm),
  caption: [algemeen drag coëfficient over cilinder en bol],
  label: <fig:algemeen-drag-coëfficient-over-cilinder-en-bol>,
)

=== Effect van ruwheid <sec:effect-van-ruwheid>

ruwheid van het oppervlakte zorgt voor grote veranderingen van de drag coëfficient. Meestal vergroot het de drag coëfficient in turbulente stroming. Zeker in gestroomlijnde objecten.

blunt objecten kan de ruwheid de drag coefficient vergroten of verkleinen. Dit hangt af van de stroming en dus het reynoldsgetal.

#figure(
  image("ruwheid effect.png", width: 10cm),
  caption: [ruwheid effect],
  label: <fig:ruwheid-effect>,
)

=== Heat transfer coefficient over cylinder and sphere <sec:heat-transfer-coefficient-over-cylinder-and-sphere>

door flow seperatie is het moeilijk om analytisch de flow te berekenen.


#figure(
  image("heat transfer coefficient bol en cilinder.png", width: 6cm),
  caption: [heat transfer coefficient bol en cilinder],
  label: <fig:heat-transfer-coefficient-bol-en-cilinder>,
)

#frm(
  "Nusselt nummer voor stroming over een cilinder",
  [
    $
      Nu_"cyl" = (h D)/k = 0.3 + (0.62 R e^(1/2) P r^(1/3)) / (1 + (0.4 / P r)^(2/3))^(1/4) [1 + (R e / 282000)^(5/8)]^(4/5)
    $
    _Geldig voor $R e P r > 0.2$_
  ],
  [
    Eigenschappen worden geëvalueerd bij de *filmtemperatuur* $T_f = 1/2 (T_inf + T_s)$
    $D$: Diameter
    $k$: Thermal conductivity
  ],
)

#frm(
  "Nusselt nummer voor stroming over een bol",
  [
    $ Nu_"sph" = (h D)/k = 2 + [0.4 R e^(1/2) + 0.06 R e^(2/3)] P r^0.4 (mu_inf / mu_s)^(1/4) $
    _Geldig voor $3.5 <= R e <= 80000$ en $0.7 <= P r <= 380$_
  ],
  [
    Eigenschappen worden geëvalueerd bij de *vrije-stroming temperatuur* $T_inf$, behalve $mu_s$, welke wordt geëvalueerd bij de *oppervlakte temperatuur* $T_s$.
    $mu_inf$: Dynamische viscositeit (vrije-stroming)
    $mu_s$: Dynamische viscositeit (oppervlakte)
    $D$: Diameter
    $k$: Thermal conductivity
  ],
)

#frm(
  "Empirisch Nusselt nummer voor stroming over een cilinder",
  [
    $ Nu_"cyl" = (h D)/k = C R e^m P r^n $
    _Waarbij $n = 1/3$_
  ],
  [
    Constanten $C$ en $m$ zijn gegeven in de bijbehorende tabellen.
  ],
)

== Flow Across Banks of Tubes <sec:flow-across-banks-of-tubes>

#TODO("Hier moet nog veel meer komen")

//todo("Hier moet nog veel meer komen")
