#!/usr/bin/env python3
"""Build the structured download bundle for the release ZIP.

Takes the flat collection of compiled PDFs and organizes them into per-year
folders (matching how update.sh / update.ps1 lay things out), then adds the
update scripts at the root. Run from the repo root.

Usage: python3 .github/build_bundle.py <src_pdf_dir> <bundle_dir>
"""
import os
import shutil
import sys

YEAR_FOLDERS = ["1ste jaar", "2de jaar", "3de jaar", "4de jaar master"]
SCRIPTS = ["update.sh", "update.ps1"]


def norm(stem):
    # Same normalization the workflow/scripts use for PDF names.
    return stem.replace(" ", "_").replace("&", ".")


def build_year_map():
    ymap = {}
    for year in YEAR_FOLDERS:
        if not os.path.isdir(year):
            continue
        for root, _, files in os.walk(year):
            for f in files:
                stem, ext = os.path.splitext(f)
                if ext.lower() in (".tex", ".typ"):
                    ymap.setdefault(norm(stem) + ".pdf", year)
    return ymap


def main():
    src = sys.argv[1] if len(sys.argv) > 1 else "artifacts/pdfs"
    bundle = sys.argv[2] if len(sys.argv) > 2 else "bundle"
    ymap = build_year_map()
    os.makedirs(bundle, exist_ok=True)

    moved = 0
    if os.path.isdir(src):
        for f in sorted(os.listdir(src)):
            if not f.lower().endswith(".pdf"):
                continue
            stem, _ = os.path.splitext(f)
            newname = norm(stem) + ".pdf"
            year = ymap.get(newname)
            dest_dir = os.path.join(bundle, year) if year else bundle
            os.makedirs(dest_dir, exist_ok=True)
            shutil.move(os.path.join(src, f), os.path.join(dest_dir, newname))
            moved += 1

    for s in SCRIPTS:
        if os.path.isfile(s):
            shutil.copy2(s, os.path.join(bundle, s))

    print(f"Bundled {moved} PDFs into year folders + {len(SCRIPTS)} scripts.")
    for root, _, files in os.walk(bundle):
        for x in sorted(files):
            print("  " + os.path.relpath(os.path.join(root, x), bundle))


if __name__ == "__main__":
    main()
