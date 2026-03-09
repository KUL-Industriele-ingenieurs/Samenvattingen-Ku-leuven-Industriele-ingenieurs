

#import "../../school-template.typ": *

#show: project.with(
  title: "Toegepaste Mechanica en Dynamica Samenvatting",
  course: "Toegepaste Mechanica en Dynamica",
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


#printformularium()


#include "1.Inleiding.typ"
#include "2.Vlakke kinematica van een star lichaam.typ"
#include "3.Relatieve beweging snelheid.typ"
#include "4.Absolute beweging.typ"
#include "5.Relatieve versnelling.typ"
#include "6.Cilindrische coördinaten.typ"
#include "7.Relatieve bewegingsanalyse met roterende assen.typ"



