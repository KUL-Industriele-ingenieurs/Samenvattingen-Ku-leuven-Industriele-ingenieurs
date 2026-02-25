// main.typ
// Modular Document Example - Demonstrates #include for large projects
// KU Leuven - Faculteit Industriële Ingenieurswetenschappen
//
// This template shows how to split a large document into multiple files.
// Use this structure for thesis, large summaries, or multi-chapter documents.

#import "../../school-template.typ": *

#show: project.with(
  title: "Statistiek Samenvatting",
  course: "Statistiek",
  authors: ("Ruben Ryckaert",),
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


#muchpdf(
  read("StatisticsFormulaChart.pdf", encoding: none),
  width: 20cm,
  alt: "Statistics Formula Chart",
)
#printformularium()
#include "1.Intro-statistiek.typ"
#include "2.Probabiliteit.typ"
