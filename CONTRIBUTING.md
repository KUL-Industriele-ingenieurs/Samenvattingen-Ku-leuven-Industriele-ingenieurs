# Bijdragen aan School LaTeX Documents 🎓

Bedankt voor je interesse om bij te dragen aan onze gezamenlijke samenvatting repository! Deze gids helpt je om effectief bij te dragen.

## 📋 Inhoudsopgave

- [Code of Conduct](#code-of-conduct)
- [Hoe kan ik bijdragen?](#hoe-kan-ik-bijdragen)
- [Je eerste bijdrage](#je-eerste-bijdrage)
- [Pull Request Process](#pull-request-process)
- [Stijlgids](#stijlgids)
- [Git Workflow](#git-workflow)

## Code of Conduct

Dit project hanteert een Code of Conduct. Door deel te nemen aan dit project ga je akkoord met de voorwaarden. Zie [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Hoe kan ik bijdragen?

Er zijn verschillende manieren om bij te dragen:

### 📝 Inhoud toevoegen of verbeteren

- **Oefeningen toevoegen**: Voeg nieuwe oefeningen toe met stap-voor-stap uitwerkingen
- **Samenvattingen schrijven**: Vat hoofdstukken of onderwerpen samen
- **Formules registreren**: Voeg belangrijke formules toe aan het formularium
- **Diagrammen en afbeeldingen**: Voeg visuele hulpmiddelen toe
- **Voorbeelden**: Voeg verduidelijkende voorbeelden toe

### 🐛 Fouten rapporteren en oplossen

- Typo's corrigeren
- Foutieve formules verbeteren
- Onduidelijke uitleg verduidelijken
- Gebroken links of verwijzingen repareren

### 💡 Nieuwe functies voorstellen

- Nieuwe macro's voorstellen
- Verbeteringen aan de documentstructuur
- Tooling verbeteringen

### ❌ Wat te vermijden

- **Geen andere talen**: Houd alle content in het Nederlands
- **Geen breaking changes**: Geen grote structuurwijzigingen zonder overleg
- **Geen nieuwe packages zonder overleg**: Dit kan versieconflicten veroorzaken
- **Geen code van lessen/examens kopiëren**: Alleen eigen werk of vrij beschikbare bronnen

## Je eerste bijdrage

Nieuw bij open source? Geen probleem! Hier is hoe je begint:

### 1. Setup je ontwikkelomgeving

Volg de instructies in de [README.md](README.md) om je systeem op te zetten:
- Installeer LaTeX (TeX Live of MikTeX)
- Installeer VS Code met LaTeX Workshop extensie
- Clone de repository

### 2. Kies een issue of maak een nieuwe aan

- Bekijk de [open issues](https://github.com/Eggmansmile/School-latex-documents/issues)
- Issues met het label `good first issue` zijn ideaal voor beginners
- Issues met het label `help wanted` zijn prioriteit
- Geen geschikt issue? Maak er een aan om je voorstel te bespreken

### 3. Maak een feature branch

```bash
git checkout main
git pull origin main
git checkout -b add/thermodynamica-oefening-3-5
```

**Branch naming conventions:**
- `add/beschrijving` - Voor nieuwe content
- `fix/beschrijving` - Voor bugfixes
- `improve/beschrijving` - Voor verbeteringen
- `docs/beschrijving` - Voor documentatie

### 4. Maak je wijzigingen

- Test je LaTeX lokaal (build en bekijk de PDF)
- Volg de [stijlgids](#stijlgids) hieronder
- Commit regelmatig met duidelijke messages

### 5. Test je wijzigingen

```bash
# Build het document
latexmk -pdf "je-bestand.tex"

# Of gebruik VS Code task: Ctrl+Shift+P → "Build LaTeX"
```

Controleer of:
- ✅ Het document zonder fouten compileert
- ✅ De PDF er correct uitziet
- ✅ Alle verwijzingen en labels werken
- ✅ Afbeeldingen correct worden weergegeven

### 6. Dien een Pull Request in

Zie [Pull Request Process](#pull-request-process) hieronder.

## Pull Request Process

### Voordat je een PR indient

**Checklist:**
- [ ] Code compileert zonder fouten
- [ ] PDF is gecontroleerd op layout problemen
- [ ] Commit messages zijn duidelijk (zie [Git Workflow](#git-workflow))
- [ ] Branch is up-to-date met main: `git pull origin main`
- [ ] Geen onnodige bestanden toegevoegd (check `.gitignore`)
- [ ] PR template is volledig ingevuld

### Pull Request indienen

1. **Push je branch:**
   ```bash
   git push origin add/je-feature-branch
   ```

2. **Open een PR op GitHub:**
   - Ga naar de repository op GitHub
   - Klik op "Pull requests" → "New pull request"
   - Selecteer je branch
   - Vul het PR template in (zie hieronder)

3. **PR Titel:**
   - Gebruik duidelijke, beschrijvende titels
   - Begin met type: `Add:`, `Fix:`, `Improve:`, `Docs:`
   - Voorbeeld: `Add: Thermodynamica oefeningen 3.5-3.8 met uitwerkingen`

4. **PR Beschrijving:**
   - Wat heb je toegevoegd/gewijzigd?
   - Waarom is deze wijziging nuttig?
   - Link naar gerelateerde issues
   - Voeg screenshots toe van de PDF (optioneel maar gewaardeerd)

### Review proces

1. **Automatische checks**: CI/CD workflow bouwt automatisch alle documenten
2. **Code review**: Een maintainer bekijkt je wijzigingen
3. **Feedback**: Je krijgt mogelijk feedback om aan te passen
4. **Approval**: Na goedkeuring wordt je PR gemerged
5. **Merge**: Je bijdrage wordt onderdeel van main! 🎉

### Na de merge

- Je branch wordt verwijderd (automatisch of handmatig)
- Update je lokale repository:
  ```bash
  git checkout main
  git pull origin main
  git branch -d add/je-feature-branch  # Verwijder lokale branch
  ```

## Stijlgids

### LaTeX Stijl

#### Macro's gebruiken

Gebruik altijd de gedeelde macro's voor consistentie:

```latex
% Formule registreren (toont op pagina + in formularium)
\frm{Label}{E = mc^2}{Einstein's energie-massa equivalentie}

% Symbool introduceren (voor Warmte en Stromingen)
\symW{T}{Temperatuur}{K}

% Oefening blok
\begin{oefenblok}[Oefening 3.4]
Bereken de drukval in de buis wanneer...
\end{oefenblok}

% Theorie blok
\begin{theorieblok}[Wet van Bernoulli]
De wet van Bernoulli stelt dat...
\end{theorieblok}

% Concepten benadrukken
\concept{warmteoverdracht}
\belangrijk{Dit is een belangrijk punt}
```

#### Afbeeldingen

```latex
\begin{figure}[ht]
  \centering
  \includegraphics[width=0.8\linewidth]{assets/slides/diagram.png}
  \caption{Beschrijving van de afbeelding — bron: slides}
  \label{fig:diagram}
\end{figure}
```

**Afbeelding richtlijnen:**
- Plaats afbeeldingen in `assets/` subfolder van je vak
- Gebruik beschrijvende bestandsnamen: `warmte-overdracht-diagram.png`
- Vermeld altijd de bron in het caption
- Gebruik optimale formaten: PNG voor diagrammen, JPG voor foto's
- Houd bestandsgroottes redelijk (< 1MB per afbeelding)

#### Wiskunde formules

```latex
% Inline formule
De snelheid is $v = \frac{s}{t}$.

% Display formule
\[
  F = ma
\]

% Genummerde vergelijking
\begin{equation}
  E = mc^2
  \label{eq:einstein}
\end{equation}
```

#### Eenheden

Gebruik altijd `siunitx` voor eenheden:

```latex
\SI{10}{\meter\per\second}
\SI{25}{\celsius}
\SI{9.81}{\meter\per\second\squared}
\num{3.14159}
```

### Inhoudelijke Stijl

#### Taal en tone

- **Nederlands**: Alle content moet in correct Nederlands zijn
- **Formeel maar toegankelijk**: Schrijf zoals je lesgeeft aan medestudenten
- **Duidelijk en bondig**: Vermijd onnodige complexiteit
- **Technisch correct**: Controleer formules en termen

#### Structuur

- **Begin met het doel**: Wat leert de lezer in deze sectie?
- **Stap-voor-stap**: Bouw logisch op van simpel naar complex
- **Voorbeelden**: Illustreer concepten met concrete voorbeelden
- **Samenvatting**: Eindig secties met kernpunten

#### Oefeningen

Volledige oefeningen bevatten:
1. **Opgave**: Duidelijke probleemstelling
2. **Gegeven**: Wat is bekend?
3. **Gevraagd**: Wat moet berekend/bewezen worden?
4. **Oplossing**: Stap-voor-stap uitwerking
5. **Antwoord**: Finaal antwoord met eenheden

```latex
\begin{oefenblok}[Oefening 3.5: Warmteoverdracht]
\textbf{Gegeven:}
\begin{itemize}
  \item Temperatuur binnen: \SI{20}{\celsius}
  \item Temperatuur buiten: \SI{-5}{\celsius}
  \item Wanddikte: \SI{20}{\centi\meter}
\end{itemize}

\textbf{Gevraagd:} Bereken de warmtestroom door de wand.

\textbf{Oplossing:}

Stap 1: Bepaal het temperatuurverschil...
\[
  \Delta T = \SI{20}{\celsius} - (\SI{-5}{\celsius}) = \SI{25}{\kelvin}
\]

Stap 2: ...

\textbf{Antwoord:} $\dot{Q} = \SI{125}{\watt\per\meter\squared}$
\end{oefenblok}
```

## Git Workflow

### Commit Messages

Goede commit messages zijn essentieel voor samenwerking.

**Format:**
```
Type: Korte beschrijving (max 50 karakters)

Optionele langere uitleg (wrap bij 72 karakters).
Leg uit WAAROM, niet alleen WAT.
```

**Types:**
- `Add:` - Nieuwe content, oefeningen, hoofdstukken
- `Fix:` - Bug fixes, correcties, typos
- `Improve:` - Verbeteringen aan bestaande content
- `Docs:` - Documentatie wijzigingen
- `Style:` - Formatting, whitespace (geen inhoudelijke wijzigingen)
- `Refactor:` - Code restructurering zonder gedragswijziging

**Voorbeelden:**

✅ **Goed:**
```
Add: Thermodynamica oefeningen 3.5-3.8

Voegt vier nieuwe oefeningen toe over warmteoverdracht met
volledige stap-voor-stap uitwerkingen en diagrammen.
```

```
Fix: Correctie formule Bernoulli in hoofdstuk 2

De formule had de verkeerde exponent voor de snelheidsterm.
Gecorrigeerd naar v^2 conform literatuur.
```

❌ **Slecht:**
```
update
```

```
fixes
```

```
Added some stuff
```

### Branch Management

- **main**: Productie-klare code, altijd werkend
- **feature branches**: Voor alle wijzigingen
- **Levensduur**: Delete branch na merge

### Merge Conflicts

Als je een merge conflict krijgt:

```bash
# Update je branch met laatste main
git checkout main
git pull origin main
git checkout je-feature-branch
git merge main

# Los conflicts op in de bestanden
# Git markeert conflicts met <<<<, ====, >>>>

# Na het oplossen:
git add .
git commit -m "Merge: Resolve conflicts with main"
git push origin je-feature-branch
```

## Vragen of Hulp Nodig?

- **Issues**: Open een issue voor vragen of discussie
- **Discussions**: Gebruik GitHub Discussions voor algemene vragen
- **Contact**: Bereik de maintainers via GitHub

## Licentie

Door bij te dragen, ga je ermee akkoord dat je bijdragen onder dezelfde licentie vallen als het project.

---

**Bedankt voor je bijdrage! 🎉**

Elke bijdrage, hoe klein ook, helpt medestudenten om beter te leren.
