#import "../../school-template.typ": *

= Cilindrische Poolcoördinaten <ch:cilindrische-poolcoördinaten>

Een vector kan uitgedrukt worden in verschillende soorten systemen. Vorige hoofdstukken hebben we het rechthoekige assenstelsel (x,y) gezien maar nu gaan we verder met poolcoördinaten (r,$theta$). _Poolcoördinaten zijn al gezien geweest in dynamica en wiskundige modellen._

#wrap-figure(
  image("assets/poolcoördinaten.png", width: 7cm),
  caption: [poolcoördinaten],
  label: <fig:poolcoördinaten>,
)[

  == Positie <sec:positie>
  We hebben onze plaatsvector aangeduid met vector $arrow(r)$ met de richting van de vector aangeduid met een hoek $theta (r a d)$.

  Er is voor $r$ een eenheidsvector $arrow(u_r)$ en ook voor de hoek $theta$ een eenheidsvector $arrow(u_theta)$ waarbij $arrow(u_theta)$ loodrecht op $arrow(u_r)$ is.

  == Snelheid <sec:snelheid>
  Net zoals vorige hoofdstukken is het gewoon afleiden van onze plaatsvector over de tijd $d/(d t)$
  $
    arrow(v) = underbrace(arrow(dot(r)), r dot arrow(u_r)) overbrace(=, "kettingregel")dot(r)arrow(u_r) + r dot arrow(dot(u_r))
  $

  Afleiden van een vector is niet zo makkelijk dus we gaan een visuele analyse doen.
]

#wrap-figure(
  image("assets/cilindrische-afgeleiden.png", width: 7cm),
  caption: [cilindrische-afgeleiden],
  label: <fig:cilindrische-afgeleiden>,
)[

  We kunnen over intifisitimale veranderingen bekijken.

  $ u_r' = u_r + Delta u_r $
  $ u_theta' = u_theta + Delta u_theta $

  Voor kleine verandereingen $Delta u_r$ en $Delta u_theta$ kunnen we zeggen:

  $
    Delta arrow(u_r) approx underbrace(||Delta arrow(u_r)||, 1) Delta theta arrow(u_theta) = Delta theta arrow(u_theta)
  $

  Laten we dit invullen in onze vorige formule en de definitie van afgeleiden nemen

  $ u_r' = u_r + Delta u_r = u_r + Delta theta arrow(u_theta) $
]
$
  u_r' = u_r lim_(Delta t -> 0) (Delta u_r)/(Delta t) = (lim_(Delta t -> 0) Delta theta arrow(u_theta))/(Delta t) u_theta
$

$ bold(arrow(v) = underbrace(dot(r), v_r dot arrow(u_r)) + underbrace(r dot(theta), v_theta dot arrow(u_theta))) $

met $v_r$ de snelheid en $v_theta$ de hoeksnelheid. Je hebt twee delen je #keyterm[transversaal deel] en je #keyterm[hoekverandering].

$ v_r = dot(r) $
$ v_theta = r dot(theta) $

$ v = v_r dot arrow(u_r) + v_theta arrow(u_theta) $
Omdat de vectoren loodrecht op elkaar staan kan je de snelheid simpel vinden door de pythagoras te gebruiken:

$ v = sqrt(v_r^2 + v_theta^2) = sqrt(dot(r)^2 + (r dot(theta))^2) $

Dan kom je een vector uit


== Versnelling <sec:versnelling>

Opnieuw hetzelfde _We maken niet heel de afleiding opnieuw heel gelijkaardig aan afleiding snelheid_

#wrap-figure(
  image("assets/cilindrisch versnelling.png", width: 5cm),
  caption: [cilindrisch versnelling],
  label: <fig:cilindrischversnelling>,
)[


  $
    arrow(a) = a_r arrow(u_r) + a_theta arrow(u_theta)
  $
  met $a_r$ en $a_theta$ de versnelling in de richting van $arrow(u_r)$ en $arrow(u_theta)$:

  $
    a_r = dot.double(r) + r dot.double(theta)
  $
  $
    a_theta = r dot.double(theta) + 2 dot(r) dot(theta)
  $

  #examenbox[Je moet deze niet van buiten kennen je vindt ze op het formularium. Leer ze vooral gebruiken.]

  Net zoals bij snelheid staat het transversaal deel $a_r$ en de hoekverandering $a_theta$ loodrecht op elkaar.

  $ a = sqrt(a_r^2 + a_theta^2) = sqrt((dot.double(r))^2 + (r dot.double(theta))^2) $
]

== Cilindrisch assenstelsel (3D) <sec:cilindrisch-assenstelsel>
#wrap-figure(
  image("assets/3D cilindrisch assenstelsel.png", width: 5cm),
  caption: [3D cilindrisch assenstelsel],
  label: <fig:3D-cilindrisch-assenstelsel>,
)[

  Dit waren nu analyses in een #keyterm[plat assenstelsel], als we nog een extra dimensie willen gebruiken kunnen we een #keyterm[cilindrisch assenstelsel] gebruiken. Deze bestaan uit de transversale (r, z) en de hoekverandering (theta).

  Deze hebben net zoals het vlak assenstelsen een eenheidsvector $u$ en een grootte $r$ of $z$ en dan een hoek $theta$.

  $ arrow(r_p) = r arrow(u_r) + z arrow(u_z) $

  $ arrow(v) = dot(r) arrow(u_r) + r dot(theta) arrow(u_theta) + z dot(z) arrow(u_z) $
  $
    arrow(a) = dot.double(r-r dot(theta)^2) arrow(u_r) + (r dot.double(theta) + 2 dot(r) dot(theta)) arrow(u_theta) + dot.double(z) arrow(u_z)
  $
]
== Soort problemen <sec:soort-problemen>

+ de coördinaten zijn expliseet gegeven in functie van tijd. $r = r(t), theta = theta(t)$
We kunnen rechtstreeks de snelheden vinden door af te leiden.
+ je kunt r uitdrukken in functie van theta. $r = f(theta)$. Dus afhaneklijk van de afstand van r gaat die op een bepaalde hoek zitten.
We moeten dan de kettingregel gebruiken om de snelheden te vinden.

$ d/(d x)(f(g(x))) = frac(d f, d g) dot frac(d g, d x) $

De binnenste functie $g$ is uitgedrukt in $x$ en de functie erbuiten uitgedrukt in $g(x)$

#oefening(title: "Oefening 1| 1.18")[

  #figure(
    image("assets/oefening 1.18.png", width: 10cm),
    caption: [oefening 1.18],
    label: <fig:oefening-1.18>,
  )

  #figure(
    image("assets/oefening 1.18 tekening.png", width: 5cm),
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

  $ bold(v_r = dot(r) = 200 m m/s) $
  $ bold(v_theta = r dot(theta) = 100 * 3 = 300 m m/s) $


  Nu nog de versnelling

  $a_r = d dot(r) - r dot(theta)^2 = 200 - 100 * 3^2 = 200 - 900 = -700 m m/s^2$
  $a_theta = r d dot(theta) + 2 dot(r) dot(theta) = 100 * 6 + 2 * 200 * 3 = 600 + 1200 = 1800 m m/s^2$

  $ bold(a_r = -700 m m/s^2) $
  $ bold(a_theta = 1800 m m/s^2) $

  $ bold(vec(a_b) = (-700 vec(u_r) + 1800vec(u_theta) m m/s^2)) $



]

#oefening(title: "Oefening 3 | 1.20")[

  #figure(
    image("assets/oefening 1.20.png", width: 10cm),
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

  $ bold(a_r = -9 m/s^2) $
  $ bold(a_theta = 0 m/s^2) $

  $ arrow.b.double $

  $ bold(dot.double(theta) = 18 (r a d )/s^2) $
]

#oefening(title: "Oefening 4 | 16.141")[


  #figure(
    image("assets/oefening 16.141.png", width: 10cm),
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
    image("assets/Figuur oefening 16.141.png", width: 8cm),
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
  $bold(arrow.r.double omega_(C D) = 6.96 (r a d)/s)$
  $ bold(dot(r) = 1.73 m/s) $

  Versnelling:

  #figure(
    image("assets/versnelling 16.141.png", width: 10cm),
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
  $ bold(dot.double(r) = 46.8 m/s^2) $



]

