#!/usr/bin/env bash
#
# new-excalidraw.sh — maak snel een lege .excalidraw.svg in de assets-map van het
# vak waar je nu in werkt, en open ze in VS Code (pomdtr.excalidraw-editor).
#
# Gebruik:
#   scripts/new-excalidraw.sh <start-dir> <naam>
#       <start-dir>  map van het geopende bestand (VS Code: ${fileDirname})
#       <naam>       naam van de tekening
#
# Het vak wordt afgeleid uit <start-dir>: we lopen omhoog tot we de map vinden
# die direct onder "Xde jaar" zit. De tekening komt in "<vak>/assets/".
# Lukt dat niet (geen vak gevonden), dan val je terug op een vak-picker.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

START_DIR="${1:-}"
NAAM="${2:-}"
ACTIVE_FILE="${3:-}"
LINE_NUM="${4:-}"

# --- 1. Vak afleiden uit de map van het geopende bestand ----------------------
# We zoeken de map waarvan de OUDER matcht op "* jaar" (bv. "2de jaar").
vind_vak() {
    local dir="$1"
    [ -n "$dir" ] || return 1
    dir="$(cd "$dir" 2>/dev/null && pwd)" || return 1
    while [ "$dir" != "$REPO_ROOT" ] && [ "$dir" != "/" ]; do
        local parent
        parent="$(dirname "$dir")"
        case "$(basename "$parent")" in
            *jaar)
                # relatief pad t.o.v. de repo-root teruggeven
                printf '%s\n' "${dir#$REPO_ROOT/}"
                return 0
                ;;
        esac
        dir="$parent"
    done
    return 1
}

VAK=""
if VAK="$(vind_vak "$START_DIR")"; then
    :
else
    # Fallback: laat het vak kiezen (fzf of genummerd menu).
    mapfile -t VAKKEN < <(find . -maxdepth 2 -mindepth 2 -type d -path './*jaar/*' \
        -not -name 'assets' -not -name 'Tekeningen' | sed 's|^\./||' | sort)
    [ "${#VAKKEN[@]}" -gt 0 ] || { echo "Geen vakken gevonden." >&2; exit 1; }
    if command -v fzf >/dev/null 2>&1; then
        VAK="$(printf '%s\n' "${VAKKEN[@]}" | fzf --prompt='Kies vak> ' --height=40% --reverse)"
    else
        echo "Geen vak gevonden voor '$START_DIR'. Kies een vak:"
        select keuze in "${VAKKEN[@]}"; do
            [ -n "${keuze:-}" ] && { VAK="$keuze"; break; }
        done
    fi
fi
[ -n "$VAK" ] || { echo "Geen vak bepaald." >&2; exit 1; }

# --- 2. Naam ------------------------------------------------------------------
if [ -z "$NAAM" ]; then
    read -r -p "Naam van de tekening: " NAAM
fi
[ -n "$NAAM" ] || { echo "Geen naam opgegeven." >&2; exit 1; }
# Strip een eventueel meegegeven extensie zodat we niet dubbel toevoegen.
NAAM="${NAAM%.excalidraw.svg}"; NAAM="${NAAM%.svg}"; NAAM="${NAAM%.excalidraw}"

# --- 3. Bestand maken ---------------------------------------------------------
ASSETS_DIR="$VAK/assets"
mkdir -p "$ASSETS_DIR"
DOEL="$ASSETS_DIR/$NAAM.excalidraw.svg"

if [ -e "$DOEL" ]; then
    echo "Bestaat al, wordt geopend: $DOEL"
else
    : > "$DOEL"   # leeg .excalidraw.svg = blanco canvas in de Excalidraw-editor
    echo "Aangemaakt: $DOEL"
fi

# --- 4. Openen in VS Code -----------------------------------------------------
if command -v code >/dev/null 2>&1; then
    code -r "$DOEL"
fi

# --- 5. Snippet invoegen in het actieve document -----------------------------
if [ -n "$ACTIVE_FILE" ] && [ -n "$LINE_NUM" ] && [ -f "$ACTIVE_FILE" ]; then
    EXT="${ACTIVE_FILE##*.}"
    SNIPPET=""
    if [ "$EXT" = "tex" ]; then
        read -r -d '' SNIPPET <<EOF || true
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{assets/$NAAM.excalidraw.svg}
  \caption{$NAAM}
  \label{fig:$NAAM}
\end{figure}
EOF
    elif [ "$EXT" = "typ" ]; then
        read -r -d '' SNIPPET <<EOF || true
#figure(
  image("assets/$NAAM.excalidraw.svg", width: 80%),
  caption: [$NAAM],
) <fig:$NAAM>
EOF
    fi

    if [ -n "$SNIPPET" ]; then
        python3 -c "
import sys
file_path = sys.argv[1]
line_num = int(sys.argv[2])
snippet = sys.argv[3]

with open(file_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# line_num is 1-indexed. Insert snippet at line_num - 1
idx = max(0, min(line_num - 1, len(lines)))
lines.insert(idx, snippet + '\n')

with open(file_path, 'w', encoding='utf-8') as f:
    f.writelines(lines)
" "$ACTIVE_FILE" "$LINE_NUM" "$SNIPPET"
        echo "Snippet ingevoegd in $ACTIVE_FILE op regel $LINE_NUM"
    fi
fi
