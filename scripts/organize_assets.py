#!/usr/bin/env python3
"""Verplaats alle figuren per vak naar een `assets/` map en werk de
referenties in de .tex bestanden bij.

Gebruik:
    python3 scripts/organize_assets.py "3de jaar"          # dry-run (toont plan)
    python3 scripts/organize_assets.py "3de jaar" --apply  # voert uit

Belangrijk: LaTeX lost relatieve paden in \\input'te fragmenten op t.o.v. het
HOOFDdocument. Daarom wordt elke includegraphics-referentie binnen een vak
herschreven naar `assets/<bestandsnaam>`, ongeacht in welk .tex bestand ze staat.
"""
import os
import re
import subprocess
import sys

IMG_EXTS = (".png", ".jpg", ".jpeg", ".pdf", ".gif", ".svg")
# vangt het pad-argument van \includegraphics[...]{pad} op
GRAPHICS_RE = re.compile(r"(\\includegraphics(?:\[[^\]]*\])?\{)([^}]*)(\})")


def find_images(subject_dir):
    """Alle afbeeldingen onder een vak, behalve wat al in assets/ staat."""
    imgs = []
    for root, dirs, files in os.walk(subject_dir):
        if os.path.basename(root) == "assets":
            continue
        for f in files:
            if f.lower().endswith(IMG_EXTS):
                imgs.append(os.path.join(root, f))
    return imgs


def find_tex(subject_dir):
    tex = []
    for root, _, files in os.walk(subject_dir):
        for f in files:
            if f.lower().endswith(".tex"):
                tex.append(os.path.join(root, f))
    return tex


def git_mv(src, dst, apply):
    if not apply:
        return
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    r = subprocess.run(["git", "mv", src, dst], capture_output=True, text=True)
    if r.returncode != 0:  # bestand niet getrackt -> gewone move
        os.replace(src, dst)


def process_subject(subject_dir, apply):
    imgs = find_images(subject_dir)
    if not imgs:
        return
    print(f"\n=== {subject_dir} ===")

    # basename -> volledig pad ; conflicten detecteren
    by_name = {}
    conflict = False
    for p in imgs:
        name = os.path.basename(p)
        if name in by_name:
            print(f"  ! CONFLICT: dubbele bestandsnaam {name}")
            conflict = True
        by_name[name] = p
    if conflict:
        print("  Overslaan i.v.m. naamconflicten.")
        return

    assets_dir = os.path.join(subject_dir, "assets")

    # tex referenties bijwerken
    referenced = set()
    for tex in find_tex(subject_dir):
        with open(tex, encoding="utf-8") as fh:
            content = fh.read()
        changes = [0]

        def repl(m):
            path = m.group(2)
            name = os.path.basename(path)
            if name not in by_name:
                if path.lower().endswith(IMG_EXTS):
                    print(f"  ? referentie zonder bestand: {path}  ({os.path.relpath(tex, subject_dir)})")
                return m.group(0)
            referenced.add(name)
            new = "assets/" + name
            if new != path:
                changes[0] += 1
            return m.group(1) + new + m.group(3)

        new_content = GRAPHICS_RE.sub(repl, content)
        if changes[0]:
            print(f"  {os.path.relpath(tex, subject_dir)}: {changes[0]} referentie(s) bijgewerkt")
            if apply:
                with open(tex, "w", encoding="utf-8") as fh:
                    fh.write(new_content)

    # bestanden verplaatsen
    moved = 0
    for name, src in by_name.items():
        dst = os.path.join(assets_dir, name)
        if os.path.abspath(src) == os.path.abspath(dst):
            continue
        git_mv(src, dst, apply)
        moved += 1
    not_ref = sorted(set(by_name) - referenced)
    print(f"  {moved} afbeelding(en) -> assets/  ({len(not_ref)} niet gerefereerd)")
    if not_ref:
        for n in not_ref:
            print(f"      (ongebruikt) {n}")


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    apply = "--apply" in sys.argv
    if not args:
        print("Geef een doelmap op, bv: scripts/organize_assets.py \"3de jaar\"")
        sys.exit(1)
    base = args[0]
    if not apply:
        print("== DRY-RUN (geen wijzigingen). Voeg --apply toe om uit te voeren. ==")
    for entry in sorted(os.listdir(base)):
        sub = os.path.join(base, entry)
        if os.path.isdir(sub):
            process_subject(sub, apply)


if __name__ == "__main__":
    main()
