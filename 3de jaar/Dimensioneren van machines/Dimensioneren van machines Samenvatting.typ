#import "../../school-template.typ": *

#show: project.with(
  title: "Dimensioneren van Machines Samenvatting",
  course: "Dimensioneren van Machines",
  authors: ("Ruben Ryckaert",),
  academic_year: "2026-2027",
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
