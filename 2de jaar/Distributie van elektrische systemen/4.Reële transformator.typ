#import "../../school-template.typ": *

= Reële transformatoren.

== Inhoud
- Non-ideale transformatoren
- equivalent schema
- metingen

== Non-ideale transformatoren <sec:non-ideale-transformatoren>

Een ideale transformator _vorig hoofdstuk_ heeft een paar aannamens:
- *Infinite permeabiliteit van het kernmateriaal:*   er is geen magnetische weerstand, dus er is geen magnetische flux die verloren gaat in de kern.
- *Geen conductiviteit van de wikkelingen:* er is geen weerstand in de wikkelingen, dus er is geen warmteverlies.
- *Oneindig wikkelingsverhouding:* er is geen lekflux, dus alle magnetische flux die door de primaire wikkeling gaat, gaat ook door de secundaire wikkeling.
- *Coupling 100%:* er is geen lekflux, dus alle magnetische flux die door de primaire wikkeling gaat, gaat ook door de secundaire wikkeling.


In de realiteit is dit natuurlijk niet het geval en we moeten voor elk van deze effecten rekenening houden. In dit hoofdstuk gaan we stap voor stap elk van deze effecten modelleren.

== finite permeabiliteit van het kernmateriaal <sec:finite-permeabiliteit-van-het-kernmateriaal>
Gemanitiseerde stroom. In het vorig hoofdstuk hebben we *Reluctantie* geïntroduceerd als een maat voor de magnetische weerstand van de kern. 

#figure(
  image("Relucantie.png", width: 5cm),
  caption: [Relucantie],
  label: <fig:Relucantie>,
)

$ N_1 i_1 - N_2 i_2 = phi R_c $

met $R_c$ de reluctantie van de kern, $phi$ de magnetische flux en $N_1$ en $N_2$ het aantal windingen van respectievelijk de primaire en secundaire wikkeling.

$ arrow.r.double i_1 = underbrace( N_2/N_1 i_2),"ideale transformator" + underbrace((phi R_c) / N_1),"Stroom verlies" i_m $

$phi$ hebben we vorig hoofdstuk gezien en is de flux doorheen de kern. 

#figure(
  image("Fluxherhaling.png", width: 5cm),
  caption: [Fluxherhaling],
  label: <fig:Fluxherhaling>,
)

$ phi = frac(V_1, omega N_1) $

We zien dat de magnetisatiestroom $i_m$ in fase is met de flux $phi$. We kunnen $i_m$ herschrijven door $phi$ te substitueren:

$ i_m = frac(R_c phi, N_1) $

Vul $phi = frac(V_1, omega N_1)$ in:

$ i_m = frac(R_c V_1, omega N_1^2) $

$L_m = frac(N_1^2, R_c)$. Als we dit invullen ($R_c/N_1^2 = 1/L_m$), krijgen we de wet van Ohm voor een spoel:

$ i_m = frac(V_1, omega L_m) $

$L_m$ is de hoofdinductantie van de transformator en is gelijk aan $frac(N_1^2, R_c)$

We krijgen hierdoor een geüpdate model van onze transformator:
#figure(
  image("Hoofdinductantie.png", width: 10cm),
  caption: [Hoofdinductantie],
  label: <fig:Hoofdinductantie>,
)

== BH curve <sec:BH-curve>
=== BH karakteristiek <sec:BH-karakteristiek>

#wrap-figure(
  image("BH-curve.png", width: 7cm),
  caption: [BH-curve],
  label: <fig:BH-curve>,
)[
De BH curve gaat de distrotie en het verlies van hystereses modelleren. 
We gaan dit doen inplaats van de formule $B = mu dot H$
Dit is een perfect lineair model maar opnieuw het universum zet ons tegen.
Uiteindelijk gaat onze kern verzadigd raken en kunnen we niet meer zeggen dat $B$ 
evenredig is met $H$. Dit is een BH curve.

Dit komt omdat een magneet allemaal gemaakt is van kleine magnetische 
atomen die dezelfde richting hebben en zo een magnetisch veld opwikkelen. 
Maar uiteindelijk gaan alle richtingen gelijk staan en is er geen verschil als je er nog meer magnetische veld opzet. 
Dit is het verzadigingspunt van de kern.
]

ampere's wet:

$ H l_C = N i $
$ H = (N I)/ l_C $

en
$ phi = B A_c $ 
$ B = phi/A_c $

Dit veranderd onze BH-curve naar dit:

#figure(
  image("Flux-MMF.png", width: 5cm),
  caption: [Flux-MMF],
  label: <fig:Flux-MMF>,
)

=== Distortion

In een echt elektriciteitsnet is de *spanning* nagenoeg sinusvormig. Omdat de spanning de afgeleide is van de flux (wet van Faraday), wordt de flux hierdoor gedwongen om ook sinusvormig te zijn.

$ v_1(t) = \.hat(V) cos(omega t) arrow.r.double phi(t) = \.hat(Phi) sin(omega t) $

Echter, door de niet-lineaire BH-curve van het kernmateriaal is de relatie tussen flux ($phi$) en stroom ($i_m$) niet constant. Wanneer de kern in de buurt van *verzadiging* komt (het "kniepunt" van de BH-curve), daalt de permeabiliteit ($mu$) drastisch. 

*Gevolg:* om de flux sinusvormig te houden op de toppen, is er een onevenredig grote toename van de veldsterkte ($H$) en dus de magnetisatiestroom ($i_m$) nodig. Dit resulteert in een *gepiekte (niet-sinusvormige) stroom*.

#figure(
  image("BH-non lineair.png", width: 12cm),
  caption: [Distortie van de magnetisatiestroom door verzadiging van de kern. De sinusvormige flux (blauw) vereist een gepiekte stroom (rood) door de afvlakkende BH-karakteristiek.],
  label: <fig:BH-non-lineair>,
)

==== Harmonische analyse
Omdat de stroom periodiek maar niet-sinusvormig is, kunnen we deze via *Fourier-analyse* wiskundig ontleden in verschillende sinusvormige componenten:

- *Fundamentele component ($f_1$):* Dit is de sinusvormige stroom op de basisnetfrequentie. Het vertegenwoordigt het grootste deel van de magnetisatiestroom en is wat we zouden zien als de kern perfect lineair zou zijn.
- *Harmonische componenten ($f_3, f_5, ...$):* Dit zijn sinussen met een frequentie die een geheel veelvoud is van de fundamentele (bijv. 3 of 5 keer zo snel). Ze ontstaan puur door de niet-lineariteit van de kern en zijn de "correcties" die nodig zijn om de afwijking van een perfecte sinus te beschrijven.

1. *3de Harmonische:* Dit is de meest dominante component (vaak 30-40% van de totale stroom). Zoals te zien in @fig:fundamentaal-harmonisch, valt de piek van de 3de harmonische precies samen met de piek van de fundamentele component. Deze *constructieve interferentie* zorgt ervoor dat de resulterende stroomgolf "gepiekt" wordt: de top wordt scherper en de flanken worden steiler.
2. *5de Harmonische:* Ook aanwezig, maar met een kleinere amplitude. Deze helpt de vorm verder te verfijnen naar de werkelijke magnetisatiestroom.
3. *Oneven karakter:* Omdat de stroomvervorming symmetrisch is voor de positieve en negatieve helft van de cyclus, bevat de stroom enkel oneven harmonischen. Even harmonischen zouden de golfvorm asymmetrisch maken, wat hier niet het geval is.

#figure(
  image("fundamentaal+harmonisch.png", width: 12cm),
  caption: [Constructieve interferentie: De som van de fundamentele component (blauw) en de 3de harmonische (groen) vormt de typische gepiekte magnetisatiestroom (rood).],  label: <fig:fundamentaal-harmonisch>,
)

Deze harmonischen zijn ongewenst in het net omdat ze kunnen leiden tot extra opwarming van transformatoren en interferentie met elektronica. In driefasige systemen worden deze vaak opgevangen door een *delta-verbinding* ($Delta$), waarin de 3de harmonischen kunnen rondstromen zonder het net te vervuilen.

//Sessie 4 24min












