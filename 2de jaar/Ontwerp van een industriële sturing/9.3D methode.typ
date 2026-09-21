#import "../../school-template.typ": *

= 3D-methode <ch:3d-methode>


Pneumatische cilinders moeten vaak in een vaste opeenvolging bewegen. Een cilinder uitsturen is makkelijk; het probleem is de *volgorde*: hoe vertrekt B pas als A klaar is, zonder dat de sturing vastloopt wanneer twee stappen dezelfde sensorstand delen?

== Bewegingsreeksen noteren

Een sequentie noteren we met de letter van de cilinder en een plus of min:

- $A^+$: cilinder A stuurt uit, de zuigerstang beweegt naar buiten.
- $A^-$: cilinder A trekt in, de zuigerstang beweegt naar binnen.

De detectie schrijven we met kleine letters en een index: $a_0$ is de sensor die *ingetrokken* detecteert, $a_1$ de sensor die *uitgestuurd* detecteert. Een cyclus is dan bijvoorbeeld $A^+ B^+ B^- A^-$, de zogenaamde *L-cyclus*.

== Het probleem: signaaloverlapping

Bouw je een circuit puur op de eindeloopsensoren $a_0, a_1, b_0, b_1$, dan kan er *signaaloverlapping* optreden: twee verschillende fasen van de cyclus zien exact dezelfde sensorwaarden, maar moeten een andere actie starten.

Neem $A^+ B^+ B^- A^-$. Vóór stap 2 ($B^+$) én vóór stap 4 ($A^-$) geldt $a_1 = 1$ en $b_0 = 1$. Dezelfde input, maar de eerste keer moet $B^+$ aan en de tweede keer $A^-$. Zonder extra maatregel worden beide spoelen tegelijk bekrachtigd en loopt het ventiel vast.

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

*De vergelijkingen.* Een cyclus telt $2n$ stappen: elke cilinder gaat één keer uit en één keer in. Elke stap legt vast welke spoel aan moet, dus $2n$ voorwaarden, elk op één specifiek hoekpunt.

Daar zit de oplosbaarheidsvoorwaarde. Elke voorwaarde legt de functie vast op één punt van haar domein. Komt hetzelfde hoekpunt twee keer voor met een *andere* gevraagde actie, dan zijn de vergelijkingen tegenstrijdig en is het stelsel strijdig. Dat is de signaaloverlapping van hierboven.

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
  [2],
  [4],
  [4],
  [exact op de grens: enkel de vierkante cyclus $A^+ B^+ A^- B^-$ past, want je moet álle vier de hoekpunten gebruiken. $A^+ B^+ B^- A^-$ loopt over dezelfde rib terug en botst dus],

  [3], [6], [8], [twee hoekpunten over, dus speling: meerdere volgordes zijn combinatorisch],
  [4], [8], [16], [ruim voldoende speling],
)

*Wat een geheugen doet.* $K_1$ is een extra variabele, dus een extra as: het domein verdubbelt van $2^n$ naar $2^(n+1)$ hoekpunten. De prijs is dat $K_1$ zelf een onbekende is, waarvoor je een set- en resetvoorwaarde moet schrijven.

$ 2n + 2 <= 2^(n+1) $

met:
- $2n + 2$: de $2n$ cilinderstappen plus de set- en de resetstap van $K_1$ $[-]$
- $2^(n+1)$: het aantal hoekpunten nadat $K_1$ er als extra as bij komt $[-]$

Voor de L-cyclus $A^+ B^+ B^- A^-$ met $n = 2$ geeft dat $6 <= 8$, en dat klopt: in @fig:3d-k1-waarom zie je rechts een pad van zes ribben over zes verschillende hoekpunten van de kubus.

#concept(title: "De kern")[
  Valt elke stap op een eigen hoekpunt, dan ligt elke spoelfunctie eenduidig vast en is het stelsel oplosbaar. Vallen twee stappen op hetzelfde hoekpunt, dan is het strijdig en heb je een extra onbekende nodig. Een geheugen kost je één vergelijking, maar verdubbelt je aantal toestanden.
]

== Stappenplan

+ *Benoem de ribben* met $A$, $B$ en $C$ en teken de cyclus als een aaneengesloten traject langs de ribben. Kruist het pad zichzelf, dus wordt een hoekpunt twee keer bezocht voor een *verschillende* actie, dan is het probleem niet-combinatorisch en heb je een extra geheugenvariabele $K_1$ nodig.
+ *Teken de actieve spoeltrajecten.* Markeer op het diagram in welk deel van het traject elke spoel bekrachtigd moet zijn. Zorg dat tegengestelde spoelen zoals $A^+$ en $A^-$ elkaar nooit overlappen, anders blokkeer je het ventiel.
+ *Bouw de rungs op* met N.O.- en N.C.-contacten. Vertaal het actieve traject naar stuurnetwerken met de fysieke eindeloopschakelaars, en gebruik een parallelle tak om de spoel bekrachtigd te houden terwijl de cilinder onderweg is en de startvoorwaarde alweer afvalt.

#examenbox[
  Schrijf op het examen elke stap uit en zeg er expliciet bij dat je die stap voltooid hebt.
]

Het resultaat van de methode is telkens een contactschema per beweging: welke sensoren in serie moeten staan om die spoel te bekrachtigen.

#figure(
  grid(
    columns: 2,
    column-gutter: 0.6cm,
    image("assets/OIS_3D_contacten_direct.png", width: 5.5cm),
    image("assets/OIS_3D_contacten_AB.png", width: 6.5cm),
  ),
  caption: [Links het eenvoudige geval: één sensor per beweging. Rechts hetzelfde net wanneer er twee voorwaarden in serie nodig zijn.],
  label: <fig:3d-contactschema>,
)

== Examentip: het vraagtype dat altijd terugkomt <sec:3d-examenvraag>

De vraag komt elk jaar in dezelfde vorm. Je krijgt een #strong[cilinderpad] voor $A$, $B$ en eventueel $C$, plus de beschikbare #strong[ingangen] $a_0, a_1, b_0, b_1, c_0, c_1$. Gevraagd wordt telkens hetzelfde drietal:

+ Heb je een #strong[extra geheugen] nodig, en zo ja waar zet en reset je het?
+ Welke ingangen neem je als #strong[N.O.] en welke als #strong[N.C.]?
+ Staan ze in #strong[serie] of #strong[parallel]?

=== Vraag 1: geheugen nodig?

Schrijf de sensortoestand op na elke stap van de cyclus. Komt dezelfde combinatie twee keer voor?

#table(
  columns: (auto, 1fr),
  inset: 8pt, stroke: none, align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Bevinding*], [*Besluit*],
  [Elke combinatie komt één keer voor], [Combinatorisch. Geen geheugen. Elke spoel volgt rechtstreeks uit de sensoren.],
  [Een combinatie komt twee keer voor, met #strong[dezelfde] gevraagde actie], [Geen probleem, geen geheugen.],
  [Een combinatie komt twee keer voor met een #strong[andere] gevraagde actie], [Signaaloverlapping. Eén geheugen $K_1$ bijzetten.],
  [Uit één punt vertrekken $m$ verschillende takken], [Je hebt $ceil(log_2 m)$ geheugens nodig: drie takken $arrow.r$ twee geheugens.],
)

Sneltest zonder tekenen: schrijf de cyclus als letters en knip zodra een letter zich herhaalt. Het aantal knippen is het aantal geheugens. $A^+ B^+ C^+ A^- B^- C^-$ geeft $A B C | A B C$, dus één knip, maar de sensortoestanden botsen niet, dus nul geheugens. $A^+ B^+ B^- A^-$ geeft $A B | B A$: daar botst $a_1 b_0$ wél, dus één geheugen.

*Waar zet en reset je het?* Op een punt dat #strong[maar één keer] in de cyclus voorkomt, anders verplaats je het probleem alleen.

- #strong[Set] op het einde van groep I, dus de laatste sensor vóór de knip.
- #strong[Reset] op het einde van groep II, dus de laatste sensor van de cyclus.

Voor $A^+ B^+ | B^- A^-$: set op $b_1$, reset op $a_0$, dus $K_1 = b_1 + K_1 dot overline(a_0)$.

=== Vraag 2: N.O. of N.C.?

Kijk naar wat de term in de vergelijking doet:

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt, stroke: none, align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Rol in de vergelijking*], [*Contact*], [*Waarom*],
  [Term staat er zonder streep: $x$], [N.O.], [de spoel moet aangaan wanneer die sensor bereikt is],
  [Term staat er met streep: $overline(x)$], [N.C.], [de spoel moet #strong[los]laten wanneer die sensor bereikt wordt],
  [Veiligheidsketen, noodstop, deurschakelaar], [N.C.], [draadbreuk moet de machine stoppen, niet stil verbergen],
)

In de standaardvorm $X^+ = "trigger" + x_1 dot overline("stop")$ zijn de trigger en $x_1$ dus N.O.-contacten, en is $overline("stop")$ het enige N.C.-contact.

=== Vraag 3: serie of parallel?

Boolean vertaalt zich rechtstreeks naar de tekening:

- Vermenigvuldigen is #strong[EN], dus contacten in #strong[serie]. Alle voorwaarden moeten tegelijk waar zijn.
- Optellen is #strong[OF], dus takken in #strong[parallel]. Eén van beide volstaat.

Elke $X^+$ krijgt daarom twee parallelle takken: de trigger die hem aanzet, en de zelfhoudtak die hem aan houdt. In die zelfhoudtak staan $x_1$ en $overline("stop")$ in serie.

$ X^+ = underbrace("trigger", "tak 1") + underbrace(x_1 dot overline("stop"), "tak 2, serie") $

met:
- trigger: de eindsensor van de vorige beweging, N.O. $[-]$
- $x_1$: de eigen uit-sensor, N.O., houdt de spoel vast zodra de cilinder uit is $[-]$
- $overline("stop")$: N.C. van de sensor die de $X^-$-stap aftrapt, laat de spoel los $[-]$

De zelfhoudtak is niet optioneel: zonder die tak valt de spoel af zodra de cilinder van zijn startsensor wegloopt, en blijft hij halverwege steken.

#examenbox[
  Schrijf altijd eerst de tabel met sensortoestanden per stap uit, ook als je meteen ziet dat het combinatorisch is. Dat is het bewijs waarop de vraag "heb je een geheugen nodig?" beoordeeld wordt. Zeg er expliciet bij dat geen enkele combinatie zich herhaalt.
]

#waarschuwing[
  Zet nooit $X^+$ en $X^-$ tegelijk onder spanning. Bij een bistabiel ventiel blokkeer je de spool, bij een monostabiel wint de veer of de spoel afhankelijk van de druk. Controleer dus altijd of de actieve trajecten van $X^+$ en $X^-$ elkaar niet overlappen.
]

== Wanneer heb je een geheugen $K_1$ nodig?

Niet elke cyclus is combinatorisch. Bij $A^+ B^+ B^- A^-$ botst het pad in *2D*: de sensorstand $a_1 b_0$ komt twee keer voor, na $A^+$ (je wil $B^+$) en na $B^-$ (je wil $A^-$).

Het geheugen $K_1$ is een *extra as* die de twee botsende punten uit elkaar tilt: $(a_1 b_0, K_1 = 0)$ tegenover $(a_1 b_0, K_1 = 1)$. Vandaar de naam 3D-methode.

#figure(
  image("assets/OIS_3D_methode_K1_waarom.png", width: 13cm),
  caption: [Links botst het pad in 2D op $a_1 b_0$; rechts tilt $K_1$ de twee punten uit elkaar],
  label: <fig:3d-k1-waarom>,
)

#figure(
  scale(40%, reflow: true, merman.mermaid(```
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

Zit het geheugen $K_1$ er eenmaal in, dan houdt het zichzelf vast tot de resetvoorwaarde komt, en bepaalt het mee welke uitgangen mogen schakelen:

#figure(
  grid(
    columns: 2,
    column-gutter: 0.6cm,
    image("assets/OIS_3D_K1_zelfhoud.png", width: 5.5cm),
    image("assets/OIS_3D_K1_uitgangen.png", width: 6cm),
  ),
  caption: [Links de zelfhoudschakeling van $K_1$: $v_0$ zet hem, $h_1$ houdt hem vast. Rechts hoe $K_1$ daarna de vier bewegingen verdeelt.],
  label: <fig:3d-K1-schema>,
)

=== Groepen bepalen (cascademethode) <sec:groepen>

Om signaaloverlapping te vermijden zonder extra elektronica splits je de cyclus in *groepen*: een cilinder mag binnen één groep *nooit twee keer voorkomen*. Herhaalt een letter zich, dan trek je een grens en start je een nieuwe groep.

Toegepast op $A^+ B^+ B^- A^-$:

- Groep I: $A^+ B^+$
- Groep II: $B^- A^-$

Dat is één knip, dus één geheugen $K_1$ (een hulprelais of een 5/2-dubbelimpulsventiel) om te schakelen tussen de voedingslijnen van groep I en groep II. De zuiver pneumatische uitvoering daarvan, met cascadeleidingen en een groepenventiel, staat bij @sec:cascade-pneumatisch.

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

#concept(title: "De kern")[
  Per knip komt er één geheugen bij, en dat onthoudt "in welke ronde zit ik" — precies de informatie die het 2D-pad miste. Daarmee wordt het gekruiste pad weer een niet-botsende wandeling.
]

== Karnaughkaarten bij de 3D-methode <sec:karnaugh>

=== Maxi-Karnaugh <sec:maxi-karnaugh>

Bij de #keyterm[maxi-Karnaugh] neem je #strong[alle] variabelen in de kaart op. De kaart is dan volledig, en je kan er systematisch de kleinste uitdrukking uit halen.

#figure(
  image("assets/OIS_maxi_karnaugh_clean.png", width: 6cm),
  caption: [Maxi-Karnaugh voor $A^+$ en $B^+$: alle variabelen staan in de kaart, ook de gecombineerde kolom $overline(a)_0 dot a_1$.],
  label: <fig:maxi-karnaugh>,
)


=== Mini-Karnaugh <sec:mini-karnaugh>

#wrap-figure(
  image("assets/OIS_mini_karnaugh.png", width: 8cm),
  caption: [Mini-Karnaugh: een variabele is weggelaten omdat ze naar verwachting niet nodig is.],
  label: <fig:mini-karnaugh>,
)[
  Bij de #keyterm[mini-Karnaugh] laat je een variabele weg zodra je verwacht dat je ze niet nodig zult hebben. De kaart wordt daardoor kleiner en sneller in te vullen.
]

#waarschuwing[
  De slides zijn hier ondubbelzinnig over: #belangrijk[probeer dit niet op het examen], en eigenlijk beter helemaal nooit.

  De reden is dat je vooraf móet gokken welke variabele overbodig is. Gok je fout, dan mis je een conditie, en dat zie je niet aan de kaart zelf.
]

== Sequenties in een PLC

Werk je met een PLC, dan is het handmatig oplossen van signaaloverlapping via de cascade- of 3D-methode meestal overbodig. In software implementeer je een sequentie op twee moderne manieren:

/ SFC of Graph (Sequential Function Chart): een grafische taal zoals S7-Graph die stappen en transities rechtstreeks definieert. Dit is de overzichtelijkste en meest industriële standaard voor complexe volgordes.
/ Stappenketen met SR-flipflops: in LAD of FBD wijs je elke stap toe aan een interne merker (bv. `%M0.1` voor stap 1, `%M0.2` voor stap 2). Elke stap zet de volgende stap en reset de vorige. Zo kan een signaalconflict per constructie niet meer voorkomen.

