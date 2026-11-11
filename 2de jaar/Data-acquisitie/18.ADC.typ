#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/18.ADC.pdf | examenvragen 25-26 (vraag 20) + oefenvragen E8, E9, E10

= ADC -- Analog to Digital Conversion <ch:adc>

Een *ADC* (analog-to-digital converter) zet een analoge spanning om in een binair getal. Een meting is zo klaar voor de computer.

#figure(
  image("assets/L18-blokschema.png", width: 65%),
  caption: [Basis-ADC: ingangsmultiplexer, sample-and-hold, ADC, uitgangslatches en stuurlogica (slide 4)],
  label: <fig:L18-blokschema>,
)

== Sample-and-hold <sec:sample-and-hold>

Een *sample-and-hold* (S/H) neemt de ingangsspanning op een bepaald moment over en houdt ze constant tijdens de omzetting. Dat is nodig omdat een omzetting tijd kost, van enkele milliseconden tot microseconden. Hoe beter de gewenste resolutie en nauwkeurigheid, hoe langer de meting duurt. Het type ADC bepaalt dus hoeveel metingen per seconde mogelijk zijn.

De omzettijd heet de *aperture time* $T_x$. Bij 2000 metingen per seconde mag $T_x$ hoogstens $1\/2000 = 500 mu"s"$ zijn. Verandert de ingang tijdens $T_x$, dan wordt de waarde verkeerd gemeten. Alleen integrerende ADC's hebben daar geen last van, omdat ze de ingang over de meettijd uitmiddelen.

#grid(
  columns: (1fr, 1.2fr),
  gutter: 1em,
  align: horizon,
  [
    De S/H bestaat uit een schakelaar, een condensator en een buffer. Staat de schakelaar aan (*sample*), dan volgt de condensator de ingang. Gaat de schakelaar uit (*hold*), dan houdt de condensator de spanning vast. De ADC meet de spanning van de condensator.
  ],
  figure(
    image("assets/L18-sample-hold.png", width: 100%),
    caption: [Sample-and-hold: schakelaar, condensator en buffer; de uitgang blijft constant tijdens het hold-interval (slide 8)],
    label: <fig:L18-sample-hold>,
  ),
)

=== Aperture error <sec:aperture>

De fout tijdens de aperture time is de verandering van de ingang in die tijd: $Delta V_x = (d V_a \/ d t) T_x$. Voor een sinus $V_a = V sin(2 pi f t)$ is de verandering het grootst in de nuldoorgang. Daar is $d V_a \/ d t = V 2 pi f$.

#frm(
  "Aperture error",
  $Delta V_x = V dot 2 pi f dot T_x$,
  [De fout is evenredig met de amplitude, de frequentie en de aperture time.],
)

met:
- $Delta V_x$ --- fout door verandering tijdens de omzetting [V]
- $V$ --- amplitude van de sinus [V]
- $f$ --- frequentie van het ingangssignaal [Hz]
- $T_x$ --- aperture time [s]

De fout mag niet groter zijn dan 1 LSB over het volledige bereik van $2V$ (piek tot piek). Dat geeft de maximale aperture time.

#frm(
  "Maximale aperture time",
  $T_x = (Delta V_x) / (2 V) dot 1 / (pi f) = 1 / 2^N dot 1 / (pi f)$,
  [Met $Delta V_x = 2V \/ 2^N$ (1 LSB) volgt dat meer bits of een hogere frequentie een kortere aperture time eisen.],
)

met:
- $N$ --- aantal bits van de ADC [-]

#oefening(title: "Aperture time voor een sinus van 1 kHz")[
  *Gegeven:* sinus van $1 "kHz"$, ADC van 10 bit (slide 7).

  *Gevraagd:* maximale aperture time $T_x$, en de bemonsteringsperiode volgens Nyquist.

  *Oplossing:*
  - *Stap 1, aperture time:* $T_x = 1 \/ (2^10 dot pi dot 1000) = 1 \/ (1024 dot 3141.6) approx 311 "ns"$.
  - *Stap 2, Nyquist:* $f_s = 2 dot 1000 = 2000 "Hz"$, dus $T_"nyq" = 1\/2000 = 500 mu"s"$.
  - *Check:* de aperture time (311 ns) is veel korter dan de bemonsteringsperiode (500 µs). Een S/H houdt de waarde vast zodat de trage ADC genoeg tijd krijgt.

  De ADC moet dus eerst een S/H gebruiken en daarna pas omzetten. Het bemonsteringstheorema staat in @sec:nyquist.
]

== Specificaties <sec:adc-specs>

=== Resolutie en kwantisatie <sec:adc-resolutie>

*Kwantisatie* is het afronden van een continue spanning op het dichtstbijzijnde van $2^n$ discrete niveaus. De afstand tussen twee niveaus is de resolutie, ook de grootte van 1 LSB genoemd.

#frm(
  "Resolutie van een ADC",
  $q = "FSR" / 2^n$,
  [De stapgrootte is het volledige bereik gedeeld door het aantal niveaus.],
)

met:
- $q$ --- resolutie, grootte van 1 LSB [V]
- $"FSR"$ --- full scale range, het volledige ingangsbereik [V]
- $n$ --- aantal bits [-]

Een ADC rondt af naar het dichtstbijzijnde niveau. De *kwantisatiefout* is dus maximaal $plus.minus q \/ 2$. Een ADC met meer bits kwantiseert fijner (slide 11 vergelijkt 16 bit met 6 bit).

#grid(
  columns: (1.3fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L18-kwantisatie.png", width: 100%),
    caption: [Kwantisatie van een sinus op 2 bit en 3 bit (slide 9)],
    label: <fig:L18-kwantisatie>,
  ),
  figure(
    image("assets/L18-fouten.png", width: 100%),
    caption: [Typische ADC-fouten: A ideaal, B gain error, C lineariteitsfout, D missing code, E offsetfout (slide 10)],
    label: <fig:L18-fouten>,
  ),
)

Naast de kwantisatiefout noemt de slide deze fouten in de overdrachtskarakteristiek: *gain error* (verkeerde helling), *lineariteitsfout* (karakteristiek buigt), *missing code* (een digitale waarde komt nooit voor) en *offsetfout* (karakteristiek verschoven).

De theoretische signaal-ruisverhouding (SNR, signal to noise ratio) door kwantisatie hangt alleen van het aantal bits af.

#frm(
  "SNR van een ideale ADC",
  $"SNR" = 6.02 n + 1.76 "dB"$,
  [Elke extra bit geeft 6 dB meer SNR, en dus een halvering van de kwantisatiestap.],
)

met:
- $"SNR"$ --- signaal-ruisverhouding door kwantisatie [dB]
- $n$ --- aantal bits [-]

=== Conversietijd <sec:adc-conversietijd>

De conversietijd is de tijd die de ADC nodig heeft voor één meting. Bij $f_"meting"$ metingen per seconde mag de omzettijd hoogstens $1 \/ f_"meting"$ zijn. De conversietijd hangt af van het type: de ene ADC heeft $N$ klokcycli nodig (SAR), de andere een veelvoud van een vaste integratietijd (dual slope).

#oefening(title: "Resolutie en SNR van een 12-bit ADC")[
  *Gegeven:* 12-bit ADC met een bereik van $10 "V"$.

  *Gevraagd:* resolutie $q$ en theoretische SNR.

  *Oplossing:*
  - *Stap 1, resolutie:* $q = 10 \/ 2^12 = 10 \/ 4096 = 2.44 "mV"$.
  - *Stap 2, SNR:* $"SNR" = 6.02 dot 12 + 1.76 = 74 "dB"$.
  - *Check:* de kwantisatiefout is maximaal $q\/2 = 1.22 "mV"$.
]

#examenvraag("oefenvraag E8", [Een 12-bit ADC met een bereik van 10 V. Wat is de resolutie en de theoretische SNR?],
  opties: (
    [2,44 mV en 74 dB],
    [2,44 mV en 72 dB],
    [1,22 mV en 74 dB],
    [4,88 mV en 68 dB],
  ),
  juist: "A",
)[$q = "FSR" \/ 2^n = 10 \/ 4096 = 2.44 "mV"$ en $"SNR" = 6.02 dot 12 + 1.76 = 74 "dB"$. B heeft de juiste resolutie maar een verkeerde SNR (72 dB komt van $6 dot 12$, zonder de $1.76$). C neemt $q \/ 2$ als resolutie, dat is de maximale kwantisatiefout. D hoort bij 11 bit.]

#oefening(title: "Hoeveel bits voor een brugsignaal?")[
  *Gegeven:* brugsignaal van $10 "mV"$ volle schaal, ADC met een bereik van $10 "V"$, gewenste resolutie $1 mu"V"$.

  *Gevraagd:* aantal bits.

  *Oplossing:*
  - *Stap 1, aantal niveaus:* $10 "V" \/ 1 mu"V" = 10^7$ niveaus.
  - *Stap 2, bits:* $log_2(10^7) approx 23.3$, dus 24 bit.
  - *Stap 3, alternatief:* versterk het brugsignaal $1000 times$, zodat het het bereik van $10 "V"$ vult. De resolutie op de ingang blijft $1 mu"V"$, dus $10 "mV" \/ 1 mu"V" = 10^4$ niveaus. Dat past in 14 bit.
  - *Check:* $2^14 = 16384 > 10^4$ en $2^13 = 8192 < 10^4$.

  Daarom staat er in een brugschakeling een versterker voor de ADC (@ch:signaalconditionering).
]

== Types ADC <sec:adc-types>

=== Staircase ramp (niet-integrerend) <sec:adc-staircase>

Een *staircase ramp-ADC* telt omhoog tot een interne DAC dezelfde spanning geeft als de ingang. Een teller geeft de code aan een DAC. Een comparator vergelijkt de DAC-uitgang met $V_"in"$. Zodra de DAC-uitgang $V_"in"$ bereikt, stopt de teller en geeft hij de code. Het nadeel is dat de omzettijd van de grootte van de ingang afhangt: een grote spanning duurt langer dan een kleine.

#figure(
  image("assets/L18-staircase.png", width: 65%),
  caption: [Staircase ramp-ADC: teller, DAC en comparator (slide 12)],
  label: <fig:L18-staircase>,
)

=== Successive approximation (SAR) <sec:adc-sar>

Een *SAR-ADC* (successive approximation register) zoekt de code bit per bit, te beginnen in het midden van het bereik. Voor elk bit zet de SAR de DAC in het midden van het resterende interval. De comparator zegt of $V_"in"$ erboven of eronder ligt. De omzettijd is vast.

#frm(
  "Omzettijd SAR",
  $t_"max" = N dot T$,
  [Een N-bit SAR heeft N klokcycli nodig, één per bit.],
)

met:
- $N$ --- aantal bits [-]
- $T$ --- klokperiode [s], met bemonsteringsfrequentie $f = 1\/T$

Je kunt vroeger stoppen met minder bits, en dus minder precisie. De SAR wordt gebruikt voor bemonsteringsfrequenties onder 1 MHz.

#figure(
  image("assets/L18-sar.png", width: 75%),
  caption: [SAR-ADC: comparator, SAR-register en DAC; de zoekboom halveert het interval bij elke bit (slide 13)],
  label: <fig:L18-sar>,
)

=== Integrerende ADC <sec:adc-integrerend>

Een *integrerende ADC* integreert de ingangsspanning over een bepaalde tijd en leidt daaruit de code af. Het is een spanning-naar-frequentie-omzetter. Omdat hij over de tijd uitmiddelt, onderdrukt hij ruis. Er bestaan twee varianten.

*Single slope.* De integrator geeft $V_"int" = -V_"in" t \/ (R C)$. De tijd $T$ tot $V_"int" = -V_"ref"$ meet je met een teller.

#frm(
  "Single slope",
  $f_"out" = 1 / T = V_"in" / (V_"ref" R C)$,
  [De uitgangsfrequentie is evenredig met de ingangsspanning.],
)

met:
- $V_"in"$ --- gemiddelde ingangsspanning [V]
- $V_"ref"$ --- referentiespanning [V]
- $R, C$ --- weerstand [$Omega$] en condensator [F] van de integrator

De nauwkeurigheid hangt hier nog af van $R$, $C$ en de klok. De dual-slope-variant lost dat op.

*Dual slope.* De omzetting heeft twee fasen:

+ De teller start op nul en de condensator wordt kortgesloten. De ingang van de integrator staat op $V_"in"$. De teller telt tot zijn maximale telwaarde $M C$. De integratietijd is dus vast.
+ De ingang schakelt om naar $-V_"ref"$. De condensator ontlaadt met een vaste helling. Een nuldoorgangsdetector stopt de klok zodra de uitgang 0 V bereikt. De stand van de teller is de code.

De integrator geeft na fase 1 $V_o = -V_"in" M C \/ (R C f_"clock")$ en ontlaadt in fase 2 met $V_"ref" dot "Count" \/ (R C f_"clock")$. De nuldoorgang treedt op als beide gelijk zijn.

#frm(
  "Dual slope",
  $"Count" = V_"in" dot (M C) / V_"ref"$,
  [De teller staat bij de nuldoorgang op een waarde evenredig met $V_"in"$. $R$, $C$ en $f_"clock"$ vallen weg.],
)

met:
- $"Count"$ --- tellerstand bij de nuldoorgang, de digitale code [-]
- $M C$ --- maximale telwaarde van fase 1 [-]
- $V_"ref"$ --- referentiespanning [V]

Daardoor hangt de nauwkeurigheid niet af van $R$, $C$ of de klok. De precisie kan zeer hoog zijn.

#figure(
  image("assets/L18-dual-slope.png", width: 80%),
  caption: [Dual-slope-ADC: integrator, nuldoorgangsdetector en teller; de integratorspanning loopt eerst met $V_"in"$, dan met $-V_"ref"$ terug naar 0 (slide 17)],
  label: <fig:L18-dual-slope>,
)

==== Onderdrukking van 50 Hz <sec:adc-50hz>

Een dual-slope-ADC onderdrukt 50 Hz netruis als de integratietijd $T_1$ een veelvoud van 20 ms is. De periode van 50 Hz is 20 ms. Over een volledige periode van een sinus is het gemiddelde nul. Integreer je dus over $n dot 20 "ms"$, dan valt de netstoring weg uit het resultaat.

#frm(
  "Integratietijd voor 50 Hz",
  $T_1 = n dot 20 "ms"$,
  [Een geheel aantal periodes van de netfrequentie.],
)

met:
- $n$ --- natuurlijk getal [-]

#examenvraag("oefenvraag E10", [Waarom onderdrukt een integrerende (dual-slope) ADC netruis van 50 Hz?],
  opties: (
    [omdat hij een ingebouwd filter heeft],
    [omdat hij integreert over een veelvoud van 20 ms, en de gemiddelde waarde van een volledige sinusperiode nul is],
    [omdat hij traag is],
    [omdat hij differentieel meet],
  ),
  juist: "B",
)[50 Hz heeft een periode van 20 ms. Integreer je over 20, 40, 60 ms enzovoort, dan is de bijdrage van de netspanning exact nul. A is fout: er zit geen filter in, de uitmiddeling is het filter. C is fout: trage ADC's zonder dit integratiegedrag onderdrukken netruis niet. D heeft er niets mee te maken. Is de netfrequentie 60 Hz, dan kies je $T_1$ als veelvoud van 16,67 ms.]

=== Sigma-delta <sec:adc-sigma-delta>

Een *sigma-delta ADC* meet met oversampling en heeft maar een 1-bit DAC nodig. Een modulator bemonstert zeer snel met 1 bit. Een digitaal decimatiefilter maakt daaruit een getal met veel bits. Zo haalt hij de hoogste resolutie, maar ook de laagste snelheid.

#figure(
  image("assets/L18-sigma-delta.png", width: 80%),
  caption: [Sigma-delta ADC: integrator, comparator en 1-bit DAC in de lus, gevolgd door een digitaal filter (slide 20)],
  label: <fig:L18-sigma-delta>,
)

=== Vergelijking <sec:adc-vergelijking>

#figure(
  image("assets/L18-overzicht.png", width: 80%),
  caption: [Overzicht van de ADC-types (slide 21)],
  label: <fig:L18-overzicht>,
)

#table(
  columns: (auto, auto, auto, auto, 1fr),
  align: (left, left, left, left, left),
  table.header([*Type*], [*Resolutie*], [*Snelheid*], [*Vermogen*], [*Toepassing*]),
  [Integrerend], [hoog (tot 20 bit)], [traag ($> 100 mu"s"$)], [matig tot hoog], [multimeter, paneelmeters, telemetrie],
  [SAR], [matig (14 bit)], [matig ($> 1 mu"s"$)], [laag tot matig], [datacommunicatie, telecom, real-time DAQ, embedded],
  [Sigma-delta], [zeer hoog (tot 32 bit)], [traagst ($> 1 "ms"$)], [matig tot hoog], [hoogwaardige audio, precisiemeting],
)

Een weegschaal geeft enkele mV uit een brug, verandert traag en vraagt veel bits. Dat past bij sigma-delta.

#examenvraag("25-26 vraag 20", [Stel dat je een digitale personenweegschaal moet voorzien van een ADC. Welk type zou het best gebruikt worden?],
  opties: (
    [integrerende dual-slope ADC],
    [successive approximation (SAR) ADC],
    [sigma-delta ADC],
    [thermometer ADC],
  ),
  juist: "C",
)[Een weegschaal heeft een traag signaal en veel bits nodig. De tabel geeft sigma-delta als type met de hoogste resolutie (tot 32 bit) en de laagste snelheid. A is traag en nauwkeurig, maar haalt de resolutie van sigma-delta niet. B is sneller maar heeft een beperkte resolutie (14 bit). D (thermometer of flash) vergelijkt het signaal tegelijk met $2^n$ niveaus en is razendsnel maar grof, het omgekeerde van wat hier nodig is.]
