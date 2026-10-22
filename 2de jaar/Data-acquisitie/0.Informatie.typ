#import "../../school-template.typ": *

// BRON: Slides/1.DAQ_introductie.pdf (slides 6-12) | Planning.pdf | Voorbeeldexamen 25-26.pdf
//       Examen/tip.txt | Examen/Exam(en) feedback januari 2025.md | Studforum (pub/bac2/ea/sensoren)

= Informatie over het vak <ch:informatie>

== Organisatie <sec:organisatie>

Het vak bestaat alleen uit hoorcolleges, live op campus en als opname op Toledo. Prof. Peter Slaets geeft het sinds 2023-2024; hij bouwt verder op het materiaal van zijn voorganger, prof. Luc Janssens.

- *Slides en animaties* zijn de leidraad om te studeren.
- *Het tekstboek* (te bestellen via Toledo, 15 euro) gebruik je als iets niet duidelijk is, voor afleidingen en voor extra informatie. Het gaat soms veel verder dan de slides.

== Inhoud <sec:inhoud>

Elk hoofdstuk in deze samenvatting hoort bij één slidedeck. De vier delen volgen de blokken van een meetsysteem (@sec:meetsysteem):

#table(
  columns: (1fr, auto),
  align: (left, left),
  table.header([*Onderwerp*], [*Hoofdstukken*]),
  [Introductie en sensorkarakteristieken], [@ch:introductie, @ch:karakteristieken],
  [Verplaatsing: potentiometers, rekstroken, inductief, capacitief, Hall], [@ch:potentiometer -- @ch:hall],
  [Snelheid, versnelling en MEMS], [@ch:snelheid -- @ch:mems],
  [Druk, kracht, debiet en temperatuur], [@ch:druk -- @ch:temperatuur],
  [Signaalconditionering, DAC, ADC en bemonstering], [@ch:signaalconditionering -- @ch:sampling],
  [Data-interfacing], [@ch:interfacing],
)

== Examen <sec:examen>

Het examen duurt *1,5 uur*, is schriftelijk en gesloten boek, zonder rekenmachine. Het bestaat uit meerkeuzevragen en één tot drie invulvragen (oefeningen) op 3 punten. In 25-26 waren dat 23 meerkeuzevragen en drie invulvragen.

=== Puntentelling meerkeuze

Er is altijd precies één juist antwoord. Je mag meer dan één vakje kleuren als je twijfelt, maar dat kost punten:

#table(
  columns: (1fr, auto),
  align: (left, center),
  table.header([*Wat je kleurt*], [*Score*]),
  [1 vakje, het juiste], [$1$],
  [2 vakjes, waaronder het juiste], [$1\/3$],
  [3 vakjes, waaronder het juiste], [$1\/9$],
  [1, 2 of 3 vakjes zonder het juiste], [$-1\/3$],
  [niets, alles, of ongeldig (niet donker genoeg)], [$0$],
)

De oefeningen krijgen *geen gokcorrectie*. Je vult er alleen het eindresultaat in een vakje in.

#examenbox[*De meerkeuzevragen zijn makkelijk* als je de tekst goed leest: de afleiders verschillen vaak maar in één woord. *Leer de open vragen (oefeningen) bijna vanbuiten.* Ze tellen zwaar en komen elk jaar in dezelfde vorm terug; wie daar faalt, heeft een grote kans om niet te slagen.]

#examenbox[De prof: "Er zal niets gevraagd worden dat niet in de les behandeld geweest is." Begin te studeren vanuit de slides en ga daarna dieper via het boek of de opnames.]

=== Wat ging er in januari 2025 goed en fout?

Uit de feedback van de prof na het examen van januari 2025:
- vaak volledig juist: *brugschakelingen*, *druksensoren* en *piëzo-elektrische sensoren*;
- vaak fout: *rekstroken*, vooral de oefening (@ch:rekstroken-2);
- vaak blanco: *temperatuursensoren* (@ch:temperatuur).

De oefening was de laatste jaren telkens een *load cell met rekstroken in een Wheatstonebrug*. Die oefening moet je dus vlot kunnen.

#examenbox[Studenten op Studforum: veel vragen komen terug van vorige jaren, maar niet allemaal. In deze samenvatting staat bij elk onderwerp de bijhorende examenvraag met het antwoord.]
