#import "../../school-template.typ": *

We hebben het over *Hoge spanningen* in dit vak en in de industrie.
*Middenspanningen:* Dit bestaat niet volgens de wet maar wel in het dagdagelijksgebruik

#figure(
  image("het grid.png", width: 5cm),
  caption: [het grid],
  label: <fig:het-grid>,
)

*Stappenplan*


*Power generator* _windmolens, kerncentrales_ $arrow.r.double$ *Transformer step up* naar 150kV $arrow.r.double$ Power lines $arrow.r.double$ *Transformer step down* naar _bv 50-10kV_ $arrow.r.double$ Transformer step down 50kV $arrow.r$ 220V $arrow.r.double$ power verdeling

#voorbeeld(title: "Wind farm Thornton Bank")[
  *Generated:* 300 MW @ 33 kV \
  *Transmission:* 150 kV, distance 38 km \
  *Assume:*
  - $cos phi = 1 => I_l = 1.15 "kA"$
  - $S = 625 "mm"^2 => R_c = 1.09 Omega$

  *Oplossing:*

  *1. Bereken de stroom $I$*
  $ P = sqrt(3) dot U dot I dot cos phi arrow.r.double I = P / (sqrt(3) dot U dot cos phi) $

  Bij 150 kV:
  $ I_"150kV" = (300 dot 10^6) / (sqrt(3) dot 150 dot 10^3 dot 1) approx 1.15 "kA" $

  Bij 33 kV:
  $ I_"33kV" = (300 dot 10^6) / (sqrt(3) dot 33 dot 10^3 dot 1) approx 5.25 "kA" $

  *2. Bereken het vermogensverlies $P_"loss"$*
  $ P_"loss" = 3 dot R_c dot I^2 $

  Bij 150 kV:
  $ P_"loss, 150kV" = 3 dot 1.09 dot (1.15 dot 10^3)^2 approx 4.4 "MW" $

  Bij 33 kV:
  $ P_"loss, 33kV" = 3 dot 1.09 dot (5.25 dot 10^3)^2 approx 90 "MW" $

  *3. Bereken de spanningsval $Delta U$ (per fase)*
  $ Delta U = I dot R_c $

  Bij 150 kV:
  $ Delta U_"150kV" = 1.15 dot 10^3 dot 1.09 approx 1.26 "kV" $

  Bij 33 kV:
  $ Delta U_"33kV" = 5.25 dot 10^3 dot 1.09 approx 5.74 "kV" $

  #align(center)[
    #table(
      columns: (auto, auto, auto),
      inset: 10pt,
      align: center,
      stroke: none,
      table.header([], [*150 kV*], [*33 kV*]),
      table.hline(),
      [$I_l$ [kA]], [1.15], [5.25],
      [$P_"loss"$ [MW]], [4.4], [90],
      [$Delta U$ [kV]], [1.26], [5.74],
      [], box(fill: yellow, inset: 5pt)[*1.4%*], box(fill: yellow, inset: 5pt)[*30%*],
    )
  ]
  *Conclusie:*
  Door de spanning te verhogen van 33 kV naar 150 kV, daalt de stroom drastisch. Aangezien de verliezen kwadratisch toenemen met de stroom ($P_"loss" prop I^2$), nemen de verliezen enorm af (van 90 MW naar 4.4 MW). Dit toont het belang van hoogspanningstransmissie aan.
]


#wrap-figure(
  image("optimalisatie.png", width: 7cm),
  caption: [optimalisatie],
  label: <fig:optimalisatie>,
)[
  Materiaal kosten zijn hoger bij lagere voltages maar insulatie is goedkoper en het omgekeerde bij hogere voltages. Je hebt dus een optimalisatieprobleem je moet zien welke voltage het best past bij je afstand.

  In belgie is het typisch $380k V ... 70 k V$ en $36k V ... 1k V$ afhankelijk van de afstand.
]

*Single phase of Three phase*

Bij drie fase kun je 3X meer vermogen transporteren dan bij single phase. Je gebruikt 50% meer kabel dan single fase maar je hebt 3X meer vermogen.

== Transmissie net en distributie net

#concept(title: "Transmissie net en distributie net")[

  Het Transmitie net heeft een hoge spanning en is voor het transport van het vermogen.
  In belgie dus een bedrijf genaamt _Elia_ die het elektrische net meten en voorspellen.
  Het weer bijvoorbeeld heeft effect op het net en dat moet geweten worden.

  het distributie net is voor het verdelen van het vermogen naar de consumenten.
  In belgie is dat _Fluvius_, _ORES_, _Sibelga_....
  Die staan is voor de transformator en kabel naar jou.
  Ze zorgen voor de connectie, meter, publiek toegang aan elektriciteit en belichting.
]

Je hebt in de sector drie belangrijke delen
+ *Producent*: Produceren de energie, dit zijn de kerncentrales, zonnepanelen, windmolens
+ *Energie supplier*: Kopen de energie van de producenten en verkopen het aan de consumenten. Dit zijn de bedrijven die je contracten aanbieden. Ze zorgen ook voor distributie en als er dingen uitvallen in het distributie net dan zijn zij verantwoordelijk om het op te lossen.
+ *Consument*: Wij die de energie verbruiken.
#figure(
  image("elektriciteitssector.png", width: 5cm),
  caption: [elektriciteitssector],
  label: <fig:elektriciteitssector>,
)

Als laatste heb je nog Regalatoren die de markt in de gaten houden dat leveranciers niet te veel vragen voor de energie en dat de producenten genoeg produceren. In belgie is dat de _CREG_ en _Vreg_.


== Het net structuur

+ *Radiaal net:* *lage voltage verdeling*
  #figure(
    image("radiaal net.png", width: 3cm),
    caption: [radiaal net],
    label: <fig:radiaal-net>,
  )
  In een radiaal net vertrekken de leidingen vanuit één bron naar de verbruikers, als takken van een boom.
  - *Voordeel:* Eenvoudig en goedkoop.
  - *Nadeel:* Geen redundantie; een fout in de hoofdkabel schakelt alles erachter uit.
+ *Ring net*
  #figure(
    image("ring net.png", width: 3cm),
    caption: [ring net],
    label: <fig:ring-net>,
  )
  *Medium voltage verdeling* Bij een ring net zie je dat je backups creert. Als er een ding uit gaat is je kring niet gebroken en heb je een backup.
+ *Mesh net:* *hoge voltage verdeling _transmitie en interconnectie_*
#figure(
  image("mesh net.png", width: 3cm),
  caption: [mesh net],
  label: <fig:mesh-net>,
)
Mesh net is het omgekeerde van een radiaal net. Het is een netwerk van verbonden lijnen die elkaar kruisen en verbinden. Het is een zeer betrouwbaar netwerk omdat het veel redundantie heeft, wordt veel gebruikt tussen landen en lange afstanden met hoge spanningen.

== Twee-wattmeter methode

#theorie(title: "Korte herhaling wisselstroom")[

  #wrap-figure(
    image("wattmetermethodes.png", width: 5cm),
    caption: [Wattmetermethodes],
    label: <fig:wattmetermethodes>,
  )[
    *Definities:*
    - $V_l, I_l$: Lijnspanning en lijnstroom
    - $V_f, I_f$: Fasespanning en fasestroom
    - $P, Q, S$: Actief, Reactief en Schijnbaar vermogen (totaal)
  ]

  *Vergelijking Ster en Driehoek:*

  #table(
    columns: (auto, 1fr, 1fr),
    inset: 8pt,
    align: center,
    stroke: none,
    table.header([], [*Ster ($Y$)*], [*Driehoek ($Delta$)*]),
    table.hline(),
    [*Spanning*], [$V_l = sqrt(3) dot V_f$], [$V_l = V_f$],
    [*Stroom*], [$I_l = I_f$], [$I_l = sqrt(3) dot I_f$],
  )
  #v(0.5em)

  *Vermogens (voor 3 fasen):*
  $
    P_("tot") & = sqrt(3) dot V_l dot I_l dot cos(phi) & = 3 dot V_f dot I_f dot cos(phi) \
    Q_("tot") & = sqrt(3) dot V_l dot I_l dot sin(phi) & = 3 dot V_f dot I_f dot sin(phi) \
    S_("tot") & = sqrt(3) dot V_l dot I_l              &              = 3 dot V_f dot I_f
  $

  $ S^2 = P^2 + Q^2 $
]

#figure(
  caption: [Fasordiagram Ster (Spanningen)],
  cetz.canvas({
    import cetz.draw: *

    // Settings
    let r_phase = 2
    let r_line = r_phase * 1.732 // sqrt(3)

    // Phase voltages (Va, Vb, Vc)
    line((0, 0), (0, r_phase), mark: (end: ">"), name: "Va", stroke: blue)
    line((0, 0), (r_phase * 0.866, -r_phase * 0.5), mark: (end: ">"), name: "Vb", stroke: blue)
    line((0, 0), (-r_phase * 0.866, -r_phase * 0.5), mark: (end: ">"), name: "Vc", stroke: blue)

    // Labels Phase
    content("Va.end", [$underline(V)_"an" (0deg)$], anchor: "south")
    content("Vb.end", [$underline(V)_"bn" (-120deg)$], anchor: "north-west")
    content("Vc.end", [$underline(V)_"cn" (120deg)$], anchor: "north-east")

    // Line voltage Vab = Va - Vb
    // Visually approximate for diagram
    let v_ab_x = r_line * 0.866 // cos(30)
    let v_ab_y = r_line * 0.5 // sin(30)

    line((0, 0), (v_ab_x, v_ab_y), mark: (end: ">"), stroke: red, name: "Vab")
    content("Vab.end", [$underline(V)_"ab" (+30deg)$], anchor: "south-west")
  }),
)





