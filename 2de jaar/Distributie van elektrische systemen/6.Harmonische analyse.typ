#import "../../school-template.typ": *

= Harmonische analyse <ch:harmonische-analyse>

Harmonischen zijn een van de grootste problemen met de spanningskwaliteit.

== Introductie <sec:introductie>

Veel belastingen trekken een #keyterm[vervormde] stroom: die is niet meer sinusvormig. Zolang de stroom wél *periodiek* is, kan je hem met een Fourierontbinding beschrijven als een som van sinussen.

Belastingen die zo'n stroom veroorzaken zijn onder andere:

- frequentieregelaars voor AC- en DC-motoren;
- UPS'en (Uninterruptible Power Supplies);
- kantoorapparatuur;
- een transformator in nullast;
- een diodegelijkrichter met capacitieve belasting, zie @ch:diode-rectifiers.

In al die gevallen is de stroom *geen lineaire functie van de spanning* meer. Zulke belastingen heten #keyterm[niet-lineaire belastingen].

#belangrijk[Een vervormde stroom veroorzaakt ook een vervormde spanningsval.] Daardoor is de spanning op het PCC (Point of Common Coupling) zelf vervormd, en verspreidt de vervorming van één verbruiker zich naar alle andere op datzelfde punt.

== Beschrijving en definities <sec:beschrijving>

Elke periodieke functie kan je ontwikkelen in een oneindige som van sinussen waarvan de frequenties gehele veelvouden zijn van de basisfrequentie $f_1$. Die ontwikkeling bevat ook een DC-component $U_0$.

#frm(
  "Fourierontwikkeling van een vervormde spanning",
  $ u(t) = U_0 + sqrt(2) dot sum_(h=1)^infinity U_h sin(h dot 2 pi f_1 dot t + alpha_h) $,
  [met: $u(t)$ = de momentane spanning [V]; $U_0$ = de DC-component [V]; $U_h$ = de effectieve waarde van de $h$-de harmonische [V]; $h$ = de orde van de harmonische [-]; $f_1$ = de fundamentele frequentie [Hz]; $alpha_h$ = de fasehoek van de $h$-de harmonische [rad].],
)

Elke sinus $u_h (t)$ in die som heet een #keyterm[harmonische]. Het woord "harmonische" gebruik je zowel voor de effectieve waarde $U_h$, voor de frequentie $f_h = h dot f_1$, als voor de orde $h$ zelf.

De basisfrequentie $f_1$ heet de #keyterm[fundamentele frequentie]. De sinus op die frequentie is de #keyterm[fundamentele component]:

$ u_1 (t) = sqrt(2) U_1 sin(2 pi f_1 t + alpha_1) $

#figure(
  image("assets/Fourierreeks.png", width: 10cm),
  caption: [Een periodieke functie en haar harmonische componenten: de fundamentele component en de derde harmonische tellen op tot het resulterende signaal.],
  label: <fig:Fourierreeks>,
)

=== Welke harmonischen kom je tegen? <sec:welke-harmonischen>

In het net gelden twee vuistregels:

- *Geen DC-component.* Vervormde netspanningen en -stromen bevatten die in de praktijk niet.
- *Geen even harmonischen.* Die ontbreken door de zogenaamde #keyterm[halvegolfsymmetrie]: de negatieve helft van de golf is het spiegelbeeld van de positieve helft.

In sommige gevallen ontbreken ook de derde harmonische en haar veelvouden. Dat komt doordat die #keyterm[homopolaire] componenten zijn. Waarom dat zo is, en wat de gevolgen zijn voor de nulgeleider, staat in @ch:unbalance.

== Kentallen voor vervorming <sec:thd>

Het *harmonisch spectrum* is de grafische manier om snel een indruk te krijgen van de grootte van de harmonischen. Numeriek gebruik je twee kentallen.

#frm(
  "Totale harmonische vervorming (THD)",
  $ "THD" = U_H/U_1 = (sqrt(sum_(h>1)^infinity U_h^2))/U_1 $,
  [met: $"THD"$ = total harmonic distortion [-] of [%]; $U_H$ = de effectieve waarde van alle harmonischen boven de eerste samen [V]; $U_1$ = de effectieve waarde van de fundamentele component [V].],
)

De THD vergelijkt dus alles wat *niet* de grondgolf is met de grondgolf zelf.

#frm(
  "Crestfactor",
  $ "CF" = U_"peak"/U_"rms" $,
  [met: $"CF"$ = crest factor [-]; $U_"peak"$ = de piekwaarde van het signaal [V]; $U_"rms"$ = de effectieve waarde [V].],
)

=== Verband tussen THD en effectieve waarde <sec:thd-effectief>

De THD hangt rechtstreeks samen met de effectieve waarde van het vervormde signaal:

#frm(
  "Effectieve waarde uit de THD",
  $ U = U_1 dot sqrt(1 + "THD"^2) $,
  [met: $U$ = de effectieve waarde van het volledige, vervormde signaal [V]; $U_1$ = de effectieve waarde van de fundamentele component [V]; $"THD"$ = de totale harmonische vervorming [-].],
)

Lees dit goed: #belangrijk[de effectieve waarde van een vervormd signaal ligt altijd *hoger* dan die van zijn grondgolf.] Dat is precies waar de overbelasting verderop vandaan komt.

#figure(
  image("assets/THD voorbeeld.png", width: 10cm),
  caption: [Voorbeeld van een harmonisch spectrum met de bijbehorende THD.],
  label: <fig:THD-voorbeeld>,
)

== Kringen modelleren met harmonischen <sec:circuit-modelleren>

Tot hier rekende je AC-kringen met fasoren in het frequentiedomein. #belangrijk[Dat mag alleen als er één enkele frequentie in het spel is.] Hoe pak je het dan aan bij harmonische vervorming?

Neem een sinusvormig laagspanningsnet van $230 "V"$ bij $50 "Hz"$ met één niet-lineaire belasting die een belangrijke derde harmonische stroom trekt. In het tijdsdomein teken je het Thévenin-equivalent van het net met die belasting als stroombron.

*De oplossing komt van Fourier zelf:* de harmonische componenten zijn lineair onafhankelijk van elkaar. Daardoor mag je per harmonische frequentie een *apart* model opstellen. De werkwijze wordt dan:

+ Stel voor elke harmonische frequentie een kringmodel in het frequentiedomein op.
+ Bereken in elk van die modellen de gevraagde spanning of stroom.
+ Tel de deelresultaten op in het #belangrijk[tijdsdomein], via superpositie.

=== Hoe modelleer je elke component? <sec:component-modellen>

Elke component krijgt een model op elke frequentie. Voor het voorbeeld hierboven:

- *De netbron.* Op de fundamentele frequentie is dat een ideale bron van $230 "V"$ bij $50 "Hz"$. Op de derde harmonische levert het net géén spanning, dus is het model een *kortsluiting*, oftewel een bron van $0 "V"$ bij $150 "Hz"$.
- *De netimpedantie.* Die heeft op elke harmonische wél een waarde, en bovendien een andere: $underline(Z)_h = R + j 2 pi h f_1 L_s$.
- *De niet-lineaire belasting.* Op de fundamentele frequentie trekt die een stroom en modelleer je ze als een passieve impedantie $underline(Z)_(l o a d,1)$. Op de hogere harmonischen is ze verantwoordelijk voor het *opwekken* van stroom. Daar modelleer je ze als een impedantie $underline(Z)_(l o a d,h)$ in combinatie met een *stroombron* $underline(I)_(l o a d,h)$ op die frequentie.

#table(
  columns: (auto, auto, 1fr, 1fr),
  align: (center, center, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*$h$*], [*$f$ [Hz]**, []Netspanning [V]**, []Netimpedantie [$Omega$]*]),
  table.hline(stroke: 0.5pt),
  [1], [50], [$u_1 (t) = sqrt(2) U_1 sin(2 pi 50 t + alpha_1)$], [$underline(Z)_1 = R + j 2 pi 50 L_s$],
  [3], [150], [$u_3 (t) = 0 "V"$], [$underline(Z)_3 = R + j 2 pi dot 3 dot 50 dot L_s$],
  [5], [250], [$u_5 (t) = 0 "V"$], [$underline(Z)_5 = R + j 2 pi dot 5 dot 50 dot L_s$],
  [$dots.h$], [$dots.h$], [$dots.h$], [$dots.h$],
  table.hline(stroke: 1pt),
)

De kern van de tabel: #belangrijk[de bron bestaat alleen op de grondfrequentie, de impedantie bestaat op élke frequentie.] En de impedantie van de spoel groeit mee met $h$, wat straks de resonantieproblemen verklaart.

== Vermogen met harmonischen <sec:vermogen-met-harmonischen>

Bij vervorming moet je ook de vermogendefinities herzien.

=== Actief vermogen <sec:actief-vermogen>

Het ogenblikkelijk vermogen blijft $p(t) = u(t) dot i(t)$, met beide als Fourierreeks. Maar $P = U I cos phi$, $Q = U I sin phi$ en $S = U I$ gelden #belangrijk[alleen bij één enkele frequentie].

Werk je $p(t)$ uit en neem je het gemiddelde, dan krijg je:

#frm(
  "Actief vermogen bij harmonischen",
  $ P = sum_(h=1)^infinity U_h dot I_h dot cos phi_h = sum_(h=1)^infinity P_h $,
  [met: $P$ = het totale actieve vermogen [W]; $U_h$, $I_h$ = de effectieve waarden van de $h$-de harmonische van spanning en stroom [V], [A]; $phi_h$ = het faseverschil tussen beide op die orde [rad]. De DC-component is verwaarloosd, wat in praktische AC-netten aanvaardbaar is.],
)

Elke harmonische levert dus haar eigen bijdrage aan het actieve vermogen, en die tel je gewoon op.

=== Reactief en schijnbaar vermogen <sec:reactief-vermogen>

Je zou verwachten dat het reactief vermogen analoog werkt:

$ Q_B = sum_(h=1)^infinity U_h dot I_h dot sin phi_h = sum_(h=1)^infinity Q_h $

#belangrijk[Maar $Q_B$ is bij vervorming níet gelijk aan de werkelijke definitie van het reactief vermogen.] Die luidt:

#frm(
  "Reactief vermogen bij vervorming",
  $ Q_F = sqrt(S^2 - P^2) $,
  [met: $Q_F$ = het totale reactieve vermogen [var]; $S$ = het schijnbaar vermogen [VA]; $P$ = het actieve vermogen [W].],
)

Het schijnbaar vermogen $S$ komt daarbij uit zijn oorspronkelijke definitie, gebaseerd op de effectieve waarden:

#frm(
  "Schijnbaar vermogen bij harmonischen",
  $ S = U dot I = sqrt(sum_(h=1)^infinity U_h^2) dot sqrt(sum_(h=1)^infinity I_h^2) $,
  [met: $S$ = schijnbaar vermogen [VA]; $U$, $I$ = de totale effectieve waarden van spanning en stroom [V], [A]; $U_h$, $I_h$ = de harmonische componenten [V], [A].],
)

*Waarom verschillen $Q_B$ en $Q_F$?* Het totale reactief vermogen $Q_F$ bevat twee soorten bijdragen:

+ bijdragen door het faseverschil tussen harmonische spanning en stroom van *dezelfde* orde, dat is precies $Q_B$;
+ bijdragen door *kruisproducten* van spanningen en stromen op *verschillende* frequenties.

De componenten van de Fourierreeks zijn orthogonaal. Kruisproducten van verschillende frequenties dragen daardoor niets bij aan het gemiddelde, en dus niet aan het *actieve* vermogen. In het reactieve vermogen duiken ze wel op.

=== De driedimensionale vermogendriehoek <sec:vermogendriehoek-3d>

In veel gevallen is de netspanning nauwelijks vervormd terwijl de stroom dat wel is. Dan geldt $U = U_1$ en $P = P_1$. Onder die aanname splits je $Q$ op in:

- $Q_1$, het *fundamentele* reactieve vermogen;
- $D$, het #strong[vervormings]vermogen (distortion power).

De vertrouwde vermogendriehoek wordt daardoor driedimensionaal.

#figure(
  image("assets/Harmonic power definitions.png", width: 10cm),
  caption: [Ogenblikkelijk vermogen $p(t) = u(t) dot i(t)$ uitgeschreven met de harmonische componenten van spanning en stroom.],
  label: <fig:Harmonic-power-definitions>,
)

#figure(
  image("assets/DEE_3D_vermogendriehoek.png", width: 11cm),
  caption: [De driedimensionale vermogendriehoek. In het grondvlak ligt de gewone driehoek met $P$ en $Q_1$; de vervormingsblindvermogen $D_H$ staat daar loodrecht op, zodat $S$ de ruimtelijke diagonaal wordt.],
  label: <fig:3d-vermogendriehoek>,
)

Onderaan ligt de vertrouwde tweedimensionale driehoek: actief vermogen $P$ horizontaal, blindvermogen $Q_1$ van de grondharmonische er loodrecht op, en hun schuine zijde $S_1$.

Het vervormingsblindvermogen $D_H$ staat loodrecht op dat hele grondvlak. Het totale schijnbaar vermogen $S$ is dus de ruimtelijke diagonaal:

$ S = sqrt(P^2 + Q_1^2 + D_H^2) $

met:
- $S$: schijnbaar vermogen [VA]
- $P$: actief vermogen [W]
- $Q_1$: blindvermogen van de grondharmonische [var]
- $D_H$: vervormingsblindvermogen door de harmonischen [var]

#belangrijk[Het totale blindvermogen $Q_F = sqrt(S^2 - P^2)$ is dus niet hetzelfde als $Q_1$.] Naast de faseverschuiving tussen de harmonische spanningen en stromen zitten er ook kruisproducten in van spanningen en stromen op #strong[verschillende] frequenties. Die dragen niets bij aan het actief vermogen, want de Fourier-componenten staan onderling loodrecht, maar ze duiken wel op in het blindvermogen.

De figuur veronderstelt dat de netspanning nauwelijks vervormd is, zodat $U = U_1$ en $P = P_1$. In de praktijk klopt dat meestal: de spanning is redelijk zuiver, de stroom is dat niet.

== Arbeidsfactor bij vervorming <sec:phase-shift-distortion>

Tot nu toe gebruikte je "arbeidsfactor" en $cos phi$ door elkaar. #belangrijk[Bij vervorming zijn die twee niet meer gelijk.]

$cos phi$ heeft namelijk alleen betekenis voor *sinusvormige* golven: $phi$ is het faseverschil tussen de sinus van de spanning en die van de stroom. Je kan dus nog wel spreken over $cos phi_1$ of $cos phi_5$. Vooral de eerste blijft belangrijk. Die krijgt een eigen naam:

#frm(
  "Arbeidsfactor opgesplitst",
  $ "PF" = P/S = "DPF" dot delta $,
  [met: $"PF"$ = power factor of arbeidsfactor [-]; $"DPF"$ = displacement power factor of verplaatsingsarbeidsfactor [-]; $delta$ = distortion power factor of vervormingsarbeidsfactor [-].],
)

=== De twee factoren afgeleid <sec:pf-afleiding>

Vertrek van de algemene uitdrukking voor de arbeidsfactor bij harmonischen:

$ "PF" = (sum_(h=1)^infinity P_h)/(U dot I) = (sum_h U_h dot I_h dot cos phi_h)/(U_1 sqrt(1 + "THD"_U^2) dot I_1 sqrt(1 + "THD"_I^2)) $

Neem nu een *sinusvormige netspanning*. Dan bestaat alleen $U_1$ en is $"THD"_U = 0$. Alle termen met $h > 1$ in de teller vallen weg, want daar is $U_h = 0$:

$ "PF" = (U_1 I_1 cos phi_1)/(U_1 I_1 dot sqrt(1 + "THD"_I^2)) = cos phi_1 dot 1/sqrt(1 + "THD"_I^2) $

Daaruit lees je de twee factoren rechtstreeks af:

$ "DPF" = cos phi_1 quad "en" quad delta = 1/sqrt(1 + "THD"_I^2) $

De vervormingsarbeidsfactor $delta$ is dus enkel een functie van de #strong[stroom]vervorming $"THD"_I$.

#examenbox[
  *Voorbeeld uit de cursus.* Bij de zespuls-diodegelijkrichter met inductieve belasting (@ch:diode-rectifiers) vind je een arbeidsfactor van $3\/pi approx #"0,95"$. Het faseverschil tussen de fundamentele spanning en de fundamentele stroom is daar $0 degree$.

  Dus: $"DPF" = 1$, en die $#"0,95"$ komt #belangrijk[volledig] van de vervormingsarbeidsfactor $delta$. Arbeidsfactorcorrectie met condensatoren zou hier dus niets opleveren: er is geen faseverschuiving om te compenseren.
]

== Gevolgen van harmonischen <sec:consequences-of-harmonics>

De gevolgen zijn tweeledig:

- de extra frequenties verhogen de *effectieve waarden* en dus de belasting;
- diezelfde hogere frequenties veroorzaken *trillingen en resonantie*.

De netcomponenten die daar het zwaarst onder lijden zijn de condensatorbatterijen voor arbeidsfactorcorrectie.

=== Overbelasting <sec:overbelasting>

De effectieve waarde van een vervormd signaal ligt hoger dan die van zijn grondgolf, en dat extra vermogen zit meestal niet op een nuttige frequentie: het wordt warmte. In een transformator verhogen harmonischen zo de kern- en wikkelingsverliezen.

Drie frequentieafhankelijke effecten maken het erger:

+ *Skin-effect:* de weerstand stijgt bij hogere frequentie.
+ *Wervelstroomverliezen:* die zijn evenredig met het *kwadraat* van de frequentie.
+ *Condensatorimpedantie:* $Z_C = 1\/(omega C)$ is omgekeerd evenredig met de frequentie. Een kleine harmonische spanning veroorzaakt daardoor een extreem grote harmonische stroom door condensatoren, en door de kabels en het schakelmateriaal dat ze voedt.

Samen leiden die verliezen tot *thermische overbelasting* van transformatoren, motoren en geleiders, en dus tot vroegtijdige veroudering.

Ook de nulgeleider lijdt onder vervorming. Omdat stroom in de nulgeleider op onevenwicht wijst, wordt dat behandeld in @ch:unbalance.

=== Resonantie <sec:resonantie>

#belangrijk[Resonantie tussen de inductieve en capacitieve componenten van het net is het meest gevreesde gevolg.]

*Serieresonantie.* Een transformator die een condensatorbatterij voedt, ziet het bovenliggende net als een #strong[serie]schakeling. Op de serieresonantiefrequentie bereikt de gecombineerde impedantie een *minimum*:

#frm(
  "Serieresonantie",
  $ j X_"eq" = j omega L + 1/(j omega C) = (1 - omega^2 L C)/(j omega C) quad ==> quad f_"series" = 1/(2 pi sqrt(L C)) $,
  [met: $X_"eq"$ = de equivalente reactantie [$Omega$]; $L$ = de inductantie van transformator en net [H]; $C$ = de capaciteit van de condensatorbatterij [F]; $f_"series"$ = de serieresonantiefrequentie [Hz].],
)

Levert het bovenliggende net een harmonische *spanning* op die frequentie, dan wordt de stroom gevaarlijk groot en gaan componenten stuk.

*Parallelresonantie.* In de praktijk zijn de harmonische spanningen in het net vrij laag, want de normen eisen dat. Harmonische *stromen* komen veel vaker voor, bijvoorbeeld door diodegelijkrichters.

Bekijk een bedrijf met lineaire én niet-lineaire belastingen plus een condensatorbatterij, gevoed via een transformator. In het model op de $h$-de harmonische bevat het Thévenin-equivalent van het bovenliggende net alleen impedanties, want het net levert daar geen spanning.

Die stroombron $I_h$ ziet dus een #strong[parallel]schakeling van de netinductantie $L_s$ en de condensator $C$:

#frm(
  "Parallelresonantie",
  $ j X_"eq" = j omega L parallel 1/(j omega C) = (j omega L)/(1 - omega^2 L C) quad ==> quad f_"parallel" = 1/(2 pi sqrt(L C)) $,
  [met: $X_"eq"$ = de equivalente reactantie gezien door de harmonische stroombron [$Omega$]; $L$ = netinductantie [H]; $C$ = capaciteit van de condensatorbatterij [F]; $f_"parallel"$ = de parallelresonantiefrequentie [Hz].],
)

Valt een harmonische samen met die parallelresonantiefrequentie, dan krijg je ernstige *overspanningen*, en die voelt #belangrijk[elke component op het PCC].

== Oplossingen <sec:solutions-of-harmonics>

Zolang het aandeel niet-lineaire belastingen beperkt blijft, volstaan standaardoplossingen. Pas als die tekortschieten ga je over op specifieke maatregelen.

=== Standaardoplossingen <sec:standaardoplossingen>

*Preventie eerst.* Scheid gevoelige belastingen van de niet-lineaire belastingen die de problemen veroorzaken. Sluit de niet-lineaire belasting zo ver mogelijk *stroomopwaarts* aan. Dan zijn de gemeenschappelijke voedingslijnen, en dus ook de gemeenschappelijke vervormde spanningsvallen, zo klein mogelijk.

#belangrijk[Fysieke afstand is niet nodig, elektrische afstand wel.] Aparte transformatoren of extra smoorspoelen verhogen de lijnimpedantie evengoed.

*Treedt vervorming toch op bij een gevoelige belasting*, dan beperk je de gevolgen met:

- *overdimensioneren:* een component kiezen met een hogere nominale waarde dan strikt nodig;
- *derating:* een component gebruiken op een lager vermogen dan zijn officiële nominale waarde.

=== Resonantiefrequenties verschuiven <sec:resonantie-verschuiven>

Condensatorbatterijen zijn extreem gevoelig voor harmonische netspanningen. Gewone overbelasting vang je op met overdimensionering of met heavy-duty condensatoren. Voor *resonantie* heb je een specifieke oplossing nodig.

Plaats een #keyterm[smoorspoel] (detuned reactor of antiharmonische spoel) $L_c$ in *serie* met de condensatorbatterij. De equivalente impedantie die de harmonische bron ziet, wordt dan:

#frm(
  "Impedantie met antiharmonische spoel",
  $ Z_"eq" = (j omega L dot (1 - omega^2 L_c C))/(1 - omega^2 dot (L_s + L_C) dot C) $,
  [met: $Z_"eq"$ = de equivalente impedantie gezien door de niet-lineaire belasting [$Omega$]; $L_s$ = netinductantie [H]; $L_c$ = de antiharmonische spoel [H]; $C$ = capaciteit van de batterij [F]. De weerstand is hierbij verwaarloosd.],
)

In die uitdrukking zitten *zowel* een serieresonantie als een parallelresonantie.

#belangrijk[De resonantie is dus niet weg.] Bij een goed ontwerp verschuif je de frequenties waarop ze optreedt gewoon naar een zone waar geen harmonischen aanwezig zijn.

=== Filters <sec:filters>

Werkt niets van het bovenstaande, dan moet je filteren.

*Passief filter.* Een serieschakeling van een condensator en een spoel, afgestemd op één specifieke frequentie. Op de serieresonantiefrequentie gedraagt het filter zich als een *kortsluiting*, zodat die stroom zich niet naar het bovenliggende net voortplant. Zijn er veel harmonischen aanwezig, dan moet je meerdere passieve filters parallel plaatsen.

*Actief filter.* Dat elimineert de harmonischen niet frequentie per frequentie. In plaats daarvan compenseert het het vervormde signaal door met vermogenelektronica een *complementaire stroom* in het net te injecteren.

*Hybride filter.* Beide principes gecombineerd, om een breder vermogen- en spectrumbereik te dekken.

#belangrijk[Filters zijn een dure oplossing.] Onderzoek dus eerst alle andere methodes.

== Woordenlijst <sec:harmonics-woordenlijst>

De cursus geeft deze vertalingen expliciet mee:

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Engels**, []Nederlands*]),
  table.hline(stroke: 0.5pt),
  [harmonic], [harmonische],
  [distortion], [vervorming],
  [fundamental component], [fundamentele component],
  [displacement power factor], [verplaatsingsarbeidsfactor],
  [distortion power factor], [vervormingsarbeidsfactor],
  [detuned reactor], [smoorspoel],
  table.hline(stroke: 1pt),
)
