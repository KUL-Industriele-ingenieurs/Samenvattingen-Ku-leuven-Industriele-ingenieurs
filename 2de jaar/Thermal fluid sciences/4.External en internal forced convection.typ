#import "../../school-template.typ": *
= External en internal forced convection <ch:External-en-internal-forced-convection>

We gaan convectie forceren. Voor lucht via een turbine en voor een vloeistof via een pomp. We gaan de richting van convectie eigenlijk tegenwerken en zo warmte transporteren. Door een vloeistof of gas dwars over of door een hete/koude oppervlak te leiden, versnellen we aanzienlijk de warmteoverdracht via erzwongen convectie.

#concept(title: "Vrije-stroming snelheid en upstream snelheid")[

  *Vrije-stroming*\
  De snelheid van een vloeistof relativief tot een ondergedompeled vast object ver genoeg van het object. Geen effect van het object op de snelheid $v$

  *Upstream snelheid*\
  Is de snelheid van het vloeistof van voor het lichaam.

]

== Drag en warmteoverdracht external flow <sec:Drag-en-warmteoverdracht-external-flow>

Druk en frictie hebben grote impacten op de richting van convectie. Drag (stromingsweerstand) beïnvloedt hoe vloeistoflagen langs een oppervlak stromen, wat direct de warmteoverdracht bepaalt.

De #keyterm[velocity boundary layer] en #keyterm[thermal boundary layer] hebben beide een effect op convectie. De verhouding tussen de diktes van deze twee grenslagen wordt uitgedrukt met het Prandtl-nummer $P_r$. (Bijv. $P_r approx 1$ voor gassen betekent dat beide lagen ongeveer even snel groeien).

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

Bij lage Reynolds nummers $R e$ gaan de meeste drag door frictie zijn (wrijvingsweerstand). De frictie is evenredig met de oppervlakte $A$ omdat meer oppervlak meer contact met het vloeistof betekent.
Bij complexere vormen kan de stroming loskomen van het oppervlak. Je krijgt dan achter het object een #keyterm("Wake region") (kielzog), een lagere druk zone. Dit drukverschil tussen de voorkant en achterkant van het object creëert zogenaamde vormweerstand ("pressure drag"). Dit effect wordt belangrijker naarmate het Reynolds getal toeneemt.


#figure(
  image("Wake-region.png", width: 6cm),
  caption: [Wake-region],
  label: <fig:Wake-region>,
)

== Parallel flow over vlakke plaat <sec:parallel-flow-over-flat-plate>

We zien dat warmteoverdracht een functie is van $R e$ (gerelateerd aan de dikte van de snelheidsgrenslaag) en $P_r$ (verhouding tussen de snelheids- en thermische grenslaag).

Naarmate we dichter bij het oppervlak in de grenslaag komen, neemt de snelheid af (no-slip conditie), waardoor warmteoverdracht meer op geleiding gaat lijken.

Een goede fysieke interpretatie van de thermische grenslaag is dat deze fungeert als een weerstandslaag voor warmteoverdracht (gecreëerd door de stroming en eigenschappen van de vloeistof). Hoe dunner deze laag, hoe beter de warmteoverdracht—dus snellere stroming is over het algemeen beter.

Trouwens... wat als we een oneindig lange plaat hadden? Gaan de boundry layers oneindig blijven groeien?

#figure(
  image("Boundrylayer to scale.png", width: 12cm),
  caption: [Boundrylayer to scale],
  label: <fig:Boundrylayer-to-scale>,
)

Als we naar oneindig gaan gaan de boundry layers zo groot worden dat je geen convectie gaat krijgen omdat er teveel weerstand is door de boundry layers.

onze boundry layers blijven dus groeien in functie van de lengte van de plaat $x$.

*Connectie met diffusie*\

#figure(
  image("diffusie.png", width: 10cm),
  caption: [Diffusie],
  label: <fig:diffusie>,
)

Je ziet bij diffusie dat je meerdere dingen kunt overbrengen. Warmte (temperatuur), massa (concentratie) en momentum (snelheid). Maar diffusie is niet perse altijd van hoog naar laag.

De #keyterm[No-slip condition] komt door het idee van diffusie door momentum. De vloeistofmoleculen die "vastplakken" aan de wand (snelheid nul) remmen de vloeistoflagen daarboven af door middel van interne wrijving (viscositeit). Ze 'diffuseren' hun nulsnelheid naar boven, wat een snelheidsgradiënt creëert en de boundary layer vormt. Dit is dezelfde fysica als bij warmte- en massadiffusie, alleen voor momentum.

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

#wrap-figure(
  image("Heat-transfer coefficient.png", width: 6cm),
  caption: [Heat-transfer coefficient],
  label: <fig:Heat-transfer-coefficient>,
)[

  De frictie coëfficient is afhankelijk van het Reynolds getal.
  Hoe meer turbulent je stroming hoe meer frictie dat je gaat hebben.
  Je coëfficient is dus afhankelijk van de geometrie en de stroming.

  Oké je ziet dat ons vloeistof van laminair naar turbulent gaat. Welke factoren zijn hier nu in effect?

  + *Laminair:* Eerst hoge frictie coefficient $C_(f,x)$ en dan een lage $C_(f,x)$
  + *Transitie:* Hoge jump in frictie coefficient $C_(f,x)$
  + *Turbulent:* Hoge frictie coefficient $C_(f,x)$ en dan een lagere

  Laminar: $ C_f = 1.33 / R e_L^(1/2) (R e_L < 5 times 10^5) $

  Turbulent: $ C_f = 0.074 / R e_L^(1/5) (R e_L > 5 times 10^5) $

  Rough surface, turbulent: $ C_f = (1.89 - 1.62 log(epsilon/L))^(-2.5) $

  - *Average friction coefficient*: $ C_f = 1/L integral_0^L C_(f,x) d x $
  met: $C_(f,x)$: Local friction coefficient
  $L$: Characteristic length
]


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

Laminair nusselt number:
$ frac(h_x x, k) = 0.332 R e_x^(1/2) P_r^(1/3) $

Turbulent nusselt number:
$ frac(h_x x, k) = 0.0296 R e_x^(4/5) P_r^(1/3) $

Je ziet dat de relatie van de nusselt number met de reynold number en prandtl number anders is afhankelijk van de soort stroming.

Dit is niet praktisch om mee te rekenen gegeven de complexe afhankelijkheden. We gebruiken daarom tabellen of empirische formules (gebaseerd op experimenten) met vaste constanten, afhankelijk van of de stroming laminair of turbulent is. Deze formules geven nauwkeurige resultaten voor standaardgeometriëen.

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
  Dit betekent dat in de onverwarmde zone de vloeistof al aan het vertragen is, wat de warmteoverdracht in de verwarmde zone verbetert.
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
  image("heat transfer coefficient bol en cilinder.png", width: 4.5cm),
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



#wrap-figure(
  image("Flow over tube banks.png", width: 2.5cm),
  caption: [Flow over tube banks],
  label: <fig:Flow-over-tube-banks>,
)[

  #concept(title: "Cross-flow over tube banks")[
    Cross-flow over tube banks wordt veel aangetroffen in warmtewisselaars. In zulke apparaten stroomt één vloeistof door de buizen terwijl de ander loodrecht over de buizen stroomt.

    De buizen beïnvloeden het stromingspatroon en de turbulentiegraad stroomafwaarts, wat de warmteoverdracht aanzienlijk verandert.
  ]

  *Meetgroottes tussen buiscentra:*
  - $S_T$: Transversale spoed (dwarskant)
  - $S_L$: Longitudinale spoed (langskant)
  - $S_D$: Diagonale spoed

  De buitendiameter $D$ is de karakteristieke lengte.
]

*Standaard arrangementen:*
- #keyterm("In-line") arrangement: Buizen in rijen achter elkaar
- #keyterm("Staggered") arrangement: Buizen verspeeld voor betere stromingsmixing

=== Snelheidsberekening <sec:snelheid-tube-banks>

*Diagonale spoed:*
$ S_D = sqrt(S_T^2 + (S_T / 2)^2) $

*In-line arrangement:*
Uit continuïteit: $rho V A_1 = rho V_(max) A_T$

$ V_(max) = frac(S_T, S_T - D) V $

*Staggered arrangement (als $S_D < (S_T + D)/2$):*

$ V_(max) = frac(S_T, 2(S_D - D)) V $

*Reynolds getal (karakteristiek):*
$ R e_(D) = frac(rho V_(max) D, mu) = frac(V_(max) D, nu) $

=== Warmteoverdracht <sec:warmteoverdracht-tube-banks>

#frm(
  "Nusselt nummer voor tube banks",
  [
    $ N u_D = frac(h D, k) = C R e_D^m P r^n (P r / P r_s)^(1/4) $
  ],
  [
    $C, m, n$: Constanten uit tabellen (afhankelijk van arrangement en rijen)
    $(P r / P r_s)^(1/4)$: Correctieterm voor viscositeit
    Voor buizen banken met meer dan 16 rijen gebruiken
  ],
)

*Logaritmische gemiddelde temperatuurverschil:*
$
  Delta T_m = frac((T_i - T_e) - (T_s - T_i), ln[(T_i - T_e)/(T_s - T_i)]) = frac(Delta T_e - Delta T_i, ln(Delta T_e / Delta T_i))
$

met: $T_i$ = Inlaattemperatuur, $T_e$ = Uitlaattemperatuur, $T_s$ = Buiswandtemperatuur

*Uitlaattemperatuur:*
$ T_e = T_i - (T_i - T_s) exp(- frac(A_s h, m c_p)) $

*Warmteoverdracht:*

$ A_s = N pi D L quad "en" quad m dot = rho V = rho V (N_T S_T L) $

$ Q dot = h A_s Delta T_m = m dot c_p (T_e - T_i) $

met:
- $N$: Totaal aantal buizen
- $N_T$: Aantal buizen per rij

=== Drukval <sec:drukval-tube-banks>

#frm(
  "Drukval over tube bank",
  [
    $ Delta P = N_L f rho frac(V_(max)^2, 2) $
  ],
  [
    $N_L$: Aantal rijen in stroomrichting
    $f$: Wrijvingsfactor (uit tabellen)
    $V_(max)$: Maximale snelheid tussen buizen
  ],
)

*Pomp vermogen:*
$ W_(p u m p) = V dot Delta P = m dot frac(Delta P, rho) $

met: $V = V(N_T S_T L)$ = Totaal volumetrische stroomsnelheid



#TODO("Hier moet nog veel meer komen")

//todo("Hier moet nog veel meer komen")

= Internal forced convection <sec:internal-forced-convection>

In het vorig hoofdstuk hebben we *External forced convection gezien* Dit is een algemene vorm van convectie waarbij er water stroomt of lucht langs een oppervlak of object. In dit hoofdstuk gaan we kijken naar *Internal forced convection*, waarbij de vloeistof door een kanaal of buis stroomt.

External flow focussed zich op het meganisch deel of aerodynamichs drag. Internal flow gaat zich focussen op de effecten van muuren en pijpen op de stroming en warmteoverdracht. Dit gaat namelijk een pressure dorp geven $Delta P$

#highlight[Dus nu gaan we kijken wat de effecten zijn van naar de effecten van pijpen en muren op de stroming en warmteoverdracht.]

#wrap-figure(
  image("noslip in pijp.png", width: 6cm),
  caption: [noslip conditie in pijp],
  label: <fig:noslip-in-pijp>,
)[

  We weten van het vorige hoofdstuk dat no slip ervoor zorgt dat je een boundary layer krijgt die de snelheid van de stroming tegenhoudt langs de wanden. Je krijgt dan een parabool waarbij de maximale snelheid $V_(m a x)$ in het midden van de buis is en de snelheid nul is aan de wanden.

  Om dit te versimplificeren gaan we werken met de gemiddelde snelheid $V_(a v g)$ die constant is in een incompressable cross section $A$ van de buis.

  $V_A$ hangt af van de warmte en cooling door daar de densiteit van veranderd $phi$ maar we gaan deze effecten meestal weglaten en de stroming $V_A$ beoordelen over een constante warmte $T_(a v g)$

]

== Entrance region <sec:entrance-region>

=== Snelheid

#figure(
  image("Entrance region.png", width: 5cm),
  caption: [Entrance region],
  label: <fig:Entrance-region>,
)

In de figuur zie je hoe de stroom regeert wanneer het de buis binnenkomt. Je krijgt de volgende stappen:

- *Snelheidsgrenslaag (boundary layer):* Het gebied waar visceuze (viskeuze) wrijvingskrachten voelbaar zijn. Door moleculaire wrijving tussen vloeistof en buiswand. De hypothetische grensoppervlak verdeelt de stroming in twee gebieden:
  - *Grenslaaggebied:* Het gebied dicht tegen de wand waar snelheid sterk verandert. Visceuze effecten zijn heel belangrijk. Snelheid gaat van 0 aan de wand naar bijna maximaal buiten het gebied.
  - *Irrotationale (kern) stroming:* Het centrale deel van de buis buiten de grenslaag. Snelheid is hier vrijwel constant in radiale richting. Wrijving verwaarloosbaar.

- *Hydrodynamisch ingangsgebied:* De zone vanaf de buis-ingang tot waar het snelheidsprofiel volledig ontwikkeld is. De grenslaag groeit voortdurend naarmate je verder in de buis gaat.

- *Ingangslengte Lh:* De afstand die nodig is voor de grenslaag om volledig te groeien.

- *Volledig ontwikkeld hydrodynamisch gebied:* Na de ingangslengte: snelheidsprofiel is stabiel en verandert niet meer. Het paraboolprofiel blijft constant over de rest van de buis.

#highlight[Vloeiïng in de entrance region noemen we de *hydrodynamically developing region*]


=== Temperatuur

#figure(
  image("Thermal boundry layr.png", width: 6cm),
  caption: [Thermal boundry layer developent in buis],
  label: <fig:Thermal-boundry-layr>,
)
Net zoals bij snelheid heb je opnieuw je #keyterm[thermische grenslaag(thermal boundry layer)] die groeit vanaf de ingang van de buis. Je hebt dus een *thermisch ingangsgebied* en een *volledig ontwikkeld thermisch gebied*.


=== Nusselt nummer in de entrance region

#theorie(title: "Nusselt number herhaling")[

  Het Nusselt getal (Nu) is een dimensieloos (eenheidsloos) getal dat binnen de thermodynamica wordt gebruikt om warmteoverdracht te analyseren. Het vergelijkt de warmteoverdracht via convectie met de warmteoverdracht via conductie (geleiding) binnen een fluïdum (vloeistof of gas)

  Het geeft de versterking (enhancement) van de warmteoverdracht door een fluïdumlaag weer die ontstaat doordat het fluïdum beweegt (convectie),vergeleken met wanneer het fluïdum volledig stil zou staan (conductie)
  $ N_u = frac("convectie" +"Conductie", "Conductie") $
  $N_u = 1 arrow.r.double "puur conductie"$
  $ N_u = frac(h dot L_c, k) $

  met $h$: Convectie coëfficiënt
  $L_c$: Karakteristieke lengte van de geometrie
  $k$: Thermische geleidbaarheid

]

#figure(
  image("Nusselt number over lengte.png", width: 6cm),
  caption: [Nusselt number over lengte],
  label: <fig:Nusselt-number-over-lengte>,
)

De nusselt number is veel groter in de entrance region en valt dan af naar een constante waarde in het volledig ontwikkelde gebied.


== General Thermal analysis <sec:general-thermal-analysis>

We maken eerst wat approximaties:
- $ T_s ("omgeving") = "constant" $
- $dot(q) ("Heat flux") = "constant"$

#wrap-figure(
  image("General thermal analysis.png", width: 5cm),
  caption: [General thermal analysis],
  label: <fig:General-thermal-analysis>,
)[

  Dit is een stroming probleem _Denk stromingen massa in = massa out_

  $ dot(Q) = dot(m) c_p (T_(e) - T_(i)) [W] $

  met de heat flux:
  $dot(q_s) = h_x (T_s - T_m) [W slash m^2]$
  met $ h_x $: de locale heat transfer coefficient.
]

*Constante heat flux $(dot(q))$*\
$dot(q)$ is constant dus over heel het oppervlakte van de buis gaat de
heat flux hetzelfde zijn.



#figure(
  image("Heatflux buis.png", width: 8cm),
  caption: [Heatflux buis],
  label: <fig:Heatflux-buis>,
)

*Constante oppervlaktetemperatuur $T_s$*\

Wanneer de oppervlaktetemperatuur constant is,
verandert de vloeistoftemperatuur wel naarmate deze door de buis stroomt.

=== Arithmetisch gemiddelde temperatuurverschil

De eenvoudigste benadering is het gebruik van het arithmetisch gemiddelde
temperatuurverschil:

$
  Delta T_("avg") = Delta T_("am") = frac(Delta T_i + Delta T_e, 2) = frac((T_s - T_i) + (T_s - T_e), 2) = T_s - frac(T_i + T_e, 2)
$

De #keyterm["bulk mean fluid temperature"] is: $T_b = (T_i + T_e) / 2$

Door het arithmetisch gemiddelde temperatuurverschil te gebruiken,
#underline[nemen we aan dat de vloeistoftemperatuur lineair langs de buis varieert],
wat in realiteit zelden het geval is, vooral wanneer $T_s$ = constant.

Deze vereenvoudigde benadering geeft vaak aanvaardbare resultaten,
maar niet altijd.
Daarom hebben we een betere manier nodig om $Delta T_("avg")$ te bepalen.

=== Logaritmisch gemiddelde temperatuurverschil (LMTD)

In werkelijkheid verandert de vloeistoftemperatuur *exponentieel* naarmate ze door de buis stroomt (niet lineair).
Het LMTD is een *exacte* voorstelling van het gemiddelde temperatuurverschil tussen vloeistof en oppervlak.

#frm(
  "Log mean temperature difference",
  [
    $ dot(Q) = h A_s Delta T_(l n) $

    $
      Delta T_(ln) = frac(Delta T_e - Delta T_i, ln(Delta T_e / Delta T_i))
      = frac((T_s - T_e) - (T_s - T_i), ln[(T_s - T_e) / (T_s - T_i)])
    $

    $ T_e = T_s - (T_s - T_i) e^(- h A_s / (dot(m) c_p)) $
  ],
  [
    $Delta T_i = T_s - T_i$: Temperatuurverschil aan de inlaat \
    $Delta T_e = T_s - T_e$: Temperatuurverschil aan de uitlaat \
    $h$: Gemiddelde convectiecoëfficiënt \
    $A_s$: Oppervlakte van de buis
  ],
)

*NTU — Number of Transfer Units*

$ "NTU" = frac(h A_s, dot(m) c_p) $

NTU is een maat voor de *effectiviteit* van het warmteoverdrachtsysteem:
- Voor NTU $= 5$ geldt $T_e approx T_s$: het maximum van warmteoverdracht is bereikt.
- Kleine NTU $arrow$ vloeistof verlaat de buis ver van $T_s$, er is nog veel potentieel.
- NTU > 5 heeft weinig zin: de vloeistof bereikt $T_s$ toch al bij de uitlaat, ongeacht de inlaattemperatuur.

*Wanneer mag je de arithmetische benadering gebruiken?*

Als $Delta T_e$ en $Delta T_i$ niet meer dan *40% van elkaar afwijken*, is de fout van het arithmetisch gemiddelde minder dan 1%. In alle andere gevallen gebruik je het LMTD.


== Alles tesamen

Entrance region: $ Nu = 3.66 + frac(0.065 (D slash L) R_e P r, 1 + 0.04 [(D slash L) R_e P r)]^(2 slash 3)) $
