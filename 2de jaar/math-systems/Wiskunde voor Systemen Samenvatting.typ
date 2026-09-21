#import "../../school-template.typ": *

#show: project.with(
  title: "Wiskunde voor Systemen Samenvatting",
  course: "Wiskunde voor Systemen",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Structuur volgt de vakinhoud-slide uit de eerste les (3 delen, 7 hoofdstukken).
// Skelet opgesteld; inhoud wordt les per les aangevuld.
//
// De oude LaTeX-versie (chapters/*.tex, OLDDOCUMENT.tex) blijft staan als
// referentiemateriaal maar wordt niet mee gecompileerd.
//
// Tip: om tijdelijk een hoofdstuk uit te sluiten, zet je zijn #include in
// commentaar.

// --------------------------- DEEL 0: VOORKENNIS ------------------------------
// Stond eerst als appendix achteraan, maar dit is geen bijlage: je hebt het
// nodig vanaf Deel 2, dus het hoort vooraan.
#include "0.Herhaling afgeleiden, integralen en differentiaalvergelijkingen.typ"

// ----------------------------- DEEL 1: INLEIDING -----------------------------
#include "1.Signalen en systemen.typ"

// ----------------------- DEEL 2: WISKUNDIGE TECHNIEKEN -----------------------
#include "2.Signalen - basissignalen en bewerkingen.typ"
#include "3.De Laplacetransformatie.typ"
#include "4.De Fouriertransformatie.typ"
#include "5.De Fourierreeks.typ"

// --------------------- DEEL 3: WISKUNDIGE SYSTEEMTHEORIE ---------------------
#include "6.LTC-systemen.typ"
#include "7.Eigenwaarden en eigenvectoren.typ"
