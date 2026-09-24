#import "../../school-template.typ": *

#show: project.with(
  title: "Global Challenges Samenvatting",
  course: "Ingenieur en duurzaamheid: Global Challenges",
  authors: ("Ruben Ryckaert",),
  academic_year: "2026-2027",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Eén #include per hoofdstuk. Typst compileert alles altijd mee.
// Wil je een hoofdstuk tijdelijk weglaten? Zet de #include-lijn in commentaar.

#include "Introductie.typ"
#include "0.Welcome.typ"
#include "1.Climate.typ"
#include "2.Biodiversity.typ"
#include "3.Demography.typ"
#include "4.Energy.typ"
#include "5.Raw-materials-and-circular-economy.typ"
#include "6.Food-security.typ"
#include "7.Migration.typ"
#include "8.Buildings.typ"
#include "9.Mobility.typ"
#include "10.Economics-for-sustainability.typ"
#include "11.Social-and-economic-inequality.typ"
#include "12.Human-behavior.typ"
#include "13.Global-governance.typ"
#include "14.Cases-and-exam.typ"

// ----------------------------- AFSLUITING ------------------------------------

#printsymbols()
