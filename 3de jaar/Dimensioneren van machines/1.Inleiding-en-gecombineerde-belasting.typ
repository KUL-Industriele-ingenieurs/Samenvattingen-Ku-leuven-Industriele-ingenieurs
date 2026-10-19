#import "../../school-template.typ": *

= Inleiding en gecombineerde belasting <ch:inleiding>

// Bron: Slides/1.Inleiding en gecombineerde belasting.DIMA.pdf
// Notes: 1. Les 1 spanningstensor uitwerking, 1.Spanningstensor uitleg.DIMA.pdf

== Info vak <sec:info-vak>

// Wat behandelt dit vak, hoe is het opgebouwd, welke voorkennis heb je nodig?
#TODO[slides 3–7: praktische afspraken]

== Exameninfo <sec:exameninfo>

// Vorm van het examen, toegelaten hulpmiddelen, formularium ja/nee.
#TODO[slides 3–7 + `Example_Exam_DIMA_NL_v1.pdf`]

== Basisbegrippen <sec:basisbegrippen>

== Wat is een machine? <sec:wat-is-een-machine>

#TODO[slides 8–13: machine, machineonderdelen]

== Recap (interne)krachten (Statica en Sterkteleer) <sec:recap-interne-krachten>

#TODO[slides 14–17: types belasting en tekenconventies]

#frm(
  "Wet van Hooke",
  $ epsilon = (L - L_0) / L_0 #h(2em) sigma = E epsilon $,
  [met: $epsilon$ --- rek [-], $L_0$ --- beginlengte [m], $L$ --- lengte na belasting [m], $E$ --- elasticiteitsmodulus [MPa], $sigma$ --- normaalspanning [MPa]],
)

=== Normaal kracht <sec:normaal-kracht>

=== Afschuifkracht <sec:afschuifkracht>

=== Torsie <sec:torsie>

=== buigmoment <sec:buigmoment>

== Algemene belasting <sec:algemene-belasting>

#figure(
  image("assets/Alle-individuele-belastingen.png", width: 12cm),
  caption: [Alle individuele belastingen],
) <fig:Alle-individuele-belastingen>

== Algemene spanningstoestand <sec:algemene-spanningstoestand>

#TODO[slides 19–21: spanningstensor, overgang van belasting naar spanning]

#figure(
  image("assets/L1-spanningstoestand.png", width: 12cm),
  caption: [Algemene spanningstoestand op een infinitesimaal kubusje (slide 19)],
) <fig:L1-spanningstoestand>

#frm(
  "Spanningstensor en spanningsvector",
  $ [sigma] = mat(sigma_x, tau_(x y), tau_(x z); tau_(y x), sigma_y, tau_(y z); tau_(z x), tau_(z y), sigma_z) #h(2em) arrow(t) = [sigma] dot arrow(n) $,
  [met: $[sigma]$ --- spanningstensor [MPa], $arrow(n)$ --- eenheidsnormaal op het snijvlak [-], $arrow(t)$ --- spanningsvector op dat vlak [MPa]. Momentenevenwicht geeft $tau_(x y) = tau_(y x)$, dus 6 onafhankelijke componenten.],
)

== Gecombineerde belasting <sec:gecombineerde-belasting>

=== Zelfde spanningstype <sec:zelfde-spanningstype>

#TODO[slides 22–29: spanningen van hetzelfde type mag je optellen]

#align(center)[Case 1: excentrische normaalkracht]

#align(center)[Case 2: twee buigmomenten / asymmetrische buiging]

=== Verschillend spanningstype <sec:verschillend-spanningstype>

#TODO[slides 30–32: buiging ($sigma$) + torsie ($tau$) mag je niet zomaar optellen]

== Spanningstransformatie <sec:spanningstransformatie>

=== Ruimtelijke spanningstoestand <sec:ruimtelijke-spanningstoestand>

#TODO[slides 33–35]

=== Vlakke spanningstoestand <sec:vlakke-spanningstoestand>

#TODO[slides 36–43: afleiding via krachtenevenwicht op een schuin snijvlak]

#frm(
  "Transformatieformules (vlakspanning)",
  $ sigma_(x') = (sigma_x + sigma_y) / 2 + (sigma_x - sigma_y) / 2 cos 2 theta + tau_(x y) sin 2 theta $ + $ tau_(x' y') = -(sigma_x - sigma_y) / 2 sin 2 theta + tau_(x y) cos 2 theta $,
  [met: $sigma_x, sigma_y$ --- normaalspanning op x-/y-vlak [MPa], $tau_(x y)$ --- schuifspanning [MPa], $theta$ --- draaihoek van het element [rad]],
)

== Hoofdspanningen <sec:hoofdspanningen>

#TODO[slides 44–45]

#figure(
  image("assets/L1-hoofdspanningen.png", width: 12cm),
  caption: [Hoofdspanningen: afgeleide van (1) gelijk aan nul (slide 44)],
) <fig:L1-hoofdspanningen>

#frm(
  "Hoofdspanningen",
  $ sigma_(I, I I) = (sigma_x + sigma_y) / 2 plus.minus sqrt(((sigma_x - sigma_y) / 2)^2 + tau_(x y)^2) #h(2em) tan 2 theta_p = tau_(x y) / ((sigma_x - sigma_y) slash 2) $,
  [met: $sigma_I, sigma_(I I)$ --- hoofdspanningen [MPa], $theta_p$ --- hoek naar de hoofdvlakken [rad]. Op de hoofdvlakken is $tau = 0$.],
)

== Maximale afschuifspanning <sec:max-afschuifspanning>

#TODO[slides 46–49: $tau_max$ en waarom een as onder torsie onder 45° breekt]

== Samenvatting <sec:samenvatting-les1>

#TODO[slide 50]
