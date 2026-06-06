
#import "../../school-template.typ": *

#show: project.with(
  title: "Systeem en Regeltechniek Samenvatting",
  course: "Systeem en Regeltechniek",
  authors: ("Ruben Ryckaert", "Andere Auteur"),
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

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================

#include "1.Inleiding.typ"
#include "2.electronic_applications.typ"
#include "3.Bode & Nyquist Plots.typ"
#include "4.Bode Plots.typ"
#include "5.Bode, feedback, and P control.typ"
#include "6.P Control.typ"
#include "7.Closed Loop TF.typ"
#include "8_ID_bode.typ"
// ============================================================================
//                              APPENDICES
// ============================================================================

