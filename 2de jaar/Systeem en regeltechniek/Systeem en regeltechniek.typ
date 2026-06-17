
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
// Herstructurering in uitvoering (branch: herstructureer-syscon).
// Structuur volgt het semesteroverzicht (W2-W13). Oude inhoud staat in _OLD/.
// We vullen de inhoud les per les aan.

// ----------------------------- DEEL I: SYS -----------------------------------
//                     Systeemanalyse (W2-W5)
#include "1.Inleiding.typ"                       // W2
#include "2.Elektronische toepassingen.typ"      // W3
#include "3.Bode en Nyquist eerste orde.typ"     // W4
#include "4.Bode en Nyquist hogere orde.typ"     // W5

// ----------------------------- DEEL II: CON -----------------------------------
//                     Control / regeltechniek (W6-W12)
#include "5.P-control en statische analyse.typ"  // W6
#include "6.Feedback en P-control.typ"           // W7
//   (W8 = geen les)
#include "7.Closed-loop TF.typ"                  // W9
#include "8.PID-control.typ"                     // W10
#include "9.PID en Bode-analyse.typ"             // W11
#include "10.Tuning en root locus.typ"           // W12

// ----------------------------- AFSLUITING -------------------------------------
#include "11.Oefeningen en examen.typ"           // W13
#include "12.matlab en simulink.typ"              


// ============================================================================
//                              APPENDICES
// ============================================================================

