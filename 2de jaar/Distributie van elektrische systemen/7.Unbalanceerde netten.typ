#import "../../school-template.typ": *

= Onevenwicht in het net <ch:unbalance>

Het driefasige net heeft veel voordelen: het voedt draaiveldmachines, en voor dezelfde hoeveelheid koper transporteer je meer vermogen. Bovendien kan je er ook *enkelfasige* verbruikers op aansluiten. Die zijn elk klein in vermogen, maar er zijn er zeer veel. Samen vertegenwoordigen ze een belangrijk deel van het verbruik, en daarom loont het om hun invloed op het net te bestuderen.

De hoofdoorzaken van onevenwicht zijn *enkelfasige belastingen* en *foutsituaties*. #belangrijk[Deze cursus behandelt alleen de enkelfasige belastingen.] Onevenwichtige fouten komen in verdere opleidingsonderdelen aan bod.

== Waarom het eendradig schema vervalt <sec:eendradig-vervalt>

Tot hier tekende je driefasige kabels als één lijn: het #keyterm[eendradig schema]. Dat mag, want in een evenwichtig net hebben de drie stromen dezelfde grootte en telkens $120 degree$ faseverschuiving. Je verliest dus geen informatie.

Om dezelfde reden modelleer je een driefasige belasting vaak met een *enkelfasig equivalent*. Daarin staat maar één fase getekend. Let op bij het gebruik ervan:

- de spanningen en stromen in zo'n equivalent zijn *fasegrootheden*;
- het vermogen moet je met $3$ vermenigvuldigen om het totale belastingsvermogen te krijgen;
- je gebruikt altijd een *ster-equivalent*, ongeacht hoe de belasting werkelijk geschakeld is. De terugkerende draad onderaan het model stelt dan het sterpunt voor.

In een echt evenwichtig systeem loopt er geen stroom door de nulgeleider, want de som van de drie stromen is altijd nul. Een stroom door het sterpunt van het enkelfasige model heft dus weg tegen de andere fasen. Daarom mág je een evenwichtige belasting eendradig tekenen.

#belangrijk[Bij onevenwicht zijn zowel het enkelfasig equivalent als het eendradig schema niet meer geldig.] Vanaf hier tekent de cursus dus geen eendradige schema's meer, en worden driefasige belastingen niet meer door hun enkelfasig equivalent vervangen.

#figure(
  image("assets/DEE_N6_why_no_single_phase_equiv.png", width: 11cm),
  caption: [Bij onevenwicht vervalt het enkelfasig equivalent en moet je het volledige driefasige net doorrekenen.],
  label: <fig:geen-enkelfasig-equivalent>,
)

== Enkelfasige belasting op een driefasig net <sec:enkelfasige-belasting>

=== Nulgeleider tegenover PE <sec:n-vs-pe>

Verwar de nulgeleider (blauw) niet met de beschermingsgeleider PE (groen-geel). Hun spanning is vaak gelijk, hun functie totaal niet:

- *Nulgeleider N:* bij een onevenwichtige belasting voert die stroom. Dat geeft jouleverliezen, maar het is een *normale en veilige* situatie.
- *Beschermingsgeleider PE:* heeft een veiligheidsfunctie en voert alléén stroom bij een fout.

In dit hoofdstuk gaat het altijd over de nulgeleider.

=== Twee manieren om 230 V aan te sluiten <sec:230v-aansluiting>

Een enkelfasige belasting met nominale spanning $230 "V"$ kan je op verschillende manieren aansluiten:

- op een *lijnspanning* in een $3 times 230 "V"$-net;
- op een *fasespanning* in een $3 times 400 "V" + N$-net.

#belangrijk[De belasting zelf werkt in beide gevallen identiek. De invloed op het net verschilt wel.] In het $3 times 400 "V" + N$-net loopt er stroom door de nulgeleider; in het $3 times 230 "V"$-net loopt de stroom enkel door twee fasegeleiders.

Die stromen beïnvloeden ook de netspanningen, want de spanningsval hangt af van zowel de netimpedantie als van de stroom door elke geleider. Enkelfasige belastingen maken de netspanningen en -stromen dus onevenwichtig, met onder andere hogere verliezen in het distributienet tot gevolg.

#figure(
  image("assets/DEE_N6_single_phase_load_effect.png", width: 11cm),
  caption: [Een enkelfasige belasting geeft een onevenwichtige stroom, dus een onevenwichtige spanningsval, dus een onevenwichtige klemspanning.],
  label: <fig:enkelfasige-belasting-effect>,
)

== Wat is onevenwicht? <sec:definitie-onevenwicht>

Begin bij de definitie van een *evenwichtig* net. Daar vormen de spanningen en stromen een symmetrisch stelsel: de drie grootheden hebben dezelfde grootte en zijn over gelijke hoeken verschoven. Dat geldt evengoed voor fasespanningen, lijnspanningen, fasestromen of lijnstromen.

Elke afwijking van dat ideale symmetrische stelsel heet #keyterm[onevenwichtig] (unbalanced). In het algemene geval zijn noch de groottes, noch de fasehoeken gelijk.

#figure(
  image("assets/DEE_N6_unbalanced_grid_waveform.png", width: 11cm),
  caption: [Golfvorm en fasordiagram van een onevenwichtig driefasig stelsel: ongelijke groottes én ongelijke hoeken.],
  label: <fig:unbalanced-waveform>,
)

== De methode van de symmetrische componenten <sec:fortescue>

Om onevenwichtige kringen te bestuderen ontwikkelde *Edith Clarke* de methode van de symmetrische componenten, gebaseerd op de theorie van *Charles Fortescue* voor meerfasige signalen. De methode ontbindt elk willekeurig driefasig stelsel in *drie evenwichtige stelsels*: de symmetrische componenten van het oorspronkelijke stelsel.

=== De drie componenten <sec:fortescue-componenten>

+ *Directe component* (positive sequence): drie gelijke groottes, $120 degree$ faseverschuiving, met *positieve* fasevolgorde $a b c$.
+ *Inverse component* (negative sequence): opnieuw gelijke groottes en $120 degree$ verschuiving, maar met *omgekeerde* volgorde $a c b$.
+ *Homopolaire component* (zero sequence): gelijke groottes, en de faseverschuiving tussen alle fasen is $0 degree$ (of $360 degree$). De drie fasen lopen dus *in fase*.

#figure(
  image("assets/DEE_N6_three_sequences_phasors.png", width: 12cm),
  caption: [Fasordiagram van de symmetrische componenten: directe, inverse en homopolaire component.],
  label: <fig:drie-sequenties>,
)

=== Synthese: van componenten naar het oorspronkelijke stelsel <sec:fortescue-synthese>

Met Fortescue is elke fase van het oorspronkelijke stelsel de *fasorsom* van de drie symmetrische componenten van die fase:

#frm(
  "Symmetrische componenten (synthese)",
  $ underline(U)_a^+ + underline(U)_a^- + underline(U)_a^0 = underline(U)_a \
    underline(U)_b^+ + underline(U)_b^- + underline(U)_b^0 = underline(U)_b \
    underline(U)_c^+ + underline(U)_c^- + underline(U)_c^0 = underline(U)_c $,
  [met: $underline(U)_a$, $underline(U)_b$, $underline(U)_c$ = de fasoren van het oorspronkelijke, onevenwichtige stelsel [V]; de superscripten $+$, $-$ en $0$ = respectievelijk de directe, inverse en homopolaire component [V].],
)

Omdat elk van de drie deelstelsels symmetrisch is, kan je alles uitdrukken in de componenten van fase $a$. Je draait die gewoon over de juiste hoek:

$ underline(U)_b = 1 angle 240 degree dot underline(U)_a^+ + 1 angle 120 degree dot underline(U)_a^- + underline(U)_a^0 $
$ underline(U)_c = 1 angle 120 degree dot underline(U)_a^+ + 1 angle 240 degree dot underline(U)_a^- + underline(U)_a^0 $

Merk op waarom de hoeken bij de inverse component net omgekeerd staan: die component draait in de andere volgorde. De homopolaire component krijgt geen draaiing, want haar drie fasen liggen per definitie in fase.

In matrixvorm wordt dat de #keyterm[transformatiematrix]:

$ mat(underline(U)_a; underline(U)_b; underline(U)_c) = mat(
  1, 1, 1;
  1 angle 240 degree, 1 angle 120 degree, 1;
  1 angle 120 degree, 1 angle 240 degree, 1
) dot mat(underline(U)_a^+; underline(U)_a^-; underline(U)_a^0) $

=== De homopolaire component berekenen <sec:homopolaire-component>

Omgekeerd kan je elke symmetrische component uit de oorspronkelijke fasoren halen. De cursus geeft die van de homopolaire component expliciet:

#frm(
  "Homopolaire component",
  $ underline(U)_a^0 = 1/3 (underline(U)_a + underline(U)_b + underline(U)_c) $,
  [met: $underline(U)_a^0$ = homopolaire component van fase $a$ [V]; $underline(U)_a$, $underline(U)_b$, $underline(U)_c$ = de fasoren van het oorspronkelijke stelsel [V]. Er geldt bovendien $underline(U)_a^0 = underline(U)_b^0 = underline(U)_c^0$.],
)

Uit die uitdrukking volgt meteen: is de vectorsom van de drie fasen nul, dan is de homopolaire component nul.

#belangrijk[Dat betekent níet dat het oorspronkelijke stelsel evenwichtig is.] Het kan nog altijd een inverse component bevatten.

In een *evenwichtig* stelsel is de directe component gelijk aan het oorspronkelijke stelsel, en zijn de inverse en de homopolaire component allebei nul.

== Oorzaken van onevenwicht <sec:oorzaken>

De slides noemen drie oorzaken:

+ *enkelfasige belastingen;*
+ *netfouten;*
+ *harmonischen.*

=== Enkelfasige belastingen <sec:oorzaak-enkelfasig>

Bekijk de lijnstromen van een enkelfasige belasting: in het uiterste geval is $I_a = 0$, $I_b = 0$ en $I_c = I_n != 0$. De stroom in de drie geleiders is dus duidelijk verschillend, en de lijnstromen zijn onevenwichtig.

Pas je Fortescue toe, dan vind je zowel een inverse als een homopolaire component. Die laatste heeft grote invloed op de nulgeleider en krijgt daarom verderop een eigen paragraaf.

#figure(
  image("assets/DEE_N6_single_phase_all_components.png", width: 11cm),
  caption: [Symmetrische componenten van een enkelfasige belasting: er zit een directe, een inverse én een homopolaire component in.],
  label: <fig:enkelfasig-componenten>,
)

=== Harmonischen <sec:oorzaak-harmonischen>

Ook een *evenwichtige* belasting die vervormde stromen trekt, en dus harmonischen veroorzaakt, kan inverse en homopolaire componenten in het net veroorzaken. De definitie van harmonischen staat in @ch:harmonische-analyse.

Neem een evenwichtige belasting met een kleine vervorming die een derde harmonische stroom veroorzaakt. Elk van de stromen $i_a$, $i_b$ en $i_c$ splits je op in een grondharmonische van $50 "Hz"$ en een derde harmonische van $150 "Hz"$.

Vergelijk je dan de derde harmonischen van de drie fasen, dan blijkt:

$ i_(a 3) = i_(b 3) = i_(c 3) $

De derde harmonische is dus een *homopolaire component*. Daardoor loopt ze #belangrijk[drievoudig door de nulgeleider], wat extra warmteverliezen geeft.

#figure(
  image("assets/DEE_N6_third_harmonic_homopolar.png", width: 11cm),
  caption: [De derde harmonische stromen van de drie fasen vallen samen: ze vormen een homopolaire component.],
  label: <fig:derde-harmonische-homopolair>,
)

== Bestaanbaarheid van de homopolaire component <sec:homopolair-bestaanbaarheid>

In sommige gevallen kán de homopolaire component gewoon niet bestaan. De slides vatten dat samen in een tabel per verbindingstype ($Delta$, $Y$, $Y_n$) voor fasestroom, lijnstroom, fasespanning en lijnspanning. Die tabel moet je kunnen invullen.

=== De lijnspanning: nooit <sec:homopolair-lijnspanning>

Volgens de spanningswet van Kirchhoff is de som van de drie lijnspanningen altijd nul. Dus:

$ underline(U)_(a b)^0 = 1/3 (underline(U)_(a b) + underline(U)_(b c) + underline(U)_(c a)) = 1/3 dot 0 = 0 $

Een lijnspanning kan dus *nooit* een homopolaire component hebben.

=== Ster zonder nulgeleider: geen homopolaire stroom <sec:homopolair-ster>

Hetzelfde geldt voor de stromen, zowel lijn- als fasestromen, van een sterbelasting *zonder* nulgeleider. Er is geen geleider, dus er kan geen stroom door de nulleiding lopen. De som van de drie stromen moet dan nul zijn, en de homopolaire stroom bestaat niet.

#belangrijk[Is er wél een nulgeleider, dan heb je wel degelijk een homopolaire stroom.]

=== Driehoek: circulerende stroom <sec:homopolair-driehoek>

Bij een driehoekbelasting is het antwoord verschillend voor lijnstromen en fasestromen:

- In de *lijnstroom* kan geen homopolaire component bestaan, om dezelfde reden als bij de ster zonder nulgeleider.
- In de *fasen* kan wel een zogenaamde #keyterm[circulerende stroom] lopen. Dat is een homopolaire component. Die komt de driehoek nooit uit.

#figure(
  image("assets/DEE_N6_zero_seq_existence_full_table.png", width: 12cm),
  caption: [De tabel met de bestaanbaarheid van de homopolaire component per verbindingstype ($Delta$, $Y$, $Y_n$), voor fase- en lijnstroom en voor fase- en lijnspanning.],
  label: <fig:homopolair-tabel>,
)

== De nulgeleider en de homopolaire component <sec:nulgeleider>

Neem een driefasige kring met nulgeleider, bijvoorbeeld $3 times 400 "V" + N$, met een sterbelasting. De stromen door de nulgeleider zijn *altijd* homopolaire componenten. Pas de stroomwet van Kirchhoff toe in knooppunt $n$:

#frm(
  "Nulgeleiderstroom",
  $ underline(I)_n = underline(I)_a + underline(I)_b + underline(I)_c = 3 dot underline(I)_a^0 $,
  [met: $underline(I)_n$ = stroom door de nulgeleider [A]; $underline(I)_a$, $underline(I)_b$, $underline(I)_c$ = de drie fasestromen [A]; $underline(I)_a^0$ = homopolaire component van de fasestroom [A].],
)

Vergelijk dit met de definitie van de homopolaire component en je ziet meteen waar de factor $3$ vandaan komt: de definitie deelt door $3$, de KCL-som doet dat niet. Een homopolaire stroom loopt dus *drievoudig* door de nulgeleider.

Bij een evenwichtige belasting is de som van de drie stromen op elk moment nul, en loopt er geen stroom door de nulgeleider. #belangrijk[Geen stroom in de nulgeleider betekent dus: de homopolaire component is nul.]

=== Functie en verliezen <sec:nulgeleider-verliezen>

De nulgeleider heeft twee functies:

+ het nulpunt op de referentiespanning houden;
+ de stroom terugvoeren naar de bron.

Die tweede functie heeft een prijs: vermogenverlies en spanningsval over de kabelimpedantie.

#frm(
  "Verliezen in de nulgeleider",
  $ P_n = R_"cable" dot I_n^2 = R_"cable" dot 9 dot (I^0)^2 $,
  [met: $P_n$ = jouleverlies in de nulgeleider [W]; $R_"cable"$ = weerstand van de nulgeleider [$Omega$]; $I_n$ = stroom door de nulgeleider [A]; $I^0$ = homopolaire component [A].],
)

Let op de factor $9$: omdat $I_n = 3 I^0$ en het verlies kwadratisch met de stroom gaat, worden de verliezen *negen* keer zo groot als bij de homopolaire component alleen.

== Gevolgen: nulpuntsverschuiving <sec:nulpuntsverschuiving>

De onevenwichtige stromen van enkelfasige belastingen geven in elke geleider een verschillende spanningsval. Daardoor kan de netspanning aan de klemmen van de belasting onevenwichtig zijn, ook al is de spanning aan de netzijde perfect evenwichtig. Bovendien kan je het sterpunt van de belasting niet langer als referentie gebruiken: dat is het verschijnsel #keyterm[neutral shifting] (nulpuntsverschuiving).

=== Hoe het ontstaat <sec:nulpunt-ontstaan>

Neem een evenwichtig net dat een $Y$-belasting voedt, zonder nulgeleider, en verwaarloos de netimpedanties. De spanning in het nulpunt van het net (knoop $N$) ligt precies in het midden van de netspanningen. Is de belasting *evenwichtig*, dan ligt de spanning in knoop $n$ ook netjes in het midden. Beide knopen staan dus op dezelfde potentiaal, en door een eventuele nulgeleider zou geen stroom lopen.

Is de belasting *onevenwichtig*, dan verschillen de fasestromen en dus ook de fasespanningen. De #strong[lijn]spanningen blijven wel gelijk, want die liggen nog altijd vast door het evenwichtige net.

#belangrijk[Dat onevenwicht in de fasespanningen kan alleen van een homopolaire component komen.] Was er een inverse component, dan zou die ook in de lijnspanningen opduiken, en dat is hier niet het geval. Dit is precies het onderscheid dat de slides met "Voorbeeld 1" (directe + inverse) en "Voorbeeld 2" (directe + homopolaire) laten zien.

Als gevolg staat knoop $n$ niet meer op dezelfde potentiaal als knoop $N$: de spanning van $n$ is verschoven. Nulpuntsverschuiving is dus letterlijk *de spanning tussen $N$ en $n$*.

#figure(
  image("assets/DEE_N6_neutral_shifting_phasors.png", width: 11cm),
  caption: [Nulpuntsverschuiving: het sterpunt $n$ van de belasting verschuift ten opzichte van het bronnulpunt $N$, waardoor de fasespanningen ongelijk worden.],
  label: <fig:nulpuntsverschuiving-fasoren>,
)

=== Waarom dat gevaarlijk is <sec:nulpunt-gevolgen>

Door de verschuiving krijgen de fasespanningen verschillende groottes. De belasting op zo'n fase gaat slecht werken of gaat kapot. In het voorbeeld uit de cursus geeft een lamp op fase $c$ te weinig licht, terwijl een lamp op fase $b$ kan doorbranden door overspanning.

=== De rol van de nulgeleider <sec:nulpunt-nulgeleider>

Plaats je wél een nulgeleider, dan wordt de spanning in knoop $n$ (bijna) gelijk aan die in knoop $N$. De fasespanningen over de belasting worden dus weer gelijk. Bij een onevenwichtige belasting verschillen de fase-impedanties nog steeds, dus lopen er verschillende stromen. De som daarvan loopt door de nulgeleider.

In werkelijkheid blijft er een klein spanningsverschil over de nulgeleider staan, want ook die geleider heeft impedantie. Er is dus altijd een kleine restverschuiving. In de praktijk geeft dat geen problemen, omdat die spanningsval onder de normgrenzen blijft.

== Oplossingen <sec:mitigatie>

Naast het plaatsen van een nulgeleider geeft de cursus drie maatregelen.

=== 1. De belastingen spreiden <sec:mitigatie-spreiden>

Pak de oorzaak aan: het enkelfasige karakter zelf. Enkelfasige belastingen zijn meestal klein in vermogen, maar groot in aantal. Verdeel je er veel over de drie fasen, dan gedraagt het geheel zich als één grote, bijna evenwichtige driefasige belasting.

#belangrijk[Dit is goedkoop, effectief en wordt daarom overal toegepast.]

=== 2. De netimpedantie verlagen <sec:mitigatie-impedantie>

De problemen komen niet alleen van het enkelfasige karakter. Door de netimpedantie beïnvloedt een onevenwichtige *stroom* ook de *spanning*. Zelfs kleine spanningsonevenwichten hebben gevolgen voor veel toestellen en wil je vermijden.

Daarom houd je de netimpedantie zo klein als economisch verantwoord is. Dat doe je door:

- de doorsnede van de kabels te vergroten;
- de serie-impedantie van de transformatoren te verlagen.

Samen heet dat #keyterm[het kortsluitvermogen verhogen], gemeten op het aansluitpunt of PCC (Point of Common Coupling). De naam is logisch: is de netimpedantie klein en treedt er een kortsluiting op aan de klemmen, dan loopt er een grote kortsluitstroom.

=== 3. Compensatiekringen <sec:mitigatie-steinmetz>

Voor zeer grote enkelfasige belastingen volstaan de vorige methodes niet. Dan bestaan er compensatiekringen, zoals de #keyterm[Steinmetz-schakeling] voor het balanceren van een enkelfasige weerstand $R$.

#frm(
  "Steinmetz-schakeling",
  $ L = (R sqrt(3))/omega quad "en" quad C = 1/(sqrt(3) omega R) $,
  [met: $R$ = de enkelfasige weerstand die je balanceert [$Omega$]; $L$ = inductantie van de balanceerspoel [H]; $C$ = capaciteit van de balanceercondensator [F]; $omega$ = pulsatie van het net [rad/s]. Met deze waarden zijn de lijnstromen $I_a$, $I_b$ en $I_c$ gebalanceerd.],
)

#belangrijk[De cursus vermeldt expliciet dat compensatiekringen buiten het bestek van dit vak vallen.] Ken de formule en het principe, maar verwacht er geen uitgebreide oefening over.

#figure(
  image("assets/DEE_N6_mitigation_steinmetz_circuit.png", width: 10cm),
  caption: [Steinmetz-schakeling voor het balanceren van de enkelfasige weerstand $R$.],
  label: <fig:steinmetz>,
)
