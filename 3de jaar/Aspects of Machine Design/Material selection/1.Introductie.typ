#import "../../../school-template.typ": *

= Introductie <ch:intro>

== Evolutie van engineering materialen <sec:evolutie>

Vroeger noemde men tijdperken naar het materiaal dat de mens gebruikte: steentijd, bronstijd, ijzertijd. Vandaag is er niet één materiaal dat de tijd bepaalt. Een ingenieur kiest uit een *enorm aanbod*: meer dan 160 000 materialen.

#figure(
  image("assets/Evolutie-engineering-materialen.png", width: 13cm),
  caption: [Relatief belang van elke materiaalfamilie doorheen de tijd.],
  label: <fig:evolutie-materialen>,
)

De grafiek toont het relatieve belang van elke familie. Tot 1960 domineren de metalen, en het staal in het bijzonder. Daarna winnen *polymeren*, *composieten* en technische *keramiek* opnieuw terrein.

Op de slides staat de evolutie ook als reeks strength–density-grafieken, van de prehistorie tot nu. Elke nieuwe periode vult een groter deel van de grafiek. Er komen dus steeds meer combinaties van sterkte en dichtheid bij.

== Materialen in het ontwerp <sec:materialen-ontwerp>

Ontwerpen betekent beslissen over het *materiaal* en de *productiemethode*.

- *Vroeger:* de ontwerper koos op basis van ervaring het best geschikte materiaal dat hij kende.
- *Nu:* dat lukt niet meer, want er zijn te veel materialen. Je hebt een *systematische procedure* nodig: vaste stappen na elkaar, die je ook in software kunt uitvoeren.

Een nieuw materiaal verandert ook het product zelf. Een waterketel ging van gietijzer naar koper of messing, en daarna naar kunststof. Een vliegtuig ging van hout en doek naar aluminium, en daarna naar composiet.

== Voorbeeld: materiaal voor een auto <sec:voorbeeld-auto>

Hetzelfde product met een ander doel geeft telkens een ander beste materiaal. Elk doel hoort bij één eigenschap waarop je alle materialen rangschikt:

#table(
  columns: (auto, auto, auto),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Doel*], [*Rangschik op*], [*Goede kandidaten*],
  [Lichte auto], [dichtheid $rho$ [kg/m³]], [Al, Mg, composieten, schuimen],
  [Goedkope auto], [kost per kg $C_m$ [€/kg]], [staal, gietijzer, hout, beton],
  [Milieuvriendelijke auto], [embodied energy [MJ/kg]], [materialen met lage productie-energie],
)

De *embodied energy* is de energie die nodig is om 1 kg van het materiaal te maken. Recyclage verlaagt die waarde.

Eén eigenschap is zelden genoeg. Een lichte auto moet ook stijf en sterk genoeg zijn. Hoe je meerdere eisen combineert, komt in de volgende hoofdstukken.

== CES Edupack <sec:ces>

*Granta CES Edupack* is software met een materiaaldatabank. Je zoekt en filtert er materialen mee en tekent er Ashby-grafieken mee. In de labo's Material selection werk je ermee.

Het handboek van dit deel is M. F. Ashby, _Materials Selection in Mechanical Design_.
