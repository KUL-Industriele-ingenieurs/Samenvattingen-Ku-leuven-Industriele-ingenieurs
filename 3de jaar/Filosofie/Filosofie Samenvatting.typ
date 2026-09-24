#import "../../school-template.typ": *

#show: project.with(
  title: "Filosofie Samenvatting",
  course: "Ingenieur en duurzaamheid: Filosofie",
  authors: ("Ruben Ryckaert",),
  academic_year: "2026-2027",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Eén #include per hoofdstuk. Typst compileert alles altijd mee.
// Wil je een hoofdstuk tijdelijk weglaten? Zet de #include-lijn in commentaar.

#include "Introductie.typ"
#include "Hoorcolleges.typ"

// ----------------------------- AFSLUITING ------------------------------------

#printsymbols()
