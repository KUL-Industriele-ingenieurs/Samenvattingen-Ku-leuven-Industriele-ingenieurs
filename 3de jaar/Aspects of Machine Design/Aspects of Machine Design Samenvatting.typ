#import "../../school-template.typ": *

#show: project.with(
  title: "Aspects of Machine Design Samenvatting",
  course: "Aspects of Machine Design",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Eén #include per hoofdstuk. Typst compileert alles altijd mee.
// Wil je een hoofdstuk tijdelijk weglaten? Zet de #include-lijn in commentaar.

#include "Introductie.typ"

// ----------------------------- AFSLUITING ------------------------------------

#printformularium()

#printsymbols()
