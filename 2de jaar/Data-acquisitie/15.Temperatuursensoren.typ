#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/15.temperature.pdf | examenvragen 2016, 2017, 2019, 23-24, 25-26 | oefenvragen E14-E16

= Temperatuursensoren <ch:temperatuur>

== Mechanische thermometers <sec:mech-thermometer>

Een mechanische thermometer zet een temperatuur om in een lengte, een hoek of een druk. Er is geen elektronica nodig, maar de meting is traag.

- *Kwikthermometer:* kwik zet uit met de temperatuur, $Delta V = beta_p V_0 (T - T_0)$ met $beta_p = 18 dot 10^(-5) "/K"$. Het bereik is $0$ tot $300 degree "C"$, en met $30 "bar"$ stikstof boven het kwik tot $750 degree "C"$. De vertraging is $30$ tot $60 "s"$, dus een kwikthermometer past niet in een regelkring.
- *Bimetaalthermometer:* twee metalen met een verschillende uitzettingscoëfficiënt zijn op elkaar gelast. Bij opwarming buigt de strip door. De respons duurt minuten.
- *Vloeistofdrukthermometer:* een vloeistof (kwik, ether of petroleum) zet uit in een gesloten voeler. Een Bourdon-buis zet de drukstijging om in een wijzerbeweging.
- *Dampdrukthermometer:* hetzelfde principe, maar met een verzadigde damp (methaan, ether of kwik). Toepassing: thermostatische klep of thermisch geregelde klep (TT/TCV/TC/TV).

#figure(
  image("assets/L15-bimetaal.png", width: 11cm),
  caption: [Bimetaalthermostaat en spiraalvormige bimetaalthermometer (slide 6)],
  label: <fig:L15-bimetaal>,
)

Een bimetaalthermostaat schakelt de verwarming aan of uit. Dat heet *bang-bang* regeling. De temperatuur schiet door de traagheid voorbij de ingestelde waarde.

Een *anticipatieweerstand* verkleint die overshoot. Dat is een klein verwarmingselement bij de thermostaat. Het warmt de thermostaat extra op, zodat die denkt dat de kamer warmer is dan ze echt is. De verwarming valt daardoor iets vroeger uit.

#figure(
  image("assets/L15-anticipatie.png", width: 5.0cm),
  caption: [Overshoot verkleinen met een anticipatieweerstand (slide 7)],
  label: <fig:L15-anticipatie>,
)

== Weerstandsthermometers (RTD) <sec:rtd>

Een RTD (resistance temperature detector) meet temperatuur via de weerstand van een zuiver metaal. Die weerstand stijgt met de temperatuur.

#frm(
  "Weerstand van een RTD",
  $R(T) = R_0 (1 + alpha T + beta T^2 + dots)$,
  [Algemeen model voor een metaal. Platina is het populairst.],
)

met:
- $R_0$ --- weerstand bij $0 degree "C"$ [$Omega$]
- $alpha$, $beta$ --- materiaalconstanten [$1 \/ degree "C"$], [$1 \/ degree "C"^2$]
- $T$ --- temperatuur [$degree "C"$]

Het type bepaalt het bereik: dunne film tot $300 degree "C"$, gewikkelde draad tot $660 degree "C"$ en opgerolde draad tot $850 degree "C"$.

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L15-rtd-types.png", width: 100%),
    caption: [Dunne film, gewikkelde draad en opgerolde draad (slide 13)],
    label: <fig:L15-rtd-types>,
  ),
  figure(
    image("assets/L15-rtd-tabel.png", width: 100%),
    caption: [Materialen voor RTD's (slide 14)],
    label: <fig:L15-rtd-tabel>,
  ),
)

=== Pt100 en Ni100 <sec:pt100>

Een *Pt100* is een platina RTD met $100 Omega$ bij $0 degree "C"$. Het bereik is $-200$ tot $850 degree "C"$ en de gevoeligheid $0.38 Omega\/degree "C"$. De dynamica is eerste orde met tijdsconstante $tau$ van $0.1$ tot $1 "s"$. Met een beschermbuis is dat $5$ tot $10$ keer meer.

#frm(
  "Pt100",
  $R(T) = 100 + 0.390803 thin T - 5.802 dot 10^(-5) thin T^2$,
  [De niet-lineariteit is $3 %$ tussen $0$ en $400 degree "C"$ en $7 %$ tussen $0$ en $700 degree "C"$.],
)

Een *Ni100* heeft $100 Omega$ bij $0 degree "C"$, een bereik van $-60$ tot $160 degree "C"$ en een gevoeligheid van $0.5483 Omega\/degree "C"$.

#frm(
  "Ni100",
  $R(T) = 100 + 0.5485 thin T - 6.65 dot 10^(-4) T^2 + 2.805 dot 10^(-9) T^4 + 2 dot 10^(-15) T^6$,
  [Meer termen dan bij platina, want nikkel is minder lineair.],
)

#figure(
  image("assets/L15-pt100.png", width: 11cm),
  caption: [Pt100: weerstand en lineariteit in functie van de temperatuur (slide 15)],
  label: <fig:L15-pt100>,
)

*Voordelen:* eenvoudig, universeel, goedkoop en vervangbaar. *Nadelen:* het bereik stopt bij $850 degree "C"$ en de absolute nauwkeurigheid is $0.4 degree "C"$.

=== Zelfopwarming <sec:zelfopwarming>

De meetstroom door een RTD levert vermogen $P = I^2 R$ en dat warmt de sensor op. De meting wijkt dan af van de echte temperatuur. Je beperkt dit met koeling en een lagere voedingsspanning. De examenvragen vermelden ook *stroompulsen*.

#voorbeeld(title: "Zelfopwarming van een Pt100 in een brug")[
  *Gegeven:* Wheatstonebrug (@sec:wheatstonebrug) met $R = 100 Omega$, $Delta R = 0.1 Omega$ en $V_B = 10 "V"$.

  *Gevraagd:* meetstroom en vermogen in de sensor.

  *Oplossing:*
  - $I_R = V_B \/ 200.1 Omega = 50 "mA"$
  - $P = I_R^2 R = (0.050)^2 dot 100 = 0.25 "W" = 250 "mW"$

  Een opwarming met $10 "mW"$ geeft al $+0.3 degree "C"$ fout. Het vermogen van $250 "mW"$ is dus veel te groot.
]

#figure(
  image("assets/L15-pt100-meting.png", width: 5.5cm),
  caption: [Pt100 in een brug met een kleine stroom (slide 17)],
  label: <fig:L15-pt100-meting>,
)

=== Kabelweerstand <sec:kabelweerstand>

De kabels naar de sensor zijn in serie met de Pt100, dus de meter ziet hun weerstand erbij.

#voorbeeld(title: "Fout door kabelweerstand")[
  *Gegeven:* $alpha = 0.00385$ (DIN 43760), $R_0 = 100 Omega$ en kabelweerstand $L_1 + L_2 = 10 Omega$.

  *Gevraagd:* temperatuurfout.

  *Oplossing:*
  - Gevoeligheid: $0.00385 dot 100 = 0.385 Omega\/degree "C"$
  - Fout: $10 \/ 0.385 = 26 degree "C"$

  Een kabel van $10 "m"$ koper heeft ongeveer $0.5 Omega$. Dat is al meer dan $1 degree "C"$ fout bij een Pt100 (examenuitwerking).
]

De oplossing is een *4-draadsmeting* (Kelvin). Twee draden voeren de stroom, twee andere meten de spanning over de sensor zonder stroom. Daardoor valt de kabelweerstand weg (@sec:sc-bekabeling).

#figure(
  image("assets/L15-kabelweerstand.png", width: 6.5cm),
  caption: [Invloed van de kabelweerstand op de meting (slide 18)],
  label: <fig:L15-kabelweerstand>,
)

#examenvraag("2016 januari vraag 10", [Een RTD ...],
  opties: (
    [kan zelfopwarming vermijden met de 4-draadsmethode],
    [kan zelfopwarming vermijden met stroompulsen in plaats van een constante stroom],
    [heeft een bereik tot $1300 degree "C"$],
    [kan gebruikt worden als passieve sensor],
  ),
  juist: "B",
)[Stroompulsen houden het gemiddelde vermogen $I^2 R$ in de sensor klein. A is fout: 4-draads lost de kabelweerstand op, niet de zelfopwarming. C is fout: het bereik stopt bij $850 degree "C"$. D is fout: een RTD heeft excitatie nodig.]

#examenvraag("juni 2016 vraag 17", [Een RTD ...],
  opties: (
    [kan eigenwarming beperken door vierdraadsmeting],
    [kan temperaturen tot $1500 degree "C"$ meten],
    [kan gebruikt worden om een passieve sensor te bouwen],
    [kan eigenwarming beperken door stroompulsen in plaats van een continue stroom],
  ),
  juist: "D",
)[Stroompulsen beperken de eigenwarming. A is fout: 4-draads lost de kabelweerstand op. B is fout: de grens is $850 degree "C"$. C is fout: een RTD is actief.]

#examenvraag("25-26 vraag 19", [Met een RTD-temperatuursensor ...],
  opties: (
    [kan je een passieve sensor bouwen],
    [kan je de eigenopwarming beperken door met stroompulsen te meten],
    [kan je de eigenopwarming beperken met een vierdraadsmeting (Kelvin)],
    [kan je temperaturen tot $1500 degree "C"$ meten],
  ),
  juist: "B",
)[Dezelfde redenen als bij de vorige twee vragen.]

#examenvraag("oefenvraag E5", [Waarom meet je een Pt100 liefst met vier draden?],
  opties: (
    [om de zelfopwarming te beperken],
    [omdat de meetstroom en de spanningsmeting dan gescheiden zijn, zodat de kabelweerstand wegvalt],
    [om het bereik te vergroten],
    [om sneller te kunnen meten],
  ),
  juist: "B",
)[Twee draden voeren de stroom en twee draden meten de spanning bij een verwaarloosbare stroom. Zelfopwarming ($P = I^2 R$ in de sensor) is een ander probleem. Dat los je op met een kleinere stroom of met stroompulsen.]

== Thermistoren (NTC/PTC) <sec:thermistor>

Een halfgeleidersensor verandert sterk van weerstand met de temperatuur. Er zijn drie soorten.

*Siliciumweerstand:* $alpha = 0.7 Omega\/degree "C"$, lineariteit $plus.minus 0.5 %$, bereik $-65$ tot $200 degree "C"$, waarde $10 Omega$ tot $10 "k"Omega$ en tolerantie $1$ tot $20 %$.

*Thermistor:* keramiek of polymeer. Een *PTC* heeft in een beperkt bereik een zeer grote $alpha$. Hij dient als overbelastingsbeveiliging, bijvoorbeeld in motorwikkelingen. Bij een *NTC* daalt de weerstand met de temperatuur:

#frm(
  "NTC-thermistor",
  $R = R_0 e^(beta (1 / T - 1 / T_0))$,
  [Zeer gevoelig, maar sterk niet-lineair. De slide geeft $beta$ tussen ongeveer $3435$ en $4190 "K"$.],
)

met:
- $R_0$ --- weerstand bij de referentietemperatuur $T_0$ [$Omega$]
- $beta$ --- materiaalconstante [K]
- $T$, $T_0$ --- absolute temperatuur [K]

#figure(
  image("assets/L15-ntc.png", width: 12cm),
  caption: [NTC-curve en een schakeling die de uitgang lineariseert (slide 26)],
  label: <fig:L15-ntc>,
)

*Junctiesensor:* de spanning $V_(B E)$ over een transistor hangt af van de temperatuur, met $k = 1.38 dot 10^(-23) "J/K"$ en $q = 1.602 dot 10^(-19) "C"$:

#frm(
  "Basis-emitterspanning",
  $V_(B E) = (k T) / q ln(I_c / I_s)$,
  [Hangt ook af van $I_s$, en die verschilt per transistor.],
)

Met $N$ parallelle transistoren daalt de stroom per transistor tot $I_c \/ N$. Het verschil van de twee spanningen is dan onafhankelijk van $I_c$ en $I_s$:

#frm(
  "PTAT-spanning",
  $Delta V_(B E) = V_(B E) - V_N = (k T) / q ln N$,
  [Evenredig met de absolute temperatuur (PTAT).],
)

#figure(
  image("assets/L15-junction.png", width: 11.0cm),
  caption: [Eén transistor tegenover $N$ transistoren (slide 27)],
  label: <fig:L15-junction>,
)

De TMP35/36/37 werkt zo. Hij geeft $10 "mV"\/degree "C"$ (TMP35: $250 "mV"$ bij $25 degree "C"$) met $plus.minus 2 degree "C"$ fout. Het bereik is $-40$ tot $125 degree "C"$.

#examenvraag("2017 vraag 1", [PTAT-sensor: welke sensor is dit?])[
  PTAT staat voor proportional to absolute temperature. De uitgangsspanning is evenredig met de absolute temperatuur, typisch $10 "mV/K"$. Ze ontstaat uit het spanningsverschil van twee junctiespanningen met verschillende stroomdichtheid: $Delta V_(B E) = (k T \/ q) ln N$.
]

#examenvraag("oefenvraag E15", [Wat is het grootste voordeel van een thermistor (NTC) boven een Pt100, en wat het grootste nadeel?],
  opties: (
    [veel gevoeliger, maar sterk niet-lineair en beperkt bereik],
    [lineairder en groter bereik],
    [goedkoper maar trager],
    [geen excitatie nodig],
  ),
  juist: "A",
)[$R = R_0 e^(beta (1\/T - 1\/T_0))$ is exponentieel. Dat geeft een grote gevoeligheid rond één temperatuur, maar je hebt een tabel of een lineariserende schakeling nodig. Het bereik blijft beperkt (@fig:L15-overzicht). De Pt100 is bijna lineair van $-200$ tot $850 degree "C"$.]

== Stralingsthermometrie <sec:stralingsmeting>

Een pyrometer meet temperatuur zonder contact. Elk voorwerp straalt infrarood uit en de temperatuur volgt uit de straling, $T = f(E)$.

*Voordelen:* contactloos, tot $2500 degree "C"$, geschikt voor bewegende voorwerpen en een kleine thermische massa. *Nadelen:* blinkende voorwerpen zijn onmogelijk te meten en je meet alleen de oppervlaktetemperatuur.

De slides geven geen formule. Een oefenvraag gebruikt het vermogen $P = epsilon sigma A T^4$ met emissiviteit $epsilon$. Een blank metaal heeft $epsilon approx 0.1$ en geoxideerd staal $approx 0.8$. Een kleine $epsilon$ geeft weinig straling en dus een grote meetfout.

#examenvraag("oefenvraag E16", [Wat is de grootste foutbron bij een stralingsthermometer (pyrometer)?],
  opties: ([de afstand tot het object], [de emissiviteit van het oppervlak], [de omgevingstemperatuur], [de responstijd]),
  juist: "B",
)[De pyrometer meet $P$ en rekent terug naar $T$. Daarvoor moet hij $epsilon$ kennen. Stel je die verkeerd in, dan zit je er honderden graden naast. De afstand doet er niet toe, want het meetvlak groeit even snel als de intensiteit daalt.]

== Thermokoppels <sec:thermokoppel>

Een thermokoppel zet een temperatuurverschil om in een spanning. Dat gebeurt via het *Seebeck-effect* aan de las van twee verschillende metalen.

#frm(
  "Seebeck-spanning",
  $V = alpha_s T$,
  [De coëfficiënt $alpha_s$ hangt af van het metaal en van de temperatuur.],
)

met:
- $alpha_s$ --- Seebeckcoëfficiënt [$mu"V/K"$]
- $T$ --- temperatuur [K]

#figure(
  image("assets/L15-seebeck.png", width: 12cm),
  caption: [Seebeckcoëfficiënten van metalen en thermokoppels bij 273 K en 300 K (slide 37)],
  label: <fig:L15-seebeck>,
)

=== Meten met een thermokoppel <sec:tk-meten>

Om de spanning $V_(a b)$ van één las te meten, zit er een voltmeter in de lus. Die voegt een derde metaal C toe met twee extra juncties, $V_(a c)$ en $V_(b c)$.

#figure(
  image("assets/L15-tk-juncties.png", width: 7.5cm),
  caption: [Een extra metaal C geeft twee extra juncties (slide 35)],
  label: <fig:L15-tk-juncties>,
)

Daarom gebruik je twee juncties. Met $T_1 = T_2$ is $V_(a b) = -V_(b a)$ en met $T_3 = T_4$ is $V_(c a) = -V_(a c)$. Dan geldt $V_m = V_(c a) + V_(a b) + V_(b a) + V_(a c) = 0$.

In de normale opstelling houd je $T_3 = T_4$ en zet je $T_1 = 0 degree "C"$ in een ijsbad. Dan blijft over:

#frm(
  "Gemeten spanning",
  $V_m = V_(a b) + V_(b a)$,
  [De spanning is evenredig met het temperatuurverschil tussen de twee juncties, niet met de absolute temperatuur van één junctie.],
)

#figure(
  image("assets/L15-tk-twee.png", width: 10cm),
  caption: [Thermokoppel met twee juncties en een ijspunt (slide 36)],
  label: <fig:L15-tk-twee>,
)

=== Types <sec:tk-types>

#figure(
  image("assets/L15-tk-types.png", width: 13.0cm),
  caption: [Types thermokoppels: bereik, gevoeligheid en eigenschappen (slide 40)],
  label: <fig:L15-tk-types>,
)

Type K ($approx 40 mu"V"\/degree "C"$) is lineair en heeft een groot bereik. Type T is nauwkeurig tot $plus.minus 1 degree "C"$ en geschikt tot $-200 degree "C"$. Type J is goedkoop, type E is het gevoeligst en de platina-types S, R en B dienen voor hoge temperatuur maar zijn niet lineair.

=== Koude lasreferentie <sec:koude-las>

Een thermokoppel meet een verschil, dus je moet de temperatuur van de tweede las kennen. Er zijn drie manieren.

*IJsbad:* de referentielas ligt in smeltend ijs op $0 degree "C"$. Zo werkt de standaardmethode, maar ze is onhandig in de praktijk.

#figure(
  image("assets/L15-koudelas-ijs.png", width: 10cm),
  caption: [Referentielas in een ijsbad (slide 42)],
  label: <fig:L15-koudelas-ijs>,
)

*Temperatuursensor op een isotherm blok:* een sensor meet de temperatuur $T_2$ van de aansluitklemmen. Een compensatieschakeling telt daar een spanning $V_(c o m p) = f(T_2)$ bij op:

$ V_"out" = V(T_1) - V(T_2) + V_"comp" $

Is $V_"comp"$ gelijk aan $V(T_2) - V(0 degree "C")$, dan is $V_"out" = V(T_1) - V(0 degree "C")$. Het resultaat is dus alsof er een ijsbad was.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L15-koudelas-sensor.png", width: 100%),
    caption: [Compensatie met een temperatuursensor (slide 43)],
    label: <fig:L15-koudelas-sensor>,
  ),
  figure(
    image("assets/L15-koudelas-blok.png", width: 100%),
    caption: [De draden rechtstreeks op een isotherm blok eindigen (slide 44)],
    label: <fig:L15-koudelas-blok>,
  ),
)

*Geïntegreerde schakeling:* een TMP35 met een opamp (OP193) of een AD594/AD595 bouwt de compensatie in. De AD594/AD595 geeft $10 "mV"\/degree "C"$.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L15-koudelas-tmp35.png", width: 100%),
    caption: [Compensatie met TMP35 en OP193 (slide 45)],
    label: <fig:L15-koudelas-tmp35>,
  ),
  figure(
    image("assets/L15-koudelas-ad594.png", width: 100%),
    caption: [AD594/AD595 (slide 46)],
    label: <fig:L15-koudelas-ad594>,
  ),
)

*Voordelen:* eenvoudig, universeel, goedkoop, vervangbaar, tot $1700 degree "C"$ en explosieveilig met een transmitter in de kop. *Nadelen:* niet geschikt voor lage temperaturen en duur om nauwkeuriger te bekabelen.

#voorbeeld(title: "Type K met koude las op 25 °C (oefenvraag E14)")[
  *Gegeven:* gevoeligheid $41 mu"V"\/degree "C"$, gemeten $11.3 "mV"$, koude las op $25 degree "C"$.

  *Gevraagd:* temperatuur van de meetpunt.

  *Oplossing:*
  - De spanning is evenredig met $T_1 - T_2$: $11.3 "mV" \/ 41 mu"V"\/degree "C" = 275.6 degree "C"$.
  - Tel de koude las erbij: $275.6 + 25 approx 300 degree "C"$.
]

#examenvraag("2017 vraag 5", [Thermokoppels ...],
  opties: (
    [hebben altijd een ijsbad nodig],
    [hebben aansluitingen op het meettoestel die dezelfde temperatuur moeten hebben],
  ),
  juist: "B",
)[De aansluitingen vormen de extra juncties $V_(a c)$ en $V_(b c)$. Ze heffen elkaar alleen op bij dezelfde temperatuur, bijvoorbeeld op een isotherm blok. A is fout: een compensatieschakeling vervangt het ijsbad.]

#examenvraag("2019 vraag 4", [Thermokoppels ...],
  opties: (
    [kunnen niet onder $0 degree "C"$ meten],
    [kunnen een temperatuur van $1000 degree "C"$ meten],
    [zijn lineair],
  ),
  juist: "B",
)[Type K en N meten tot $1200 degree "C"$. A is fout: type T meet tot $-200 degree "C"$. C is fout: S en R zijn niet lineair.]

#examenvraag("2016 januari vraag 5", [Thermokoppels ...],
  opties: (
    [$V_"out"$ is lineair met $V_"in"$],
    [$V_"out"$ is lineair met het temperatuurverschil aan de junctie],
    [de meetuiteinden moeten dezelfde temperatuur hebben],
    [moeten altijd een ijsbad hebben],
  ),
  juist: "B",
)[Seebeck: de spanning is evenredig met het temperatuurverschil. A is fout: een thermokoppel is passief en heeft geen $V_"in"$. C is fout: gelijke temperatuur geldt voor de aansluitklemmen, niet voor de meetuiteinden. D is fout: een compensatieschakeling volstaat.]

#examenvraag("juni 2016 vraag 6", [Thermokoppels ...],
  opties: (
    [de uitgangsspanning is evenredig met het temperatuurverschil tussen 2 juncties],
    [de uitgangsspanning is evenredig met de excitatie],
    [er is steeds een ijsbad nodig],
    [beide aansluitingen moeten dezelfde temperatuur hebben],
  ),
  juist: "A",
)[Het koppel meet een verschil. Daarom is een koude lasreferentie nodig. B is fout: het koppel is passief. C is fout: een compensatieschakeling volstaat. D is hier fout geformuleerd, want de vraag gaat over de uitgangsspanning.]

#examenvraag("23-24 vraag 4", [Bij thermokoppels ...],
  opties: (
    [wordt ervoor gezorgd dat het temperatuurseffect van externe juncties verdwijnt],
    [is de resolutie afhankelijk van het type thermokoppel (K, L, ...)],
    [heb je altijd minstens 3 juncties nodig],
    [is de gevoeligheid onafhankelijk van de gemeten temperatuur],
  ),
  juist: "A",
)[Door de aansluitklemmen op dezelfde temperatuur te brengen vallen de extra juncties weg. C is fout: twee juncties volstaan. D is fout: $alpha_s$ hangt af van $T$ (@fig:L15-seebeck).]

#examenvraag("25-26 vraag 3", [Bij thermokoppels ...],
  opties: (
    [moet je altijd per 2 thermokoppels gebruiken],
    [kunnen geen temperaturen onder $0 degree "C"$ gemeten worden],
    [moet je beide aansluitingen aan het meettoestel op gelijke temperatuur houden],
    [is de uitgangsspanning recht evenredig met de excitatiespanning],
  ),
  juist: "C",
)[Dezelfde reden als bij 2017 vraag 5. B is fout: type T meet tot $-200 degree "C"$. D is fout: een thermokoppel is passief en heeft geen excitatie.]

#examenvraag("25-26 vraag 18", [Met thermokoppels ...],
  opties: (
    [kun je niet meten onder $0 degree "C"$],
    [kan je een temperatuur van $1000 degree "C"$ opmeten],
    [is de uitgangsspanning proportioneel met het temperatuurverschil tussen de twee juncties],
    [moet je altijd 2 externe juncties opmeten],
  ),
  juist: "C",
)[B is ook waar, maar C beschrijft het werkingsprincipe en gaat voor. Lees daarom alle opties voor je kiest. Bij 2019 vraag 4 stond C niet tussen de opties en was B het antwoord.]

#examenvraag("oefenvraag E14", [Een thermokoppel type K ($41 mu"V"\/degree "C"$) meet een oven. De koude las zit op $25 degree "C"$ en je meet $11.3 "mV"$. Hoe warm is de oven?],
  opties: ([$275 degree "C"$], [$300 degree "C"$], [$325 degree "C"$], [$11.3 degree "C"$]),
  juist: "B",
)[$T_"meet" - 25 = 11.3 dot 10^(-3) \/ (41 dot 10^(-6)) = 275 degree "C"$, dus $T_"meet" = 300 degree "C"$. Wie de koude las vergeet, komt op $275 degree "C"$ uit.]

=== Vergelijking van temperatuursensoren <sec:temp-vergelijking>

#figure(
  image("assets/L15-overzicht.png", width: 12.5cm),
  caption: [Vergelijking van thermistor, RTD, thermokoppel en halfgeleidersensor (slide 49)],
  label: <fig:L15-overzicht>,
)

#table(
  columns: 5,
  align: (left, center, center, center, center),
  table.header[][Thermistor][RTD][Thermokoppel][Halfgeleider],
  [Bereik [$degree "C"$]], [$-55$ tot $125$], [$-200$ tot $850$], [$-600$ tot $2000$], [$-50$ tot $150$],
  [Lineariteit], [exponentieel], [vrij lineair], [vrij lineair], [best],
  [Gevoeligheid], [hoog], [laag], [middel], [hoogst],
  [Respons], [snel], [traag], [snel tot traag], [traag],
  [Excitatie], [nodig], [nodig], [niet nodig], [nodig],
  [Zelfopwarming], [ja], [ja], [nee], [ja],
  [Kost], [laag], [laag tot hoog], [middel tot hoog], [laag tot middel],
)
