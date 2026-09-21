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

De magnetische kern heeft als primair doel om de magnetische flux $Phi$ met een zo hoog mogelijke permeabiliteit ($mu_r >> 1$) en minimale verliezen tussen de primaire en secundaire wikkelingen te geleiden. Afhankelijk van het vermogen, het aantal fasen, de frequentie en de nettopologie worden verschillende kernconstructies en materialen toegepast.

==== 1. Materiaal en Lamellering (Blikpakket) <sec:blikpakket>

De kern van een klassieke nettransformator ($50 "Hz"$) bestaat nooit uit een massief blok ijzer, maar wordt opgebouwd uit duizenden dunne gestapelde staalplaatjes: de #keyterm[lamellen] (laminations). Het samengeperste geheel noemt men het #keyterm[blikpakket] (laminated core).

#figure(
  image("assets/DEE_blikpakket_lamellen.png", width: 13cm),
  caption: [Constructie van een gelamelleerde transformatorkern: van losse gelakte siliciumstaalplaten naar getrapte kernbenen en een compleet samengespannen driefasig blikpakket.],
  label: <fig:blikpakket-productie>,
)

*Fysische achtergrond:*
- *Koudgewalst siliciumstaal (CRGO)*: Aan het weekijzer wordt ca. $3 %$ silicium toegevoegd. Silicium verhoogt de elektrische soortelijke weerstand $rho$ van het materiaal aanzienlijk (waardoor microscopische stroomkringen moeilijker ontstaan) zonder de magnetische geleidbaarheid ($mu_r approx 4000$) aan te tasten.
- *Onderdrukking van wervelstromen*: Zoals behandeld in @sec:eddy-currents zijn de wervelstroomverliezen kwadratisch evenredig met de plaatdikte $d$:
  $ P_("eddy") prop frac(f^2 dot B_("max")^2 dot d^2, rho) $
  Elke lamel heeft een typische dikte van slechts $0.23$ tot $0.35 "mm"$ en is aan weerszijden voorzien van een microscopisch dunne isolerende laklaag (Carlite). Door de dikte te delen door $10$, nemen de wervelstroomverliezen met een factor $100$ af!
- *Getrapte kerndoorsnede (Stepped core)*: Om ronde wikkelingen strak rond de rechthoekige lamellen te kunnen leggen zonder holle luchtruimtes, worden lamellen van afnemende breedte gestapeld tot een cirkelvormige doorsnede (kruis- of getrapte vorm, zie @fig:blikpakket-productie).

==== 2. Eénfasige basisvormen: Kerntype vs. Manteltype <sec:kerntype-manteltype>

Bij enkelfasige transformatoren onderscheiden we twee fundamentele geometrische bouwvormen:

#figure(
  image("assets/DEE_kerntype_manteltype.png", width: 12cm),
  caption: [Vergelijking van enkelfasige bouwvormen: links het kerntype (spoelen rond benen), rechts het manteltype (ijzerkern rond spoelen).],
  label: <fig:kerntype-manteltype>,
)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  align: (left, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Kenmerk*], [*Kerntype (Core-type)*], [*Manteltype (Shell-type)*]),
  table.hline(stroke: 0.5pt),
  [Opbouw], [De wikkelingen omsluiten de verticale benen van de kern.], [De ijzeren kern omsluit de wikkelingen (ijzer loopt rond de spoelen heen).],
  [Plaatsing spoelen], [Verdeeld over beide verticale benen (of concentrisch op één been).], [Geconcentreerd op het centrale middenbeen; de buitenste benen vormen de fluxretour.],
  [Magnetische fluxpaden], [Eén enkelvoudige magnetische gesloten kring.], [De flux van het middenbeen splitst zich in twee gelijke delen ($Phi / 2$) door de buitenste jukken.],
  [Mechanische sterkte], [Matig: wikkelingen liggen open aan de buitenkant.], [Zeer hoog: het omhullende ijzer beschermt spoelen uitstekend tegen mechanische kortsluitkrachten.],
  [Toepassingsgebied], [Typisch voor hoogspannings- en grote vermogenstransformatoren (betere koeling en eenvoudiger isolatieafstand).], [Veel gebruikt bij kleinere distributietransformatoren en toepassingen met strenge hoogtebeperkingen.],
  table.hline(stroke: 1pt),
)

==== 3. Driefasige Kernconfiguraties <sec:driefasige-kernen>

Bij driefasige netten kan men kiezen uit drie kernbenaderingen:

#v(0.6em)
*A. Driefasenbank (3 losse 1-fase transformatoren):* \
Drie identieke, fysiek gescheiden eenheden geschakeld in ster of driehoek.

#figure(
  image("assets/DEE_driefasenbank_3transfos.png", width: 6.5cm),
  caption: [Driefasenbank bestaande uit drie fysiek gescheiden enkelfasige eenheden.],
  label: <fig:driefasenbank-3transfos>,
)

- *Voordelen*: Goedkopere reserveonderdelen (slechts 1 enkelfasige reservetransfo nodig) en eenvoudiger modulair transport bij zeer grote vermogens ($> 500 "MVA"$).
- *Nadelen*: Niet-optimaal materiaalgebruik (3 aparte ijzerkringen) $==>$ zwaarder, groter grondoppervlak en grotere nullastverliezen.

#v(2em)
*B. Driebeenstransformator (Three-leg core):* \
Meest voorkomende industriële constructie: drie bewikkelde benen verbonden door een boven- en onderjuk.

#grid(
  columns: (1fr, 1.2fr),
  gutter: 0.8cm,
  align: horizon,
  figure(
    image("assets/3 Cores in 1.png", width: 4.8cm),
    caption: [Principe: drie kringen smelten samen omdat $sum Phi = 0$.],
    label: <fig:3cores-in-1>,
  ),
  figure(
    image("assets/3-leg transformator.png", width: 6.5cm),
    caption: [Vlakke driebeenstransformator (Three-leg core).],
    label: <fig:3leg-core>,
  ),
)

- *Symmetrisch bedrijf*: Omdat $V_A + V_B + V_C = 0$, is ook $Phi_A + Phi_B + Phi_C = 0$. Er is *geen retourbeen nodig*, wat fors bespaart op kernstaal t.o.v. losse eenheden.
- *Asymmetrie en aardfouten (Examenpunt!)*:
  #waarschuwing[
    *Gevaar voor tankverhitting (Tank Wall Heating)* \
    Homopolaire flux ($Phi_0$) heeft geen ijzeren retourpad in een 3-benige kern. De flux sluit zich noodgedwongen via de olie en de *stalen ketelwand*. Dit veroorzaakt zware wervelstromen, gevaarlijke keteloververhitting en een hoge magnetisatiestroom door de grote reluctantie van het oliepad.
  ]

#v(2em)
*C. Vijfbeenstransformator en Driefasig Manteltype:* \
Lossen de nadelen van de 3-benige kern op via extra magnetische retourpaden:

#figure(
  image("assets/DEE_other_topologies_slide.png", width: 12cm),
  caption: [Alternatieve driefasige topologieën: manteltype (links) en vijfbenige kern met retourbenen (rechts).],
  label: <fig:other-topologies-slide>,
)

- *Veilig retourpad*: De onbewikkelde buitenbenen (Leg 4 & 5) sluiten de homopolaire flux ($3 Phi_0 / 2$) veilig af door ijzer $==>$ geen ketelverhitting.
- *Jukreductie ($50 %$)*: Doordat de retourflux zich splitst ($Phi / 2$), kunnen boven- en onderjuk half zo dun zijn. Dit verlaagt de transporthoogte aanzienlijk (spoorbruggen/viaducten).

#figure(
  image("assets/DEE_five_leg_production.png", width: 7.5cm),
  caption: [Productiefoto: vijfbenige kern met drie centrale bewikkelde benen en twee onbewikkelde buitenste retourbenen.],
  label: <fig:five-leg-production>,
)

==== 4. Speciale Kernmaterialen en Bijzondere Uitvoeringsvormen <sec:speciale-kernen>
#v(0.8em)

#grid(
  columns: (1.3fr, 1fr),
  gutter: 0.8cm,
  align: horizon,
  [
    *A. Ferrietkernen (Hoogfrequente omvormers):*
    - *Toepassing*: Schakelende voedingen (SMPS) en omvormers bij $10 - 100 "kHz"$.
    - *Keramisch isolator*: Ferriet ($"Fe"_2 "O"_3$) geleidt geen stroom ($sigma approx 0$) $==>$ nagenoeg nul wervelstroomverliezen bij hoge frequenties.
    - *Zeer compact volume*: Volgens $A_c = V / (2 pi f N B_("sat"))$ daalt de kerndoorsnede omgekeerd evenredig met $f$ ($1000 times$ kleiner volume).
    - *Nadeel*: Lagere verzadigingsfluxdichtheid ($B_("sat") approx #"0,3" - #"0,5" "T"$).
  ],
  figure(
    image("assets/DEE_ferrietkern_omvormer.png", width: 4.8cm),
    caption: [HF-omvormer met compacte ferrietkern (10--100 kHz).],
    label: <fig:ferrietkern-omvormer>,
  ),
)

#v(1em)
*B. Ringkernen (Toroidal cores):*
- Naadloze ring zonder luchtspleten; veldlijnen blijven volledig binnen de kern $==>$ minimale lekinductantie en nagenoeg geen brom/magnetostrictie.
- *Toepassing*: Differentieelschakelaars (RCD), meetstroomtransformatoren (CT) en audioversterkers.

#v(1em)
*C. Beweegbare kern en magnetische shunt (Moving core):*
- Mechanisch verschuifbaar stuk weekijzer tussen primaire en secundaire wikkeling om bewust een grote regelbare lekinductantie $X_sigma$ te creëren.
- *Toepassing*: Booglastransformatoren om de vlamboogstroom stabiel te begrenzen.


=== De wikkelingen <sec:wikkelingen-constructie>

De wikkelingen vormen het actieve elektrische circuit van de transformator. Ze moeten voldoen aan drie strenge fysische randvoorwaarden:
1. *Elektrische isolatie*: bestand tegen hoge spanningen en diëlektrische doorslag (zowel tussen windingen onderling als ten opzichte van de geaarde ijzeren kern).
2. *Minimale lekinductantie*: een zo innig mogelijke magnetische koppeling tussen primaire en secundaire zijde ($X_sigma$ minimaliseren).
3. *Thermische en mechanische sterkte*: Joule-warmte ($I^2 R$) snel kunnen afvoeren en bestand zijn tegen enorme elektromagnetische krachten bij kortsluiting ($F prop I^2$).

==== 1. Geometrische Schikking: Concentrisch vs. Sandwich <sec:concentrisch-sandwich>

Hoe de hoogspanningswikkeling (HV) en laagspanningswikkeling (LV) ten opzichte van elkaar op het kernbeen worden geplaatst, bepaalt de lekflux:

#grid(
  columns: (1.25fr, 1fr),
  gutter: 0.8cm,
  align: horizon,
  [
    *Concentrische wikkelingen (Concentric):*
    - De wikkelingen worden als concentrische cilinders rond het been gelegd.
    - *Waarom zit LV altijd binnenin?* De laagspanningswikkeling (LV) wordt direct rond het geaarde kernbeen gelegd, en de hoogspanningswikkeling (HV) daar omheen. Omdat LV op een veel lagere potentiaal staat, volstaat een dunne isolatielaag naar het geaarde ijzer. Zou men HV aan de binnenkant leggen, dan was er een massieve, dure isolatieafstand tot de kern vereist!
    - Tussen LV en HV bevindt zich een stevige isolatiebarrière en een axiaal oliekanaal voor de koeling.

    *Sandwich wikkelingen (Interleaved):*
    - HV en LV worden opgesplitst in platte schijven die afwisselend boven elkaar worden gestapeld: HV--LV--HV--LV--HV.
    - *Laagste lekinductantie*: Doordat elke LV-schijf ingebed ligt tussen twee HV-schijven, zijn de lekfluxpaden zeer kort en sterk onderverdeeld. Sandwich realiseert hierdoor de laagst denkbare lekinductantie $X_sigma$.
  ],
  figure(
    image("assets/DEE_wikkelingen_concentrisch_sandwich.png", width: 7.2cm),
    caption: [Links concentrisch (LV binnenin, HV buiten), rechts sandwich (afwisselend HV en LV schijven).],
    label: <fig:wikkelingen-concentrisch-sandwich>,
  ),
)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Kenmerk*], [*Concentrisch (Concentric)*], [*Sandwich (Interleaved)*]),
  table.hline(stroke: 0.5pt),
  [Schikking op het been], [Cilinders over elkaar heen (LV binnen, HV buiten)], [Schijven afwisselend boven elkaar gestapeld],
  [Lekinductantie $X_sigma$], [Laag (standaard lekpad)], [Zeer laag (sterk onderverdeeld lekveld)],
  [Isolatiecomplexiteit], [Eenvoudig: slechts één grote barrière tussen LV en HV], [Complexer: meervoudige isolatielagen tussen schijven],
  [Toepassing], [Standaard bij kerntransformatoren (core-type)], [Veel gebruikt bij manteltransformatoren (shell-type)],
  table.hline(stroke: 1pt),
)

==== 2. Vorm van de Spoel: Schroefvormig (Helical) vs. Schijfvormig (Disc) <sec:helical-disc>

Binnen de gekozen schikking bepaalt de spoelvorm hoe de kopergeleiders gewikkeld worden:

#grid(
  columns: (1.25fr, 1fr),
  gutter: 0.8cm,
  align: horizon,
  [
    *Schroefvormig (Helical coil):*
    - De geleiders worden gewikkeld als een continue schroefspiraal in één of meerdere lagen langs de cilinder.
    - Typisch toegepast aan de *laagspanningszijde (LV)* waar de spanning laag is, maar de stroom zeer hoog. Er zijn relatief weinig windingen nodig, uitgevoerd met dikke geleiderdoorsnedes.

    *Schijfvormig (Disc winding):*
    - De wikkeling is opgebouwd uit tientallen afzonderlijke, platte schijfspoelen die horizontaal gestapeld zijn en in serie met elkaar verbonden worden.
    - Tussen opeenvolgende schijven worden afstandshouders (spacers) geplaatst, waardoor horizontale radiale oliekoelkanalen ontstaan.
    - Typisch toegepast aan de *hoogspanningszijde (HV)*:
      1. *Hoge diëlektrische sterkte*: De spanning tussen naburige windingen binnen één schijf blijft beperkt tot een fractie van de totale netspanning.
      2. *Superieure koeling*: De transformatorolie stroomt direct radiaal tussen de schijven door om hotspots effectief te koelen.
  ],
  figure(
    image("assets/DEE_wikkelingstypes.png", width: 7.2cm),
    caption: [Spoelvormen: links schroefvormig (Helical coil voor LV/grote stroom), rechts schijfvormig (Disc winding voor HV met radiale koelkanalen).],
    label: <fig:helical-disc>,
  ),
)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Kenmerk*], [*Schroefvormig (Helical)*], [*Schijfvormig (Disc)*]),
  table.hline(stroke: 0.5pt),
  [Spanningsniveau], [Laagspanning tot middenspanning (LV)], [Hoge spanning tot extra hoge spanning (HV)],
  [Stroomsterkte], [Zeer groot (honderden tot duizenden ampères)], [Matig tot groot],
  [Aantal windingen], [Relatief weinig windingen met dikke geleider], [Veel windingen verdeeld over schijven],
  [Koelmethode], [Axiale oliekanalen langs de binnen- en buitencilinder], [Horizontale radiale oliekanalen tussen elke schijf],
  [Typische toepassing], [Secundaire wikkeling van distributietransformatoren], [Primaire hoogspanningswikkeling van nettransformatoren],
  table.hline(stroke: 1pt),
)

==== 3. Geleidertype: Draadwikkeling vs. Foliewikkeling <sec:draad-vs-folie>

Afhankelijk van de stroomsterkte kiest men voor koperdraad of brede metaalfolie:

#align(center)[
  #grid(
    columns: 2,
    gutter: 1.2cm,
    figure(
      image("assets/DEE_draad_vs_folie.png", width: 7.2cm),
      caption: [Vergelijking: (A) draadwikkeling met ronde geleiders, (B) foliewikkeling over de volle bandbreedte.],
      label: <fig:draad-vs-folie>,
    ),
    figure(
      image("assets/DEE_foliewikkeling_foto.png", width: 6.2cm),
      caption: [Productie van een aluminium/koper foliewikkeling voor een distributietransformator.],
      label: <fig:foliewikkeling-foto>,
    ),
  )
]

- *Draadwikkeling (Wire wound)*: Opgebouwd uit ronde of rechthoekige geïsoleerde koperdraden (zie (A)). Geschikt voor hoge spanningen (HV) waar veel windingen nodig zijn en de stroomsterkte beperkt blijft.
- *Foliewikkeling (Foil wound)*: Eén brede koper- of aluminiumstrook gewikkeld over de volledige hoogte van het been (zie (B)), met een dunne isolatiefilm tussen elke slag.
  #belangrijk[
    *Waarom folie voor de secundaire van distributietransformatoren?* \
    1. *Grote stromen*: Uitstekend geschikt voor lage spanningen ($400 "V"$) en zeer grote stromen (honderden tot duizenden ampères). Eén brede folie vervangt een omslachtige bundel van parallelle draden.
    2. *Kortsluitveiligheid*: Bij kortsluiting treden gigantische elektromagnetische krachten op ($F prop I^2$). Doordat de stroom uniform verdeeld is over de volledige axiale hoogte van het been, zijn axiale mechanische afschuifkrachten nagenoeg afwezig!
  ]

==== 4. Subwikkelingen en Wikkelingstranspositie (CTC) <sec:transpositie>

Bij transformatoren met vermogens van meerdere megavoltampères kan men voor grote stromen geen massieve koperstaven gebruiken. Door het *skin-effect* en interne wervelstromen zou de stroom zich concentreren aan de randen, met enorme vermogensverliezen en lokale oververhitting tot gevolg.

- *Subwikkelingen*: Men verdeelt de geleider daarom in een bundel van tientallen parallelle, onderling geïsoleerde dunne koperstrips (subgeleiders).
- *Het probleem van circulating eddy currents*: Het magnetische lekveld is niet gelijkmatig verdeeld over het raam van de kern; binnenste geleiders omvatten minder lekflux dan buitenste geleiders. Zonder maatregelen zouden de parallelle aders ongelijke lekinductanties en geïnduceerde spanningen vertonen, waardoor er grote *circulerende stromen* tussen de parallelle takken gaan lopen die de wikkeling doen koken.
- *Wikkelingstranspositie (CTC: Continuously Transposed Conductor)*: Om dit tegen te gaan, worden de parallelle geleiders continu gevlochten (#keyterm[wikkelingstranspositie]). Elke strip wisselt cyclisch van positie van binnen naar buiten over de lengte van de spoel. Hierdoor omvat elke deelader over de totale lengte exact dezelfde lekflux en heeft exact dezelfde impedantie, waardoor kringstromen volledig geëlimineerd worden.

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
