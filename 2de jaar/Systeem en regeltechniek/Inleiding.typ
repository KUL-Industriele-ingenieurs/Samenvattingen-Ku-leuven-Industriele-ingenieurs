#import "../../school-template.typ": *

= Inleiding <ch:inleiding>

== Info vak

#image("uurrooster.png", width: 8cm)

Dit vak is een voortzetting van MathSYS.
Alles rond systemen moet je dus al kennen.

Dit vak gaat over systemen. Hoe kun je dingen controlleren
zoals drones, 

Je systeem krijgt dus inputs en moeten dan gewenste outputs geven.
Bij een drone moet je afhankelijk van sensoren die de versnelling, snelheid
, positie, draaing en yaw meten, de juiste inputs geven aan de motoren zodat je drone stabiel blijft en doet wat je wilt.

== Exameninfo
Je hebt twee delen
- *Geschreven deel*
- *Oral deel*: Je krijgt een taak over systemen waar je code gaat moeten schrijven en uitleggen. Je moet ook het systeem on the fly kunnen aanpassen. Je moet ook kunnen uitleggen wat je doet en waarom.

Je mag de code maken met AI of code van anderen gebruiken, maar je moet wel kunnen uitleggen wat je code doet en waarom je het zo hebt gedaan.

Je hebt *Slides, Notities Prof, Videolessen, Oefeningen* als studiemateriaal.

Je hebt geen boek.

Het einddoel. Dit is een voorbeeld van een Feedback systeem. 
Dit is het einddoel van dit vak.
#image("Feedback systeem.png")

Er is dus constante feedback van de termperatuur waardoor het systeem geregeld kan worden.

#image("Systeemanalyse.png", width: 8cm)

Je maakt systemen in de tijd met differentiële vergelijkingen. Je analyseert systemen met Laplace transformaties 

Impulseresponse $delta$-> Transferfunctie $H(S)$ -> Poles en nullen.)(Zie MathySYS.

Je ontwerpt systemen met regeltechniek. Je implementeert systemen met code.

 #figure(
  image("/assets/image.png", width: 80%),
  caption: [Beschrijving van de afbeelding],
) <fig:label>

 #figure(
  image("/assets/image-1.png", width: 80%),
  caption: [Beschrijving van de afbeelding],
) <fig:label>


De polen bepalen de stabiliteit van het systeem. Je wilt dat alle polen in het linkse deel van het complexe vlak liggen. Je wilt ook dat ze ver van de imaginaire as liggen zodat je systeem snel reageert.

De nullen bepalen de versterking van het systeem. Je wilt dat ze ver van de imaginaire as liggen zodat je systeem niet te veel versterkt.

De K is niet de DC-versterking.

== Eerste order systemen

#oefening(title: "Eerst order systemen Wagentje")[

  #figure(
  image("/assets/image-2.png", width: 80%),
  caption: [Beschrijving van de afbeelding],
) <fig:label>

$f(t) - Beta v(t) = m v'(t)$

Laplace transform met de nul beginvoorwaarden = 0:
$s V(s) - v(0) + Beta V(s) = m s V(s) - m v(0)$
$V(s) = F(s) / (m s + Beta)$
$V(s) = F(s) / (m s + Beta) = F(s) / (m s + Beta) * m/m = F(s) / m / (s + Beta/m)$
$H(s) = V(s) / F(s) = 1/m / (s + Beta/m)$

De DC-versterking is $H(0) = 1/Beta$.

#TODO("Add plot show beta effect on response 0.63 in one time constant, 0.95 in three time constants")

$1/m s + Beta =  1/m / (s + Beta/m) => P = -Beta/m$
$1/beta-K_d c / m/beta s + 1$
$e^(-Beta/m) = e^(-t/z)$

Na $m/beta$ seconden is er 0.63 van de snelheid bereikt. Na $3 m/beta$ seconden is er 0.95 van de snelheid bereikt.

]

#oefening(title: "Voorbeeldoefening")[
  #image("/assets/image-3.png")
]

== Tweede order systemen

#figure(
  image("/assets/image-4.png", width: 80%),
  caption: [Massa veersysteem],
) <fig:massa-veersysteem>


$m d^2z(t)/d t^2 + c d z(t)/d t + k z(t) = u(t)$\
=> laplace transform:\
$m s^2 Z(s) + c s Z(s) + k Z(s) = U(s)$\
$Z(s) = U(s) / (m s^2 + c s + k)$\
$H(s) = Z(s) / U(s) = 1 / (m s^2 + c s + k)$\

We nemen aan dat alles stabiel is. Alle polen liggen links.

$(K_(d c) * W^(2)_n)/ 1S^2 + 2zeta w_(n)s + W^(2)_n)$\
$D = b^2 - 4a c => 4zeta^2 w_n^2 - 4 w_n^2 = 4 w_n^2 (zeta^2 - 1)$\
p1,2 = $-zeta w_n +/- w_n sqrt(zeta^2 - 1)$

$zeta > 1 => "reële polen")$\
$zeta = 1 => "één reële pool"$\
$zeta < 1 => "twee complexe polen"$\
$zeta = 0 => "zuiver imaginaire polen (randstabiel)"$\
$zeta < 0 => "instabiel systeem"$

#TODO("Show graphs of y(t) and t to show damping with zeta")

#image("/assets/image-6.png")

Dus de forume kan omgezet worden naar
$H(s) = K / (s^2 + 2 zeta w_n s + w_n^2)$
$H(s) = (1/K (1/m k))/S^2 +c/m + k/m$

$w_n = sqrt{k/m}$\
$zeta w_n = c / m $\
$zeta = c / (2 sqrt{k m})$

#oefening(title: "Oefening tweede orde systeem")[
#image("/assets/image-7.png")
]








