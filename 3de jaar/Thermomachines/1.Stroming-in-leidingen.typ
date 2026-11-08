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

== Pompen <sec:pompen>

=== Cavitatie en NPSH <sec:cavitatie>

*Cavitatie* betekent dat het water in de pomp gaat koken omdat de druk daar te laag wordt, niet omdat het water warm is.

Elke vloeistof kookt zodra de druk onder haar *dampspanning* $p_d$ zakt. Die dampspanning hangt alleen af van de temperatuur. Water van 20 °C heeft een dampspanning van 2,36 kPa (0,0236 bar), bij 80 °C is dat al 0,475 bar en bij 100 °C 1,013 bar. Daarom kookt water op 100 °C bij atmosferische druk. Benzine en propaan hebben bij dezelfde temperatuur een veel hogere dampspanning en vormen dus veel sneller dampbellen.

#figure(
  image("assets/Dampspanning-water.png", width: 8cm),
  caption: [Dampspanning van water in functie van de temperatuur],
  label: <fig:dampspanning-water>,
)

De dampspanning van water lees je af in de tabel van verzadigd water: kolom *Pressure, $P$ (bars)*. Dat is de druk waarbij water op die temperatuur kookt. De temperatuur staat in kelvin, dus tel 273,15 op bij de temperatuur in °C. Valt je temperatuur tussen twee rijen, dan interpoleer je lineair.

#figure(
  image("assets/Tabel-verzadigd-water.png", width: 100%),
  caption: [Eigenschappen van verzadigd water; de dampspanning staat in de kolom Pressure],
  label: <fig:tabel-verzadigd-water>,
)

#voorbeeld[
  Dampspanning van water bij 20 °C $= 293","15$ K, tussen de rijen 290 K en 295 K:
  $
    p_d = 0","01917 + (293","15 - 290) / (295 - 290) dot (0","02617 - 0","01917) = 0","01917 + 0","63 dot 0","00700 = 0","0236 "bar" = 2","36 "kPa"
  $
]

Een pomp trekt het water omhoog met een onderdruk aan de zuigkant. De druk is het laagst net na de zuigklep of aan de ingang van de rotor (het oog van de waaier). Die druk zakt door drie dingen: de zuighoogte (elke meter stijging kost $rho g$ aan druk), de snelheid van het water ($1/2 rho v^2$) en de verliezen door wrijving, bochten en de klep. Zakt de druk daar onder $p_d$, dan ontstaan dampbellen. Verderop in de rotor stijgt de druk weer en klappen de bellen in. De drukpieken die daarbij ontstaan, slaan stukjes uit de schoepen. Je hoort het als grind dat door de pomp gaat, en het debiet en het rendement dalen.

#figure(
  image("assets/Druk-door-pomp-cavitatie.png", width: 9cm),
  caption: [Druk doorheen de pomp: boven blijft de laagste druk boven de dampspanning, onder niet en ontstaan dampbellen (bron: engineeringtoolbox.com)],
  label: <fig:druk-door-pomp>,
)

#figure(
  image("assets/Cavitatieschade-waaier.jpg", width: 6cm),
  caption: [Cavitatieschade aan een pomp],
  label: <fig:cavitatieschade>,
)

Je hebt geen cavitatie zolang de laagste druk in de pomp boven de dampspanning blijft:

$
  p_z > p_"damp"
$

==== Maximale zuighoogte <sec:max-zuighoogte>

De atmosfeer duwt het water de zuigleiding in. Met een perfect vacuüm en zonder verliezen haalt een pomp dus hoogstens een waterkolom van ongeveer 10 m, net zoals de atmosfeer 76 cm kwik omhoog duwt:

#figure(
  grid(columns: 2, gutter: 1em, image("assets/Waterkolom-10m.png", height: 5cm), image("assets/Zuiger-zuighoogte.png", height: 5cm)),
  caption: [Links: de atmosfeer houdt 76 cm kwik of 10 m water omhoog. Rechts: een zuiger trekt het water mee zolang $p_z > p_"damp"$],
  label: <fig:max-zuighoogte>,
)

#frm(
  "Maximale zuighoogte",
  $ H_"max" = p_a / (rho g) = (101 space 325) / (1000 dot 9","81) approx 10","3 "m" $,
  [met: $p_a$ --- atmosferische druk [Pa], $rho$ --- dichtheid [kg/m³], $g$ --- valversnelling [m/s²]],
)

De atmosferische druk daalt met de hoogte. Op 2000 m is $p_a$ nog ongeveer 0,8 bar, daar zakt de maximale zuighoogte naar ongeveer 8 m. In de praktijk gaan de dampspanning, de snelheidsterm en de verliezen er nog af. Een manometer in stromend water wijst $1/2 rho c^2$ minder aan dan in stilstaand water, en een klep of een scherpe instroomrand kost extra druk door wervels.

#figure(
  grid(columns: 2, gutter: 1em, image("assets/Drukverlies-snelheid.png", height: 4.5cm), image("assets/Drukverlies-klep-instroom.png", height: 4.5cm)),
  caption: [Drukverlies aan de zuigkant door de snelheid (links) en door een klep en de instroomrand (rechts)],
  label: <fig:praktische-zuighoogte>,
)

 Een *praktisch bereikbare zuighoogte* ligt daardoor eerder rond 6 à 7 m bij koud water, en lager bij warm water.

#figure(
  image("assets/Atmosferische-druk-hoogte.png", width: 8cm),
  caption: [Atmosferische druk in functie van de hoogte boven de zeespiegel],
  label: <fig:atmosferische-druk>,
)

==== NPSH <sec:npsh>

De *NPSH* (Net Positive Suction Head) is de marge in meter tussen de totale druk aan de zuigkant en de dampspanning. Hoe groter de NPSH, hoe verder je van koken zit.

#frm(
  "Net Positive Suction Head",
  $ "NPSH" = (p_"zuig" + 1/2 rho v^2 - p_"damp") / (rho g) $,
  [met: $p_"zuig"$ --- druk aan de zuigkant [Pa], $v$ --- snelheid aan de zuigkant [m/s], $p_"damp"$ --- dampspanning bij de vloeistoftemperatuur [Pa], NPSH [m]],
)

In de praktijk vergelijk je de NPSH van de installatie met de NPSH die de fabrikant voor de pomp opgeeft: die van de installatie moet groter zijn (staat niet in de slides, wel op elke pompfiche).

Je vergroot de NPSH door de pomp lager te plaatsen (eventueel onder het waterniveau), een dikkere zuigleiding te nemen zodat $v$ daalt, weinig bochten en kleppen aan de zuigkant te zetten en de vloeistof koel te houden.

=== Oefening pompverliezen <sec:oef-pompverliezen>

#oefening(title: "Pompverliezen (slide 18)")[
  #wrap-figure(image("assets/Oefening-pompverliezen.png", width: 4.5cm), caption: [Opstelling], label: <fig:oef-pompverliezen>)[
    *Gegeven:* $p_1 = 2","3$ bar, $p_4 = 1","9$ bar, $v_2 = 1","10$ m/s, $v_3 = 1","80$ m/s, $Delta H_(1 -> 2) = 0","01$ bar, $Delta H_(3 -> 4) = 0","03$ bar, $Q = 0","2 "m"^3"/s"$, $eta_"vol" = 0","95$, $eta_"hydr" = 0","86$, $eta_"mech" = 0","94$. Hoogtes: $z_1 = 0$, $z_2 = 2","0$ m, $z_3 = 2","5$ m, $z_4 = 10","0$ m.

    *Gevraagd:* $dot(W)_p$, $dot(W)_"th"$, $dot(W)_"eff"$ en de temperatuurstijging van het water.

    *Punten:* punt 1 is het wateroppervlak van de onderste tank ($v_1 approx 0$). Punten 2 en 3 zijn de ingang en de uitgang van de pomp. Punt 4 is waar de leiding in de bovenste tank uitkomt. Het water stroomt daar nog met $v_3$, en die kinetische energie gaat verloren in de tank, dus $v_4 = v_3$.
  ]

  *Idee:* de pomp zit tussen 2 en 3. Bernoulli van 1 naar 2 geeft $p_2$, Bernoulli van 3 naar 4 geeft $p_3$. Daaruit volgt de manometrische opvoerdruk over de pomp.

  *1. Druk aan de pompingang* (Bernoulli 1 → 2 met leidingverlies):
  $
    p_2 &= p_1 - rho g (z_2 - z_1) - 1/2 rho v_2^2 - Delta H_(1 -> 2) \
    &= 230 space 000 - 19 space 620 - 605 - 1000 = 208 space 775 "Pa"
  $

  *2. Druk aan de pompuitgang* (Bernoulli 3 → 4; met $v_4 = v_3$ vallen de snelheidstermen weg):
  $
    p_3 &= p_4 + rho g (z_4 - z_3) + Delta H_(3 -> 4) \
    &= 190 space 000 + 73 space 575 + 3000 = 266 space 575 "Pa"
  $

  *3. Manometrische opvoerdruk over de pomp:*
  $
    p_"man" &= (p_3 - p_2) + rho g (z_3 - z_2) + 1/2 rho (v_3^2 - v_2^2) \
    &= 57 space 800 + 4905 + 1015 = 63 space 720 "Pa"
  $

  *4. Nuttig vermogen:* $dot(W)_p = Q dot p_"man" = 0","2 dot 63 space 720 = 12","7 "kW"$

  *5. Theoretisch vermogen* (de inwendige verliezen komen erbij):
  $
    dot(W)_"th" = dot(W)_p / (eta_"hyd" eta_"vol") = (12 space 744) / (0","86 dot 0","95) = 15","6 "kW"
  $

  *6. Effectief vermogen aan de as* (de mechanische verliezen komen erbij):
  $
    dot(W)_"eff" = dot(W)_"th" / eta_"mech" = (15 space 598) / (0","94) = 16","6 "kW"
  $

  *7. Temperatuurstijging:* de inwendige verliezen blijven als warmte in het water. De mechanische verliezen zitten in de lagers en de asafdichting en tellen dus niet mee.
  $
    Delta T = (dot(W)_"th" - dot(W)_p) / (rho Q c) = 2854 / (200 dot 4186) = 0","0034 "K"
  $

  *Check:* de sleutel op de slide geeft 12,8 / 15,7 / 16,7 kW en 0,0035 K. Deze uitwerking zit 0,5 % lager. Neem je $v_4 = 0$, dan kom je op 12,4 kW uit. De sleutel rekent dus ook met $v_4 = v_3$.
]
