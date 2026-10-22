#import "../../school-template.typ": *

// BRON: ENKEL SLIDES: 7_temperature.pdf (49 p, het grootste deck)

= Temperatuursensoren <ch:temperatuur>

== Mechanische thermometers <sec:mech-thermometer>

// TODO: Kwik, bimetaal, vloeistof- en dampdrukthermometer.
// TODO: Bang-bang gedrag van een bimetaalthermostaat en de oplossing daarvoor (hysteresis/versnellingsweerstand).

== Weerstandsthermometers (RTD) <sec:rtd>

// TODO: Pt100 en Ni100: FORMULE R(T) = R_0 (1 + A T + B T^2 + ...).
// TODO: Twee-, drie- en vierdraadsmeting: waarom de kabelweerstand een fout geeft en hoe elke schakeling die wegwerkt.
// TODO: Zelfopwarming door de meetstroom.

== Thermistoren (NTC/PTC) <sec:thermistor>

// TODO: FORMULE: R = R_0 exp(beta (1/T - 1/T_0)) -- sterk niet-lineair maar zeer gevoelig.
// TODO: Wanneer je een NTC verkiest boven een Pt100.

== Stralingsthermometrie <sec:stralingsmeting>

// TODO: Wet van Stefan-Boltzmann; emissiviteit als grootste foutbron; pyrometer en IR-camera.

== Thermokoppels <sec:thermokoppel>

// TODO: Seebeck-effect: FORMULE E = alpha (T_meet - T_ref).
// TODO: Types (K, J, T, ...) en hun gevoeligheid in uV/K.
// TODO: KOUDE LASPUNTCOMPENSATIE: waarom je altijd een referentietemperatuur nodig hebt en hoe die in de praktijk gemeten wordt. Dit komt gegarandeerd terug.

