#import "../../school-template.typ": *

// BRON: Slides/2.Sensoren_karakteristieken.pdf | Samenvatting DAQ p.5-9
//       Samenvatting 2024-2025 p.7-11 | voorbeeldexamen 2024 vraag 9

= Sensorkarakteristieken <ch:karakteristieken>

Een sensor is nooit perfect. Dit hoofdstuk beschrijft hoe je de afwijkingen van een sensor in getallen giet (statische en statistische karakteristieken), hoe je ze meet (kalibratie), hoe snel een sensor reageert (dynamische karakteristieken) en welke veiligheidsnormen er bestaan. Als rode draad gebruiken de slides een *Pt100*-temperatuursensor: een platinaweerstand van $100 thin Omega$ bij $0 degree"C"$.

== Statische karakteristieken <sec:systematisch>

Statische of *systematische* karakteristieken beschrijven hoe de uitgang van de sensor afhangt van de ingang als alles stilstaat. Je kan ze exact uitdrukken met een formule of een grafiek. Het meetsysteem zit tussen het proces (de *werkelijke waarde* van de grootheid) en de waarnemer (de *gemeten waarde*).

=== Bereik, span en ideale rechte <sec:ideale-rechte>

- Het *bereik* (range) is het gebied van de ingang, van $I_"min"$ tot $I_"max"$, en van de uitgang, van $O_"min"$ tot $O_"max"$.
- De *span* is de breedte van dat bereik: $I_"max" - I_"min"$ en $O_"max" - O_"min"$.

In het ideale geval is de uitgang een rechte van de ingang. Die *ideale rechte* gaat door de twee eindpunten $(I_"min", O_"min")$ en $(I_"max", O_"max")$:

#frm(
  "Ideale rechte",
  $O_"ideal" = K I + a quad "met" quad K = (O_"max" - O_"min") / (I_"max" - I_"min") quad "en" quad a = O_"min" - K I_"min"$,
  [De ideale rechte door de twee eindpunten van het bereik.],
)

met:
- $O$ --- uitgang van de sensor [eenheid van de uitgang]
- $I$ --- ingang, de te meten grootheid [eenheid van de ingang]
- $K$ --- helling van de ideale rechte [uitgang/ingang]
- $a$ --- snijpunt met de as $I = 0$ [eenheid van de uitgang]

Omdat twee punten een rechte vastleggen, heb je voor een ideaal lineaire sensor genoeg aan de span van in- en uitgang. Het zelfde verband schrijf je ook als
$ O - O_"min" = (O_"max" - O_"min") / (I_"max" - I_"min") (I - I_"min") $

#voorbeeld(title: "Druksensor met 4--16 mA-uitgang (slide 13)")[
  Een druksensor heeft een bereik van $0$ tot $104 "Pa"$ en een uitgang van $4$ tot $16 "mA"$. Geef de ideale rechte.

  *Stap 1 --- eindpunten:* $(I_"min", O_"min") = (0, 4)$ en $(I_"max", O_"max") = (104, 16)$.

  *Stap 2 --- invullen:*
  $ O = (16 - 4) / (104 - 0) (I - 0) + 4 = 0.11538 thin I + 4 $

  *Kerninzicht:* $K = 0.11538 "mA/Pa"$ is de gevoeligheid, $a = 4 "mA"$ is de uitgang bij nul druk.
]

#voorbeeld(title: "Pt102 uit de datasheet (slide 14)")[
  De Pt102 werkt van $14 "K"$ tot $873 "K"$ en zijn weerstand gaat dan van ongeveer $2 thin Omega$ naar $250 thin Omega$. De ideale rechte door die eindpunten is
  $ O = 2 + (250 - 2) / (873 - 14) (I - 14) = 2 + 0.289 thin (I - 14) quad [Omega] $

  *Kerninzicht:* de echte curve uit de datasheet buigt af van deze rechte, vooral bij lage temperatuur. Dat verschil is de niet-lineariteit.
]

#examenbox[*Voorbeeldexamen 2024 vraag 9:* "Een ideaal lineair sensormodel heeft ..." Juist: *enkel de span van in- en uitgang nodig om de parameters te bepalen.* Twee punten leggen de rechte vast; een derde punt heb je pas nodig voor de niet-lineariteit. "Een gevoeligheid die afhangt van het bereik" is fout: bij een lineair model is $K$ per definitie constant.]

=== Niet-lineariteit <sec:niet-lineariteit>

In werkelijkheid wijkt de uitgang $O(I)$ af van de ideale rechte. Het verschil is de *niet-lineariteit* $N(I)$:

#frm(
  "Niet-lineariteit",
  $N(I) = O(I) - (K I + a) quad quad "max. niet-lineariteit" = hat(N) / (O_"max" - O_"min") dot 100 %$,
  [Afwijking van de ideale rechte, en de grootste afwijking als percentage van de volle schaal (f.s.d., full scale deflection).],
)

met:
- $N(I)$ --- niet-lineaire term [eenheid van de uitgang]
- $hat(N)$ --- grootste waarde van $|N(I)|$ over het bereik [eenheid van de uitgang]

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (7, 4.5),
      x-label: [$I$],
      y-label: [$O$],
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      x-tick-step: none, y-tick-step: none,
      x-grid: true, y-grid: true,
      legend: "inner-north-west",
      {
        plot.add(domain: (0, 10), x => x, style: (stroke: (paint: schoolGray, dash: "dashed", thickness: 1.2pt)), label: [ideaal $K I + a$])
        plot.add(domain: (0, 10), x => x - 0.08 * x * (10 - x), style: (stroke: schoolBlue + 1.5pt), label: [werkelijk $O(I)$])
        plot.add(((5, 3), (5, 5)), style: (stroke: schoolRed + 1.5pt), label: [$hat(N)$ bij $I = 5$])
      },
    )
  })
]

#waarschuwing[Lineariteit heeft alleen betekenis tegenover een referentie. "Deze sensor is 1 % lineair" zegt niets als je niet weet ten opzichte van welke rechte.]

=== Typische modellen <sec:modellen>

Niet elke sensor is (bijna) lineair. Voor de transferfunctie gebruik je een van deze modellen:

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  [
    - lineair: $O = a + K I$
    - logaritmisch: $O = a + K ln(I)$
    - exponentieel: $O = a e^(k I)$
    - machtsfunctie: $O = a_0 + a_1 I^k$
  ],
  figure(
    image("assets/L2-modellen.png", width: 5.5cm),
    caption: [Lineair, logaritmisch en exponentieel verband (slide 16)],
    label: <fig:L2-modellen>,
  ),
)

=== Omgevingseffecten <sec:omgevingseffecten>

De uitgang hangt niet alleen af van de ingang $I$. Ook de omgeving speelt mee, meestal de temperatuur. Dat kan op twee manieren:

- Een *modificerende ingang* $I_M$ verandert de *helling*: de gevoeligheid wordt $K + K_M I_M$. Het effect is evenredig met $I$ zelf, dus de term is $K_M I_M I$.
- Een *interfererende ingang* $I_I$ *verschuift* de hele rechte: er komt een bias $K_I I_I$ bij, los van $I$.

#figure(
  image("assets/L2-omgevingseffecten.png", width: 12cm),
  caption: [(a) Een modificerende ingang verandert de helling, (b) een interfererende ingang verschuift het nulpunt. Telkens bij 10, 20 en 30 °C (slide 20)],
  label: <fig:L2-omgevingseffecten>,
)

Samen met de niet-lineariteit geeft dat het *generieke model* van een sensor. Dit model komt in de rest van het hoofdstuk steeds terug:

#frm(
  "Generiek sensormodel",
  $O = K I + a + N(I) + K_M I_M I + K_I I_I$,
  [Ideale rechte + niet-lineariteit + modificerend effect + interfererend effect.],
)

met:
- $I_M$ --- modificerende ingang, bv. een temperatuurverschil [eenheid van $I_M$]
- $K_M$ --- gevoeligheid voor de modificerende ingang [uitgang/(ingang $dot$ eenheid $I_M$)]
- $I_I$ --- interfererende ingang [eenheid van $I_I$]
- $K_I$ --- gevoeligheid voor de interfererende ingang [uitgang/eenheid $I_I$]

Bij de Pt100 is een magneetveld zo'n interfererende ingang: de datasheet geeft een kleine fout die groeit met het veld $B$ (slide 21). Daarom zijn platinasensoren pas boven $30 "K"$ bruikbaar in een magneetveld.

=== Gevoeligheid <sec:gevoeligheid>

De *gevoeligheid* (sensitivity) zegt hoeveel de uitgang verandert per eenheid ingang. Je vindt ze door het generieke model af te leiden naar $I$:

#frm(
  "Gevoeligheid",
  $(Delta O) / (Delta I) = K + (d N(I)) / (d I) + K_M I_M$,
  [Bij een lineaire sensor zonder omgevingseffect blijft enkel $K$ over.],
)

Hoe steiler de curve, hoe gevoeliger de sensor. Is de sensor niet-lineair, dan hangt de gevoeligheid af van het werkpunt. Bij een thermokoppel is ze $35 thin mu"V/"degree"C"$ rond $100 degree"C"$ en $42 thin mu"V/"degree"C"$ rond $200 degree"C"$:

#figure(
  image("assets/L2-gevoeligheid.png", width: 8cm),
  caption: [De helling van een thermokoppelcurve verschilt per werkpunt (slide 22)],
  label: <fig:L2-gevoeligheid>,
)

=== Hysteresis <sec:hysteresis>

Bij *hysteresis* hangt de uitgang af van de richting waarin je de ingang verandert. Bij stijgende ingang ($I arrow.t$) meet je iets anders dan bij dalende ingang ($I arrow.b$), bij dezelfde waarde van $I$:

#frm(
  "Hysteresis",
  $H(I) = O(I)_(I arrow.b) - O(I)_(I arrow.t) quad quad "max. hysteresis" = hat(H) / (O_"max" - O_"min") dot 100 %$,
  [Verschil tussen de dalende en de stijgende curve, en het maximum als percentage van de volle schaal.],
)

#figure(
  image("assets/L2-hysteresis.png", width: 11cm),
  caption: [Hysteresislus (links) en het verloop van $H(I)$ over het bereik (rechts) (slide 24)],
  label: <fig:L2-hysteresis>,
)

Hysteresis moet je zo klein mogelijk houden. Corrigeren in software kan, maar is lastig, want je moet onthouden uit welke richting de meting kwam.

=== Repeteerbaarheid, reproduceerbaarheid en precisie <sec:precisie>

- *Repeteerbaarheid*: de sensor geeft dezelfde uitgang als je dezelfde meting meerdere keren herhaalt *onder dezelfde omstandigheden*.
- *Reproduceerbaarheid*: de spreiding als de omstandigheden wél veranderen: een andere waarnemer, ander instrument, andere kalibratie, andere omgeving of een langere tijd tussen de metingen.
- *Precisie* omvat beide.

Precisie is iets anders dan nauwkeurigheid. Een sensor kan steeds hetzelfde (verkeerde) resultaat geven:

#figure(
  image("assets/L2-precisie-schijven.png", width: 12cm),
  caption: [Nauwkeurig en/of repeteerbaar: de schoten liggen dicht bij het midden (nauwkeurig) of dicht bij elkaar (repeteerbaar) (slide 25)],
  label: <fig:L2-precisie-schijven>,
)

=== Resolutie <sec:resolutie>

De *resolutie* is de grootste verandering van de ingang $I$ waarbij de uitgang $O$ nog niet verandert. Het is dus de kleinste verandering die je kan detecteren. Drie bronnen uit de slides:
- *speling* (backlash): bij tandwielen beweegt de uitgang pas als de speling is overbrugd;
- een *ADC*: de uitgang springt in discrete stappen, de kwantisatie (@ch:adc);
- een *gewikkelde potentiometer*: de loper springt van winding naar winding (@ch:potentiometer).

#figure(
  image("assets/L2-backlash.png", width: 10cm),
  caption: [Speling tussen twee tandwielen: bij omkeren van de beweging draait de uitgang eerst niet mee (slide 27)],
  label: <fig:L2-backlash>,
)

=== Nauwkeurigheid en totale foutband <sec:foutband>

De *nauwkeurigheid* (accuracy) zegt hoe dicht de gemeten waarde bij de werkelijke waarde ligt. Alle effecten hierboven tellen mee. Fabrikanten geven daarom vaak één getal: de *totale foutband*. De uitgang ligt met grote waarschijnlijkheid binnen $plus.minus h$ rond de ideale waarde.

#grid(
  columns: (1.3fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L2-foutband.png", width: 100%),
    caption: [Foutband $plus.minus h$ rond de ideale rechte, en de bijhorende rechthoekige verdeling (slide 29)],
    label: <fig:L2-foutband>,
  ),
  figure(
    image("assets/L2-foutband-componenten.png", width: 100%),
    caption: [Wat er in de totale foutband zit (slide 29)],
    label: <fig:L2-foutband-componenten>,
  ),
)

In de totale foutband zitten: niet-lineariteit, niet-repeteerbaarheid, hysteresis, nulpuntsafwijking (zero offset), afwijking van de span (span offset), en de verschuiving van nulpunt en span door temperatuur (zero en span temp shift).

== Kalibratie <sec:kalibratie>

=== Theoretische procedure <sec:kalibratie-theorie>

Kalibreren betekent: de parameters van het generieke model bepalen,
$ O = K I + a + N(I) + K_M I_M I + K_I I_I $
Daarvoor moet je zowel de ingangen $I$, $I_M$, $I_I$ als de uitgang $O$ nauwkeurig kennen. Je meet ze met *standaardinstrumenten*:

#figure(
  image("assets/L2-kalibratie-opstelling.png", width: 9cm),
  caption: [Elke ingang en de uitgang wordt gemeten met een standaardinstrument (slide 32)],
  label: <fig:L2-kalibratie-opstelling>,
)

Een standaardinstrument moet nauwkeuriger zijn dan wat je wil bereiken. Dat geeft een hiërarchie: het instrument op elk niveau wordt gekalibreerd met het niveau erboven, tot aan de SI-basiseenheden.

#figure(
  image("assets/L2-kalibratie-standaarden.png", width: 6.5cm),
  caption: [Kalibratiehiërarchie voor druk: primaire standaard (drukbalans van het NPL), transferstandaard (deadweight tester), labostandaard (standaardmanometer) en het element dat je kalibreert. Hoe hoger, hoe nauwkeuriger (en duurder) (slide 32)],
  label: <fig:L2-kalibratie-standaarden>,
)

De kalibratie van het generieke model verloopt in drie stappen.

*Stap 1 --- $O$ in functie van $I$, zonder omgevingseffect.* Houd $I_M = I_I = 0$ en meet $O$ bij verschillende waarden van $I$. Daaruit volgen $K$ en $a$, en eventueel $N(I)$. Meet zowel bij stijgende als bij dalende $I$, dan zie je ook de hysteresis.

#figure(
  image("assets/L2-kalibratie-op-neer.png", width: 9cm),
  caption: [Meetpunten bij stijgende (up) en dalende (down) ingang: (a) met hysteresis, (b) zonder (slide 34)],
  label: <fig:L2-kalibratie-op-neer>,
)

Is de sensor niet-lineair, dan benader je $N(I)$ op een van twee manieren:
- *stuksgewijs lineair*: de curve opdelen in rechte stukken. Eenvoudig te implementeren.
- *polynoom*: een veelterm (of een breuk van veeltermen, een rationale functie) door de punten fitten. Nauwkeuriger.

#figure(
  image("assets/L2-piecewise.png", width: 8cm),
  caption: [Stuksgewijs lineaire benadering van een niet-lineaire kalibratiecurve (slide 35)],
  label: <fig:L2-piecewise>,
)

*Stap 2 --- de omgevingsgevoeligheden $K_I$ en $K_M$.* Verander nu $I_M$ en $I_I$ met een gekende hoeveelheid $Delta I_(I,M)$ (bv. de temperatuur) en houd $I$ vast.

+ Bij $I = 0$ valt de modificerende term $K_M I_M I$ weg. Wat overblijft is het interfererende effect:
  $ K_I = (Delta O) / (Delta I_I) $
+ Bij $I = (I_"min" + I_"max") / 2$ (midden van het bereik) spelen beide effecten:
  $ Delta O = K_I Delta I_(I,M) + K_M Delta I_(I,M) (I_"min" + I_"max") / 2 $
  Met $K_I$ uit de eerste meting volgt
  $ K_M = 2 / (I_"min" + I_"max") [(Delta O) / (Delta I_(I,M)) - K_I] $

*Stap 3 --- repeteerbaarheid.* Herhaal dezelfde meting $N$ keer. Het gemiddelde en de standaardafwijking van de uitgang zeggen hoe repeteerbaar de sensor is:

#frm(
  "Gemiddelde en standaardafwijking",
  $overline(O) = 1/N sum_(k=1)^N O_k quad quad sigma_O = sqrt(1/N sum_(k=1)^N (O_k - overline(O))^2)$,
  [Een kleine $sigma_O$ betekent een goede repeteerbaarheid.],
)

met:
- $O_k$ --- de $k$-de meting [eenheid van de uitgang]
- $N$ --- aantal metingen [-]

#figure(
  image("assets/L2-histogram.png", width: 8cm),
  caption: [Histogram van herhaalde metingen met de normale verdeling erover (slide 37)],
  label: <fig:L2-histogram>,
)

=== Praktische kalibratie <sec:kalibratie-praktisch>

In de praktijk kijk je eerst of kalibreren nodig is (de *as-found check*): ligt de afwijking binnen de toegelaten fout, dan is de sensor in orde (Samenvatting 2024-2025 p.11). In de les werd een filmpje getoond ("Practical calibration explained", slide 38).

== Statistische karakteristieken <sec:statistisch>

=== Waarom statistiek? <sec:waarom-statistiek>

De slides tonen het nut met een voorbeeld. Je wil een weerstand $R$ bepalen door de spanning $u(k)$ en de stroom $i(k)$ $N$ keer te meten. Er zijn drie voor de hand liggende schatters:

$ hat(R)_"SA" = 1/N sum_(k=1)^N (u(k)) / (i(k)) quad quad hat(R)_"LS" = (sum u(k) i(k)) / (sum i^2(k)) quad quad hat(R)_"EV" = (sum u(k)) / (sum i(k)) $

met:
- $hat(R)_"SA"$ --- gemiddelde van de verhoudingen (simple average) [$Omega$]
- $hat(R)_"LS"$ --- kleinste-kwadratenschatter (least squares) [$Omega$]
- $hat(R)_"EV"$ --- verhouding van de gemiddelden (errors in variables) [$Omega$]

Met twee verschillende stroomsensoren (groep A en B) geven *twee van de drie schatters een slecht resultaat*. De reden ligt in de verdeling van de stroommetingen: het gemiddelde is wel $1$, maar een meting kan heel klein worden (dan explodeert $u\/i$), en het gemiddelde van $i^2$ is niet $1$. Conclusie: je hebt statistiek nodig om de juiste schatter te kiezen en om de nauwkeurigheid te bepalen.

=== Nauwkeurigheid en repeteerbaarheid in getallen <sec:normale-verdeling>

We nemen aan dat alle grootheden *normaal verdeeld* zijn. Dan:
- *nauwkeurigheid* = gemiddelde $-$ werkelijke waarde: hoe dicht ligt het gemiddelde bij de echte waarde?
- *repeteerbaarheid* = de spreiding rond het gemiddelde, uitgedrukt als variantie $sigma^2$: hoe kleiner, hoe beter.

Voor het generieke model is ook de uitgang normaal verdeeld:

#frm(
  "Statistisch sensormodel",
  $p(O) = 1 / (sigma_O sqrt(2 pi)) exp[-(O - overline(O))^2 / (2 sigma_O^2)] quad "met" quad overline(O) = overline(K) overline(I) + overline(a) + N(overline(I)) + overline(K)_M overline(I)_M overline(I) + overline(K)_I overline(I)_I$,
  [De gemiddelde uitgang volgt uit het generieke model met de gemiddelde waarden.],
)

De standaardafwijking van de uitgang volgt uit de *foutenvoortplanting* (eerste orde): elke onzekere grootheid draagt bij met haar eigen $sigma$, gewogen met de partiële afgeleide.

#frm(
  "Foutenvoortplanting",
  $sigma_O = sqrt((pdv(O, I))^2 sigma_I^2 + (pdv(O, I_M))^2 sigma_(I_M)^2 + (pdv(O, I_I))^2 sigma_(I_I)^2 + (pdv(O, K))^2 sigma_K^2 + (pdv(O, a))^2 sigma_a^2 + dots)$,
  [Elke parameter met spreiding telt mee.],
)

=== Tolerantie en foutband <sec:tolerantie>

Elke parameter heeft een statistische verdeling. Een *tolerantie* van $plus.minus a$ betekent dat alle exemplaren met een waarde kleiner dan gemiddelde $- a$ of groter dan gemiddelde $+ a$ worden afgekeurd.

Geeft de fabrikant alleen een foutband $plus.minus h$, dan benader je die als een rechthoekige (uniforme) verdeling van breedte $2h$. Die heeft als standaardafwijking:

#frm(
  "Foutband naar standaardafwijking",
  $sigma = h / sqrt(3)$,
  [Zo kan je een foutband $plus.minus h$ uit een datasheet meenemen in de foutenvoortplanting.],
)

#voorbeeld(title: "Temperatuurmeting met drie toestellen (slides 54-57)")[
  Een Pt100 meet een temperatuur $T = 117 degree"C"$. Zijn weerstand $R_T$ gaat naar een stroomtransmitter (uitgang $i$), en een recorder zet $i$ terug om naar een temperatuur $T_M$. De omgevingstemperatuur wijkt $Delta T_a = -10 degree"C"$ af (met $sigma = 6.7 degree"C"$). Bereken de gemiddelde meetfout en de standaardafwijking.

  #figure(
    image("assets/L2-temperatuurmeting.png", width: 11cm),
    caption: [Het meetsysteem: Pt100, transmitter, recorder (slide 57)],
    label: <fig:L2-temperatuurmeting>,
  )

  #table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, center, right, right, left),
    table.header([*Element*], [*Grootheid*], [*Gemiddelde*], [*Std.afw.*], [*Eenheid*]),
    [Ingang], [$T$], [$117.0$], [--], [°C],
    table.cell(rowspan: 3)[A -- Pt100], [$R_0$], [$100.0$], [$0.0433$], [$Omega$],
    [$alpha$], [$3.909 times 10^(-3)$], [$0$], [°C$""^(-1)$],
    [$beta$], [$-5.897 times 10^(-7)$], [$0$], [°C$""^(-2)$],
    table.cell(rowspan: 5)[B -- transmitter], [$K$], [$1.4134$], [$0$], [mA/$Omega$],
    [$K_M$], [$1.4134 times 10^(-4)$], [$0$], [mA/($Omega$°C)],
    [$K_I$], [$-1.637 times 10^(-2)$], [$0$], [mA/°C],
    [$Delta T_a$], [$-10.0$], [$6.7$], [°C],
    [$a$], [$-191.76$], [$0.24$], [mA],
    table.cell(rowspan: 2)[C -- recorder], [$K$], [$1.875$], [$0$], [°C/mA],
    [$a$], [$92.5$], [$0.1$], [°C],
  )

  *Stap 1 --- Pt100.* Het model is $R_T = R_0 (1 + alpha T + beta T^2)$:
  $ overline(R)_T = 100.0 (1 + 3.909 dot 10^(-3) dot 117 - 5.897 dot 10^(-7) dot 117^2) = 100.0 dot 1.44928 = 144.93 thin Omega $
  Alleen $R_0$ heeft spreiding, dus
  $ sigma_(R_T) = (pdv(R_T, R_0)) sigma_(R_0) = 1.44928 dot 0.0433 = 0.063 thin Omega $

  *Stap 2 --- transmitter.* Dit is het generieke model met $I = R_T$ en $I_M = I_I = Delta T_a$:
  $ i = K R_T + a + K_M Delta T_a R_T + K_I Delta T_a $
  $ overline(i) = 1.4134 dot 144.93 - 191.76 + 1.4134 dot 10^(-4) dot (-10) dot 144.93 + (-1.637 dot 10^(-2)) dot (-10) = 13.04 "mA" $
  De spreiding komt van $R_T$, $Delta T_a$ en $a$:
  $ sigma_i = sqrt(((K + K_M Delta T_a) sigma_(R_T))^2 + ((K_M R_T + K_I) sigma_(Delta T_a))^2 + sigma_a^2) = sqrt(0.089^2 + 0.028^2 + 0.24^2) = 0.257 "mA" $

  *Stap 3 --- recorder.* $T_M = K i + a$:
  $ overline(T)_M = 1.875 dot 13.04 + 92.5 = 116.95 degree"C" $
  $ sigma_(T_M) = sqrt((1.875 dot 0.2573)^2 + (1 dot 0.1)^2) = 0.49 degree"C" $

  *Stap 4 --- meetfout.*
  $ overline(E) = overline(T)_M - T = 116.95 - 117.00 = -0.05 degree"C" $

  *Kerninzicht:* de gemiddelde fout ($-0.05 degree"C"$) is veel kleiner dan de spreiding ($0.49 degree"C"$). Die spreiding komt vooral van de offset $a$ van de transmitter ($0.24 "mA"$), niet van de sensor zelf.
]

== Dynamische karakteristieken <sec:dynamisch>

Tot nu toe stond alles stil. Verandert de ingang snel, dan volgt de uitgang niet meteen. Hoe de uitgang $S(t)$ op een stimulus $s(t)$ reageert, beschrijf je met een differentiaalvergelijking. De orde ervan bepaalt het gedrag.

- *Nulde orde*: $S(t) = a + b thin s(t)$. De uitgang volgt de ingang meteen, zonder vertraging. Voorbeeld: een potentiometer.
- *Eerste orde*: $b_1 (d S(t)) / (d t) + b_0 S(t) = s(t)$. Na een sprong groeit de uitgang exponentieel naar de eindwaarde. Voorbeeld: een temperatuursensor, die eerst zelf moet opwarmen.
- *Tweede orde*: $b_2 (d^2 S(t)) / (d t^2) + b_1 (d S(t)) / (d t) + b_0 S(t) = s(t)$. Voorbeeld: een krachtsensor met een veer (massa-veersysteem).

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  [
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        plot.plot(
          size: (6, 4),
          x-label: [$t \/ tau$],
          y-label: [$S \/ S_infinity$],
          x-min: 0, x-max: 5, y-min: 0, y-max: 1.1,
          x-tick-step: 1, y-tick-step: 0.5,
          x-grid: true, y-grid: true,
          legend: "inner-south-east",
          {
            plot.add(domain: (0, 5), x => 1 - calc.exp(-x), style: (stroke: schoolBlue + 1.5pt), label: [eerste orde])
            plot.add(((0, 0.632), (1, 0.632), (1, 0)), style: (stroke: (paint: schoolRed, dash: "dashed")), label: [63 % bij $t = tau$])
          },
        )
      })
    ]
  ],
  figure(
    image("assets/L2-tweede-orde.png", width: 100%),
    caption: [Stapantwoord van een tweede-ordesensor: ondergedempt, kritisch gedempt en overgedempt (slide 62)],
    label: <fig:L2-tweede-orde>,
  ),
)

Bij de eerste orde bereikt de uitgang na één tijdconstante $tau = b_1 \/ b_0$ 63 % van de eindwaarde. Bij de tweede orde hangt het af van de demping: ondergedempt schiet over en slingert uit, overgedempt kruipt traag naar de eindwaarde.

De slides tonen zes typische antwoorden op een sprong:

#grid(
  columns: (auto, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L2-stapresponsies.png", width: 4cm),
    caption: [Stapantwoorden (slide 63)],
    label: <fig:L2-stapresponsies>,
  ),
  [
    - A: onbeperkte frequentierespons (volgt alles)
    - B: laagdoorlaat (volgt traag, blijft hangen)
    - C: hoogdoorlaat (piek, valt terug naar nul)
    - D: banddoorlaat
    - E: tweede-orde hoogdoorlaat met ongedempte resonantie
    - F: tweede-orde laagdoorlaat met ongedempte resonantie
  ],
)

Een hoogdoorlaatsensor (C) kan dus geen constante waarde meten: na de sprong zakt de uitgang terug naar nul. Dat zie je later terug bij de piëzo-elektrische sensor (@ch:kracht).

== Uitgangsimpedantie en excitatie <sec:impedantie>

De sensor en het meetcircuit erachter vormen samen een spanningsdeler of stroomdeler. Hoe je ze koppelt, hangt af van wat de sensor levert:

#figure(
  image("assets/L2-uitgangsimpedantie.png", width: 10cm),
  caption: [(A) Spanningsgestuurd systeem, (B) stroomgestuurd systeem (slide 64)],
  label: <fig:L2-uitgangsimpedantie>,
)

- *Spanningsgestuurd*: de sensor is een spanningsbron met uitgangsimpedantie $Z_"out"$. Om bijna de volledige spanning over het meetcircuit te krijgen moet $|Z_"in"| >> |Z_"out"|$.
- *Stroomgestuurd*: de sensor is een stroombron. Om bijna de volledige stroom door het meetcircuit te sturen moet $|Z_"in"| << |Z_"out"|$.

De *excitatie* is het elektrische signaal dat een actieve sensor nodig heeft (@sec:passief-vs-actief). Twee aandachtspunten:
- verandert de excitatie, dan verandert ook de transferfunctie, en meet je fout;
- te veel excitatie warmt de sensor op. Gaat hij niet stuk, dan meet hij toch minder nauwkeurig. De datasheet van de Pt102 raadt daarom een stroom van $1 "mA"$ aan (slide 66).

== Veiligheid en bescherming <sec:veiligheid>

=== ATEX <sec:atex>

*ATEX* gaat over het gevaar van een *explosieve atmosfeer* op de werkplek: brandbaar gas of stof gemengd met lucht. Een sensor in zo'n zone mag geen vonk of hete plek veroorzaken.

#figure(
  image("assets/L2-atex-zones.png", width: 10cm),
  caption: [ATEX-zones rond een tankstation (slide 68)],
  label: <fig:L2-atex-zones>,
)

#table(
  columns: (auto, 1fr),
  align: (left, left),
  table.header([*Zone (gas)*], [*Explosieve atmosfeer is ...*]),
  [Zone 0], [continu, lang of vaak aanwezig],
  [Zone 1], [waarschijnlijk bij normale werking],
  [Zone 2], [onwaarschijnlijk bij normale werking, en dan maar kort],
)

ATEX kent twee groepen: *groep I* voor mijnen (zeer streng door methaan en stof) en *groep II* voor alle andere industrie bovengronds. Op een ATEX-gekeurde sensor staat een code, bv. op de ITS RTM15X: `II 1 GD, Ex ia IIC T4 Ga`. Daarin zit onder meer:
- de *gasgroep*: IIA (propaan), IIB (ethyleen), IIC (waterstof en acetyleen, het gevaarlijkst);
- de *temperatuurklasse*: de maximale oppervlaktetemperatuur van het toestel, van T1 ($450 degree"C"$) tot T6 ($85 degree"C"$). Het toestel moet onder de ontstekingstemperatuur van het gas blijven.

=== IP-code <sec:ip>

Een *IP-code* (Ingress Protection) geeft aan hoe goed een behuizing beschermt tegen indringen van stof en water. Het eerste cijfer (0--6) gaat over vaste deeltjes en stof, het tweede (0--8) over water. *IP65* is stofdicht en bestand tegen waterstralen.

#figure(
  image("assets/L2-ip-code.png", width: 9cm),
  caption: [Opbouw van de IP-code: stof (links), water (rechts) (slide 71)],
  label: <fig:L2-ip-code>,
)

=== SIL <sec:sil>

*SIL* (Safety Integrity Level) is een relatieve maat voor de betrouwbaarheid van een geautomatiseerde veiligheidsfunctie. Let op: SIL is *geen* eigenschap van één sensor, maar van de volledige veiligheidsfunctie (SIF, Safety Instrumented Function): sensor, logica en actuator samen.

SIL wordt uitgedrukt met de *PFD* (Probability of Failure on Demand): de kans dat de veiligheidsfunctie faalt op het moment dat ze nodig is.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  table(
    columns: (auto, auto, auto),
    align: (center, center, left),
    table.header([*SIL*], [*PFD#sub[avg]*], [*Kans op falen*]),
    [1], [$10^(-1)$ -- $10^(-2)$], [1 op 10 tot 100],
    [2], [$10^(-2)$ -- $10^(-3)$], [1 op 100 tot 1000],
    [3], [$10^(-3)$ -- $10^(-4)$], [1 op 1000 tot 10 000],
    [4], [$10^(-4)$ -- $10^(-5)$], [1 op 10 000 tot 100 000],
  ),
  figure(
    image("assets/L2-sil.png", width: 100%),
    caption: [SIL-niveaus en typische toepassingen, van gebouwverlichting (SIL 1) tot kerncentrales (SIL 4) (slide 73)],
    label: <fig:L2-sil>,
  ),
)
