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
#printformularium()
#include "1.Inleiding-en-gecombineerde-belasting.typ"
#include "2.Cirkel-van-Mohr.typ"
// ----- Assen -----
#include "3.Assen-deel-1.typ"
#include "4.Assen-deel-2-spanningshypothesen.typ"
#include "5.Assen-deel-3-toelaatbare-spanningen.typ"
// ----- Verbindingen -----
#include "6.Schroefverbinding.typ"
#include "7.As-naafverbindingen-deel-1.typ"

// ----------------------------- AFSLUITING ------------------------------------
