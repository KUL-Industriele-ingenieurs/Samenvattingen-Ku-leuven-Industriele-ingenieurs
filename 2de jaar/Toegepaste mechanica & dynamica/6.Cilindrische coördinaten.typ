#import "../../school-template.typ": *

= Cilindrische PoolCoördinaten <ch:cilindrische-poolcoördinaten>

PoolCoördinaten zijn al gezien geweest in dynamica en wiskundige modellen. Poolcoördinaten
gaan inplaats van met $x,y, z$ die punten zijn in onze coördinaat systeem zijn gaan we een vector $arrow(r)$ definieren en dan met hoeken onze dimensies aanduiden

$ arrow(r) = r arrow(u_r) $
met $u_r$ de eenheidsvector in de richting van r en $r$ de afstand tot de oorsprong.

weet dat $(dot(x))$ de afgeleide van $x$ is

$ arrow(v) = dot(r) arrow(u_r) + r dot(theta) arrow(u_theta) 0 $
$ = v_1 dot u_1 + V_theta dot u_theta $

$ arrow(a) = a_r dot u_r + a_theta dot u_theta $
$ = (d dot(r) - r dot(theta)^2) arrow(u_r) + (r d dot(theta) + 2 dot(r) dot(theta)) arrow(u_theta) $

$a_1 = d dot(dot(r)) - r dot(theta)^2$
$a_2 = r d dot(dot(theta)) + 2 dot(r) dot(theta)$


*Cilindrische coördinaten*\
Hieribij gaan we met $r,z, theta$ werken dus we hebben nog twee afstandvectoren en een thetavector.


*Soort problemen*\

+ de coördinaten zijn expliseet gegeven in functie van tijd. $r = r(t), theta = theta(t)$
We kunnen rechtstreeks de snelheden vinden door af te leiden.
+ je kunt r uitdrukken in functie van theta. $r = f(theta)$. Dus afhaneklijk van de afstand van r gaat die op een bepaalde hoek zitten.
We moeten dan de kettingregel gebruiken om de snelheden te vinden.

$ d/(d x)(f(g(x))) = frac(d f, d g) dot frac(d g, d x) $

De binnenste functie $g$ is uitgedrukt in $x$ en de functie erbuiten uitgedrukt in $g(x)$

#oefening(title: "Oefening 1| 1.18")[

  #figure(
    image("oefening 1.18.png", width: 10cm),
    caption: [oefening 1.18],
    label: <fig:oefening-1.18>,
  )

  #figure(
    image("oefening 1.18 tekening.png", width: 5cm),
    caption: [oefening 1.18 tekening],
    label: <fig:oefening-1.18-tekening>,
  )

  *Gegeven*\
  $r = 100t^2 m m$
  $theta = t^3 r a d$

  *Gevraagd*\
  $arrow(v)$, $arrow(a)$

  *Oplossing*\

  We hebben de volgende gegevens:
  $r = 100t^2 m m$
  $theta = t^3 (r a d)$

  We kunnen de snelheden vinden door af te leiden:
  $dot(r) = 200t m m/s$
  $dot(theta) = 3t^2 (r a d)/s$

  $ dot.double(r) = 200 m m/s^2 $
  $ dot.double(theta) = 6t (r a d)/s^2 $

  Invullen $t = 1s$

  $ r = 100(1)^2 = 100 m m $
  $ theta = (1)^3 = 1 r a d $

  $ dot(r) = 200(1) = 200 m m/s $
  $ dot(theta) = 3(1)^2 = 3 (r a d)/s $

  $ dot.double(r) = 200 m m/s^2 $
  $ dot.double(theta) = 6(1) = 6 (r a d)/s^2 $

  Nu de snelheid:

  $ markhl(v_r = dot(r) = 200 m m/s) $
  $ markhl(v_theta = r dot(theta) = 100 * 3 = 300 m m/s) $


  Nu nog de versnelling

  $a_r = d dot(r) - r dot(theta)^2 = 200 - 100 * 3^2 = 200 - 900 = -700 m m/s^2$
  $a_theta = r d dot(theta) + 2 dot(r) dot(theta) = 100 * 6 + 2 * 200 * 3 = 600 + 1200 = 1800 m m/s^2$

  $ markhl(a_r = -700 m m/s^2) $
  $ markhl(a_theta = 1800 m m/s^2) $

  $ markhl(vec(a_b) = (-700 vec(u_r) + 1800vec(u_theta) m m/s^2)) $



]

#oefening(title: "Oefening 3 | 1.20")[

  #figure(
    image("oefening 1.20.png", width: 10cm),
    caption: [Oefening 1.20],
    label: <fig:oefening-1.20>,
  )

  *Gegeven*\
  $r = 0.15(1-cos(theta))m$
  $v = 1.2 m/s$
  $a = 9 m/s^2$

  *Gevraagd*\
  $omega$ = $dot(theta)$
  $alpha$ = $dot.double(theta))$

  *Oplossing*\

  $r = 0.15(1-cos theta ) m$

  *Afleiden:*\
  $dot(r) = 0.15(sin theta dot theta ) m/s$

  *Nog eens afleiden:*\
  Welke delen zijn nu afhankelijk van t, theta kun je bezien als een functie van t dus ga je de kettingregel gebruiken.
  $dot(dot(r)) = 0.15(cos (theta )underbracket(dot(theta) dot(theta), dot(theta^2)) + sin (theta) dot.double(theta)) ) m/s^2$

  $r = 0.3 m$\
  $dot(r) = 0 m/s$\
  $dot.double(r) = 0 m/s^2$

  $theta = 180deg$\
  $dot(theta) = 0 (r a d)/s$\
  $dot.double(theta) = 0 (r a d)/s^2$

  $ v = 1.2 m/s = sqrt(v_r^2 + v_theta^2) = sqrt(dot(r)^2 + (r dot(theta))^2) $
  $ v = sqrt(0^2 + (0.3 * 0)^2) arrow.r.double dot(theta) = 4 (r a d )/s $

  $ a_r = dot.double(r) - r dot(theta)^2 = -0.15(4)^2 -0.3 4^2 = -2.4 - 4.8 = -7.2 m/s^2 $

  $ a_theta = r d dot(theta) + 2 dot(r) dot(theta) = 0.3 dot 0 + 2 dot 0 dot 4 = 0.3 dot.double(theta) + 0 $

  $ sqrt(a_r^2 + a_theta^2) = sqrt((-7.2)^2 + 0.3^2dot.double(theta)) = 9 m/s^2 $

  $ markhl(a_r = -9 m/s^2) $
  $ markhl(a_theta = 0 m/s^2) $

  $ arrow.b.double $

  $ markhl(dot.double(theta) = 18 (r a d )/s^2) $
]

#oefening(title: "Oefening 4 | 16.141")[


  #figure(
    image("oefening 16.141.png", width: 10cm),
    caption: [oefening 16.141],
    label: <fig:oefening-16.141>,
  )

  We kunnen niet de vorige formules gebruiken van vorige weken omdat

  *Gegeven*\
  $omega_(A B) = 4 (r a d)/s$
  $alpha_(A B) = 2 (r a d)/s^2$

  *Gevraagd*\
  $omega_(C D)$
  $alpha_(C D)$

  Wat voor soort beweging gaat C maken? $arrow.r$ circkelbeweging rond D

  Wat is r? $arrow.r$ kijkend van A naar C

  *Oplossing*\

  #figure(
    image("Figuur oefening 16.141.png", width: 8cm),
    caption: [Figuur oefening 16.141],
    label: <fig:Figuur-oefening-16.141>,
  )

  Snelheden:

  $ arrow(v_c) = arrow(v_r) dot arrow(u_r) + arrow(v_theta) dot arrow(u_theta) $

  En we weten met afgeleiden dat:
  $ arrow(v_r) = dot(r) $
  $ arrow(v_theta) = underbracket(r dot(theta), omega_(A B)) = 0.75 dot 4 (r a d)/s = markrect(3 m/s) $

  $ arrow(v_c) = v_c dot arrow(j) $
  We zitten nu wel met twee assenstelsels. Dus we moeten ons ene assenstelsel projecten op de andere.

  $ arrow.r.double dot(r) = - v_c cos(60°) $

  $ 3 = underbracket(v_c), 0.5 dot omega_(C D)) sin(60°) $
  $markhl(arrow.r.double omega_(C D) = 6.96 (r a d)/s)$
  $ markhl(dot(r) = 1.73 m/s) $

  Versnelling:

  #figure(
    image("versnelling 16.141.png", width: 10cm),
    caption: [versnelling 16.141],
    label: <fig:versnelling-16.141>,
  )

  $ a_(c t) = 0.5 alpha_(C D) $
  $ a_(c n) = 0.5 underbracket(omega_(C D)^2, 6.96 (r a d)/s)^2 = 24.2 m/s^2 $

  $ a_c = a_r dot u_r + a_theta dot u_theta $

  $ a_r = dot.double(r) - r dot(theta)^2 = 0 - 0.75 * 4^2 = -12 m/s^2 $

  $
    a_theta = r underbracket(dot.double(theta), alpha_(C D)) + 2 dot(r) dot(theta) = 0.75 * 2 + 2 dot (-1.73) dot 4 = 1.5 - 13.84 = -12.34 m/s^2
  $

  Projectie in $r_theta$ assenstelsel:
  $ (r): dot.double(r) -12 = -0.5 alpha_(C D) + 24.2 cos(60°) $
  $ (theta): -12.34 = 0.5 dot.double(r) + 24.2 sin(60°) $
  $ arrow.b.double $

  $ alpha_(C D) = -56,24 frac(r a d, s^2) = 56,24 (r a d)/s^2 arrow.ccw $
  $ markhl(dot.double(r) = 46.8 m/s^2) $



]

