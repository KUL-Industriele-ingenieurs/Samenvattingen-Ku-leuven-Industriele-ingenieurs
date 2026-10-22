#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/7.capacitive.pdf | Samenvatting DAQ p.25-27 | examenvragen 23-24, 25-26

= Capacitieve sensoren <ch:capacitief>

Een capacitieve sensor meet een verplaatsing via de capaciteit tussen twee platen. Ze werkt contactloos en wordt gebruikt voor precisiemetingen: de positie of dikte van een geleidend voorwerp, of de dikte van een niet-geleidend materiaal.

#frm(
  "Plaatcondensator",
  $C = (epsilon_0 epsilon_r A) / x$,
  [De capaciteit verandert als de afstand $x$, de overlappende oppervlakte $A$ of het diëlektricum $epsilon_r$ verandert.],
)

met:
- $epsilon_0 = 8.85 dot 10^(-12) "F/m"$ --- permittiviteit van vacuüm
- $epsilon_r$ --- relatieve permittiviteit (diëlektrische constante) van het materiaal tussen de platen [-]
- $A$ --- overlappende oppervlakte van de platen [m²]
- $x$ --- afstand tussen de platen [m]

Elk van de drie grootheden kan het meetprincipe zijn: de *afstand* (enkelvoudige en differentiële sensor), de *oppervlakte* (lineaire brug) of de *permittiviteit* (monopolaire sensor, materiaaldetectie).

== Enkelvoudige capacitieve sensor <sec:cap-enkelvoudig>

Omdat $C tilde 1 \/ x$, is een capaciteitsmeting zelf *niet lineair* in de afstand. De truc: plaats de sensorcondensator $C_x$ in de *terugkoppeling* van een opamp, met een vaste condensator $C_i$ aan de ingang. De opamp wordt gevoed met een sinus van $50 "kHz"$. Voor een inverterende versterker geldt

$ V_o / V_i = - Z_f / Z_i = - (1 \/ (j omega C_x)) / (1 \/ (j omega C_i)) = - C_i / C_x $

en met $C_x = epsilon_0 epsilon_r A \/ x$ wordt dat

#frm(
  "Capacitieve sensor in de terugkoppeling",
  $|V_o| = (C_i V_i) / (epsilon_0 epsilon_r A) x = K x$,
  [Doordat $C_x$ in de noemer van de versterking staat, wordt de uitgang lineair in $x$.],
)

De uitgang is een amplitudegemoduleerde $50 "kHz"$-sinus. Een demodulator en een laagdoorlaatfilter halen er de verplaatsing uit.

#figure(
  image("assets/L7-enkelvoudig.png", width: 8cm),
  caption: [Enkelvoudige capacitieve sensor $C_x$ in de terugkoppeling, met demodulator en filter (slide 3)],
  label: <fig:L7-enkelvoudig>,
)

== Differentiële condensator <sec:cap-differentieel>

=== Principe <sec:cap-diff-principe>

Een beweegbare middenplaat zit tussen twee vaste platen, elk op afstand $d$. Schuift de middenplaat over $x$, dan wordt de ene spleet $d - x$ en de andere $d + x$:

$ C_1 = (epsilon_0 epsilon_r A) / (d - x) quad quad C_2 = (epsilon_0 epsilon_r A) / (d + x) $

Elk apart is niet lineair. Maar deel je het verschil door de som, dan valt $epsilon_0 epsilon_r A$ weg:

$ (C_1 - C_2) / (C_1 + C_2) = (1 \/ (d - x) - 1 \/ (d + x)) / (1 \/ (d - x) + 1 \/ (d + x)) = ((d + x) - (d - x)) / ((d + x) + (d - x)) = x / d $

#frm(
  "Differentiële condensator",
  $x / d = (C_1 - C_2) / (C_1 + C_2)$,
  [Exact lineair en onafhankelijk van $epsilon_r$ en $A$, dus ook ongevoelig voor temperatuur en vocht in het diëlektricum.],
)

#figure(
  image("assets/L7-differentieel.png", width: 7cm),
  caption: [Differentiële condensator: middenplaat op afstand $d plus.minus x$ van de vaste platen (slide 5)],
  label: <fig:L7-differentieel>,
)

=== In een brug <sec:cap-diff-brug>

$C_1$ en $C_2$ vormen een tak van een brug. De andere tak bestaat uit $C_3$ en $C_4$; $C_3$ wordt getrimd tot $C_3 = C_4$, zodat die tak op $V_i \/ 2$ staat. Met de reactanties $X_C = 1 \/ (omega C)$:

$ V_o = V_i (1 / 2 - (1 \/ (j omega C_1)) / (1 \/ (j omega C_1) + 1 \/ (j omega C_2))) = V_i (1 / 2 - C_2 / (C_1 + C_2)) = V_i (C_1 - C_2) / (2 (C_1 + C_2)) $

#frm(
  "Differentiële condensator in een (halve) brug",
  $V_o = V_i / (2 d) x$,
  [Lineair in $x$. Met twee differentiële condensatoren in een volle brug verdubbelt dit tot $V_i x \/ d$.],
)

#figure(
  image("assets/L7-differentieel-brug.png", width: 8cm),
  caption: [Differentiële condensator $C_1$-$C_2$ in een brug met $C_3 = C_4$ (slide 6)],
  label: <fig:L7-differentieel-brug>,
)

Wat als $x$ negatief is? Dan wordt $V_o$ negatief: de uitgang is een AC-signaal waarvan de *fase* $180 degree$ draait. Net als bij de LVDT (@sec:lvdt-fase) heb je synchrone detectie nodig om de richting te kennen.

Typische waarden: excitatie op $50$ tot $100 "kHz"$, verplaatsingen van $10^(-3)$ tot $10 "mm"$, capaciteiten van $1$ tot $100 "pF"$.

#examenvraag("25-26 vraag 21, ook als voorbeeld op de laatste slide", [Twee differentiële condensatoren zitten in een volledige Wheatstonebrug, met $V_"exc"$ de excitatie, $x$ de verplaatsing en $d$ de afstand tussen de vaste platen. Het uitgangssignaal is ...],
  opties: ([$2 V_"exc" x \/ d$], [geen van deze formules], [$V_"exc" x \/ (2 d)$], [$V_"exc" x \/ d$]),
  juist: "D",
)[Eén differentiële condensator in een brug geeft $V_"exc" x \/ (2d)$ (de tweede tak staat vast op $V_"exc"\/2$). Met twee differentiële condensatoren beweegt ook de tweede tak, tegengesteld:
  $ V_o / V_"exc" = (d + x) / (2 d) - (d - x) / (2 d) = x / d $
  Hetzelfde patroon als bij rekstroken: halve brug $Delta R \/ (2R)$, volle brug $Delta R \/ R$. A is de val voor wie twee keer verdubbelt; C is de halve brug.]

=== Eigenschappen <sec:cap-eigenschappen>

#table(
  columns: (1fr, 1fr),
  table.header([*Voordelen*], [*Nadelen*]),
  [kleine massa \ breed frequentiespectrum \ lineair \ kleine hysteresis \ statische én dynamische metingen \ (lage) temperatuurgevoeligheid],
  [AC-excitatie nodig \ elektronische verwerking nodig \ hoge uitgangsimpedantie \ beperkt temperatuurbereik],
)

Door de kleine massa en het brede frequentiebereik vind je de differentiële condensator terug in MEMS-versnellingssensoren: een kamstructuur met een bewegende massa tussen vaste vingers (@ch:mems).

#figure(
  image("assets/L7-kamstructuur.png", width: 7cm),
  caption: [Differentiële condensator als kamstructuur: bewegende massa van $0.7$ gram, spleet van $1.3 thin mu"m"$ (slide 8)],
  label: <fig:L7-kamstructuur>,
)

#examenvraag("23-24 vraag 2, 25-26 vraag 13, voorbeeldexamen 2024", [Een differentiële capacitieve verplaatsingssensor ...],
  opties: (
    [kan enkel met gelijkspanning als excitatie werken om statische metingen uit te voeren],
    [heeft geen Wheatstonebrug nodig om een nauwkeurige meting uit te voeren],
    [kan enkel dynamische metingen uitvoeren],
    [kan nauwkeurig kleine verplaatsingen ($< "mm"$) meten aan een hoge frequentie ($> 1 "kHz"$)],
  ),
  juist: "D",
)[Kleine massa en breed frequentiespectrum: kleine verplaatsingen, snel. A is fout: een condensator heeft AC-excitatie nodig, met DC loopt er geen stroom. Toch meet hij ook statisch (C is fout): de *excitatie* wisselt, de verplaatsing mag constant zijn. Niet verwarren met de piëzo. B is fout: hij wordt net in een brug gezet.]

== Monopolaire capacitieve sensor <sec:cap-monopolair>

Bij een *monopolaire* sensor is er maar één elektrode, verbonden met een coaxkabel. Het *doelobject* (geleidend) vormt de tweede plaat. Zo meet je de afstand tot een voorwerp zonder het aan te raken. Je kan ook de *permittiviteit* laten veranderen: een niet-geleidend materiaal tussen elektrode en doel verandert $epsilon_r$, en dus $C$.

Een probleem zijn de *parasitaire capaciteiten*: de elektrode "ziet" niet alleen het doel, maar ook de behuizing en de kabel. Een *driven shield* lost dat op: een scherm rond de elektrode dat via een buffer (volger) op exact dezelfde spanning wordt gehouden. Tussen elektrode en scherm is er dan geen spanningsverschil, dus ook geen veld, en het veld gaat alleen naar voor.

#grid(
  columns: (1fr, 1.4fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L7-monopolair.png", width: 100%),
    caption: [Monopolaire sensor: het doel is de tweede plaat (slide 9)],
    label: <fig:L7-monopolair>,
  ),
  figure(
    image("assets/L7-driven-shield.png", width: 100%),
    caption: [Driven shield via een volger (slide 9)],
    label: <fig:L7-driven-shield>,
  ),
)

== Lineaire capacitieve brugsensor <sec:cap-lineaire-brug>

Hier verandert niet de afstand maar de *overlappende oppervlakte*. Een vaste plaat heeft vier rechthoekige elementen ($K$, $M$, $N$, $S$), de bewegende plaat twee ($P$, $Q$), op een constante afstand $d$. Verschuift de bewegende plaat over $x$, dan groeit de overlap met de ene vaste elektrode en krimpt die met de andere. Bijvoorbeeld tussen $K$ en $P$:

$ C_1 = (epsilon_0 b (L \/ 2 + x)) / d $

met $b$ de breedte en $L$ de lengte van een element. Omdat $C$ nu lineair is in de *oppervlakte*, is ook de brug lineair:

#frm(
  "Lineaire capacitieve brugsensor",
  $V_o = V_i (2 x) / L$,
  [De vier capaciteiten vormen een brug; een synchrone detector geeft het teken.],
)

#grid(
  columns: (1.3fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L7-lineaire-brug.png", width: 100%),
    caption: [Lineaire capacitieve brugsensor: vaste en bewegende platen (slide 11)],
    label: <fig:L7-lineaire-brug>,
  ),
  figure(
    image("assets/L7-lineaire-brug-schema.png", width: 100%),
    caption: [De vier capaciteiten in een brug (slide 11)],
    label: <fig:L7-lineaire-brug-schema>,
  ),
)

Hetzelfde principe zit in een *capacitieve array-sensor*: een matrix van elektroden onder en boven een diëlektricum, zodat je ziet waar het materiaal wordt ingedrukt (slide 12).
