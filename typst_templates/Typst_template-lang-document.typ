// main.typ
// Modular Document Example - Demonstrates #include for large projects
// KU Leuven - Faculteit Industriële Ingenieurswetenschappen
//
// This template shows how to split a large document into multiple files.
// Use this structure for thesis, large summaries, or multi-chapter documents.

#import "../school-template.typ": *

#show: project.with(
  title: "Modulair Document Voorbeeld",
  course: "Voorbeeldvak",
  authors: ("Jouw Naam", "Andere Auteur"),
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

#include "chapters/chapter1_inleiding.typ"
#include "chapters/chapter2_theorie.typ"
#include "chapters/chapter3_voorbeelden.typ"
