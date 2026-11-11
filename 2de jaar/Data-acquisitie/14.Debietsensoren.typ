#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/14.flow.pdf | examenvragen 2015, 2016, 2017 | oefenvragen E17, E18

= Debietsensoren <ch:debiet>

Een debietsensor meet hoeveel vloeistof of gas per seconde door een leiding stroomt, $Q = A v$ met $A$ de doorsnede en $v$ de gemiddelde snelheid. De vier methodes hieronder meten die snelheid of een grootheid die ervan afhangt.

== Thermische anemometers <sec:anemometer>

Een hot-wire anemometer meet de snelheid van een stroming met een verhitte draad die de stroming afkoelt. De draad is dun (wolfraam, $0.0003 "in"$ diameter, $0.04 "in"$ lang, $1 thin Omega$) en staat loodrecht op de stroming. Hoe sneller het medium stroomt, hoe meer warmte het afvoert.

De draad zit als $R_w$ in een brug met een galvanometer die het evenwicht detecteert. Je regelt de stroom zo dat de brug in evenwicht blijft, en meet die stroom $I$. Het verband is niet lineair: $I^2$ is een rechte in functie van $sqrt(v)$.

#figure(
  image("assets/L14-hotwire.png", width: 7cm),
  caption: [Hot-wire anemometer: draad, brug en $I^2$ in functie van $sqrt(v)$ (slide 2)],
  label: <fig:L14-hotwire>,
)

- Een *tweede draad* compenseert de temperatuur.
- Ook *lage debieten* zijn meetbaar.
- Het verband is *niet lineair*.

Het voorbeeld in de slides (SEFRAM 9862) meet $0$ tot $25 "m/s"$ bij $-20$ tot $60 degree"C"$, met een resolutie van $0.01 "m/s"$, en kost ongeveer 300 euro (slide 3).

== Differentiële-druk debietmeters <sec:dp-debiet>

#concept(title: "Obstructiemeter")[
  Een differentiële-druk debietmeter plaatst een vernauwing in de leiding. De stroming versnelt in de vernauwing en de druk daalt. Het drukverschil $Delta p = P_1 - P_2$ tussen vóór en in de vernauwing geeft het debiet. De slides noemen dit een "variable-pressure-drop meter" of "obstruction meter".
]

=== Meetflens (sharp-edge orifice) <sec:orifice>

Een meetflens is een plaat met een scherpe opening in de leiding. Het drukverloop toont een *gemeten drukval* tussen punt 1 en punt 2 en een *blijvend drukverlies* verder stroomafwaarts.

#figure(
  image("assets/L14-orifice.png", width: 8cm),
  caption: [Meetflens: drukverloop, gemeten drukval en blijvend drukverlies (slide 4)],
  label: <fig:L14-orifice>,
)

De formule volgt uit behoud van massa en Bernoulli. Dezelfde massastroom moet sneller door de vernauwing. Voor punt 1 voor en punt 2 in de vernauwing is

$ P_1 + 1/2 rho v_1^2 = P_2 + 1/2 rho v_2^2 quad arrow.double quad Delta p = 1/2 rho (v_2^2 - v_1^2) $

Met $A_1 v_1 = A_2 v_2$ is $v_1 = (A_2 \/ A_1) v_2$, dus $Delta p = 1/2 rho v_2^2 (1 - (A_2 \/ A_1)^2)$. Vermenigvuldig $v_2$ met $A_2$ en je hebt het theoretische debiet:

#frm(
  "Theoretisch debiet",
  $Q_t = A_2 / sqrt(1 - (A_2 / A_1)^2) sqrt((2 (P_1 - P_2)) / rho)$,
  [Het debiet is evenredig met $sqrt(Delta p)$: het verband is intrinsiek niet-lineair.],
)

Een echte meter wijkt af, daarom voert men de *discharge coëfficiënt* $C_d = Q_a \/ Q_t$ in:

#frm(
  "Werkelijk debiet",
  $Q_a = (C_d A_2) / sqrt(1 - (A_2 / A_1)^2) sqrt((2 (P_1 - P_2)) / rho)$,
  [Het werkelijke debiet is $C_d$ keer het theoretische.],
)

met:
- $Q_a$ --- werkelijk debiet [m$""^3$/s]
- $Q_t$ --- theoretisch debiet [m$""^3$/s]
- $A_1$ --- doorsnede van de leiding [m$""^2$]
- $A_2$ --- doorsnede van de opening [m$""^2$]
- $rho$ --- massadichtheid van het medium [kg/m$""^3$]
- $P_1$, $P_2$ --- statische drukken op de twee meetpunten [Pa]
- $C_d$ --- discharge coëfficiënt [--]

$C_d$ hangt af van het getal van Reynolds $N_R$ en van de verhouding $beta$ = diameter van de opening / diameter van de leiding. Voor $N_R$ boven ongeveer $10^4$ is $C_d$ vrijwel constant (rond $0.63$) voor $beta = 0.2$ en $beta = 0.8$.

#figure(
  image("assets/L14-cd.png", width: 7cm),
  caption: [$C_d$ in functie van het getal van Reynolds voor $beta = 0.2$ en $beta = 0.8$ (slide 7)],
  label: <fig:L14-cd>,
)

De drukmeetpunten (taps) kunnen op drie plaatsen zitten (slide 4):
- *Flange taps:* het meest gebruikt.
- *Vena-contracta taps:* grootste $Delta p$, iets nauwkeuriger.
- *Pipe taps:* meten het blijvende drukverlies. Het kleine $Delta p$ verkleint de samendrukbaarheidscorrectie bij gasdebieten.

#examenvraag("2017 vraag 2", [Een differentiële druksensor als debietmeter: de snelheid is ...],
  opties: (
    [evenredig met de druk],
    [omgekeerd evenredig met de druk],
    [evenredig met het kwadraat van de druk],
    [evenredig met de wortel van de druk],
  ),
  juist: "D",
)[Uit de afleiding hierboven: $v_2 = sqrt(2 Delta p \/ (rho (1 - A_2^2 \/ A_1^2))) prop sqrt(Delta p)$. De snelheid, en dus $Q = A v$, gaat met de wortel van het drukverschil. A en C volgen niet uit $Delta p prop v^2$. B is fout: meer snelheid geeft meer drukval, niet minder.]

#examenvraag("oefenvraag E17", [Een venturi geeft bij vol debiet een drukverschil van $100 "mbar"$. Bij welk drukverschil meet je de helft van het debiet?],
  opties: ([$50 "mbar"$], [$25 "mbar"$], [$70 "mbar"$], [$10 "mbar"$]),
  juist: "B",
)[$Q prop sqrt(Delta p)$, dus $Delta p prop Q^2$. De helft van $Q$ geeft een kwart van $Delta p$: $100 "mbar" \/ 4 = 25 "mbar"$. Dat is meteen het nadeel van deze meters. Bij klein debiet wordt $Delta p$ zo klein dat de relatieve meetfout groot wordt. Het bruikbare bereik is daarom hooguit 1:3 tot 1:4.]

=== Flow nozzle, venturi en Dall-buis <sec:venturi>

Een flow nozzle, een venturi en een Dall-buis vernauwen de leiding geleidelijker dan een meetflens. Ze gebruiken dezelfde formule voor $Q_a$ maar met een andere $C_d$ en een lager blijvend drukverlies.

#figure(
  image("assets/L14-nozzle-venturi-dall.png", width: 6.5cm),
  caption: [Flow nozzle, venturi (met piëzometerringen) en Dall flow tube (slide 8)],
  label: <fig:L14-nozzle-venturi-dall>,
)

#table(
  columns: (auto, 1fr, 1fr, 1fr),
  align: (left, left, left, left),
  table.header([*Eigenschap*], [*Flow nozzle*], [*Venturi*], [*Dall-buis*]),
  [Correctiecoëfficiënt $C_d$], [$0.94$ tot $0.99$, weinig correctie], [idem flow nozzle], [$0.68$ tot $0.7$, constant over een groot bereik],
  [Drukverlies], [gelijk aan meetflens], [klein ($10$ tot $15 %$), onafhankelijk van $beta$], [kleinste ($< 10 %$)],
  [Verstopping], [klein], [best], [klein],
  [Nauwkeurigheid], [--], [best], [--],
  [Nauwkeurigheid op lange termijn (na erosie)], [beter dan meetflens], [beter dan meetflens], [beter dan meetflens],
)

Een venturi geeft dus een klein blijvend drukverlies en de beste nauwkeurigheid. De Dall-buis verliest nog minder druk.

=== Laminar flow element <sec:laminar>

Een laminar flow element laat het medium door veel kleine kanalen stromen, zodat de stroming laminair is en het drukverschil lineair met het debiet meegroeit. Het *honingraat*-element ("metering element") zit tussen twee flow straighteners.

#figure(
  image("assets/L14-laminair.png", width: 7cm),
  caption: [Laminar flow element met flow straighteners en een honingraatelement (slide 11)],
  label: <fig:L14-laminair>,
)

#frm(
  "Laminair debiet",
  $Q = (pi D^4) / (128 mu L) Delta P$,
  [Hier is $Q$ wél lineair in $Delta P$, in tegenstelling tot de meetflens en de venturi.],
)

met:
- $Q$ --- volumedebiet [m$""^3$/s]
- $D$ --- binnendiameter van de buis [m]
- $mu$ --- viscositeit van het medium [N s/m$""^2$]
- $L$ --- lengte van de buis tussen de drukmeetpunten [m]
- $Delta P$ --- drukverschil [Pa]

De drukverschillen meet je met een differentiële-druksensor, zoals de Deltabar PMD75 van Endress+Hauser (nauwkeurigheid tot $0.05 %$, bereik $10 "mbar"$ tot $250 "bar"$, slide 12).

== Ultrasone debietmeters <sec:ultrasoon-debiet>

Een transit-time debietmeter meet de stroomsnelheid uit het verschil in looptijd van een geluidspuls stroomafwaarts en stroomopwaarts. Hij is geen Dopplermeter, zo benadrukken de slides.

Twee transducers A en B zitten schuin tegenover elkaar op de leiding, op afstand $D$ en onder hoek $theta$ met de stroming. Stroomafwaarts gaat het geluid sneller dan stroomopwaarts.

#figure(
  image("assets/L14-transit-time.png", width: 11cm),
  caption: [Transit-time debietmeter: A en B, en de uitgezonden en ontvangen puls (slide 13)],
  label: <fig:L14-transit-time>,
)

#frm(
  "Looptijd van een geluidspuls",
  $T = D / (c plus.minus v cos theta)$,
  [Het plusteken geldt stroomafwaarts, het minteken stroomopwaarts.],
)

met:
- $T$ --- looptijd tussen zender en ontvanger [s]
- $D$ --- afstand tussen de twee transducers [m]
- $c$ --- geluidssnelheid in het medium [m/s]
- $v$ --- stroomsnelheid [m/s]
- $theta$ --- hoek tussen het geluidspad en de stroming [rad]

Het looptijdverschil is

$ Delta T = T_(arrow.t) - T_(arrow.b) = (2 D v cos theta) / (c^2 - v^2 cos^2 theta) approx (2 D v cos theta) / c^2 quad arrow.double quad v = (c^2 Delta T) / (2 D cos theta) $

met $T_(arrow.t)$ stroomopwaarts en $T_(arrow.b)$ stroomafwaarts. Je meet dus $Delta T$ en rekent $v$ uit.

Naast $v$ spelen drie factoren mee. De geluidssnelheid $c$ hangt af van temperatuur, druk en samenstelling. Ze staat in het kwadraat, dus dit is de grootste foutbron. Het *stromingsprofiel* (laminair of turbulent) geeft een andere gemiddelde snelheid langs het pad. *Bellen of vaste deeltjes* verstrooien de bundel.

Het voorbeeld in de slides (Prosonic Flow G 300 van Endress+Hauser) kost 2000 tot 3000 euro. De fout is $1.0 %$ van de uitlezing voor $3$ tot $40 "m/s"$ en $2.0 %$ voor $0.3$ tot $3 "m/s"$, voor een getal van Reynolds van minstens $10 thin 000$ (slide 14).

#examenvraag("2015 open vraag V3 (5 punten)", [Ultrasone flowsensor zonder Doppler: tekening, werking, formule afleiden en welke factoren buiten de vloeistofsnelheid nog meespelen.])[
  - *Tekening en werking:* twee transducers A en B schuin tegenover elkaar op de leiding (@fig:L14-transit-time). Een puls van A naar B gaat stroomafwaarts, een puls van B naar A stroomopwaarts. Het verschil in looptijd meet de snelheid.
  - *Afleiding:* $T_(arrow.b) = D \/ (c + v cos theta)$ en $T_(arrow.t) = D \/ (c - v cos theta)$, dus $Delta T = 2 D v cos theta \/ (c^2 - v^2 cos^2 theta) approx 2 D v cos theta \/ c^2$ en $v = c^2 Delta T \/ (2 D cos theta)$.
  - *Andere factoren:* de geluidssnelheid $c$ (temperatuur, druk, samenstelling; staat in het kwadraat, dus de grootste fout), het stromingsprofiel en bellen of vaste deeltjes.
]

== Elektromagnetische debietmeters <sec:em-debiet>

#concept(title: "Elektromagnetische debietmeter")[
  Een elektromagnetische debietmeter meet de snelheid van een geleidende vloeistof met de wet van Faraday: de vloeistof beweegt door een magneetveld en wekt daardoor een spanning op.
]

#frm(
  "Geïnduceerde spanning",
  $e = B l v$,
  [De spanning is recht evenredig met de snelheid, dus de meter is lineair.],
)

met:
- $e$ --- opgewekte spanning [V]
- $B$ --- magnetische inductie [T], met $1 "T" = 1 "Wb/m"^2 = 1 "V s/m"^2$
- $l$ --- lengte van de geleider [m], hier de binnendiameter van de buis
- $v$ --- snelheid van de geleider [m/s], hier de gemiddelde stroomsnelheid

Spoelen buiten de buis maken het veld $B$ loodrecht op de stroming. De elektroden zitten in de buiswand, dwars op het veld en op de stroming, op afstand $l$. Met $Q = (pi l^2 \/ 4) v$ volgt $Q = pi l e \/ (4 B)$.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L14-em-principe.png", width: 100%),
    caption: [Geleider in een magneetveld; sensoren $S_1$ en $S_2$ in de buis (slide 17)],
    label: <fig:L14-em-principe>,
  ),
  figure(
    image("assets/L14-em-opbouw.png", width: 100%),
    caption: [Metalen of plastic buis met elektroden en vervangschema; opbouw met magneetspoel en flens (slide 18)],
    label: <fig:L14-em-opbouw>,
  ),
)

=== Geleidbaarheid van de vloeistof <sec:em-geleiding>

De vloeistof moet geleiden en de versterker moet een veel grotere ingangsweerstand hebben dan de vloeistof. De weerstand van de vloeistof tussen de elektroden is

#frm(
  "Weerstand van de vloeistof",
  $R_("fluid") = 1 / (sigma_("fluid") d)$,
  [Een lagere geleidbaarheid geeft een hogere bronweerstand.],
)

met:
- $R_("fluid")$ --- weerstand van de vloeistof [$Omega$]
- $sigma_("fluid")$ --- specifieke geleidbaarheid van de vloeistof [S/m]
- $d$ --- diameter van de elektrode [m]

Voor kraanwater ($sigma = 200 thin mu"S/cm"$) en een elektrode van $0.64 "cm"$ is $R_("fluid") = 7800 thin Omega$. De minimale geleidbaarheid is $5 thin mu"S/cm"$. Benzine of alcohol ($10^(-8) thin mu"S/cm"$) geeft bij $d = 5 "cm"$ een weerstand van de orde GΩ: ze zijn niet meetbaar. Bij een buis van $6 "cm"$ en $400 "l/min"$ is de opgewekte spanning ongeveer $3 "mV"$.

=== Magnetisch veld: de evolutie <sec:em-veld>

Het veld is in drie stappen verbeterd, telkens om een probleem op te lossen:
+ *DC-veld:* het probleem is polarisatie van de elektroden.
+ *AC-veld (sinus, $50 "Hz"$):* geen polarisatie en AC-versterking, maar het sterke EM-veld veroorzaakt veel storing in de meetketen.
+ *AC-blokgolf:* veel storing tijdens het schakelen.

De oplossing is een *trapeziumvormig* veld. De flanken zijn minder steil (kleinere $d B \/ d t$) en je meet op het vlakke deel.

#figure(
  image("assets/L14-trapezium.png", width: 9cm),
  caption: [Trapeziumvormig magneetveld: meting op het vlakke deel (slide 23)],
  label: <fig:L14-trapezium>,
)

=== Eigenschappen <sec:em-eigenschappen>

*Voordelen:*
- lineair verband tussen debiet en spanning
- nauwkeurig
- groot lineair bereik (100:1)
- meet in twee richtingen: keert de stroming om, dan keert het teken van $e$ om
- geen drukverlies
- geen verstopping of obstructie (bloedstroom)

*Nadelen:* duur en complexe elektronica.

Het voorbeeld in de slides (Rosemount 8750W) meet $0.02$ tot $20 thin 000 "l/min"$ voor 3000 tot 4000 euro, met een nauwkeurigheid van $0.5 %$ van de uitlezing voor $0.3$ tot $12 "m/s"$ (slide 25).

#examenvraag("2016 (januari) vraag 9", [Een elektromagnetische debietmeter ...],
  opties: (
    [is niet bidirectioneel],
    [vereist een isolerende vloeistof (mazout)],
    [geeft geen drukverlies],
    [kan enkel met AC werken],
  ),
  juist: "C",
)[Er steekt niets in de leiding, dus er is geen drukverlies. A is fout: $e = B l v$ keert van teken met $v$, dus de meter meet in twee richtingen. B is fout: de vloeistof moet net *geleiden* (zie @sec:em-geleiding). D is fout: de slides beginnen met een DC-veld; AC is een verbetering tegen polarisatie.]

#examenvraag("juni 2016 vraag 10", [Een elektromagnetische debietmeter ...],
  opties: (
    [werkt enkel voor een isolerende vloeistof],
    [geeft geen drukval],
    [is niet bidirectioneel],
    [werkt enkel met een wisselend magnetisch veld],
  ),
  juist: "B",
)[Zelfde vraag als de vorige met andere opties. Geen obstructie in de leiding betekent geen drukval. A is fout: de vloeistof moet geleiden (minimaal $5 thin mu"S/cm"$). C is fout: de meter is bidirectioneel. D is fout: een DC-veld kan, maar polariseert de elektroden.]

#examenvraag("oefenvraag E18", [Waarom werkt een elektromagnetische debietmeter niet op mazout?],
  opties: ([mazout is te viskeus], [mazout geleidt niet], [mazout is te licht], [mazout tast de elektroden aan]),
  juist: "B",
)[$e = B l v$ ontstaat doordat ladingsdragers in de vloeistof door het magneetveld worden afgebogen. Zonder geleiding zijn er geen ladingsdragers en dus geen spanning. Water, zuren en pulp werken. Olie, benzine en gedestilleerd water niet. De viscositeit speelt geen rol, want er zit niets in de leiding.]

== Kalibratie van debietmeters <sec:debiet-kalibratie>

Een debietmeter kan op drie manieren gekalibreerd zijn. De slides vergelijken ze met de eisen die elk type stelt (algemene kalibratie: @sec:kalibratie).

#table(
  columns: (2fr, auto, auto, auto),
  align: (left, center, center, center),
  table.header([*Eis*], [*Geaccrediteerd*], [*Traceerbaar*], [*Fabrikant*]),
  [Herleidbaar naar nationale standaarden], [ja], [ja], [niet vereist],
  [Competentie van het personeel gedocumenteerd], [ja], [niet vereist], [niet vereist],
  [Testprocedure gedocumenteerd], [ja], [niet vereist], [niet vereist],
  [Onzekerheden gedocumenteerd], [ja], [niet vereist], [niet vereist],
  [Informatie op het certificaat voldoet aan specifieke eisen], [ja], [niet vereist], [niet vereist],
  [Laboratorium voldoet aan ISO/IEC 17025 (aangetoond door beoordeling)], [ja], [niet vereist], [niet vereist],
)
