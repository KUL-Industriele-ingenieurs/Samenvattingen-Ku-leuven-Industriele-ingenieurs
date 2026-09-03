// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Informatie over het vak <ch:inleiding>

In dit vak leer je de termen en concepten die bij het ontwerpen van een industriële sturing horen.

Je moet de *Nederlandse* en *Engelse* termen kennen.

== Doel <sec:doel>

- Elektrische diagrammen kunnen lezen
- Diagrammen kunnen opstellen
- *SEE electrical* diagrammen kunnen opstellen
- Ingenieursoplossingen kennen: PLC, remote I/O, drive, noodstop, interface relais, ...
- Oplossingen delen

Dit leer je deels in de labo's.

== Planning <sec:planning>

1. Online lecture PLC +manualswitches, relay, start-stop circuit, signal-time diagram, timers, 3~M

2. Courseintro, basic requirements; Control systems; I4.0; RDS EN 81346; PLC programming
(For now: all sensors and DQ are sourcing, DI sinking).

1. Reed switches and (electro-)pneumatics, cascade method, vacuum, Pneudrawintro.

2. Main circuits: Fuses, MCB, RCD,motor circuits(contactor, LoTo, SSR, VFD, Screened cable, encoder)Motor protection: OLR, MPCB, PTC, Pt100/1000. SMPS.

3. Ex Diagram: Emergency-stop, 24 VSV, Control cabinet, Terminals, SEEtutorial!

4. Sourcing and sinking, PNP & NPN, discrete sensors, opto-coupler, interface, latching relay, universal inputs, Faster I/O, analog signals 4-20mA loop & cable. (or analog signals to week 8)

5. Dual-channel E-stop, EDM, 0 VSV, STO, pneumatics safety?, SEE Assignment.
6. Pneumatics: Air treatment, energy and safety (or analog signal if not finished earlier)

7. 3D method

8. SEE Assignment solution

9. Hydraulics (or pneumatics if not finished earlier)

10. Short lecture: Exam overview, Q&A.

Je krijgt op *Week 7* een taak en op *Week 10* moet je al een oplossing delen.

== Examen

De prof publiceert de #belangrijk[volledige lijst open vragen] vooraf, in `DICS updated learning outcomes`. Dat document bepaalt de leerstof: staat een onderwerp er niet in, dan wordt het niet gevraagd. De 25 vragen staan uitgewerkt in @ch:theorievragen.

De vorm, zoals gemeld op de Studforum-wiki voor de zittingen 2024, juni 2025 en juni 2026:

#table(
  columns: (auto, auto, 1fr),
  align: (left, center, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Onderdeel*], [*Aantal*], [*Waarover*]),
  table.hline(stroke: 0.5pt),
  [Meerkeuze], [20], [Soms één juist antwoord, soms *alle* juiste aanduiden. De scoreformule staat op het examen zelf. Drie ervan gaan over de 3D-methode.],
  [Open vraag 1], [1 (6 pt)], [Uit de gepubliceerde lijst, of een schema met fouten die je moet vinden en verbeteren.],
  [Open vraag 2], [1 (4 pt)], [Cilinderkracht berekenen.],
  table.hline(stroke: 1pt),
)

Daarnaast tellen de labo's mee: permanente evaluatie, de PLC-test in TIA Portal en de SEE-test, elk goed voor $-2$ tot $+2$ op je examencijfer.

#examenbox[
  Bij de meerkeuze over een ventielsymbool of een FRL-unit moet je uit één tekening #strong[alle] eigenschappen halen; er waren acht tot tien opties. Denk aan: mono- of bistabiel, enkel- of dubbelwerkend, aantal poorten en standen (2/2, 3/2, 4/2, 5/2, 5/3), elektro-pneumatisch of pneumatisch gestuurd, handbediening, mechanische of pneumatische veer, intern of extern gepiloteerd of direct werkend.
]

Verder krijg je makkelijke (weggevers) vragen, medium en moeilijke vragen. Bekijk voorbeeldexamens op studforum: #link("https://cloud.studforum.net/apps/files/?dir=/GTS-Fase2/Semester%202/Courses%20After%202021/Afstudeerrichting%20Electromechanics/Design%20of%20Industrial%20Control%20Systems&fileid=797243", "Cloud Studforum").

en de Studforum wiki: #link("https://wiki.studforum.net/pub/bac2/em/design-of-industrial-control-systems", "Design of Industrial Control Systems Studforum Wiki").







