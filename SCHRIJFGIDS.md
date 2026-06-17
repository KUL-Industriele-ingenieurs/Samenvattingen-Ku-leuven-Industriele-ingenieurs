# Schrijfgids — van skelet naar uitgewerkte samenvatting

Deze gids beschrijft *hoe* we een samenvatting opbouwen, niet hoe je Typst/LaTeX
installeert (zie [TYPST.md](TYPST.md) en [LATEX.md](LATEX.md)) of hoe git werkt
(zie [README.md](README.md)).

De kern: **bouw eerst de volledige structuur (het skelet), werk daarna pas de
inhoud uit — les per les.** Zo blijft een samenvatting georganiseerd en kun je
met meerdere mensen aan verschillende hoofdstukken werken zonder chaos.

---

## De methode in het kort

```
slides  ─►  Stap 1: SKELET      ─►  Stap 2: UITWERKEN
            (headers + labels)       (inhoud per sectie, les per les)
```

1. **Skelet** = alle hoofdstukken en (sub)secties als lege headers met labels,
   afgeleid uit de structuur van de slides/cursus.
2. **Uitwerken** = die secties één voor één vullen met tekst, formules, figuren
   en kaders.

Een skelet is in een uur klaar en geeft meteen overzicht; het uitwerken kan dan
in stukjes, in willekeurige volgorde, door wie maar wil.

---

## Stap 0 — Branch + oude inhoud bewaren

- Werk altijd op een **branch** (bv. `herstructureer-<vak>`), nooit rechtstreeks
  op `MAIN`.
- Ga je een bestaande samenvatting grondig herwerken? **Gooi de oude inhoud niet
  weg** — verplaats ze naar een map `_OLD/` met `git mv`. Ze valt buiten de
  compile (wordt niet ge-`#include`d) maar blijft als referentie beschikbaar om
  uit te hergebruiken.

```bash
mkdir _OLD
git mv "3.Oud hoofdstuk.typ" "_OLD/3.Oud hoofdstuk.typ"
```

---

## Stap 1 — Het skelet bouwen

### Eén hoofdstuk per les

Volg de structuur van de cursus (bv. het semesteroverzicht uit de eerste les).
Maak per lesweek één `.typ`-bestand en groepeer ze logisch in de master-file.

### Headers met labels

Gebruik de Typst-headerniveaus en geef **elke** chapter en sectie een label, zodat
je er later naar kunt verwijzen (`@ch:...`, `@sec:...`):

```typst
#import "../../school-template.typ": *

= Inleiding, systemen en transferfuncties <ch:inleiding>

== Transferfunctie, polen en nullen <sec:transferfunctie>

=== DC-gain, polen en nullen
```

| Niveau | Markup | Betekenis | Label-conventie |
|--------|--------|-----------|-----------------|
| 1 | `=`   | Hoofdstuk | `<ch:korte-naam>` |
| 2 | `==`  | Sectie    | `<sec:korte-naam>` |
| 3 | `===` | Subsectie | (label optioneel) |

> Tip: leid de `==`/`===` structuur af uit de **agenda-slide** ("Today's lecture
> is about…") van elke les. Die geeft meestal de exacte onderverdeling.

### Master-file

Voeg de hoofdstukken in de juiste volgorde toe met `#include` en groepeer ze met
commentaar zodat de delen van de cursus zichtbaar blijven:

```typst
// ----- DEEL I: SYS -----
#include "1.Inleiding.typ"            // W2
#include "2.Elektronische toepassingen.typ"  // W3
// ----- DEEL II: CON -----
#include "5.P-control en statische analyse.typ"  // W6
```

Tijdelijk een hoofdstuk uitsluiten? Zet de `#include`-regel in commentaar.

---

## Stap 2 — Uitwerken (les per les)

Werk daarna de secties van het skelet uit. Hergebruik gerust goed materiaal uit
`_OLD/` of vorige versies. Houd je aan de conventies hieronder.

### Kaders

De template levert kant-en-klare kaders met flat iconen (via Heroicons, geen font
te installeren):

| Macro | Gebruik |
|-------|---------|
| `#theorie[...]`     | kerntheorie |
| `#concept[...]`     | intuïtie / concept |
| `#voorbeeld[...]`   | uitgewerkt voorbeeld |
| `#oefening(title: "...")[...]` | oefening met oplossing |
| `#waarschuwing[...]`| valkuil / let op |
| `#form(title: "...")[...]` of `#frm(...)` | formulekader (komt in het formularium) |

### Formules + symbolenlijst

Voeg na elke niet-triviale formule een korte symbolenlijst toe. **Sleutelwoord
volgt de taal van de notitie:** `met:` in Nederlandse tekst, `where:` in Engelse
tekst. Zet eenheden tussen vierkante haken (`[-]` = dimensieloos).

```typst
$ tau = m / beta $

met:
- $tau$ --- tijdconstante [s]
- $m$ --- massa [kg]
- $beta$ --- wrijvingscoëfficiënt [N·s/m]
```

### Uitgewerkte voorbeelden

Volg het patroon **denkstappen → oplossing → kerninzicht**:

```typst
#oefening(title: "Eerste orde — wagentje")[
  *Stap 1 — ...:* ...
  *Stap 2 — ...:* ...
  *Key insight:* ...
]
```

### Figuren en plots

- Afbeeldingen in de map `assets/`, embed met `#figure(image("assets/...png"), caption: [...]) <fig:naam>`.
- Zelf een grafiek tekenen? Gebruik CeTZ-plots. Maak ze **leesbaar**:
  voldoende groot, `grid: true`, een `legend`, en label belangrijke
  referentielijnen (bv. eindwaarde, 63 %/95 %).

---

## Compileren

De template gebruikt gebundelde fonts (Charter, Fira) uit `fonts/`. Compileer
daarom vanuit de repo-root met de font-path, of laat de VS Code Tinymist-preview
dat doen (die pikt `fonts/` automatisch op).

```bash
typst compile --font-path fonts "2de jaar/<Vak>/<Vak>.typ"
```

---

## Checklist per hoofdstuk

- [ ] Skelet: `= <ch:...>`, `==  <sec:...>`, `===` headers staan en kloppen met de slides
- [ ] Hoofdstuk staat (geactiveerd) in de master-file
- [ ] Elke formule heeft een `met:`/`where:`-lijst met eenheden
- [ ] Voorbeelden volgen denkstappen → oplossing → kerninzicht
- [ ] Figuren in `assets/`, met caption en `<fig:...>` label
- [ ] CeTZ-plots zijn duidelijk (grid, legende, labels)
- [ ] Document compileert zonder fouten
