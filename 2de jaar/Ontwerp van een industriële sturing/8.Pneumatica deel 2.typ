#import "../../school-template.typ": *

= Pneumatica deel 2 <ch:pneumatica-deel-2>


In @ch:intro-pneumatics keken we naar de cilinder: welke kracht die levert en hoe we hem voeden. Hier gaan we een niveau dieper, naar het *ventiel* zelf. Drie vragen:

+ Wat zit er binnenin een richtingsventiel en hoe stuurt dat de lucht?
+ Wat moet er rond dat ventiel staan om de cilinder rustig en stil te laten bewegen?
+ Hoe lees je het symbool van een ventiel, en wat verandert er fysiek op het moment dat je schakelt?

== Het schuifventiel binnenin

#wrap-figure(
  image("assets/doorsnede-klepventiel.jpeg", width: 5.5cm),
  caption: [Doorsnede van een schuifventiel: de spool met zijn lands],
  label: <fig:doorsnede-schuifventiel>,
  width: 5.5cm,
)[
  Het meest gebruikte richtingsventiel (*DCV*, Directional Control Valve) is het *schuifventiel* (spool valve). Binnenin het ventielhuis zit een horizontaal bewegende schuif, de *spool*. Op die schuif staan verhoogde delen, de *lands*. Die lands sluiten een poort af of laten hem open, en bepalen zo welke poorten onderling verbonden zijn.

  Merk op dat de figuur het ventiel toont onder de titel "klepventiel", terwijl de beschrijving over een spool met lands gaat. Dat is strikt genomen een schuifventiel; een echt klepventiel (poppet valve) sluit pas op het einde van zijn beweging. Het onderscheid komt terug in pneumatica deel 3.
]

Op de figuur staat een 3/2 ventiel met de poorten $1(P)$ (toevoer), $2(A)$ (naar de cilinder) en $3(R)$ (ontluchting). In de eerste stand blokkeren de lands poort $3$, en staan $1$ en $2$ open en met elkaar verbonden: de cilinder krijgt druk. In de tweede stand blokkeren de lands poort $1$, en zijn $2$ en $3$ verbonden: de cilinder ontlucht. De schuif wordt tussen die twee standen bewogen door een manueel, mechanisch, elektrisch of pneumatisch signaal op de uiteinden van de spool.

Onthoud dat één fysieke schuif dus meerdere standen levert. Dat is wat je later in het symbool terugziet: de hokjes naast elkaar zijn *geen* aparte ventielen, het is dezelfde schuif op een andere plaats (zie @sec:schuif-verschuift).

== Lucht afvoeren: geluiddemper en omgevingsfilter

Een cilinder duwt bij elke slag een volledige kamer lucht naar buiten. Dat gebeurt op korte tijd en met een groot debiet, en dat maakt lawaai. Daarom zet je op de ontluchtingspoorten van het ventiel een *geluiddemper* (muffler): die laat de lucht wel door, maar spreidt de uitstroom zodat het geluid dat bij dit proces ontstaat sterk vermindert.

De complexere variant is de *omgevingsfilter*. Die dempt net als een geluiddemper, maar filtert bovendien de olie uit de uitlaatlucht (bij gesmeerde installaties komt die olie anders gewoon in de werkplaats terecht), grotere hoeveelheden lucht verwerken, en het geluidsniveau onder controle houden. Kort samengevat: een geluiddemper doet enkel aan geluidsdemping, een omgevingsfilter doet *filteren van olie én geluidsdemping*, en dat bij een groter debiet.

#figure(
  grid(
    columns: 2,
    column-gutter: 2cm,
    align: horizon,
    image("assets/muffler.png", width: 5cm), image("assets/omgevingsfilter.png", width: 4cm),
  ),
  caption: [Links het symbool van een geluiddemper (muffler), rechts de doorsnede van een omgevingsfilter],
  label: <fig:demper-en-filter>,
)

Let op het effect op de rest van het circuit: elke demper of filter is ook een weerstand. Ze verlagen dus de debietstroom $dot(V)$ aan de uitlaat, wat de cilinder trager maakt. Een vervuilde demper is een klassieke oorzaak van een cilinder die "plots trager" is geworden.

== Snelheidsregelventiel (FCV)

#wrap-figure(
  image("assets/snelheidsregelventiel-fcv.jpeg", width: 4.5cm),
  caption: [Symbool snelheidsregelventiel: een smoorkraan met een terugslagklep er parallel over],
  label: <fig:fcv>,
  width: 4.5cm,
)[
  Een *snelheidsregelventiel* (FCV, Flow Control Valve) regelt de snelheid van de luchttoevoer, en dus de snelheid van de cilinder. Het bestaat uit twee componenten in parallel: een *smoorkraan* (smoorventiel, throttle valve) die de doorstroming knijpt, en een *terugslagklep* (check valve) die er parallel over staat.

  Waarom die terugslagklep? Een smoorventiel op zich laat lucht door in *twee* richtingen en zou dus zowel de uitgaande als de ingaande slag afremmen. Dat willen we bij cilinders niet: we willen precies één richting smoren. De terugslagklep geeft de lucht in de andere richting een vrije weg, zodat de smoring enkel werkt in de richting die we kiezen.
]

Het correct regelen van de snelheid van een pneumatische cilinder gebeurt aan de *uitlaatzijde* van de lucht, dus aan de uitstromende kant van de cilinder (*metered out*). De reden zit in wat er gebeurt als je aan de instroomkant regelt (metered in): de druk in de cilinder bouwt zich dan geleidelijk op, en zolang die druk nog laag is kan de zuiger gemakkelijk teruggeduwd worden door de last, tot de druk groot genoeg is. Je krijgt dan een schokkerige, onvoorspelbare beweging in plaats van een gelijkmatige. Smoor je daarentegen de uitstromende lucht, dan staat er altijd een tegendruk die de zuiger vasthoudt en beweegt hij rustig.

Wil je dus een cilinder op een meer *gecontroleerde* manier van toestand laten veranderen, dan installeer je een snelheidsregelventiel zo dicht mogelijk bij de cilinder, aan de uitstromende kant. Dat "zo dicht mogelijk" is geen detail: alle lucht die tussen het ventiel en de cilinder zit, moet immers nog altijd gecomprimeerd en ontlucht worden en gedraagt zich als een veer. Hoe langer die leiding, hoe sponziger de regeling.

== Het schakelen van pneumatiek

Een cilinder wordt steeds bestuurd door één hoofdschakelaar, die net zoals in de elektronica aangeduid wordt met de letter `Q`. De ventielen zelf delen we in twee groepen in:

/ Stuurventielen `K`: worden louter gebruikt in de *logica*. Ze schakelen kleine debieten en lage vermogens, enkel om een signaal door te geven.
/ Vermogenventielen `Q`: schakelen de *grote debieten* naar de cilinders toe.

#wrap-figure(
  image("assets/electro-vs-mechanisch-pneumatisch.png", width: 6cm),
  caption: [Links elektro-pneumatisch bediend (spoel `14`), rechts mechanisch-pneumatisch, met een veer als reset en dempers op de poorten $5$ en $3$],
  label: <fig:electro-vs-mechanisch>,
  width: 6cm,
)[
  Een veel gebruikt ventiel dat vermogen schakelt is het *elektro-pneumatisch ventiel*: we gebruiken een klein *elektrisch* signaal (een spoel van bv. 2 W) om een grote hoeveelheid lucht te schakelen. Zo koppel je de PLC (Programmable Logic Controller) of het relaiscircuit aan het pneumatische vermogen.

  Er is nog een verschil met elektrische schakelaars waar we even bij stilstaan: een *puur pneumatisch* ventiel verbruikt geen vermogen zolang het geschakeld staat. Het verbruikt alleen even iets op het moment dat het van situatie verandert. Een contactor of een elektro-pneumatisch ventiel met permanent bekrachtigde spoel trekt daarentegen continu stroom zolang je hem aangestuurd houdt.
]

=== Opbouw van de symbolen

Elk ventiel kan in één, twee of uitzonderlijk meer standen staan. In het symbool herken je altijd de *stoppen*, aangeduid met een "T": daar loopt de lucht dood. Pijlen tonen de stromingsrichting.

#wrap-figure(
  image("assets/ventiel-53-flowboxes.jpeg", width: 8cm),
  caption: [Voorbeeld: elk hokje toont de doorstroming voor één stand van dezelfde schuif],
  label: <fig:ventiel-53-flowboxes>,
  width: 7cm,
)[
  De *naamgeving* $x slash y$ lees je zo af:

  - Het eerste cijfer $x$ is het aantal *aansluitingen* dat het ventiel heeft in een bepaalde situatie (tel de aansluitingen op één hokje). Op de figuur zijn dat er vijf.
  - Het tweede cijfer $y$ is het aantal *standen* waarin het ventiel geschakeld kan worden, dus simpelweg het aantal hokjes. Op de figuur zijn dat er drie.

  We hebben dus te maken met een *5/3 ventiel*. Die naam vervolledig je nog met: elektro-pneumatisch, fail-close (NO, Normally Open) of fail-open (NC, Normally Closed), en uni- of multidirectioneel afhankelijk van de richting van de pijlen.
]

Als je zelf mag kiezen (en dat is niet altijd het geval) teken je de *niet-bediende* toestand aan de rechterkant. Zo kan je een *monostabiel* ventiel altijd al herkennen aan de aanwezigheid van een veersymbool: dat vertelt je naar welke stand het ventiel terugvalt als het niet wordt aangestuurd, en dus welke positie het inneemt in rust.

Bij een *bistabiel* ventiel kan je de startsituatie niet achterhalen: het blijft staan waar het laatst gezet is, dus na installatie kan het in elke stand staan. Een ventiel met drie standen is een dubbel monostabiel ventiel: twee spoelen die het elk naar hun kant trekken, met een stabiele middenstand zodra beide spoelen loslaten.

=== Wat er fysiek verandert als je schakelt <sec:schuif-verschuift>

Hier gaat het bij het lezen van een symbool vaak mis. De hokjes staan naast elkaar op papier, waardoor het lijkt alsof er drie ventielen naast elkaar liggen. Dat klopt niet. Er is *één* schuif, en de hokjes zijn de standen van diezelfde schuif. Wat je moet inbeelden:

- De *leidingen* (toevoer, ontluchting, de slangen naar de cilinder) liggen vast. Die verhuizen niet.
- De *reeks hokjes* schuift eronder door wanneer je bedient. Druk je de knop in of bekrachtig je de linkse spoel, dan duwt die de schuif naar rechts, waardoor het linkse hokje voor de vaste aansluitingen komt te liggen.
- Het hokje dat op dat moment *voor de aansluitingen* ligt, is het hokje dat geldt. Leg dat hokje mentaal over de leidingen en lees de pijlen af: dat is jouw doorstroming.

Zo lees je @fig:ventiel-53-flowboxes: linkse spoel bekrachtigd $arrow.r$ het groene hokje ligt op de leidingen; geen enkele spoel bekrachtigd $arrow.r$ het middelste hokje; rechtse spoel bekrachtigd $arrow.r$ het blauwe hokje. In @fig:schuif-verschuift is dat uitgetekend voor een monostabiel 5/2 ventiel met zijn cilinder.

#figure(
  cetz.canvas(
    length: 0.75cm,
    {
      import cetz.draw: *

      // ---------------- afmetingen ----------------
      let w = 2.0 // breedte van één hokje
      let h = 1.6 // hoogte van één hokje
      let xL = 0.5 // vaste leiding links  (poorten 4 en 5)
      let xM = 1.0 // vaste leiding midden (poort 1, toevoer)
      let xR = 1.5 // vaste leiding rechts (poorten 2 en 3)
      let dyA = 0.0 // paneel 1: rust
      let dyB = -7.7 // paneel 2: bediend

      let rood = rgb(200, 60, 50)
      let blauw = rgb(60, 110, 180)
      let groen = rgb(39, 174, 96)
      let grijs = rgb(120, 120, 120)
      let klein = txt => text(size: 7.5pt, txt)

      // ---------------- de vaste aansluitingen als hulplijn ----------------
      for gx in (xL, xM, xR) {
        line(
          (gx, dyB - 1.6),
          (gx, dyA + 2.5),
          stroke: (paint: grijs.lighten(60%), thickness: 0.6pt, dash: "dashed"),
        )
      }

      // ---------------- één hokje van het symbool ----------------
      // soort: "bediend" (1->4, 2->3) of "rust" (1->2, 4->5)
      let hokje(x, y, soort, actief) = {
        let kaderkleur = if soort == "bediend" { groen } else { grijs.darken(15%) }
        rect(
          (x, y),
          (x + w, y + h),
          fill: if actief { kaderkleur.lighten(93%) } else { white },
          stroke: if actief { (paint: kaderkleur, thickness: 2pt) } else {
            (paint: grijs.lighten(55%), thickness: 0.7pt)
          },
        )
        let druk = if actief { rood } else { grijs.lighten(55%) }
        let vent = if actief { blauw } else { grijs.lighten(55%) }
        let dik = if actief { 1.5pt } else { 0.7pt }
        if soort == "bediend" {
          line((x + xM, y + 0.2), (x + xL, y + h - 0.2), mark: (end: ">"), stroke: (paint: druk, thickness: dik))
          line((x + xR, y + h - 0.2), (x + xR, y + 0.2), mark: (end: ">"), stroke: (paint: vent, thickness: dik))
        } else {
          line((x + xM, y + 0.2), (x + xR, y + h - 0.2), mark: (end: ">"), stroke: (paint: druk, thickness: dik))
          line((x + xL, y + h - 0.2), (x + xL, y + 0.2), mark: (end: ">"), stroke: (paint: vent, thickness: dik))
        }
      }

      // ---------------- bedieningen ----------------
      let spoel(x, y) = {
        rect((x - 1.0, y + 0.35), (x, y + h - 0.35), stroke: 0.8pt)
        line((x - 1.0, y + 0.35), (x, y + h - 0.35), stroke: 0.8pt)
      }
      let veer(x, y) = {
        let yc = y + h / 2
        line(
          (x, yc),
          (x + 0.15, yc + 0.3),
          (x + 0.4, yc - 0.3),
          (x + 0.65, yc + 0.3),
          (x + 0.9, yc - 0.3),
          (x + 1.05, yc),
          stroke: 0.8pt,
        )
      }

      // ---------------- cilinder ----------------
      let cilinder(dy, px, links-onder-druk) = {
        let y0 = dy + 3.0
        let y1 = dy + 4.0
        let yc = dy + 3.5
        let kl = if links-onder-druk { rood.lighten(78%) } else { blauw.lighten(85%) }
        let kr = if links-onder-druk { blauw.lighten(85%) } else { rood.lighten(78%) }
        rect((0, y0), (px, y1), fill: kl, stroke: none)
        rect((px + 0.35, y0), (5.0, y1), fill: kr, stroke: none)
        rect((0, y0), (5.0, y1), stroke: 1pt)
        rect((px, y0), (px + 0.35, y1), fill: grijs, stroke: 0.8pt)
        line((px + 0.35, yc), (px + 4.4, yc), stroke: 2.5pt)
      }

      // ---------------- volledig paneel ----------------
      let paneel(dy, bediend) = {
        let sx = if bediend { 0.0 } else { -w } // linkerrand van de hokjesreeks
        hokje(sx, dy, "bediend", bediend)
        hokje(sx + w, dy, "rust", not bediend)
        spoel(sx, dy)
        veer(sx + 2 * w, dy)
        content((sx - 0.5, dy + h + 0.3), klein[-M1])
        content((sx + 2 * w + 1.2, dy + h / 2), anchor: "west", klein[veer])

        // toevoer 1 (P): staat altijd onder druk
        line((xM, dy - 0.95), (xM, dy), stroke: (paint: rood, thickness: 1.6pt))
        circle((xM, dy - 1.2), radius: 0.25, stroke: (paint: rood, thickness: 1pt))
        line(
          (xM - 0.16, dy - 1.3),
          (xM + 0.16, dy - 1.3),
          (xM, dy - 1.02),
          close: true,
          fill: rood,
          stroke: none,
        )
        content((xM + 0.45, dy - 1.2), anchor: "west", klein[1 (P)])

        // ontluchtingen 5 (links) en 3 (rechts)
        let uitlaat(x, actief, lbl, kant) = {
          let kleur = if actief { blauw } else { grijs.lighten(55%) }
          line((x, dy), (x, dy - 0.6), stroke: (paint: kleur, thickness: if actief { 1.5pt } else { 0.8pt }))
          line((x - 0.22, dy - 0.6), (x + 0.22, dy - 0.6), (x, dy - 0.95), close: true, stroke: (paint: kleur))
          content(
            (x + (if kant == "links" { -0.32 } else { 0.32 }), dy - 0.35),
            anchor: if kant == "links" { "east" } else { "west" },
            klein[#lbl],
          )
        }
        uitlaat(xL, not bediend, [5 (R)], "links")
        uitlaat(xR, bediend, [3 (R)], "rechts")

        // slangen naar de cilinder
        let c4 = if bediend { rood } else { blauw }
        let c2 = if bediend { blauw } else { rood }
        line(
          (xL, dy + h),
          (xL, dy + 2.4),
          (0.2, dy + 2.4),
          (0.2, dy + 3.0),
          stroke: (paint: c4, thickness: 1.4pt),
        )
        line(
          (xR, dy + h),
          (xR, dy + 1.95),
          (4.8, dy + 1.95),
          (4.8, dy + 3.0),
          stroke: (paint: c2, thickness: 1.4pt),
        )
        content((xL - 0.15, dy + 2.15), anchor: "east", klein[4 (A)])
        content((xR + 0.15, dy + 1.75), anchor: "west", klein[2 (B)])

        // cilinder
        cilinder(dy, if bediend { 3.0 } else { 0.6 }, bediend)
        content((2.5, dy + 4.25), klein[cilinder =M10])
      }

      // ---------------- paneel 1: rustpositie ----------------
      paneel(dyA, false)
      content(
        (-3.2, dyA + 5.25),
        anchor: "west",
        text(size: 8.5pt, weight: "bold")[
          1. Spoel -M1 niet bekrachtigd $arrow.r$ het rechtse hokje ligt op de leidingen
        ],
      )
      content(
        (-3.2, dyA + 4.75),
        anchor: "west",
        klein[$1 arrow.r 2$: rechterkamer onder druk, $4 arrow.r 5$ ontlucht $arrow.r$ stang *ingetrokken*],
      )

      // ---------------- paneel 2: bediend ----------------
      paneel(dyB, true)
      content(
        (-3.2, dyB + 5.25),
        anchor: "west",
        text(size: 8.5pt, weight: "bold")[2. Spoel -M1 bekrachtigd $arrow.r$ de schuif wordt naar rechts geduwd],
      )
      content(
        (-3.2, dyB + 4.75),
        anchor: "west",
        klein[$1 arrow.r 4$: linkerkamer onder druk, $2 arrow.r 3$ ontlucht $arrow.r$ stang *uitgeschoven*],
      )

      // duwrichting van de schuif
      line(
        (-3.3, dyB + 2.45),
        (-1.6, dyB + 2.45),
        mark: (end: ">"),
        stroke: (paint: groen, thickness: 1.6pt),
      )
      content((-3.3, dyB + 2.85), anchor: "west", text(size: 7.5pt, fill: groen)[schuift naar rechts])

      // legende
      line((-3.2, dyB - 2.15), (-2.5, dyB - 2.15), stroke: (paint: rood, thickness: 1.6pt))
      content((-2.35, dyB - 2.15), anchor: "west", klein[perslucht])
      line((0.4, dyB - 2.15), (1.1, dyB - 2.15), stroke: (paint: blauw, thickness: 1.6pt))
      content((1.25, dyB - 2.15), anchor: "west", klein[lucht die ontsnapt])
      line(
        (4.2, dyB - 2.15),
        (4.9, dyB - 2.15),
        stroke: (paint: grijs.lighten(60%), thickness: 0.7pt, dash: "dashed"),
      )
      content((5.05, dyB - 2.15), anchor: "west", klein[vaste aansluiting])
    },
  ),
  caption: [Schakelen van een monostabiel 5/2 ventiel. De streepjeslijnen (de aansluitingen) staan in beide tekeningen op exact dezelfde plaats; enkel de reeks hokjes schuift op. Het hokje dat voor de aansluitingen komt te liggen, bepaalt de doorstroming en dus de richting waarin de cilinder beweegt.],
  label: <fig:schuif-verschuift>,
)

#concept(title: "Hoe je een ventielsymbool in drie stappen leest")[
  + *Tel de aansluitingen op één hokje* en *tel de hokjes*: dat geeft je $x slash y$.
  + *Zoek de rustpositie*: het hokje aan de kant van de veer is de stand waar het ventiel naartoe valt als je niets aanstuurt. Staat er geen veer, dan is het bistabiel en ken je de startstand niet.
  + *Schuif het juiste hokje voor de leidingen* en lees de pijlen en de "T"-stoppen af. Zo weet je welke kamer druk krijgt, welke ontlucht, en dus in welke richting de stang beweegt.
]

=== De mechanische beweging van een ventiel

#wrap-figure(
  image("assets/tijdsdiagram-ventiel.png", width: 6cm),
  caption: [Tijdsdiagram van de spoelen, de ventielstand en de cilinderpositie],
  label: <fig:tijdsdiagram-ventiel>,
  width: 6cm,
)[
  Het tijdsdiagram maakt twee dingen zichtbaar die je op het symbool niet ziet.

  Ten eerste reageert het ventiel op de *stijgende flanken* van het stuursignaal. Een korte puls op spoel `-M1` zet het ventiel om, en het blijft daar staan ook nadat de puls weg is; pas een puls op `-M2` zet het terug. Dat is het geheugengedrag van een bistabiel ventiel, vergelijkbaar met een flip-flop.

  Ten tweede heeft de cilinder `-M10` *tijd* nodig voor hij zijn uiteindelijke positie bereikt: de flank van het ventiel is scherp, maar de curve van de cilinder loopt schuin op. Het ventiel schakelt in milliseconden, de cilinder doet er honderden milliseconden tot seconden over.
]

Dat tweede punt heeft een direct gevolg voor je sturing: je mag nooit aannemen dat een cilinder op zijn eindpositie staat omdat je het ventiel hebt aangestuurd. Wil je zeker zijn, dan heb je eindpositiedetectie nodig ($a_0$ en $a_1$) en laat je de volgende stap in je sequentie pas vertrekken wanneer die sensor bevestigt dat de beweging effectief afgerond is.

=== Elektrische schema's met ventielen

Een cilinder krijgt een functieaanduiding met `=`, bijvoorbeeld `=M10`. Het ventiel dat die cilinder stuurt hoort bij diezelfde functie en krijgt de kenletter `-Q`, dus `-Q1`.

De volledige verwijzing naar de spoel van dat ventiel wordt dan:

$ = M 10 - Q 1 . M 1 $

Lees het van links naar rechts: functie `=M10`, daarbinnen component `-Q1`, en daarvan de spoel `.M1`.

#belangrijk[Zo staat in één string waar het component hoort, wat het is en welk onderdeel je precies bedoelt.] Dat is nodig zodra dezelfde ventieltype meerdere keren in de machine voorkomt.

== Logica in pneumatiek

De notatie `A+`/`A-` met de toestanden $a_0$ en $a_1$, de drie logische functies met ventielen, en de reden waarom een T-stuk géén OR is, staan bij @sec:pneum-logica in Pneumatica deel 1.

== Soorten ventielen <sec:soorten-ventielen>

=== Basiseisen <sec:ventiel-basiseisen>

Elk ventiel moet voldoen aan vier operationele eisen:

+ lange levensduur, onder uiteenlopende omstandigheden;
+ constante en snelle responstijden;
+ hoge debietkarakteristiek, uitgedrukt met de $K_v$-waarde;
+ eenvoudig te onderhouden.

=== De $K_v$-waarde <sec:kv-waarde>

De $K_v$-waarde is de #keyterm[debietcoëfficiënt] waarmee je het volumedebiet van een ventiel bepaalt.

#frm(
  "Kv- en Cv-waarde",
  $ C_v = #"1,17" dot K_v $,
  [met: $K_v$ = de hoeveelheid water die door het ventiel stroomt bij een drukval van $1 "bar"$ over dat ventiel [m³/h]; $C_v$ = de Amerikaanse benaming, uitgedrukt in gallons per minuut [gpm].],
)

Kies je het ventiel te klein, dan krijg je een grote drukval en dus te weinig kracht of te weinig snelheid aan de cilinder.

=== Manifold <sec:manifold>

#wrap-figure(
  image("assets/OIS_manifold.png", width: 7.5cm),
  caption: [Een manifold of ventielblok verdeelt de persluchttoevoer intern over een reeks ventielen.],
  label: <fig:manifold>,
)[
  Om een reeks ventielen efficiënt te monteren bieden de meeste fabrikanten een #keyterm[manifold] of ventielblok aan. Daarin zitten interne verdeelkanalen, zodat je de persluchttoevoer #strong[niet] meerdere keren hoeft aan te sluiten.
]

=== Kogelkraan en schijfventiel

*Kogelkraan.* Een kogelkraan gebruik je vooral om af te sluiten of te isoleren, dus als 2/2.

#belangrijk[Herken de stand aan de hendel:] staat de hendel #strong[evenwijdig] met de leiding, dan is de kraan open; staat hij er #strong[loodrecht] op, dan is de kraan dicht.

*Schijfventiel.* Bij een schijfventiel (disc valve) glijden twee keramische of kunststof schijven over elkaar. Dat maakt het minder gevoelig voor vuil en stof.

== Constructies vergeleken

=== Klepventiel (poppet valve)

Een #keyterm[klepventiel] (poppet valve) heeft als grote voordeel zijn eenvoud: een minimum aan bewegende delen. Een beweegbare klep sluit tegen een zitting. Het afdichten gebeurt met vlakke schijven, ringen, O-ringen of bolvormige sluitingen. De klep zelf is een simpele schijf, bal of kegel.

#belangrijk[De druk aan de ingang houdt het ventiel stevig dicht.] Dat is meteen de sterkte én de zwakte: het sluit uitstekend af, maar je moet bij het bedienen #strong[tegen de druk in] duwen.

De drie uitvoeringen:
- *2/2 normaal gesloten.* Druk je de knop in, dan licht de bal van zijn zitting en stroomt er lucht van poort P naar A. Laat je los, dan duwen de veer én de druk de bal weer omhoog, en sluit het ventiel.
- *3/2 met schijfafdichting.* Met de knop losgelaten zijn poorten A en R eerst afgesloten; dan wordt de klepschijf omlaag geduwd en verbindt ze P met A. Veerkracht en de druk vanuit P sluiten het ventiel weer.
- *4/2 omschakelend*, met twee stelen en schijfventielen. Met de knop losgelaten zijn A en R verbonden via de holle linkersteel, en P en B via het normaal geopende rechterschijfventiel. Druk je in, dan wordt eerst de verbinding A--R gesloten, dan die tussen P en B.

=== Schuifventiel (spool valve)

Een #keyterm[schuifventiel] (spool valve) heeft een schuif die horizontaal in het ventielhuis beweegt. Verhoogde delen op die schuif, de #keyterm[lands], blokkeren of openen de poorten.

Het cruciale verschil met het klepventiel: #belangrijk[een schuifventiel is intern in drukbalans.] De druk duwt aan beide kanten van de schuif even hard, dus de kracht die je nodig hebt om te schakelen is #strong[onafhankelijk] van de geschakelde druk.

Daaruit volgt een praktisch gevolg dat de slides expliciet maken: #belangrijk[een 5/2 is makkelijker te bouwen dan een 4/2.] Bij een 5/2 heeft elke uitgang zijn eigen ontluchtingspoort, waardoor de constructie symmetrisch en dus in balans blijft.

Een 4/3-schuifventiel in ruststand heeft alle poorten gesloten. Beweegt de schuif van links naar rechts, dan komt de druk op poort 2 en gaat poort 4 naar de uitlaat. Beweegt hij terug, dan is het omgekeerd.

=== Open before close versus close before open <sec:close-before-open>

#wrap-figure(
  image("assets/OIS_close_before_open.png", width: 7.5cm),
  caption: [Close before open (schuifventiel) tegenover open before close (klepventiel).],
  label: <fig:close-before-open>,
)[
  Dit is het praktische onderscheid tussen beide bouwvormen tijdens het #strong[omschakelen]:

  - *Schuifventiel: close before open.* Eerst gaat de ene verbinding dicht, dan pas de andere open. Er is dus even een moment waarop #strong[niets] verbonden is (geen overlap, geen luchtverlies).
  - *Klepventiel: open before close.* De tweede toevoer gaat open vóór de eerste gesloten is. Er is dus even een moment waarop #strong[beide] verbonden zijn (klein luchtverlies tijdens de overgang).
]

== Het juiste ventiel kiezen

=== Fail-safe <sec:failsafe-ventielen>

Monostabiele ventielen keren met veerkracht terug naar de niet-bediende stand. Die veer kan pneumatisch, mechanisch of allebei zijn.

Voor mechanische veren definieert EN 13849 #keyterm[well-tried springs] en #keyterm[pressure coil springs]. Well-tried veren moeten goed geleid zijn, correct gefabriceerd (met pre-cycling), overgedimensioneerd, enzovoort.

#belangrijk[Denk tijdens het ontwerp aan twee dingen: eerst de veiligheid, dan het energieverbruik van het ventiel.]

#waarschuwing[
  In de elektriciteit betekent N.O. en N.C. iets eenduidigs. In de pneumatiek slaat "normally closed" soms op #strong[handbediende] ventielen of dempers die de operator in normaal bedrijf gesloten moet laten. Let dus op de context voor je een symbool interpreteert.
]

De keuze monostabiel of bistabiel volgt uit één vraag: #belangrijk[wat moet er gebeuren bij energieverlies?] Moet de cilinder terugkeren naar een veilige stand, dan neem je monostabiel. Moet hij blijven staan waar hij staat, dan neem je bistabiel, want dat is een geheugen.

=== Stroomverbruik van magneetventielen <sec:reduced-holding-current>

Een elektropneumatische ventielspoel is meestal $1$ tot $4 "W"$. Dat lijkt verwaarloosbaar, maar:
- een systeem kan héél veel ventielen hebben;
- #belangrijk[actieve ventielspoelen worden warm, en dat verkort hun levensduur].

Factoren die het verbruik bepalen, zijn onder meer de grootte van het ventiel: een te klein ventiel geeft een grote drukval en moet dus vaker of langer werken.

Een oplossing is #keyterm[reduced holding current]: de spoel krijgt eerst de volle stroom om te schakelen, en daarna een lagere stroom die alleen nog volstaat om de stand vást te houden.

== Veiligheid van ventielen

=== Gemonitorde veiligheidsventielen <sec:gemonitorde-ventielen>

#wrap-figure(
  image("assets/OIS_gemonitord_veiligheidsventiel_clean.png", width: 9cm),
  caption: [Gemonitord veiligheidsventiel met spoeldetectie.],
  label: <fig:gemonitord-ventiel>,
)[
  Een gemonitord veiligheidsventiel heeft #keyterm[spoeldetectie]: een sensor kijkt of de schuif effectief in de verwachte stand staat. Zo weet de besturing of de veiligheidsfunctie werkelijk uitgevoerd is, in plaats van alleen dat het commando gegeven is. Dat is het pneumatische equivalent van de EDM uit @sec:edm.
]

=== Het soft-startventiel <sec:soft-start>

Een #keyterm[soft-startventiel] brengt een installatie bij het opstarten "zachtjes" op druk. Het idee: een lagere begindruk geeft een veiliger opstart.

#waarschuwing[
  *Maar let op het effect op de logica.* De snelheidsregeling van een cilinder gaat uit van de #strong[volle tegendruk] op het moment van schakelen. Bij het opstarten kan die tegendruk $0$ zijn, omdat er tijdens de stilstand ontlucht is. De cilinder beweegt dan #belangrijk[te snel].

  Bovendien kan een lage stuurdruk bij intern gepiloteerde ventielen leiden tot onvolledige of trage schakelbewegingen.
]

=== Intern tegenover extern gepiloteerd <sec:intern-extern-pilot>

+ Bij een monostabiel ventiel verwacht je dat het naar de ruststand gaat zodra je de bediening wegneemt. Veel van die ventielen gebruiken echter perslucht in plaats van een echte veer, of allebei.
+ *Intern gepiloteerd* (bleed piloted): het ventiel gebruikt #strong[dezelfde] inkomende luchttoevoer als de hoofdstroom om te schakelen.
+ *Extern gepiloteerd* (pressure piloted): de stuurlucht komt via een #strong[apart] circuit.

Extern piloteren opent extra ontwerpmogelijkheden:
- je kan de stuurlucht meteen op volle druk zetten om betrouwbaar te schakelen, terwijl je de #strong[werkdruk] zacht opbouwt om de krachten op de cilinders laag te houden;
- een noodstop kan enkel de werkdruk afschakelen, of enkel de stuurlucht.

#belangrijk[Combineer een soft-startventiel niet met intern gepiloteerde ventielen.] Bij een intern gepiloteerd ventiel komt de schakeldruk uit dezelfde langzaam stijgende toevoer. Tijdens het opstarten is die druk te laag om betrouwbaar te schakelen, en bij een pneumatische veer is de veerkracht dan ook nog eens te zwak. Het gevolg zijn onvoorspelbare bewegingen precies op het moment dat er iemand aan de machine kan staan.

=== Vijf veelvoorkomende veiligheidsfuncties <sec:pneum-veiligheidsfuncties>

+ *Bescherming tegen onbedoeld starten.* Waarschijnlijk de meest voorkomende. Meestal met een speciaal pneumatisch veiligheidsventiel dat gecertificeerd is voor het vereiste performance level. Een eenvoudig magneetventiel met één ventielelement volstaat daarvoor niet.
+ *Ontluchten van het systeem.*
+ *De beweging omkeren.* Bij een laag vereist performance level volstaat een eenvoudig veerteruggesteld magneetventiel. Voor een hoger PL gebruik je #strong[redundante] ventielelementen, zo aangesloten dat de cilinder alleen uitschuift als beide elementen schakelen.
+ *De beweging blokkeren.*
+ *De snelheid begrenzen.*

Voor het vasthouden van een last kan je bovendien een #strong[externe rem] op de zuigerstang plaatsen, of een #strong[interne vergrendeling] gebruiken.

== Het persluchtsysteem

=== Opbouw van het persluchtsysteem <sec:persluchtsysteem>

#figure(
  image("assets/OIS_primaire_luchtbehandeling.png", width: 12cm),
  caption: [Primaire luchtbehandeling: filter, koeler, separator, drukvat en drukschakelaar, gevolgd door de secundaire behandeling aan de machine.],
  label: <fig:primaire-luchtbehandeling>,
)
  De keten van de #keyterm[primaire luchtbehandeling], in volgorde:

  $ "filter" arrow.r "koeler" arrow.r "separator" arrow.r "drukvat" arrow.r "drukschakelaar" arrow.r "belasting" $

  Daarna volgt bij de machine zelf de #strong[secundaire] behandeling.


=== Luchtkwaliteit <sec:luchtkwaliteit>

#keyterm[ISO 8573-1] specificeert de kwaliteit van perslucht met #strong[drie klassecijfers]. Bijvoorbeeld $1.7.1$ voor ademlucht:
- *1* = vaste deeltjes, maximaal $#"0,1" mu "m"$;
- *7* = water, niet gespecificeerd;
- *1* = olie, maximaal $#"0,01" "mg/m"^3$.

=== Water in perslucht <sec:water-in-perslucht>

Lucht is een mengsel van vooral zuurstof, stikstof en waterdamp. #belangrijk[Atmosferische lucht is nooit $100%$ droog.] Je drukt het watergehalte uit als het absolute gehalte $x$ in $"g"_(H_2 O) \/ "kg"$, of als relatieve vochtigheid RH in $%$.

*Het dauwpunt.* Het #keyterm[drukdauwpunt] (PDP, Pressure Dew Point) is de temperatuur waarbij de waterdamp in díe perslucht condenseert, bij een bepaalde druk, bijvoorbeeld $7 "bar"$.

- Ligt de omgevingstemperatuur #strong[hoger] dan het drukdauwpunt, dan vormt er zich geen water in de perslucht, enkel waterdamp.
- Ligt ze #strong[lager], dan condenseert er water in je leidingen.

#oefening(title: "Voorbeeld uit de slides")[
  Comprimeer je lucht van $50%$ RH van $1 "bar"$ naar $8 "bar"$, dan krijg je hete, #strong[verzadigde] lucht plus condensaat.

  Je kan dat condensaat verwijderen, maar de lucht blijft dan nog altijd verzadigd. Koudere lucht kan minder water vasthouden, dus een kleine temperatuurdaling van die hete lucht geeft #strong[opnieuw] condensatie.

  #belangrijk[Daarom droog je de lucht verder, en volstaat afscheiden alleen niet.]
]

*De gevolgen van vocht:*
- *corrosie* is het ergste gevolg: het verkort de levensduur van metalen onderdelen en versnelt roestvorming;
- *verstopping van stuurleidingen*, wat instrumenten slecht doet werken;
- schade aan pneumatisch gereedschap en stalen leidingen.

=== De luchtdroger <sec:luchtdroger>

Twee principes:
- *chemische absorptie*, die zeer droge lucht geeft;
- *koeling*, waarbij je de condensatietemperatuur verlaagt.

=== Secundaire luchtbehandeling en de FRL-unit

=== De drukregelaar aan de machine <sec:drukregelaar>

#wrap-figure(
  image("assets/OIS_drukregelaar_realiteit.png", width: 6.5cm),
  caption: [Ideale tegenover werkelijke drukregelaar: in de praktijk zakt de uitgangsdruk bij toenemend debiet.],
  label: <fig:drukregelaar-realiteit>,
)[
  De secundaire druk na compressie is typisch $8 "bar"$. Loopt er debiet door het leidingnet, dan krijg je drukvallen. Daardoor zou dezelfde machine zich #strong[anders gedragen] op een andere locatie, of wanneer andere toestellen meer of minder lucht gebruiken. De kracht van een zuiger zou dan variëren.

  #belangrijk[Daarom reduceer je de druk aan de machine zelf], zodat de machine altijd dezelfde, lagere druk ziet, ongeacht wat er in de rest van de fabriek gebeurt.

  Een perfecte reduceerklep zou een vlakke uitgangsdruk geven bij elk debiet. In werkelijkheid zakt $p_"uit"$ naarmate het debiet stijgt.
]

=== Filter en separator <sec:filter-separator>

#belangrijk[Een separator is géén filter.] Hij verwijdert olie of water, tot ongeveer $#"0,3" mu "m"$.

Wil je verder gaan, dan combineer je: eerst een filter tot $#"0,5" mu "m"$, daarna een microseparator tot $#"0,1" mu "m"$.

=== Het FRL-symbool ontleed <sec:frl-symbool>

#wrap-figure(
  image("assets/OIS_frl_symbool.png", width: 6.5cm),
  caption: [Het FRL-symbool ontleed: filter, drukregelaar, manometer en lubricator.],
  label: <fig:frl-symbool>,
)[
  De #keyterm[FRL]-unit (Filter, Regulator, Lubricator) is de secundaire luchtbehandeling aan de machine. Van links naar rechts in het volledige symbool:

  + *Filter of separator:* verwijdert deeltjes, om schuring van dichtingen en geleidingen te vermijden en om kleine doorgangen niet te verstoppen.
  + *Drukregelaar of reduceerklep:* stelt de gewenste druk in.
  + *Manometer:* nodig om die regelaar op de gewenste waarde te zetten, bijvoorbeeld $6 "bar"$.
  + *Lubricator:* alleen als de toepassing smering vraagt.

  Daarnaast bestaat er een vereenvoudigd FRL-symbool dat het geheel als één blok toont.
]

== Efficiëntie en kosten van perslucht

#belangrijk["Lucht is gratis, elektronen ook. Maar perslucht en elektriciteit zeker niet."]

=== Eenheden die je tegenkomt <sec:perslucht-eenheden>

- *CFM* (cubic feet per minute): $1 "m"^3\/"h" approx #"0,589" "CFM"$, en $1 "CFM" approx #"1,699" "m"^3\/"h"$.
- *psi:* $1 "bar" approx #"14,5" "psi"$. "psig" is de relatieve druk.
- *FAD* (Free Air Delivery): het debiet teruggerekend naar de begindruk en -temperatuur.
- *Net yield:* het volumedebiet bij werkdruk en -temperatuur.
- *SER* (Specific Energy Requirement): de hoeveelheid energie per geleverde hoeveelheid perslucht.

#belangrijk[FAD is niet gewoon het gemeten debiet aan de uitgang.] Het gemeten debiet wordt eerst teruggerekend naar het equivalente debiet dat je zou krijgen bij dezelfde begindruk en -temperatuur.

=== Het echte rendement <sec:perslucht-rendement>

Volgens het Sankey-diagram uit de slides wordt #belangrijk[$100%$ van de elektrische energie omgezet in warmte.] Volgens de thermodynamische conventies bevat de perslucht zelf geen energie.

Maar kan perslucht dan geen zuiger vooruitduwen en dus arbeid leveren? Jawel. De uitzettende perslucht neemt daarbij #strong[evenveel warmte uit de omgeving op] als er arbeid geleverd wordt.

#oefening(title: "Wat kost een kubieke meter perslucht?")[
  Uit de handleiding van een moderne compressor van $#"45,83" "kW"$:

  FAD $= 397 "m"^3\/"h"$ bij $#"6,9" "bar"$ relatief, dus ongeveer $#"7,81"$ ata. Daarmee levert hij $#"50,8" "m"^3\/"h"$ #strong[samengeperste] lucht, gerekend bij de begintemperatuur.

  De kostprijs per kubieke meter:
  $ (#"45,83" "kJ/s" dot 3600 "s/h")/(#"50,8" "m"^3"/h") = 3248 "kJ/m"^3 $

  En $3248 "kJ" approx #"3,6" "MJ" = 1 "kWh"$, ruwweg. #belangrijk[Eén kubieke meter perslucht op $#"6,9" "bar"$ kost dus ongeveer één kilowattuur.]
]

Over de hele levensduur van een persluchtinstallatie is #belangrijk[ongeveer $80%$ van de kosten energiekost.] De aankoop van de compressor is dus bijna irrelevant naast wat hij verbruikt. Het totale rendement van zo'n installatie ligt op $10%$ of lager, want de warmte wordt in de praktijk zelden gerecupereerd.

#figure(
  image("assets/OIS_sankey_perslucht.png", width: 8cm),
  caption: [Sankey-diagram van een persluchtinstallatie: nagenoeg alle elektrische energie eindigt als warmte.],
  label: <fig:sankey-perslucht>,
)

=== Verkeerd gebruik <sec:perslucht-verkeerd-gebruik>

Het voorbeeld uit de slides: perslucht gebruiken om een onderdeel schoon te blazen kost een fabriek $5000$ dollar per jaar. Met een lagedrukblazer zou dat maar $1085$ dollar per jaar zijn.

In Europa gaat #belangrijk[$10%$ van alle industriële elektriciteit] naar het maken van perslucht, goed voor $80 "TWh"$ per jaar. Moderne systemen bieden vaak de mogelijkheid om de vrijgekomen warmte te recupereren.

=== Pneumatiek tegenover elektrisch <sec:pneumatiek-vs-elektrisch>

De nadelen van perslucht die de slides opsommen:

- trage dynamica door de compressie;
- het gedraagt zich als een massa-veer-dempersysteem;
- beperkte krachten vergeleken met hydraulica. Heb je $10 "kN"$ nodig bij $6 "bar"$, dan is $A = F\/p approx #"0,017" "m"^2$, dus een zuigerdiameter van ongeveer $15 "cm"$. Dat is al fors;
- moeilijk om flexibel exact te positioneren;
- hoge energiekosten, ongeveer $10 times$ die van elektrisch;
- lawaai;
- laag rendement door warmteverliezen;
- veel lekken.

#belangrijk[Kies pneumatiek dus om zijn sterktes, niet uit gewoonte:] eenvoud, weinig onderdelen die falen, en geen vonk in een explosiegevaarlijke omgeving.
