#!/usr/bin/env python3
"""Build the structured download bundle for the release ZIP.

Takes the flat collection of compiled PDFs and organizes them into
<jaar>/<Vak>/ folders (dezelfde indeling als de repo, en als wat
update.sh / update.ps1 neerzetten), then adds the update scripts at the
root. Run from the repo root.

Usage: python3 .github/build_bundle.py <src_pdf_dir> <bundle_dir>
"""
import os
import shutil
import subprocess
import sys

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
YEAR_FOLDERS = ["1ste jaar", "2de jaar", "3de jaar", "4de jaar master"]
SCRIPTS = ["update.sh", "update.ps1"]


def norm(stem):
    # Same normalization the workflow/scripts use for PDF names.
    return stem.replace(" ", "_").replace("&", ".")


def build_folder_map():
    """pdf-naam -> "<jaar>/<Vak>", de map waarin het bronbestand staat.

    Vroeger stond hier alleen het jaar, waardoor alle PDF's van een jaar op
    een hoop kwamen. Nu krijgt elk vak zijn eigen map.
    """
    fmap = {}

    # 1. Probeer eerst via git ls-files: dit werkt betrouwbaar vanuit elke werkmap
    # en zelfs als sommige mappen sparse uitgecheckt zijn.
    try:
        out = subprocess.check_output(
            ["git", "-C", REPO_ROOT, "ls-files", "-z", "--", "*.tex", "*.typ"],
            stderr=subprocess.DEVNULL,
        )
        for raw in out.split(b"\x00"):
            if not raw:
                continue
            path = raw.decode("utf-8", errors="replace").replace("\\", "/")
            parts = path.split("/")
            if parts[0] in YEAR_FOLDERS:
                folder = "/".join(parts[:2]) if len(parts) >= 2 else parts[0]
                stem, _ = os.path.splitext(parts[-1])
                fmap.setdefault(norm(stem) + ".pdf", folder)
    except Exception:
        pass

    # 2. Aanvullen / fallback via filesystem inspectie
    for year in YEAR_FOLDERS:
        ydir = os.path.join(REPO_ROOT, year) if not os.path.isdir(year) else year
        if not os.path.isdir(ydir):
            continue
        for root, _, files in os.walk(ydir):
            for f in files:
                stem, ext = os.path.splitext(f)
                if ext.lower() not in (".tex", ".typ"):
                    continue
                rel = os.path.relpath(root, REPO_ROOT if ydir != year else ".").replace(os.sep, "/")
                parts = rel.split("/")
                folder = "/".join(parts[:2]) if len(parts) >= 2 else parts[0]
                fmap.setdefault(norm(stem) + ".pdf", folder)

    if not fmap:
        print("::warning::build_folder_map() produced an empty mapping!", file=sys.stderr)

    return fmap


def main():
    src = sys.argv[1] if len(sys.argv) > 1 else "artifacts/pdfs"
    bundle = sys.argv[2] if len(sys.argv) > 2 else "bundle"
    fmap = build_folder_map()
    os.makedirs(bundle, exist_ok=True)

    moved = 0
    if os.path.isdir(src):
        for f in sorted(os.listdir(src)):
            if not f.lower().endswith(".pdf"):
                continue
            stem, _ = os.path.splitext(f)
            newname = norm(stem) + ".pdf"
            folder = fmap.get(newname)
            dest_dir = os.path.join(bundle, *folder.split("/")) if folder else bundle
            os.makedirs(dest_dir, exist_ok=True)
            shutil.move(os.path.join(src, f), os.path.join(dest_dir, newname))
            moved += 1

    for s in SCRIPTS:
        src_script = s if os.path.isfile(s) else os.path.join(REPO_ROOT, s)
        if os.path.isfile(src_script):
            shutil.copy2(src_script, os.path.join(bundle, s))

    # Write a manifest (pdf name -> "<jaar>/<Vak>") so the update scripts can
    # place files without hitting the rate-limited GitHub tree API.
    placed_in_subfolder = 0
    manifest_lines = []
    for root, _, files in os.walk(bundle):
        rel = os.path.relpath(root, bundle).replace(os.sep, "/")
        folder = "" if rel == "." else rel
        for x in sorted(files):
            if x.lower().endswith(".pdf"):
                if folder:
                    placed_in_subfolder += 1
                manifest_lines.append(f"{x}\t{folder}\n")

    manifest_content = "".join(manifest_lines)
    with open(os.path.join(bundle, "manifest.tsv"), "w", encoding="utf-8") as fh:
        fh.write(manifest_content)

    # Schrijf ook naar de repo root als die schrijfbaar is
    repo_manifest = os.path.join(REPO_ROOT, "manifest.tsv")
    try:
        with open(repo_manifest, "w", encoding="utf-8") as fh:
            fh.write(manifest_content)
    except Exception:
        pass

    if moved > 0 and placed_in_subfolder == 0:
        print("::error::All PDFs were placed in root! None were mapped to course subfolders.", file=sys.stderr)
        sys.exit(1)

    print(f"Bundled {moved} PDFs ({placed_in_subfolder} in course folders) + {len(SCRIPTS)} scripts + manifest.")
    for root, _, files in os.walk(bundle):
        for x in sorted(files):
            print("  " + os.path.relpath(os.path.join(root, x), bundle))


if __name__ == "__main__":
    main()
