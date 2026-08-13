#import "../../school-template.typ": *

// BRON: Samenvatting p.13-17 | 2_strain_gages_part1.pdf, 2_strain_gages_part2.pdf

= Rekstroken (strain gages) <ch:rekstroken>

== Gage factor <sec:gage-factor>

// TODO: Vertrek van R = rho L / A: rekken maakt L groter en A kleiner, beide verhogen R.
// TODO: FORMULE: GF = (dR/R)/(dL/L) = (dR/R)/eps. Typisch GF ~ 2 voor metaalfolie, ~100 voor halfgeleider.
// TODO: Rek eps in microstrain; ordegrootte dR/R bij 1000 ue.

== Types rekstroken <sec:types-rekstroken>

// TODO: Gebonden (foliestrook met meanderpatroon), ongebonden, halfgeleider, dunne film.
// TODO: Waarom het meanderpatroon: lange draad op een klein oppervlak in de meetrichting.
// TODO: Dwarsgevoeligheid en temperatuurgevoeligheid.

== De Wheatstonebrug <sec:wheatstonebrug>

// TODO: De brug = twee spanningsdelers; de uitgang is hun verschil, dus in rust exact 0.
// TODO: Waarom dat nodig is: dR/R is ~1e-3, rechtstreeks meten betekent een kleine verandering op een grote offset.
// TODO: FORMULES: kwart U_0 = (dR/4R) E_exc (benaderend), half (dR/2R) E_exc, vol (dR/R) E_exc (beide exact).
// TODO: Regel: overstaande armen hetzelfde teken, aangrenzende armen tegengesteld.
// TODO: Temperatuurcompensatie: de factor (1+alpha dT) valt weg in teller en noemer.
// TODO: FIGUUR: de uitgewerkte brugfiguren staan in Unif/2_1/Data-acquisitie/Uitwerkingen/wheatstonebrug-rekstrookjes.pdf.

