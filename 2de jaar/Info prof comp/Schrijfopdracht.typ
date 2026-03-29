#import "../../school-template.typ": *


#show: project.with(
  title: "Schrijfopdracht Professionele communicatie",
  course: "Ingenieurswetenschappen",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

== Info schrijfopdracht (to be deleted)

+ *Context*: (optional) If useful, first briefly outline the context of the event you are going to describe. This part is not to be included in the word count.

+ *Step 1*: Present a description of your experience that is as objective as possible, in the way that a camera or microphone would capture it.
+ *Step 2*: Describe several thoughts as well as several, sufficiently diverse feelings that occurred (a) at the time that the events took place and again (b) now, when you look back on your experience.
+ *Step 3*: Match the feelings with underlying needs and briefly explain the relationship between these needs and the associated feelings.

+ *Step 4*: Based on the needs of all parties involved, formulate three connective requests that you made or could have made at the time the events took place. Briefly explain how each request relates to the mentioned needs.

+ *Step 5*: Illustrate both the possibilities and the limitations of connective communication (a) with one example
from the specific personal experience that you have just described, and (b) with one concrete and plausible
situation in your future workplace as an engineer.


= Opdracht

== Context

Tijdens het IB1 project was er een conflict tussen twee teamgenoten. Tijdens het project was iemand enorm gefrustreerd geraakt omdat een andere teamgenoot veel minder ervaren was en eigenlijk niet veel kon helpen met het project. Er moest constant elke stap en elk ding moest uitgelegd worden en het hield de progressie van het project achter.

/ Persoon 1: Ervaren persoon\
/ Persoon 2: Minder ervaren persoon


== Ervaring & Observatie (Stap 1 + 2)

- Persoon 1 was duidelijk gefrustreerd en wilde niet meer samenwerken en het gewoon zelf afmaken
- Persoon 2 was niet meer gemotiveerd maar deed hun best om het conflict op te lossen
- Persoon 2 kon niet technisch mee en het ging niet in de tijd van het project opgelost geraken (kon geen motor aan een batterij schakelen).
- Persoon 1 kon het niet geloven dat iemand zo technisch achter kon staan
- Ik was teamleider en probeerde samen met de docent voor een oplossingen te zoeken
- Andere mensen van het team hadden minder een probleem maar waren ook gefrustreerd met Persoon 2
- Persoon 1 zei slechte dingen over Persoon 2 achter hun rug.
- De assistent was niet enorm hulpzaam. Probeerde wat vrede te creëren maar kon niet helpen met het echt probleem in het project.

== Gedachten en gevoelens (Stap 3)

#table(
  columns: (15%, 1fr, 1fr, 1.5fr),
  align: center + horizon,
  fill: (col, row) => {
    if row == 0 or row == 2 {
      if col == 2 { rgb("ff9999") } else if col == 3 { rgb("ffdd77") }
    } else {
      if col > 0 { rgb("f2f2f2") }
    }
  },
  [],
  [*THOUGHTS*],
  [*FEELINGS*],
  [*NEEDS*\ _What were/are your underlying (un)met needs?_\ _How do they relate to your feelings?_],

  [*ABOUT YOU*], [ ], [ ], [ ],

  [],
  [*THOUGHTS (?)*],
  [*FEELINGS (?)*],
  [*NEEDS (?)*\ _What were/could (have) be(en)/are the underlying (un)met needs of the other(s)?_\ _How do they relate to the feelings?_],

  [*ABOUT THE\ OTHER(S)*], [ ], [ ], [ ],
)



== Requests (Stap 4)

+
+
+

== Voordelen en limitaties van verbindende communicatie (Stap 5)
