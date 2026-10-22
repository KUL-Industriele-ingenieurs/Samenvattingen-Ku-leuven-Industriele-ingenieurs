#import "../../school-template.typ": *

= Stroming in leidingen <ch:stroming>

== Herhaling Stromingen uit 2de jaar <sec:herhaling-stromingen>

=== Wet van Bernoulli <sec:wet-van-bernoulli>

#figure(
  image("assets/Wet-van-Bernoulli-.png", width: 5cm),
  caption: [Wet-van-Bernoulli-],
  label: <fig:Wet-van-Bernoulli->,
)

De wet van Bernoulli toont de status van een stroming op twee verschillende punten, heel gelijkaardig als het energieverschil berekenen op twee punten. We nemen aan dat het ideaal is dus geen wrijvingsverliezen, Reversabel, Onsamendrukbaar en een lange stroomlijn.

$
  frac(p_1, rho) + frac(v_1^2, 2) + g z_1 = frac(p_2, rho) + frac(v_2^2, 2) + g z_2
$


Al deze factoren zijn een energie, en afhankelijk van de stand van twee punten gaat die energie ergens anders zittne bijvoorbeeld hoogteval van een stroming met dezelfde diameter buis dan gaat de snelheid omhoog en de druk omlaag.

$
  g z_1 = frac(v_2^2, 2)
$


=== Stromingsregimes (Laminair en turbilent) <sec:stromingsregimes>

Je type stroming wordt opgedeeld in 3 regimes: Laminair, Transitie en Turbulent.

Bij een laminaire stromingen heb je aan de wanden een No-slip condition waarbij de stromingssnelheid $v$ = 0, bij een turbulente stroming heb je een wervelstroming en is de stromingssnelheid $v$ > 0.

Het Reynoldsgetal is een dimensieloos getal dat de stromingstype bepaalt. Het is een verhouding van de traagheidskrachten en de wrijvingskrachten.
Laminair < 2300 < transitie < 10000 < turbulent

#figure(
  image("assets/Turbulent-en-laminair-.png", width: 5cm),
  caption: [Turbulent-en-laminair-],
  label: <fig:Turbulent-en-laminair->,
)

$
  Re = frac{rho v D}{mu} = frac{v D}{nu}
$
met $mu$ de dynamische viscositeit en $nu$ de kinematische viscositeit afhankelijk van de temperatuur, $rho$ de dichtheid, $v$ de gemiddelde snelheid, $D$ de diameter van de buis.


#oefening(title: "Bepalen van je mu uit tabel")[

  #figure(
    image("assets/Oefening-replace-me.png", width: 5cm),
    caption: [Oefening-replace-me],
    label: <fig:Oefening-replace-me>,
  )

  #figure(
    image("assets/Tabel.png", width: 5cm),
    caption: [Tabel],
    label: <fig:Tabel>,
  )

]


=== Wrijvingsverliezen (major losses & minor losses) <sec:wrijvingsverliezen>

Je hebt twee soorten verliezen die we definiëren, mayor en minor losses. Major losses zijn de wrijvingsverliezen die optreden in een rechte buis, minor losses zijn de verliezen die optreden bij een verandering van de stroming zoals een bocht of een vernauwing.

#figure(
  image("assets/Vervang-me.png", width: 5cm),
  caption: [Vervang-me],
  label: <fig:Vervang-me>,
)

bernoulli is niet meer geldig en je moet een correctie toepassen met de wrijvingsfactor $f$ en de lengte van de buis $L$ en de diameter van de buis $D$.

$
  frac(p_1, rho) + frac(v_1^2, 2) + g z_1 = frac(p_2, rho) + frac(v_2^2, 2) + g z_2 + underbrace(f frac(L, D) frac(v^2, 2), "verliezen")
$



de wrijvingscoëfficiënt $f$ (wrijvingscoëfficiënt van fanning) kan je bepalen uit je Moody diagram en de Reynoldsgetal. De factor $f$ is afhankelijk van de ruwheid van de buis en de diameter van de buis. Krijg je op het examen.

$
  Delta H = 4 f frac(L, D) frac(v^2, 2)
$

met $lambda$ de wrijvingsfactor van Darcy, $lambda = 4 f$. Geen verschil in wat de paramenter toont gewoon andere wetenschappers die aan het zelfde ding werkten.

$
  Delta H = lambda frac(L, D) frac(v^2, 2)
$

#figure(
  image("assets/Moody-Diagramma.png", width: 5cm),
  caption: [Moody-Diagramma],
  label: <fig:Moody-Diagramma>,
)

Je rechtse verticale as is je relatieve ruwheid afhankelijk van de absolute en de diameter van de buis

$
  epsilon_("rel") = frac(epsilon, D)
$

Je horizontale as is je Reynoldsgetal. Je kan de wrijvingsfactor $f$ aflezen op de linkse verticale as afhankelijk van je Reynoldsgetal en je relatieve ruwheid.

De minor lossen worden bepaald door een verandering van je buis, dat kan zijn koppelingen, valves, bochten, vernauwingen, enz.

#figure(
  image("assets/Verandering-stromingsverlies-door-valve.png", width: 5cm),
  caption: [Verandering-stromingsverlies-door-valve],
  label: <fig:Verandering-stromingsverlies-door-valve>,
)

De weerstandscoëfficiënt $K$ bepaald je verliezen


#figure(
  image("assets/Weerstandscoëfficient.png", width: 5cm),
  caption: [Weerstandscoëfficient],
  label: <fig:Weerstandscoëfficient>,
)

$
  sum k * frac(v^2, 2) = Delta H_f^''
$

#figure(
  image("assets/K-waarde-afhankelijk-van-verschillende-buiselementen.png", width: 5cm),
  caption: [K-waarde-afhankelijk-van-verschillende-buiselementen],
  label: <fig:K-waarde-afhankelijk-van-verschillende-buiselementen>,
)

Voor het examen moet je alleen deze tabel snappen:

#figure(
  image("assets/K-waarde-tabellen.png", width: 5cm),
  caption: [K-waarde-tabellen],
  label: <fig:K-waarde-tabellen>,
)

=== Oefeningen stromingen <sec:oefeningen>
