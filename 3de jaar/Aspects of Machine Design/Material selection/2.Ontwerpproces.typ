#import "../../../school-template.typ": *

= Het ontwerpproces <ch:ontwerpproces>

== Van marktvraag tot productspecificatie <sec:stadia>

Het ontwerpproces vertrekt van een *market need*: de ontwerpeisen. Het eindigt bij een *productspecificatie*. Daartussen liggen drie stadia:

#figure(
  image("assets/Ontwerpproces.png", width: 9cm),
  caption: [De drie stadia van het ontwerpproces.],
  label: <fig:ontwerpproces>,
)

- *Concept:* je bepaalt de functiestructuur, zoekt werkingsprincipes en kiest het beste concept.
- *Embodiment:* je legt lay-out, schaal en vorm vast, modelleert en analyseert de assemblages en kiest de beste lay-out.
- *Detail:* je analyseert elk onderdeel in detail, optimaliseert prestatie en kost, en maakt de definitieve keuze van materiaal en proces.

Het proces is *iteratief*. Blijkt een keuze in een later stadium niet te werken, dan ga je terug naar een vorig stadium. Je start met veel concepten. Slechts enkele daarvan gaan door naar embodiment, en nog minder naar detail.

== Design tools en materiaaldata <sec:tools-data>

Elk stadium vraagt andere tools en andere materiaaldata.

#figure(
  image("assets/Design-tools-en-materiaaldata.png", width: 10cm),
  caption: [Design tools en nodige materiaaldata per stadium.],
  label: <fig:tools-data>,
)

#table(
  columns: (auto, 1fr, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Stadium*], [*Design tools*], [*Materiaaldata*],
  [Concept], [functiemodellering, haalbaarheidsstudies, benaderende analyse], [*alle* materialen, lage precisie en detail],
  [Embodiment], [geometrische modellering, simulaties, kostmodellering], [een *deelverzameling* van de materialen, hogere precisie],
  [Detail], [componentmodellering, eindige elementen (FEM), DFM/DFA], [*één* materiaal, hoogste precisie en detail],
)

Hoe verder je in het ontwerp zit, hoe minder materialen je nog bekijkt en hoe preciezer de data moeten zijn.

== Product als technisch systeem <sec:technisch-systeem>

Een product is een *technisch systeem*. Hoe je het opsplitst, hangt af van het soort ontwerp.

- *Bestaand ontwerp:* je splitst het systeem in subassemblies en die in componenten. Voor elk component kies je een materiaal en een proces.
- *Nieuw ontwerp:* je vertrekt van de functie. Energie, materiaal en informatie gaan het systeem in en uit. De totale functie splits je in deelfuncties (een *functiestructuur*). Voor elke deelfunctie zoek je een werkingsprincipe.

== Types ontwerp <sec:types>

- *Original design:* een nieuw idee of werkingsprincipe, bijvoorbeeld de balpen.
- *Adaptive of developmental design:* een bestaand concept verbeteren, vaak dankzij een nieuw materiaal. Voorbeelden: polymeer in plaats van metaal in keukengerei en huishoudtoestellen, of carbon in plaats van hout of staal in sportgerief.
- *Variant design:* dezelfde functie en hetzelfde werkingsprincipe op een andere schaal of met andere afmetingen. Voorbeelden: een groter drukvat of een grotere ketel, een grotere turbine.

== Interactie bij materiaalselectie <sec:interactie>

*Functie*, *materiaal*, *vorm* en *proces* hangen van elkaar af. De functie legt eisen op aan het materiaal en de vorm. Het materiaal bepaalt welke processen mogelijk zijn. Het proces beperkt welke vormen je kunt maken. Je kiest ze dus samen, niet na elkaar.

== Case study: een fles met kurk openen <sec:kurkentrekker>

De market need is: een toestel om wijn uit een fles met kurk te krijgen.

*Concept.* Er zijn vijf werkingsprincipes:

#figure(
  image("assets/Kurkentrekker-concepten.png", width: 8cm),
  caption: [Vijf concepten om een fles met kurk te openen.],
  label: <fig:kurk-concepten>,
)

- (a) de kurk axiaal uittrekken;
- (b) de kurk losmaken met schuifkrachten langs de wand;
- (c) de kurk van onderen naar buiten duwen;
- (d) de kurk verpulveren;
- (e) de kurk omzeilen door de hals van de fles te breken.

*Functiestructuur.* Concept (a) splits je in drie deelfuncties: kracht opwekken, kracht doorgeven en de kracht op de kurk zetten. Elke deelfunctie heeft meerdere oplossingen. Elke route door het schema is een mogelijk ontwerp.

#figure(
  image("assets/Kurkentrekker-functiestructuur.png", width: 10cm),
  caption: [Functiestructuur van de kurkentrekker.],
  label: <fig:kurk-functiestructuur>,
)

*Embodiment.* Elk onderdeel krijgt een functionele eis, bijvoorbeeld:
- een goedkope schroef die een voorgeschreven last op de kurk overbrengt;
- een lichte hefboom die een voorgeschreven buigmoment draagt;
- een slank, elastisch blad dat niet knikt als je het tussen kurk en hals drijft;
- een dunne holle naald die stijf en sterk genoeg is om door de kurk te prikken.

*Detail.* Elk onderdeel krijgt exacte maten, toleranties, een materiaal en een proces. Op de slide is het handvat gegoten uit fenolhars en de arm gefreesd uit staf in RVS type 302.
