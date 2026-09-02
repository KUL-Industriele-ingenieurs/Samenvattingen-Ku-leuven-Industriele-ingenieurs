#import "../../school-template.typ": *

= Theorievragen <ch:theorievragen>

Wat er in de zittingen 2022 tot 2026 gevraagd is, uit `Overzicht Examenvragen Elektrische Energietechniek`, de examens in `Examen/` en de Studforum-wiki. Het deel netten bestaat elk jaar uit dezelfde vier bouwstenen: definities in één zin, een netstelsel tekenen, een gelijkrichter tekenen uit een grafiek, en een proefopstelling tekenen.

== Definities in één zin <sec:definities>

Elke zitting vraagt er twee, uit deze lijst.

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Begrip*], [*In één zin*]),
  table.hline(stroke: 0.5pt),
  [Elektriciteitsleverancier], [Verkoopt energie aan de eindklant en verzorgt de facturatie; hij bezit het net niet.],
  [Transmissienetbeheerder (TSO)], [Beheert en onderhoudt het hoogspanningsnet en houdt vraag en aanbod op elk moment in evenwicht.],
  [Transmissienet], [Het hoogspanningsnet dat grote vermogens over lange afstand transporteert tussen productie-eenheden en distributienetten.],
  [Doorslagspanning], [De spanning waarbij een isolator geleidend wordt en de isolatie bezwijkt.],
  [Nulpuntsverschuiving], [Het sterpunt van een onevenwichtige belasting komt niet meer op nulpotentiaal te liggen, waardoor de fasespanningen ongelijk worden.],
  [Onderbrekingsvermogen], [De grootste kortsluitstroom die een schakelapparaat nog veilig kan onderbreken zonder zelf te bezwijken.],
  [ATEX (Atmosphères Explosibles)], [De Europese regelgeving voor apparatuur in explosiegevaarlijke omgevingen.],
  [UPS (Uninterruptible Power Supply)], [Overbrugt een spanningsonderbreking met opgeslagen energie zodat de last blijft doorlopen.],
  [Distortion power factor], [De factor die aangeeft hoeveel de arbeidsfactor daalt door vervorming van de golfvorm, los van de fasehoek.],
  [Vermogenschakelaar], [Schakelt onder belasting én onderbreekt kortsluitstromen.],
  [Lastscheider], [Schakelt onder normale belasting en geeft een zichtbare scheiding, maar kan géén kortsluitstroom onderbreken.],
  table.hline(stroke: 1pt),
)

#belangrijk[Het verschil lastscheider tegenover vermogenschakelaar is een aparte vraag geweest.] Een lastscheider is gemaakt voor bedrijfsstromen en voor het veilig scheiden bij onderhoud; een vermogenschakelaar is gemaakt om ook de kortsluitstroom te breken en heeft daarvoor een vlamboogblusinrichting.

== Netstelsels tekenen <sec:netstelsels-examen>

Elke zitting: teken een net, verklaar de letters, en leg uit hoe je beveiligt tegen #strong[zowel] overstroom als elektrische schokken. Gevraagd zijn al TN-S, TN-C, TT en IT.

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Net*], [*Betekenis van de letters*], [*Beveiliging*]),
  table.hline(stroke: 0.5pt),
  [TT], [Bron geaard, verbruiker eigen lokale aarding], [Overstroom met zekering of automaat; schokken #strong[verplicht] met een RCD, want de aardweerstand is te hoog voor een zekering],
  [TN-C], [Bron geaard, behuizing aan de bron-nul; PE en N gecombineerd tot PEN], [Zekering of automaat volstaat voor allebei: een fout geeft een echte kortsluiting],
  [TN-S], [Idem, maar PE en N liggen apart], [Zoals TN-C, en een RCD is hier wél mogelijk omdat PE en N gescheiden zijn],
  [IT], [Bron niet geaard of via hoge impedantie, verbruiker lokaal geaard], [Isolatiewachter meldt de eerste fout; pas bij de tweede fout is afschakeling nodig],
  table.hline(stroke: 1pt),
)

Het voordeel van IT is #belangrijk[bedrijfscontinuïteit bij de eerste fout]: de kring is niet gesloten, dus er loopt nauwelijks stroom en de installatie blijft draaien terwijl je de fout opzoekt. Dat is waarom ziekenhuizen en continue processen het gebruiken.

Uitgewerkt bij @sec:aardingsnetten.

== De twee proeven tekenen <sec:proeven-examen>

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([], [*Nullastproef (NLP)*], [*Kortsluitproef (KSP)*]),
  table.hline(stroke: 0.5pt),
  [Secundaire zijde], [open], [kortgesloten],
  [Aangelegde spanning], [nominaal], [gereduceerd, tot $u_"sc"$],
  [Uitgevoerd aan], [meestal de laagspanningszijde], [meestal de hoogspanningszijde],
  [Levert], [$R_c$ en $X_m$: ijzerverlies en magnetisatie], [$R_"cc"$ en $X_"cc"$: koperverlies en lekreactantie],
  table.hline(stroke: 1pt),
)

In beide tekeningen zet je een voltmeter over de bron, een ampèremeter in serie met de primaire wikkeling, en een wattmeter met zijn spanningsspoel over de bron en zijn stroomspoel in de lijn. De uitwerking staat bij @ch:oefeningen.

#oefening(title: "Wat moet de voeding kunnen leveren?")[
  Deze meerkeuzevraag komt telkens terug. Gegeven een transformator $20 "kV"\/400 "V"$ met $u_"sc" = #"3,6" %$: welke minimale spanning en stroom moet je bron kunnen leveren voor de kortsluitproef en voor de nullastproef?

  *Kortsluitproef.* Je legt $u_"sc"$ van de nominale spanning aan en er loopt nominale stroom:
  $ V_"sc" = #"0,036" dot 20 "kV" = 720 "V" quad "bij" quad I_(1n) $

  *Nullastproef.* Je legt de volle nominale spanning aan, maar er loopt maar $i_0$ van de nominale stroom.

  #belangrijk[De KSP vraagt weinig spanning en veel stroom, de NLP veel spanning en weinig stroom.] Daarom doe je de NLP aan de laagspanningszijde en de KSP aan de hoogspanningszijde: dan blijven beide eisen haalbaar.
]

== Gelijkrichters tekenen uit een grafiek <sec:rectifier-examen>

Elk jaar krijg je een golfvorm en moet je het schema plus de last tekenen. Lees af in deze volgorde:

+ *Hoeveel pulsen per periode?* Twee bij een enkelfasige bruggelijkrichter, zes bij een driefasige.
+ *Wat doet de stroom tussen de pulsen?* Blijft ze vlak en continu doorlopen, dan is de last #strong[inductief]. Komt ze in korte, scherpe pieken, dan is de last #strong[capacitief]. Volgt ze de spanningsvorm, dan is ze resistief.
+ *Zit er een offset op?* Een vlakke spanning waar de stroom pas boven uit komt, wijst op een #strong[batterij] in de last.

Vraag daarbij was ook: waar zet je de stroommeter? In serie in de gelijkstroomkring, aan de gelijkgerichte zijde.

#examenbox[
  *Waarom ontbreekt de derde harmonische?* Bij een gelijkrichter met een even aantal pulsen $p$ blijven alleen de harmonischen $h = k p plus.minus 1$ over. Bij een zespulsgelijkrichter is dat $5, 7, 11, 13, ...$, dus geen derde. Bij een enkelfasige bruggelijkrichter blijven alleen de oneven harmonischen over, en de driehoekswikkeling van de voedende transformator sluit de derde bovendien kort.
]

Uitgewerkt bij @ch:diode-rectifiers.

== De meerkeuze <sec:meerkeuze-examen>

Er is #belangrijk[giscorrectie]: fout kost $-1\/3$, blanco kost niets. Het aantal vragen wisselt per zitting, van vier tot een twintigtal.

Wat in meerdere zittingen terugkwam:

- / Kloknummer bepalen: uit een getekende wikkelingsconfiguratie. Kwam in élke zitting terug, soms twee keer. Zie @sec:winding-configuraties.
- / Gevolg van de lekflux: die veroorzaakt de lekreactantie, en dus de spanningsval onder belasting. Ze draagt geen vermogen over.
- / Wat doet een RCD: de heen- en teruggaande stroom vergelijken en afschakelen bij verschil. Ook gevraagd: in welke netten hij verplicht is (TT), en welke van vier getekende aansluitingen correct zijn.
- / Wattmetervraag: gegeven $P$ en de door de meter gemeten arbeidsfactor, wat is de #strong[werkelijke] arbeidsfactor van de belasting? Zie @sec:wattmeter.
- / Homopolaire component: in welke schakeling zit er nooit een? In de lijnstroom van een sterschakeling zonder nulgeleider, en in de lijnspanning. Zie @sec:homopolair-bestaanbaarheid.
- / Power-quality-fenomeen herkennen uit een figuur: dip, swell, transiënt of flicker. Zie @ch:power-quality.
- / Stroomtransformator: waarom mag je de secundaire nooit openen terwijl er primaire stroom loopt? De primaire stroom blijft opgelegd door het net, dus de kern loopt in verzadiging en er staat een gevaarlijk hoge spanning over de open klemmen.
- / Commutatie-overlap: veroorzaakt door de lekinductantie van de transformator, waardoor twee diodes even tegelijk geleiden. Mitigeren doe je met een lagere netimpedantie of meer pulsen.
- / Parallel schakelen van transformatoren: kloknummer, wikkelingsverhouding, nominale spanning en kortsluitspanning moeten gelijk zijn. Zie @sec:oef-parallel.
- / Autotransformator: één wikkeling met een aftakking, dus compact en goedkoop, maar #strong[geen] galvanische scheiding. Typische toepassing: een regelbare labovoeding.
- / Scheidingstransformator: het voordeel is juist wél galvanische scheiding, zodat de secundaire zijde geen aardreferentie heeft en aanraking van één geleider geen kring sluit.
- / Olie in grote transformatoren: dubbele rol, isolatie én koeling.
- / BH-kromme: bij verzadiging geeft eenzelfde toename van $H$ een steeds kleinere toename van $B$, dus de permeabiliteit daalt. Zie @sec:BH-curve.
- / Doorsnede van de kern: hangt af van het kernmateriaal, de frequentie en de aangelegde spanning.

#oefening(title: "THD en de nulgeleider")[
  Deze berekening kwam in 2023, 2025 en 2026 terug. Gegeven een TN-C-net met $"THD"_i = 40 %$ en een grondharmonische $I_1 = 100 "A"$.

  *De effectiefwaarde van de lijnstroom.* De THD zet de harmonische inhoud af tegen de grondharmonische, dus
  $ I_"rms" = I_1 sqrt(1 + "THD"_i^2) = #"107,7" "A" $

  *De stroom in de nulgeleider.* De derde harmonische is een #strong[homopolaire] component: ze staat in de drie fasen in fase, dus ze telt in de nulgeleider driemaal op in plaats van weg te vallen.
  $ I_3 = "THD"_i dot I_1 = 40 "A" quad arrow.r quad I_N = 3 dot I_3 = 120 "A" $

  #belangrijk[De nulgeleider voert hier meer stroom dan elke fasegeleider zou doen op de derde harmonische alleen.] Daarom dimensioneer je hem in een net met veel niet-lineaire lasten niet lichter dan de fasen.
]

== Wat je zeker moet kennen zonder formularium <sec:zonder-formularium>

Op het formularium staat geen enkele transformatorformule, zie @sec:formularium-examen. Uit het hoofd:

- de namen van de drie vervangingsschema's: #strong[T-circuit], #strong[cantilever] (L-schema) en het #strong[serie-impedantiemodel] zonder magnetisatietak. De opgave verwijst ernaar bij naam;
- $I_(1n) = S_n\/V_(1n)$ en $Z_"basis" = V_(1n)^2\/S_n$;
- $R_"eq" = P_"sc"\/I_(1n)^2$ en $Z_"eq" = V_"sc"\/I_(1n)$;
- $R_c = V_(1n)^2\/P_0$, en de splitsing van $I_0$ in $I_c$ en $I_m$;
- $eta = P_"uit"\/(P_"uit" + P_"Cu" + P_"Fe")$, en maximaal rendement wanneer $P_"Fe" = x^2 P_"Cu,n"$;
- impedanties herleiden met $k^2$, en $k = V_1\/V_2 = N_1\/N_2$;
- het kloknummer aflezen uit een wikkelingstekening;
- $S = V I^*$, met de #strong[toegevoegde].
