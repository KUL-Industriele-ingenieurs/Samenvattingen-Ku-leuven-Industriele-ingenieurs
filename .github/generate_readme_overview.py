#!/usr/bin/env python3
"""Regenerate the Vakkenoverzicht block in README.md.

Per vak worden de hoofddocumenten opgezocht (dezelfde filters als
latex-build.yml gebruikt) en gelinkt naar de bijhorende PDF in de
'latest' prerelease, zodat een klik het document meteen downloadt.
De naam van de map blijft ernaast staan als bronlink.

Usage: python3 .github/generate_readme_overview.py [README.md]
"""
import os
import re
import sys
from urllib.parse import quote

REPO = "KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs"
RELEASE = f"https://github.com/{REPO}/releases/download/latest"
START = "<!-- VAKKENOVERZICHT_START -->"
END = "<!-- VAKKENOVERZICHT_END -->"

# Mappen die de buildworkflow overslaat; hier ook overslaan zodat de README
# geen links toont naar PDF's die nooit gemaakt worden.
SKIP_DIRS = {".git", ".github", ".vscode", "assets", "_OLD", "chapters", "test"}


def norm(stem):
    # Zelfde normalisatie als build_bundle.py / de release-upload.
    return stem.replace(" ", "_").replace("&", ".")


def is_main_doc(path):
    try:
        with open(path, encoding="utf-8", errors="ignore") as fh:
            text = fh.read()
    except OSError:
        return False
    if path.endswith(".tex"):
        return path.endswith("-macros.sty") is False and "\\documentclass" in text
    return "#show: project" in text


def main_docs(course_dir):
    docs = []
    for root, dirs, files in os.walk(course_dir):
        dirs[:] = [d for d in dirs if d not in SKIP_DIRS and not d.startswith(".")]
        for f in files:
            if os.path.splitext(f)[1].lower() not in (".tex", ".typ"):
                continue
            p = os.path.join(root, f)
            # OLD-* blijft in de repo staan maar hoort niet in het overzicht.
            if f.upper().startswith("OLD") or not is_main_doc(p):
                continue
            docs.append(p)
    return sorted(docs, key=lambda p: os.path.basename(p).lower())


def pdf_url(path):
    stem = os.path.splitext(os.path.basename(path))[0]
    return f"{RELEASE}/{quote(norm(stem) + '.pdf')}"


def render():
    out = []
    years = sorted(
        d for d in os.listdir(".") if os.path.isdir(d) and "jaar" in d
    )
    for year in years:
        out.append("<details>")
        out.append(f"<summary><strong>{year}</strong></summary>")
        out.append("")
        courses = sorted(
            (os.path.join(year, d) for d in os.listdir(year)
             if os.path.isdir(os.path.join(year, d))
             and d not in SKIP_DIRS and not d.startswith(".")),
            key=str.lower,
        )
        if not courses:
            out.append("- Nog geen vakken toegevoegd")
        for course in courses:
            name = os.path.basename(course)
            folder = quote(course)
            docs = main_docs(course)
            if not docs:
                out.append(f"- {name} — [bronbestanden]({folder}) (nog geen PDF)")
                continue
            out.append(f"- **{name}** — [bronbestanden]({folder})")
            for doc in docs:
                stem = os.path.splitext(os.path.basename(doc))[0]
                out.append(f"  - [{stem}.pdf]({pdf_url(doc)})")
        out.append("</details>")
        out.append("")
    return "\n".join(out).rstrip("\n")


def main():
    readme = sys.argv[1] if len(sys.argv) > 1 else "README.md"
    with open(readme, encoding="utf-8") as fh:
        text = fh.read()
    pattern = re.compile(
        re.escape(START) + r".*?" + re.escape(END), re.DOTALL
    )
    if not pattern.search(text):
        sys.exit(f"Markers niet gevonden in {readme}")
    new = pattern.sub(lambda m: f"{START}\n{render()}\n{END}", text)
    if new != text:
        with open(readme, "w", encoding="utf-8") as fh:
            fh.write(new)
        print("README bijgewerkt.")
    else:
        print("Geen wijzigingen.")


if __name__ == "__main__":
    main()
