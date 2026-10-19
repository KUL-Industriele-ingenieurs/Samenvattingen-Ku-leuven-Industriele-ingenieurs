#import "../../school-template.typ": *

= Schroefverbinding <ch:schroefverbinding>

// Bron: Slides/6.Schroefverbinding.DIMA.pdf (Roloff/Matek H8)
// Notes: 6.Schroefverbinding krachtendriehoek

== Functie en werking <sec:schroef-functie>

#TODO[slides 4–8: principe, schroefdraad]

== Berekening van bevestigingsbouten <sec:bevestigingsbouten>

#TODO[slide 10: overzicht van de 6 stappen]

=== Stap 1: montage <sec:schroef-montage>

#TODO[slides 12–18: voorspankracht, soepelheden van bout en platen, krachtendriehoek]

#figure(
  image("assets/L6-montage-krachtendriehoek.png", width: 12cm),
  caption: [Montage en krachtendriehoek (slide 14)],
) <fig:L6-montage>

=== Stap 2: uitwendige belasting $F_B$ <sec:schroef-uitwendig>

#TODO[slides 20–29]

#frm(
  "Krachtverhouding en vereiste voorspankracht",
  $ Phi = F_(B S) / F_B = delta_T / (delta_S + delta_T) #h(2em) F_V = F_(K l) + (1 - Phi) F_B $,
  [met: $Phi$ --- krachtverhouding [-], $F_(B S)$ --- extra last op de schroef [N], $F_B$ --- uitwendige kracht [N], $delta_S, delta_T$ --- soepelheid schroef / platen [mm/N], $F_(K l)$ --- vereiste klemkracht [N], $F_V$ --- voorspankracht [N]],
)

=== Stap 3: zetgedrag <sec:schroef-zetgedrag>

#TODO[slides 31–32: $F_Z$]

=== Stap 4: aandraaien <sec:schroef-aandraaien>

#TODO[slides 34–40: aanhaalfactor $k_A$ uit tabel 8-11]

#frm(
  "Maximale montagevoorspankracht",
  $ F_(V M) = k_A F_(V min) = k_A [F_(K l) + F_B (1 - Phi) + F_Z] $,
  [met: $k_A$ --- aanhaalfactor [-], $F_Z$ --- voorspankrachtverlies door zetten [N]],
)

=== Stap 5: boutselectie <sec:schroef-selectie>

#TODO[slide 42]

=== Stap 6: controle <sec:schroef-controle>

#TODO[slides 44–45]

#figure(
  image("assets/L6-controle.png", width: 12cm),
  caption: [Overzicht van alle stappen in het krachtendiagram (slide 44)],
) <fig:L6-controle>

== Belastingsgevallen <sec:schroef-belastingsgevallen>

#TODO[slide 47]
