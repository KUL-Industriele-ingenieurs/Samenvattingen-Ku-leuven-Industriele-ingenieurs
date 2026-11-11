#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/12.pressure.pdf | Samenvatting DAQ p.55-58 | examenvragen 2016, 2017, 2019, 23-24, 25-26

= Druksensoren <ch:druk>

== Meetmethodes <sec:druk-methodes>

#concept(title: "Druk en referentie")[
  Een druksensor meet de druk ten opzichte van een referentie. Die referentie bepaalt het type: *absolute*, *relatieve (gage)* of *differentiële* druk.
]

- *Absolute druk:* verschil met een perfect vacuüm, $P_0 = 0 "Pa"$.
- *Gage-druk:* verschil met de omgevingsdruk, $P_0 = 101 thin 325 "Pa"$.
- *Differentiële druk:* verschil tussen twee meetpunten, $P_1 - P_2$.

#figure(
  image("assets/L12-druktypes.png", width: 70%),
  caption: [Drie drukmetingen, elk met een referentiekant (REF) en een manometer (slide 2)],
  label: <fig:L12-druktypes>,
)

Een elastisch element zet druk om in een beweging. De slides tonen negen vormen: membranen en capsules (a, b), balgen (c, d) en gebogen buizen zoals de bourdonbuis (f tot i). Alle sensoren hieronder meten die beweging of de rek in het element elektrisch.

#figure(
  image("assets/L12-principes.png", width: 8cm),
  caption: [Elastische elementen die druk in beweging ("Motion") omzetten (slide 3)],
  label: <fig:L12-principes>,
)

De slides geven drukken ook in psi: $1 "psi" = 0.0689475729 "bar"$.

== Elektrische uitlezing <sec:druk-elektrisch>

Vier principes zetten de doorbuiging van een membraan om in een elektrisch signaal. Ze verschillen in of ze een statische druk kunnen meten.

#table(
  columns: (auto, 1fr, 1.3fr),
  align: (left, left, left),
  table.header([*Principe*], [*Wat verandert*], [*Statische druk?*]),
  [Piëzo-elektrisch], [lading van een kristal], [nee: de lading lekt weg (@sec:piezo-circuit)],
  [Capacitief], [capaciteit tussen membraan en vaste plaat], [ja, met AC-excitatie (@ch:capacitief)],
  [Piëzoresistief], [weerstand van gediffundeerde strookjes], [ja: een brug leest ook DC uit],
  [Optisch], [licht op een fotodiode], [ja, ook als null-balance-transducer],
)

=== Piëzo-elektrisch <sec:druk-piezo>

Een piëzo-elektrische druksensor leest de kracht van het drukmembraan uit met een kristal. De druk duwt het membraan ("pressure sensing diaphragm") tegen het kristal op een basis. Het kristal geeft een lading af en werkt als een ladingsbron met een eigen capaciteit (@sec:piezo-effect en @sec:piezo-circuit). Het wekt zijn signaal zelf op en heeft geen excitatie nodig, dus de sensor is *passief*.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L12-piezo.png", width: 90%),
    caption: [Piëzo-elektrische druksensor: membraan, kristal en basis (slide 4)],
    label: <fig:L12-piezo>,
  ),
  [
    De lading lekt weg via de ingangsweerstand van de versterker (hoogdoorlaat met ondergrens $f_0 = 1 \/ (2 pi R C_T)$). Een constante druk geeft dus na korte tijd geen signaal meer en de sensor meet alleen *dynamische* druk, zoals explosies, schokgolven en snelle drukveranderingen.

    Voordelen zijn hoge druk en hoge temperatuur: het voorbeeld van de slides (0 tot 50 bar) werkt van 0 tot $700 degree"C"$ en kost 200 tot 400 euro (slide 5). Nadelen zijn de versterker voor het ladingssignaal en de gevoeligheid voor schokken en trillingen.
  ],
)

=== Capacitief <sec:druk-capacitief>

Een capacitieve druksensor buigt met de druk een membraan naar een vaste plaat. De afstand tussen de platen daalt, dus de capaciteit stijgt (@sec:cap-enkelvoudig). Het membraan is geleidend en ligt boven een keramisch of glazen substraat met een metaallaag. Het drukbereik is breed, van hoge druk tot vacuüm. Een nadeel is de sterke temperatuurafhankelijkheid.

#figure(
  image("assets/L12-cap-opbouw.png", width: 100%),
  caption: [Capacitieve druksensor: afgebogen membraan voor een vaste plaat (links) en een uitvoering met siliconenolie en een afscheidend membraan (rechts) (slide 6)],
  label: <fig:L12-cap-opbouw>,
)

Een uitvoering met twee condensatoren $C_1$ en $C_2$ rond het membraan werkt als een *differentiële condensator*. Die lees je uit zoals in @sec:cap-diff-brug. De drukken $P_1$ en $P_2$ staan op beide kanten van het membraan, dus je meet het verschil. De uitvoering met siliconenolie en een afscheidend membraan voert de druk naar het meetmembraan en vermindert storende effecten.

#figure(
  image("assets/L12-cap-keramiek.png", width: 60%),
  caption: [(a) één condensator $C_1$ en (b) twee condensatoren $C_2$ en $C_1$, met doorgang voor druk $P_2$ (slide 8)],
  label: <fig:L12-cap-keramiek>,
)

Het voorbeeld in de slides (PT500E, 0 tot 400 bar) kost 100 tot 200 euro en is gebouwd voor mobiele machines met schokken en trillingen (slide 9).

=== Membraan met rekstroken <sec:druk-membraan>

Een membraan met rekstroken meet druk via de rek die de doorbuiging in het membraan geeft. De rekstroken (@ch:rekstroken-1) liggen in een volle brug. Ze staan waar de spanning maximaal is, aan de rand of in het midden.

#figure(
  image("assets/L12-membraan.png", width: 8.0cm),
  caption: [Ingeklemd membraan met strookjes 1 tot 4, spanningsverloop en rekstrookrozet (slide 12)],
  label: <fig:L12-membraan>,
)

De doorbuiging $y_c$ in het midden hangt met de druk $P$ samen volgens

#frm(
  "Doorbuiging van een ingeklemd membraan",
  $P = (16 E t^4) / (3 R^4 (1 - nu^2)) [y_c / t + 0.488 (y_c / t)^3]$,
  [De druk is evenredig met $y_c$ zolang de kubieke term klein blijft.],
)

met:
- $P$ --- drukverschil over het membraan [Pa]
- $E$ --- elasticiteitsmodulus van het membraan [Pa]
- $t$ --- dikte van het membraan [m]
- $R$ --- straal van het membraan [m]
- $R$ --- straal van het membraan [m]
- $nu$ --- constante van Poisson [--]
- $y_c$ --- doorbuiging in het midden [m]

Het verband tussen $P$ en $y_c$ is lineair voor kleine doorbuiging. Bij grote doorbuiging werkt het membraan als een gespannen vlies en komt de kubieke term erbij. De slides drukken de grens uit als een kleine verhouding $y_c \/ d$, met $d$ de diameter van het membraan en niet de dikte (slide 19 en de tweede examenvraag hieronder).

De spanning in het membraan hangt af van de afstand $r$ tot het midden. Er zijn een radiale en een tangentiële component:

#frm(
  "Radiale en tangentiële spanning",
  $S_r = (3 P R^2 nu) / (8 t^2) [(1 / nu + 1) - (3 / nu + 1) (r / R)^2] quad quad S_t = (3 P R^2 nu) / (8 t^2) [(1 / nu + 1) - (1 / nu + 3) (r / R)^2]$,
  [Het membraan staat onder trek in het midden en onder druk aan de rand.],
)

met:
- $S_r$ --- radiale spanning [Pa]
- $S_t$ --- tangentiële spanning [Pa]
- $r$ --- afstand tot het midden van het membraan [m]

Vul $r = 0$ in: $S_r$ en $S_t$ zijn gelijk en positief (trek, "convex" in de figuur). Vul $r = R$ in: $S_r = -3 P R^2 \/ (4 t^2)$ en $S_t = -3 nu P R^2 \/ (4 t^2)$. Dat is druk ("concave"), en radiaal een factor $1 \/ nu$ groter. Daarom staan strookjes 1 en 3 *radiaal aan de rand* (compressie, $-Delta R$) en 2 en 4 *tangentieel in het midden* (trek, $+Delta R$). Zo zitten $+Delta R$ en $-Delta R$ op één membraan en voeden ze een volle brug.

Een rekstrookrozet zet de strookjes samen op één drager. De slides geven de uitgangsspanning $e_0$ bij excitatie $E_("ex")$:

#frm(
  "Uitgang van een rozet-druksensor",
  $e_0 / E_("ex") = 820 (P R^2 (1 - nu^2)) / (E t^2) quad ["mV/V"]$,
  [De constante $820$ hoort bij de rozet uit de slides.],
)

met:
- $e_0$ --- uitgangsspanning van de brug [mV]
- $E_("ex")$ --- excitatiespanning [V]
- $P$, $R$, $nu$, $E$, $t$ --- zoals hierboven

#examenvraag("2017 vraag 13, 2016 (januari) vraag 8, juni 2016 vraag 9", [Bij druksensoren met een vastgeklemd membraan ...],
  opties: (
    [zitten de strookjes tangentieel aan de uiteinden en radiaal in het midden],
    [zitten de strookjes radiaal aan de uiteinden en tangentieel in het midden],
    [is de verplaatsing van het centrum evenredig met de wortel van de druk],
    [is de verplaatsing evenredig met de druk, enkel voor kleine verplaatsing/diameter],
  ),
  juist: "B",
)[Aan de rand is de radiale spanning het grootst en negatief, in het midden is ze gelijk aan de tangentiële en positief. Zo krijg je $+Delta R$ en $-Delta R$ op één membraan. A draait de plaatsing om. C is fout, want het verband is lineair in $y_c$ en niet wortelvormig. D beschrijft de druk--verplaatsingsrelatie (zie de volgende vraag), maar de vraag gaat over de plaatsing van de strookjes.]

#examenvraag("25-26 vraag 15", [Een druksensor op basis van de verplaatsing van het midden van een ingeklemd membraan ...],
  opties: (
    [heeft een verplaatsing evenredig met de wortel van de druk],
    [heeft een verplaatsing evenredig met de druk, enkel voor kleine verplaatsing\/*dikte*-verhoudingen],
    [heeft altijd een verplaatsing evenredig met de druk],
    [heeft een verplaatsing evenredig met de druk, enkel voor kleine verplaatsing\/*diameter*-verhoudingen],
  ),
  juist: "D",
)[In de formule voor $P$ staat naast de term in $y_c$ een kubieke term. Daardoor is het verband niet altijd lineair (C fout) en zeker niet wortelvormig (A fout). B en D verschillen in één woord. De cursus formuleert de voorwaarde als kleine $y_c \/ d$ met $d$ de diameter (slide 19), dus D.]

#examenvraag("voorbeeld op de laatste slide (rozet-druksensor)", [De formule voor een druksensor op basis van een rozet is $e_0 \/ E_("ex") = 820 P R^2 (1 - nu^2) \/ (E t^2)$. Wat is $t$ in deze vergelijking?],
  opties: (
    [de dikte van de rozetfilm],
    [de dikte van het membraan],
    [de breedte van de rozetfilm],
    [de breedte van het membraan],
  ),
  juist: "B",
)[$t$ is de dikte van het membraan: in de formules voor $P$, $S_r$ en $S_t$ staat dezelfde $t$ naast de straal $R$ van het membraan. De rozetfilm komt niet als maat in de formule voor.]

=== Piëzoresistief <sec:druk-piezoresistief>

Een piëzoresistieve druksensor leest de doorbuiging van een siliciummembraan uit met weerstanden die in het silicium gediffundeerd zijn. De druk buigt de schijf, de weerstanden rekken en hun waarde verandert (@sec:gage-factor). Silicium is het meest gebruikte materiaal omdat het piëzoresistieve effect sterk is: de gage factor is ongeveer 2 bij metalen en tot 50 bij monokristallijn silicium. De weerstanden zitten in de chip, dus de sensor kan zeer klein zijn.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L12-piezores-schijf.png", width: 100%),
    caption: [Siliciumschijf (n-type) met gediffundeerde p-type weerstanden; $P_1$ en $P_2$ staan op beide kanten (slide 14)],
    label: <fig:L12-piezores-schijf>,
  ),
  figure(
    image("assets/L12-piezores-brug.png", width: 100%),
    caption: [Rekstrookbrug met instrumentatieversterker en regelaars Zero, Gain en Null (slide 15)],
    label: <fig:L12-piezores-brug>,
  ),
)

Weerstanden bij de rand en in het midden veranderen in tegengestelde zin (de + en - in de figuur). Samen vormen ze een brug, gevolgd door een instrumentatieversterker. De regelaars *Zero* en *Null* stellen de nul af, *Gain* de versterking en een TC-weerstand ("TC Gage Factor") compenseert de temperatuurafhankelijke gage factor.

Het voorbeeld in de slides (Tek-Bar 3120S) kost 100 tot 150 euro en geeft 4 tot 20 mA of 0 tot 10 V uit (slide 16).

=== Silicium-micromachined <sec:druk-silicium>

Een silicium-micromachined druksensor is een chip waarin het membraan uit het silicium geëtst is. Op het membraan zitten binnenste en buitenste piëzoresistieve weerstanden, rond een verdikt midden ("center boss"). De chip is met een glazen drager verbonden ("silicon-to-glass anodic bond"), met een gat voor druk aan de achterkant. MEMS-druksensoren komen terug in @sec:mems-druk.

#figure(
  image("assets/L12-silicium-opbouw.png", width: 85%),
  caption: [Opbouw van een silicium-drukchip: membraan, gediffundeerde rekstrook, glasdrager en behuizing (slide 18)],
  label: <fig:L12-silicium-opbouw>,
)

#examenvraag("2019 vraag 2", [Piëzoresistieve drukmeters ...])[Ze meten wél statisch. De weerstand verandert met de rek en een Wheatstonebrug leest die ook bij DC uit. De bewering dat ze enkel dynamisch zijn is fout. De bewering dat je een condensator en opamp parallel moet plaatsen beschrijft een ladingsversterker en hoort bij piëzo-*elektrische* sensoren: die leveren lading en lekken weg (@sec:piezo-circuit), een piëzoresistieve sensor levert weerstand en blijft staan.]

=== Optisch <sec:druk-optisch>

Een optische druksensor meet de doorbuiging van een membraan met licht en isoleert de meetplaats volledig van de elektronica. Een led schijnt op twee fotodiodes. De doorbuiging van het membraan verandert hoeveel licht de *meetfotodiode* bereikt. De tweede, *referentiefotodiode*, ontvangt licht dat niet van de druk afhangt.

#figure(
  image("assets/L12-optisch.png", width: 8cm),
  caption: [Optische druksensor: led, referentiefotodiode en meetfotodiode (slide 19)],
  label: <fig:L12-optisch>,
)

- Lineair voor kleine $y_c \/ d$ bij vaste membranen.
- De tweede fotodiode is de referentie: je deelt het meetsignaal erdoor, zodat veroudering van de led wegvalt.
- Ook bruikbaar als "null balance pressure transducer".
- Volledig geïsoleerd.

Het voorbeeld in de slides (OPP-B) kost 100 tot 200 euro. Het heeft geen drift over de jaren, is immuun voor EMI en bliksem, werkt met de uitleeseenheid tot 3 km verder, is intrinsiek veilig en klein, en heeft weinig thermische verschuiving (slide 20).

#examenvraag("23-24 vraag 6, 25-26 vraag 12, voorbeeldexamen 2024", [Fig.: optische druksensor. Welke bewering is juist?],
  opties: (
    [de uitgangsspanning is evenredig met het kwadraat van de druk],
    [de uitgangsspanning is evenredig met de wortel van de druk],
    [de referentiefotodiode realiseert synchrone detectie],
    [de referentiefotodiode compenseert de veroudering van de led],
  ),
  juist: "D",
)[Een led wordt met de jaren zwakker. De referentiefotodiode meet hoeveel licht de led uitstuurt. Door het meetsignaal erdoor te delen valt de veroudering weg (een ratiometrische meting). A en B zijn fout: voor kleine doorbuiging is de uitgang lineair in de druk. C is fout: de referentiediode dient om te delen, niet om te demoduleren.]

#examenvraag("2019 vraag 6", [Optical pressure sensor])[De druk vervormt een membraan en dat verandert de weglengte van een lichtbundel of van een Fabry-Pérot-holte. Voordelen: immuun voor EMI, bruikbaar in explosiegevaarlijke omgeving, en de uitleeselektronica mag kilometers verderop staan.]
