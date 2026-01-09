# Setup Git Hooks

This script configures git to use the custom hooks from `.githooks/` directory.

## Automatic Setup (Recommended)

Run this from the repository root:

```powershell
git config core.hooksPath .githooks
```

## What it does

The pre-commit hook automatically:
- Unstages generated PDFs (those with matching `.tex` files)
- Keeps reference PDFs (formularium, slides, tables, etc.)

This ensures only reference materials are committed, not build outputs.

## Manual Setup

If you prefer, you can manually copy hooks:

```powershell
Copy-Item .githooks\* .git\hooks\
```
