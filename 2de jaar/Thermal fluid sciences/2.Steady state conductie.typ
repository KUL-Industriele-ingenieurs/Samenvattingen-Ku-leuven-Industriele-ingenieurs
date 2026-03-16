#import "../../school-template.typ": *
#import "@preview/zap:0.5.0" as zap




#let physical-system-combined() = {
  cetz.canvas({
    import cetz.draw: *

    // Wall (Conduction)
    rect((0, 0), (2, 3), fill: rgb("eee"), stroke: black)
    content((1, 1.5), [$k, L$])

    // Temperatures
    content((-0.4, 1.5), [$T_1$])
    content((2.4, 2.5), [$T_2$])

    // Fluid (Convection)
    line((2, 0), (5, 0), stroke: (dash: "dashed")) // Bottom boundary

    // Streamlines
    line((2.5, 1.5), (4.5, 1.5), stroke: (paint: blue, thickness: 1pt), mark: (end: ">"))
    content((3.5, 1.8), text(fill: blue)[$T_oo, h$])

    // Heat Flux Arrow
    line((-1, 2.8), (5, 2.8), mark: (end: ">"), stroke: 1.5pt)
    content((2, 3.1), [$dot(Q)$])
  })
}


= Herhaling Warmte en strmoingen

== Steady state conductie

Steady state betekent dat er geen verandering is in de tijd en de plaats. Dus de temperatuur op een bepaald punt verandert niet in de tijd $t$ en de plaats $x$. $dot(Q)$ is constant.

Over heel dit deel is het *Steady state* en is de warmteoverdracht $dot(Q)$ is *constant*.

== Conductie

#wrap-figure(
  cetz.canvas({
    import cetz.draw: *

    scale(1.6)

    // Wall
    rect((0, 0), (2, 3), fill: rgb("eee"), stroke: black, name: "wall")

    // Temperatures
    content((-0.5, 1.5), [$T_1$])
    content((2.5, 1.5), [$T_2$])

    // Heat Flux Arrow
    line((-1, 2.5), (3, 2.5), mark: (end: ">"), stroke: 1.5pt, name: "Q")
    content("Q.mid", anchor: "south", padding: 0.1, [$dot(Q)$])

    // Dimensions
    line((0, -0.3), (2, -0.3), mark: (start: "|", end: "|"), name: "L")
    content("L.mid", anchor: "north", padding: 0.1, [$L$])

    // Material Property
    content((1, 1.5), [$k, A$])
  }),
  caption: [Conductie door een muur],
  label: <fig:conductie>,
  width: 50%,
)[

  Conductie is warmteoverdracht door geleiding.

  #frm(
    "Conductie",
    $
      dot(Q) = (Delta T) / R_(t h) \
      R_(t h) = L / (k A) \
      Delta T = T_1 - T_2
    $,
    [$dot(Q)$ = warmteflux [W], $R_(t h)$ = thermische weerstand [K/W], L = lengte [m], k = warmtegeleidingscoëfficiënt [W/(m K)], A = oppervlakte [$m^2$], $Delta$ T = temperatuurverschil [K]],
  )
]


== Convectie

#wrap-figure(
  cetz.canvas({
    import cetz.draw: *

    scale(1.3)

    // Surface
    line((0, 0), (4, 0), stroke: 2pt)
    for x in range(1, 8) {
      line((x * 0.5, 0), (x * 0.5 - 0.2, -0.3), stroke: 1pt)
    }
    content((2, -0.6), [$T_s$])

    // Fluid Streamlines
    line((0, 1), (4, 1), stroke: (paint: blue, thickness: 1pt), mark: (end: ">"))
    content((2, 1.3), text(fill: blue)[$T_oo, h$])

    // Heat transfer arrow
    line((2, 0.2), (2, 2.5), mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
    content((2.2, 1.3), text(fill: red)[$dot(Q)_"conv"$], anchor: "west")
  }),
)[

  Convectie is warmteoverdracht door stroming. Lucht beweegt door de warmte.
  Dus er wordt koude lucht constant geleverd aan het oppervlak en dus koelt het af.
]

#frm(
  "Convectie",
  [
    $ dot(Q) = h A Delta T = h A (T_s - T_oo) $
  ],
  [$dot(Q)$ = warmteflux [W], h = warmteoverdrachtscoëfficiënt [$W/(m^2 K)$], A = oppervlakte [$m^2$], Delta T = temperatuurverschil [K], $T_s$ = oppervlaktemperatuur [K], $T_oo$ = omgevingstemperatuur [K]],
)

== Radiatie

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Surface 1
    line((0, 0), (0, 3), stroke: (thickness: 2pt, paint: red))
    content((-0.4, 1.5), text(fill: red)[$T_1$])

    // Surface 2
    line((4, 0), (4, 3), stroke: (thickness: 2pt, paint: blue))
    content((4.4, 1.5), text(fill: blue)[$T_2$])

    // Radiation Waves
    line((0.2, 1.5), (3.8, 1.5), stroke: (paint: orange, dash: "dashed", thickness: 1.5pt), mark: (end: ">"))
    content((2, 1.8), text(fill: orange)[$dot(Q)_"rad"$])
  }),
  caption: [Stralingsuitwisseling tussen twee oppervlakken],
)

We gaan de formule van radiate ontbinden. Dit is uiteindelijk herhaling van warmte en stromingen maar je ziet hoe de $h_r$ afhangt van de temperaturen tijdens radiatie.

#frm(
  "Radiatie",
  [
    $ dot(Q) = epsilon sigma A (T_s^4 - T_oo^4) $
    We gaan deze term ontbinden in $Delta T$ en $h_r$.
    $ Delta T = T_s - T_oo $
    $ T_s^4 - T_oo^4 = (T_s^2 + T_oo^2)(T_s^2 - T_oo^2) = (T_s^2 + T_oo^2)markhl((T_s - T_oo))(T_s + T_oo) $
    De rest van de termen gaan $h_r$ bepalen.
    $ dot(Q) = epsilon sigma A (T_s^2 + T_oo^2)(T_s + T_oo) Delta T $
    $ h_r = epsilon sigma (T_s^2 + T_oo^2) (T_s + T_oo) $
    $ dot(Q) = h_r A Delta T $
  ],
  [$dot(Q)$ = warmteflux [W], $epsilon$ = emissiviteit [-], $sigma$ = Stefan-Boltzmann constante [$5.67 dot 10^(-8) W/(m^2 K^4)$], A = oppervlakte [$m^2$], $Delta T$ = temperatuurverschil [K], $T_s$ = oppervlaktemperatuur [K], $T_oo$ = omgevingstemperatuur [K], $h_r$ = warmteoverdrachtscoëfficiënt voor straling [$W/(m^2 K)$]],
)

#concept(title: "Emissiviteit")[
  Emissiviteit is een maat voor de mate waarin een oppervlak warmte uitstraalt.
  Donkere oppervlakken hebben een hogere emissiviteit dan lichte oppervlakken.

  Voor een puur zwart oppervlakte is emmisiviteit $epsilon = 1$.

]

Ontwikkel die haken uit en je krijgt dan terug terug $dot(Q) = h_r A Delta T$.

De warmteoverdrachtscoëfficiënt voor straling $h_r$ is hier dan heel afhankelijk van de temperatuur:
$ h_r = epsilon sigma (T_s^2 + T_oo^2) (T_s + T_oo) $


== Alles te samen

Al deze warmteoverdrachten kunnen ook tegelijkertijd voorkomen. Dit kan gemodelleerd worden als een elektrisch circuit (thermisch circuit), waarbij de warmteflux $dot(Q)$ analoog is aan de stroom $I$, het temperatuurverschil $Delta T$ aan de spanning $U$, en de thermische weerstand $R_(t h)$ aan de elektrische weerstand $R$.

De totale weerstand is de som van de weerstanden in serie:
$ R_(t o t) = R_"cond" + R_"conv" = L/(k A) + 1/(h A) $

Dan geldt:
$ dot(Q) = (T_1 - T_oo) / R_(t o t) $

Soms krijg je de oppervlakte niet, en dan kan voeg je die niet in, in de formules:

$ dot(q) = dot(Q)/A = (T_1 - T_oo) / r_(t o t) $
$ r_(c o n v) = 1/h $
met $r_(c o n v) = R_(c o n v) dot A$ met eenheden [$m^2 K/W$]
$ r_(c o n d) = L/k $
met $r_(c o n d) = R_(c o n d) dot A$ met eenheden [$m^2 K/W$]

== Elektrisch vs Thermische circuit

Het is net zoals bij elektrische netwerken. Het is volledig *Analoog* aan elektrische netwerken.

#figure(
  image("vergelijking elektrisch en heat flow.png", width: 6.5cm),
  caption: [vergelijking elektrisch en heat flow],
  label: <fig:vergelijking-elektrisch-en-heat-flow>,
)

Net zoals bij elektrische netwerken geldt:

$ R_(t o t) = R_1 + R_2 + R_3 + ... $

Met alle formules voor R in term van zijn process

#figure(
  table(
    columns: 2,
    align: left,
    table.header([*Proces*], [*Thermische Weerstand* $R_(t h)$]),
    [Conductie (vlakke wand)], [$R_"cond" = L / (k A)$],
    [Convectie], [$R_"conv" = 1 / (h A)$],
    [Radiatie], [$R_"rad" = 1 / (h_r A)$],
  ),
  caption: [Overzicht van thermische weerstanden],
)


Alle formules voor elektrische netwerken zijn ook geldig voor thermische netwerken.
Dus als je de spanningsval (de temperatuurval) over een weerstand kent, kun je de warmteflux $dot(Q)$ berekenen over alle weerstanden. Stel ze vragen wat is de totale termperatuursval over de weerstand $R_1$ + $R_2$ en je weet de termperatuursval over $R_1$ dan kun je de warmteflux $dot(Q)$ berekenen over de weerstand $R_1$ en dat is dezelfde als die over $R_2$.

#figure(
  table(
    columns: 2,
    align: left,
    table.header([*Thermisch Netwerk*], [*Elektrisch Netwerk*]),
    [Temperatuurverschil $Delta T$ [K]], [Spanningsval $U$ of $Delta V$ [V]],
    [Warmteflux $dot(Q)$ [W]], [Stroom $I$ [A]],
    [Thermische weerstand $R_(t h)$ [K/W]], [Elektrische weerstand $R$ [$Omega$]],
  ),
  caption: [Analogie tussen thermische en elektrische netwerken],
)


Je kunt dus je thermische weerstanden *in serie* en *parallel* schakelen.

==== Serie

$ R_(t o t) = R_1 + R_2 + R_3 + ... $

==== Parallel

$ 1 / R_(t o t) = sum(1 / R_i) $

#figure(
  image("parallel-serie.png", width: 5cm),
  caption: [parallel-serie],
  label: <fig:parallel-serie>,
)

Wat we in dit vak gaan doen is nu zien wat er gebeurt bij andere soorten geometrieën.

== Andere geometrie conductie

Oké dit hebben we al gezien maar in dit deel gaan we nu zien wat er gebeurt bij andere soort oppervlaken. #belangrijk("De concepten blijven *gelijk* maar de formules veranderen.")

*De omgevingsfactoren veranderen niet in de tijd*

$ dot(Q)_(i n) - dot(Q)_(o u t) = frac(d E, d t) = markhl(0) $

=== Cilindrische conductie

#wrap-figure(
  image("sphere.png", width: 6cm),
  caption: [spherische conductie],
  label: <fig:spherische-conductie>,
)[

  We beginnen terug van de *steady state* formule en we lossen op met een integraal $integral$ :

  $ dot(Q)_(c o n d) = -k A frac(d T, d r) $
  $ integral_(r= r_1)^(r_2) frac(dot(Q), A) d r = integral_(T_1)^(T_2) -k d T $

  inplaats van integreren over de lengte $x$ gaan we integreren over de straal $r$
  de oppervlakte $A$ is functie van $r$ dus $A = 2 pi r L$

  $ integral_(r= r_1)^(r_2) frac(dot(Q), underbrace(2 pi r L, "A")) d r = integral_(T_1)^(T_2) -k d T $


  $ dot(Q) = 2 pi k L frac(T_1 - T_2, ln(r_2) - ln(r_1)) = 2 pi k L frac(T_1 - T_2, ln(r_2 / r_1)) $

  We kunnen nu $R_(c i l i n d e r)$ definiëren:

  #frm(
    "Cilindrische conductie",

    [
      $ R_(c i l i n d e r) = frac(ln(r_2 / r_1,), 2 pi k L) $

      $ dot(Q) = (T_1 - T_2) / R_(c i l i n d e r) $
    ],
    [
      met $L$ de lengte van de cilinder, $k$ de warmtegeleidingscoëfficiënt, $r_1$ de binnenstraal en $r_2$ de buitenstraal, $T_1$ de temperatuur aan de binnenkant en $T_2$ de temperatuur aan de buitenkant, $dot(Q)$ de warmteflux door de cilinder.
    ],
  )
]

#keyterm(
  "Hoera, het elektrische equivalent model (ons idee dat dingen van elektrishce netwerken meegaan in thermische circuits) geldt ook voor cilindrische conductie!",
)


=== Sferische conductie


#wrap-figure(
  image("resistancesphere.png", width: 6cm),
  caption: [spherische conductie],
  label: <fig:spherische-conductie>,
)[
  We beginnen terug van de *steady state* formule en we lossen op met een integraal $integral$ :

  $ dot(Q)_(c o n d) = -k A frac(d T, d r) $
  $ integral_(r= r_1)^(r_2) frac(dot(Q), A) d r = integral_(T_1)^(T_2) -k d T $

  In plaats van integreren over de lengte $x$ gaan we integreren over de straal $r$.
  De oppervlakte $A$ is een functie van $r$, namelijk de oppervlakte van een bol: $A = 4 pi r^2$.

  $ integral_(r= r_1)^(r_2) frac(dot(Q), 4 pi r^2) d r = integral_(T_1)^(T_2) -k d T $

  $ dot(Q) = 4 pi k frac(T_1 - T_2, 1/r_1 - 1/r_2) = 4 pi k frac(T_1 - T_2, (r_2 - r_1) / (r_1 r_2)) $

  We kunnen nu $R_(s f e r i s c h)$ definiëren:

  #frm(
    "Sferische conductie",
    [
      $ R_(s f e r i s c h) = frac(r_2 - r_1, 4 pi k r_1 r_2) $
      $ dot(Q) = (T_1 - T_2) / R_(s f e r i s c h) $
    ],
    [
      met $r_1$ de binnenstraal en $r_2$ de buitenstraal, $T_1$ de temperatuur aan de binnenkant en $T_2$ de temperatuur aan de buitenkant, $dot(Q)$ de warmteflux door de bol.
    ],
  )
]



== Multilayered cilindrische & sferische conductie

#wrap-figure(
  image("multilayer cilinder & circkel.png", width: 8cm),
  caption: [multilayer cilinder & circkel],
  label: <fig:multilayer-cilinder-circkel>,
)[

  Net zoals vlakke wanden dat je naast elkaar zet, _zie alles te samem_
  gaan alle weerstanden in serie staan.

  Dit is de formule voor de figuur rechts waarbij *convectie*, binnen en buiten en *conductie* hebt.

  $ R_(t o t) = R_(c o n v, i) + R_(c o n d, 1) + R_(c o n d, 2) + ... + R_(c o n d, n) + R_(c o n v, o) $

  $ R_(c o n v, i) = 1 / (h_i A_i) $
  $ R_(c o n d, i) = ln(r_(i+1) / r_i) / (2 pi k_i L) $
  $ R_(c o n v, o) = 1 / (h_o A_o) $

  $ dot(Q) = (T_(i n) - T_(o u t)) / R_(t o t) $

  Hou in rekening dit is alleen voor cilindrische conductie. Voor sferische conductie is de formule anders.
]


== Kritische radius voor isolerende lichaam


#wrap-figure(
  image("kritische insulatie.png", width: 6cm),
  caption: [kritische insulatie],
  label: <fig:kritische-insulatie>,
)[
  #concept(title: "Kritische radius")[
    Nu als je zo weinig mogelijk warmteverlies wilt, dan wil je de warmteoverdracht $dot(Q)$ zo laag mogelijk houden. Maar we zien dat als je in het begin meer isolatie toevoegd dat je warmteoverdracht eerst *toeneemt* en daarna *afneemt*. Dit komt omdat de warmteoverdracht door conductie afneemt als de dikte van de isolatie toeneemt, maar de warmteoverdracht door convectie toeneemt als de dikte van de isolatie toeneemt. Je contactoppervlakte $A$ neemt toe $arrow.r$ er is dus een critische radius $r_c$ waarbij de warmteoverdracht maximaal is.
  ]
]

* Voor een cilinder:*

$ r_(c r, c i l i n d e r) = k / h $

* Voor een bol:*

$ r_(c r, s f e r i s c h) = frac(2 k, h) $

#voorbeeld(title: "Kritische radius")[
  Stel we hebben een elektrische draad met diameter $D = 3 "mm"$ en een isolatielaag ($k = 0.15 "W"/(m dot K)$). De draad heeft een temperatuur van $120 degree$ en de omgeving is $20 degree$ met $h = 10 "W"/(m^2 dot K)$.

  *Bereken de kritische radius:*
  $ r_c = k / h = (0.15 "W"/(m dot K)) / (10 "W"/(m^2 dot K)) = 0.015 "m" = 15 "mm" $

  De straal van de draad is $r_1 = 1.5 "mm"$.
  Aangezien $r_1 < r_c$, zal het toevoegen van isolatie (tot $15 "mm"$) de warmteoverdracht *verhogen* in plaats van verlagen! Pas voorbij $r_c$ zal de isolatie effectief isoleren.
]


= Warmteoverdracht door vinnen <ch:warmteoverdracht-vinnen>

#wrap-figure(
  image("fins.png", width: 4cm),
  caption: [fins],
  label: <fig:fins>,
)[
  Finnen zijn metal rods die we gebruiken om snel warmte af te geven aan de omgeving. Je ziet ze overal, in computers, auto's, en eigenlijk alles wat warmte moet afgeven aan de omgeving.

  De vraag die we ons stellen is, is dit nu nuttig? We gaan een *diff vergelijking*
  opstellen.
]



== Diff vergelijking van vinnen <sec:diff-vergelijking>


#wrap-figure(
  image("vinnen-vergelijking.png", width: 5cm),
  caption: [vinnen-vergelijking],
  label: <fig:vinnen-vergelijking>,
)[
  We bekijken een klein stuk over de vin $Delta x$. We zien dat er weer conductie en convectie is.

  #belangrijk("Lokaal op " + $Delta x$ + " Is het steadystate maar niet over de ganse vin!")



  Er komt warmte binnen en buiten met deze formule:

  $ dot(Q)_(c o n d, x) = dot(Q)_(c o n d, x + Delta x) + dot(Q)_(c o n v) $

  $ dot(Q)_(c o n d) = -k A_c frac(d T, d x) $

  $ dot(Q)_(c o n v) = h P Delta x (T - T_infinity) $

  #align(center)[
    #cetz.canvas({
      import cetz.draw: *

      // Vin segment
      rect((0, 0), (3, 2), name: "vol", fill: rgb("e2edff"), stroke: 1.5pt)
      content("vol.center", [$Delta x$])

      // Q_in
      line((-1.5, 1), (0, 1), mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      content((-0.75, 1.4), text(red)[$dot(Q)_(c o n d, x)$])

      // Q_out
      line((3, 1), (4.5, 1), mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      content((4.0, 1.4), text(red)[$dot(Q)_(c o n d, x + Delta x)$])

      // Q_conv
      line((1.5, 2), (1.5, 3.5), mark: (end: ">"), stroke: (paint: orange, thickness: 1.5pt))
      content((1.7, 2.7), text(orange)[$dot(Q)_(c o n v)$], anchor: "west")

      line((1.5, 0), (1.5, -1.5), mark: (end: ">"), stroke: (paint: orange, thickness: 1.5pt))
      content((1.7, -0.7), text(orange)[$dot(Q)_(c o n v)$], anchor: "west")
    })
  ]

  oké we stellen nu onze diff vergelijking op :

  $ lim_(Delta x -> 0) frac(dot(Q)_(c o n d, x + Delta x) - dot(Q)_(c o n d, x), Delta x) + h P (T - T_infinity) = 0 $

  Dan krijgen we deze diff vergelijking uit:
  $ frac(d dot(Q)_(c o n d), d x) + h P (T - T_infinity) = 0 $

  We vullen $dot(Q)_(c o n d)$ in:

  $ frac(d, d x) (-k A_c frac(d T, d x)) + h P (T - T_infinity) = 0 $

  We gaan 2 nieuwe parameter maken genaamt $theta$ en $m$.

  $ theta = T - T_infinity $

  $theta$ is de excess temperatuur. Dus de temperatuur van de vin min de temperatuur van de omgeving.

  $ m^2 = (h P) / (k A_c) $

  $m$ is de fin parameter.

  Dan krijgen we deze diff vergelijking uit:

  $ markrect(frac(d^2 theta, d x^2) - m^2 theta = 0) $

]
#wrap-figure(
  image("fin.png", width: 6cm),
  caption: [fin],
  label: <fig:fin>,
)[
  Deze diff vergelijking heeft als algemene oplossing:

  $ theta(x) = C_1 e^(m x) + C_2 e^(-m x) $ _Zie wiskunde basistechnieken_

  De nul boundry is $theta(0) = T_s - T_infinity = theta_s$

  Dan willen we weten wat is $theta(L)$.

  We krijgen dan een formule voor de variatie van de temperatuur over de vin:

  $
    frac(T(x) - T_infinity, T_s - T_infinity) = e^(-m x)
  $

  De boundry conidities hiervoor gekozen zijn voor heel lange fins. Dus als $L -> infinity$ dan geldt deze formule.

]

#frm(
  "Vinnen",

  [
    $ frac(T(x) - T_infinity, T_s - T_infinity) = e^(-m x) $

    $ dot(Q) = sqrt(h P k A_c) (T_s - T_infinity) $
  ],
  [
    met $m = sqrt(h P / (k A_c))$, $P$ is de omtrek van de vin, $A_c$ is de cross sectionele oppervlakte van de vin.
  ],
)

De diff vergelijking gelt voor heel lange fin. Je hebt andere manieren om de diff vergelijking op te lossen voor kortere fins.Je ziet die in de slides met de verschillende boundry condities.

Om dit op te lossen zodat we altijd de boundry condiities van oneindig kunnen gebruiken gaan we een *Correctie factor* gebruiken.

== Correctie factor fin <sec:correctiefactor>

#wrap-figure(
  image("correctiefactor.png", width: 8cm),
  caption: [correctiefactor],
  label: <fig:correctiefactor>,
)[


  We verhogen de lengte zodat het klopt.
  #frm(
    "Correctie factor fin",

    [
      $ L_c = L + A_c / P $
      $ L_(c, r e c t) = L + t / 2 $
      $ L_(c, c i r c u l a r) = L + D / 2 $
    ],
    [
      Met $A_c$ de cross sectionele oppervlakte van de vin, $P$ de omtrek van de vin, $t$ de dikte van de vin en $D$ de diameter van de vin, $L$ de lengte van de vin en $L_c$ de correctie factor fin.
    ],
  )


]

== Fin efficiëntie <sec:fin-efficientie>

We willen nu weten hoe *efficient* dat een fin is. Ideaal is de temperatuur over de ganse vin gelijk aan $T_s$. Maar dat is niet zo (_eerder berekent_). Dus we gaan een *efficiëntie* berekenen.

efficient bereknt je door

$ eta_f = frac(dot(Q)_(f i n), dot(Q)_(m a x)) $

#frm(
  "Fin efficiëntie long fin ",

  [
    $
      eta_f = frac(dot(Q)_(f i n), dot(Q)_(m a x)) = frac(sqrt(h P k A_c) (T_s - T_infinity), h P L (T_s - T_infinity)) = markhl(frac(1, m L))
    $
  ],
  [
    Met $m = sqrt(h P / (k A_c))$, $P$ is de omtrek van de vin, $A_c$ is de cross sectionele oppervlakte van de vin, $L$ is de lengte van de vin en $L_c$ de correctie factor fin.
  ],
)

== Fin effectiviteit <sec:fin-effectiviteit>

Dit is nog anders als efficientië. Want we kijken naar de effectiviteit van de vin ten opzichte van een vin die oneindig efficient is. Als je warmtestroom gelijk blijft met of zonder het steken van een fin ja dan heeft het geen nut om een fin te steken. Dus we gaan kijken naar de effectiviteit van de vin ten opzichte van een vin die oneindig efficient is.

#figure(
  image("fin effectiveness.png", width: 5cm),
  caption: [fin effectiveness],
  label: <fig:fin-effectiveness>,
)

#frm(
  "Fin effectiviteit",

  [
    $epsilon_(f i n) = frac(dot(Q)_(f i n), dot(Q)_(w i t h o u t f i n)) = frac(A_(f i n), A_(b a s e)) * eta_f$
  ],
  [
    Met $A_(f i n)$ de oppervlakte van de vin en $A_(b a s e)$ de oppervlakte van de basis van de vin.
  ],
)

*Pas op:* Je gaat het verschil in oppervlakte nemen alleen het oppervlakte als je de vin *weglaat*. Je berekent dus de $A_(f i n)$ en neem dat die vin weg $arrow.r$ Welk opperlakte blijft nog over?

In de figuur hier is het die $A_b = r^2*pi$.

== Complexe vormen

Voor complexe vormen van vinnen en structuren moet je niet de efficientie en effectiviteit berekenen volledig uitrekenen maar kun je de tabellen en grafieken gebruiken in het formularium. Deze krijg je ook op het examen.


#figure(
  image("formules complexe vin vormen.png", width: 10cm),
  caption: [formules complexe vin vormen],
  label: <fig:formules-complexe-vin-vormen>,
)

#figure(
  image("efficientie-straight-vinnen.png", width: 10cm),
  caption: [efficientie-straight-vinnen],
  label: <fig:efficientie-straight-vinnen>,
)


#figure(
  image("efficientie-cirkelvormige vinnen.png", width: 10cm),
  caption: [efficientie-cirkelvormige vinnen],
  label: <fig:efficientie-cirkelvormige-vinnen>,
)































