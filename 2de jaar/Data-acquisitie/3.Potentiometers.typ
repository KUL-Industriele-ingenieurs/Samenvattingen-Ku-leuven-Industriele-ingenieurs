#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/3.potentiometers.pdf | Samenvatting DAQ p.10-12
//       Samenvatting 2024-2025 p.12 | Samenvatting 1ste versie p.1 | examenvragen 2016, 23-24, 25-26

= Potentiometers <ch:potentiometer>

Een *verplaatsingssensor* meet de translatie van een punt langs een lijn, of de rotatie rond een as. De eenvoudigste is de *resistieve potentiometer*: een weerstand met een loper (wiper) die meeschuift met de beweging.

== Werkingsprincipe en eigenschappen <sec:poti-principe>

De potentiometer is een *spanningsdeler*. Over de volledige weerstand $R_p$ staat de excitatiespanning $e_"ex"$. De loper neemt een deel van die spanning af, evenredig met zijn positie $x_"in"$ op de totale lengte $x_"tot"$. Onbelast is dat verband exact lineair:

#frm(
  "Onbelaste potentiometer",
  $e_"uit" / e_"ex" = x_"in" / x_"tot"$,
  [De uitgangsspanning is evenredig met de positie van de loper.],
)

met:
- $e_"uit"$ --- spanning tussen loper en massa [V]
- $e_"ex"$ --- excitatiespanning over de volledige potentiometer [V]
- $x_"in"$ --- positie van de loper (lengte of hoek) [m of °]
- $x_"tot"$ --- totale slag van de potentiometer [m of °]

#figure(
  image("assets/L3-types.png", width: 8cm),
  caption: [Translatie-, enkelslag- en meerslagpotentiometer, en het lineaire verband tussen positie en uitgang (slide 3)],
  label: <fig:L3-types>,
)

Typische waarden uit de slides:
- bereik: $5 "mm"$ tot $50 "cm"$ in translatie, $10 degree$ tot $50$ omwentelingen in rotatie;
- weerstand van $10 thin Omega$ tot $1 thin "M"Omega$;
- gevoed met DC of AC. Bij DC verstoren toestellen op dezelfde voeding het signaal. Bij AC krijg je een wisselspanning terug en kan je de DC-storingen eruit filteren (Samenvatting 1ste versie p.1).

=== Materialen en modellen <sec:poti-materialen>

Het weerstandselement bepaalt prijs, resolutie en levensduur:

#table(
  columns: (auto, auto, 1fr),
  align: (left, center, left),
  table.header([*Type*], [*Prijs*], [*Eigenschappen*]),
  [Koolstof (carbon)], [1--2 euro], [goedkoop, maar beperkte precisie en kortere levensduur],
  [Gewikkelde draad (wire wound)], [10--20 euro], [nauwkeuriger en duurzamer, groot bereik; maar de uitgang gaat in *trapjes*],
  [Geleidend plastic (conductive plastic)], [100--200 euro], [hoge resolutie, weinig wrijving, lange levensduur],
)

Bij de gewikkelde potentiometer springt de loper van winding naar winding. De weerstand verandert dus in stapjes en dat beperkt de *resolutie* (@sec:resolutie). Koolstof en geleidend plastic hebben dat probleem niet.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L3-wirewound-resolutie.png", width: 70%),
    caption: [Gewikkelde potentiometer: de weerstand stijgt in trapjes (slide 5)],
    label: <fig:L3-wirewound-resolutie>,
  ),
  figure(
    image("assets/L3-conductive-plastic.png", width: 80%),
    caption: [Potentiometers met geleidend plastic (slide 7)],
    label: <fig:L3-conductive-plastic>,
  ),
)

Het tweede probleem is *wrijving*: de loper schuurt over het element, wat slijtage geeft en een wrijvingskracht op het systeem dat je meet. Ook hier scoort geleidend plastic het best.

=== Eigenschappen <sec:poti-eigenschappen>

Samengevat volgens de slides: een potentiometer is *ideaal lineair* (onbelast), heeft *wrijving* en *hysteresis*, geeft een *ruisspanning* (door de wisselende contactweerstand van de loper) en is geschikt voor *relatief grote verplaatsingen*.

=== Maximale excitatiespanning <sec:poti-excitatie>

Een grotere excitatiespanning geeft een groter signaal en dus een betere signaal-ruisverhouding. Maar de weerstand warmt op, en het vermogen dat hij mag dissiperen is beperkt:

#frm(
  "Maximale excitatiespanning",
  $e_"ex" = sqrt(P_"max" R_"pot")$,
  [Volgt uit $P = e^2 \/ R$: boven deze spanning dissipeert de potentiometer meer dan toegelaten.],
)

met:
- $P_"max"$ --- maximaal toegelaten vermogen van de potentiometer [W]
- $R_"pot"$ --- totale weerstand van de potentiometer [$Omega$]

In de praktijk kies je een spanning tussenin: groot genoeg voor een goed signaal, klein genoeg om de warmte te beperken. Omdat de uitgang $e_"ex" dot x_"in" \/ x_"tot"$ is, komt elke variatie van $e_"ex"$ rechtstreeks in de meting terecht.

#examenvraag("23-24 vraag 9, 25-26 vraag 8, voorbeeldexamen 2024", [De excitatiespanning bij resistieve verplaatsingssensoren ...],
  opties: (
    [moet een DC-spanning zijn],
    [meet je best continu om fouten bij variaties te corrigeren],
    [maak je best zo klein mogelijk],
    [mag nooit meer afwijken dan 1 %],
  ),
  juist: "B",
)[De uitgang is $e_"ex" dot x_"in" \/ x_"tot"$, dus een drift op $e_"ex"$ zit één op één in je meting. Meet je $e_"ex"$ mee en deel je erdoor, dan valt hij weg. A klopt niet: AC mag ook. C is net slecht: een kleine excitatie geeft een klein signaal dat in de ruis verdwijnt.]

== Belastingseffect en niet-lineair gedrag <sec:poti-belasting>

Zodra je een meetinstrument met ingangsweerstand $R_m$ aan de loper hangt, staat $R_m$ *parallel* over het onderste deel van de potentiometer. Dat deel krijgt een kleinere weerstand, en de uitgang zakt. Het verband is dan niet meer lineair:

#frm(
  "Belaste potentiometer",
  $e_"uit" / e_"ex" = 1 / (x_"tot" / x_"in" + R_p / R_m (1 - x_"in" / x_"tot"))$,
  [Voor $R_p \/ R_m -> 0$ (onbelast) vind je terug $e_"uit" \/ e_"ex" = x_"in" \/ x_"tot"$.],
)

met:
- $R_p$ --- totale weerstand van de potentiometer [$Omega$]
- $R_m$ --- ingangsweerstand van het meetinstrument [$Omega$]

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (7, 5),
      x-label: [$x_"in" \/ x_"tot"$],
      y-label: [$e_"uit" \/ e_"ex"$],
      x-min: 0, x-max: 1, y-min: 0, y-max: 1,
      x-tick-step: 0.25, y-tick-step: 0.25,
      x-grid: true, y-grid: true,
      legend: "inner-north-west",
      {
        let belast(r) = a => if a == 0 { 0 } else { 1 / (1 / a + r * (1 - a)) }
        plot.add(domain: (0, 1), belast(0), style: (stroke: schoolGray + 1.5pt), label: [$R_p \/ R_m = 0$ (onbelast)])
        plot.add(domain: (0, 1), belast(1), style: (stroke: schoolBlue + 1.5pt), label: [$R_p \/ R_m = 1$])
        plot.add(domain: (0, 1), belast(10), style: (stroke: schoolRed + 1.5pt), label: [$R_p \/ R_m = 10$])
      },
    )
  })
]

Hoe kleiner $R_m$ tegenover $R_p$, hoe dieper de kromme doorzakt. De fout is het grootst rond het midden van de slag. Daar is de parallelschakeling het zwaarst en ligt de loper het verst van beide uiteinden, waar de uitgang altijd klopt ($0$ en $e_"ex"$).

#figure(
  image("assets/L3-belasting.png", width: 11cm),
  caption: [(a) Belaste potentiometer en de doorzakkende karakteristiek, (b) compensatie met een extra weerstand $R_"lin"$ (slide 10)],
  label: <fig:L3-belasting>,
)

Twee oplossingen:
- een *compensatieweerstand* $R_"lin"$ (met dezelfde waarde als $R_m$) over het bovenste deel. Die trekt de kromme terug naar de rechte (rechts in @fig:L3-belasting);
- de computer laten corrigeren: het verband tussen $e_"uit"$ en $e_"ex"$ is gekend, dus je kan terugrekenen naar $x_"in"$ (Samenvatting 1ste versie p.1).

De beste oplossing blijft een meetinstrument met $R_m >> R_p$.

#examenvraag("2016 vraag 3, juni 2016 vraag 15", [Bij een resistieve verplaatsingssensor is de ingangsweerstand van het meetsysteem best ...],
  opties: (
    [zo laag mogelijk],
    [zo hoog mogelijk],
    [onbelangrijk],
    [gelijk aan de uitgangsweerstand],
  ),
  juist: "B",
)[Met $R_m >> R_p$ gaat $R_p \/ R_m$ naar nul en blijft het lineaire verband over. Een getalvoorbeeld met $alpha = x_"in" \/ x_"tot" = 0.5$: met $R_p = R_m = 10 thin "k"Omega$ lees je $0.4$ in plaats van $0.5$ (20 % fout), met $R_m = 1 thin "M"Omega$ nog maar $0.25 %$ fout. D is de valstrik: $R_m = R_"out"$ is de regel voor maximale *vermogensoverdracht*. Bij meten wil je maximale *spanningsoverdracht*.]

== Rekenvoorbeeld: foutenvoortplanting <sec:poti-oefening>

De slides van de inductieve sensoren eindigen met een oefening over een potentiometer die wordt uitgelezen door een PLC-ingangskaart. Ze past de foutenvoortplanting uit @sec:normale-verdeling toe.

#voorbeeld(title: "Draaipotentiometer op een WAGO-weerstandsingang (slides 31-36 van Induction)")[
  Een draaipotentiometer (TW 10 k$Omega$) wordt uitgelezen als weerstand door een WAGO 750-451. De weerstand tussen loper en uiteinde is
  $ R_2 = (R_"pot" + K_M Delta T) (1 - theta / theta_"max") $
  met $theta_"max" = 265 degree$ ($sigma = 5 degree \/ sqrt(3)$, een foutband van $plus.minus 5 degree$, zie @sec:tolerantie), $K_M = 10^(-4) thin Omega"/°C"$, $Delta T = 20 degree"C"$ ($sigma = 0.1 degree"C"$) en $theta$ exact gekend ($sigma_theta = 0$). Hoe nauwkeurig is $R_2$, en welke hoek leest de PLC?

  *Stap 1 --- foutenvoortplanting.* Elke onzekere parameter telt mee met zijn partiële afgeleide:
  $ sigma_(R_2)^2 = ((theta (R_"pot" + K_M Delta T)) / theta_"max"^2)^2 sigma_(theta_"max")^2 + (1 - theta / theta_"max")^2 sigma_(R_"pot")^2 + (K_M (1 - theta / theta_"max"))^2 sigma_(Delta T)^2 $

  *Stap 2 --- bij $theta = 0$.* De eerste term valt weg. Er blijft vooral de tolerantie van $R_"pot"$ over. Met een foutband van $plus.minus 2000 thin Omega$ is $sigma_(R_"pot") = 2000 \/ sqrt(3) = 1155 thin Omega$, en dus ook $sigma_(R_2) approx 1155 thin Omega$. *Kalibreer* je de potentiometer ($sigma_(R_"pot") = 0.1 thin Omega$), dan zakt dat naar $sigma_(R_2) = 0.1 thin Omega$.

  #NOTE[De slide vult hier $R_"pot" = 20000$ in en geeft $sigma_(R_2) = 258 thin Omega$; met $sigma = 2000\/sqrt(3)$ kom je op $1155 thin Omega$. De conclusie (kalibreren!) blijft dezelfde.]

  *Stap 3 --- bij $theta = theta_"max" = 265 degree$*, gekalibreerd met $R_"pot" = 6000 thin Omega$. Nu valt de term met $sigma_(R_"pot")$ weg ($1 - theta\/theta_"max" = 0$), maar de onzekerheid op $theta_"max"$ telt volop:
  $ sigma_(R_2)^2 = (6000 / 265)^2 dot 25 / 3 = 4272 thin Omega^2 quad => quad sigma_(R_2) = 65.4 thin Omega $

  *Stap 4 --- de PLC-ingang.* De WAGO-kaart meet $R_3 = R_2 + a$ met een resolutie van $0.2 thin Omega$ ($sigma_a = 0.2 \/ sqrt(3)$). Ze zet die om naar een getal $N = K_1 R_3$, met $K_1 = N_"max" \/ R_"pot" = 25000 \/ 6000 = 4.167$. De PLC rekent terug naar een hoek $theta_m = K_2 N$, met $K_2 = theta_"max" \/ N_"max" = 265 \/ 25000 = 0.0106$:
  $ theta_m = K_2 K_1 (R_2 + a) quad quad sigma_(theta_m)^2 = (K_2 K_1)^2 sigma_(R_2)^2 + (K_2 K_1)^2 sigma_a^2 $
  $ sigma_(theta_m) = 0.04417 dot sqrt(4272 + 0.013) = 2.89 degree $

  #NOTE[De slide geeft $sigma_(theta_m) = 0.357 degree$: daar is $sigma_(R_2) = 65.36$ niet gekwadrateerd. Correct is $2.89 degree$, precies de onzekerheid $5 degree \/ sqrt(3)$ op $theta_"max"$.]

  *Kerninzicht:* de resolutie van de ingangskaart ($0.2 thin Omega$) speelt geen rol. De meetfout komt van de sensor: eerst de tolerantie van $R_"pot"$ (weg te werken door te kalibreren), daarna de onzekerheid op de elektrische hoek $theta_"max"$.
]

Let op het verschil tussen *mechanische rotatie* (hoe ver de as fysiek kan draaien) en *elektrische rotatie* (het deel van die beweging waarin de loper de weerstand echt verandert). Door een dode zone aan de uiteinden is de elektrische hoek kleiner, hier $theta_"max" = 265 degree$.

== Speciale modellen <sec:poti-speciaal>

- *Lineaire potentiometers* op maat: de lengte wordt aangepast aan de toepassing ("length by demand").
- *Joysticks*: twee potentiometers loodrecht op elkaar, één per as.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L3-lineaire-potentiometers.png", width: 90%),
    caption: [Lineaire potentiometers op maat (slide 12)],
    label: <fig:L3-lineaire-potentiometers>,
  ),
  figure(
    image("assets/L3-joysticks.png", width: 80%),
    caption: [Joystickmodules met twee potentiometers (slide 12)],
    label: <fig:L3-joysticks>,
  ),
)
