#import "../../school-template.typ": *

= Relatieve bewegingsanalyse met roterende assen

tot nu toe hebben we dit allemaal gezien:

- $ arrow(v_B) = arrow(v_A) + omega crossproduct arrow(r_frac(B, A, style: "horizontal")) $
- $ arrow(a_B) = arrow(a)_A + arrow(a)_frac(B, A, style: "horizontal")t + arrow(a)_frac(B, A, style: "horizontal")n $
- $
    arrow(a_B) = arrow(a)_A + arrow(alpha) crossproduct arrow(r)_frac(B, A, style: "horizontal") - omega^2arrow(r)_frac(B, A, style: "horizontal")
  $

Dit waren allemaal voor vaste assenstelsels waarbij we een translerend coördinatenstelsel gebruiken.
Hierbij hebben we relatieve bewegingen (snelheid $v$ en versnelling $a$) beschreven. Dit waren allemaal over punten
op hetzelfde #keyterm[Starre lichaam] _Een star lichaam is een lichaam waarvan de onderlinge afstand tussen elk paar punten constant blijft (het vervormt niet)._

Uiteindelijk hebben we ook tussen verschillende starre lichamen gerekend door scharnieren die de starre lichamen verbonden.

Nu starre lichamen kunnen ook op andere manieren verbonden worden. Glij effecten tussen starre lichamen bijvoorbeeld. We kunnen dit niet beschrijven met wat we nu hebben gezien


== Relatieve bewegingsanalyse met roterende assenstelsels
<sec:rotating-coordinate-systems>
Om dit op te lossen gaan we een roterende assenstelsel gebruiken. Dit is een assenstelsel dat zowel ka #keyterm[Roteren] als #keyterm[Transleren].

=== Snelheid
#figure(
  image("roterend assenstelse.png", width: 12cm),
  caption: [roterend assenstelsel],
  label: <fig:roterend-assenstelsel>,
)

$ arrow(r)_B = arrow(r)_A + arrow(r)_frac(B, A, style: "horizontal") $
$ arrow.b.double (d/(d t)) $
$r_B$ en $r_A$ zijn de positie van B en A ten opzichte van het vaste assenstelsel en dus geen probleem om af te leiden.
$arrow(r)_frac(B, A, style: "horizontal")$ is de positie van B ten opzichte van A in het roterende assenstelsel. De eenheidsvectoren $i$ en $j$ tonen de richting en deze zijn niet constant dus we moeten deze ook gaan afleiden.

$ arrow(v)_B = arrow(v)_A + d/(d t)(x_B arrow(i) + y_B arrow(j)) $
$i$ en $j$ zijn eenheidsvectoren. Normaal als je dit afleid dan ga je krijg je nul omdat deze niet veranderen in richting bij een relatieve beweging tussen twee starre lichamen. Maar bij een rotatie wel dus je moet deze ook gaan afleiden.

$ = arrow(v)_A + [d/(d t)(x_B arrow(i) + y_B arrow(j))] + x_B frac(d arrow(i), d t) + y_B frac(d arrow(j), d t) $

als we dit uitwerken krijgen we:

$
  arrow(v)_B = arrow(v)_A + arrow(v)_frac(B, A, style: "horizontal")_(x y z) + arrow(Omega) crossproduct arrow(r)_frac(B, A, style: "horizontal")
$

met $Omega$ de hoeksnelheid van het roterend assenstelsel. en $dot(Omega) =$ de hoekversnelling van het roterend assenstelsel.


#frm(
  "Relatieve bewegingsanalyse snelheidsvergelijking",
  [
    #v(2em)
    $
      arrow(v_B) = mark(arrow(v_A), tag: #<vA>, color: #orange)
      + mark(arrow(Omega) crossproduct arrow(r_(B/A)), tag: #<hoeksnelheid-v>, color: #purple)
      + mark((arrow(v_(B/A)))_(x y z), tag: #<relatief-v>, color: #green)
      #annot(<vA>, pos: bottom, dy: 1em)[oorsprong v/h \\ bewegende \\ assenstelsel]
      #annot(<hoeksnelheid-v>, pos: top, dy: -1em)[hoeksnelheid \\ v/h bewegende \\ assenstelsel]
      #annot(<relatief-v>, pos: bottom, dy: 1em)[relatieve beweging \\ in assenstelsel]
    $
    #v(1em)
  ],
  [
    met $arrow(v_B)$ de snelheid van punt B in het vaste assenstelsel,
    $arrow(v_A)$ de snelheid van punt A in het vaste assenstelsel,
    $arrow(Omega)$ de hoeksnelheid van het roterende assenstelsel ten opzichte van het vaste assenstelsel,
    $arrow(r_(B/A))$ de positie van punt B ten opzichte van punt A in het roterende assenstelsel,
    $(arrow(v_(B/A)))_(x y z)$ de snelheid van punt B ten opzichte van punt A in het roterende assenstelsel, uitgedrukt in de basisvectoren van het roterende assenstelsel
  ],
)

=== Versnelling
Nu willen we nog de versnelling van B beschrijven. We gaan terug onze term afleiden en dan komen we dit uit:

#frm(
  "Relatieve bewegingsanalyse versnellingvergelijking",
  [
    #v(2em)
    $
      arrow(a_B) = mark(arrow(a_A), tag: #<aA>, color: #orange)
      + mark(arrow(dot(Omega)) crossproduct arrow(r_(B/A)), tag: #<hoekversnelling>, color: #blue)
      + mark(arrow(Omega) crossproduct (arrow(Omega) crossproduct arrow(r_(B/A))), tag: #<hoeksnelheid>, color: #purple)
      + mark(2 arrow(Omega) crossproduct (arrow(v_(B/A)))_(x y z), tag: #<coriolis>, color: #red)
      + mark((arrow(a_(B/A)))_(x y z), tag: #<relatief>, color: #green)
      #annot(<aA>, pos: bottom, dy: 1em)[oorsprong v/h \\ bewegende \\ assenstelsel]
      #annot(<hoekversnelling>, pos: top, dy: -1em)[hoekversnelling \\ v/h bewegende \\ assenstelsel]
      #annot(<hoeksnelheid>, pos: bottom, dy: 2.5em)[hoeksnelheid \\ v/h bewegende \\ assenstelsel]
      #annot(<coriolis>, pos: top, dy: -0.5em)[interactie: \\ hoeksnelheid assenstelsel \\ + relatieve snelheid \\ in assenstelsel]
      #annot(<relatief>, pos: bottom, dy: 1em)[relatieve beweging \\ in assenstelsel]
    $
    #v(2em)
  ],
  [
    met $arrow(a_B)$ de versnelling van punt B in het vaste assenstelsel,
    $arrow(a_A)$ de versnelling van punt A in het vaste assenstelsel,
    $arrow(Omega)$ de hoeksnelheid van het roterende assenstelsel ten opzichte van het vaste assenstelsel,
    $arrow(r_(B/A))$ de positie van punt B ten opzichte van punt A in het roterende assenstelsel,
    $(arrow(v_(B/A)))_(x y z)$ de snelheid van punt B ten opzichte van punt A in het roterende assenstelsel, uitgedrukt in de basisvectoren van het roterende assenstelsel,
    $arrow(a)_(frac(A, B, style: "horizontal"))_(x y z)$ de versnelling van punt B ten opzichte van punt A in het roterende assenstelsel, uitgedrukt in de basisvectoren van het roterende assenstelsel
  ],
)


#oefening(title: "Oefening 1: 16.18")[
  #figure(
    image("Oefening 16.18.png", width: 10cm),
    caption: [Oefening 16.18],
    label: <fig:Oefening-16.18>,
  )

  *Gegeven*\
  $omega_(O C) = 3 (r a d)/s$\
  $alpha_(O C) = 2 (r a d)/s$\
  $v_frac(c, d, style: "horizontal") = 2 m/s$\
  $a_(c/d) = 3 m/s^2$

  *Gevraagd*\
  $arrow(v_c), arrow(a_c), arrow(a_(c o r r c)))$

  *Oplossing*\

  #figure(
    image("figuur 1 oefening 16.18.png", width: 4cm),
    caption: [figuur 1 oefening 16.18],
    label: <fig:figuur-1-oefening-16.18>,
  )

  $
    arrow(v_c) = arrow(v_O) = arrow(Omega) x arrow(r_frac(C, O, style: "horizontal")) + (arrow(v_frac(C, O, style: "horizontal")))_(x y z))
  $

  $v_o = 0$\
  $Omega = omega_(O C)$


  We gaan gebruik maken van x,y,z

  Snelheid:\
  $arrow(v_C) = 0 + (-3arrow(K)) crossproduct (0.2arrow(i) + 2arrow(i))$
  $markhl(arrow(v_c) = (2arrow(i) -0.6arrow(j)) m/s)$

  Versnelling:\
  $
    arrow(a_(c o r r c)) = 2 arrow(Omega) crossproduct (arrow(v_frac(C, O, style: "horizontal")))_(x y z) = 2 (-3arrow(K)) x (2arrow(i))
  $
  $ markhl(arrow(a_(c o r r c)) = -12 arrow(j) m/s^2) $

  Nu moeten we nog de absolute versnelling van C berekenen:\
  $
    arrow(a_c) = arrow(a_O) + arrow(dot(Omega)) x arrow(r_frac(C, O, style: "horizontal")) + arrow(Omega) crossproduct (arrow(Omega) crossproduct arrow(r_frac(C, O, style: "horizontal"))) + 2 arrow(Omega) crossproduct (arrow(v_frac(C, O, style: "horizontal")))_(x y z) + (arrow(a_frac(C, O, style: "horizontal")))_(x y z)
  $


  $
    arrow(a_c) = 0 + 2 (-3arrow(K)) crossproduct (0.2arrow(i)) + (-3arrow(K)) crossproduct ((-3arrow(K)) x (0.2arrow(i))) + 2 (-3arrow(K)) crossproduct (2arrow(i)) + 3 arrow(i)
  $
  $ markhl(arrow(a_c) = (3arrow(i) - 12arrow(j)) m/s^2) $




]

#oefening(title: "Oefening 3 16.20")[

  #figure(
    image("oefening 16.20.png", width: 10cm),
    caption: [oefening 16.20],
    label: <fig:oefening-16.20>,
  )

  *Gegeven*\

  $arrow(v_frac(B, A, style: "horizontal")) = 100arrow(j) (k m/h)$\
  $arrow(a_frac(B, A, style: "horizontal") = (900arrow(i)-150arrow(j)) (k m)/h^2)$


  *Gevraagd*\
  $arrow(v_frac(A, B, style: "horizontal")), arrow(a_frac(A, B, style: "horizontal"))$

  *Oplossing*\

  #figure(
    image("figuur 16.20.png", width: 5cm),
    caption: [figuur 16.20],
    label: <fig:figuur-16.20>,
  )

  _Stap 1: Kies het roterende assenstelsel._\
  We bevestigen het bewegende $x y z$-assenstelsel aan vliegtuig B (de waarnemer). Omdat B een cirkelvormige baan beschrijft met kromtestraal $rho_B = 400 "km"$, roteert dit assenstelsel mee met B.

  _Stap 2: Bepaal de hoeksnelheid en hoekversnelling van het assenstelsel._\
  De hoeksnelheid van B's assenstelsel volgt uit de tangentiële snelheid en de kromtestraal:
  $
    Omega = v_B / rho_B = 600 / 400 = 1.5 "rad/h"
  $
  Uit de figuur: $arrow(Omega) = -1.5 arrow(k) "rad/h"$ (kloksgewijs).\
  De hoekversnelling volgt uit de tangentiële versnelling:
  $
    dot(Omega) = a_(B,t) / rho_B = 100 / 400 = 0.25 "rad/h"^2 arrow.r arrow(dot(Omega)) = -0.25 arrow(k) "rad/h"^2
  $

  _Stap 3: Bereken de snelheid van A gezien door de piloot van B._\
  We vertrekken van de snelheidsvergelijking met roterende assen:
  $
    arrow(v_A) = arrow(v_B) + arrow(Omega) crossproduct arrow(r_(A\/B)) + (arrow(v_(A\/B)))_(x y z)
  $
  Herschrijven naar de relatieve snelheid in het roterende stelsel:
  $
    (arrow(v_(A\/B)))_(x y z) = underbrace((arrow(v_A) - arrow(v_B)), arrow(v_(B\/A)) = 100 arrow(j)) - arrow(Omega) crossproduct arrow(r_(A\/B))
  $
  Uitwerken van het kruisproduct:
  $
    arrow(Omega) crossproduct arrow(r_(A\/B)) = (-1.5 arrow(k)) crossproduct (-4 arrow(i)) = 6 arrow(j) "km/h"
  $
  Dus:
  $
    markhl((arrow(v_(A\/B)))_(x y z) = 100 arrow(j) - 6 arrow(j) = 94 arrow(j) "km/h")
  $

  _Stap 4: Bereken de versnelling van A gezien door de piloot van B._\
  De versnellingsvergelijking met roterende assen is:
  $
    arrow(a_A) = arrow(a_B) + arrow(dot(Omega)) crossproduct arrow(r_(A\/B)) + arrow(Omega) crossproduct (arrow(Omega) crossproduct arrow(r_(A\/B))) + 2 arrow(Omega) crossproduct (arrow(v_(A\/B)))_(x y z) + (arrow(a_(A\/B)))_(x y z)
  $
  Omschrijven:
  $
    (arrow(a_(A\/B)))_(x y z) = underbrace((arrow(a_A) - arrow(a_B)), arrow(a_(B\/A)) = (900 arrow(i) - 150 arrow(j))) - arrow(dot(Omega)) crossproduct arrow(r_(A\/B)) - arrow(Omega) crossproduct (arrow(Omega) crossproduct arrow(r_(A\/B))) - 2 arrow(Omega) crossproduct (arrow(v_(A\/B)))_(x y z)
  $

  We berekenen elk kruisproduct apart:\
  $
    arrow(dot(Omega)) crossproduct arrow(r_(A\/B)) = (-0.25 arrow(k)) crossproduct (-4 arrow(i)) = 1 arrow(j)
  $
  $
    arrow(Omega) crossproduct arrow(r_(A\/B)) = 6 arrow(j) space arrow.r space arrow(Omega) crossproduct (6 arrow(j)) = (-1.5 arrow(k)) crossproduct (6 arrow(j)) = 9 arrow(i)
  $
  $
    2 arrow(Omega) crossproduct (arrow(v_(A\/B)))_(x y z) = 2(-1.5 arrow(k)) crossproduct (94 arrow(j)) = 282 arrow(i)
  $

  Invullen:
  $
    (arrow(a_(A\/B)))_(x y z) & = (900 arrow(i) - 150 arrow(j)) - 1 arrow(j) - 9 arrow(i) - 282 arrow(i) \
                              & = (900 - 9 - 282) arrow(i) + (-150 - 1) arrow(j)
  $
  $
    markhl((arrow(a_(A\/B)))_(x y z) = (609 arrow(i) - 151 arrow(j)) "km/h"^2)
  $



]

#figure(
  image("oefening 6 16.141 alt.png", width: 12cm),
  caption: [oefening 6 16.141 alt],
  label: <fig:oefening-6-16.141-alt>,
)


#oefening(title: "Oefening 6 16.141 (ALT)")[

  #figure(
    image("oefening 6 16.141 alt.png", width: 12cm),
    caption: [oefening 6 16.141 alt],
  )
  #figure(
    image("oefening 16.141 alt.png", width: 5cm),
    caption: [oefening 16.141 alt],
  )

  *Gegeven*\
  $omega_(A B) = 4 "rad/s"$, $alpha_(A B) = 2 "rad/s"^2$\
  $r_(C\/A) = 0.75 "m"$ (langs stang AB), $C D = 0.5 "m"$ (horizontaal)\
  Hoek AB met horizontale: $60°$\
  De mof in C is scharnierend aan CD bevestigd en glijdt wrijvingsloos over stang AB.

  *Gevraagd*\
  $omega_(C D)$ en $alpha_(C D)$

  *Oplossing*\

  _Stap 1: Kies het roterende assenstelsel._\
  We bevestigen het roterende $x y z$-assenstelsel aan stang AB, met oorsprong in A. De $arrow(i)$-as wijst langs AB (naar C), zodat de mof C alleen in de $arrow(i)$-richting kan glijden. Omdat AB roteert met $omega_(A B)$, roteert dit assenstelsel mee:
  $
    arrow(Omega) = omega_(A B) = 4 arrow(k) "rad/s", quad arrow(dot(Omega)) = alpha_(A B) = 2 arrow(k) "rad/s"^2
  $

  _Stap 2: Schrijf de positie en relatieve snelheid/versnelling._\
  In het roterende stelsel schuift C alleen langs de $arrow(i)$-as:
  $
    arrow(r_(C\/A)) = 0.75 arrow(i) "m"
  $
  $
    (arrow(v_(C\/A)))_(x y z) = v_(C\/A) arrow(i), quad (arrow(a_(C\/A)))_(x y z) = a_(C\/A) arrow(i)
  $
  (De relatieve snelheid en versnelling hebben enkel een $arrow(i)$-component, want C glijdt over AB.)

  === Snelheidsanalyse

  _Stap 3: Stel de snelheidsvergelijking op._\
  $
    arrow(v_C) = underbrace(arrow(v_A), 0) + arrow(Omega) crossproduct arrow(r_(C\/A)) + (arrow(v_(C\/A)))_(x y z)
  $
  $v_A = 0$ want A is een vast scharnierpunt. Uitwerken:
  $
    arrow(v_C) = underbracket(4 arrow(k) crossproduct 0.75 arrow(i), 3 arrow(j)) + v_(C\/A) arrow(i)
  $

  _Stap 4: Koppel aan stang CD._\
  Punt C zit ook vast aan stang CD die rond D draait, dus:
  $
    arrow(v_C) = arrow(omega_(C D)) crossproduct arrow(r_(C\/D)) = omega_(C D) arrow(k) crossproduct (-0.5 arrow(i)) = -0.5 omega_(C D) arrow(j)
  $
  (Let op: $arrow(r_(C\/D))$ wijst van D naar C, dus in de $-arrow(i)$-richting van het vaste stelsel.)

  _Stap 5: Projecteer op de vaste x- en y-as._\
  Nu moeten de twee uitdrukkingen voor $arrow(v_C)$ gelijk zijn. De stang AB staat onder $60°$, dus de eenheidsvectoren van het roterende stelsel uitgedrukt in het vaste stelsel:
  $arrow(i)_(A B) = cos 60° arrow(I) + sin 60° arrow(J)$.\
  Projectie:
  $ (x): v_(C\/A) cos 60° = -0.5 omega_(C D) $
  $ (y): v_(C\/A) sin 60° + 3 = 0 $
  Uit (y): $v_(C\/A) = -3 / sin 60° = -3.46 "m/s"$\
  Uit (x): $omega_(C D) = (-(-3.46) cos 60°) / 0.5$

  Hmm, laat me dit opnieuw bekijken met de exacte projectie van het bord:
  $ (x): v_(C\/A) = -0.5 omega_(C D) cos 60° $
  $ (y): 3 = 0.5 omega_(C D) sin 60° $

  Uit (y): $omega_(C D) = 3 / (0.5 sin 60°) = 3 / 0.433$
  $ markhl(omega_(C D) = 6.93 "rad/s") $

  Uit (x): $v_(C\/A) = -0.5 times 6.93 times cos 60°$
  $ markhl(v_(C\/A) = -1.73 "m/s" arrow.r.double 1.73 "m/s" arrow.tl) $

  === Versnellingsanalyse

  _Stap 6: Stel de versnellingsvergelijking op._\
  $
    arrow(a_C) = underbrace(arrow(a_A), 0) + arrow(dot(Omega)) crossproduct arrow(r_(C\/A)) + arrow(Omega) crossproduct (arrow(Omega) crossproduct arrow(r_(C\/A))) + 2 arrow(Omega) crossproduct (arrow(v_(C\/A)))_(x y z) + (arrow(a_(C\/A)))_(x y z)
  $

  We berekenen elk term apart:\
  $
    arrow(dot(Omega)) crossproduct arrow(r_(C\/A)) = 2 arrow(k) crossproduct 0.75 arrow(i) = 1.5 arrow(j)
  $
  $
    arrow(Omega) crossproduct (arrow(Omega) crossproduct arrow(r_(C\/A))) = 4 arrow(k) crossproduct underbrace((4 arrow(k) crossproduct 0.75 arrow(i)), 3 arrow(j)) = 4 arrow(k) crossproduct 3 arrow(j) = -12 arrow(i)
  $
  $
    2 arrow(Omega) crossproduct (arrow(v_(C\/A)))_(x y z) = 2 (4 arrow(k)) crossproduct (-1.73 arrow(i)) = -13.86 arrow(j)
  $
  $
    (arrow(a_(C\/A)))_(x y z) = a_(C\/A) arrow(i)
  $
  Samenvoegen:
  $
    arrow(a_C) = 1.5 arrow(j) + (-12 arrow(i)) + (-13.86 arrow(j)) + a_(C\/A) arrow(i)
  $
  $
    arrow(a_C) = (a_(C\/A) - 12) arrow(i) + (1.5 - 13.86) arrow(j) = (a_(C\/A) - 12) arrow(i) - 12.36 arrow(j)
  $

  _Stap 7: Koppel aan de versnelling via stang CD._\
  Punt C beweegt rond D, dus:
  $
    arrow(a_C) = arrow(alpha_(C D)) crossproduct arrow(r_(C\/D)) + arrow(omega_(C D)) crossproduct (arrow(omega_(C D)) crossproduct arrow(r_(C\/D)))
  $
  $
    = alpha_(C D) arrow(k) crossproduct (-0.5 arrow(i)) + 6.93 arrow(k) crossproduct (6.93 arrow(k) crossproduct (-0.5 arrow(i)))
  $
  $
    = -0.5 alpha_(C D) arrow(j) + 6.93 arrow(k) crossproduct (-3.46 arrow(j))
  $
  $
    = -0.5 alpha_(C D) arrow(j) + 24 arrow(i)
  $
  (want $omega_(C D)^2 times 0.5 = 6.93^2 times 0.5 = 24$)

  _Stap 8: Projecteer en los op._\
  Gelijkstellen van de twee uitdrukkingen voor $arrow(a_C)$:
  $ (x): a_(C\/A) - 12 = 24 arrow.r a_(C\/A) = 36 "m/s"^2 $
  $ (y): -12.36 = -0.5 alpha_(C D) $
  $
    markhl(alpha_(C D) = 24.7 "rad/s"^2)
  $

]



