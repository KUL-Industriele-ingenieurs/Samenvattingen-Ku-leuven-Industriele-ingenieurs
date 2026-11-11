#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: ENKEL SLIDES: Sampling_theorem.pdf | examenvragen (E2, E6, E7)

= Sampling en aliasing <ch:sampling>

== Bemonsteringstheorema <sec:nyquist>

Het *bemonsteringstheorema* (Nyquist-Shannon) geeft de laagste *bemonsteringsfrequentie* $f_s$ waarmee je een signaal nog kunt reconstrueren. Een ADC (@ch:adc) neemt het signaal op vaste tijdstippen op. Tussen die tijdstippen is de waarde onbekend. Het theorema zegt hoe snel die tijdstippen moeten volgen.

#frm(
  "Bemonsteringstheorema",
  $f_s >= 2 f_"bw,in"$,
  [Bemonster minstens twee keer sneller dan de hoogste frequentie in het signaal.],
)

met:
- $f_s$ --- bemonsteringsfrequentie of Nyquist-frequentie [Hz]
- $f_"bw,in"$ --- bandbreedte van het ingangssignaal [Hz]

De helft van $f_s$ heet de *Nyquist-frequentie*. Frequenties onder $f_s \/ 2$ blijven correct. Frequenties erboven worden aliasing (@sec:aliasing).

De slides schrijven "$>=$". Het examen eist "$>$". Bij exact $f_s = 2 f_"bw,in"$ hangt het van de fase af welke punten je raakt. Valt elk sample op een nuldoorgang, dan meet je overal 0 en is de sinus niet te reconstrueren.

In de praktijk kies je $f_s approx 5$ tot $10 times f_"max"$. Het anti-aliasingfilter (@ch:signaalconditionering) heeft geen oneindig steile flank. Door ruim te bemonsteren blijft er ruimte tussen de doorlaatband en $f_s \/ 2$.

#examenvraag("25-26 / oefenvraag E7", [Waarom eist Nyquist $f_s > 2 f_"max"$ en niet $f_s >= 2 f_"max"$?],
  opties: (
    [om een veiligheidsmarge te hebben],
    [omdat je een sinus die exact op $f_s \/ 2$ ligt niet kunt reconstrueren: je kunt op de nuldoorgangen bemonsteren en dan meet je overal nul],
    [omdat de ADC tijd nodig heeft],
    [omdat het filter niet ideaal is],
  ),
  juist: "B",
)[Bij exact $2 f_"max"$ bepaalt de fase of je de toppen of de nuldoorgangen raakt. Bij de nuldoorgangen is het resultaat 0 en gaat het signaal verloren. A, C en D beschrijven praktische problemen. Die verklaren waarom je in de praktijk $5$ tot $10 times f_"max"$ neemt, maar niet het strikte ongelijkheidsteken.]

== Aliasing <sec:aliasing>

*Aliasing* is het verschijnen van een te hoge frequentie als een lagere frequentie in de bemonsterde data. Bij te trage bemonstering passen de samples even goed op een veel tragere sinus. Achteraf weet je niet meer welke van de twee het echte signaal was.

=== Tijddomein <sec:alias-tijd>

#figure(
  image("assets/L19-alias-tijd.png", width: 10.5cm),
  caption: [Sinussen van 5, 10, 20 en 60 Hz bemonsterd op 50 Hz (slide 5). De 60 Hz-sinus geeft dezelfde samples als een sinus van 10 Hz.],
  label: <fig:L19-alias-tijd>,
)

Bij 5 Hz en 10 Hz zijn er genoeg samples per periode. De 20 Hz-sinus ligt net onder $f_s \/ 2 = 25 "Hz"$ en wordt met 2,5 samples per periode nog juist gevolgd. De 60 Hz-sinus ligt boven $f_s \/ 2$. De samples vallen op dezelfde punten als die van een sinus van 10 Hz, dus lees je 10 Hz.

=== Frequentiedomein <sec:alias-freq>

#figure(
  image("assets/L19-alias-freq.png", width: 85%),
  caption: [Spectrum bij $f_s > 2 f_"bw"$ (oversampling), $f_s = 2 f_"bw"$ (Nyquist) en $f_s < 2 f_"bw"$ (undersampling) (slide 6).],
  label: <fig:L19-alias-freq>,
)

Bemonsteren herhaalt het spectrum rond elk veelvoud van $f_s$. Bij $f_s > 2 f_"bw"$ blijven de kopieën gescheiden. Bij $f_s < 2 f_"bw"$ overlappen ze. Het deel boven $f_s \/ 2$ spiegelt dan terug in de band onder $f_s \/ 2$ en is niet meer te scheiden van het echte signaal.

#frm(
  "Aliasfrequentie",
  $f_"alias" = |f - k f_s|$,
  [Kies $k$ zo dat $f_"alias"$ tussen 0 en $f_s \/ 2$ ligt.],
)

met:
- $f_"alias"$ --- frequentie die je in de data ziet [Hz]
- $f$ --- werkelijke frequentie van het signaal [Hz]
- $f_s$ --- bemonsteringsfrequentie [Hz]
- $k$ --- geheel getal, het dichtstbijzijnde veelvoud van $f_s$ [-]

#oefening(title: "Aliasfrequentie bij 900 Hz op 1 kHz")[
  *Gegeven:* $f = 900 "Hz"$, $f_s = 1000 "Hz"$.

  *Gevraagd:* de frequentie $f_"alias"$ in de data.

  *Oplossing:*
  - *Stap 1, Nyquist-frequentie:* $f_s \/ 2 = 500 "Hz"$. Omdat $900 > 500$ treedt aliasing op.
  - *Stap 2, k kiezen:* $k = 1$ brengt het resultaat onder 500 Hz.
  - *Stap 3, formule:* $f_"alias" = |900 - 1 times 1000| = 100 "Hz"$.
  - *Check:* $100 < 500$. Je had minstens $2 times 900 = 1800 "Hz"$ nodig.
]

#oefening(title: "Aliasfrequentie bij 2300 Hz op 1 kHz")[
  *Gegeven:* $f = 2300 "Hz"$, $f_s = 1000 "Hz"$.

  *Gevraagd:* de frequentie $f_"alias"$ in de data.

  *Oplossing:*
  - *Stap 1, k kiezen:* $k = 1$ geeft $|2300 - 1000| = 1300 "Hz"$, nog boven 500 Hz. $k = 2$ geeft $|2300 - 2000| = 300 "Hz"$.
  - *Stap 2, resultaat:* $f_"alias" = 300 "Hz"$.
  - *Check:* $300 < f_s \/ 2 = 500 "Hz"$.
]

#examenvraag("oefenvraag E6", [Een signaal van 900 Hz wordt bemonsterd op 1 kHz. Welke frequentie zie je?],
  opties: (
    [900 Hz],
    [100 Hz],
    [450 Hz],
    [1900 Hz],
  ),
  juist: "B",
)[$f_"alias" = |900 - 1000| = 100 "Hz"$. A is de echte frequentie, die je niet meer ziet. C is de helft van 900 en komt niet uit de formule. D is $900 + 1000$, een som in plaats van het verschil met $k f_s$. Reken zo'n vraag altijd na met $|f - k f_s|$.]

=== Anti-aliasingfilter <sec:anti-alias>

Aliasing is achteraf niet te herstellen, omdat een gealiaste component dezelfde samples geeft als een echte component. Daarom filter je het signaal vóór de ADC met een *anti-aliasingfilter* (laagdoorlaat). Het filter dempt alles boven $f_s \/ 2$ voor de bemonstering. De uitwerking staat in @ch:signaalconditionering, de ADC zelf in @ch:adc.

#examenvraag("oefenvraag E2", [Waarom moet een anti-aliasingfilter vóór de ADC staan en niet erna?],
  opties: (
    [omdat een digitaal filter meer rekenkracht kost],
    [omdat aliasing bij het bemonsteren zelf ontstaat en daarna niet meer ongedaan te maken is],
    [omdat de ADC anders in verzadiging gaat],
    [omdat de ingangsimpedantie van de ADC te laag is],
  ),
  juist: "B",
)[Bij het bemonsteren vouwt alles boven $f_s \/ 2$ terug in de band. Een component van 1300 Hz op 1 kHz verschijnt als 300 Hz en is niet te onderscheiden van een echt signaal van 300 Hz. Een digitaal filter kan die informatie niet meer terughalen. A, C en D zijn geen reden die de slides geven.]
