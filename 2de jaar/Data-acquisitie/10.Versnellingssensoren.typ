#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/10.accel.pdf (slide 2-19) | Samenvatting DAQ p.40-44 | examenvragen 2016, 2017, 25-26, oefenvraag E19

= Versnellingssensoren <ch:versnelling>

Een versnellingssensor meet de versnelling $a$ van een voorwerp, in [m/s$""^2$]. Dat kan relatief, uit een positie- of snelheidssignaal, of absoluut, met een seismische massa in de sensor zelf.

== Relatieve versnelling <sec:rel-versnelling>

Een relatieve versnelling volgt uit differentiatie van een snelheids- of positiesignaal.

#frm(
  "Relatieve versnelling",
  $a = (d v) / (d t) = (d^2 x) / (d t^2)$,
  [Versnelling is de afgeleide van de snelheid, of de tweede afgeleide van de positie.],
)

met:
- $a$ --- versnelling [m/s$""^2$]
- $v$ --- snelheid [m/s]
- $x$ --- positie [m]
- $t$ --- tijd [s]

Het ruisprobleem uit hoofdstuk @ch:snelheid wordt hier erger. Een ruiscomponent met pulsatie $omega_"ruis"$ wordt bij elke differentiatie met een factor $omega_"ruis"$ vergroot. Bij dubbele differentiatie is dat $omega_"ruis"^2$. Dubbel differentiëren lukt dus zelden nauwkeurig, behalve bij zeer gladde signalen. Eén keer differentiëren van een snelheidssignaal kan soms wel.

#figure(
  image("assets/L10-ruis.png", width: 12cm),
  caption: [1 % ruis op de positie geeft een bruikbare snelheid en een sterk verstoorde versnelling (slide 5)],
  label: <fig:L10-ruis>,
)

Voor *traagheidsnavigatie* (gyroscopen en versnellingsmeters samen) bestaan er twee opstellingen.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L10-gimbal.png", width: 100%),
    caption: [Gimbaled: sensoren op een mechanisch frame (slide 3)],
    label: <fig:L10-gimbal>,
  ),
  figure(
    image("assets/L10-strapdown.png", width: 100%),
    caption: [Strapdown: gyro en accelerometer geïntegreerd tot attitude, snelheid en positie (slide 4)],
    label: <fig:L10-strapdown>,
  ),
)

- *Gimbaled*: de sensoren hangen op een gimbal, een mechanisch frame dat ze in dezelfde oriëntatie houdt ten opzichte van een vaste referentie, zoals de horizon. De uitlezing is stabiel en direct, zonder complexe berekeningen. Het systeem is wel zwaar, duur en slijtagegevoelig.
- *Strapdown*: de sensoren zitten vast op het voertuig en draaien mee. Een processor rekent met digitale berekeningen de oriëntatie en versnelling uit, en trekt de zwaartekracht af. Dat systeem is lichter, goedkoper en heeft geen bewegende delen. Het vraagt wel een krachtige processor, en de drift loopt na verloop van tijd op.

== Seismische versnellingsmeter <sec:seismisch>

Een seismische (absolute) versnellingsmeter meet de absolute versnelling met een massa $M$ die via een veer en een demper aan de behuizing hangt. Versnelt de behuizing, dan blijft de massa door zijn traagheid achter. De uitwijking tussen massa en behuizing is een maat voor de versnelling.

Dit type is de belangrijkste opnemer voor trillingen, schokken en algemene absolute bewegingen. Verplaatsing en snelheid volgen er door integreren uit, en dat is nauwkeuriger dan differentiëren. Schokken meet je er gemakkelijker mee dan met een verplaatsings- of snelheidssensor.

De massa kan geen onderscheid maken tussen een versnelling door een kracht en de zwaartekracht. Accelerometers worden ingedeeld in twee types:
- *deflection type*: een massa-veer-demper met een verplaatsingsopnemer, voor algemene trillings- en schokmetingen
- *null-balance (servo) type*: met terugkoppeling, voor zeer hoge nauwkeurigheid

=== Deflection type: bewegingsvergelijking <sec:seismisch-model>

#figure(
  image("assets/L10-seismisch.png", width: 8cm),
  caption: [Deflection-type accelerometer: massa $M$, veer $K_s$, demper $B$ en relatieve verplaatsingsopnemer in een behuizing met verplaatsing $x_i$ (slide 8)],
  label: <fig:L10-seismisch>,
)

De behuizing verplaatst over $x_i$, de massa over $x_M$. De opnemer meet de relatieve verplaatsing $x_0 = x_i - x_M$. Op de massa werken de veerkracht en de dempingskracht, beide op basis van $x_0$.

$ M dot.double(x)_M = K_s x_0 + B dot(x)_0 $

Met $x_M = x_i - x_0$ is $dot.double(x)_M = dot.double(x)_i - dot.double(x)_0$. Invullen, delen door $M$ en herschrijven met $omega_n$ en $zeta$ geeft

$ dot.double(x)_i / omega_n^2 = x_0 + (2 zeta) / omega_n dot(x)_0 + dot.double(x)_0 / omega_n^2 $

#frm(
  "Eigenfrequentie en dempingsfactor",
  $omega_n = sqrt(K_s / M) quad zeta = B / (2 sqrt(K_s M))$,
  [De eigenpulsatie volgt uit veer en massa, de dempingsfactor uit de demper.],
)

met:
- $omega_n$ --- eigenpulsatie, $2 pi f_n$ [rad/s]
- $K_s$ --- veerconstante [N/m]
- $M$ --- seismische massa [kg]
- $B$ --- dempingsconstante [N/(m/s)]
- $zeta$ --- dempingsfactor [-]

Voor een sinusvormige versnelling levert de vergelijking de overdracht tussen de uitwijking $x_0$ en de opgelegde versnelling $dot.double(x)_i$.

#frm(
  "Amplituderespons van de accelerometer",
  $ (x_0 (omega)) / (dot.double(x)_i (omega)) = (1 / omega_n^2) / sqrt([1 - (omega / omega_n)^2]^2 + 4 zeta^2 (omega / omega_n)^2) $,
  [Het quotiënt van de uitwijking en de versnelling als functie van de frequentie.],
)

met:
- $x_0$ --- relatieve verplaatsing gemeten door de opnemer [m]
- $dot.double(x)_i$ --- versnelling van de behuizing [m/s$""^2$]
- $omega$ --- pulsatie van de versnelling [rad/s]

=== Twee werkingsgebieden <sec:seismisch-gebieden>

#figure(
  image("assets/L10-bode.png", width: 10cm),
  caption: [Amplituderespons met pieken rond $omega_n$ en een afnemende respons erboven (slide 10)],
  label: <fig:L10-bode>,
)

Bij $omega << omega_n$ is de wortel ongeveer $1$. Dan is $x_0 approx dot.double(x)_i \/ omega_n^2$. De uitwijking is evenredig met de versnelling. Zo gebruik je het systeem als *accelerometer*. De gevoeligheid is $1 \/ omega_n^2$. Een lage $omega_n$ geeft dus een grote uitwijking per eenheid versnelling, maar een klein werkingsgebied. Als vuistregel is de respons vlak tot $f_n \/ 5$.

Bij $omega = omega_n$ ontstaat resonantie. De amplitude is dan maximaal en hangt af van de demping. Een hogere $zeta$ verlaagt de piek.

Bij $omega >> omega_n$ blijft de massa in rust ten opzichte van de ruimte. De behuizing beweegt, dus $x_0 approx x_i$. De opnemer meet de verplaatsing zelf, en het systeem is een *seismometer*.

Je kiest $K_s$ en $M$ zodat het frequentiebereik van je meting onder $omega_n$ blijft.

#examenvraag("oefenvraag E19", [Een seismische accelerometer heeft $m = 10$ g en $k = 10^5$ N/m. Tot ongeveer welke frequentie is hij bruikbaar als versnellingsmeter?],
  opties: (
    [tot 500 Hz],
    [tot ongeveer 100 Hz],
    [boven 500 Hz],
    [tot 5 kHz],
  ),
  juist: "B",
)[$omega_n = sqrt(k \/ m) = sqrt(10^5 \/ "0,01") = 3162$ rad/s, dus $f_n = 503$ Hz. Als versnellingsmeter werk je ruim onder $f_n$, met als vuistregel $f_n \/ 5 approx 100$ Hz. Daar is de amplitudekarakteristiek vlak. A en C zijn fout: bij $500$ Hz zit je op de resonantiepiek. D is fout: dat ligt ver boven $f_n$, waar het systeem een seismometer is.]

=== Opnemers voor de verplaatsing <sec:seismisch-opnemers>

De relatieve verplaatsing $x_0$ kan gemeten worden met een potentiometer, een niet-gebonden of gebonden rekstrookje, een differentiële transformator (LVDT), een capacitieve of een piëzo-elektrische opnemer.

*Gebonden rekstrookjes.* De massa hangt aan twee veren met rekstrookjes erop. Vier rekstrookjes vormen samen een brug (hoofdstuk @ch:rekstroken-1).

#figure(
  image("assets/L10-rekstrook.png", width: 7cm),
  caption: [Seismische massa met rekstrookjes op de veer (slide 12)],
  label: <fig:L10-rekstrook>,
)

*Capacitieve accelerometer.* De sensor bestaat uit lagen: elektrode, afstandhouder, seismisch element, afstandhouder en elektrode. De massa verschuift ten opzichte van de behuizing. De spiraal werkt als veer. De gaten in de massa dempen, want de lucht in de condensator moet erdoor. Meer gaatjes geven minder demping. De uitwijking is evenredig met de versnelling, dus de capaciteit meet versnelling en geen snelheid. Hoofdstuk @ch:mems beschrijft de uitvoering met twee capaciteiten $C_1$ en $C_2$.

#figure(
  image("assets/L10-capacitief.png", width: 12cm),
  caption: [Opbouw van een capacitieve accelerometer: elektrode, spacer, seismisch element, spacer, elektrode (slide 13)],
  label: <fig:L10-capacitief>,
)

=== Piëzo-elektrische accelerometer <sec:piezo-accelerometer>

Een piëzo-elektrische accelerometer zet de kracht van een seismische massa op een kristal om in elektrische lading. Hij is een passieve sensor, want het kristal wekt zelf zijn lading op. Hij wordt vooral gebruikt voor trillingen en schokken. Een constante versnelling kan hij niet meten.

#frm(
  "Lading van een piëzo-accelerometer",
  $q = d F = d M a$,
  [De lading is evenredig met de versnelling.],
)

met:
- $q$ --- lading [C]
- $d$ --- piëzo-elektrische constante [C/N]
- $M$ --- seismische massa [kg]
- $a$ --- versnelling [m/s$""^2$]

De sensor geeft een grote uitgangsspanning en heeft een hoge eigenfrequentie. Er is geen aparte demping. De natuurlijke dempingsfactor is zeer klein, ongeveer 0,01. Dat is aanvaardbaar omdat de eigenfrequentie hoog is.

#frm(
  "Eigenfrequentie van de piëzo-accelerometer",
  $f_n = 1 / (2 pi) sqrt(K_s / M)$,
  [Bovengrens van het bruikbare frequentiegebied.],
)

met:
- $f_n$ --- eigenfrequentie [Hz]
- $K_s$ --- stijfheid van het kristal en de opstelling [N/m]
- $M$ --- seismische massa [kg]

Het kristal zit parallel met zijn eigen capaciteit $C_T$ en de ingangsweerstand $R$ van de versterker. De lading lekt via $R$ weg met tijdconstante $tau = R C_T$.

#frm(
  "Ondergrens van het frequentiegebied",
  $f_0 = 1 / (2 pi R C_T)$,
  [Onder deze frequentie lekt de lading weg voor ze kan worden uitgelezen.],
)

met:
- $f_0$ --- ondergrens van het frequentiegebied [Hz]
- $R$ --- ingangsweerstand van de versterker [Ω]
- $C_T$ --- totale capaciteit van kristal, kabel en versterker [F]

Is de periode van het signaal veel korter dan $tau$, dan bouwt het kristal de lading sneller op dan ze wegvloeit. Je meet dan de volle lading. Bij een lage frequentie is de lading al grotendeels weggelekt. Bij een constante versnelling is de frequentie nul en lekt alles weg. Een shuntcondensator vergroot $C_T$ en verlaagt $f_0$, maar verlaagt ook de gevoeligheid. Een ladingsversterker verlaagt $f_0$ nog verder. Echt $0$ Hz haalt geen van beide (hoofdstuk @ch:kracht).

Het bruikbare gebied ligt dus tussen $f_0$ (lekken) en $f_n$ (mechanische resonantie). De nauwkeurigheid is $plus.minus 5 %$ ruim onder $f_n$. Onder 1 Hz veroorzaken temperatuurtransiënten bovendien fouten, omdat ze een lading geven die je niet van een echt trillingssignaal kunt onderscheiden.

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L10-piezo-bereik.png", width: 100%),
    caption: [Verhouding uitgang tot ingang in functie van de frequentie, met banden van $plus.minus 5 %$ en $plus.minus 3$ dB (slide 15)],
    label: <fig:L10-piezo-bereik>,
  ),
  figure(
    image("assets/L10-iepe.png", width: 100%),
    caption: [IEPE-sensor: versterker in de behuizing, voeding via een constante-stroombron op dezelfde kabel (slide 16)],
    label: <fig:L10-iepe>,
  ),
)

Een *IEPE-accelerometer* (Integrated Electronics Piezo-Electric) heeft een versterker in de behuizing. Die zet het hoogimpedante ladingssignaal van het kristal om in een laagimpedante spanning. Zo is de kabel minder kritisch en kan hij lang zijn. De versterker heeft voeding nodig, een constante stroom van 2 tot 20 mA. Die stroom loopt over dezelfde draad als het signaal, dus de sensor heeft twee aansluitingen. De maximale temperatuur is 121 °C, of 175 °C bij speciale uitvoeringen. Het blijft een piëzo-sensor, dus een constante versnelling en de zwaartekracht meet hij niet.

#examenvraag("2017 vraag 9", [Een seismische massa op een piëzokristal in een behuizing: welk soort sensor is dit?],
  opties: (
    [piëzo-elektrische accelerometer],
    [piëzo-elektrische snelheidsmeter],
    [verplaatsingssensor],
  ),
  juist: "A",
)[De massa drukt bij versnelling op het kristal met $F = M a$, en het kristal geeft $q = d M a$. De lading is dus evenredig met de versnelling. B en C zijn fout: de lading hangt niet af van de snelheid of de verplaatsing.]

#examenvraag("2016 (17/06) vraag 7, 2016 (januari) vraag 15 en 25-26 vraag 10", [Een IEPE-accelerometer ...],
  opties: (
    [heeft een voedingsspanning nodig],
    [heeft slechts 3 aansluitingen],
    [meet ook constante versnelling],
    [meet ook gravitatieversnelling],
  ),
  juist: "A",
)[De ingebouwde versterker heeft een constante-stroombron nodig. Voeding en signaal delen één draad, dus er zijn twee aansluitingen en B is fout. C en D zijn hetzelfde antwoord in andere woorden: het blijft een piëzo-sensor en meet dus niets bij frequentie nul.]

== Null-balance (servo) accelerometer <sec:servo>

Een servo-accelerometer houdt de massa dicht bij de nulstand met een tegenwerkende elektromagnetische kracht. Een verplaatsingsopnemer meet de uitwijking. Een versterker stuurt een stroom door een spoel, die een kracht evenredig met die uitwijking op de massa uitoefent. Zo vervangt een elektrische veer de mechanische.

#figure(
  image("assets/L10-servo.png", width: 9cm),
  caption: [Servo-accelerometer: massa, relatieve verplaatsingsopnemer, versterker en spoel (slide 18)],
  label: <fig:L10-servo>,
)

Voordelen ten opzichte van een mechanische veer:
- betere lineariteit en minder hysterese
- elektrische demping, die minder temperatuurgevoelig is dan mechanische demping
- zelfcontrole mogelijk
- geschikt voor lage frequenties en algemene bewegingen

Servo-accelerometers worden gebruikt voor complexe tests en in onderzeeërs, vliegtuigen en ruimtevaartuigen.
