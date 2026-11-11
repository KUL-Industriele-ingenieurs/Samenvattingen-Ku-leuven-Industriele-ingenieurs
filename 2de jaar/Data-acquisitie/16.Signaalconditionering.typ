#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/16.signal_conditioning.pdf | examenvragen 25-26 | oefenvragen E1-E4

= Signaalconditionering <ch:signaalconditionering>

== Types signaalconditionering <sec:sc-types>

Signaalconditionering maakt van het ruwe sensorsignaal een signaal dat een ADC of regelaar kan verwerken. De slides behandelen zeven onderdelen:

- *Wheatstonebrug* en excitatie (@sec:sc-excitatie)
- *Versterking* (@sec:sc-versterking)
- *Bekabeling* (@sec:sc-bekabeling)
- *AC-excitatie* van de brug (@sec:sc-excitatie)
- *Filtering* (@sec:sc-filtering)
- *Galvanische isolatie* (@sec:sc-isolatie)
- *Transmitter* (@sec:sc-transmitters)

== Excitatie: bron en brug <sec:sc-excitatie>

Een Wheatstonebrug zet een kleine weerstandsverandering om in een spanning $V_o$. Die is evenredig met de verandering van één weerstand, hier $R_2$. De brug zelf staat in @sec:wheatstonebrug.

#frm(
  "Uitgangsspanning van de brug",
  $V_o = V_B [ R_1 / (R_1 + R_4) - R_2 / (R_2 + R_3) ]$,
  [De brug is in evenwicht, $V_o = 0$, als $R_1 \/ R_4 = R_2 \/ R_3$.],
)

met:
- $V_B$ --- brugspanning [V]
- $R_1$ tot $R_4$ --- de vier brugweerstanden [$Omega$]

#figure(
  image("assets/L16-brug.png", width: 7cm),
  caption: [Wheatstonebrug: $V_o$ is evenredig met de verandering van $R_2$ (slide 6)],
  label: <fig:L16-brug>,
)

=== Spanningsbron of stroombron <sec:sc-bron>

Je kunt de brug voeden met een spanningsbron $V_B$ of een stroombron $I_B$. Het aantal veranderende elementen bepaalt de gevoeligheid en de lineariteitsfout (@sec:brugtypes).

#table(
  columns: 5,
  align: (left, center, center, center, center),
  table.header[Spanningsbron][A: 1 element][B: 2 elementen (1)][C: 2 elementen (2)][D: alle elementen],
  [$V_o$], [$V_B / 4 dot (Delta R) / (R + Delta R \/ 2)$], [$V_B / 2 dot (Delta R) / (R + Delta R \/ 2)$], [$V_B / 2 dot (Delta R) / R$], [$V_B dot (Delta R) / R$],
  [Lineariteitsfout], [$0.5 %\/%$], [$0.5 %\/%$], [$0$], [$0$],
)

#table(
  columns: 5,
  align: (left, center, center, center, center),
  table.header[Stroombron][A: 1 element][B: 2 elementen (1)][C: 2 elementen (2)][D: alle elementen],
  [$V_o$], [$(I_B R) / 4 dot (Delta R) / (R + Delta R \/ 4)$], [$I_B / 2 dot Delta R$], [$I_B / 2 dot Delta R$], [$I_B dot Delta R$],
  [Lineariteitsfout], [$0.25 %\/%$], [$0$], [$0$], [$0$],
)

Een stroombron geeft dus een lagere lineariteitsfout bij één element ($0.25 %\/%$ tegenover $0.5 %\/%$). Bij twee of vier elementen in de juiste opstelling is de uitgang lineair, ook met een spanningsbron.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L16-brug-spanning.png", width: 100%),
    caption: [Brug met spanningsbron: vier configuraties (slide 7)],
    label: <fig:L16-brug-spanning>,
  ),
  figure(
    image("assets/L16-brug-stroom.png", width: 100%),
    caption: [Brug met stroombron: vier configuraties (slide 8)],
    label: <fig:L16-brug-stroom>,
  ),
)

=== AC-excitatie <sec:sc-ac>

Alle offsetfouten van de brug samen noemen we $E_(o s)$. Je kunt $E_(o s)$ wegwerken door de brug afwisselend normaal en omgekeerd te voeden. Bij normale voeding is $V_A = V_o + E_(o s)$. Bij omgekeerde voeding is $V_B = -V_o + E_(o s)$. Het verschil is

$ V_A - V_B = (V_o + E_(o s)) - (-V_o + E_(o s)) = 2 V_o $

De offset valt dus weg en het signaal verdubbelt.

#figure(
  image("assets/L16-ac-excitatie.png", width: 8cm),
  caption: [Normale en omgekeerde voeding van de brug (slide 21)],
  label: <fig:L16-ac-excitatie>,
)

== Versterking <sec:sc-versterking>

Een brugsignaal is klein, enkele mV. Een versterker maakt het groot genoeg voor de ADC.

=== Verschilversterker <sec:sc-verschil>

Een verschilversterker versterkt het *verschil* tussen zijn twee ingangen.

#frm(
  "Verschilversterker",
  $V_"out" = A_(d m) (V_1 - V_2)$,
  [Met opamp en weerstanden is $A_(d m) = -R_2 \/ R_1$. Prijs: $0.5$ tot $5$ euro.],
)

met:
- $A_(d m)$ --- differentiële versterking [-]
- $V_1$, $V_2$ --- de twee ingangsspanningen [V]

#figure(
  image("assets/L16-verschilversterker.png", width: 8cm),
  caption: [Verschilversterker met opamp (slide 10)],
  label: <fig:L16-verschilversterker>,
)

=== Common mode en CMRR <sec:sc-cmrr>

Een *common-modesignaal* staat even groot op beide ingangen. Het is meestal ruis die op beide draden inkoppelt. Een echte versterker laat een klein deel daarvan toch door:

$ V_"out" = A_(d m) (V_1 - V_2) + A_(c m) V_(c m) $

Een goede versterker heeft $A_(c m)$ zo klein mogelijk. De *CMRR* (common mode rejection ratio) meet dat:

#frm(
  "CMRR",
  $"CMRR" = abs(A_(d m) / A_(c m)), quad "CMRR"_"dB" = 20 log_10 (A_(d m) / abs(A_(c m)))$,
  [Hoe groter de CMRR, hoe beter de versterker common mode onderdrukt.],
)

met:
- $A_(d m)$ --- differentiële versterking [-]
- $A_(c m)$ --- common-mode versterking [-]

Een ideale versterker heeft $A_(c m) = 0$ en dus een oneindige CMRR. De CMRR is een spotwaarde bij een bepaalde frequentie en daalt met de frequentie. Een brugsignaal van enkele mV vraagt daarom een hoge CMRR, want de common-modespanning is veel groter dan het nuttige signaal.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L16-common-mode.png", width: 100%),
    caption: [Common-modesignaal op beide ingangen (slide 11)],
    label: <fig:L16-common-mode>,
  ),
  figure(
    image("assets/L16-cmrr.png", width: 100%),
    caption: [Definitie van de CMRR (slide 12)],
    label: <fig:L16-cmrr>,
  ),
)

#figure(
  image("assets/L16-cmrr-frequentie.png", width: 9cm),
  caption: [CMRR daalt met de frequentie door onvolkomenheden in de versterker (slide 13)],
  label: <fig:L16-cmrr-frequentie>,
)

#examenvraag("oefenvraag E1", [Een instrumentatieversterker heeft een CMRR van $100 "dB"$. Het brugsignaal is $5 "mV"$ en er staat $2 "V"$ common-mode ruis op beide draden. Hoe groot is de fout aan de uitgang, uitgedrukt aan de ingang?],
  opties: ([$2 "mV"$], [$20 mu"V"$], [$200 mu"V"$], [$2 mu"V"$]),
  juist: "B",
)[$A_(d m) \/ A_(c m) = 10^(100 \/ 20) = 10^5$. De common-mode van $2 "V"$ wordt dus $10^5$ keer zwakker doorgegeven: $2 "V" \/ 10^5 = 20 mu"V"$. Dat is $0.4 %$ van het brugsignaal van $5 "mV"$.]

=== Instrumentatieversterker <sec:sc-inamp>

Een *instrumentatieversterker* (inamp) heeft een hoge ingangsweerstand op beide ingangen en een zeer goede CMRR. De versterking stel je nauwkeurig in met één weerstand $R_g$. De prijs ligt tussen $1$ en $150$ euro en de uitgang is niet-lineair.

#figure(
  image("assets/L16-inamp.png", width: 11cm),
  caption: [Instrumentatieversterker met brug en $R_g$ (slide 14)],
  label: <fig:L16-inamp>,
)

Een geïntegreerd systeem kan versterking en lineariseren samen doen (slide 15).

#figure(
  image("assets/L16-lineariserend.png", width: 11cm),
  caption: [Versterken en lineariseren in een geïntegreerd systeem (slide 15)],
  label: <fig:L16-lineariserend>,
)

== Bekabeling <sec:sc-bekabeling>

De kabels naar een sensor in een brug hebben zelf weerstand $R_"lead"$. Die kan een fout geven, net als bij de Pt100 (@sec:kabelweerstand).

=== Twee draden <sec:sc-2draad>

Bij twee draden loopt de voedingsstroom door de kabelweerstand. Die weerstand telt mee in de meting. Slide 17 geeft een offsetfout over de temperatuur van $+23 %$ van de volle schaal.

#figure(
  image("assets/L16-twee-draad.png", width: 11cm),
  caption: [Twee draden: fout door de kabelweerstand (slide 17)],
  label: <fig:L16-twee-draad>,
)

=== Drie draden <sec:sc-3draad>

Een derde draad meet de spanning over de sensor. Daar loopt geen stroom ($I = 0$), dus $R_"lead"$ heeft op die meting geen effect. De spanning over de voedingskabel veroorzaakt nog steeds een fout: $0 %$ offset en $-0.08 %$ gain (van de volle schaal).

#figure(
  image("assets/L16-drie-draad.png", width: 11cm),
  caption: [Drie draden: een restfout blijft (slide 18)],
  label: <fig:L16-drie-draad>,
)

=== Vier draden (Kelvin) <sec:sc-4draad>

Bij vier draden voeren twee draden de stroom en meten twee draden de spanning. Opamps compenseren de $R_"lead"$. Er loopt geen stroom naar $V_o$, dus de kabelweerstand valt weg.

#figure(
  image("assets/L16-vier-draad.png", width: 10cm),
  caption: [Vier draden (Kelvin): $R_"lead"$ gecompenseerd door opamps (slide 19)],
  label: <fig:L16-vier-draad>,
)

#examenvraag("oefenvraag E5", [Waarom meet je een Pt100 liefst met vier draden?],
  opties: (
    [om de zelfopwarming te beperken],
    [omdat de meetstroom en de spanningsmeting dan gescheiden zijn, zodat de kabelweerstand wegvalt],
    [om het bereik te vergroten],
    [om sneller te kunnen meten],
  ),
  juist: "B",
)[Twee draden voeren de stroom en twee draden meten de spanning zonder stroom. Zelfopwarming is een ander probleem (@sec:zelfopwarming).]

== Filtering en ruis <sec:sc-filtering>

Een filter laat de frequenties door die bij het signaal horen en houdt de rest tegen. Dat is nodig voor ruis, interferentie en aliasing.

=== Ruis en interferentie <sec:sc-ruis>

Er zijn drie soorten *ruis*:
- *witte ruis*: gelijke energie op elke frequentie, $S = k$
- *roze ruis (1/f)*: de energie daalt met $1 \/ f$
- *bruine ruis ($1\/f^2$)*: de energie daalt met $1 \/ f^2$

*Interferentie* is een stoorsignaal op een vaste frequentie. De slide toont een spectrum met pieken bij $50$ en $100 "Hz"$ (netruis), $120 "Hz"$ (optotrack-camera's), $21 "Hz"$ (onbekend), onder $6 "Hz"$ (beweging van de proefpersoon) en $0$ tot $20 "Hz"$ (verkeer en trillingen).

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L16-ruis.png", width: 100%),
    caption: [Witte, roze en bruine ruis (slide 24)],
    label: <fig:L16-ruis>,
  ),
  figure(
    image("assets/L16-interferentie.png", width: 100%),
    caption: [Interferentie in een spectrum (slide 25)],
    label: <fig:L16-interferentie>,
  ),
)

=== Anti-aliasing <sec:sc-antialiasing>

Een anti-aliasingfilter is een laagdoorlaatfilter voor de sampler. Het beperkt het spectrum van het analoge signaal tot onder $f_s \/ 2$. Het staat vóór de ADC, want aliasing ontstaat bij het bemonsteren zelf (@sec:nyquist en @sec:aliasing).

#figure(
  image("assets/L16-anti-aliasing.png", width: 12cm),
  caption: [Laagdoorlaatfilter vóór de sampler en quantizer (slide 26)],
  label: <fig:L16-anti-aliasing>,
)

#examenvraag("oefenvraag E2", [Waarom moet een anti-aliasingfilter vóór de ADC staan en niet erna?],
  opties: (
    [omdat een digitaal filter meer rekenkracht kost],
    [omdat aliasing bij het bemonsteren zelf ontstaat en daarna niet meer ongedaan te maken is],
    [omdat de ADC anders in verzadiging gaat],
    [omdat de ingangsimpedantie van de ADC te laag is],
  ),
  juist: "B",
)[Bij het bemonsteren vouwt alles boven $f_s \/ 2$ terug in de band. Een component van $1300 "Hz"$ bij $f_s = 1 "kHz"$ verschijnt als $300 "Hz"$. Dat is niet te onderscheiden van een echt signaal van $300 "Hz"$. Een digitaal filter kan dat niet herstellen.]

=== Een filter kiezen <sec:sc-filterkeuze>

Volg deze stappen:
+ Bekijk het spectrum (PSD) van het signaal.
+ Bepaal wat je wilt wegfilteren.
+ Kies het type: laagdoorlaat, hoogdoorlaat, banddoorlaat of notch.
+ Kies de relevante frequenties: grensfrequentie en doorlaatband.

#figure(
  image("assets/L16-filtertypes.png", width: 9cm),
  caption: [Laagdoorlaat, hoogdoorlaat, banddoorlaat en notch (slide 31)],
  label: <fig:L16-filtertypes>,
)

=== Bodediagram <sec:sc-bode>

Het bodediagram van een filter toont de versterking en de fase in functie van de frequentie. Het heeft een doorlaatgebied, een overgangsgebied en een sperband. De *afsnijfrequentie* ligt bij $-3 "dB"$, dat is $0.707 V_"in"$. In het overgangsgebied daalt de versterking met $-20 "dB/decade"$ en draait de fase met $-45 degree$/decade, tussen $0.1$ en $10$ keer de doorlaatfrequentie.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L16-bode.png", width: 100%),
    caption: [Doorlaat-, overgangs- en sperband (slide 28)],
    label: <fig:L16-bode>,
  ),
  figure(
    image("assets/L16-bode-amp.png", width: 100%),
    caption: [Afsnijfrequentie bij $-3 "dB"$ $= 0.707 V_"in"$ (slide 29)],
    label: <fig:L16-bode-amp>,
  ),
)

#figure(
  image("assets/L16-bode-fase.png", width: 8cm),
  caption: [Faserespons: $-45 degree$/decade (slide 30)],
  label: <fig:L16-bode-fase>,
)

== Galvanische isolatie <sec:sc-isolatie>

Galvanische isolatie scheidt twee delen van een schakeling elektrisch, maar laat het signaal door. Ze beschermt personen en machines tegen overspanningen en voorkomt vereffeningsstromen tussen verschillende massa's.

#figure(
  image("assets/L16-isolatie.png", width: 10cm),
  caption: [Galvanische, optische en inductieve isolatie in een USB-hub (slide 33)],
  label: <fig:L16-isolatie>,
)

Er zijn drie technieken:
- *Capacitief:* snel, compact, lage vertraging, kleine signalen. Toepassing: DC-DC, SMPS, RS-485, I2C, SPI, CAN.
- *Optisch:* snel, groot spanningsbereik, compact, ruisongevoelig, beperkte analoge bandbreedte.
- *Inductief:* hoge spanning (meer dan $"kV"$), ruisongevoelig, bescherming tegen pieken, efficiënte energieoverdracht.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.5em,
  align: horizon,
  figure(
    image("assets/L16-isolatie-cap.png", width: 100%),
    caption: [Capacitief (slide 34)],
    label: <fig:L16-isolatie-cap>,
  ),
  figure(
    image("assets/L16-isolatie-opt.png", width: 100%),
    caption: [Optisch (slide 35)],
    label: <fig:L16-isolatie-opt>,
  ),
  figure(
    image("assets/L16-isolatie-ind.png", width: 100%),
    caption: [Inductief (slide 36)],
    label: <fig:L16-isolatie-ind>,
  ),
)

#examenvraag("25-26 vraag 11", [Welk type galvanische isolatie gebruik je voor een hoogfrequent, laagvermogen analoog signaal met minimale vertraging?],
  opties: (
    [geen van de andere],
    [capacitief],
    [optisch],
    [inductief],
  ),
  juist: "B",
)[Capacitieve isolatie is snel, compact en heeft een lage vertraging voor kleine signalen. Optisch heeft een beperkte analoge bandbreedte. Inductief dient voor hoge spanning en energieoverdracht.]

== Transmitters <sec:sc-transmitters>

Een transmitter zet het sensorsignaal om in een industrieel standaardsignaal en stuurt het naar de regelaar. De keten is: fysische grootheid, sensor of transducer, transmitter, controller.

#figure(
  image("assets/L16-transmitter.png", width: 11cm),
  caption: [Van fysische grootheid naar controller (slide 38)],
  label: <fig:L16-transmitter>,
)

=== 4-20 mA stroomlus <sec:sc-4-20>

De uitgang van de transmitter is een stroom van $4$ tot $20 "mA"$ naar de PLC. Een tweedraadstransmitter krijgt zijn voeding en stuurt zijn meetstroom over dezelfde twee draden. Een vierdraadstransmitter heeft aparte voedingsdraden.

#figure(
  image("assets/L16-transmitter-draden.png", width: 11cm),
  caption: [Vierdraads- en tweedraadstransmitter met $4$-$20 "mA"$ naar de PLC (slide 41)],
  label: <fig:L16-transmitter-draden>,
)

De slides leggen niet uit waarom het signaal bij $4 "mA"$ begint. De oefenvragen geven de redenen:
- *Live zero:* $0 "mA"$ betekent een gebroken draad en geen meting van nul.
- De stroom in een lus is overal gelijk, dus de kabelweerstand speelt geen rol.
- De tweedraadstransmitter voedt zichzelf uit de minimale $4 "mA"$.

#examenvraag("oefenvraag E3", [Waarom stuurt een industriële transmitter $4$-$20 "mA"$ en niet $0$-$20 "mA"$?],
  opties: (
    [omdat $0 "mA"$ niet kan],
    [omdat een gebroken draad ($0 "mA"$) dan te onderscheiden is van een meting van nul],
    [omdat de voeding minstens $4 "mA"$ nodig heeft],
    [om de kabelweerstand te compenseren],
  ),
  juist: "B",
)[Dat heet live zero. Bij $0$-$20 "mA"$ lijkt een kabelbreuk op een geldige meting van de laagste waarde. De sensor kan zich ook voeden uit de $4 "mA"$, maar dat is een bijkomend voordeel. Dat je stroom stuurt, vermijdt de kabelweerstand, want de stroom in een lus is overal gelijk.]

#examenvraag("oefenvraag E4", [Een $4$-$20 "mA"$ transmitter meet $0$-$200 degree "C"$. Je leest $12 "mA"$ af over een weerstand van $250 Omega$. Welke temperatuur en welke spanning?],
  opties: (
    [$100 degree "C"$ en $3 "V"$],
    [$120 degree "C"$ en $3 "V"$],
    [$100 degree "C"$ en $2.4 "V"$],
    [$150 degree "C"$ en $5 "V"$],
  ),
  juist: "A",
)[Temperatuur: $(12 - 4) \/ 16 dot 200 = 100 degree "C"$. Spanning: $0.012 dot 250 = 3 "V"$. Over $250 Omega$ wordt $4$-$20 "mA"$ precies $1$-$5 "V"$, het standaard ingangsbereik van een ADC.]

=== Smart transmitter (HART) <sec:sc-hart>

Een smart transmitter stuurt een digitaal signaal over dezelfde $4$-$20 "mA"$-lus. Het protocol heet HART. Het draagt instrumentnamen (tags), kalibratiegegevens en sensordiagnose.

#figure(
  image("assets/L16-smart.png", width: 10cm),
  caption: [Smart transmitter met digitale data over de lus (slide 42)],
  label: <fig:L16-smart>,
)

=== Voorbeeld: Pt100-transmitter <sec:sc-voorbeeld>

De Omega TXDIN70 ($150$ euro) en de Siemens SITRANS TH100 ($100$ tot $200$ euro) zetten een Pt100 om naar $4$-$20 "mA"$. Het blokschema bevat EMC-filters, een multiplexer, een A/D-omzetter, een microcontroller, een D/A-omzetter en de $4$-$20 "mA"$-uitgang.

#figure(
  image("assets/L16-voorbeeld.png", width: 11cm),
  caption: [Blokschema van een Pt100-transmitter (slide 45)],
  label: <fig:L16-voorbeeld>,
)
