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


#include "0.Formularium.typ"

// ----- DEEL I: BESCHRIJVENDE STATISTIEK EN KANSREKENING -----
#include "1.Intro-statistiek.typ"                                // boek H1 + H2
#include "2.Probabiliteit.typ"                                   // boek H3
#include "3.Discrete-random-variables.typ"                       // boek H4
#include "4.Continuous-random-variables.typ"                     // boek H5

// ----- DEEL II: INFERENTIELE STATISTIEK -----
#include "5.Sampling-distributions.typ"                          // boek H6
#include "6.Confidence interval afhankelijk van een sample.typ"  // boek H7
#include "7.Hypothesetoetsen.typ"                                // boek H8
#include "8.Twee-steekproeven.typ"                               // boek H9
#include "9.ANOVA.typ"                                           // boek H10
#include "10.Lineaire-regressie.typ"                             // boek H11

// Het auto-formularium verzamelt elke #frm() uit de hoofdstukken hierboven.
// Staat achteraan zodat het losgescheurd kan worden als naslag bij het oefenen.
#printformularium()
