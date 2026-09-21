# Typst

Dit is alles wat je nodig hebt om met Typst te beginnen. Typst is eigenlijk gewoon een sneller alternatief voor LaTeX dat ik zelf vaak gebruik.

## <img src="https://api.iconify.design/material-symbols/help-outline.svg?color=gray" height="20"> Waarom Typst in plaats van LaTeX?

- Je hebt direct een live preview in VS Code tijdens het typen. Je hoeft niet meer te wachten op het compileren.
- Je hebt die enorme programma's zoals MiKTeX niet meer nodig op je pc.
- De code is veel leesbaarder, zonder backslashes overal tussendoor.
- Ik heb exact dezelfde theorie kaders en layout gemaakt voor Typst als in de LaTeX template. Het eindresultaat van de PDF ziet er dus gewoon hetzelfde uit.

## <img src="https://api.iconify.design/material-symbols/install-desktop.svg?color=gray" height="20"> Installatie

Open PowerShell of je Terminal en voer dit in:

<img src="https://api.iconify.design/simple-icons/windows.svg?color=gray" height="14"> **Windows**:

```powershell
winget install --id Typst.Typst
```

<img src="https://api.iconify.design/simple-icons/apple.svg?color=gray" height="14"> **macOS**:

```bash
brew install typst
```

<img src="https://api.iconify.design/simple-icons/linux.svg?color=gray" height="14"> **Linux**:

Hangt af van je distro, ik neem Ubuntu als voorbeeld. Voor andere distro's kan je de [Typst website](https://typst.app/download) checken voor de laatste installatie-instructies.

```bash
sudo apt install typst
```


## <img src="https://api.iconify.design/material-symbols/edit-document-outline.svg?color=gray" height="20"> Een samenvatting maken

Ik heb twee templates klaargezet die je gewoon kunt dupliceren om meteen in te vullen:

1. **Voor een korter document:** Kopieer `typst_templates/Typst_template-kort-document.typ`. Ideaal voor een simpele theorie samenvatting die maar 1 bestandje lang is.
2. **Voor een groot doc:** Gebruik `typst_templates/Typst_template-lang-document.typ`. Handig als je theorie of examens per hoofdstuk over meerdere mapjes wil opsplitsen via een `#include` setup.

## <img src="https://api.iconify.design/material-symbols/dashboard-outline.svg?color=gray" height="20"> Box-omgevingen gebruiken

Ik heb de theorie kaders er in Typst net zo in gezet als in de LaTeX versie:

Bekijk [macro_usage_guide_typst.typ](typst_templates/macro_usage_guide_typst.typ) voor alle dingen die je kunt gebruiken.

## <img src="https://api.iconify.design/material-symbols/keyboard-outline.svg?color=gray" height="20"> Snippets (Sneltoetsen)

Om het schrijven nog sneller te maken, zijn er VS Code snippets toegevoegd. Typ het trefwoord en druk op `Tab` om het volledige blok in te voegen:

| Trefwoord   | Resultaat                       | Gebruik                                   |
| ----------- | ------------------------------- | ----------------------------------------- |
| `todo`      | `#TODO[...]`                    | Voor taken die nog moeten gebeuren        |
| `oefening`  | `#oefening(title: "...")[...]`  | Een oefeningskader met titel              |
| `oe`        | `#oefening(title: "...")[...]`  | Korte versie van oefening                 |
| `sol`       | `#oplossing[...]`               | Een kader voor de uitwerking/oplossing    |
| `frm`       | `#frm[Titel][Formule][Uitleg]`  | Een formule die in het overzicht komt     |
| `fig`       | `#figure(...)`                  | Een afbeelding met caption en label       |
| `wrapfig`   | `#wrap-figure(...)`             | Een afbeelding waar tekst omheen vloeit   |
| `theorie`   | `#theorie(title: "...")[...]`   | Een blauw theoriekader                    |
| `voorbeeld` | `#voorbeeld(title: "...")[...]` | Een groen voorbeeldkader                  |

## <img src="https://api.iconify.design/material-symbols/compare-arrows.svg?color=gray" height="20"> Wat is er anders qua theorie syntax tegenover LaTeX?

Hier nog een kort lijstje met dingen die echt veel sneller theorie werken in Typst:

- Grote Titels krijgen een is-gelijk teken `=` in plaats van lelijke `\section{}` codes.
- Je kan iets vet drukken door gewoon sterretjes te gebruiken `*tekst*` in plaats theorie van `\textbf`.
- Item lijsten of opsommingen zijn gewoon min-tekens `- stelling een`. Geen theorie blok structuur met `beginitemize` theorie...
- De Wiskunde blok is theorie dollartekens theorie om niet the breken met the tekst: `$x^2 = c$` theorie theorie ...

_Heel erg gelijkaardig aan Markdown_
