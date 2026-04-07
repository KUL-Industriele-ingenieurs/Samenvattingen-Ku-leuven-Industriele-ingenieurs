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
- Gesloten boek
- Geschreven examen
- -Theorie , oefeningen en toepassingen

#examenbox("Ga naar alle oefenzittingen en lessen ze geven je een veel betere slaagkans")

// Transformatoren
#chapter_page("Transformatoren", label: <ch:transformatoren>)

#include "2.Intro transformatoren.typ"
#include "3.De ideale transformator.typ"
#include "4.Reële transformator.typ"
#include "5.Transformator in de praktijk.typ"
#include "6.3-phase transformator.typ"


// Netten
#chapter_page("Netten", label: <ch:netten>)

#include "2.Het elektrische net.typ"
#include "3.Bescherming lage voltage net.typ"
#include "4.Power quality.typ"
#include "5.Diode Rectifiers.typ"
#include "6.Harmonische analyse.typ"
#include "7.Unbalanceerde netten.typ"

// Oefeningen
