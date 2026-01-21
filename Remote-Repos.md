# Remote Repositories in VS Code 🌐

Dit is een aanvulling op de README. Hier leer je hoe je GitHub repositories direct in VS Code beheert zonder naar de website te gaan.

---

## 🤔 Wat is een "Remote Repository"?

**Remote** betekent "van ver weg" - in dit geval GitHub (op het internet).

**Simpel gezegd:**
- **Local repository** = De bestanden op jouw computer
- **Remote repository** = De bestanden op GitHub (in de cloud)

Git synchroniseert deze twee automatisch. Zo kunnen meerdere mensen tegelijk aan hetzelfde project werken! 🚀

---

## 🔌 De GitHub Extension in VS Code

VS Code heeft een speciale extensie genaamd **"GitHub Pull Requests and Issues"** waarmee je alles rechtstreeks in de editor kunt doen:
- Branches beheren
- Pull Requests maken en reviewen
- Issues bekijken
- Alles synchroniseren

Je hebt deze waarschijnlijk al geïnstalleerd. Zo ziet het eruit:

---

## 🔑 GitHub Account Koppelen

De eerste keer dat je de GitHub features gebruikt, vraagt VS Code om toegang tot GitHub.

### Stap 1: Klik op het Account Icoontje
Klik **linksonder** op het persoon-icoontje (meestal in de hoek van VS Code).

### Stap 2: "Sign in with GitHub"
Je ziet een optie **"Sign in with GitHub"** - klik erop.

### Stap 3: Autoriseren
1. VS Code opent je browser
2. GitHub vraagt: "Authorize Visual Studio Code"
3. Klik **"Authorize github"**
4. Klaar! VS Code is nu verbonden met je GitHub account

**Nu kan VS Code:**
- Zien welke branches je hebt
- Branches aanmaken en wisselen
- Pull Requests beheren
- Je wijzigingen pushen en pullen

---

## 📱 De GitHub Extension UI

Als je de extension goed hebt geïnstalleerd, zie je in de **linker sidebar** twee nieuwe icoontjes:

### 🔗 Source Control (Vertakking-icoontje)
Dit gebruik je voor:
- Je lokale wijzigingen committen
- Branches beheren
- Pushen en pullen

### 🚀 GitHub (Github icoontje)
Dit gebruik je voor:
- Issues bekijken en aanmaken
- Pull Requests reviewen
- Discussions lezen

---

## 📊 Source Control Uitgelegd

Dit is de plek waar je je dagelijkse werk beheert.

### Hier zie je:

```
SOURCE CONTROL: Git

Branch: mijn-nieuwe-feature    ↓

📁 CHANGES (2)
  📝 samenvatting.tex
  📝 school-macros.sty

Message box: [Jouw commit bericht hier]

[✓ Commit]  [↻ Refresh]  [... meer opties]
```

### Wat zijn die nummers?
De (2) betekent: 2 bestanden zijn gewijzigd.

### Hoe commit je?
1. Type een bericht in het message box
2. Voeg je veranderingen toe door te stagen (klik op het plusje naast elk bestand of bij CHANGES)
3. Klik op het groene vinkje **[✓ Commit]**
4. synchroniseer met GitHub (syncen = push + pull)

---

## 🌳 Branches Beheren via GitHub Extension

### Branch Wisselen
1. Klik op de **branch naam** (staat meestal `main` of `main`)
2. Kies een bestaande branch uit de lijst
3. VS Code wisselt automatisch

### Nieuwe Branch Aanmaken
1. Klik op de **branch naam**
2. Kies **"Create new branch from..."**
3. Selecteer waar je vanaf maakt (meestal `main`)
4. Geef je branch een naam
5. Klaar! Je werkt nu in je eigen branch

### Branch Verwijderen
1. Klik op de **branch naam**
2. Rechts zie je een 🗑️ icoontje bij branches
3. Klik erop om die branch te verwijderen

---

## 🔄 Push en Pull via Extension

### Push (Upload naar GitHub)
Na je commit, wil je je werk uploaden:

1. Klik op de **3 puntjes** (`...`) in de Source Control header
2. Kies **"Push"**
3. Wacht tot het klaar is ✓

**Of sneller:**
- Druk `Ctrl+Shift+P` (Command Palette)
- Type `git push`
- Klik het eerste resultaat

### Pull (Download wijzigingen van GitHub)
Voordat je begint, haal je de nieuwste wijzigingen op:

1. Klik op de **3 puntjes** (`...`) in de Source Control header
2. Kies **"Pull"**
3. Klaar!

**Of:**
- Druk `Ctrl+Shift+P`
- Type `git pull`
- Klik het resultaat

---

## 🔃 Sync (Push + Pull tegelijk)

Handiger dan apart pushen en pullen:

1. Klik op de **3 puntjes** (`...`) in de Source Control header
2. Kies **"Sync"**
3. VS Code pushed eerst je wijzigingen, dan pullt de nieuwste

**Of:**
- Druk `Ctrl+Shift+P`
- Type `git sync`

---

## 🐙 GitHub Issues & Pull Requests

Met de extension kun je ook issues en PRs beheren.

### Issues Bekijken
1. Klik op het **megafoon-icoontje** links (GitHub Issues)
2. Je ziet alle open issues
3. Klik op een issue om het volledig te lezen
4. Je kunt direct commentaar toevoegen

### Pull Requests Maken
Na je commits en push:

1. Klik op het **megafoon-icoontje** links
2. Klik **"Create Pull Request"**
3. Vul in:
   - Title
   - Description
   - **Base branch: main** (BELANGRIJK!)
4. Klik **"Create"**

Je PR is nu aangemaakt en wacht op review!

---

## 🔔 Notificaties

VS Code toont notificaties als:
- Iemand commentaar geeft op jouw PR
- Er wijzigingen zijn in de main branch
- Je branch conflicts heeft

Let op het **belletje-icoontje** rechtsboven!

---

## 🚨 Veelgemaakte Fouten

### ❌ Fout 1: "Publish Branch" in plaats van "Push"
- **Wat is het?** Je hebt een nieuwe branch gemaakt maar nog niet geupload
- **Hoe fix je het?** Klik op "Publish Branch" (verschijnt in Source Control)

### ❌ Fout 2: Werken in `main` branch
- **Waarom slecht?** Iedereen maakt wijzigingen in dezelfde branch = chaos
- **Hoe voorkomen?** Maak altijd een nieuwe branch voordat je iets bewerkt
- **Hoe fix je het?** 
  1. Maak een nieuwe branch aan
  2. Je wijzigingen gaan automatisch mee
  3. Switch terug naar `main` en pull

### ❌ Fout 3: Vergeten te pullen voordat je bewerkt
- **Waarom slecht?** Je mist wijzigingen van anderen
- **Hoe voorkomen?** Altijd eerst pullen (Stap 1 van je workflow!)

### ❌ Fout 4: Verkeerde base branch bij PR
- **Waarom slecht?** Je PR gaat naar `main` in plaats van `main`
- **Hoe voorkomen?** Controleer altijd dat `base: main` is geselecteerd

---

## 🎯 Typische Workflow met de Extension

Dit is wat je meestal doet:

```
1. Open VS Code
   ↓
2. Source Control → Branch → Switch naar 'main'
   ↓
3. Source Control → 3 puntjes → Pull
   (Haal nieuwste wijzigingen op)
   ↓
4. Source Control → Branch → Create new branch
   (Maak je werkruimte aan)
   ↓
5. Bewerk je bestanden, bouw PDF, test
   ↓
6. Source Control → Type commit message → Commit
   ↓
7. Source Control → 3 puntjes → Push
   (Upload je werk)
   ↓
8. GitHub Issues → Create Pull Request
   (Vraag om je werk toe te voegen)
   ↓
9. Wacht op review → Merge! 🎉
```

---

## 💡 Tips & Tricks

### Sneltoetsen (voor experts!)
```
Ctrl+Shift+G    - Open Source Control
Ctrl+Shift+E    - Open Explorer
Ctrl+`          - Open Terminal
Ctrl+Shift+P    - Command Palette (alle commands!)
```

### Command Palette gebruiken
Druk `Ctrl+Shift+P` en type wat je wilt doen:
- `git pull` - Pull
- `git push` - Push
- `git sync` - Sync
- `git commit` - Commit
- `git branch` - Branch beheren

VS Code toont dan automatisch alle relevante commands!

### Blame View (Wie heeft dit geschreven?)
1. Open een bestand
2. Rechts in het menu: klik op de **historiek-icoontje**
3. Je ziet wie elke regel heeft geschreven!

---

## 🆘 Problemen Oplossen

### "Permission denied" of "Authentication failed"
**Oorzaak:** GitHub denkt je bent niet geauthenticeerd

**Oplossing:**
1. Klik linksonder op je account
2. Klik "Sign in with GitHub" opnieuw
3. Autoriseer VS Code

### Merge Conflicts
**Wat is het?** Twee mensen hebben dezelfde regel gewijzigd - Git weet niet welke versie klopt

**Hoe herken je het?** Na pull zie je `<<<<<<`, `======`, `>>>>>>>` in je bestand

**Hoe fix je het?**
1. Open het bestand met conflict
2. VS Code toont: "Accept Current Change", "Accept Incoming Change", etc.
3. Klik wat je wilt houden
4. Commit opnieuw

### Branch won't publish/push
**Oorzaak:** Je bent niet geauthenticeerd

**Oplossing:**
1. Klik linksonder op je account
2. Zorg dat je bent ingelogd bij GitHub

---

## 🎓 Samenvatting

| Actie | Hoe? |
|-------|------|
| **Branch wisselen** | Klik op branch naam, kies bestaande branch |
| **Nieuwe branch** | Klik op branch naam → Create new branch |
| **Wijzigingen committen** | Type message → Klik groene vinkje |
| **Naar GitHub pushen** | 3 puntjes → Push (of Sync) |
| **Nieuwste ophalen** | 3 puntjes → Pull |
| **Pull Request maken** | GitHub Issues → Create Pull Request |
| **Issues bekijken** | Megafoon icoontje links |

---

## 🚀 Volgende Stappen

Nu je dit weet, kun je:
1. Je eigen branch maken en eraan werken
2. Automatisch pushen en pullen
3. Pull Requests maken zonder GitHub website te bezoeken
4. Samenwerken met medestudenten

**Heb je vragen?** Stuur een berichtje naar **@eggmansmile** op Discord! 💬

---

**Happy coding!** 🎉