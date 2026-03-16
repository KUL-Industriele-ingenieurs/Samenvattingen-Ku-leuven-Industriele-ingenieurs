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

// Transformatoren
#chapter_page("Transformatoren", label: <ch:transformatoren>)

#include "1.Introductie.typ"
#include "2.Intro transformatoren.typ"
#include "3.De ideale transformator.typ"
#include "4.Reële transformator.typ"
#include "5.Transformator in de praktijk.typ"


// Netten
#chapter_page("Netten", label: <ch:netten>)

#include "2.Het elektrische net.typ"
#include "3.Bescherming lage voltage net.typ"

// Oefeningen
