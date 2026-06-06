#import "../../school-template.typ": *

= Traagheidsmoment <ch:traagheidsmoment>

Het (massa)traagheidsmoment ten opzichte
van een as door punt O, van een stelsel van
puntmassa’s, is gelijk aan de som van de
producten van de massa’s met het kwadraat
van hun afstand tot deze as.

$ I_O = sum m r^2 $

Waar $m$ de massa is en $r$ de afstand tot het nulpunt. Met eenheid $[K g dot m^2]$

#concept(title: "Traagheidsmoment", [

  Om het om te zetten in #keyterm[starre lichaam] gaan we ons lichaam opdelen in allemaal kleine stukken *O*.

  Het (massa)traagheidsmoment ten opzichte
  van een as door punt O, van een lichaam, is
  gelijk aan de integraal over alle massadeeltjes [M],
  van het kwadraat van de afstand van elk
  massadeeltje [d m] tot de as, maal het massadeeltje [d m].

  $I_O = integral r^2 d m$

  Waar $r$ de afstand is van het massadeeltje tot de as.

  Het traagheidsmoment is een maat voor de weerstand van een lichaam tegen een verandering in de rotatie.
])

#voorbeeld(title: "Voorbeeld: Traagheidsmoment van een slanke staaf")[

  #figure(
    image("assets/Traagheidsmoment oefening 2.png", width: 8cm),
    caption: [Traagheidsmoment oefening 2],
    label: <fig:Traagheidsmoment-oefening-2>,
  )

  We berekenen het traagheidsmoment $I_G$ (rond de as door het zwaartepunt $G$) van een homogene slanke staaf met massa $m$ en lengte $l$.

  We passen de definitie toe:
  $ I_G = integral_m r^2 d m $

  We kiezen een infinitesimaal schijfje op een afstand $x$ van $G$, met een dikte $d x$. Voor dit schijfje geldt:
  - De *massa* is $d m = m/l dot d x$ (omdat de staaf homogeen is, is de massa per lengte-eenheid constant).
  - De *afstand* tot de as door $G$ is $x$.

  Het traagheidsmoment van dit ene infinitesimale schijfje is dus:
  $ d I_G = x^2 dot m/l dot d x $

  Om het totale traagheidsmoment te krijgen, tellen we de traagheidsmomenten van alle deeltjes van de staaf op door te integreren. Omdat de staaf symmetrisch is ten opzichte van het zwaartepunt $G$, kunnen we de integraal nemen van $0$ tot $l/2$ en deze verdubbelen:

  $ I_G = 2 integral_0^(l/2) m/l x^2 d x $
  $ I_G = 2 dot m/l [x^3/3]_0^(l/2) $
  $ I_G = 2 dot m/l dot ((l/2)^3)/3 $
  $ I_G = 2 dot m/l dot l^3/24 = 1/12 m l^2 $

  *Opmerking:* Dit is een standaardresultaat dat je ook op de laatste bladzijde van je boek of in het formularium kan terugvinden. Voor veelvoorkomende homogene geometrieën zijn deze traagheidsmomenten al berekend en hoef je de integraal niet zelf opnieuw op te lossen.
]


== Homogene lichamen <sec:homogene-lichamen>

#concept(title: "Homogene lichamen")[
  Je mag alleen dit bij homogene lichamen gebruiken.
  Dit zijn lichamen waarvan de dichtheid $rho$ overal hetzelfde is.
]

== Stelling van Steinier <sec:stelling-van-steiner>

#figure(
  image("assets/Stelling van Steiner.png", width: 5cm),
  caption: [Stelling van Steiner],
  label: <fig:stelling-van-steiner>,
)

Soms ken je het massatraagheidsmoment ten opzichte van een as rond het massacentrum maar wens je het massatraagheidsmoment ten opzichte van een parallelle as.

Je kunt dan de stelling van Steinier gebruiken:

#frm(
  "Stelling van Steinier",
  [

    $ I = I_G + m d^2 $
  ],
  [

    waar $I_G$ het traagheidsmoment rond het massacentrum is, $m$ de massa van het lichaam, en $d$ de afstand tussen de twee parallelleassen.],
)

== Gyrostraal <sec:gyrostraal>

De gyrostraal is nog een manier om het traagheidsmoment te vinden [$I$].

$ I = m k^2 $

Als deze gegeven is heb je waarschijnelijk geen #keyterm[homogeen lichaam] dus je moet zoiezo deze gebruiken.


== Samenvatting <sec:samenvatting-traagheidsmoment>

- *Definitie*: $I = integral r^2 d m$
- *Homogene lichamen*: $rho = "constant"$
- *Stelling van Steiner*: $I = I_G + m d^2$
  met $I_G$ het traagheidsmoment rond het massacentrum, $m$ de massa, en $d$ de afstand tussen deassen.
- *Gyrostraal*: $I = m k^2$
  met $k$ de gyrostraal.






