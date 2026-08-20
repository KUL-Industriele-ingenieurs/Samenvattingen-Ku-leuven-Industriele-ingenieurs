// main.typ
// Modular Document Example - Demonstrates #include for large projects
// KU Leuven - Faculteit Industriële Ingenieurswetenschappen
//
// This template shows how to split a large document into multiple files.
// Use this structure for thesis, large summaries, or multi-chapter documents.

#import "../../school-template.typ": *

#show: project.with(
  title: "Ontwerp van industriële sturing",
  course: "Ontwerp van een industriële sturing Samenvatting",
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
#include "1.Info.typ"
#include "2.Intro-Industriele sturing.typ"
#include "3.Intro-tot-pneumatics.typ"
#include "4.Design van industriële controle systemen.typ"
#include "5.Main circuits.typ"
#include "6.Voorbeeld Diagram.typ"
#include "7.Veiligheid.typ"
#include "8.Pneumatica deel 2.typ"
#include "9.3D methode.typ"
#include "10.Analoge signalen.typ"
