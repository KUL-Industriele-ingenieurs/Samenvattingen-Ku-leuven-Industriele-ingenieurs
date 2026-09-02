#import "../../school-template.typ": *

= Toepassingen en constructie <ch:toepassingen-constructie>

Hoe een transformator gebouwd is, wat er op zijn kenplaat staat, en welke bijzondere uitvoeringen er bestaan. Uit dit hoofdstuk komen vijf terugkerende meerkeuzevragen, zie @sec:meerkeuze-examen.

== Constructie <sec:constructie>

Drie delen bepalen de bouw: de *kern*, de *wikkelingen* en de *koeling*.

#figure(
  scale(52%, reflow: true, merman.mermaid(
    ```
    flowchart TD
      T["Transformator"] --> K["Kern"] --> K1["Lamellen tegen wervelstromen"]
      K --> K2["Kerntype of manteltype"]
      T --> W["Wikkelingen"] --> W1["Concentrisch of sandwich"]
      W --> W2["Draad of folie"]
      W --> W3["Regelaftakkingen"]
      T --> C["Koeling"] --> C1["Droog of oliegevuld"]
      C --> C2["Koelklasse ONAN tot OFWF"]
    ```,
    theme: (fontSize: "30px"),
  )),
  caption: [De drie bouwdelen en de keuzes binnen elk.],
  label: <fig:constructie-overzicht>,
)

=== De kern <sec:kern-constructie>

De kern is opgebouwd uit dunne plaatjes elektroblik (siliciumstaal), onderling geïsoleerd. In het Nederlands heten die plaatjes *lamellen* en het geheel een *blikpakket*. De reden staat bij @sec:eddy-currents: een massieve kern zou grote wervelstromen rond laten lopen, en die kosten alleen maar warmte.

#wrap-figure(
  image("assets/DEE_kerntype_manteltype.png", width: 10cm),
  caption: [Kerntype tegenover manteltype],
  label: <fig:kerntype-manteltype>,
)[
  Twee bouwvormen:

  / Kerntype (core-type): de wikkelingen zitten rond de benen van de kern. De kern omsluit de wikkelingen niet.
  / Manteltype (shell-type): de kern omsluit de wikkelingen, die in het midden zitten. Er loopt dus ijzer rond de spoelen heen.

  Bij driefasige transformatoren komt daar de #strong[three-leg]- en #strong[five-leg]-uitvoering bij, zie @sec:topologieën.
]

=== De wikkelingen <sec:wikkelingen-constructie>

Hoe je hoog- en laagspanning ten opzichte van elkaar legt, bepaalt de lekinductantie.

#wrap-figure(
  image("assets/DEE_wikkelingen_concentrisch_sandwich.png", width: 8cm),
  caption: [Links concentrisch, rechts sandwich. Rood is HV, blauw is LV.],
  label: <fig:wikkelingen>,
)[
  / Concentrisch: de laagspanningswikkeling zit binnenin, de hoogspanningswikkeling eromheen. Één LV-cilinder, één HV-cilinder.
  / Sandwich: hoog- en laagspanning liggen afwisselend in lagen op elkaar, dus HV--LV--HV--LV--HV.

  Beide koppelen #belangrijk[beter dan hoog- en laagspanning op aparte benen], dus met minder lekinductantie. Sandwich haalt de laagste van de twee, want elke LV-laag ligt tussen twee HV-lagen.
]

#wrap-figure(
  image("assets/DEE_wikkelingstypes.png", width: 8cm),
  caption: [Subwikkelingen in serie of parallel],
  label: <fig:wikkelingstypes>,
)[
  Een wikkeling bestaat vaak uit meerdere #keyterm[subwikkelingen]. In *serie* verhogen ze de spanning, in *parallel* de stroom.

  Parallelle geleiders leg je zo dat elke tak over zijn lengte magnetisch even ver zit. Dat heet #keyterm[wikkelingstranspositie], en zonder dat zouden de takken verschillende impedanties hebben en zich de stroom ongelijk verdelen.
]

==== Draad tegenover folie <sec:draad-vs-folie>

#align(center)[
  #grid(
    columns: 2,
    gutter: 1cm,
    figure(
      image("assets/DEE_draad_vs_folie.png", width: 7cm),
      caption: [(A) draadwikkeling, (B) foliewikkeling],
      label: <fig:draad-vs-folie>,
    ),
    figure(
      image("assets/DEE_foliewikkeling_foto.png", width: 6cm),
      caption: [Een foliewikkeling in productie],
      label: <fig:foliewikkeling-foto>,
    ),
  )
]

Op @fig:draad-vs-folie zie je het verschil: bij (A) zitten honderd ronde draden naast en op elkaar, bij (B) is elke winding één brede, dunne koperfolie met een isolatielaagje ertussen.

#belangrijk[Folie kies je bij lage spanning en hoge stroom]: honderden volt, honderden tot duizenden ampère. Dat is precies de secundaire van een distributietransformator. Eén brede folie vervangt daar een bundel parallelle draden, en je hoeft dus ook niet te transponeren.

=== Regelaftakkingen <sec:aftakkingen>

#wrap-figure(
  image("assets/DEE_tapchanger_standen.png", width: 4.5cm),
  caption: [De standenschijf: elke stand hoort bij een spanning, hier $12470$ tot $11950 "V"$.],
  label: <fig:tap-changer>,
)[
  Een transformator heeft vaak extra aansluitpunten op de wikkeling, de #keyterm[regelaftakkingen] (voltage taps). Door een andere aftakking te kiezen verander je het aantal windingen, en dus de transformatieverhouding.

  De #keyterm[aftakschakelaar] (tap changer) kiest ertussen, in twee soorten:

  / NLTC (no-load tap changer): de transformator moet spanningsloos staan om te schakelen.
  / OLTC (on-load tap changer, lastschakelende aftakschakelaar): schakelt tijdens bedrijf, en kan dus deel uitmaken van een automatische spanningsregeling.
]

#align(center)[
  #grid(
    columns: 2,
    gutter: 1cm,
    figure(
      image("assets/DEE_tapchanger_kop.png", width: 7.5cm),
      caption: [De aftakkingen bovenop de wikkeling],
      label: <fig:tapchanger-kop>,
    ),
    figure(
      image("assets/DEE_tapchanger_mechanisme.png", width: 5cm),
      caption: [Het schakelmechanisme in de tank],
      label: <fig:tapchanger-mechanisme>,
    ),
  )
]

=== Koeling <sec:koeling>

#figure(
  image("assets/DEE_droog_vs_olie.png", width: 13cm),
  caption: [Droge transformator tegenover oliegevulde],
  label: <fig:droog-vs-olie>,
)

#align(center)[
  #table(
    columns: (auto, 1fr, 1fr),
    align: (left, left, left),
    stroke: none,
    inset: 5pt,
    table.hline(stroke: 1pt),
    table.header([], [*Droog (dry-type)*], [*Oliegevuld*]),
    table.hline(stroke: 0.5pt),
    [Koelmedium], [lucht], [olie],
    [Isolator], [epoxyhars], [olie],
    [Typisch voor], [lager vermogen, midden- tot laagspanning], [hoger vermogen en hogere spanning],
    [Sterkte], [veiligste keuze binnen], [efficiënter, compacter, langere levensduur],
    table.hline(stroke: 1pt),
  )
]

#examenbox[
  *Wat is de dubbele rol van olie in grote transformatoren?* #belangrijk[Isolatie én koeling.] Olie isoleert beter dan lucht, en verdrijft bovendien vocht en vuil die de doorslagvastheid zouden aantasten. Zie @fig:elektrisch-breakdown voor doorslagspanning.
]

De olie zelf komt in drie soorten:

- / Minerale olie: de goedkoopste isolatievloeistof.
- / Esterolie: natuurlijk of synthetisch, biologisch afbreekbaar bij een lek.
- / Siliconenolie: beste brandbestendigheid, dus waar binnenbrandveiligheid telt.

#figure(
  image("assets/DEE_olie_koelklassen.png", width: 80%),
  caption: [De vier koelklassen: ONAN, ONAF, OFAF en OFWF.],
  label: <fig:olie-koelklassen>,
)

De koelklasse is een code van #belangrijk[vier letters], twee paar. Het eerste paar beschrijft de olie binnenin, het tweede paar het medium dat de warmte naar buiten afvoert. Binnen elk paar zegt de eerste letter *welk medium* en de tweede *hoe het circuleert*.

#table(
  columns: (auto, auto, 1fr),
  align: (center, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Positie*], [*Letter*], [*Betekenis*]),
  table.hline(stroke: 0.5pt),
  [1], [`O`], [*Oil*, de olie binnen in de tank],
  [2], [`N`], [*Natural*, de olie circuleert vanzelf door convectie],
  [2], [`F`], [*Forced*, een pomp duwt de olie rond],
  [3], [`A`], [*Air*, de warmte gaat naar de buitenlucht],
  [3], [`W`], [*Water*, de warmte gaat naar water],
  [4], [`N`], [*Natural*, het buitenmedium beweegt vanzelf langs een radiator],
  [4], [`F`], [*Forced*, een ventilator of pomp jaagt het buitenmedium rond],
  table.hline(stroke: 1pt),
)

Daarmee lees je elke klasse letterlijk af:

#table(
  columns: (auto, auto, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Klasse*], [*Voluit*], [*Hoe het werkt*]),
  table.hline(stroke: 0.5pt),
  [`ONAN`],
  [Oil Natural, Air Natural],
  [Olie circuleert door convectie langs een radiator, de buitenlucht stroomt er vanzelf langs. Geen bewegende delen.],
  [`ONAF`],
  [Oil Natural, Air Forced],
  [Zelfde olieomloop, maar ventilators blazen op de radiator. Zo haal je meer vermogen uit dezelfde transformator.],
  [`OFAF`],
  [Oil Forced, Air Forced],
  [Een pomp stuurt de olie naar een externe warmtewisselaar, waar een ventilator op blaast.],
  [`OFWF`],
  [Oil Forced, Water Forced],
  [Zelfde, maar de warmtewisselaar geeft zijn warmte af aan doorstromend water in plaats van aan lucht.],
  table.hline(stroke: 1pt),
)

#belangrijk[Hoe verder in die tabel, hoe meer vermogen je uit dezelfde kern haalt], maar ook hoe meer hulpapparatuur: pompen en ventilators die zelf kunnen uitvallen en die je moet voeden en bewaken.


=== Veroudering van de isolatie <sec:isolatieveroudering>

Twee belastingen tasten de isolatie aan:

- / Elektrische belasting: #keyterm[partiële ontlading] (partial discharge). Dat is een lokale ontlading die de isolatie niet volledig overbrugt, meestal bij holtes, grensvlakken of vervuiling in het olie-papier-systeem. Ze ontbindt de isolatie plaatselijk en maakt daarbij gas.
- / Thermische belasting: warmte versnelt de veroudering.

#waarschuwing[
  Een isolatiefout, een vlamboog of oververhitting binnenin maakt gasbellen of een plotse oliestroom. Het #keyterm[Buchholzrelais] detecteert precies dat: gasophoping of een snelle beweging in de olie. Daarnaast bewaakt de beveiliging de overstroom, de differentiaalstroom en de temperatuur.
]

== Ratings en de kenplaat <sec:kenplaat-ratings>

#figure(
  image("assets/DEE_kenplaat.png", width: 15cm),
  caption: [Kenplaat van een transformator],
  label: <fig:kenplaat>,
)
Op de #keyterm[kenplaat] staan de gegevens waarmee je het vervangingsschema opbouwt (@ch:oefeningen):

- het *kloknummer* en de vectorgroep;
- de *nominale spanning*, met de aftakkingen als die er zijn;
- het *nominale schijnbaar vermogen* $S_n$, waaruit de nominale stroom volgt;
- de *frequentie*;
- de *kortsluitspanning* $u_"sc"$ in procent.

#belangrijk[Controleer zelf dat $V dot I$ aan beide zijden hetzelfde geeft], met de middelste spanningsaftakking. Dat is de ideale-transformatoraanname.


#examenbox[
  #belangrijk[Ken de volledige kenplaat.] De prof kan er een voorleggen en vragen: "wat kan je me over deze transformator vertellen?" of "wat is zijn rendement?". Je moet er dan zelf alles uit halen. De zes stappen staan hieronder.
]

=== Wat je uit een kenplaat haalt <sec:kenplaat-lezen>

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, left),
  stroke: none,
  inset: 7pt,
  table.hline(stroke: 1pt),
  table.header([*Wat*], [*Hoe*], [*Waar*]),
  table.hline(stroke: 0.5pt),

  [Type transformator],
  [Uit het kloknummer lees je de wikkelingsconfiguratie en de faseverschuiving. `Dyn11` is driehoek primair, ster secundair met uitgevoerde nul, $30 degree$ verschuiving.],
  [@sec:winding-configuraties],

  [Nominale stromen],
  [$I_n = S_n \/ (sqrt(3) dot V_n)$ driefasig, $I_n = S_n \/ V_n$ enkelfasig. Aan beide zijden.],
  [@sec:kenplaat-basis],

  [Vervangingsschema],
  [Uit $u_"sc"$, $i_0$, $P_0$ en $P_"sc"$.],
  [@sec:oef-vervangingsschema],

  [Rendement bij vollast],
  [$eta = P_"uit" \/ (P_"uit" + P_0 + P_"sc")$, met $P_"uit" = S_n cos phi$.],
  [@sec:oef-belasten],

  [Belastingsgraad voor maximaal rendement],
  [$x = sqrt(P_0 \/ P_"sc")$.],
  [@sec:oef-max-rendement],

  [Kortsluitstroom],
  [$I_"sc" = I_n \/ u_"sc"$. Bij $u_"sc" = 4 %$ is dat $25$ keer de nominale stroom.],
  [],

  table.hline(stroke: 1pt),
)

#waarschuwing[
  Staan de verliezen in het Duits, dan is *Leerlaufverluste* $= P_0$ (nullast, ijzer) en *Kurzschlussverluste* $= P_"sc"$ (kortsluiting, koper). *Load losses* zijn de twee samen.
]

De kortsluitspanning breidt het ideale model uit met een serie-impedantie, maar geeft alleen de #strong[grootte] ervan. Krijg je er de kortsluitverliezen bij, dan kan je die impedantie splitsen in een reëel en een imaginair deel.

=== Derating bij een lagere frequentie <sec:derating>

De kern is ontworpen voor een bepaalde frequentie, want de verzadigingsgrens van het materiaal ligt vast. De flux is

$ Phi = V / (j omega N) $

met:
- $Phi$: flux in de kern [Wb]
- $V$: aangelegde spanning [V]
- $omega = 2 pi f$: pulsatie [rad/s]
- $N$: aantal windingen [-]

Zak je met de frequentie, dan stijgt de flux bij dezelfde spanning, en dan loopt de kern in verzadiging. Je moet de spanning dus evenredig meeschalen. #belangrijk[Een transformator met $60 "Hz"$-ratings die je op $50 "Hz"$ gebruikt, mag nog maar $5\/6$ van zijn nominale spanning zien.] Dat heet #keyterm[voltage derating].

== Bijzondere uitvoeringen <sec:bijzondere-transformatoren>

=== Scheidingstransformator <sec:scheidingstransformator>

#wrap-figure(
  image("assets/DEE_scheidingstransformator.png", width: 8cm),
  caption: [Scheidingstransformator: elke zijde zijn eigen referentie],
  label: <fig:scheidingstransformator>,
)[
  Het doel is #belangrijk[galvanische scheiding], niet transformeren: de verhouding mag gerust $1:1$ zijn.

  Een transformator scheidt de common-mode-spanning tussen beide zijden. Elke zijde krijgt daardoor zijn eigen aardreferentie, die je aan een potentiaal naar keuze hangt of gewoon laat zweven, zoals in een IT-net (@sec:net-it).

  Twee redenen om er een te zetten: *veiligheid*, want wie één geleider aanraakt sluit geen kring meer, en *EMI*, want je onderbreekt het storingspad.
]

=== Autotransformator <sec:autotransformator>

#wrap-figure(
  image("assets/DEE_autotransformator_variac.png", width: 3.6cm),
  caption: [Een variac: aan het wiel draaien verschuift het sleepcontact over de wikkeling.],
  label: <fig:variac>,
)[
  "Auto" betekent hier *zelf*: er is maar #strong[één] wikkeling, met een aftakking die de secundaire spanning bepaalt. Primair en secundair delen dus een stuk wikkeling.

  #belangrijk[Er is geen galvanische scheiding.] Dat is het verschil met de scheidingstransformator hierboven, en meteen de reden waarom je hem niet gebruikt waar die scheiding een veiligheidsfunctie heeft.

  Let op de *stroomgrens* in plaats van op het vermogen: het vermogenskengetal is niet goed gedefinieerd, want het hangt af van de secundaire spanning die je instelt.

  De typische toepassing is een #strong[regelbare labovoeding] of *variac*, zoals op @fig:variac.
]

#figure(
  image("assets/DEE_autotransformator.png", width: 7cm),
  caption: [Schema van een autotransformator: primaire en secundaire zijde delen dezelfde wikkeling, en de aftakking bepaalt de verhouding.],
  label: <fig:autotransformator>,
)

=== Meettransformatoren <sec:meettransformatoren>

Om spanning en stroom in een hoogspanningsnet te meten zonder je meettoestel daaraan bloot te stellen, gebruik je een #keyterm[meettransformator]. Twee soorten, en ze werken tegengesteld.

#figure(
  image("assets/DEE_spanningstransformator_PT.png", width: 15cm),
  caption: [Spanningstransformator (PT)],
  label: <fig:pt>,
)
De #keyterm[spanningstransformator] (PT, potential transformer) meet spanning. Hij hangt #strong[parallel] over het te meten punt, levert weinig vermogen, en heeft een verhouding $N_1 \/ N_2 >> 1$: hij transformeert de hoge netspanning omlaag naar een meetbare waarde.


#figure(
  image("assets/DEE_stroomtransformator_CT.png", width: 15cm),
  caption: [Stroomtransformator (CT)],
  label: <fig:ct>,
)
De #keyterm[stroomtransformator] (CT, current transformer) meet stroom. Hij zit #strong[in serie] in de lijn, of als ring eromheen, en heeft een verhouding $N_1 \/ N_2 << 1$.

#belangrijk[De ingang van een CT is een stroombron, geen spanningsbron.] Het net legt de primaire stroom op, en daar verandert de CT niets aan.


#waarschuwing[
  *Open nooit de secundaire van een stroomtransformator terwijl er primaire stroom loopt.* Dit is een terugkerende examenvraag.

  De redenering: de primaire stroom $I_1$ blijft door het net opgelegd. Kan er secundair geen stroom lopen, dan moet die volledige $I_1$ als magnetiseringsstroom door de kern:

  $ I_phi approx I_1 $

  Daardoor loopt de kern diep in verzadiging en staat er een #strong[gevaarlijk hoge spanning] over de open klemmen. Na afloop houdt de kern bovendien een remanente flux over, wat de nauwkeurigheid aantast.

  #belangrijk[Sluit de klemmen dus kort vóór je iets loskoppelt.]
]

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  stroke: none,
  inset: 7pt,
  table.hline(stroke: 1pt),
  table.header([*Secundaire open: fout*], [*Kortgesloten: juist*]),
  table.hline(stroke: 0.5pt),
  [
    $I_phi approx I_1$, dus de volledige primaire stroom magnetiseert de kern.

    De kern gaat in verzadiging, er staat een gevaarlijk hoge $V'_2$ over de klemmen, en er blijft remanente flux achter.
  ],
  [
    De secundaire stroom compenseert de primaire flux, zoals bij elke belaste transformator.

    $V'_2$ blijft klein en de kern werkt in zijn lineaire gebied.
  ],
  table.hline(stroke: 1pt),
)

Een #keyterm[stroomtang] is een CT met een openklapbare kern. Die heeft meestal al een interne secundaire impedantie ingebouwd, wat hem veilig maakt, en geeft een #strong[spannings]uitgang. Voor nauwkeurige metingen vraagt een power analyzer daarentegen een echte stroomingang.

=== De differentieelschakelaar als transformator <sec:rcd-als-transformator>

#wrap-figure(
  image("assets/DEE_rcd_werking.png", width: 10cm),
  caption: [De RCD als ringkerntransformator],
  label: <fig:rcd-transformator>,
)[
  De #keyterm[RCD] uit @sec:rcd is eigenlijk een stroomtransformator. Alle geleiders lopen door één ringkern.

  Zijn de heen- en teruggaande stroom gelijk, dan heffen hun fluxen elkaar op en gebeurt er niets. Loopt er ergens stroom weg, dan blijft er een netto flux over, die een spanning induceert in een derde wikkeling. De stroom $I_3$ die daaruit volgt, bekrachtigt een relais dat een voorgespannen veermechanisme ontgrendelt, en dat trekt de contacten open.
]

=== Lastransformator <sec:lastransformator>

#wrap-figure(
  image("assets/DEE_lastransformator.png", width: 8cm),
  caption: [Lastransformator met magnetische shunt],
  label: <fig:lastransformator>,
)[
  Bij booglassen ($50$ tot $500 "A"$) is een grote #belangrijk[lekinductantie juist gewenst], terwijl je die overal elders zo klein mogelijk wil.

  De reden zit in de vlamboog. Om hem te ontsteken heb je bij lage stroom een relatief hoge spanning nodig. Zodra hij brandt wordt hij heter en dus geleidender, en zou de stroom op hol slaan. Een hoge serie-inductantie begrenst die stroom vanzelf: hoge ontsteekspanning, lage brandspanning.

  Je krijgt die lekinductantie door een instelbare *magnetische shunt* tussen de wikkelingen te schuiven.
]
