#import "../../school-template.typ": *

= 3D-methode <ch:3d-methode>


Bij industriële sturingen moeten pneumatische cilinders vaak in een vaste opeenvolging bewegen. Een cilinder uitsturen is makkelijk; het probleem is de *volgorde*: hoe zorg je ervoor dat cilinder B pas vertrekt wanneer A klaar is, en dat de sturing niet vastloopt wanneer twee verschillende stappen dezelfde sensoren zien? De 3D-methode is de grafische manier om daar de minimale schakelvoorwaarden uit te halen.

== Bewegingsreeksen noteren

Een sequentie noteren we met de letter van de cilinder en een plus of min:

- $A^+$: cilinder A stuurt uit, de zuigerstang beweegt naar buiten.
- $A^-$: cilinder A trekt in, de zuigerstang beweegt naar binnen.

De detectie schrijven we met kleine letters en een index: $a_0$ is de sensor die *ingetrokken* detecteert, $a_1$ de sensor die *uitgestuurd* detecteert. Een cyclus is dan bijvoorbeeld $A^+ B^+ B^- A^-$, de zogenaamde *L-cyclus*.

== Het probleem: signaaloverlapping

Bouw je een circuit puur op de eindeloopsensoren $a_0, a_1, b_0, b_1$, dan kan er *signaaloverlapping* optreden: twee verschillende fasen van de cyclus zien exact dezelfde sensorwaarden, maar moeten een andere actie starten.

Neem $A^+ B^+ B^- A^-$. Zowel vóór stap 2 ($B^+$) als vóór stap 4 ($A^-$) geldt $a_1 = 1$ en $b_0 = 1$. De sturing krijgt dus twee keer precies dezelfde input, maar moet de eerste keer $B^+$ bekrachtigen en de tweede keer $A^-$. Zonder extra maatregel worden beide spoelen tegelijk bekrachtigd en loopt de sturing vast.

== Het assenstelsel van de 3D-methode

Voor je begint te tekenen, moet je weten wat de kubus voorstelt. Elke cilinder is één *as*, en die as krijgt een vaste kleur: A rood, B blauw, C groen.

#figure(
  image("assets/OIS_3D_methode_assenstelsel.png", width: 13cm),
  caption: [Het assenstelsel: elke cilinder is een as, elk hoekpunt is de stand van alle cilinders samen],
  label: <fig:3d-assenstelsel>,
)

- De *0-kant* van een as is sensor $x_0$, dus de cilinder *ingetrokken*.
- De *1-kant* is sensor $x_1$, dus de cilinder *uitgestuurd*.
- Een *hoekpunt* is de toestand van alle cilinders samen, bv. $(a_1, b_0, c_1)$ = A uit, B in, C uit.

De cyclus is dan een wandeling langs de ribben, van hoekpunt naar hoekpunt. Elke rib is precies één beweging van één cilinder, want per stap verandert er maar één coördinaat.

== De wiskunde erachter: het is gewoon een stelsel

De kubus ziet er grafisch uit, maar je lost gewoon een *stelsel* op. Zet dat eerst helder, dan zie je meteen wanneer een cyclus oplosbaar is en wanneer niet.

*De variabelen.* Elke cilinder levert één bit: in of uit. Met $n$ cilinders heb je dus $n$ variabelen, en $2^n$ mogelijke combinaties. Dat zijn precies de hoekpunten van de kubus.

*De onbekenden.* Voor elke spoel zoek je één booleaanse functie van die $n$ variabelen, bijvoorbeeld $A^+ = f(a, b, c)$. Bij monostabiele ventielen zijn dat $n$ onbekende functies (enkel de "+"-spoelen), bij bistabiele $2n$.

*De vergelijkingen.* Een volledige cyclus telt $2n$ stappen: elke cilinder gaat één keer uit en één keer in. Op elke stap leg je vast welke spoel aan moet staan en welke niet. Dat zijn dus $2n$ voorwaarden, en elke voorwaarde hoort bij één specifiek hoekpunt.

Daar zit de oplosbaarheidsvoorwaarde in. Elke voorwaarde legt de functie vast op één punt van haar domein. Komt hetzelfde hoekpunt twee keer voor in de cyclus met een *andere* gevraagde actie, dan staan er twee tegenstrijdige vergelijkingen met hetzelfde linkerlid. Het stelsel is dan strijdig en er bestaat geen oplossing. Precies dat is de signaaloverlapping uit de vorige paragraaf.

Je hebt dus evenveel onderscheidbare toestanden nodig als je stappen hebt:

$ 2n <= 2^n $

met:
- $n$: aantal cilinders, en dus ook het aantal sensorbits en het aantal assen van de kubus $[-]$
- $2n$: aantal stappen in één volledige cyclus $[-]$
- $2^n$: aantal hoekpunten van de kubus, dus het aantal toestanden dat je uit elkaar kan houden $[-]$

Dat is een noodzakelijke voorwaarde, geen voldoende voorwaarde: de stappen moeten ook nog *allemaal op een verschillend hoekpunt* vallen. Maar de telling alleen al verklaart wat je in de oefeningen ziet:

#table(
  columns: (auto, auto, auto, 1fr),
  inset: 8pt,
  align: horizon,
  stroke: none,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Cilinders $n$*], [*Stappen $2n$*], [*Hoekpunten $2^n$*], [*Gevolg*],
  [1], [2], [2], [exact op de grens, de cilinder oscilleert],
  [2], [4], [4], [exact op de grens: enkel de vierkante cyclus $A^+ B^+ A^- B^-$ past, want je moet álle vier de hoekpunten gebruiken. $A^+ B^+ B^- A^-$ loopt over dezelfde rib terug en botst dus],
  [3], [6], [8], [twee hoekpunten over, dus speling: meerdere volgordes zijn combinatorisch],
  [4], [8], [16], [ruim voldoende speling],
)

*Wat een geheugen doet.* Een geheugen $K_1$ is een extra variabele, dus een extra as. Het domein verdubbelt van $2^n$ naar $2^(n+1)$ hoekpunten. Je betaalt daarvoor: $K_1$ is zelf een nieuwe onbekende, en je moet er dus ook een nieuwe vergelijking bij schrijven (zijn set- en resetvoorwaarde). Bovendien worden het zetten en resetten van $K_1$ twee extra stappen in het pad. De telling wordt:

$ 2n + 2 <= 2^(n+1) $

met:
- $2n + 2$: de $2n$ cilinderstappen plus de set- en de resetstap van $K_1$ $[-]$
- $2^(n+1)$: het aantal hoekpunten nadat $K_1$ er als extra as bij komt $[-]$

Voor de L-cyclus $A^+ B^+ B^- A^-$ met $n = 2$ geeft dat $6 <= 8$, en dat klopt: in @fig:3d-k1-waarom zie je rechts een pad van zes ribben over zes verschillende hoekpunten van de kubus.

#concept(title: "Key insight")[
  Onbekenden en vergelijkingen moeten in evenwicht blijven. Zolang elke stap op een eigen hoekpunt valt, ligt elke spoelfunctie eenduidig vast en is het stelsel oplosbaar. Zodra twee stappen op hetzelfde hoekpunt vallen, is het stelsel strijdig en heb je een extra onbekende nodig, die zijn eigen vergelijking meebrengt. Een geheugen kost je dus één vergelijking, maar verdubbelt je aantal toestanden.
]

== Stappenplan

+ *Benoem de ribben* met $A$, $B$ en $C$ en teken de cyclus als een aaneengesloten traject langs de ribben. Kruist het pad zichzelf, dus wordt een hoekpunt twee keer bezocht voor een *verschillende* actie, dan is het probleem niet-combinatorisch en heb je een extra geheugenvariabele $K_1$ nodig.
+ *Teken de actieve spoeltrajecten.* Markeer op het diagram in welk deel van het traject elke spoel bekrachtigd moet zijn. Zorg dat tegengestelde spoelen zoals $A^+$ en $A^-$ elkaar nooit overlappen, anders blokkeer je het ventiel.
+ *Bouw de rungs op* met N.O.- en N.C.-contacten. Vertaal het actieve traject naar stuurnetwerken met de fysieke eindeloopschakelaars, en gebruik een parallelle tak om de spoel bekrachtigd te houden terwijl de cilinder onderweg is en de startvoorwaarde alweer afvalt.

#examenbox[
  Schrijf op het examen elke stap uit en zeg er expliciet bij dat je die stap voltooid hebt.
]

== Wanneer heb je een geheugen $K_1$ nodig?

Niet elke cyclus is combinatorisch. Bekijk opnieuw $A^+ B^+ B^- A^-$. In *2D botst* het pad: de sensorstand $a_1 b_0$ komt twee keer voor, na $A^+$ (je wil $B^+$) en na $B^-$ (je wil $A^-$). Zelfde input, andere actie, dus de sturing weet niet wat te doen.

De oplossing is een geheugen $K_1$, en dat is letterlijk een *extra as*. Hij tilt de twee botsende punten uit elkaar: het ene wordt $(a_1 b_0, K_1 = 0)$, het andere $(a_1 b_0, K_1 = 1)$. Daarom heet het de 3D-methode: het geheugen is de derde dimensie.

#figure(
  image("assets/OIS_3D_methode_K1_waarom.png", width: 13cm),
  caption: [Links botst het pad in 2D op $a_1 b_0$; rechts tilt $K_1$ de twee punten uit elkaar],
  label: <fig:3d-k1-waarom>,
)

#figure(
  scale(50%, reflow: true, merman.mermaid(```
  flowchart TD
    S["Deel de cyclus op in groepen"] --> Q{"Herhaalt een letter binnen een groep?"}
    Q -->|Nee| C["Combinatorisch, geen geheugen nodig"]
    Q -->|Ja| K["Knip: nieuwe groep, +1 geheugen K1 per knip"]
    K --> M["K1 = set op einde groep I, reset op einde groep II"]
    M --> A["Actie = groeplijn x vorige sensor"]
  ```)),
  caption: [Beslissingsschema: geheugen nodig of niet?],
  label: <fig:3d-beslissing>,
)

=== Groepen bepalen (cascademethode)

Om signaaloverlapping te vermijden zonder extra elektronica splits je de cyclus in *groepen*. De regel is eenvoudig: een cilinder mag binnen één groep *nooit twee keer voorkomen*. Zodra een letter zich herhaalt, trek je een grens en start je een nieuwe groep.

Toegepast op $A^+ B^+ B^- A^-$:

- Groep I: $A^+ B^+$
- Groep II: $B^- A^-$

Dat is één knip, dus één geheugen $K_1$ (een hulprelais of een 5/2-dubbelimpulsventiel) om te schakelen tussen de voedingslijnen van groep I en groep II.

Het geheugen zet je op het einde van groep I en reset je op het einde van groep II:

$ K_1 = b_1 + K_1 dot overline(a_0) $

met:
- $b_1$: set, B volledig uit is het einde van groep I, dus schakel naar lijn II $[-]$
- $K_1 dot overline(a_0)$: zelfhouding tot A weer in is, want $a_0$ is het einde van groep II $[-]$

De acties zijn dan telkens de groeplijn maal de vorige sensor:

$ A^+ = overline(K_1) quad B^+ = overline(K_1) dot a_1 quad B^- = K_1 quad A^- = K_1 dot b_0 $

met:
- $overline(K_1)$: groeplijn I is actief, het geheugen is nog niet gezet $[-]$
- $K_1$: groeplijn II is actief, het geheugen is gezet $[-]$
- $a_1, b_0$: overnamevoorwaarden binnen de groep $[-]$

#concept(title: "Key insight")[
  Zodra een letter zich *herhaalt* binnen een groep knip je in groepen, en per knip komt er één geheugen bij. Dat geheugen onthoudt "in welke ronde zit ik", precies de informatie die het 2D-pad niet had. Visueel voegt het een dimensie toe waardoor het gekruiste pad terug een nette, niet-botsende wandeling wordt.
]

== Uitgewerkt voorbeeld: de ABCABC-cyclus

We nemen $A^+ B^+ C^+ A^- B^- C^-$ met *monostabiele* ventielen.

#figure(
  image("assets/OIS_3D_methode_ABCABC.png", width: 15cm),
  caption: [De ABCABC-cyclus: kubuspad, de vlakken per sensor, en de resulterende rungs],
  label: <fig:3d-abcabc>,
)

Elke spoel volgt hetzelfde patroon: een *trigger* die hem aanzet, een *zelfhouding* op zijn eigen uit-sensor, en een *afschakelvoorwaarde* die hem lost.

$ A^+ = c_0 + a_1 dot overline(c_1) $

met:
- $c_0$: startvoorwaarde, N.O.-contact van de sensor C-in $[-]$
- $a_1$: overnamevoorwaarde, N.O.-contact van de sensor A-uit $[-]$
- $overline(c_1)$: afschakelvoorwaarde, N.C.-contact van de sensor C-uit $[-]$

$ B^+ = a_1 + b_1 dot overline(a_0) $

met:
- $a_1$: trigger, N.O.-contact van de sensor A-uit $[-]$
- $b_1$: overnamevoorwaarde, N.O.-contact van de sensor B-uit $[-]$
- $overline(a_0)$: afschakelvoorwaarde, N.C.-contact van de sensor A-in $[-]$

$ C^+ = b_1 + c_1 dot overline(b_0) $

met:
- $b_1$: trigger, N.O.-contact van de sensor B-uit $[-]$
- $c_1$: overnamevoorwaarde, N.O.-contact van de sensor C-uit $[-]$
- $overline(b_0)$: afschakelvoorwaarde, N.C.-contact van de sensor B-in $[-]$

== Oefening: pick en place $A^+ C^+ B^+ A^- C^- B^-$

Drie cilinders met *monostabiele* ventielen (veer terug). Gevraagd: teken het kubuspad, controleer op overlap, en schrijf de drie spoelvergelijkingen.

*Aanpak (denkproces)*

+ *Schrijf de sensorstanden uit* na elke stap. Herhaalt geen enkele combinatie, dan is het probleem *combinatorisch* en heb je geen geheugen $K_1$ nodig.
+ Bij *monostabiel* los je enkel de "+"-spoelen op. De "−"-beweging gebeurt vanzelf zodra je de spoel lost, want de veer duwt terug.
+ Elke spoel volgt hetzelfde patroon:
  $ X^+ = "trigger" + x_1 dot overline("stop") $
  met:
  - trigger: de sensor die de vorige stap afrondt, zet de spoel aan $[-]$
  - $x_1$: eigen uit-sensor, zorgt voor zelfhouding zodra de cilinder uit is $[-]$
  - $overline("stop")$: N.C. van de sensor die de $X^-$-stap aftrapt, laat de spoel los $[-]$

*Oplossing*

Geen enkele sensorcombinatie herhaalt, dus dit is combinatorisch en er is geen geheugen nodig.

$ A^+ = b_0 + a_1 dot overline(b_1) $

met:
- $b_0$: startvoorwaarde, B is in (N.O. van sensor B-in) $[-]$
- $a_1$: zelfhouding, A is uit (N.O. van sensor A-uit) $[-]$
- $overline(b_1)$: afschakelvoorwaarde, laat los zodra B uit is (N.C. van sensor B-uit) $[-]$

$ C^+ = a_1 + c_1 dot overline(a_0) $

met:
- $a_1$: trigger, A is uit (N.O. van sensor A-uit) $[-]$
- $c_1$: zelfhouding, C is uit (N.O. van sensor C-uit) $[-]$
- $overline(a_0)$: afschakelvoorwaarde, laat los zodra A weer in is (N.C. van sensor A-in) $[-]$

$ B^+ = c_1 + b_1 dot overline(c_0) $

met:
- $c_1$: trigger, C is uit (N.O. van sensor C-uit) $[-]$
- $b_1$: zelfhouding, B is uit (N.O. van sensor B-uit) $[-]$
- $overline(c_0)$: afschakelvoorwaarde, laat los zodra C weer in is (N.C. van sensor C-in) $[-]$

#figure(
  image("assets/OIS_3D_methode_oefening_ACBACB.png", width: 14cm),
  caption: [Eigen uitwerking: kubuspad en verplaatsings-stap-diagram voor $A^+ C^+ B^+ A^- C^- B^-$],
  label: <fig:3d-acbacb>,
)

#concept(title: "Key insight")[
  Het is een *estafette*: elke "+"-spoel start op de eindsensor van de vorige cilinder en houdt zichzelf vast tot de sensor die zijn eigen terugtrekking aftrapt. In het stap-diagram is de gekleurde balk net de periode dat de spoel bekrachtigd is, en de zelfhoudingsterm $x_1 dot overline("stop")$ houdt die balk hoog tot de stop-sensor schakelt.
]

== Oefening met gekleurde assen: $B^+ A^+ C^+ B^- A^- C^-$

Zelfde methode, maar nu met een kleur per cilinder (A rood, B blauw, C groen). Elk padsegment krijgt de kleur van de bewegende cilinder, en in het stap-diagram zie je per kleur wanneer die spoel aan staat.

#figure(
  image("assets/OIS_3D_methode_oefening_BACBAC.png", width: 14cm),
  caption: [Kubuspad en stap-diagram voor $B^+ A^+ C^+ B^- A^- C^-$, met een kleur per cilinder],
  label: <fig:3d-bacbac>,
)

Monostabiele ventielen, en geen enkele sensorcombinatie herhaalt, dus opnieuw combinatorisch.

$ B^+ = c_0 + b_1 dot overline(c_1) $

met:
- $c_0$: startvoorwaarde, C is in (N.O. van sensor C-in) $[-]$
- $b_1$: zelfhouding, B is uit (N.O. van sensor B-uit) $[-]$
- $overline(c_1)$: afschakelvoorwaarde, laat los zodra C uit is (N.C. van sensor C-uit) $[-]$

$ A^+ = b_1 + a_1 dot overline(b_0) $

met:
- $b_1$: trigger, B is uit (N.O. van sensor B-uit) $[-]$
- $a_1$: zelfhouding, A is uit (N.O. van sensor A-uit) $[-]$
- $overline(b_0)$: afschakelvoorwaarde, laat los zodra B weer in is (N.C. van sensor B-in) $[-]$

$ C^+ = a_1 + c_1 dot overline(a_0) $

met:
- $a_1$: trigger, A is uit (N.O. van sensor A-uit) $[-]$
- $c_1$: zelfhouding, C is uit (N.O. van sensor C-uit) $[-]$
- $overline(a_0)$: afschakelvoorwaarde, laat los zodra A weer in is (N.C. van sensor A-in) $[-]$

== Sequenties in een PLC

Werk je met een PLC, dan is het handmatig oplossen van signaaloverlapping via de cascade- of 3D-methode meestal overbodig. In software implementeer je een sequentie op twee moderne manieren:

/ SFC of Graph (Sequential Function Chart): een grafische taal zoals S7-Graph die stappen en transities rechtstreeks definieert. Dit is de overzichtelijkste en meest industriële standaard voor complexe volgordes.
/ Stappenketen met SR-flipflops: in LAD of FBD wijs je elke stap toe aan een interne merker (bv. `%M0.1` voor stap 1, `%M0.2` voor stap 2). Elke stap zet de volgende stap en reset de vorige. Zo kan een signaalconflict per constructie niet meer voorkomen.

#TODO[Nog aan te vullen uit deck 8: de maxi- en mini-Karnaugh (slides 47-51), de bi-stabiele oplossing van de kubus (slide 45) en de kubussen $A B C B C A$ en $A B B C C A$ (slides 58-60).]
