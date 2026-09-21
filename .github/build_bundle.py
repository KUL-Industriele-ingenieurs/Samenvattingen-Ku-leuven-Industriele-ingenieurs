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
import sys

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
    for year in YEAR_FOLDERS:
        if not os.path.isdir(year):
            continue
        for root, _, files in os.walk(year):
            for f in files:
                stem, ext = os.path.splitext(f)
                if ext.lower() not in (".tex", ".typ"):
                    continue
                rel = os.path.relpath(root, ".").replace(os.sep, "/")
                parts = rel.split("/")
                # jaar + vakmap; dieper (chapters/, assets/) kappen we af
                folder = "/".join(parts[:2]) if len(parts) >= 2 else parts[0]
                fmap.setdefault(norm(stem) + ".pdf", folder)
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
        if os.path.isfile(s):
            shutil.copy2(s, os.path.join(bundle, s))

    # Write a manifest (pdf name -> "<jaar>/<Vak>") so the update scripts can
    # place files without hitting the rate-limited GitHub tree API.
    with open(os.path.join(bundle, "manifest.tsv"), "w", encoding="utf-8") as fh:
        for root, _, files in os.walk(bundle):
            rel = os.path.relpath(root, bundle).replace(os.sep, "/")
            folder = "" if rel == "." else rel
            for x in sorted(files):
                if x.lower().endswith(".pdf"):
                    fh.write(f"{x}\t{folder}\n")

    print(f"Bundled {moved} PDFs into <jaar>/<Vak> folders + {len(SCRIPTS)} scripts + manifest.")
    for root, _, files in os.walk(bundle):
        for x in sorted(files):
            print("  " + os.path.relpath(os.path.join(root, x), bundle))


if __name__ == "__main__":
    main()
