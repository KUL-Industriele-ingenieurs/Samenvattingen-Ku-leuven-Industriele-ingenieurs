#import "../../school-template.typ": *

= Het elektrische net

In dit deel van distributie van elektrische energie en in de industrie spreken we voornamelijk over *hoge spanningen* (transmissie) en *lage spanningen* (distributie).
*Middenspanning* (bijv. 10kV - 30kV) is wettelijk gezien eigenlijk ook een hoogspanning, maar wordt in de praktijk gebruikt om de regionale verdeling aan te duiden.

#figure(
  image("het grid.png", width: 5cm),
  caption: [Het grid],
  label: <fig:het-grid>,
)

*Stappenplan van het elektriciteitsnet:*

#figure(
  fletcher.diagram(
    node-stroke: 0.8pt,
    node-fill: white,
    spacing: 3em,
    {
      import fletcher: node, edge
      node((0,0), [*Productie*\ #text(size: 0.8em)[(Centrale)]], stroke: schoolBlue, fill: schoolBlue.lighten(95%))
      edge((0,0), (1,0), "->", label: text(size: 0.7em)[Step-up])
      node((1,0), [*Transfo*\ #text(size: 0.8em)[(150-380kV)]], stroke: schoolOrange, fill: schoolOrange.lighten(95%))
      edge((1,0), (2,0), "->", label: text(size: 0.7em)[Transmissie])
      node((2,0), [*Hoogspanning*\ #text(size: 0.8em)[(Netwerk)]], stroke: schoolRed, fill: schoolRed.lighten(95%))
      edge((2,0), (3,0), "->", label: text(size: 0.7em)[Step-down])
      node((3,0), [*Transfo*\ #text(size: 0.8em)[(10kV)]], stroke: schoolOrange, fill: schoolOrange.lighten(95%))
      edge((3,0), (3.3, 0.5), (3,1), "->", label: text(size: 0.7em)[Distributie])
      node((3,1), [*Middenspanning*\ #text(size: 0.8em)[(Netwerk)]], stroke: schoolGreen, fill: schoolGreen.lighten(95%))
      edge((3,1), (2,1), "->", label: text(size: 0.7em)[Step-down])
      node((2,1), [*Transfo*\ #text(size: 0.8em)[(400V/230V)]], stroke: schoolOrange, fill: schoolOrange.lighten(95%))
      edge((2,1), (1,1), "->", label: text(size: 0.7em)[Consumptie])
      node((1,1), [*Eindverbruiker*\ #text(size: 0.8em)[(Consument)]], stroke: schoolTeal, fill: schoolTeal.lighten(95%))
    }
  ),
  caption: [Stroomverloop van opwekking tot eindverbruiker],
  label: <fig:stroomverloop>,
)


#voorbeeld(title: "Wind farm Thornton Bank")[
  *Generated:* 300 MW @ 33 kV \
  *Transmission:* 150 kV, distance 38 km \
  *Assume:*
  - $cos phi = 1 => I_l = 1.15 "kA"$
  - $S = 625 "mm"^2 => R_c = 1.09 Omega$

  *Oplossing:*

  *1. Bereken de stroom $I$*
  $ P = sqrt(3) dot V dot I dot cos phi arrow.r.double I = P / (sqrt(3) dot V dot cos phi) $

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

  *3. Bereken de spanningsval $Delta V$ (per fase)*
  $ Delta V = I dot R_c $

  Bij 150 kV:
  $ Delta V_"150kV" = 1.15 dot 10^3 dot 1.09 approx 1.26 "kV" $

  Bij 33 kV:
  $ Delta V_"33kV" = 5.25 dot 10^3 dot 1.09 approx 5.74 "kV" $

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
      [$Delta V$ [kV]], [1.26], [5.74],
      [], box(fill: yellow, inset: 5pt)[*1.4%*], box(fill: yellow, inset: 5pt)[*30%*],
    )
  ]
  *Conclusie:*
  Door de spanning te verhogen van 33 kV naar 150 kV, daalt de stroom drastisch. Aangezien de verliezen kwadratisch toenemen met de stroom ($P_"loss" prop I^2$), nemen de verliezen enorm af (van 90 MW naar 4.4 MW). Dit toont het belang van hoogspanningstransmissie aan.
]


#wrap-figure(
  image("optimalisatie.png", width: 6cm),
  caption: [optimalisatie],
  label: <fig:optimalisatie>,
)[
  Bij lagere spanningen zijn de materiaalkosten voor de kabels hoger (je hebt dikkere kabels nodig voor de grotere stroom), maar is de nodige isolatie goedkoper. Bij hogere spanningen is het omgekeerde waar (dunne kabels, dure isolatie). Dit vormt een optimalisatieprobleem: je moet de ideale spanning kiezen afhankelijk van het getransporteerde vermogen en de afstand.

  In België gebruiken we typisch 380kV tot 70kV voor transmissie (lange afstand) en 36kV tot 1kV voor distributie (korte afstand).
]

*Single phase vs Three phase*

Met een driefasig systeem kun je drie keer zoveel vermogen transporteren als met een eenfasig systeem, terwijl je (bij 3 stroomvoerende draden in plaats van 2) slechts 50% meer koper/kabelmateriaal nodig hebt.

== Transmissie net en distributie net

#concept(title: "Transmissienet en distributienet")[

  Het *transmissienet* gebruikt hoge spanning voor het efficiënt transport van vermogen over grote afstanden.
  In België wordt dit beheerd door *Elia*. Zij monitoren het net voortdurend en houden rekening met weersvoorspellingen om vraag en aanbod in balans te houden.

  Het *distributienet* verdeelt het vermogen lokaal naar de consumenten.
  In België gebeurt dit door partijen zoals *Fluvius* (Vlaanderen), *ORES* (Wallonië) en *Sibelga* (Brussel). Zij zijn verantwoordelijk voor de lokale cabines (transformatoren), de kabels tot aan de woningen, de meters en de openbare verlichting.
]

Je hebt in de elektriciteitssector drie belangrijke rollen:
+ *Producent*: Wekt de energie op (b.v. kerncentrales, windmolens, zonneparken).
+ *Leverancier (Supplier)*: Koopt energie van de producenten op de groothandelsmarkt en verkoopt dit via contracten aan consumenten.
+ *Consument*: Wij, de eindgebruikers van de elektriciteit.

#figure(
  image("elektriciteitssector.png", width: 5cm),
  caption: [elektriciteitssector],
  label: <fig:elektriciteitssector>,
)

Tot slot zijn er *regulatoren* die de energiemarkt in de gaten houden. Ze zien erop toe dat prijzen eerlijk blijven en de bevoorrading gegarandeerd is. In België zijn dit onder andere de *CREG* (federaal) en de *VREG* (Vlaanderen).


== De netwerkstructuur

+ *Radiaal net:* (Typisch voor laagspanningsdistributie)
  #figure(
    image("radiaal net.png", width: 3cm),
    caption: [radiaal net],
    label: <fig:radiaal-net>,
  )
  In een radiaal net vertrekken de leidingen vanuit één bron naar de verbruikers, als takken van een boom.
  - *Voordeel:* Eenvoudig en goedkoop in aanleg.
  - *Nadeel:* Geen redundantie. Een fout in de hoofdkabel schakelt alle achterliggende verbruikers uit.
+ *Ring net:* (Typisch voor middenspanningsdistributie)
  #figure(
    image("ring net.png", width: 3cm),
    caption: [ring net],
    label: <fig:ring-net>,
  )
  Een ringnet is gesloten in een lus, waardoor redundantie ontstaat. Als er een kabel of transformator uitvalt, kan men de fout isoleren en de stroom via de andere kant van de ring naar de verbruikers sturen.
+ *Mesh net:* (Typisch voor hoogspanningstransmissie)
#figure(
  image("mesh net.png", width: 5cm),
  caption: [mesh net],
  label: <fig:mesh-net>,
)
Een mesh (vermaasd) netwerk is een complex netwerk van verbonden lijnen die elkaar kruisen en verbinden. Het biedt de hoogste betrouwbaarheid en redundantie, wat essentieel is voor grote afstanden en het verbinden van verschillende landen en centrales.

== Metingen in het net: Twee-wattmetermethode

Om het actieve en reactieve verbruik in deze driefasige netten te meten, gebruiken we verschillende wattmeter-opstellingen afhankelijk van het type netwerk (met of zonder nuldraad). De twee-wattmetermethode is hierbij een veelgebruikte techniek.

#theorie(title: "Korte herhaling wisselstroom")[

  #wrap-figure(
    image("wattmetermethodes.png", width: 8cm),
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

  * 1-wattmethode met nulpuntsverbinding (1WMM+N)*\
  Toepasbaar bij symmetrische belastingen met beschikbare neutraalgeleider ($N$).
  $ P_("tot") = 3 dot P_m = 3 dot V_f dot I_f dot cos(phi) $

  * 1-wattmethode zonder nulpuntsverbinding (1WMMØN)*\
  Toepasbaar bij symmetrische belastingen zonder $N$. De wattmeter meet het actieve ($P_m$) of reactieve ($Q_m$) aandeel via een fase-verschoven verbinding (bijv. $I$ in $L_1$ en $V$ tussen $L_2$ en $L_3$).
  $ P_("tot") = sqrt(3) dot Q_m \ Q_("tot") = sqrt(3) dot P_m $

  * 3-wattmetermethode (3WMM)*\
  Universele methode (ook voor asymmetrische belastingen). Vereist een (artificieel) nulpunt.
  $ P_("tot") = P_1 + P_2 + P_3 $

  * 2-wattmetermethode*\
  Toepasbaar bij 3-dradensystemen (geen $N$ nodig). Werkt voor zowel symmetrische als asymmetrische belastingen.
  $ P_("tot") = P_1 + P_2 \ Q_("tot") = sqrt(3) dot (P_2 - P_1) $
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





