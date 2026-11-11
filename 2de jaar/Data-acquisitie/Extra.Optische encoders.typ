#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Samenvatting DAQ p.30-33 | studentensamenvattingen 2024-2025 en 1ste versie | examenvragen 2016, 2017, 25-26
// Geen slidedeck: voorbeeldexamen 25-26 vraag 9 vraagt dit wel.

= Optische encoders <ch:optisch>

Een optische encoder zet de hoekpositie van een as om in elektrische pulsen met een lichtbron en lichtsensoren. Op een schijf wisselen ondoorzichtige en transparante sectoren elkaar af. Er bestaan twee types: incrementeel en absoluut.

#figure(
  image("assets/LX-encoder-opbouw.png", width: 8cm),
  caption: [Opbouw van een roterende encoder: led, optische schijf, referentieraster en detector (Samenvatting DAQ p.30)],
  label: <fig:LX-encoder-opbouw>,
)

== Incrementele encoder <sec:incrementele-encoder>

Een incrementele encoder telt pulsen van een schijf met spleten om de draaihoek te bepalen. De led schijnt door de schijf op een lichtsensor. Zwarte sectoren blokkeren het licht en transparante laten het door. Er ontstaat een blokgolf. Een teller telt de pulsen. Het aantal pulsen geeft de hoek, de pulsfrequentie geeft de snelheid.

#grid(
  columns: (1fr, 1.6fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/LX-schijf.png", width: 100%),
    caption: [Schijf met lichtbronnen, sensoren, conditionering en teller (Samenvatting DAQ p.31)],
    label: <fig:LX-schijf>,
  ),
  figure(
    image("assets/LX-kwadratuur.png", width: 100%),
    caption: [Kanalen A en B in kwadratuur (Samenvatting DAQ p.31)],
    label: <fig:LX-kwadratuur>,
  ),
)

Met één lichtsensor kun je de draairichting niet bepalen. Daarom heeft de encoder een tweede sensor die een kwart periode verschoven staat, dus $90 degree$ in fase. De twee uitgangen heten *kanaal A* en *kanaal B*, en ze staan in *kwadratuur*. Welk kanaal eerst schakelt, geeft de richting. Bij een stijgende flank van A is B in de ene richting laag en in de andere hoog.

Een derde uitgang, de *indexpuls Z*, geeft één puls per omwenteling. Z is een referentiepunt waarmee je de teller kunt resetten. Z geeft zelf geen absolute positie na het inschakelen.

De *resolutie* hangt af van het aantal spleten en van wat je telt. Bij $N$ spleten per omwenteling:

#frm(
  "Telwaarden per omwenteling",
  $N_"tel" = k N quad k in {1, 2, 4}$,
  [Mode 1 telt één flank van A, mode 2 telt beide flanken van A, mode 4 telt beide flanken van A en B.],
)

met:
- $N_"tel"$ --- aantal tellen per omwenteling [-]
- $N$ --- aantal spleten op de schijf [-]
- $k$ --- decodeerfactor: 1 voor mode 1, 2 voor mode 2, 4 voor mode 4 [-]

Een hogere modus geeft dus een fijnere stap, namelijk $360 degree \/ N_"tel"$. Dat is een hogere resolutie, maar de nauwkeurigheid van de schijf zelf blijft hetzelfde. De resolutie loopt van 100 tot 65 000 stappen per omwenteling, met een nauwkeurigheid van ongeveer 30 boogseconden.

Nadelen:
- de positie gaat verloren bij spanningsuitval, want de teller kent alleen de verandering
- vervuiling van de schijf en elektrische storing geven valse pulsen die zich opstapelen
- een externe teller is nodig voor de absolute positie

#examenvraag("25-26 vraag 9", [Bij een incrementele optische encoder met 3 uitgangen (A, B, Z) ...],
  opties: (
    [kan je de absolute hoekverplaatsing bepalen],
    [moet je synchrone detectie gebruiken om de richting te bepalen],
    [moet je de uitgangen in kwadratuur gebruiken om de richting te bepalen],
    [kan je de richting bepalen door mode 3 te gebruiken],
  ),
  juist: "C",
)[A en B liggen $90 degree$ uit fase, en de volgorde waarin ze schakelen geeft de richting. Z is de indexpuls, één per omwenteling. Dat geeft een referentie, maar na het inschakelen nog geen absolute positie. Daarom is A fout. B is fout: synchrone detectie hoort bij AC-sensoren zoals de LVDT. D is fout: er bestaat geen mode 3, alleen mode 1, 2 en 4.]

== Absolute encoder <sec:absolute-encoder>

Een absolute encoder geeft bij elke hoek een unieke code, zodat de positie direct bekend is. De codeschijf heeft meerdere sporen of ringen. Elke ring heeft een eigen patroon van transparante en ondoorzichtige segmenten, en elke ring geeft één bit. Een lichtdetector per ring leest 1 (licht) of 0 (geen licht). Samen geven de sporen een $N$-bit code per positie.

#figure(
  image("assets/LX-absoluut.png", width: 7.0cm),
  caption: [Absolute optische encoder: codeschijf met meerdere sporen en detectoren (Samenvatting DAQ p.32)],
  label: <fig:LX-absoluut>,
)

De code is een *Gray-code*. Bij gewoon binair veranderen er op sommige overgangen meerdere bits tegelijk. Van 3 naar 4 wordt het $011 arrow 100$. De detectoren schakelen nooit exact gelijktijdig, dus je leest even een willekeurige tussenwaarde. In een Gray-code verandert er per stap precies één bit. De grootst mogelijke fout is dan één positie. Een absolute encoder kent zijn positie meteen. Kwadratuur, richtingsdetectie en de modes 1, 2 en 4 bestaan daarom alleen bij de incrementele encoder.

#table(
  columns: (auto, auto, auto),
  align: center,
  table.header[*Positie*][*Binair*][*Gray*],
  [3], [011], [010],
  [4], [100], [110],
)

Voordelen:
- hoge precisie tot 16 bit
- weinig gevoelig voor ruis en vervuiling door de Gray-code
- relatief goedkoop voor die precisie

Nadelen:
- temperatuurgevoelig
- schokgevoelig
- bij minder dan 10 bit bestaan goedkopere alternatieven

#examenvraag("2017 vraag 8", [Een absolute optische encoder geeft een signaal in ...],
  opties: (
    [binaire code],
    [kwadratuurcode],
    [Gray code],
  ),
  juist: "C",
)[In een Gray-code verandert er per stap precies één bit, dus de grootste fout is één positie. A is fout: bij binair veranderen op sommige overgangen meerdere bits tegelijk. B is fout: kwadratuur hoort bij de incrementele encoder.]

#examenvraag("2016 (januari) vraag 12", [Is de uitvoer van een absolute optische sensor gecodeerd met Gray code?])[Ja. In een Gray-code verandert er per stap precies één bit. Bij gewoon binair springen op sommige overgangen meerdere sporen tegelijk (bijvoorbeeld $0111 arrow 1000$). Omdat geen enkele sensor exact gelijk schakelt, lees je dan een willekeurige tussenwaarde.]

#examenvraag("2016 (17/06) vraag 19", [Een absolute optische encoder als hoekverplaatsingssensor ...],
  opties: (
    [precisie verdubbelen door mode 2],
    [nauwkeurigheid verdubbelen door mode 2],
    [kwadratuurdetectie wordt gebruikt om de richting te bepalen],
    [Gray code wordt gebruikt om het uitgangssignaal te bepalen],
  ),
  juist: "D",
)[Gray code is de codering van een absolute encoder. C is fout: kwadratuurdetectie hoort bij de incrementele encoder, en een absolute encoder kent zijn positie meteen en heeft geen richtingsdetectie nodig. A en B zijn fout: de modes 1, 2 en 4 bestaan alleen bij de incrementele encoder.]

== Optische brug <sec:optische-brug>

Een vierkwadrant optische sensor bepaalt de positie van een lichtvlek of lichtbron in twee richtingen. De sensor heeft vier lichtgevoelige segmenten (kwadranten). Elk segment geeft een signaal evenredig met het ontvangen licht. De signalen worden gecombineerd tot twee verschillen.

#figure(
  image("assets/LX-vierkwadrant.png", width: 11cm),
  caption: [Vierkwadrantensensor met segmenten 1 (boven), 2 (rechts), 3 (onder), 4 (links) en twee verschilversterkers (Samenvatting DAQ p.33)],
  label: <fig:LX-vierkwadrant>,
)

De $x$-positie volgt uit het verschil van de rechter- en de linkerhelft, de $y$-positie uit het verschil van de bovenste en de onderste helft. Met de nummering van de figuur:

#frm(
  "Positie met een vierkwadrantsensor",
  $x prop V_2 - V_4 quad y prop V_1 - V_3$,
  [Elk verschilsignaal is nul als de lichtvlek gecentreerd staat.],
)

met:
- $V_1$, $V_2$, $V_3$, $V_4$ --- signalen van het kwadrant boven, rechts, onder en links [V]
- $x$, $y$ --- positie van de lichtvlek ten opzichte van het midden [m]

Staat de lichtvlek in het midden, dan krijgen alle vier de segmenten evenveel licht en zijn beide verschillen nul.
