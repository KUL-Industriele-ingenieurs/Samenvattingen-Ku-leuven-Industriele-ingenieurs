// main.typ
// Modular Document Example - Demonstrates #include for large projects
// KU Leuven - Faculteit Industriële Ingenieurswetenschappen
//
// This template shows how to split a large document into multiple files.
// Use this structure for thesis, large summaries, or multi-chapter documents.

#import "../../school-template.typ": *

#show: project.with(
  title: "Distributie van elektrische energie Samenvatting",
  course: "Distributie van elektrische energie",
  authors: ("Ruben Ryckaert", "Andere Auteur"),
  academic_year: "2025-2026",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Use #include for chapters - Typst compiles incrementally so all chapters
// are always compiled, but splitting keeps your project organized.
//
// Benefits of #include:
// - Each chapter in a separate file for clarity
// - Multiple authors can work on different chapters
// - Chapters can be reused in other documents
//
// Tip: To temporarily exclude a chapter, comment out its #include line.

// Symbol list and formularium are auto-generated
#printsymbols()
#printformularium()


// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"


= Infomatie vak <ch:inleiding>

Dit vak is opgedeeld in 2 delen: *Transformatoren* en *Netten*.
Bij transformatoren bestuderen we de werking van transformatoren, hun verliezen en hoe we deze kunnen modelleren. Bij netten bestuderen we de structuur van het elektrische net, de verschillende componenten en hoe we deze kunnen beschermen.

== Examen

Uit `Examenvoorblad met richtlijnen en formularium`: drie uur, een niet-programmeerbare rekenmachine, schrijfgerief en correctievloeistof. Drie delen van elk $33%$:

#table(
  columns: (auto, auto, 1fr),
  align: (left, center, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Deel*], [*Gewicht*], [*Vorm*]),
  table.hline(stroke: 0.5pt),
  [Kleine open vragen], [$33%$], [Definities in één zin, een netstelsel of een gelijkrichter tekenen, een proefopstelling tekenen. Zie @ch:theorievragen.],
  [Meerkeuze], [$33%$], [Eén juist antwoord per vraag, ingekleurd op het antwoordblad achteraan.],
  [Oefeningen op transformatoren], [$33%$], [Vervangingsschema uit nullast- en kortsluitproef, dan belasten. Zie @ch:oefeningen.],
  table.hline(stroke: 1pt),
)

#waarschuwing[
  *Giscorrectie.* Een juist antwoord levert $1$ punt, een fout antwoord $-1\/3$, een blanco antwoord $0$. Een dubbelzinnig antwoord telt als fout. Twijfel je tussen twee van de vier opties, dan is gokken gemiddeld nog licht in je voordeel; heb je geen enkel idee, laat dan blanco.
]

De laatste bladzijde wordt elektronisch verbeterd. Kleur de vakjes volledig in, en pas ze aan met correctievloeistof in plaats van ze opnieuw te tekenen.

== Wat staat er op het formularium? <sec:formularium-examen>

Je krijgt een formularium mee. Wat erop staat, hoef je niet vanbuiten te kennen:

- driefasig vermogen: $P_"tot" = 3 P_m$, $P_"tot" = sqrt(3) Q_m$, $S_"tot" = sqrt(P_t^2 + Q_t^2)$ en de varianten;
- de wattmetermethodes: $P_t = P_"am" + P_"bm"$ en $P_t = P_(1m) + P_(2m) + P_(3m)$;
- effectiefwaarde $U = sqrt(1/T integral_0^T u(t)^2 dif t)$;
- de gelijkgerichte spanning $U_d = (3/pi) U_ell$;
- $"THD" = sqrt(sum_(h>1)^oo U_h^2) \/ U_1$ en de crestfactor $"CF" = U_"peak" \/ U_"rms"$;
- de Fourier-coëfficiënten $a_n$ en $b_n$;
- de maximale kabellengte $ell_"max"$;
- de matrix van Fortescue voor de symmetrische componenten.

#belangrijk[Er staat geen enkele transformatorformule op.] Alles rond het vervangingsschema, de nullast- en kortsluitproef, het rendement, de spanningsval en de kloknummers moet uit je hoofd komen, terwijl dat wel een derde van het examen is.

// Transformatoren
#chapter_page("Transformatoren", label: <ch:transformatoren>)

#include "2.Intro transformatoren.typ"
#include "3.De ideale transformator.typ"
#include "4.Reële transformator.typ"
#include "5.Transformator in de praktijk.typ"
#include "6.3-phase transformator.typ"
#include "7.Toepassingen en constructie.typ"
#include "8.Oefeningen transformatoren.typ"


// Netten
#chapter_page("Netten", label: <ch:netten>)

#include "2.Het elektrische net.typ"
#include "3.Bescherming lage voltage net.typ"
#include "4.Power quality.typ"
#include "5.Diode Rectifiers.typ"
#include "6.Harmonische analyse.typ"
#include "7.Unbalanceerde netten.typ"
#include "9.Theorievragen.typ"
#include "10.Veel succes.typ"
