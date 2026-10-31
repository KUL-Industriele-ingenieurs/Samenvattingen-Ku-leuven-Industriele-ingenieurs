#import "../../../school-template.typ": *

= Materiaalselectie: de basis <ch:basis>

== Het materiaaluniversum <sec:universum>

Het universum van materialen is ingedeeld in zes *families*. Elke familie bestaat uit *klassen* en *subklassen*. Een *lid* is één specifiek materiaal met zijn *attributen*: zijn materiaaleigenschappen.

#figure(
  image("assets/Materiaaluniversum.png", width: 12cm),
  caption: [Van universum naar familie, klasse, subklasse en lid.],
  label: <fig:universum>,
)

== De strategie in vier stappen <sec:strategie>

#grid(
  columns: (1fr, auto),
  gutter: 12pt,
  [
    + *Translation*: vertaal de ontwerpeisen naar functie, constraints, objective en vrije variabele.
    + *Screening*: schrap de materialen die het werk niet kunnen doen.
    + *Ranking*: rangschik de overblijvende materialen volgens het objective.
    + *Documentation*: zoek meer informatie over de best gerangschikte kandidaten.

    De stappen zijn iteratief. Blijkt in de documentatiestap dat je een constraint vergeten bent, dan ga je terug naar de translation.
  ],
  figure(image("assets/Selectiestrategie.png", width: 4cm), caption: [Selectiestrategie.]),
)

=== Stap 1: translation <sec:translation>

#table(
  columns: (auto, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Begrip*], [*Vraag*],
  [Function], [Wat doet het onderdeel?],
  [Constraints], [Aan welke niet-onderhandelbare voorwaarden moet het voldoen? Welke onderhandelbare, maar wenselijke voorwaarden zijn er?],
  [Objective], [Wat moet je maximaliseren of minimaliseren?],
  [Free variable], [Welke parameters mag de ontwerper vrij kiezen? Meestal een geometrische grootheid, zoals de dikte.],
)

Een *constraint* beperkt altijd het streven naar het objective. Bij de bodemplaat van een racewagen is "voldoende stijf" een niet-onderhandelbare constraint. "Weinig uitzetten bij warmte" is wenselijk, maar niet nodig voor de functie.

#waarschuwing[
  *Massa en kost zijn altijd objectives, nooit constraints.* Je streeft naar een minimale massa of kost, niet naar een bepaalde massa. In deze cursus is het objective altijd: massa en/of kost minimaliseren. Stijfheid, sterkte, $T_max$, ... zijn constraints.
]

#wrap-figure(image("assets/Vizier-helm.png", width: 3.5cm), caption: [Vizier van een helm.], label: <fig:vizier>)[
*Voorbeeld: het vizier van een helm.*
- Function: helder zicht geven en het gezicht beschermen.
- Constraints: optisch transparant (helder zicht); vormbaar, want het vizier is dubbel gekromd.
- Objective: de veiligheid maximaliseren, dus een zo hoog mogelijke breuktaaiheid $K_(1c)$.
- Free variable: het materiaal en de dikte.
]

=== Stap 2: screening <sec:screening>

Je legt *attribuutgrenzen* op uit de constraints. Een kandidaat valt af als één of meer attributen buiten die grenzen vallen. Voor het vizier zijn dat transparant en vormbaar.

Er zijn twee soorten eigenschappen:
- *Kwantitatief*: met een waarde en een eenheid, zoals $E$, $rho$ of $sigma_y$. Daarop leg je een grenswaarde.
- *Kwalitatief*: zonder eenheid, zoals de corrosiebestendigheid of de transparantie. Die beoordeel je met een schaal: slecht, goed, uitstekend.

=== Stap 3: ranking <sec:ranking>

Je *rangschikt* de overblijvende kandidaten volgens het objective:
- op *één eigenschap*. Voor het vizier is dat $K_(1c)$, van hoog naar laag;
- op een *combinatie van eigenschappen*: de *materiaalindex* (@sec:mi). Dat is in 99 % van de gevallen nodig.

Bij de ranking schrap je geen materialen meer. Dat gebeurde al in de screening.

=== Stap 4: documentation <sec:documentation>

Je kiest niet automatisch de eerste kandidaat. Het kan zijn dat je in de translation een constraint vergeten bent, bv. de stijfheid. Je zoekt daarom bij de best gerangschikte kandidaten:
- case studies van eerdere toepassingen;
- faalanalyses;
- de corrosiebestendigheid;
- de prijs en de beschikbaarheid;
- of het materiaal maakbaar is.

Je vindt dat in handboeken en in datasheets van leveranciers. Voor het vizier blijken polycarbonaat (PC), celluloseacetaat en PMMA allemaal al gebruikt te worden voor veiligheidsbrillen en vizieren. PC is een goede kandidaat.

== De materiaalindex <sec:mi>

Een *materiaalindex* $M I$ is de combinatie van *intensieve* materiaaleigenschappen die het objective bepaalt. Je vindt hem in vijf stappen:

+ Stel de *objective function* (OF) op: de massa of de kost.
+ Stel de *constraint function* (CF) op, bv. de stijfheid.
+ Zonder de *vrije variabele* af uit de constraint function.
+ Substitueer de vrije variabele in de objective function.
+ De nieuwe objective function bevat drie factoren: geometrie, belasting en een combinatie van intensieve eigenschappen. Die laatste factor is de *materiaalindex*.

#theorie(title: "Tip van de prof")[
  Werk met symbolen, niet met getallen, ook als de getallen gegeven zijn. Constanten zoals $C_1$ laat je staan.
]

=== Voorbeeld: bodemplaat van een racewagen <sec:mi-plaat>

#figure(
  image("assets/Bodemplaat.png", width: 7cm),
  caption: [Bodemplaat: $L$ en $w$ liggen vast, de dikte $t$ is vrij.],
  label: <fig:plaat>,
)

#figure(image("assets/Racewagen.png", width: 6cm), caption: [Racewagen: de bodemplaat draagt de bestuurder.])

- Objective: de massa minimaliseren.
- Constraint: de plaat mag niet te veel doorbuigen. Dat is een *stijfheidsbeperkt ontwerp*.
- Vrije variabele: de dikte $t$. $L$ en $w$ liggen vast.

*1. Objective function.* Schrijf de massa uit tot de vrije variabele erin staat:
$ m = rho V = rho L w t $

*2. Constraint function.* De stijfheid van een balk komt uit het formularium:
$ S = (C_1 E I) / L^3 quad "met" quad I = (w t^3) / 12 quad arrow.r.double quad S = (C_1 E w t^3) / (12 L^3) $

met:
- $S$ --- stijfheid [N/m]
- $C_1$ --- constante die afhangt van de belasting en de inklemming [-]
- $I$ --- traagheidsmoment van de doorsnede [m⁴]

*3. Vrije variabele afzonderen:*
$ t = ((12 S L^3) / (C_1 E w))^(1 slash 3) $

*4. Substitueren in de objective function:*
$ m = underbrace(((12 S) / C_1)^(1 slash 3), "belasting") dot underbrace(w^(2 slash 3) L^2, "geometrie") dot underbrace(rho / E^(1 slash 3), "materiaal") $

*5. Materiaalindex.* Alleen $rho$ en $E$ zijn intensief, dus:
$ M I = rho / E^(1 slash 3) $

De massa is evenredig met $M I$: de factoren voor belasting en geometrie zijn voor elk materiaal dezelfde. Het lichtste materiaal is dus het materiaal met de *kleinste* $M I$. Het handboek rangschikt altijd van groot naar klein, en daarom draai je de index om: $M I^* = 1 slash M I$. Het lichtste materiaal heeft dan de *grootste* $M I^*$.

#frm("Materiaalindex lichte, stijve plaat", $M I^* = 1 / (M I) = E^(1 slash 3) / rho quad "maximaliseren"$, [met: $E$ = elasticiteitsmodulus [GPa], $rho$ = dichtheid [kg/m³]])

=== Ranking: analytisch of grafisch <sec:grafisch>

*Analytisch*: je berekent $M I^*$ voor elke kandidaat die de screening overleefde. Dat kost veel tijd en geeft rekenfouten. In CES Edupack neem je per eigenschap het gemiddelde van het bereik.

*Grafisch*: in de Ashby-grafiek komt de teller van $M I^*$ op de y-as en de noemer op de x-as. Neem de logaritme:
$ log M I^* = 1/3 log E - log rho quad arrow.r.double quad log E = 3 log rho + 3 log M I^* $

Dat is een rechte $y = a x + b$ met helling $a = 3$: de *material index line* of *design line*. Alle materialen op die lijn hebben dezelfde $M I^*$ en presteren dus even goed.

#figure(
  cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (8, 0), mark: (end: "stealth"))
    line((0, 0), (0, 6.5), mark: (end: "stealth"))
    content((8, -0.5), [$log rho$])
    content((-0.6, 6.4), [$log E$])
    for (i, l) in ([1], [10], [100], [1000]).enumerate() { content((1 + 2 * i, -0.4), text(size: 8pt, l)) }
    // MI-lijnen met helling 3
    for (j, (x0, nr)) in ((0.75, [1]), (1.55, [2]), (2.35, [3])).enumerate() {
      line((x0, 0.2), (x0 + 1.9, 5.9), stroke: (paint: schoolRed, thickness: 1.2pt, dash: if j == 0 { none } else { "dashed" }))
      content((x0 + 1.9, 6.2), text(fill: schoolRed, size: 9pt)[#nr])
    }
    // families als ovalen
    circle((5.8, 4.8), radius: (1.1, 0.7), fill: rgb(240, 150, 150, 120), stroke: none)
    content((5.8, 4.8), text(size: 8pt)[metalen])
    circle((2.0, 3.3), radius: (1.0, 0.6), fill: rgb(150, 210, 150, 140), stroke: none)
    content((2.0, 3.3), text(size: 8pt)[natuurlijk])
    circle((4.3, 2.1), radius: (0.8, 0.6), fill: rgb(130, 160, 230, 140), stroke: none)
    content((4.3, 2.1), text(size: 8pt)[polymeren])
    circle((1.3, 1.2), radius: (0.8, 0.5), fill: rgb(240, 220, 120, 140), stroke: none)
    content((1.3, 1.2), text(size: 8pt)[schuimen])
    // helling-driehoek
    line((5.6, 0.6), (6.6, 0.6), (6.6, 3.6), close: true, stroke: 0.6pt)
    content((6.1, 0.3), text(size: 8pt)[1])
    content((6.95, 2.1), text(size: 8pt)[3])
    line((4.4, 4.0), (3.3, 5.1), stroke: 1pt + schoolGreen, mark: (end: "stealth"))
    content((5.0, 3.7), text(fill: schoolGreen, size: 9pt)[$M I^*$ hoger])
  }),
  caption: [Grafische ranking met helling 3. Schuif de lijn naar linksboven tot de eerste kandidaat. Parallelle lijnen geven de volgorde 1, 2, 3, ... (bordtekening).],
  label: <fig:mi-lijn>,
)

Je schuift de lijn evenwijdig naar *linksboven*: hoe verder, hoe hoger $M I^*$. Het eerste materiaal dat de lijn raakt, staat op 1. Daarna schuif je de lijn terug naar rechtsonder. Het volgende materiaal is nummer 2, enzovoort.

#examenbox[
  Op het examen stoppen veel studenten na het afleiden van de index, of ze duiden alleen het beste materiaal aan. Ranking betekent dat je *alle* overblijvende kandidaten in volgorde zet: 1, 2, 3, 4, ... met parallelle lijnen. Vergeet daarna de documentatiestap niet.

  Teken je een log-log-grafiek, nummer de assen dan met 1, 10, 100. Zo is duidelijk dat de schaal logaritmisch is.
]

#figure(
  image("assets/Lichte-auto-hellingen.png", width: 9cm),
  caption: [Lichte auto in CES Edupack: $E$–$rho$-grafiek met lijnen van helling 1, 2 en 3 door hetzelfde punt (uit de les).],
  label: <fig:mi-ces>,
)

Een lijn met helling 1 stijgt één decade in $E$ per decade in $rho$, een lijn met helling 3 drie decades. Voor de plaat ($E^(1 slash 3) slash rho$) gebruik je helling 3.

=== Van massa naar kost of milieu <sec:kost-milieu>

Verander je het objective, dan verandert alleen de teller van $M I$:
- *Goedkope auto*: de kost is $C = C_m m = C_m rho V$. In de index wordt $rho$ dan $C_m rho$, met $C_m$ de prijs per kg [€/kg].
- *Milieuvriendelijke auto*: $rho$ wordt $H_m rho$, met $H_m$ de embodied energy [MJ/kg].

Voor de plaat wordt dat $M I^* = E^(1 slash 3) slash (C_m rho)$ en $M I^* = E^(1 slash 3) slash (H_m rho)$.

=== Voorbeeld 1: sterke, lichte trekstang <sec:mi-tie>

#figure(image("assets/Dubbeldekker.png", width: 5cm), caption: [Dubbeldekker: trekstangen tussen de vleugels.])

De trekstangen tussen de vleugels van een dubbeldekker moeten sterk en zo licht mogelijk zijn. De lengte $L$ ligt vast. De doorsnede is rond, maar de oppervlakte $A$ is vrij.

$ "OF:" quad m = rho L A $
$ "CF:" quad sigma_f = F / A quad arrow.r.double quad A = F / sigma_f $
$ m = F L dot rho / sigma_f $

#frm("Materiaalindex sterke, lichte trekstang", $M I^* = sigma_f / rho$, [met: $sigma_f$ = sterkte [MPa], $rho$ = dichtheid [kg/m³]. Op een $sigma_f$–$rho$-grafiek is de helling 1.])

=== Voorbeeld 2: stijve, goedkope balk <sec:mi-balk>

#figure(
  cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // balk in zijaanzicht op twee steunpunten
    rect((0, 0), (8, 0.5), fill: rgb(120, 180, 220))
    line((0.3, 0), (-0.1, -0.6), (0.7, -0.6), close: true, fill: luma(200))
    line((7.7, 0), (7.3, -0.6), (8.1, -0.6), close: true, fill: luma(200))
    line((7.2, -0.75), (8.2, -0.75))
    line((4, 2.0), (4, 0.55), stroke: 1.4pt + schoolRed, mark: (end: "stealth"))
    content((4.4, 1.7), text(fill: schoolRed)[$F$])
    line((0.3, -1.1), (7.7, -1.1), mark: (start: "stealth", end: "stealth"))
    content((4, -1.45), [$L$])
    // vierkante doorsnede
    rect((9.8, -0.2), (10.9, 0.9), fill: rgb(120, 180, 220))
    line((9.8, -0.5), (10.9, -0.5), mark: (start: "stealth", end: "stealth"))
    content((10.35, -0.85), [$b$])
    line((11.2, -0.2), (11.2, 0.9), mark: (start: "stealth", end: "stealth"))
    content((11.55, 0.35), [$b$])
    content((10.35, 1.3), text(size: 9pt)[doorsnede])
  }),
  caption: [Stijve balk met een vierkante doorsnede $b times b$: $L$ ligt vast, $b$ (en dus $A = b^2$) is vrij.],
)

Een balk met een vierkante doorsnede mag niet te veel doorbuigen en moet zo goedkoop mogelijk zijn. De lengte $L$ ligt vast. De zijde $b$, en dus $A = b^2$, is vrij.

$ "OF:" quad C = C_m rho L A $
$ "CF:" quad S = (C_1 E I) / L^3 quad "met" quad I = b^4 / 12 = A^2 / 12 quad arrow.r.double quad S = (C_1 E A^2) / (12 L^3) $
$ A = ((12 S L^3) / (C_1 E))^(1 slash 2) $
$ C = ((12 S) / C_1)^(1 slash 2) L^(5 slash 2) dot (C_m rho) / E^(1 slash 2) $

#frm("Materiaalindex stijve, goedkope balk", $M I^* = E^(1 slash 2) / (C_m rho)$, [met: $E$ = elasticiteitsmodulus [GPa], $C_m$ = prijs per kg [€/kg], $rho$ = dichtheid [kg/m³]. Helling 2.])

Je moet de vrije variabele $A$ in de constraint function laten verschijnen. Daarom herschrijf je $b^4$ als $A^2$.

#table(
  columns: (auto, auto, auto, auto),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Onderdeel*], [*Constraint*], [*$M I^*$ (minimale massa)*], [*Helling op $E$–$rho$ of $sigma$–$rho$*],
  [Trekstang], [sterkte], [$sigma_f slash rho$], [1],
  [Balk (vierkant)], [stijfheid], [$E^(1 slash 2) slash rho$], [2],
  [Plaat], [stijfheid], [$E^(1 slash 3) slash rho$], [3],
)

Voor een minimale kost vervang je telkens $rho$ door $C_m rho$.

== Performance index <sec:pi>

Heb je meerdere constraints, dan krijg je meerdere indices en dus meerdere rankings. Een vlugge maar *subjectieve* manier om die te combineren is de *performance index*:
+ Geef elke index $M_i$ een gewichtsfactor $w_i$ tussen 0 en 1, met $sum w_i = 1$. Bijvoorbeeld: stijfheid 0,5, sterkte 0,3, breuktaaiheid 0,1 en warmtegeleiding 0,1.
+ Deel elke index door zijn maximum over alle kandidaten. Zo krijg je een getal tussen 0 en 1.
+ Vermenigvuldig met de gewichtsfactor en tel op.

#frm("Performance index", $W_i = w_i M_i / (M_i)_max quad quad P I = sum_i W_i$, [met: $w_i$ = gewichtsfactor ($0 <= w_i <= 1$, $sum w_i = 1$) [-], $M_i$ = waarde van index $i$ voor het materiaal, $(M_i)_max$ = grootste waarde van index $i$ over alle kandidaten. Rangschik op $P I$.])

De gewichten kies je zelf, dus de uitkomst is subjectief. Een objectieve aanpak voor meerdere constraints en tegenstrijdige objectives volgt in @ch:meerdere-rv.
