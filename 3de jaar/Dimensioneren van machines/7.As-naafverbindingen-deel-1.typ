#import "../../school-template.typ": *

= As-naafverbindingen deel 1 <ch:as-naaf-1>

// Bron: Slides/7.As-naaf verbindingen deel 1.DIMA.pdf (Roloff/Matek H12)

== Functie en werking <sec:as-naaf-functie>

Een as-naafverbinding koppelt een as aan een wiel (tandwiel, riemschijf, koppeling) zodat het koppel van de ene naar de andere gaat. Er zijn drie categorieën, volgens wat het koppel overbrengt:

- *Vormgesloten*: de vorm zorgt voor de koppeling, via het asprofiel of via een toegevoegd onderdeel zoals een spie. Laat axiale beweging toe.
- *Wrijvingsgesloten* (krachtgesloten): wrijving in het contactvlak brengt het koppel over, bv. een klem- of persverbinding.
- *Materiaalgesloten*: een permanente materiaalverbinding, bv. lassen, lijmen of solderen.

Combinaties bestaan ook: een *voorgespannen vormgesloten* verbinding combineert vorm en wrijving, bv. een klemverbinding die extra geborgd is met een spie.

De globale afmetingen van de naaf haal je uit R/M tabel 12-1a. Welke verbinding je kiest, volgt uit R/M figuur 12-1 (overzicht van vorm-, wrijvings- en materiaalgesloten verbindingen, o.a. polygoonprofiel en penverbinding).

== Vormgesloten verbinding <sec:vormgesloten>

=== Vormgeving <sec:vormgesloten-vormgeving>

De *spieverbinding* (inlegspie) is de standaard. De afmetingen zijn genormeerd in DIN 6885 (R/M tabel 12-2). Je vindt ze bij riemschijven, tandwielen, ...

- *Pro*: eenvoudige montage en demontage.
- *Contra*: beperkte koppels door de kerfwerking van de spiebaan, en enkel geschikt voor eenzijdig werkende torsiekoppels. Is er een klein verschil tussen spie en spiebaan, dan geeft elke omkering van draaizin of hoekverandering een koppelpiek en een grote afschuifkracht op de spie.
- Eventueel met schuifpassing.
- Materiaal: bij voorkeur met hoge afschuifsterkte (Fe590, C45K, RVS304, RVS316Ti).

#figure(
  image("assets/L7-vormgesloten.png", width: 12cm),
  caption: [Spieverbinding volgens DIN 6885 (slide 10)],
) <fig:L7-vormgesloten>

Twee varianten:

- *Schijfspie*: voor conische assen. Positioneert de naaf precies op de as, maar draagt maar beperkte koppels.
- *Kopspie*: ligt volgens de lengte-as, met een hamervormige kop. De spie en de spiebaan in de naaf lopen hellend (1:100), zodat de verbinding zowel in lengte- als in omtreksrichting klemt. Ze is dus krachtgesloten. Makkelijk te demonteren, maar geeft een lichte excentriciteit.

De vorm van de naaf beïnvloedt de krachtverdeling over de spie (slide 12). Is het werkzame gebied korter, of beperkt ongelijkmatige vervorming de dragende lengte, dan corrigeer je met een correctiefactor. Voor de kerfwerking is een spiebaan die uitloopt (geen grote spanningsopbouw) beter dan een afgesloten spiebaan: die laatste is enkel aanvaardbaar bij statische torsie en buiging, terwijl de meeste assen torsie met wisselende buiging zien.

=== Berekening spieverbinding <sec:spie-berekening>

Een berekening is enkel nodig bij wisselende torsie en kleine afmetingen, met $l < 0.9 d$. Je controleert dan de vlaktedruk op de flank van de spie.

#frm(
  "Vlaktedruk spieverbinding",
  $ p_"gem" approx (F_(t,"eq") dot K_lambda) / (h' dot l' dot n dot phi) <= overline(p) $,
  [met: $F_(t,"eq")$ --- equivalente tangentiële kracht op de spie [N], $K_lambda$ --- lastverdelingsfactor (R/M figuur 12-4) [-], $h'$ --- dragende hoogte van de spie [mm], $l'$ --- dragende lengte [mm], $n$ --- aantal spieën [-], $phi$ --- draagfactor: niet elke spie neemt evenveel op [-], $overline(p)$ --- toelaatbare vlaktedruk [MPa]],
)

$K_lambda$ en $phi$ brengen de niet-ideale omstandigheden in rekening.

#figure(
  image("assets/L7-spie-vlaktedruk.png", width: 12cm),
  caption: [Krachten op de spie en lastverdelingsfactor $K_lambda$ (slide 14)],
) <fig:L7-spie-vlaktedruk>

Voor grote koppels gebruik je een *spieasverbinding*: meerdere gleuven rond de omtrek, met binnen- of flankcentrering.

#frm(
  "Vlaktedruk spieasverbinding",
  $ p_"gem" approx (2 K_A T_"nom") / (d_"gem" dot L dot h' dot 0.75 n) <= overline(p) $,
  [met: $K_A$ --- bedrijfsfactor [-], $T_"nom"$ --- nominaal koppel [N mm], $d_"gem"$ --- gemiddelde diameter van het profiel [mm], $L$ --- dragende lengte [mm], $h'$ --- dragende hoogte [mm], $n$ --- aantal spieën [-], $overline(p)$ --- toelaatbare vlaktedruk [MPa]],
)

De factor $0.75$ zegt dat maar zo'n 75~% van de spieën effectief draagt.

== Krachtgesloten verbinding <sec:krachtgesloten>

=== Principe en krachtwerking <sec:krachtgesloten-principe>

Is de as te dik of de boring van de naaf te nauw ($d_"boring" < d_"as"$), dan vervormen beide elastisch bij montage. Dat geeft een vlaktedruk in het contactvlak, die de wrijving verhoogt. Het koppel gaat over zolang het kleiner is dan het wrijvingskoppel.

- *Pro*: grote koppels.
- *Contra*: je moet de spanningen in as en naaf controleren.

Het verschil tussen boring en as heet de *persmaat* $Z$ (een negatieve speling): $d_"boring" = d_"as" + Z$ met $Z < 0$.

#frm(
  "Persmaatverhouding",
  $ xi = Z / d_"nom" $,
  [met: $Z$ --- persmaat (overlap) [mm], $d_"nom"$ --- nominale diameter [mm]],
)

Een persmaat van $100 thin mu"m"$ op $100 thin "mm"$ geeft $xi = 0.1 thin %$. Voor staal ($E = 210 thin "GPa"$) zit je met een rek van $1 slash 1000$ al aan $210 thin "MPa"$: een kleine persmaat geeft dus grote spanningen.

#figure(
  image("assets/L7-persmaat.png", width: 12cm),
  caption: [Persmaat en persmaatverhouding (slide 18)],
) <fig:L7-persmaat>

=== Persverbinding en krimpverbinding <sec:pers-krimp>

Er zijn twee manieren om te monteren:

- *Persverbinding*: de as wordt in de naaf geduwd, tegen de wrijving in. In theorie omkeerbaar.
- *Krimpverbinding*: de as wordt gekoeld en/of de naaf opgewarmd, zodat de as krimpt en de naaf uitzet. Je schuift ze in elkaar. Op werkingstemperatuur zet de as weer uit en krimpt de naaf: je krijgt een veel grotere persmaat dan met persen mogelijk is. In principe niet omkeerbaar.

De vraag is dan: hoe groot mag de persmaat zijn zonder dat as of naaf bezwijkt?

=== Grenzen op de vlaktedruk <sec:vlaktedruk-grenzen>

De vlaktedruk $p_F$ volgt uit de persmaat en moet tussen twee grenzen liggen:

$ p_(F,"min") < p_F < p_(F,"max") $

- De *minimale* vlaktedruk volgt uit het lastkoppel: daaronder slipt de verbinding.
- De *maximale* vlaktedruk volgt uit de rek- of drukgrens: daarboven breekt of vloeit de naaf.

Het koppel gaat over door wrijving in het contactvlak. Met de bedrijfsfactor in de kracht $F_S$ (bij een combinatie van tangentiële en axiale kracht: $F_S = sqrt(F_t^2 + F_a^2)$) volgt de minimale vlaktedruk.

#frm(
  "Minimale vlaktedruk persverbinding",
  $ p_(F,"min") = F_S / (A_F dot mu) $,
  [met: $F_S$ --- over te brengen kracht in het contactvlak, inclusief bedrijfsfactor [N], $A_F$ --- contactoppervlak [mm²], $mu$ --- wrijvingscoëfficiënt (R/M tabel 12-6a) [-]],
)

#figure(
  image("assets/L7-min-vlaktedruk.png", width: 12cm),
  caption: [Koppeloverdracht door wrijving in het contactvlak (slide 24)],
) <fig:L7-min-vlaktedruk>

Hoe hangt de vlaktedruk nu af van de persmaat? Het probleem is hyperstatisch: evenwicht alleen volstaat niet, je hebt de vervorming nodig (elasticiteitsleer). Daarvoor analyseer je de spanning in een dikwandige cilinder.

=== Spanning in een dikwandige cilinder <sec:dikwandige-cilinder>

Bekijk een cilinder met binnenstraal $r_i$ en buitenstraal $r_o$, dikte 1, elasticiteitsmodulus $E$ en Poissoncoëfficiënt $nu$, onder een inwendige druk $p$. De *vormverhouding* is $Q = r_i slash r_o$.

Door de axi-symmetrie is de tangentiële spanning $sigma_t$ op een gegeven straal overal gelijk; de radiale spanning $sigma_r$ varieert met de straal. De randvoorwaarden zijn $sigma_r (r_i) = -p$ en $sigma_r (r_o) = 0$. Gezocht: $sigma_r (r)$ en $sigma_t (r)$.

De naaf is zo'n dikwandige cilinder. De as ondergaat de reactiedruk en is zelf ook een (eventueel volle) dikwandige cilinder, onder uitwendige druk.

#figure(
  image("assets/L7-dikwandige-cilinder.png", width: 12cm),
  caption: [Krachtenevenwicht in een dikwandige cilinder (slide 29)],
) <fig:L7-dikwandige-cilinder>

*Stap 1: krachtenevenwicht.* Op een infinitesimaal segment ($d r$, $d theta$) werken radiaal $sigma_r r thin d theta$ en $(sigma_r + d sigma_r)(r + d r) thin d theta$, en tangentieel twee keer $sigma_t thin d r$. Hun radiale bijdrage is $2 sigma_t thin d r sin(d theta slash 2) approx sigma_t thin d r thin d theta$. Evenwicht geeft:

$ sigma_t = (d (sigma_r r)) / (d r) quad (1) $

Let op: de positieve richting van $sigma_r$ is naar buiten.

*Stap 2: vervorming.* Eén vergelijking voor twee onbekenden is niet genoeg. De verplaatsing $u(r)$ is axi-symmetrisch: een cirkel met straal $r$ wordt een cirkel met straal $r + u$. Dat geeft de rekken, en via de wet van Hooke de spanningen:

$ epsilon_t = (2 pi (r + u) - 2 pi r) / (2 pi r) = u / r, quad epsilon_r = (d r + d u - d r) / (d r) = (d u) / (d r) $

$ u / r = sigma_t / E - nu sigma_r / E quad (2), quad quad (d u) / (d r) = sigma_r / E - nu sigma_t / E quad (3) $

met: $epsilon_t$ --- tangentiële rek [-], $epsilon_r$ --- radiale rek [-], $u$ --- radiale verplaatsing [mm], $E$ --- elasticiteitsmodulus [MPa], $nu$ --- coëfficiënt van Poisson [-]

*Stap 3: oplossen.* Drie vergelijkingen, drie onbekenden ($sigma_r$, $sigma_t$, $u$). Uit (2) volgt $E u = sigma_t r - nu sigma_r r$; afleiden naar $r$ en (3) invullen geeft $sigma_r - nu sigma_t = (d sigma_t)/(d r) r + sigma_t - nu (d sigma_r)/(d r) r - nu sigma_r$ (4). Elimineer $sigma_t$ met (1), $sigma_t = r (d sigma_r)/(d r) + sigma_r$:

$ r (d^2 sigma_r)/(d r^2) = -3 (d sigma_r)/(d r) $

Met $sigma_r' = (d sigma_r) slash (d r)$ wordt dat $(d sigma_r')/(sigma_r') = -3 (d r)/r$, dus $sigma_r' = C r^(-3)$. Nog eens integreren en (1) toepassen:

#frm(
  "Spanning in een dikwandige cilinder",
  $ sigma_r = A - B / r^2, quad sigma_t = A + B / r^2 $,
  [met: $sigma_r$ --- radiale spanning [MPa], $sigma_t$ --- tangentiële spanning [MPa], $r$ --- straal [mm], $A, B$ --- integratieconstanten uit de randvoorwaarden [MPa], [MPa mm²]],
)

=== Inwendige druk <sec:cilinder-inwendig>

Met $sigma_r (r_i) = -p$ en $sigma_r (r_o) = 0$:

$ A = r_i^2 / (r_o^2 - r_i^2) p, quad B = (r_i^2 r_o^2) / (r_o^2 - r_i^2) p $

De tangentiële spanning is maximaal aan de binnenkant:

#frm(
  "Dikwandige cilinder, inwendige druk",
  $ sigma_t (r_i) = (1 + Q^2) / (1 - Q^2) p, quad sigma_t (r_o) = (2 Q^2) / (1 - Q^2) p $,
  [met: $Q = r_i slash r_o$ --- vormverhouding [-], $p$ --- inwendige druk [MPa]],
)

#figure(
  image("assets/L7-cilinder-grafisch.png", width: 12cm),
  caption: [Verloop van $sigma_r$ en $sigma_t$ bij inwendige druk (slide 37)],
) <fig:L7-cilinder-grafisch>

=== Uitwendige druk <sec:cilinder-uitwendig>

Voor de as (of een naaf onder uitwendige druk) gelden $sigma_r (r_i) = 0$ en $sigma_r (r_o) = -p$. Nu is de tangentiële spanning een drukspanning, opnieuw het grootst aan de binnenkant:

#frm(
  "Dikwandige cilinder, uitwendige druk",
  $ sigma_t (r_i) = -(2) / (1 - Q^2) p, quad sigma_t (r_o) = -(1 + Q^2) / (1 - Q^2) p $,
  [met: $Q = r_i slash r_o$ --- vormverhouding [-], $p$ --- uitwendige druk [MPa]],
)

=== Volle vs. holle cilinder <sec:vol-hol>

In een volle cilinder onder uitwendige druk is de spanning overal gelijk: $sigma_r = sigma_t = -p$. Boor je er een gat in, hoe klein ook, dan geeft $Q -> 0$ aan de rand van het gat $sigma_t (r_i) -> -2p$. Een klein gat verdubbelt de spanning dus bijna. Een holle as is daarom niet gewoon een volle as met wat minder materiaal.

#figure(
  image("assets/L7-vol-hol.png", width: 12cm),
  caption: [Volle en holle cilinder onder uitwendige druk (slide 42)],
) <fig:L7-vol-hol>
