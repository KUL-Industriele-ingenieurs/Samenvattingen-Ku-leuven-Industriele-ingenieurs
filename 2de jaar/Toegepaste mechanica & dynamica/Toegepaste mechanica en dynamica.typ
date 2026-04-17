

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
#include "8.Traagheidsmoment.typ"
#include "9.Bewegingsvergelijking bij translatie.typ"
#include "10.Bewegingsvergelijking bij algemeen vlakke beweging.typ"
#include "11.Bewegingsvergelijkingen meedere lichamen.typ"
#include "12.Bewegingsvergelijkingen cilindrische coördinaten.typ"
#include "13.Arbeid en energie.typ"
#include "14.Behoud van energie.typ"
#include "15.Botsingen.typ"
#include "16.Impulsmoment puntdeeltje.typ"
#include "17.Oefeningen.typ"
