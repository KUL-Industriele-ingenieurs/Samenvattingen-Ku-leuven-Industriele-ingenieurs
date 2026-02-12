// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Vlakke beweging van een star lichaam

== Star lichaam

#let fig = image("Star lichaam.png",width: 3cm)
#let boxed = box(fig, inset: (right: 0.5em, bottom: 0.5em))

#wrap-content(boxed)[
#concept(title: "Definities")[ 
  - *Puntdeeltje*: Heeft een massa $m$ maar geen 
  afmetingen $x,$ $y,$ $z$
  - *Star lichaam*: Heeft een massa $m$ en afmetingen $x,$ $y,$ $z$ die constant blijven ten opzichte van elkaar.
  - *Vlakke beweging*: Alle deeltjes van het lichaam bewegen in een vlak, bijvoorbeeld het $x$-$y$-vlak. De rotatie staat hier loodrecht op dit vlak, bijvoorbeeld rond de $z$-as.
]
]

Type vlakke bewegingen:

- *Translatie*: Alle deeltjes van het lichaam bewegen in dezelfde richting en met dezelfde snelheid. Er is geen rotatie.
- *Rotatie*: Alle deeltjes van het lichaam bewegen in cirkels rond een gemeenschappelijk rotatieas. Er is geen translatie.
- *Algemene beweging*: Een combinatie van translatie en rotatie. De beweging kan complex zijn, waarbij het lichaam zowel beweegt als roteert.

== Translatie( Rechtlijning of Kromlijning)
Wordt met vectoren beschreven. 
positie $vec(r)$, snelheid $vec(v)$ en versnelling $vec(a)$ zijn vectoren die de beweging van het lichaam in het vlak beschrijven.

#TODO("Add figure")

- *Positie* $vec(r_B) = vec(r_A) + vec(r_{B/A}) $
- *Snelheid* $vec(v_B) = vec(v_A)$
- *Versnelling* $vec(a_B) = vec(a_A)$

Je positie wordt bij elkaar opgeteld maar er is geen enkele verandering in richinting dus de snelheid en versnelling zijn hetzelfde voor elk punt in het lichaam.

== Rotatie:
wordt met hoeken en hoeksnelheden beschreven. De hoek $theta$ beschrijft de oriëntatie van het lichaam.

De hoeksnelheid $omega$ beschrijft hoe snel het lichaam roteert,(1 omwenteling = $2\pi$ rad = 360$degree$)

De hoekversnelling $alpha$ beschrijft hoe snel de hoeksnelheid verandert.

#align(center, image("Rotatie.png", width: 6cm))



#frm("Afleidingen snelheid en versnelling", $v$, [
  $v = v_0 + a t$,
  $x = x_0 + v_0 t + 1/2 a t^2$,
  $v^2 = v_0^2 + 2 a (x - x_0)$,
  $omega = omega_0 + alpha t$,
  $theta = theta_0 + omega_0 t + 1/2 alpha t^2$,
  $omega^2 = omega_0^2 + 2 alpha (theta - theta_0)$
])


#frm("Draaiende versnellingen", $v$, [
  $v = omega r$,
  $a_t = alpha r$,
  $a_n = omega^2 r$
])

#oefening(title: "Stilstaan touw aan wiel")[ 
#image("Oefening.png")
$w(t), omega(t) ?$
+ *Teken alle versnellingen, snelheden en posities van het touw en het wiel.*
+ *Gegevens*, R = 0.2m n a = 4t m/s^2 en $omega_0 = 0$

$a_t = alpha R = 4 * 0.2 = 0.8 m/s^2$
$alpha = 4t/R = 4t/0.2 = 20t , r a d/s^2$

alpha gaan integeren om omega te vinden:
$omega = integral_0^t alpha = integral_0^t 20t  = 10t^2 + C$
$omega_0 = 0$ dus $C = 0$

$omega$ integreren om theta te vinden:
$theta = integral_0^t omega  = integral_0^t 10t^2  = 10t^3/3 + D$
$theta_0 = 0$ dus $D = 0$

$omega(t) = 10t^2 text{r a d/s}$
$theta(t) = 10t^3/3 text{r a d}$
]



== Algemene beweging:
is een combinatie van translatie en rotatie. De positie, snelheid en versnelling van elk punt in het lichaam kunnen worden beschreven door zowel de translatie- als de rotatiecomponenten te combineren.

== Contactpunten

#image("/assets/image.png")
Ze hebben dezelfde snelheid aan de contactpunten want de tanden connecteren op elkaar dus ze moeten dezelfde zijn. $a_t$ is dus ook hetzelfde. 
Maar $a_n$ is niet hetzelfde want het ene wiel kan groter zijn dan het andere dus de straal is verschillend.

#image("/assets/image-1.png")

#oefening(title: "Rotatie")[
  #image("/assets/image-2.png")
  *Gegevens* $omega = 6 r a d/s, alpha = 0.5 r a d/s^2$
  *Gevraagd* Snelheid $v$ en versnelling $a$ van punt A.
  *Oplossing*:
  AB = $sqrt(3^2 + 4^2) = 5m$
$v = omega r = 6 * 5 = 30 m/s$
$a_t = alpha r = 0.5 * 5 = 2.5 m/s^2$
$a_n = omega^2 r = 6^2 * 5 = 180 m/s^2$

*Tweede oplossing*:
$v = omega crossmark r_A/B = vec(-6k) crossmark vec(3i + 4j)$
$v = (18j, -24i) = 30 m/s$


]


#oefening("Voorbeeld soorten bewegingen")

#TODO("Add figure")







