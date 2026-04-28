#import "../../school-template.typ": *

= Bode & Nyquist Plots

In dit vak gaan we vooral de bode plot bekijken in als laatste gaan we de Nyquist plot bekijken maar die is minder relevant. Wat plots doen is onze algebraïsche expressies graphisch te tonen.

De bode en Nyquist plots tonen graphisch de frequentie respons $H(j omega)$ van een systeem van de transferfunctie $H(s)$

$ H(s) arrow.r H(j omega) $

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

  $ markrect(H(s) = frac(1, tau s)) $

  $tau$ is gewoon de tijdsconstante niet verward geraken.

  *Bode plot*\
  $ arrow.r.double H(j omega) = frac(1, tau s) = frac(1, tau j omega) $

  Uitwerken door de $j$ in de teller te zetten _complex toegevoegd_

  $ H(j omega) = frac(1, tau j omega) = underbrace(-j, "fase") dot underbrace(frac(1, tau omega), "amplitude") $

  De fase is makkelijk te berekenen. We hebben gewoon een negatieve imaginaire getal. $arrow.r.double angle(H(j omega)) = -90 deg$

  De amplitude moet je uitrekenen door je log toe te voegen _je frequentie is in log in de bode plot_ en dan is de formule:

  $A(omega) = 20 log_10(|H(j omega)|) = 20 log_10(1/(tau omega))$
  $ = markhl(-20 log_10(tau omega)) quad quad "-20 is de helling in db per decade" $


  Als $omega = 1/tau$ dan is $A(omega) = -20 log_10(1) = 0$ (log (1) = 0)

  We hebben het nulpunt maar niet de helling.

  $ 20 log_10(1/(tau omega)) = 20 log_10(1) - 20 log_10(tau omega) = markhl(-20 log_10(tau omega)) $


  *Nyquist plot*

  Herinner de polaire plots van wiskunde basistechnieken beetje gelijkaardig

  #examenbox[Geen logaritmische schaal van toepassing]

  Om de nyquist plot te tekenen nemen we 3 verschillende waarden van $omega$:

  - $omega arrow.r 0 arrow.r.double infinity$
  - $omega = 1/tau arrow.r.double 1$ (we hebben nog steeds een imagair deel geen enkele reël deel zoals je kunt zien in de amplitude plot _zie formule bode plot_)
  - $omega arrow.r infinity arrow.r.double 0$


  #align(
    center,
    grid(
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
    ),
  )
]

=== Ideal differentiator

De ideale differentiator is het omgekeerde van de integrator. In plaats van $1/(tau s)$ hebben we nu:

$ markrect(H(s) = tau s) $

*Bode plot*\
Vervang $s = j omega$:

$ H(j omega) = tau j omega = underbrace(j, "fase") dot underbrace(tau omega, "amplitude") $

De fase is constant: we hebben een positief imaginair getal $arrow.r.double angle(H(j omega)) = +90 deg$

De amplitude in dB:
$ A(omega) = 20 log_10(|H(j omega)|) = 20 log_10(tau omega) = markhl(+20 log_10(tau omega)) $

Dit is een rechte lijn met helling $+20 "dB/decade"$ (het spiegelbeeld van de integrator).

Als $omega = 1/tau$ dan is $A(omega) = 20 log_10(1) = 0 "dB"$ — dit is het nulpunt van de lijn.

*Nyquist plot*\
We vullen weer 3 waarden van $omega$ in:

- $omega arrow.r 0 arrow.r.double H(j omega) = 0$ (oorsprong)
- $omega = 1/tau arrow.r.double H(j omega) = j$ (magnitude 1, fase $+90 deg$)
- $omega arrow.r infinity arrow.r.double H(j omega) arrow.r infinity$ (langs de positieve imaginaire as)

De Nyquist plot is dus een rechte lijn langs de positieve imaginaire as, startend bij de oorsprong.


=== Eerste orde all-pole systemen

$ H(s) = frac(K, 1+ tau s) $

*Bode plot*
We willen terug de bode plot

$A(omega) = 20 log_10(|H(j omega)|) = 20 log_10(1/(tau omega)) = markhl(-20 log_10(tau omega))$

Weer 3 verschillende waarden van $omega$:

- $lim_(omega->0) A(omega) = 20 log_10(K)$


- $omega = 1/tau arrow.r.double A(1/tau) = 20 log_10(K) - 20 log_10(square(1+1)) = 20 log_10(K) - 3d B)$


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

We doen wee exact hetzelfde we vullen 3 verschillende waarden van omega in:

$ lim_(omega->0) phi(omega) = 0 deg $
$ omega = 1/tau arrow.r.double phi(1/tau) = -arctan(1) = -45 deg $

$ -arctan(1) = -45 deg $  (want $tan(45) = 1$)

$ omega -> infinity arrow.r.double phi(omega) = -90 deg $

en we komen terug een mooie figuur uit. Je ziet in het midden dat je een hoek van 45° krijgt zoals in de berekeningen.

#figure(
  image("all-pole phase bode plot.png", width: 12cm),
  caption: [all-pole phase bode plot],
  label: <fig:all-pole-phase-bode-plot>,
)

#voorbeeld(title: "Simpel voorbeeld")[
  We lossen de bode plot op van een simpel voorbeeld

  $ H(s) = frac(10, 2s+1) $

  We zien van de *Bode plot* dat we een low-pass filter krijgen.

  #figure(
    image("bodeplotsimpeloefening.png", width: 8cm),
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
  image("nyquistplot allplot eerste orde.png", width: 8cm),
  caption: [nyquistplot allplot eerste orde],
  label: <fig:nyquistplot-allplot-eerste-orde>,
)

=== Pole-zero eerste orde reële en nul

*Bode plot*

$H(s) = frac(tau s, 1+tau s)$

#figure(
  image("bodeplot pole zero.png", width: 10cm),
  caption: [bodeplot pole zero],
  label: <fig:bodeplot-pole-zero>,
)

Weer voor amplitude en fase oplossen:

$ H(j omega) = frac(j tau omega, 1 + j tau omega) $

De amplitude:
$ |H(j omega)| = frac(tau omega, sqrt(1 + (tau omega)^2)) $

- $lim_(omega arrow.r 0) |H| approx tau omega arrow.r$ helling $+20 "dB/decade"$
- $omega = 1/tau arrow.r.double |H| = 1/sqrt(2) arrow.r -3 "dB"$ (cut-off frequentie)
- $lim_(omega arrow.r infinity) |H| arrow.r 1 arrow.r 0 "dB"$

De fase:
$ phi(omega) = angle("teller") - angle("noemer") = 90 deg - arctan(tau omega) $

- $lim_(omega arrow.r 0) phi = 90 deg$
- $omega = 1/tau arrow.r.double phi = 90 deg - 45 deg = 45 deg$
- $lim_(omega arrow.r infinity) phi arrow.r 0 deg$

Dit is een *hoogdoorlaat filter* — lage frequenties worden geblokkeerd, hoge frequenties passeren.


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

$ H(j omega) = 1 + j tau omega $

De amplitude:
$ |H(j omega)| = sqrt(1 + (tau omega)^2) $
$ A(omega) = 20 log_10(sqrt(1 + (tau omega)^2)) = 10 log_10(1 + (tau omega)^2) $

- $lim_(omega arrow.r 0) A approx 0 "dB"$ (vlak)
- $omega = 1/tau arrow.r.double A = 10 log_10(2) = 3 "dB"$ (cut-off frequentie)
- $omega >> 1/tau arrow.r.double A approx 20 log_10(tau omega) arrow.r +20 "dB/decade"$

De fase:
$ phi(omega) = arctan(tau omega) $

- $lim_(omega arrow.r 0) phi = 0 deg$
- $omega = 1/tau arrow.r.double phi = arctan(1) = +45 deg$
- $lim_(omega arrow.r infinity) phi arrow.r +90 deg$

Dit is het spiegelbeeld van het all-pole systeem: de amplitude stijgt en de fase gaat naar $+90 deg$.

*Nyquist plot*

$ H(j omega) = 1 + j tau omega $

Dit is een rechte lijn in het complexe vlak:

- $omega arrow.r 0 arrow.r.double H = 1$ (op de reële as)
- $omega = 1/tau arrow.r.double H = 1 + j$ (punt $(1, 1)$)
- $omega arrow.r infinity arrow.r.double H arrow.r infinity$ met fase $arrow.r 90 deg$

De Nyquist plot is een verticale lijn startend bij $(1, 0)$ die omhoog gaat langs $"Re" = 1$.


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

Stel $K_(D C) = 1$. Omzetten naar dB:

$ A(omega) = 20 log_10(|H(j omega)|) = -10 log_10((1 - u^2)^2 + 4 zeta^2 u^2) $

We bekijken drie gevallen:

*Geval 1: $u << 1$ (lage frequenties):*
$ (1 - u^2)^2 + 4 zeta^2 u^2 approx 1 quad arrow.r.double quad A approx 0 "dB" $
De amplitude is vlak bij lage frequenties.

*Geval 2: $u >> 1$ (hoge frequenties):*
$ (1 - u^2)^2 + 4 zeta^2 u^2 approx u^4 quad arrow.r.double quad A approx -40 log_10(u) $
De helling is $-40 "dB/decade"$ (dubbel zo steil als eerste orde!).

*Geval 3: $u = 1$ (resonantiefrequentie $omega = omega_n$):*
$ (1 - 1)^2 + 4 zeta^2 dot 1 = 4 zeta^2 quad arrow.r.double quad A = -20 log_10(2 zeta) $
Als $zeta$ klein is (bv. $zeta = 0.1$) krijg je een grote piek: $A = -20 log_10(0.2) = +14 "dB"$.
Als $zeta = 1$ (kritisch gedempt): $A = -20 log_10(2) = -6 "dB"$ (geen piek).

De resonantiepiek treedt op bij $omega_r = omega_n sqrt(1 - 2 zeta^2)$ als $zeta < 1/sqrt(2) approx 0.707$:
$ M_("Piek") = frac(1, 2 zeta sqrt(1 - zeta^2)) $

#figure(
  image("tweedeorde allploe.png", width: 10cm),
  caption: [Bode amplitude plot tweede orde all-pole systeem],
  label: <fig:tweedeorde-allploe>,
)

*Fase plot:*

$ phi(omega) = -arctan(frac(2 zeta u, 1 - u^2)) $

- $u << 1 arrow.r.double phi approx 0 deg$ (geen fasedraaiing)
- $u = 1 arrow.r.double phi = -90 deg$ (altijd, ongeacht $zeta$)
- $u >> 1 arrow.r.double phi arrow.r -180 deg$

Bij een tweede orde systeem draait de fase van $0 deg$ naar $-180 deg$. De snelheid van de overgang hangt af van $zeta$: hoe kleiner $zeta$, hoe scherper de overgang rond $omega_n$.

== Hogere orde systemen
Stel dat we hogere orde systemen hebben. Kunnen we onze dingen versimplificeren?

$G(s)$ is een transferfunctie.

$G(s) = A/(B C)$
$ arrow.b.double $

+ $ 20 log_10(|G(j omega)|) = 20 log_10(A) + 20 log_10(1/B) + 20 log_10(1/C) $
+ $ angle(G(j omega)) = angle(frac(A, B C)) = angle(A) + angle(1/B) + angle(1/C) $

#voorbeeld(title: "Hogere orde systeem")[

  $ markhl(H(s) = frac(1 +5s, s(10+10s))) $

  *Stap 1 — Normaliseren naar standaardvorm:*

  $ H(s) = frac(1 + 5s, 10 s (1 + s)) = frac(1, 10) dot frac(1 + 5s, s(1 + s)) $

  *Stap 2 — Componenten identificeren:*

  + *Constante versterking:* $K = 1/10 arrow.r 20 log_10(0.1) = -20 "dB"$
  + *Integrator:* $1/s arrow.r$ helling $-20 "dB/dec"$, fase $= -90 deg$
  + *Nulpunt:* $(1 + 5s) arrow.r$ hoekfrequentie $omega_z = 1/5 = 0.2 "rad/s"$, helling $+20 "dB/dec"$ boven $omega_z$
  + *Pool:* $1/(1 + s) arrow.r$ hoekfrequentie $omega_p = 1 "rad/s"$, helling $-20 "dB/dec"$ boven $omega_p$

  *Stap 3 — Asymptotische amplitude optellen:*

  - $omega < 0.2$: alleen integrator + $K$ actief $arrow.r$ helling $-20 "dB/dec"$
  - $0.2 < omega < 1$: nulpunt compenseert integrator $arrow.r$ helling $0 "dB/dec"$ (vlak)
  - $omega > 1$: pool voegt $-20 "dB/dec"$ toe $arrow.r$ helling $-20 "dB/dec"$

  Referentiepunt: bij $omega = 0.1$ is $|H| approx 1/(10 dot 0.1) = 1 arrow.r 0 "dB"$

  *Stap 4 — Fase optellen:*

  - $omega arrow.r 0$: integrator geeft $-90 deg$ als startpunt
  - Bij $omega_z = 0.2$: nulpunt voegt $+45 deg$ toe
  - Bij $omega_p = 1$: pool trekt $-45 deg$ af
  - $omega arrow.r infinity$: nulpunt $(+90 deg)$ en pool $(-90 deg)$ heffen op $arrow.r$ fase $= -90 deg$

  #figure(
    image("bodefaseplothogereorde.png", width: 10cm),
    caption: [Bode plot hogere orde systeem],
    label: <fig:bodefaseplothogereorde>,
  )
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
