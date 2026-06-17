#import "../../school-template.typ": *

= Bode plots

In dit hoofdstuk gaan we dieper in op #keyterm[Bode plots] en bekijken we specifieke voorbeelden. We bespreken hoe je handmatig Bode plots kunt opstellen van complexe systemen door ze op te splitsen in basiscomponenten, en we kijken naar het cruciale effect van tijdsvertraging op een systeem.

== Resonantie bij tweede orde systemen

Bij een tweede orde all-pole systeem treedt er resonantie op als de dempingsfactor $zeta < 1/sqrt(2) approx 0.707$. De hoogte van deze piek wordt gegeven door:

$ M_("Piek") = frac(1, 2 zeta sqrt(1 - zeta^2)) $

Hoe kleiner $zeta$, hoe groter de piek. Bij $zeta = 0$ is de piek theoretisch oneindig. Voor kleine waarden van $zeta$ (bv. $zeta < 0.2$) geldt de benadering $M_("Piek") approx 1 / (2 zeta)$.

#voorbeeld(title: "Voorbeeld bode plot")[

  $ H(s) = frac(400, 2 s^2 + 24s + 40) $

  Eerst al onze constanten
  + $K_(D C) = 400/40 => 20 log(10) = 20 d b$
  + Onze polen moeten liefst complex en reël zijn zodat we geen onstabiel systeem krijgen.

  $ H(s) = frac(200, s^2 + 12s + 20) arrow.r "2 polen" $
  $ D = 12^2 - 4 * 1 * 20 = 144 - 80 = 64 > 0 arrow.r "2 reële polen" $

  $ arrow.r.double H(s) = frac(200, (s+10)(s+2)) $

  *Methode A*\
  Bode plot van een product is $sum$ van de individuele bode plots.

  $ 20 log(10) + 20 log(2) - 20 log(10) - 20 log(2) = 20 d b $

  $ H(s) = frac(10 space 20, (s +10)(s+2)) $

  We splitsen het op in twee
  $ 10 frac(1, s+10) dot 20 frac(1, s+2) $

  #figure(
    image("assets/twee-H(s).png", width: 10cm),
    caption: [twee-H(s)],
  )

  $ approx w = 10: 20 - 20 log_10(10/2) = 6 d b $
  $ w= 100: 6-40log(10frac(100, 10)) = 6-40 = -34 d b $

  $ angle "snijdt" 90deg "bij" -31-log(w_c/1)= 90deg arrow.r.double 4.5(r a d/s) $

  $ -45 log(frac(1, 0.2)) = -31 deg $


  *Methode B*\

  #figure(
    image("assets/uitzetten over tabel.png", width: 12cm),
    caption: [uitzetten over tabel],
    label: <fig:uitzetten-over-tabel>,
  )
  // 67: The answer to everything
]

#voorbeeld(title: "Voorbeeld 2")[

  $ H(s) = frac(400, 2s^2+2s+50) arrow.r "tweede orde all-pole systeem" $

  $ frac(8 5^2, s^2+2dot underbrace(0.1, zeta) dot underbrace(5, omega) s+5^2) $

  $ zeta < 0.7 arrow.r "resonantie" $

  $ w_r = omega sqrt(1-2zeta^2) = 5 sqrt(1-2(0.1)^2) = 5 sqrt(1-0.02) = 5 sqrt(0.98) approx 5 (r a d/s) $

  #figure(
    image("assets/tabellen voorbeeld 2.png", width: 10cm),
    caption: [tabellen voorbeeld 2],
    label: <fig:tabellen-voorbeeld-2>,
  )

  $ 0.1 = log_10(omega/5) => omega = 5 * 10^0.1 = 5 * 1.2589 = 6.3(r a d)/s $

  $ 0.1 = log_10(5/omega_c) => omega_c = 5 * 10^(-0.1) = 5 * 0.7943 = 3.97 (r a d)/s $


  We zien dat bij $omega = 5 (r a d)/s$ dat we een resonantie piek hebben.
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
    image("assets/Tabel Voorbeeld 3.png", width: 12cm),
    caption: [Tabel Voorbeeld 3],
    label: <fig:Tabel-Voorbeeld-3>,
  )

  Onze grafiek moet terug naar $-90deg$ gaan dus de laatste verhoging van $45deg/("Decade")$ is een goede *Check*

  #figure(
    image("assets/bodeplotsvoorbeeld3.png", width: 7cm),
    caption: [bodeplotsvoorbeeld3],
    label: <fig:bodeplotsvoorbeeld3>,
  )
]


== Tijdsvertraging (Time Delay)

#wrap-figure(
  image("assets/tijdsvertraging.png", width: 8cm),
  caption: [Tijdsvertraging (Dead time)],
  label: <fig:tijdsvertraging>,
)[
  In de realiteit hebben fysieke systemen vaak een tijdsvertraging (ook wel "dead time" genoemd). Dit betekent dat het systeem pas na een tijdje $t_d$ reageert op een verandering aan de ingang.

  _Bijvoorbeeld: Bij het regelen van de temperatuur in een vat met vloeistof, meet de thermometer de temperatuur pas als de vloeistof tot bij de sensor is gestroomd. Het kost tijd voor de warmte zich verplaatst._

  Als een signaal $y(t)$ een vertraging heeft van $t_d$, schrijven we dit als $y(t - t_d)$.
]

Volgens de Laplace-eigenschappen komt een tijdsvertraging in het tijdsdomein overeen met een vermenigvuldiging met $e^(-s t_d)$ in het Laplacedomein:

$ cal(L){y(t - t_d)} = e^(-s t_d) Y(s) $

#figure(
  image("assets/time-delay.png", width: 8cm),
  caption: [Bode plot van een tijdsvertraging: constante amplitude, lineair dalende fase],
  label: <fig:time-delay>,
)

*Invloed op de frequentierespons*

We evalueren dit voor $s = j omega$:
$ H(j omega) = e^(-j omega t_d) $

Deze exponentiële functie heeft specifieke eigenschappen in de Bode plot:
- *Amplitude:* $|e^(-j omega t_d)| = 1 = 0 "dB"$
- *Fase:* $angle(e^(-j omega t_d)) = -omega t_d " (in radialen)" = -omega t_d dot (180 deg)/pi$

*Conclusie voor stabiliteit:*
Een tijdsvertraging heeft *geen enkele invloed op de amplitude*, maar zorgt wel voor een *lineair dalende fase* naarmate de frequentie toeneemt. Dit is zeer gevaarlijk voor de stabiliteit van een regelsysteem, omdat de fase daardoor onverbiddelijk richting $-180 deg$ duikt, wat de fasemarge aanzienlijk verkleint. Daarom is het moeilijker om systemen met grote "dead time" snel te regelen.




