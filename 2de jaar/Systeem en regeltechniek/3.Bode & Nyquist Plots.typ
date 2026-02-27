#import "../../school-template.typ": *

= Bode & Nyquist Plots

In dit vak gaan we vooral de bode plot bekijken in als laatste gaan we de Nyquist plot bekijken maar die is minder relevant
Wat plots doen is onze algebraïsche expressies

$H(s) arrow.r H(j omega)$

#examenbox[Je moet plots met de hand kunnen tekenen]

Bode en Nyquist plots tonen graphisch de frequentie respons $H(j omega)$ van een systeem.

=== Bode plot

Bij een pode plot ga je $H(s)$ en $H(j omega)$ terug samenbrengen.

// todo's add diagram showcasing that sin input to an LTC box and then seeing the frequency response h(jw) sin (wt < h(jw))

// todo showcasing bode plot log scale

#figure(
  image("bodeplot.png", width: 10cm),
  caption: [bodeplot],
  label: <fig:bodeplot>,
)

=== Nyquist plot

Een nyquist plot is een polaire plot van de frequentie respons $H(j omega)$ van een systeem.

#figure(
  image("Nyquist plot.png", width: 10cm),
  caption: [Nyquist plot],
  label: <fig:Nyquist-plot>,
)



#voorbeeld(title: "Eerste orde systeem met een pole en nul bij origin")[

  #figure(
    image("oefening1les3.png", width: 5cm),
    caption: [oefening1les3],
    label: <fig:oefening1les3>,
  )

  $markrect(H(s) = frac(1, tau s))$

  *Bode plot*
  $ arrow.r.double H(j omega) = frac(1, tau s) = j frac(1, tau omega) $

  $arrow.r.double 20 log_10(|H(j omega)|) = 20 log_10(1/(tau omega)) = markhl(-20 log_10(tau omega)) ("-20 is de helling in db per decade")$

  Een decade is een factor 10 in frequentie

  *Fase*
  $arrow.r.double angle(H(j omega)) = b g t a n(frac(1/(tau omega), 0)) = -90 deg$

  Dus onze Nyquist plot gaat een halve cirkel zijn met straal 1/tau

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


= Bode plot eerste en tweede orde systemen

= Eerste orde Pole-zero systemen


*Bode plot*

$ H(s) = frac(k, tau s + 1) $
k is de gain\
tau is de tijdconstante

Vervangen we $s$ door $j omega$ dan krijgen we:
$ arrow.b.double $
$ H(j omega) = frac(k, tau j omega + 1) $

$ |H(j omega)| = |frac(k, tau j omega + 1)| = frac(k, |tau j omega + 1|) = frac(k, sqrt(tau^2 omega^2 + 1)) $

Omzetten naar db:
$
  arrow.r.double 20 log_10(|H(j omega)|) = 20 log_10(frac(k, sqrt(tau^2 omega^2 + 1))) = markhl(20 log_10(k) - 20 log_10(sqrt(tau^2 omega^2 + 1)))
$

#grid(
  columns: 2,
  align: center,
  figure(
    image("bodeplotoefening2.png", width: 10cm),
    caption: [bodeplotoefening2],
    label: <fig:bodeplotoefening2>,
  ),

  figure(
    image("bode-phaseplotoefening2.png", width: 10cm),
    caption: [bode-phaseplotoefening2],
    label: <fig:bode-phaseplotoefening2>,
  ),
)

* Nyquist plot*

$angle(H(j omega)) = angle("Numerator angle") - angle("Denominator angle") = 0 - underline arctan(omega tau)$

$ angle(H(j omega)) = b g t a n(K_(d c)) - underline(b g t a n((omega tau)/1)) $


#voorbeeld(title: "Bode plot eerste orde systeem")[

  $ H(s) = frac(10, 2s+1) $

  $ H(j omega) = frac(10, 2j omega + 1) $

  $ |H(j omega)| = |frac(10, 2j omega + 1)| = frac(10, |2j omega + 1|) = frac(10, sqrt(4 omega^2 + 1)) $

  Omzetten naar db:
  $
    arrow.r.double 20 log_10(|H(j omega)|) = 20 log_10(frac(10, sqrt(4 omega^2 + 1))) = markhl(20 log_10(10) - 20 log_10(sqrt(4 omega^2 + 1)))
  $

  $ angle(H(j omega )) = angle("Numerator angle") - angle("Denominator angle") = 0 - underline arctan(2 omega) $

  $ angle(H(j omega)) = b g t a n(K_(d c)) - underline(b g t a n((omega tau)/1)) $
]


== Eerste orde Pole-zero systemen


$ markhl(H(s) = frac(tau s, 1 + tau s)) $

// TODO: Uitleg toevoegen

== Tweede orde All-pole systemen

#figure(
  image("massa-veerdemper systeem.png", width: 5cm),
  caption: [massa-veerdemper systeem],
  label: <fig:massa-veerdemper-systeem>,
)

Deze formule toont een massa-veerdemper systeem.

$ markhl(H(s) = frac(K_(D C) omega_n^2, s^2 + 2 zeta omega_n s + omega_n^2)) $

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

$ -10 log_10(1+4 zeta^2 u^2) approx -10 log_10(u^4) = -40 log_10(u)
$

$ u = 1 $
$ arrow.b.double $

$ -10 log_10(4 zeta^2 u^2) $
Als zeta potentieel 0 is dan is de amplitude 0 db

$ arrow.r.double 20 log_10 $































