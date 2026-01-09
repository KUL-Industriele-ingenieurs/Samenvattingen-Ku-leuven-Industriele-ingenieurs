# Kwaliteitssamenvattingen voor Industrieel Ingenieurschap

Een gezamenlijk project voor het maken van professionele, gedetailleerde samenvattingen en oefeningen voor KU Leuven engineering vakken.

📚 **Vakken:** Wiskunde voor Systemen, Warmte en Stromingen, Productietechnologie, en meer  
🗣️ **Taal:** Nederlands  
📐 **Format:** LaTeX met professionele opmaak

## 🚀 Hoe te Beginnen

### Systeem Setup (eenmalig)

1. **LaTeX installeren**:


   **Option B: MikTeX (lighter weight)**
   - Download [MikTeX installer](https://miktex.org/download)
   - Of via Chocolatey:
     ```powershell
     choco install miktex
     ```
    - Of via winget
   ```powershell
     winget install miktex
     ```
   - During setup, enable "Install missing packages on-the-fly"

2. **VS Code extensions installeren** (via Extension Marketplace of Command Palette):

   ```
   Ctrl+Shift+P → "Extensions: Install Extension" → zoek:
   ```

   - **LaTeX Workshop** (`James-Yu.latex-workshop`) — Live preview + builds (ESSENTIEEL)
   - **LaTeX Utilities** (`tecosaur.latex-utilities`) — Extra features (formatting, selection)
   - **LaTeX language support** — Syntax highlighting & snippets
   - **Git Graph** — Git visualisatie (optioneel)

   Of installeren via CLI:
   ```powershell
   code --install-extension James-Yu.latex-workshop
   code --install-extension tecosaur.latex-utilities
   code --install-extension latex-support.latex
   ```

3. **Repository clonen:**
   ```bash
   git clone <repository-url>
   cd School-latex-documents
   ```

---

## 📝 VS Code LaTeX Workflow

### Documenten Builden

Alle build-taken zijn vooraf geconfigureerd. Open de Command Palette (`Ctrl+Shift+P`) en typ:

- **`Build LaTeX (Active File)`** — Bouwt huidige bestand (snelste, voor testen)
- **`Build LaTeX (latexmk - active file)`** — Bouwt met latexmk (automatische multi-pass, aanbevolen)
- **`Build main PDFs (latexmk)`** — Bouwt MATHSYS volledig
- **`Build Warmte PDF (latexmk)`** — Bouwt Warmte & Stromingen volledig

### Workflow voor Aanpassingen

1. Open je `.tex` bestand in VS Code
2. Sla op (`Ctrl+S`) - LaTeX Workshop auto-build detecteert deze
3. Bekijk PDF preview in sidebar (of Ctrl+Alt+V)
4. Voor zware wijzigingen: gebruik **Build LaTeX (latexmk - active file)** om zeker te zijn

### Tips voor Efficient Werken

- **Snelle refs checken:** Ctrl+Shift+P → "LaTeX: Synctex" (jump tussen PDF en code)
- **Formularium updaten:** Run build 2× na formule-wijzigingen (formularium vereist 2 passes)
- **Fouten zien:** LaTeX Workshop toont errors in Problems panel (Ctrl+Shift+M)

### 🔄 Git & GitHub: Eenvoudige Manier (Beginners)

**Heb je geen ervaring met git?** Geen probleem! Gebruik **GitHub Desktop** — visueel en simpel.

#### Stap 1: GitHub Desktop Downloaden & Installeren

1. Download [GitHub Desktop](https://desktop.github.com/)
2. Installeer en log in met je GitHub account
3. Klaar!

#### Stap 2: Repository Clonen (Kopie naar je Computer)

1. Open GitHub Desktop
2. Click: **File** → **Clone Repository**
3. Zoek naar `School-latex-documents`
4. Click **Clone** en kies waar je het wilt opslaan
5. Wacht tot het klaar is ✓

#### Stap 3: Wijzigingen Maken

1. Open je `.tex` bestand in VS Code en maak wijzigingen
2. Sla op (`Ctrl+S`)
3. Kijk in GitHub Desktop → je ziet alle wijzigingen onder "Changes" tab

#### Stap 4: Commit (Opslaan met Beschrijving)

1. In GitHub Desktop, linksonder zie je een tekstvak
2. Type een duidelijke beschrijving:
   ```
   Add: Oefening 3.5 met uitwerking
   ```
   of
   ```
   Fix: Typo in hoofdstuk 2
   ```
3. Click blauwe knop: **Commit to [jouw-branch-naam]**

#### Stap 5: Push (Uploaden naar GitHub)

1. Click knop: **Publish branch** (eerste keer) of **Push origin** (volgende keren)
2. Klaar! Je wijzigingen zijn nu op GitHub 🎉

#### Stap 6: Pull Request Maken (om je werk in te dienen)

1. GitHub Desktop toont: "Create Pull Request"
2. Click die knop
3. GitHub opent automatisch in je browser
4. Click groen knop: **Create Pull Request**
5. Beschrijf wat je hebt gedaan
6. Klik **Create Pull Request** — done!

---

### 🔧 Git Command Line (voor ervaren gebruikers)

Als je liever terminal gebruikt:

```powershell
# Clone (eenmalig)
git clone <repository-url>
cd School-latex-documents

# Voor elke wijziging:
git pull origin main                    # Zorg dat je up-to-date bent
# ... maak je wijzigingen ...
git add <bestand>
git commit -m "Add: beschrijving"
git push origin <branch-naam>
```

---

## 🔧 LaTeX Project Structuur

### Hoofddocumenten

| Vak | Bestand | Map |
|-----|---------|-----|
| Wiskunde voor Systemen | `MATHSYS-Oefeningen-RubenRyckaert.tex` | `math-systems/` |
| Warmte & Stromingen | `Warmte en stromingen Samenvatting Ruben Ryckaert.tex` | `Warmte en stromingen/` |
| Productietechnologie | `ProductieTechnologie-Samenvatting-RubenRyckaert.tex` | `Productietechnologie/` |

### Macro's & Templates

- **`school-macros.sty`** — Gedeelde macro's (oefenblokken, theorieboxen, formules)
- **`latex_templates/`** — Voorbeelden en templates voor nieuw content
  - `template_examples.tex` — Uitgewerkte voorbeelden van siunitx, tcolorbox, pgfplots, etc.
  - `new_document_template.tex` — Start hier voor nieuwe samenvattingen

### Afbeeldingen & Assets

Plaats afbeeldingen in de `assets/` map van je vak:
```
Warmte en stromingen/
├── assets/
│   ├── slides/      ← Screenshots van slides
│   └── wikipedia/   ← Screenshots van wikimedia
```

---

## 💻 Bijdragen: Git Workflow

### 1. Feature Branch Aanmaken

```bash
# Update lokale main
git checkout main
git pull origin main

# Maak een feature branch (beschrijvende naam)
git checkout -b add/thermodynamica-formules
# of: git checkout -b fix/typo-hoofdstuk3
```

### 2. Wijzigingen Maken

- Bewerk `.tex` bestanden
- Test je build lokaal (Ctrl+Shift+P → Build task)
- Voeg afbeeldingen toe in `assets/`
- Let op: **quoteert paden met spaties** in shell commands

### 3. Wijzigingen Committen

```bash
# Controleer wat je hebt gewijzigd
git status
git diff MATHSYS-Oefeningen-RubenRyckaert.tex  # voorbeeld

# Stage je wijzigingen
git add math-systems/MATHSYS-Oefeningen-RubenRyckaert.tex
git add math-systems/assets/diagram.png

# Commit met duidelijk bericht
git commit -m "Add: Laplacetransformatie oefeningen 3.1-3.5 met grafieken"
```

**Commit message best practices:**
- Start met: `Add:` / `Fix:` / `Improve:` / `Docs:`
- Wees specifiek: "Oefening 3.1-3.5" niet zomaar "update"
- Nederlands is prima, maar consistent houden

### 4. Push en Pull Request

```bash
# Push je branch naar GitHub
git push origin add/thermodynamica-formules

# Open een Pull Request op GitHub
# - Beschrijf wat je hebt toegevoegd/gewijzigd
# - Voeg screenshots toe van de PDF output (optioneel)
```

### 5. Code Review & Merge

- Reviewer checkt inhoud en opmaak
- Pas feedback aan via nieuwe commits
- Eenmaal goedgekeurd: merge naar main

---

## ✨ Contribution Guidelines

### Inhoud

✅ **Aanmoedigd:**
- Oefeningen toevoegen met stap-voor-stap oplossingen
- Formules registreren in het formularium
- Afbeeldingen & diagrammen
- Typo's en duidelijkheids-fixes
- Ondersteunende voorbeelden

❌ **Vermijd:**
- Andere talen (Nederlands = standaard)
- Breaking changes in document structure
- Packages toevoegen zonder vooraf overleg (versie-conflicts)

### Macros Gebruiken

Gebruik de gedeelde macro's voor consistentie:

```latex
% Formule registreren (toont op pagina + in formularium)
\frm{Bernoulli}{P + \frac{1}{2}\rho v^2 + \rho gh = \text{const}}{Bernoulli's vergelijking}

% Oefening-blok
\begin{oefenblok}[Oefening 3.4]
Bereken de drukval in de buis...
\end{oefenblok}

% Afbeelding
\begin{figure}[ht]
  \centering
  \includegraphics[width=0.8\linewidth]{assets/slides/manometer.png}
  \caption{Manometer — bron: slides}
  \label{fig:manometer}
\end{figure}
```

Zie `latex_templates/macro_usage_guide.tex` voor alle beschikbare macro's.

### Build Checklist

Voor je een PR indient, controleer je:

- [ ] Lokaal gebuild: `Build LaTeX (latexmk - active file)` ✓
- [ ] PDF ziet er correct uit
- [ ] Geen untracked files (`.aux`, `.pdf` enzovoort) in git
- [ ] Commit messages zijn duidelijk

---

## 📦 Benodigde Packages

```bash
# TeX Live: basisinstallatie
tlmgr install latexmk siunitx tcolorbox pgfplots booktabs subcaption enumitem

# Voor Minted (code highlighting met Pygments)
tlmgr install minted
# + zorg dat Python/Pygments geïnstalleerd is
```

Check `AGENTS.md` voor meer details over troubleshooting en advanced setup.

---

## ❓ Veelgestelde Vragen

**Q: Ik zie "No hyphenation patterns" warning**  
A: Run `tlmgr install hyphen-dutch` en rebuild formats

**Q: Formularium werkt niet**  
A: Run build 2× na formule-wijzigingen (formularium vereist 2 passes)

**Q: Git push faalt met "branch diverged"**  
A: `git pull origin main` eerst, los conflicts op, commit, dan push

**Q: Hoe vind ik beschikbare macro's?**  
A: Open `latex_templates/macro_usage_guide.tex` en bouw het

---

## LaTeX voorbeelden & template 📐

In de map `latex_templates/` vind je praktische voorbeelden:

- **`template_examples.tex`** — Voorbeelden van siunitx, tcolorbox, pgfplots, etc.
- **`new_document_template.tex`** — Template voor nieuwe samenvattingen
- **`macro_usage_guide.tex`** — Volledige gids van beschikbare macro's

Build met: `latexmk -pdf latex_templates/template_examples.tex`

---

**Voor meer technical details:** zie [AGENTS.md](AGENTS.md)
