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
// Eén hoofdstuk per slidedeck (Unif/2_1/Data-acquisitie/Slides/N.*.pdf),
// het nummer van het bestand = het nummer van het deck. Aangevuld met de drie
// studentensamenvattingen en de examenvragen (Examen/DAQ_examenvragen-met-antwoorden.tex).
// Oude hoofdstukken die geen eigen deck hebben (piëzo, ultrasoon) staan in _OLD/
// en zijn verdeeld over de decks waar ze in de slides voorkomen.
//
// Werkwijze: zie SCHRIJFGIDS.md. Een hoofdstuk tijdelijk uitsluiten? Zet de
// #include in commentaar.

#printformularium()

// ----- DEEL I: BASIS -----
#include "0.Informatie.typ"
#include "1.Introductie.typ"
#include "2.Sensorkarakteristieken.typ"

// ----- DEEL II: VERPLAATSINGS- EN BEWEGINGSSENSOREN -----
#include "3.Potentiometers.typ"
#include "4.Rekstroken deel 1.typ"
#include "5.Rekstroken deel 2.typ"
#include "6.Inductieve sensoren.typ"
#include "7.Capacitieve sensoren.typ"
#include "8.Hall-sensoren.typ"
#include "9.Snelheidssensoren.typ"
#include "10.Versnellingssensoren.typ"
#include "11.MEMS.typ"
#include "Extra.Optische encoders.typ"   // niet in de slides 25-26

// ----- DEEL III: PROCESSENSOREN -----
#include "12.Druksensoren.typ"
#include "13.Kracht en torsie.typ"
#include "14.Debietsensoren.typ"
#include "15.Temperatuursensoren.typ"

// ----- DEEL IV: VAN SENSOR NAAR COMPUTER -----
#include "16.Signaalconditionering.typ"
#include "17.DAC.typ"
#include "18.ADC.typ"
#include "19.Bemonsteringstheorema.typ"
#include "20.Data-interfacing.typ"
