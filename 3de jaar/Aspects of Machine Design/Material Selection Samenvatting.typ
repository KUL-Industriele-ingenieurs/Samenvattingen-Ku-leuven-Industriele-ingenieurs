#import "../../school-template.typ": *

#show: project.with(
  title: "Material Selection Samenvatting",
  course: "Aspects of Machine Design",
  authors: ("Ruben Ryckaert",),
  academic_year: "2026-2027",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Eén #include per hoofdstuk. Typst compileert alles altijd mee.
// Wil je een hoofdstuk tijdelijk weglaten? Zet de #include-lijn in commentaar.

#include "1.Introductie.typ"
#include "2.Ontwerpproces.typ"
#include "3.Materialen-en-eigenschappen.typ"
#include "4.Material-property-charts.typ"
#include "5.Materiaalselectie-basis.typ"
#include "6.Case-studies.typ"
#include "7.Meerdere-randvoorwaarden.typ"
#include "8.Processelectie.typ"
#include "9.Materialen-en-milieu.typ"
#include "10.Materiaal-en-vorm.typ"

// ----------------------------- AFSLUITING ------------------------------------

#printformularium()

#printsymbols()
