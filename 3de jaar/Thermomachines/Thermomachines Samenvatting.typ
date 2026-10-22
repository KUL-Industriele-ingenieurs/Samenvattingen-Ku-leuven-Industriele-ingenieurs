#import "../../school-template.typ": *

#show: project.with(
  title: "Thermomachines Samenvatting",
  course: "Thermomachines",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

// Titelpagina per deel: de delen hangen inhoudelijk niet samen.
#let deel(nr, titel) = {
  pagebreak(weak: true)
  align(center + horizon, text(size: 26pt, weight: "bold")[Deel #nr \ #titel])
  pagebreak()
}

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Eén #include per hoofdstuk. Typst compileert alles altijd mee.
// Wil je een hoofdstuk tijdelijk weglaten? Zet de #include-lijn in commentaar.

#include "Introductie.typ"

// ----- Deel 1: stroming in leidingen (andere prof, eigen structuur) -----
#deel(1, "Stroming in leidingen")
#include "1.Stroming-in-leidingen.typ"

// ----- Deel 2: thermomechanische machines -----
#deel(2, "Thermomechanische machines")
// Pompen, compressoren en HVAC: toevoegen zodra de slides er zijn.
#include "2.Turbines.typ"
#include "3.Verbrandingsmotoren.typ"
#include "4.Thermodynamische-cycli.typ"

// ----------------------------- AFSLUITING ------------------------------------

#printformularium()

#printsymbols()
