#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/17.DAC.pdf | examenvragen 25-26 (vraag 4) + oefenvragen

= DAC -- Digital to Analog Conversion <ch:dac>

== Basisstructuur <sec:dac-basis>

Een *DAC* (digital-to-analog converter) zet een binair getal om in een spanning of stroom. De eenvoudigste DAC heeft 1 bit: een schakelaar verbindt de uitgang met de referentiespanning $V_"ref"$ (bit 1) of met massa (bit 0). Elke complexere DAC is opgebouwd uit zulke schakelaars.

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L17-thermometer.png", width: 100%),
    caption: [Thermometer-DAC: een 3-naar-7 decoder sluit $n$ van de 7 schakelaars (slide 7)],
    label: <fig:L17-thermometer>,
  ),
  [
    Bij de *thermometer-DAC* (fully decoded) zet een decoder het getal om naar een rij enen: $101$ wordt $0011111$. Elke 1 sluit een schakelaar, die een stroom $V_"ref" \/ R$ toevoegt. Voor een getal $n$ geeft dat

    #frm(
      "Thermometer-DAC",
      $A = n V_"ref" / R quad "met" 0 <= n <= 7$,
      [De uitgang is evenredig met het aantal gesloten schakelaars.],
    )

    met:
    - $A$ --- uitgangsstroom [A]
    - $n$ --- aantal gesloten schakelaars [-]
    - $R$ --- weerstand per schakelaar [$Omega$]
  ],
)

De schakelaars gedragen zich als condensatoren, waardoor de omzetting trager wordt. Een thermometer-DAC kost 1 tot 2000 euro.

=== Binaire fractie <sec:dac-fractie>

Een binair getal $b_1 b_2 dots b_n$ wordt gelezen als een fractie $D$ tussen 0 en 1. Het eerste bit $b_1$ is het *MSB* (most significant bit) en weegt $1\/2$. Het laatste bit $b_n$ is het *LSB* (least significant bit) en weegt $1\/2^n$.

#frm(
  "DAC-uitgang",
  $A = K V_"ref" D quad "met" D = b_1 / 2^1 + b_2 / 2^2 + b_3 / 2^3 + dots + b_n / 2^n$,
  [De uitgang is de referentie, geschaald met $K$, maal de binaire fractie $D$. Met $K = 1$ en een code $c$ van $n$ bits is $D = c \/ 2^n$, dus $V_"out" = V_"ref" dot c \/ 2^n$.],
)

met:
- $A$ --- uitgangsspanning of -stroom [V of A]
- $K$ --- schaalfactor van de versterking [-]
- $V_"ref"$ --- referentiespanning [V]
- $D$ --- ingangswoord als decimale fractie [-]
- $b_i$ --- bit $i$ (0 of 1), met $b_1$ het MSB [-]

Voor $101$ is $D = 1\/2 + 0\/4 + 1\/8 = 0.625$. Dat is hetzelfde als $5\/8$ voor de code $5$ bij $n = 3$.

#oefening(title: "Binaire fractie omzetten")[
  *Gegeven:* ingangswoord $1010$ en $K V_"ref" = 10 "V"$ (slide 10).

  *Gevraagd:* uitgangsspanning $A$.

  *Oplossing:*
  - *Stap 1, fractie:* $D = 1\/2 + 0\/4 + 1\/8 + 0\/16 = 0.5 + 0.125 = 0.625$.
  - *Stap 2, uitgang:* $A = K V_"ref" D = 10 times 0.625 = 6.25 "V"$.
  - *Check:* code $1010 = 10$, dus $10 \/ 16 = 0.625$. Dat klopt.
]

=== Dynamisch bereik <sec:dac-bereik>

Het dynamisch bereik is de verhouding tussen de volle schaal en 1 LSB. Een DAC met $N$ bits heeft $2^N$ niveaus.

#frm(
  "Dynamisch bereik",
  $"DR" = V_"FS" / (1 "LSB") = 2^N quad arrow.r.double quad "DR"_"dB" = 20 log(2^N) approx 6 N "dB"$,
  [Elke extra bit verdubbelt het aantal niveaus en voegt 6 dB toe.],
)

met:
- $V_"FS"$ --- volle schaal [V]
- $N$ --- aantal bits [-]

Een 8-bit DAC haalt 48 dB, een 16-bit DAC 96 dB (hi-fi).

Een *multiplying DAC* (digitale potentiometer) gebruikt een veranderlijke ingangsspanning als referentie: $A = K V_"input" D$. De uitgang is dan het product van het analoge signaal en het digitale getal.

== Types DAC <sec:dac-types>

=== Binary weighted <sec:dac-binary>

Een *binary-weighted DAC* geeft elke bit een weerstand die tweemaal zo groot is als die van de bit ervoor: $R$, $2R$, $4R$, tot $2^(N-1) R$. De stroom per bit is zo evenredig met zijn gewicht. Dit heeft twee praktische problemen.

- De weerstandsverhoudingen zijn duur. Voor 8 bit loopt de reeks van $R$ tot $2^7 R = 128 R$, en elke weerstand moet even nauwkeurig zijn als de kleinste. Dat is moeilijk te maken in een chip.
- Zijn de weerstanden niet exact gelijk aan hun nominale verhouding, dan is de DAC *niet monotoon*. Bij de overgang van $011$ naar $100$ kan de uitgang dan dalen terwijl de code stijgt.

#figure(
  image("assets/L17-binary-weighted.png", width: 70%),
  caption: [Binary-weighted DAC met weerstanden of stroombronnen (slide 13)],
  label: <fig:L17-binary-weighted>,
)

=== R-2R ladder <sec:dac-r2r>

Een *R-2R ladder-DAC* gebruikt maar twee weerstandswaarden, $R$ en $2R$, in een ladderschakeling. Twee identieke weerstanden zijn veel nauwkeuriger op elkaar af te stemmen (te matchen) dan een reeks die over $2^N$ varieert. Daarom is de R-2R ladder de praktische oplossing voor het eerste probleem van de binary-weighted DAC.

#grid(
  columns: (1.3fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L17-r2r.png", width: 100%),
    caption: [R-2R ladder-DAC: alleen $R$ en $2R$ (slide 14)],
    label: <fig:L17-r2r>,
  ),
  figure(
    image("assets/L17-segmented.png", width: 100%),
    caption: [Segmented DAC: 3 MSB als thermometer, 3 LSB als R-2R (slide 15)],
    label: <fig:L17-segmented>,
  ),
)

#examenvraag("oefenvraag E11", [Waarom gebruikt een R-2R ladder-DAC maar twee weerstandswaarden?],
  opties: (
    [om plaats te besparen],
    [omdat weerstanden van dezelfde waarde veel nauwkeuriger op elkaar af te stemmen zijn dan een reeks die over $2^n$ varieert],
    [omdat het sneller is],
    [omdat er dan minder stroom loopt],
  ),
  juist: "B",
)[Bij een binary-weighted DAC met 12 bit loopt de reeks van $R$ tot $2048 R$. De grootste weerstand moet even nauwkeurig zijn als de kleinste, en dat lukt niet op een chip. Het afstemmen van twee identieke weerstanden lukt wel, tot ongeveer $0.01 %$. A, C en D zijn geen reden die de slides geven.]

=== Segmented <sec:dac-segmented>

Een *segmented DAC* splitst het getal in twee delen. De MSB's (bijvoorbeeld 3 bits) gaan naar een thermometer-DAC, de LSB's (3 bits) naar een R-2R ladder. De thermometer geeft grote stappen die zeker monotoon zijn, de ladder de fijne stappen. Kostprijs: 5 tot 1000 euro.

=== Oversampling en interpolerende DAC <sec:dac-oversampling>

Een *oversampling interpolating DAC* rekent met een digitaal interpolatiefilter extra tussenpunten uit en stuurt de DAC op een hogere frequentie aan. Dit heeft twee gevolgen.

- De signaal-ruisverhouding (SNR, signal to noise ratio) neemt toe.
- De eisen aan het laagdoorlaatfilter na de DAC worden lager, omdat de spiegelspectra verder van het signaal liggen.

#figure(
  image("assets/L17-oversampling.png", width: 70%),
  caption: [Oversampling DAC: interpolatiefilter, DAC en anti-imaging filter (slide 16)],
  label: <fig:L17-oversampling>,
)

=== Sigma-delta DAC <sec:dac-sigma-delta>

Een *sigma-delta DAC* gebruikt een 1-bit DAC met een integrator in een terugkoppellus. De uitgang is een bitstroom waarvan de gemiddelde waarde het digitale getal volgt. Een laagdoorlaatfilter haalt daaruit het analoge signaal. Kostprijs: 5 tot 3000 euro.

=== Counting / PWM-DAC <sec:dac-pwm>

Een *counting DAC* of *PWM-DAC* (pulse width modulated) maakt een blokgolf waarvan de duty cycle het digitale getal voorstelt. Een laagdoorlaatfilter neemt het gemiddelde. Dit ontwerp is strikt monotoon. De updatesnelheid en de resolutie bepalen elkaar: meer bits betekent een tragere update. Kostprijs: 1 tot 500 euro. De PWM zelf komt aan bod in @sec:pwm.

#grid(
  columns: (1.3fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L17-sigma-delta.png", width: 100%),
    caption: [Sigma-delta DAC: 1-bit DAC met integrator in de lus (slide 17)],
    label: <fig:L17-sigma-delta>,
  ),
  figure(
    image("assets/L17-pwm-dac.png", width: 100%),
    caption: [Counting / PWM-DAC (slide 18)],
    label: <fig:L17-pwm-dac>,
  ),
)

=== Vergelijking <sec:dac-vergelijking>

#figure(
  image("assets/L17-overzicht.png", width: 13.0cm),
  caption: [Overzicht van de DAC-types (slide 23)],
  label: <fig:L17-overzicht>,
)

#table(
  columns: (auto, auto, auto, 1fr),
  align: (left, left, left, left),
  table.header([*Type*], [*Resolutie*], [*Snelheid*], [*Opmerking*]),
  [R-2R ladder], [tot 16 bit], [100 kSPS tot 1 MSPS], [goed, begrensd door de weerstandstolerantie],
  [Sigma-delta], [16 tot 24 bit], [tot 1 MSPS], [zeer weinig vervorming; digitaal filter nodig],
  [PWM], [8 tot 10 bit], [10 tot 100 MSPS], [eenvoudig met een microcontroller; filter nodig],
  [Binary weighted], [8 tot 10 bit], [100 kSPS], [goedkoop; nauwkeurigheid begrensd door matching],
)

== Selectiecriteria <sec:dac-selectie>

Een DAC kies je op deze eigenschappen (slide 19):

- *Resolutie:* aantal bits, van 8 tot 24. Meer bits geeft meer precisie (audio, meettechniek).
- *Sampling rate:* afstemmen op de toepassing, bijvoorbeeld 44,1 kHz voor audio. Het bereik loopt van kHz tot GHz.
- *Uitgangsspanningsbereik:* de uitgang moet binnen het bereik van de toepassing vallen.
- *Vermogenverbruik:* van 1 mW tot 5 W. Bij draagbare toestellen bepaalt dat de batterijduur.
- *Interface:* I2C, SPI of UART (@sec:i2c).
- *Kost:* van 45 tot 50.000 euro, een afweging tussen prestatie en prijs.

=== De referentiespanning als foutbron <sec:dac-vref>

De referentiespanning bepaalt de schaal van de hele uitgang. Uit $A = K V_"ref" D$ volgt dat een relatieve fout op $V_"ref"$ dezelfde relatieve fout op elke uitgangswaarde geeft. Daarom moet $V_"ref"$ stabiel blijven, ook bij temperatuurverandering. Je kunt $V_"ref"$ periodiek bijregelen (trimmen), maar de temperatuurdrift blijft.

De fout op $V_"ref"$ mag hoogstens een halve LSB zijn. Anders staat de uitgang meer dan een halve stap verkeerd en is het laagste bit betekenisloos.

#frm(
  "Toegelaten drift van de referentie",
  $Delta V_"ref" / V_"ref" < 1 / 2^N dot 1 / 2 quad arrow.r.double quad "drift" < 1 / 2^N dot 1 / (Delta T) dot 1 / 2$,
  [De halve LSB, gedeeld door het temperatuurbereik $Delta T$, geeft de toegelaten drift in ppm per graad.],
)

met:
- $N$ --- aantal bits van de DAC [-]
- $Delta T$ --- temperatuurbereik [$""^circle.small$C]

#oefening(title: "Drift van de referentie voor 8 bit en 12 bit")[
  *Gegeven:* temperatuurbereik van $-50 ""^circle.small"C"$ tot $50 ""^circle.small"C"$ (slide 21).

  *Gevraagd:* maximale drift van $V_"ref"$ voor een 8-bit DAC en een 12-bit DAC.

  *Oplossing:*
  - *Stap 1, bereik:* $Delta T = 100 ""^circle.small"C"$.
  - *Stap 2, 8 bit:* $1\/2^8 dot 1\/100 dot 1\/2 = 1\/51200 approx 20 "ppm/"^circle.small"C"$.
  - *Stap 3, 12 bit:* $1\/2^12 dot 1\/100 dot 1\/2 = 1\/819200 approx 1.2 "ppm/"^circle.small"C"$. De slides ronden af op 1 ppm.
  - *Check:* 4 bits meer is een factor $2^4 = 16$ strengere eis. $20 \/ 16 approx 1.2$.

  Een referentie van 1 ppm per graad is duur. Dat maakt een 12-bit DAC met grote temperatuurvariatie kostbaar.
]

#examenvraag("25-26 vraag 4", [De aangelegde referentiespanning voor een 12-bit DAC is belangrijk omdat ...],
  opties: (
    [de maximaal toegelaten fout op deze referentiespanning kleiner moet zijn dan 1 ppm/$""^circle.small$C],
    [de maximaal toegelaten fout op deze referentiespanning kleiner moet zijn dan 20 ppm/$""^circle.small$C],
    [de maximaal toegelaten fout op deze referentiespanning kleiner moet zijn dan de resolutie $1\/2^12$ van de DAC],
    [de maximaal toegelaten fout op deze referentiespanning kleiner moet zijn dan 0,5 keer de resolutie $1\/2^12$ van de DAC],
  ),
  juist: "D",
)[$V_"ref"$ staat als factor in $A = K V_"ref" D$. Een relatieve fout op $V_"ref"$ komt dus onveranderd op de uitgang terecht. Eén LSB is $1\/2^12 approx 244 "ppm"$ van de volle schaal. Is de fout even groot, dan staat de uitgang een volledige stap verkeerd. Daarom is de eis een halve LSB (D). C is een factor 2 te ruim. A en B zijn de waarden per graad uit de slides: 1 ppm/$""^circle.small$C is het 12-bit-resultaat en 20 ppm/$""^circle.small$C het 8-bit-resultaat voor een bereik van 100 $""^circle.small$C. Ze volgen uit D door te delen door het temperatuurbereik en zijn geen algemene eis.]
