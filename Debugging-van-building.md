# Fouten oplossen (Debugging)

Als je PDF niet wil bouwen, check dan even deze lijst met veelvoorkomende fouten.

## Typst problemen

Typst geeft meestal wel duidelijk aan wat er fout is.

**Font niet gevonden**
Krijg je een fout over fonts of ziet je document er ineens heel basis uit? Dan heb je de lettertypes waarschijnlijk nog niet geïnstalleerd. Typst zoekt naar `Fira Sans`, `Fira Mono` of `New Computer Modern`.
Ga naar de map `typst_templates/fonts/`, selecteer ze allemaal, klik rechts en kies "Installeren voor alle gebruikers".

**Typfouten in commando's**
Als Typst zegt `unknown variable: frm` of zoiets dergelijks, dan heb je gewoon een typfout gemaakt in een macro (bijvoorbeeld `#fram` in plaats van `#frm`). Check gewoon even de lijn die Typst aangeeft.

**Afbeelding laadt niet**
Typst crasht als het pad naar een afbeelding niet klopt of de afbeelding er niet staat. Zorg dat je het pad altijd begint vanaf de plek waar je `.typ` bestand staat.

**Vreemde layout of kapotte wiskunde**
Als je wiskunde formules er vreemd uitzien, onthoud dan dat Typst spaties nodig heeft. Je typt `$E = m c^2$` in plaats van `$E=mc^2$`. Je kan ook altijd in VS Code met je muis over een variabele hoveren (als je de Tinymist plugin hebt) om te zien wat er mis gaat.

## LaTeX problemen

LaTeX fouten zijn helaas wat minder duidelijk dan Typst.

**Missing Packages Error**
Als LaTeX Workshop weigert te bouwen omdat er packages missen: ik heb in de repo al ingesteld dat hij `latexmk` gebruikt. Dit haalt ontbrekende packages meestal vanzelf binnen.
Blijft hij toch crashen? Druk `Ctrl+Shift+P` en zoek naar `LaTeX Workshop: Clean up auxiliary files`. Vaak zit er gewoon een fout tijdelijk bestand klem. Bouw daarna opnieuw.

**"pdflatex command not found" fout**
Dit betekent dat je pc niet eens weet dat LaTeX geïnstalleerd is.
Heb je de stappen in `LATEX.md` gevolgd om MiKTeX en Perl te installeren? Zo ja, vergeet niet achteraf je pc the herstarten. Vaak is een simpele reboot genoeg.

**Blijft hij falen?**
Kijk in de VS Code zijbalk (die TEX knop) of hij wel het juiste 'root' bestand gebruikt om te bouwen. Soms probeert hij een los hoofdstuk in je `chapters/` map te compileren in plaats van je hoofd document.
Als het na dit alles echt niet lukt, gooi de error dan in de Discord, dan kijken we even mee.
