#import "../../school-template.typ": *

= Bode plots

#figure(
  image("Vorigeles les3.png", width: 15cm),
  caption: [Vorigeles les3],
  label: <fig:Vorigeles-les3>,
)

IN de vorige les hebben we #keyterm[Nyquist plots]en #keyterm[Bode plots] gezien over meerdere soorten systemen. Vandaag gaan we dieper in op de #keyterm[Bode plots].

We zagen dat je bij een tweede orde all-pool systeem dat

$ M_(P i e k) = frac(1, 2 zeta sqrt(1 - zeta^2)) $

$theta "daling resolantie bij zeta" approx 2$

#voorbeeld(title: "Voorbeeld bode plot")[

  $H(s) = frac(400, 2 s^2 + 24s + 40)$



  Eerst al onze constanten
  + $K_(D C) = 400/40 => 20 log(10) = 20 d b$
  + Onze polen moeten liefst complex en reël zijn zodat we geen onstabiel systeem krijgen.

  $ H(s) = frac(200, s^2 + 12s + 20) arrow.r "2polen" $
  $ D = 12^2 - 4 * 1 * 20 = 144 - 80 = 64 > 0 arrow.r "2 reële polen" $

  $ arrow.r.double H(s) = frac(200, (s+10)(s+2)) $

  *Methode A*\
  Bode plot van een product is $sum$ van de individuele bode plots.

  $ 20 log(10) + 20 log(2) - 20 log(10) - 20 log(2) = 20 d b $

  $ H(s) = frac(10 20, (s+10)(s+2)) $

  We splitsen het op in twee
  $ 10 frac(1, s+10) dot 20 frac(1, s+2) $

  #figure(
    image("twee-H(s).png", width: 10cm),
    caption: [twee-H(s)],
  )

  $ approx w = 10: 20 - 20 log_10(10/2) = 6 d b $
  $ w= 100: 6-40log(10frac(100, 10)) = 6-40 = -34 d b $

  $ angle "snijdt" 90deg "bij" -31-log(w_c/1)= 90deg arrow.r.double 4.5(r a d/s) $

  $ -45 log(frac(1, 0.2)) = -31 deg $


  *Methode B*\


  #figure(
    image("uitzetten over tabel.png", width: 12cm),
    caption: [uitzetten over tabel],
    label: <fig:uitzetten-over-tabel>,
  )
  // 67: The answer to everything


]

#voorbeeld(title: "Voorbeeld 2")[

  $ H(s) = frac(400, 2s^2+2s+50) arrow.r "tweede orde all-pole systeem" $

  $frac(8 5^2, s^2+2dot underbracket(0.1, zeta) dot underbracket(5, omega) s+5^2)$

  $ zeta < 0.7 arrow.r "resonantie" $

  $ w_r = omega sqrt(1-2zeta^2) = 5 sqrt(1-2(0.1)^2) = 5 sqrt(1-0.02) = 5 sqrt(0.98) approx 5 (r a d/s) $

  #figure(
    image("tabellen voorbeeld 2.png", width: 10cm),
    caption: [tabellen voorbeeld 2],
    label: <fig:tabellen-voorbeeld-2>,
  )

  $ 0.1 = log_10(omega/5) => omega = 5 * 10^0.1 = 5 * 1.2589 = 6.3(r a d/s) $

  $ 0.1 = log_10(5/omega_c) => omega_c = 5 * 10^(-0.1) = 5 * 0.7943 = 3.97 (r a d/s) $


  #figure(
    image("Bodeplot Voorbeeld 2.png", width: 5cm),
    caption: [Bodeplot Voorbeeld 2],
    label: <fig:Bodeplot-Voorbeeld-2>,
  )

  We zien dat bij $omega = 5 (r a d/s)$ dat we een resonantie piek hebben.


]

#voorbeeld(title: "Voorbeeld 3")[

  $ H(s) = frac(1+5s, s(s+10)) $

  *Polen invullen*

  - $K_(D C) = inf$
  - Polen: $s=0, s = 0.1$
  - Nulpunten: $s=-0.2$

  $ H(s) approx frac(1, j omega) = 1/omega "dus" 0.1 -> 20 d b $

  $20 - 40 log_10(0.2/0.1) = 20 - 40 * 0.1 = 20 - 4 = 8 d b$

  $ - 90deg - 45log(0.02/0.01) = -90deg - 45log(2) $
  $ = -90deg - 45 dot 0.301 = -90deg - 13.5deg approx -104deg $

  #figure(
    image("Tabel Voorbeeld 3.png", width: 12cm),
    caption: [Tabel Voorbeeld 3],
    label: <fig:Tabel-Voorbeeld-3>,
  )

  Onze grafiek moet terug naar $-90deg$ gaan dus de laatste verhoging van $45deg/("Decade")$ is een goede *Check*

  #figure(
    image("bodeplotsvoorbeeld3.png", width: 7cm),
    caption: [bodeplotsvoorbeeld3],
    label: <fig:bodeplotsvoorbeeld3>,
  )
]


#wrap-figure(
  image("tijdsvertraging.png", width: 8cm),
  caption: [tijdsvertraging],
  label: <fig:tijdsvertraging>,
)[
  Wanneer we binnenkort systemen gaan regelen gaat de tijd ook impact hebben. Je gaat een tijdsvertraging hebben.

  _ Bv, temperatuur regelen in vat maar meeting heeft vertraging door dat termometer verder vanaf de tank zit. Het heeft tijd nodig op dat de conductie van het warmtevat naar de termometer gaat. _

  $ T_(R,M) m T_R(t-t_d) $
]

In laplace is een time delay een simpele $e^(-s dot t_d)$

$ "laplace"((T_(R,M)) m T_R(t-t_d)) $
$ = $

#figure(
  image("time-delay.png", width: 8cm),
  caption: [time-delay],
  label: <fig:time-delay>,
)

alleen zijn deze niet lineair

$ "Amplitude":|e^(-s dot t_d)| = 1 $

$ "Phase": angle(e^(-s dot t_d)) = -t_d omega 180/pi deg $




