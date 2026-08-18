#import "../../school-template.typ": *

#show: project.with(
  title: "Data-acquisitie Samenvatting",
  course: "Data-acquisitie",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
)

// ============================================================================
//                           CHAPTER INCLUDES
// ============================================================================
// Skelet opgebouwd uit "Samenvatting DAQ.pdf" (58 p) samengevoegd met de
// 19 slidedecks. Hoofdstukken 16 t.e.m. 22 staan NIET in de samenvatting en
// komen enkel uit de slides -- die zijn dus even goed examenstof.
//
// Werkwijze: zie SCHRIJFGIDS.md. Eerst dit skelet, dan sectie per sectie
// uitwerken. Een hoofdstuk tijdelijk uitsluiten? Zet de #include in commentaar.

#printformularium()

// ----- DEEL I: BASIS -----
#include "1.Introductie.typ"
#include "2.Sensorkarakteristieken.typ"

// ----- DEEL II: VERPLAATSINGS- EN BEWEGINGSSENSOREN -----
#include "3.Potentiometer.typ"
#include "4.Rekstroken.typ"
#include "5.Inductieve sensoren.typ"
#include "6.Capacitieve sensoren.typ"
#include "7.Piezo-elektrische sensoren.typ"
#include "8.Optische sensoren.typ"
#include "9.Hall-sensoren.typ"
#include "10.Ultrasone sensoren.typ"
#include "11.Snelheidssensoren.typ"
#include "12.Versnellingssensoren.typ"
#include "13.MEMS.typ"

// ----- DEEL III: PROCESSENSOREN -----
#include "14.Kracht en torsie.typ"
#include "15.Druksensoren.typ"
#include "16.Debietsensoren.typ"        // enkel slides
#include "17.Temperatuursensoren.typ"   // enkel slides

// ----- DEEL IV: VAN SENSOR NAAR COMPUTER (enkel slides) -----
#include "18.Signaalconditionering.typ"
#include "19.Sampling en aliasing.typ"
#include "20.ADC.typ"
#include "21.DAC.typ"
#include "22.Data-interfacing.typ"
