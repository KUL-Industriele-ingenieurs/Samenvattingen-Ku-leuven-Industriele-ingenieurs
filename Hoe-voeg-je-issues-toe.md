# Issues toevoegen via de VS Code Extensie

We maken veel gebruik van GitHub issues om taken of theorie-fouten en TODO's bij te houden. Je hoeft daarvoor niet telkens naar de website te gaan. Dit kan je gewoon rechtstreeks instellen vanuit je tekstverwerker, via de officiële VS Code GitHub Issues integratie.

## Wat krijg je hierdoor?

### 1. Issue pop-ups

- Als iemand `#1234` typt, kun je eroverheen zweven met je muis om direct de fout of taak te bekijken, net als wie dit moet oplossen.
- Dit werkt ook met accounts zoals `@ruben`.

### 2. Issues auto-aanvullen

- Zodra je ergens `#` intypt, krijg je een lijst van alle huidige openstaande taken of problemen voorgesteld.
- Handig in commits, markdown links, of zelfs gewoon in code.

### 3. Issues aanmaken direct vanuit de code

- **Via je TODO's**: Zie je ergens `// @issue:` of een `% TODO:`, dan kan je daar rechtstreeks op klikken om een taak in GitHub te pushen.
- **Selecteren**: Markeer stukken tekst, en maak er een probleem of taak van inclusief een klikbare link terug naar die precieze bestandslijn.
- **Plakken**: Foutmelding vanuit je terminal? Kopieer het en maak direct je issue aan.

### 4. Overzicht

- Al je taken of de issues die aan jou zijn toegewezen staan mooi overzichtelijk in de VS code zijbalk. De plugin kan er zelfs meteen een nieuwe branch van aftakken om er aan te beginnen werken!

## Hoe stel je dit in?

### 1. Download de Extensie

```
Zoek in VS Code naar: GitHub Pull Requests and Issues
(Extension ID: GitHub.vscode-pull-request-github)
```

### 2. Meld je aan

1. Open je snelle commando lijst (`Ctrl+Shift+P`)
2. Typ "GitHub: Sign in"
3. Laat GitHub weten wie je bent.

## Hoe gebruik je dit?

### Maak direct een issue vanuit een opmerking in de code

1. Ga naar je .tex of .typ document en typ:

```latex
% @issue: Meer formules over thermodynamica toevoegen
% Dit stukje moet nog berekeningen krijgen
```

```typ
// @issue: Meer formules over thermodynamica toevoegen
// Dit stukje moet nog berekeningen krijgen
```

2. Je krijgt dan een klein 'lampje' te zien boven de tekst, of druk even op `Ctrl+.`
3. Kies de optie "Create issue from comment".
4. VS Code stuurt dit onmiddellijk op naar de repo repo op GitHub zonder dat jij de site hoeft te bezoeken.

## Issue oplossen

Je kunt op de pull-request extensie issues bekijken en dan oplossen. Als je op oplossen klikt dan ga je in een aparte branch en kun je daar de issue oplossen. Als je klaar bent dan kun je de branch mergen met de main branch.
