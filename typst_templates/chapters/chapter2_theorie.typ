// chapter2_theorie.typ
// Tweede hoofdstuk - Theorie
// Dit bestand wordt geladen via #include "chapters/chapter2_theorie.typ"

#import "../../school-template.typ": *

= Theorie <ch:theorie>

In dit hoofdstuk behandelen we de theoretische achtergrond.

== Belangrijke Wetten

#symbool($F$, "Kracht", "N")
#symbool($m$, "Massa", "kg")
#symbool($a$, "Versnelling", "m/s²")

#theorie(title: "Klassieke Mechanica")[
  De klassieke mechanica beschrijft de beweging van objecten onder invloed van krachten.
  De basis wordt gevormd door de wetten van Newton.
]

#frm("Tweede Wet van Newton", $F = m dot a$, [
  $F$ = kracht (N), $m$ = massa (kg), $a$ = versnelling (m/s²)
])

== Energie

#symbool($E_k$, "Kinetische energie", "J")
#symbool($v$, "Snelheid", "m/s")

#frm("Kinetische Energie", $E_k = 1/2 m v^2$, [
  $E_k$ = kinetische energie (J), $m$ = massa (kg), $v$ = snelheid (m/s)
])

#waarschuwing[
  Vergeet niet dat energie een scalaire grootheid is, geen vector!
]
