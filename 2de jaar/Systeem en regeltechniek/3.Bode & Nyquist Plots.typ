#import "../../school-template.typ": *

= Bode & Nyquist Plots

In dit vak gaan we vooral de bode plot bekijken in als laatste gaan we de Nyquist plot bekijken maar die is minder relevant
Wat plots doen is onze algebraïsche expressies

De bode en Nyquist plots tonen graphisch de frequentie respons $H(j omega)$ van een systeem van de transferfunctie $H(s)$



$H(s) arrow.r H(j omega)$

#examenbox[Je moet plots met de hand kunnen tekenen]

Bode en Nyquist plots tonen graphisch de frequentie respons $H(j omega)$ van een systeem.

=== Bode plot

Bij een bode plot ga je $H(s)$ en $H(j omega)$ terug samenbrengen.

In een bode plot gebruiken we een log schaal $log_10$ voor de frequentie.
We doen dit omdat vele dingen zoals geluid en ons gehoor in de log schaal werken. #keyterm[Een bode plot toont in een de frequentie in een logaristmische schaal en zet die uit in de amplitude $A$ en de fasehoek $phi$]

Een belangrijk deel die terug komt zijn de log regels

$ log(a b) = log(a) + log(b) $
$ log(a/b) = log(a) - log(b) $
$ log(a^n) = n log(a) $

We gaan dus de log nemen van de amplitude van onze $H(j omega)$ en die dan uit tekenen in functie van de frequentie in een log schaal.

$ H(j omega) arrow.r.double 20 log_10(|H(j omega)|) = A(omega) [d b] $

#examenbox[Zorg dat je bode plots en phase plots kunt tekenen met de hand]



// todo's add diagram showcasing that sin input to an LTC box and then seeing the frequency response h(jw) sin (wt < h(jw))

// todo showcasing bode plot log scale

#figure(
  image("bodeplot.png", width: 10cm),
  caption: [bodeplot],
  label: <fig:bodeplot>,
)

=== Nyquist plot

Bij de nyquist plot ga je niet kijken naar amplitudes maar je gaan in het complex domein werken. Maar je gaat exact het zelfde tonen maar in het complex domein.

- De amplitude $A(omega)$ is de lengte van de vector
- De fase $phi(omega)$ is de hoek van de vector

#figure(
  image("Nyquist plot.png", width: 10cm),
  caption: [Nyquist plot],
  label: <fig:Nyquist-plot>,
)

== Eerste orde systemen

#voorbeeld(title: "Eerste orde systeem met een pole en nul bij origin")[

  #figure(
    image("oefening1les3.png", width: 5cm),
    caption: [oefening1les3],
    label: <fig:oefening1les3>,
  )

  $markrect(H(s) = frac(1, tau s))$

  $tau$ is gewoon een constant niet verward geraken.

  *Bode plot*\
  $ arrow.r.double H(j omega) = frac(1, tau s) = frac(1, tau j omega) $

  Uitwerken door de $j$ in de teller te zetten _complex toegevoegd_

  $ H(j omega) = frac(1, tau j omega) = underbrace(-j, "fase") dot underbrace(frac(1, tau omega), "amplitude") $

  De fase is makkelijk te berekenen. We hebben gewoon een negatieve imaginaire getal. $arrow.r.double angle(H(j omega)) = -90 deg$

  De amplitude moet je uitrekenen door je log toe te voegen _je frequentie is in log in de bode plot_ en dan is de formule:

  $A(omega) = 20 log_10(|H(j omega)|) = 20 log_10(1/(tau omega))$
  $ = markhl(-20 log_10(tau omega)) ("-20 is de helling in db per decade") $


  Als $omega = 1/tau$ dan is $A(omega) = -20 log_10(1) = 0$ (log (1) = 0)

  We hebben het nulpunt maar niet de helling.

  $ 20 log_10(1/(tau omega)) = 20 log_10(1) - 20 log_10(tau omega) = markhl(-20 log_10(tau omega)) $


  *Nyquist plot*

  #keyterm[Herinner de polaire plots van wiskunde basistechnieken beetje gelijkaardig]

  #examenbox[Geen logaritmische schaal van toepassing]

  Om de nyquist plot te tekenen nemen we 3 verschillende waarden van $omega$:

  - $ omega arrow.r 0 arrow.r.double = infinity $
  - $omega = 1/tau arrow.r.double = 1$ (we hebben nog steeds een imagair deel geen enkele reël deel zoals je kunt zien in de amplitude plot _zie formule bode plot_)
  - $omega arrow.r infinity arrow.r.double = 0$


  #grid(
    columns: 2,
    align: center,
    figure(
      image("oefeningbodeplot.png", width: 5cm),
      caption: [oefeningbodeplot],
      label: <fig:oefeningbodeplot>,
    ),

    figure(
      image("oefening Nyquist plot.png", width: 5cm),
      caption: [oefening Nyquist plot],
      label: <fig:oefening-Nyquist-plot>,
    ),
  )
]

=== ideal differentiator

// todo vul uitleg in zoals hiervoor integrator

=== Eerste orde All-pole systemen

$ H(s) = frac(K, 1+ tau s) $

*Bode plot*
We willen terug de bode plot

$ A(omega) = 20 log_10(|H(j omega)|) = 20 log_10(1/(tau omega)) = markhl(-20 log_10(tau omega)) $

Weer 3 verschillende waarden van $omega$:

- $ lim_(omega->0) A(omega) = 20 log_10(K) $


- $ omega = 1/tau arrow.r.double A(1/tau) = 20 log_10(K) - 20 log_10(square(1+1)) = 20 log_10(K) - 3d B) $ \
(we hebben nog steeds een imagair deel geen enkele reël deel zoals je kunt zien in de amplitude plot _zie formule bode plot_)

Als $omega$ heel groot is dan kunnen we die 1 verwaarlozen want $1 <<< omega$
Met de 1 weg krijgen we terug de ideale integrator

- $ omega >>> 1 arrow.r.double A(omega) = -20 log(K) markhl(- 20 log(tau omega)) $

Voor elke "decade" (factor 10) van $omega$ gaat de amplitude met #markhl[-20 db] afnemen.

Alles tesamen komen we dan deze figuur uit

#figure(
  image("all-pole bode plot.png", width: 15cm),
  caption: [all-pole bode plot],
  label: <fig:all-pole-bode-plot>,
)

Dit is alleen de amplitude plot. Je moet ook de fase plot tekenen.

$ phi(omega) = angle(H(j omega)) = angle("teller") - angle("noemer") = 0 - angle(1+tau j omega) = -arctan(tau omega) $

We doen wee exact hetzelfde we vullen 3 verschillend waarden van omega in:

- $ lim_(omega->0) phi(omega) = 0 $
- $ omega = 1/tau arrow.r.double phi(1/tau) = -arctan(1) = -45 deg $

$ -arctan(1) = -45 deg $  (want $tan(45) = 1$)

- $ omega arrow.r infinity arrow.r.double phi(omega) = -90 deg $

en we komen terug een mooie figuur uit. Je ziet in het midden dat je een hoek van 45° krijgt zoals in de berekeningen.

#figure(
  image("all-pole phase bode plot.png", width: 5cm),
  caption: [all-pole phase bode plot],
  label: <fig:all-pole-phase-bode-plot>,
)

#voorbeeld(title: "Simpel voorbeeld")[
  We lossen de bode plot op van een simpel voorbeeld

  $ H(s) = frac(10, 2s+1) $

  We zien van de *Bode plot* dat we een low-pass filter krijgen.

  #figure(
    image("bodeplotsimpeloefening.png", width: 5cm),
    caption: [bodeplotsimpeloefening],
    label: <fig:bodeplotsimpeloefening>,
  )
]


*Nyquist plot*

We doen weer hetzelfde

$ H(s) = frac(K, 1+tau s) $

Weer oplossen met het complex toegevoegde
$H (j omega) = frac(K, 1+tau j omega) = frac(K, 1+tau^2 omega^2) dot (1 - j tau omega)$

Opnieuw 3 verschillende waarden van omega invullen:

- $ lim_(omega->0) H(j omega) = K $
- $ omega = 1/tau arrow.r.double H(j omega) = frac(K, 1+1) dot (1-j) = frac(K, 2) dot (1-j) $
- $ omega arrow.r infinity arrow.r.double H(j omega) = 0 $

#figure(
  image("nyquistplot allplot eerste orde.png", width: 10cm),
  caption: [nyquistplot allplot eerste orde],
  label: <fig:nyquistplot-allplot-eerste-orde>,
)

=== Pole-zero eerste orde reële en nul

*Bode plot*

$ H(s) = frac(tau s, 1+tau s) $

#figure(
  image("bodeplot pole zero.png", width: 10cm),
  caption: [bodeplot pole zero],
  label: <fig:bodeplot-pole-zero>,
)

Weer voor amplitude en fase oplossen:

//todo voeg berekening toe


*Nyquist plot*

#figure(
  image("Nyquistplot pole zero.png", width: 10cm),
  caption: [Nyquistplot pole zero],
  label: <fig:Nyquistplot-pole-zero>,
)

Opnieuw 3 verschillende waarden van omega invullen:

- $ lim_(omega->0) H(j omega) = 0 $
- $ omega = 1/tau arrow.r.double H(j omega) = frac(1, 1+1) dot (1-j) = frac(1, 2) dot (1-j) $
- $ omega arrow.r infinity arrow.r.double H(j omega) = 1 $


=== All zero systeem

Wat zero betekent dat als je $s = 1/tau$ invult dan is $H(s) = 0$

$ H(s) = 1 + tau s $

*Bode plot*

#figure(
  image("bodeplotallzero.png", width: 10cm),
  caption: [bodeplotallzero],
  label: <fig:bodeplotallzero>,
)

Amplitude en fase oplossen:

//todo voeg berekening toe



*Nyquist plot*

//todo voeg berekening toe


#figure(
  image("nyquistplot allzero.png", width: 10cm),
  caption: [nyquistplot allzero],
  label: <fig:nyquistplot-allzero>,
)

== Tweede orde systemen

=== Tweede orde All-pole systemen

Een voorbeeld van een 2de orde all-pole systeem is een massa-veerdemper systeem.
#figure(
  image("massa-veerdemper systeem.png", width: 5cm),
  caption: [massa-veerdemper systeem],
  label: <fig:massa-veerdemper-systeem>,
)

Deze formule toont een massa-veerdemper systeem.

$ markhl(H(s) = frac(K_(D C) omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2)) $

*Bode plot*

Is nu complexer maar het idee blijft exact hetzelfde.



$
  H(j omega) = frac(K_(D C) omega_n^2, (j omega)^2 + 2 zeta omega_n (j omega) + omega_n^2) = frac(K_(D C) omega_n^2, -omega^2 + 2 zeta omega_n (j omega) + omega_n^2) = frac(K_(D C) omega_n^2, (omega_n^2 - omega^2) + j (2 zeta omega_n omega))
$

stel $u = frac(omega, omega_n)$

$
  markrect(H(j omega) = frac(K_(D C) omega_n^2, (omega_n^2 - omega^2) + j (2 zeta omega_n omega)) = frac(K_(D C) omega_n^2, omega_n^2 (1 - (omega/omega_n)^2) + j (2 zeta omega_n omega)) = frac(K_(D C), (1 - u^2) + j (2 zeta u)))
$

Nu de amplitude response:

$ M = |H(j omega)| = frac(K omega_n^2, sqrt((omega_n^2 - omega^2)^2 + (2 zeta omega_n omega)^2)) $

$ = frac(K, sqrt((1 - (omega/omega_n)^2)^2 + (2 zeta (omega/omega_n))^2)) $

Uitwerken en $u = frac(omega, omega_n)$ invullen:

$ = frac(K, sqrt((1 - u^2)^2 + (2 zeta u)^2)) $

Stel $K_(D C) = 1$. Omzetten naar db:

$
  20 log_10(|H(j omega)|) =
  20 log_10(1) -20 log_10( sqrt((1- u^2)^2 + 4 zeta^2 u^2))
$
$
  10 log_10((1 - u^2)^2 + 4 zeta^2 u^2)
$

$ u <<< 1 $
$ arrow.b.double $

$ -10 log_10(1+4 zeta^2 u^2) approx 0 $

$ u >>> 1 $
$ arrow.b.double $

$ -10 log_10(1+4 zeta^2 u^2) approx -10 log_10(u^4) = -40 log_10(u) $

$ u = 1 $
$ arrow.b.double $

$ -10 log_10(4 zeta^2 u^2) $
Als $zeta$ potentieel 0 is dan is de amplitude 0 db

$ arrow.r.double 20 log_10 $

#figure(
  image("tweedeorde allploe.png", width: 10cm),
  caption: [tweedeorde allploe],
  label: <fig:tweedeorde-allploe>,
)

== Hogere orde systemen
Stel dat we hogere orde systemen hebben. Kunnen we onze dingen versimplificeren?

$G(s)$ is een transferfunctie.

$G(s) = A/(B C)$
$ arrow.b.double $

+ $ 20 log_10(|G(j omega)|) = 20 log_10(A) + 20 log_10(1/B) + 20 log_10(1/C) $
+ $ angle(G(j omega)) = angle(frac(A, B C)) = angle(A) + angle(1/B) + angle(1/C) $

#voorbeeld(title: "Hogere orde systeem")[

  $markhl(H(s) = frac(1 +5s, s(10+10s)))$

  #figure(
    image("bodefaseplothogereorde.png", width: 10cm),
    caption: [bodefaseplothogereorde],
    label: <fig:bodefaseplothogereorde>,
  )

  // todo voeg berekening toe

]

== Kleine herhaling

Een *Bode* en *Nyquist* plot geven ons meer inzicht in de transferfunctie geëvalueerd in $j omega$ of $H(j omega)$

Bode plot toont de amplitude en fase van het complex deel. We werken hiervoor in een $markhl("20" log_10 "schaal")$

In de bode plot is de amplitude volledig #keyterm[Reël] en de fase is de hoek van het complex getal.

De *Nyquist* plot toont het reël en complex deel van $H(j omega)$ als functie van $omega$.
gaande van $omega = 0$ tot $omega = infinity$.


We hebben dit gedaan voor deze systemen:

- *All-pole* (Heeft alleen polen)
- *All-zero* (Heeft alleen nullen)
- *Eerste orde* (Heeft 1 pole)
- *Tweede orde* (Heeft 2 poles)
- *Hogere orde* (Heeft meerdere polen)

































