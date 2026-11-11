#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/13.force.pdf | Samenvatting DAQ p.28-29, p.49-54 | examenvragen 2016, 2017, 23-24, 25-26 | oefenvraag E21

= Kracht- en torsiesensoren <ch:kracht>

== Meetprincipes <sec:kracht-principes>

#concept(title: "Kracht meten")[
  Een kracht meet je indirect: je zet ze om in een grootheid die je wel kunt uitlezen. Er zijn vier manieren, en de slides werken de laatste uit: een kracht die een elastisch element vervormt.
]

- *Balanceren:* de kracht in evenwicht brengen met een bekende massa, $F = m g$.
- *Versnelling:* de versnelling van een bekende massa meten, $F = m a$.
- *Druk:* de kracht over een oppervlak verdelen en de druk meten (hydraulische of pneumatische load cell), $F arrow P arrow V$.
- *Elasticiteit:* de vervorming van een elastisch element meten, $F arrow epsilon arrow V$.

#figure(
  image("assets/L13-hydraulisch-lvdt.png", width: 100%),
  caption: [Kracht via druk (hydraulische en pneumatische load cell) en kracht via een veer met LVDT (slide 3)],
  label: <fig:L13-hydraulisch-lvdt>,
)

Een elastische krachtopnemer is een massa-veer-demping-systeem. De kracht $F$ verplaatst de massa over $x$. Een relatieve verplaatsingstransducer (meestal een rekstrook of een LVDT) leest $x$ uit.

#grid(
  columns: (1fr, 1.3fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L13-elastisch.png", width: 100%),
    caption: [Elastische krachtopnemer: massa, veer $K_s$, demping $B$ en verplaatsingstransducer (slide 4)],
    label: <fig:L13-elastisch>,
  ),
  [
    #frm(
      "Overdracht kracht naar verplaatsing",
      $(x(j omega)) / (F(j omega)) = K / ((j omega / omega_n)^2 + 2 zeta (j omega) / omega_n + 1)$,
      [Een tweede-orde-systeem; de verplaatsing volgt de kracht tot ongeveer $omega_n$.],
    )
  ],
)

met:
- $K = 1 \/ K_s$ --- statische gevoeligheid [m/N]
- $omega_n = sqrt(K_s \/ M)$ --- ongedempte eigenpulsatie [rad/s]
- $zeta = B \/ (2 sqrt(K_s M))$ --- dempingscoëfficiënt [--]
- $K_s$ --- veerstijfheid [N/m], $M$ --- massa [kg], $B$ --- demping [N s/m]

Meer demping geeft een lagere resonantiepiek, minder demping een hogere. De bodediagram-analyse staat in @sec:seismisch-model.

== Force transducers <sec:force-transducers>

=== Load cell op trek of druk <sec:loadcell-trek>

Een load cell op trek of druk is een metalen staaf of zuil met vier rekstroken in een volle brug. Twee strookjes (1 en 3) liggen in de rekrichting. Twee (2 en 4) liggen er dwars op en verkorten met $-nu epsilon$.

#grid(
  columns: (1fr, 1.2fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L13-loadcell.png", width: 80%),
    caption: [Load cell met rekstroken 1 tot 4 en de bijhorende brug (slide 5)],
    label: <fig:L13-loadcell>,
  ),
  [
    Met $R_1 = R_3 = R + Delta R$ en $R_2 = R_4 = R - nu Delta R$ geeft de brugformule
    $ V_o / V_("ex") = (R + Delta R) / (2 R + Delta R (1 - nu)) - (R - nu Delta R) / (2 R + Delta R (1 - nu)) approx (Delta R (1 + nu)) / (2 R) $
    Je mag de noemer vereenvoudigen, want $2 R >> Delta R (1 - nu)$.
  ],
)

Met $Delta R \/ R = "GF" epsilon$ en $epsilon = sigma \/ E = F \/ (A E)$ volgt de gevoeligheid.

#frm(
  "Gevoeligheid van een load cell op trek of druk",
  $S = V_o / F = "GF" (V_("ex") (1 + nu)) / (2 A E)$,
  [Een dikke staaf (grote $A$) geeft een lage gevoeligheid maar een hoge maximale last.],
)

met:
- $S$ --- gevoeligheid [V/N]
- $"GF"$ --- gage factor [--]
- $V_("ex")$ --- excitatiespanning van de brug [V]
- $nu$ --- constante van Poisson [--]
- $A$ --- doorsnede van de staaf [m$""^2$]
- $E$ --- elasticiteitsmodulus [Pa]

#voorbeeld(title: "Slides: staalstaaf van 1 cm bij 1 cm")[
  Gegeven: breedte en diepte $1 "cm"$, staal met $E = 200 "GPa"$ en $nu = 0.3$, vier actieve strookjes met $"GF" = 2$, $V_("ex") = 10 "V"$.

  $ S = (2 dot 10 dot 1.3) / (2 dot 10^(-4) dot 200 dot 10^9) = 6.5 dot 10^(-7) "V/N" = 650 "nV/N" $

  Bij $1000 "kg"$ ($10 thin 000 "N"$) is de uitgang $6.5 "mV"$. Dat ligt boven de ruis, maar je moet versterken. De maximale rek is $2 "mm/m"$, dus de maximale last is $F_("max") = E A epsilon_("max") = 200 dot 10^9 dot 10^(-4) dot 2 dot 10^(-3) = 40 "kN"$. Deze opstelling heeft dus een lage gevoeligheid maar een hoge maximale last.
]

*Temperatuureffecten.* De slides noemen vijf oorzaken van fouten bij een load cell:
- *Weerstand van de strookjes zelf:* een brug in de juiste schakeling compenseert dit (@sec:temperatuurcompensatie). Met één strook gebruik je een dummy-strook in dezelfde arm, op een stuk gelijkaardig materiaal dat dezelfde temperatuur volgt maar niet vervormt.
- *Gage factor:* die hangt van de temperatuur af. Bij typisch $0.01 %"/K"$ is het effect klein.
- *Elasticiteitsmodulus:* die daalt voor staal met ongeveer $0.02 %"/K"$. Bij experimentele spanningsanalyse negeer je dat. Een precisieopnemer compenseert met weerstanden of rekenkundig.
- *Zelfopwarming:* de excitatie verwarmt het strookje boven het meetlichaam. Geleidt het meetlichaam slecht, dan krijg je een temperatuurverschil.
- *Kleefstofkruip:* bij hogere temperatuur wordt de lijm zacht en draagt ze de rek niet meer volledig over. Dat werkt als een lagere gage factor. Let op de temperatuurgrens van de lijm.

Een rekenkundige correctie gebruikt een temperatuurmeting: $epsilon_("corr") = f(epsilon_("meas"), T)$.

=== Load cell op buiging <sec:loadcell-buiging>

Een load cell op buiging is een ingeklemde balk met strookjes boven en onder. De kracht $F$ geeft op de plaats van de strookjes het moment $M_b = F L$. Bovenaan is er trek en onderaan druk.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L13-balk-4strookjes.png", width: 100%),
    caption: [Ingeklemde balk met strookjes 1 en 3 bovenaan, 2 en 4 onderaan (slide 17)],
    label: <fig:L13-balk-4strookjes>,
  ),
  figure(
    image("assets/L13-weerstandsmoment.png", width: 100%),
    caption: [Weerstandsmoment $Z$ voor vier doorsneden (slide 20)],
    label: <fig:L13-weerstandsmoment>,
  ),
)

De rek is op de vier strookjes even groot, met wisselend teken: $epsilon_1 = -epsilon_2 = epsilon_3 = -epsilon_4 = sigma_b \/ E$.

#frm(
  "Spanning en rek bij buiging",
  $sigma_b = M_b / Z = (F L) / Z quad quad epsilon = sigma_b / E = (F L) / (E Z)$,
  [Voor een massieve rechthoekige balk is $Z = b h^2 \/ 6$, dus $epsilon = 6 F L \/ (E b h^2)$.],
)

met:
- $M_b$ --- buigend moment op de plaats van de strookjes [N m]
- $Z$ --- weerstandsmoment van de doorsnede [m$""^3$]
- $F$ --- kracht [N]
- $L$ --- afstand tussen de strookjes en het aangrijpingspunt van de kracht [m]
- $b$, $h$ --- breedte en hoogte van de balk [m]

De drie andere doorsneden uit @fig:L13-weerstandsmoment zijn de holle rechthoek $(1 \/ 6) b (h_2^3 - h_1^3) \/ h_2$, de ronde as $pi d^3 \/ 32$ en de buis $(pi \/ 32) (d_2^4 - d_1^4) \/ d_2$.

Met vier actieve strookjes staat de brug als volle brug en is $V_o = V_("ex") Delta R \/ R$. Met twee actieve strookjes (1 en 2) is het een halve brug en is $V_o = V_("ex") Delta R \/ (2 R)$.

#frm(
  "Gevoeligheid van een balk-load-cell",
  $S_4 = V_o / F = V_("ex") "GF" (6 L) / (E b h^2) quad quad S_2 = V_("ex") "GF" (3 L) / (E b h^2)$,
  [$S_4$ voor vier actieve strookjes (volle brug), $S_2$ voor twee (halve brug).],
)

#voorbeeld(title: "Slides: balk met twee actieve strookjes")[
  Gegeven: breedte $1 "cm"$, dikte $1 "mm"$, afstand van de kracht tot het midden van het strookje $5 "cm"$, staal met $E = 200 "GPa"$, $"GF" = 2$, $V_("ex") = 10 "V"$.

  $ S_2 = V_("ex") "GF" (3 L) / (E b h^2) = 10 dot 2 dot (3 dot 0.05) / (200 dot 10^9 dot 0.01 dot (0.001)^2) = 1.5 dot 10^(-3) "V/N" $

  De gevoeligheid is $1.5 "mV/N"$. Bij $10 "g"$ ($0.1 "N"$) is de uitgang $0.15 "mV"$. De maximale last ligt volgens de slides rond $6 "N"$ ($600 "g"$). Deze opstelling is dus zeer gevoelig, maar heeft een kleine maximale kracht.
]

De volledige aanpak met stappenplan en de opgeloste examenvragen staat in @sec:loadcell-oefening. Dit zijn de load-cell-vragen van 23-24 vraag 10, juni 2016 vraag 18 (ook 2016 januari vraag 16) en 25-26 vraag 25 en 26.

#examenvraag("oefenvraag E21", [Een rechthoekige balk op buiging heeft vier rekstrookjes: 1 en 3 bovenaan, 2 en 4 onderaan. Gegeven: $L = 20 "cm"$, $E = 200 "GPa"$, $nu = 0.3$, $h = b = 1 "cm"$, $Z = b h^2 \/ 6$, $"GF" = 2$, $V_("ex") = 5 "V"$. Bereken de gevoeligheid $V_o \/ F$.])[
  Stap 1, welke brug: vier actieve strookjes, twee in trek en twee in druk, met gelijke tekens in overstaande armen. Dat is een volle brug: $V_o \/ V_("ex") = Delta R \/ R$.

  Stap 2, rek: $Z = 0.01 dot 0.01^2 \/ 6 = 1.667 dot 10^(-7) "m"^3$ en $Z E = 3.33 dot 10^4 "N m"$. Dus $epsilon = F L \/ (Z E) = F dot 0.2 \/ (3.33 dot 10^4) = 6 dot 10^(-6) F$.

  Stap 3, weerstandsverandering en uitgang: $Delta R \/ R = "GF" epsilon = 1.2 dot 10^(-5) F$. Dus $S = V_("ex") dot 1.2 dot 10^(-5) = 60 thin mu"V/N"$.

  De constante van Poisson $nu$ is niet nodig bij buiging: ze is een afleider.
]

=== Load cell met LVDT <sec:force-lvdt>

Een veer met een LVDT zet kracht om in een verplaatsing: de kracht drukt de veer in over $x = F \/ k$ en de LVDT meet $x$. Dit is de meestgebruikte uitvoering van het elastische principe. De werking van de LVDT staat in @sec:lvdt-werking. Een LVDT heeft weinig wrijving, dus weinig slijtage.

#figure(
  image("assets/L13-lvdt-kracht.png", width: 9cm),
  caption: [Krachtopnemer met LVDT en een schroefvormige veer (helical flexure) (slide 29)],
  label: <fig:L13-lvdt-kracht>,
)

=== Dubbele balk en S-balk <sec:force-dubbele-balk>

Een load cell met een dubbele buigbalk heeft vier strookjes in een brug: 1 en 2 links, 3 en 4 rechts. Zo zijn commerciële weegcellen gebouwd. De slides tonen de EBB-serie van Transducer Techniques (1, 2, 5 of 10 kg, 160 euro, uitgang $0.5 "mV/V" plus.minus 10 %$, excitatie $5 "V"$, overbelasting 200 %) en een S-balk van Omega (3000 lbf, 400 euro, uitgang $3.0 "mV/V"$, nauwkeurigheidsklasse C3; $1 "lb" = 0.454 "kg"$).

#figure(
  image("assets/L13-dubbele-balk.png", width: 10cm),
  caption: [Weegcel met dubbele buigbalk: strookjes 1 en 2 en 3 en 4 en de brug (slide 25)],
  label: <fig:L13-dubbele-balk>,
)

=== Piëzo-elektrische krachtopnemer <sec:force-piezo>

Een piëzo-elektrische krachtopnemer klemt piëzo-elektrische schijven onder voorspanning tussen een basis en een behuizing. De kracht geeft op de schijven een lading af (@sec:piezo-effect). De voorspanning stel je in met een schroef.

#figure(
  image("assets/L13-piezo-kracht.png", width: 8cm),
  caption: [Piëzo-elektrische krachtopnemer met schijven, geleidingspen en voorspanningsschroef (slide 31)],
  label: <fig:L13-piezo-kracht>,
)

Deze sensor meet een *klap* en geen *gewicht*. Het kristal is een ladingsbron met een eigen capaciteit, en de ingangsweerstand van de versterker lekt die lading weg. Dat is een hoogdoorlaatfilter met ondergrens $f_0$ (@sec:piezo-circuit). Een constante kracht heeft frequentie nul en is dus onzichtbaar. Een korte klap bevat frequenties boven $f_0$ en komt wel door.

#examenvraag("23-24 vraag 3, 25-26 vraag 16, voorbeeldexamen 2024", [Een piëzo-elektrische krachtsensor ...],
  opties: (
    [kan enkel een kracht opmeten via het Coriolis-effect],
    [kan enkel dynamische krachten opmeten, dus geen statische zoals de zwaartekracht],
    [heeft een seismische massa nodig om een statische kracht te meten],
    [kan alle inwerkende krachten meten behalve de zwaartekracht],
  ),
  juist: "B",
)[De ingangsweerstand $R$ over de capaciteit $C_T$ vormt een hoogdoorlaat, dus onder $f_0$ lekt de lading weg. A is fout: Coriolis hoort bij de gyroscoop. C is fout: een massa verandert niets aan het wegvloeien van de lading. D klinkt plausibel maar mikt op de verkeerde eigenschap: het gaat niet om de zwaartekracht, maar om elke constante kracht.]

Het bereik van de piëzo-elektrische opnemer in de slides loopt van $1000 "N"$ trek en $5000 "N"$ druk tot $4000 "N"$ trek en $16 thin 000 "N"$ druk, met een nauwkeurigheid van $1 %$ en een maximale frequentie van $10 "kHz"$ tot $300 "kHz"$. De gevoeligheid voor kruisassen is te groot (tot $10 %$).

=== Impedance head <sec:impedance-head>

Een impedance head meet in één behuizing de kracht en de versnelling aan hetzelfde punt. Met beide bepaal je de mechanische impedantie $Z = "kracht"/"snelheid"$. De snelheid volg je uit de versnelling door te integreren.

#figure(
  image("assets/L13-impedance-head.png", width: 8cm),
  caption: [Impedance head: een schijf onder de massa meet versnelling, een schijf aan de aangedreven zijde meet kracht (slide 33)],
  label: <fig:L13-impedance-head>,
)

De uitgang voor versnelling en die voor kracht zijn aparte aansluitingen. De gevoeligheden in de slides zijn $3 "pC" \/ ("m/s")^2$ voor de versnelling en $370 "pC/N"$ voor de kracht, met een frequentiebereik van $1 "Hz"$ tot $6 "kHz"$ (slide 34).

=== Force sensitive resistor <sec:fsr>

Een force sensitive resistor (FSR) is een polymeerlaag waarvan de weerstand daalt wanneer de kracht stijgt. Een geleidende drukker duwt via een elastomeer de halfgeleidende polymeerlaag tegen verweven elektroden. Meer kracht geeft meer contact en dus minder weerstand.

#figure(
  image("assets/L13-fsr.png", width: 11cm),
  caption: [FSR: opbouw met drukker en elektroden, en weerstand in functie van de kracht met verzadiging (slide 35)],
  label: <fig:L13-fsr>,
)

Kenmerken uit de slides: groot dynamisch bereik van de weerstand, lage kostprijs en lage nauwkeurigheid ($10 %$). De weerstand verzadigt bij grote kracht.

#examenvraag("juni 2016 vraag 8", [FSR (figuur 3-15, FSR 402) ...],
  opties: (
    [de uitgangsspanning is lineair met de kracht],
    [de weerstand stijgt met toenemende kracht],
    [de weerstand daalt met stijgende druk],
    [de weerstand is niet lineair],
  ),
  juist: "C",
)[FSR staat hier voor Force Sensitive Resistor en niet voor Full Scale Range. Meer kracht geeft meer contactpunten en dus meer parallelle paden, dus een lagere weerstand (C). B is het omgekeerde. A en D gaan over de lineariteit: het verband is sterk niet-lineair (D is op zich waar), maar C beschrijft de gevraagde eigenschap, de *richting* van de verandering.]

=== Vergelijking <sec:force-vergelijking>

De slides geven bij elk type een eigenschappenkaart:

#table(
  columns: (auto, 1fr, auto, 1fr),
  align: (left, left, left, left),
  table.header([*Type*], [*Bereik*], [*Nauwkeurigheid*], [*Opmerking*]),
  [Rekstrook-balk], [$10 "N"$ tot $20 thin 000 "N"$ en meer], [$1 %$], [temperatuurafhankelijkheid $0.005 %$, nulverschuiving $0.01 %$],
  [LVDT], [$0.1 "N"$ tot $5000 "N"$], [$0.2 %$], [temperatuurafhankelijkheid zeer klein],
  [Piëzo-elektrisch], [tot $16 thin 000 "N"$ druk], [$1 %$], [$10 "kHz"$ tot $300 "kHz"$; kruisassen tot $10 %$],
  [FSR], [--], [$10 %$], [goedkoop, groot weerstandsbereik],
)

== Torque transducers <sec:torque>

Een torque transducer meet een moment om een as met rekstroken. Het principe van de Wheatstonebrug blijft hetzelfde (@sec:brugtypes). Er zijn twee uitvoeringen in de slides.

*Draaiarm met balkjes.* Een draaiarm op de as zet het moment om in een kracht op balkjes. Op die balkjes zitten de strookjes R1 tot R4.

#figure(
  image("assets/L13-torque-balk.png", width: 10cm),
  caption: [Torque transducer met draaiarm, as en strookjes R1 tot R4 op het chassis (slide 37)],
  label: <fig:L13-torque-balk>,
)

*Strookjes onder 45° op de as.* Bij torsie van een as staan de grootste rekken onder $45 degree$ met de aslijn: de ene richting rekt, de andere verkort evenveel. Strookjes 1 en 3 liggen op de ene diagonaal en strookjes 2 en 4 op de andere, dus je krijgt $+Delta R$ en $-Delta R$ en een volle brug. Een axiale kracht of temperatuurverandering rekt beide richtingen gelijk en valt in de brug weg.

#figure(
  image("assets/L13-torque-45.png", width: 11cm),
  caption: [Strookjes onder $45 degree$ op een as: de vier strookjes liggen op twee diagonalen (slide 38)],
  label: <fig:L13-torque-45>,
)

Een *rozet* zet strookjes onder $45 degree$ samen op één drager: een drie-elementen- en een twee-elementenrozet.

#figure(
  image("assets/L13-rosette.png", width: 5cm),
  caption: [Rozetten onder $45 degree$ met drie en met twee elementen (slide 39)],
  label: <fig:L13-rosette>,
)

De laatste slide is de load-cell-vraag op een ronde as (25-26 vraag 26). Die staat uitgewerkt in @sec:loadcell-oefening.

== Piëzo-elektrische krachtsensoren <sec:piezo>

Dit deel legt het piëzo-elektrische effect en het vervangschema uit. Het geldt ook voor de piëzo-elektrische accelerometer (@sec:piezo-accelerometer) en de druksensor (@sec:druk-piezo).

=== Piezo-elektrisch effect <sec:piezo-effect>

Een piëzo-elektrisch kristal geeft een lading af als je het mechanisch vervormt. Bij kwarts ($"SiO"_2$) verschuiven de atomen onder een kracht langs de $x$-as, waardoor er langs de $y$-as een lading verschijnt.

#figure(
  image("assets/L13-kwarts-atomen.png", width: 8cm),
  caption: [Kwartskristal: (a) in rust, (b) onder een kracht $F_x$ in één richting, (c) in de andere richting; de lading verschijnt langs de $y$-as (Samenvatting DAQ p.28)],
  label: <fig:L13-kwarts-atomen>,
)

Het effect werkt in twee richtingen. Een vervorming geeft lading (direct effect) en een lading geeft vervorming (omgekeerd effect). Afhankelijk van de oriëntatie van het kristal meet de sensor dikteverandering, transversale compressie of afschuiving.

#frm(
  "Lading van een piëzo-elektrisch kristal",
  $q = d F quad quad e = q / C = (d F t) / (epsilon A)$,
  [De lading is evenredig met de kracht. De spanning tussen de elektroden volgt uit de capaciteit $C = epsilon A \/ t$ van het kristal.],
)

met:
- $q$ --- lading [C]
- $d$ --- piëzo-elektrische constante [C/N]; $2.3 "pC/N"$ voor kwarts, $140 "pC/N"$ voor bariumtitanaat
- $F$ --- kracht [N]
- $t$ --- dikte van het kristal [m]
- $epsilon$ --- permittiviteit van het kristal [F/m]
- $A$ --- oppervlak van de elektroden [m$""^2$]

Bij een verplaatsingssensor schrijf je het verband tussen lading en verplaatsing als $q = K x$, met $K$ in C/m.

#figure(
  image("assets/L13-piezo-laag.png", width: 6.5cm),
  caption: [Piëzo-elektrische laag tussen twee elektroden (Samenvatting DAQ p.28)],
  label: <fig:L13-piezo-laag>,
)

#examenvraag("2017 vraag 17", [Een piëzo-elektrische sensor is ...],
  opties: ([een ladingsgenerator], [een stroomgenerator], [een spanningsgenerator], [een inductieve sensor]),
  juist: "A",
)[$q = K x$: de sensor levert lading. De spanning volgt pas uit $v = q \/ C_T$ en hangt dus van je kabel af. Daarom is "spanningsgenerator" fout. Het is ook geen stroombron, al kun je de lading omzetten in een stroom $i = d q \/ d t$ voor de analyse (@sec:piezo-circuit).]

=== Equivalent circuit <sec:piezo-circuit>

Het vervangschema van een piëzo-elektrische sensor is een ladingsbron met parallel de capaciteiten van kristal, kabel en versterker, en de ingangsweerstand $R$ van de versterker. De lading $q = K x$ is de bron.

#figure(
  image("assets/L13-piezo-circuit.png", width: 12cm),
  caption: [Vervangschema: stroombron $i = dot(q)$, $C_p$, $C_c$ en $R$ (Samenvatting DAQ p.29, uitwerking)],
  label: <fig:L13-piezo-circuit>,
)

Alle capaciteiten staan parallel en tellen dus op. Een langere kabel geeft een grotere $C_c$ en dus een lagere gevoeligheid.

#frm(
  "Gevoeligheid van een piëzo-elektrische sensor",
  $C_T = C_p + C_c quad quad v_o = q / C_T quad quad K_s = K / C_T$,
  [Hoe groter de totale capaciteit, hoe kleiner de uitgangsspanning bij dezelfde lading.],
)

met:
- $C_p$ --- capaciteit van het kristal [F]
- $C_c$ --- capaciteit van de kabel (en de versterkeringang) [F]
- $C_T$ --- totale capaciteit [F]
- $K$ --- ladingsgevoeligheid van het kristal [C/m]
- $K_s$ --- spanningsgevoeligheid [V/m]

Voor de dynamica zet je de ladingsbron om in een stroombron $i_s = d q \/ d t = K d x \/ d t$. Zonder stroom in de versterker is $i_s = i_C + i_R$:

$ K (d x) / (d t) = C_T (d v_o) / (d t) + v_o / R quad arrow.double quad (v_o (j omega)) / (x (j omega)) = K_s (j omega R C_T) / (1 + j omega R C_T) $

Dat is een hoogdoorlaatfilter.

#frm(
  "Ondergrens van een piëzo-elektrische sensor",
  $f_0 = 1 / (2 pi R C_T)$,
  [Onder $f_0$ lekt de lading via $R$ weg sneller dan het kristal ze opbouwt.],
)

met:
- $f_0$ --- ondergrens (afsnijfrequentie) [Hz]
- $R$ --- ingangsweerstand van de versterker [$Omega$]

De sensor meet dus geen statische kracht of verplaatsing: bij frequentie nul is $v_o = 0$. $f_0$ wordt alleen nul als $R arrow infinity$ of $C_T arrow infinity$.

#figure(
  image("assets/L13-piezo-hoogdoorlaat.png", width: 11cm),
  caption: [Spanningsgevoeligheid $|K_s|$ in functie van de frequentie voor twee combinaties van $R$ en $C_T$ (uitwerking bij Samenvatting DAQ p.29)],
  label: <fig:L13-piezo-hoogdoorlaat>,
)

#voorbeeld(title: "Samenvatting p.29: kabel en shunt")[
  Een kristal met $C_p = 400 "pF"$ en $K = 1 "pC/"mu"m"$ zit via een kabel van $C_c = 100 "pF"$ aan een versterker met $R = 1 "M"Omega$. Dan is $C_T = 500 "pF"$, $f_0 = 1 \/ (2 pi dot 10^6 dot 500 dot 10^(-12)) = 318 "Hz"$ en $K_s = 1 "pC/"mu"m" \/ 500 "pF" = 2 "mV/"mu"m"$. Zonder kabel was $K_s = 2.5 "mV/"mu"m"$. De kabel kost dus $20 %$ gevoeligheid.

  Voeg je een shunt van $500 "pF"$ toe en neem je $R = 500 "M"Omega$, dan is $C_T = 1000 "pF"$ en $f_0 = 0.32 "Hz"$. De gevoeligheid zakt wel naar $1 "mV/"mu"m"$ (60 % lager). Een shuntcondensator verlaagt $f_0$, maar $K_s = K \/ C_T$ daalt mee.
]

*Ladingsversterker.* Een ladingsversterker is een opamp met een terugkoppelcondensator $C_f$. Hij houdt zijn ingang op $0 "V"$ (virtuele massa). Over $C_p$ en $C_c$ staat dan geen spanning, dus nemen ze geen lading op. Alle lading $q$ gaat naar $C_f$.

#figure(
  image("assets/L13-ladingsversterker.png", width: 9cm),
  caption: [Ladingsversterker: virtuele massa maakt $C_c$ onschadelijk (uitwerking bij Samenvatting DAQ p.29)],
  label: <fig:L13-ladingsversterker>,
)

#frm(
  "Ladingsversterker",
  $v_("out") = - q / C_f quad quad f_0 = 1 / (2 pi R_f C_f)$,
  [De uitgang hangt niet meer af van $C_p$ of $C_c$. De ondergrens volgt uit $R_f$ over $C_f$, niet uit de kabel.],
)

met:
- $C_f$ --- terugkoppelcondensator [F]
- $R_f$ --- weerstand parallel aan $C_f$ [$Omega$]

De weerstand $R_f$ blijft nodig om de ingang te definiëren. Daarom blijft ook hier een hoogdoorlaat over en is een echt statische meting onmogelijk. Een IEPE-accelerometer (@sec:piezo-accelerometer) heeft deze versterker al ingebouwd.

#examenvraag("juni 2016 vraag 3", [Een piëzo-elektrische verplaatsingssensor ...],
  opties: (
    [doet statische metingen met een instrumentatieversterker],
    [doet statische metingen met een shuntcondensator],
    [doet statische metingen met een shuntcondensator en een hoge ingangsweerstand],
    [doet geen statische metingen],
  ),
  juist: "D",
)[B en C verlagen $f_0$ wel: een shuntcondensator vergroot $C_T$ en een hogere $R$ verkleint $f_0$ nog meer. Maar $f_0 = 1 \/ (2 pi R C_T)$ wordt nooit nul (zie het voorbeeld: $0.32 "Hz"$ is nog steeds geen DC). A is fout: een instrumentatieversterker versterkt een spanningsverschil en verandert $R$ en $C_T$ niet.]

#examenvraag("25-26 vraag 7", [Een piëzo-elektrische verplaatsingssensor ...],
  opties: (
    [is een actieve sensor],
    [kan statische metingen uitvoeren met een instrumentatieversterker],
    [wordt best gevolgd door een shunt-*weerstand* om $f_0$ te verkleinen],
    [wordt best gevolgd door een shunt-*capaciteit* om $f_0$ te verkleinen],
  ),
  juist: "D",
)[$f_0 = 1 \/ (2 pi R C_T)$: een extra capaciteit vergroot $C_T$ en verkleint dus $f_0$. Een weerstand parallel verkleint $R$ en duwt $f_0$ juist omhoog (C). De prijs van D is een lagere $K_s$. A is fout volgens de cursus: een piëzo wekt zelf zijn signaal op en is *passief* (@sec:passief-vs-actief). B is fout om dezelfde reden als hierboven.]

#examenvraag("2016 (januari) vraag 13", [Welk uitgangscircuit gebruik je om met een piëzo-elektrische sensor een statische meting te doen?])[Een *ladingsversterker*: een opamp met capacitieve terugkoppeling. Die verlaagt $f_0$ sterk, maar echt DC blijft onmogelijk. De weerstand $R_f$ moet de ingang blijven definiëren en dus blijft er een hoogdoorlaat over.]
