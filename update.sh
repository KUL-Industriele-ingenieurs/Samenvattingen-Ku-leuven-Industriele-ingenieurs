#!/bin/bash

# --- Configuration ---
SCRIPT_VERSION="1.2.1"
REPO="KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs"
API_BASE="https://api.github.com/repos/$REPO"
RAW_BASE="https://raw.githubusercontent.com/$REPO/MAIN"
SELF_NAME="$(basename "${BASH_SOURCE[0]}")"
TARGET_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SELF_PATH="$TARGET_DIR/$SELF_NAME"

# --- Terminal capabilities ---
if [ -t 1 ]; then
    IS_TTY=1
    C_BOLD=$'\033[1m'; C_DIM=$'\033[2m'; C_RED=$'\033[31m'; C_GREEN=$'\033[32m'
    C_YELLOW=$'\033[33m'; C_BLUE=$'\033[34m'; C_CYAN=$'\033[36m'; C_RESET=$'\033[0m'
else
    IS_TTY=0
    C_BOLD=""; C_DIM=""; C_RED=""; C_GREEN=""; C_YELLOW=""; C_BLUE=""; C_CYAN=""; C_RESET=""
fi

# --- UI helpers ---
banner() {
    echo "${C_CYAN}${C_BOLD}"
    echo "  ╔══════════════════════════════════════════════╗"
    echo "  ║   📚  KU Leuven Samenvattingen — PDF Sync     ║"
    printf "  ║        script v%-32s║\n" "$SCRIPT_VERSION"
    echo "  ╚══════════════════════════════════════════════╝"
    echo "${C_RESET}"
}

human_size() { # bytes -> human readable
    awk -v b="$1" 'BEGIN{
        split("B KB MB GB TB", u, " "); i=1;
        while (b>=1024 && i<5){ b/=1024; i++ }
        printf (i==1 ? "%d %s" : "%.1f %s"), b, u[i]
    }'
}

clear_line() { [ "$IS_TTY" = "1" ] && printf '\r\033[K'; }

# Print a status line (above the live progress bar)
status() { clear_line; echo "$1"; }

# Draw an in-place progress bar: draw_bar current total label
draw_bar() {
    local cur=$1 total=$2 label=$3 width=24
    [ "$total" -le 0 ] && return
    local filled=$(( cur * width / total ))
    local empty=$(( width - filled ))
    local bar="" ; local i
    for ((i=0;i<filled;i++)); do bar="${bar}█"; done
    for ((i=0;i<empty;i++)); do bar="${bar}░"; done
    if [ "$IS_TTY" = "1" ]; then
        printf '\r\033[K  %s[%s]%s %s/%s  %s' "$C_BLUE" "$bar" "$C_RESET" "$cur" "$total" "${C_DIM}${label}${C_RESET}"
    fi
}

rule() { echo "  ${C_DIM}────────────────────────────────────────────────${C_RESET}"; }

die() { status "${C_RED}✗ $1${C_RESET}"; exit 1; }

# --- Self-update: fetch the latest version of this script, show what changed ---
self_update() {
    [ "$NO_SELF_UPDATE" = "1" ] && return 0
    printf '  %sChecking for script updates...%s ' "$C_CYAN" "$C_RESET"
    local latest
    latest="$(curl -fsSL "$RAW_BASE/$SELF_NAME" 2>/dev/null)" || { echo "${C_DIM}offline, skipped${C_RESET}"; return 0; }
    [ -z "$latest" ] && { echo "${C_DIM}skipped${C_RESET}"; return 0; }

    local current; current="$(cat "$SELF_PATH")"
    if [ "$latest" = "$current" ]; then
        echo "${C_GREEN}✓ up to date${C_RESET}"
        return 0
    fi

    echo "${C_YELLOW}${C_BOLD}update available!${C_RESET}"
    echo "  ${C_DIM}What changed in $SELF_NAME:${C_RESET}"
    rule
    if command -v git >/dev/null 2>&1; then
        git --no-pager diff --no-index --color=always \
            <(printf '%s' "$current") <(printf '%s' "$latest") | sed 's/^/  /' || true
    else
        diff -u <(printf '%s' "$current") <(printf '%s' "$latest") | sed 's/^/  /' || true
    fi
    rule
    printf '%s' "$latest" > "$SELF_PATH"
    chmod +x "$SELF_PATH" 2>/dev/null || true
    echo "  ${C_GREEN}↻ Updated to the latest version. Re-running...${C_RESET}"
    echo
    NO_SELF_UPDATE=1 exec bash "$SELF_PATH" "$@"
}

# --- Parse flags ---
for arg in "$@"; do
    case "$arg" in
        --no-self-update) NO_SELF_UPDATE=1 ;;
        -h|--help)
            echo "Usage: $SELF_NAME [--no-self-update]"
            echo "  Downloads the latest compiled PDF summaries into <jaar>/<Vak> folders."
            exit 0 ;;
    esac
done

# =====================================================================
banner
self_update "$@"

# Step 1: Fetch the release (PDF assets + folder manifest)
printf '  %sFetching release...%s ' "$C_CYAN" "$C_RESET"
RELEASE_DATA=$(curl -s "$API_BASE/releases/tags/latest")
if [[ $RELEASE_DATA == *'"message": "Not Found"'* ]] || [ -z "$RELEASE_DATA" ]; then
    echo "${C_RED}failed${C_RESET}"; die "Release 'latest' not found on GitHub."
fi
mapfile -t ASSET_LINES < <(echo "$RELEASE_DATA" | python3 -c "
import sys, json
d = json.load(sys.stdin)
for a in d.get('assets', []):
    if a['name'].endswith('.pdf'):
        print(a['name'] + '\t' + a['browser_download_url'] + '\t' + str(a['size']))
")
TOTAL=${#ASSET_LINES[@]}
echo "${C_GREEN}${TOTAL} PDFs${C_RESET}"

# Step 2: Build filename -> "<jaar>/<Vak>" mapping.
# Prefer the manifest asset (served from a CDN, no API rate limit); fall back
# to the GitHub tree API only if it is missing.
printf '  %sBuilding folder map...%s ' "$C_CYAN" "$C_RESET"
declare -A YEAR_MAP
MANIFEST_URL=$(echo "$RELEASE_DATA" | python3 -c "
import sys, json
d = json.load(sys.stdin)
for a in d.get('assets', []):
    if a['name'] == 'manifest.tsv':
        print(a['browser_download_url']); break
")
if [ -n "$MANIFEST_URL" ]; then
    while IFS=$'\t' read -r pdf_name year_folder; do
        [ -n "$pdf_name" ] && YEAR_MAP["$pdf_name"]="$year_folder"
    done < <(curl -sL "$MANIFEST_URL")
    echo "${C_GREEN}${#YEAR_MAP[@]} via manifest${C_RESET}"
else
    TREE_JSON=$(curl -s "$API_BASE/git/trees/MAIN?recursive=1")
    while IFS=$'\t' read -r pdf_name year_folder; do
        [ -n "$pdf_name" ] && YEAR_MAP["$pdf_name"]="$year_folder"
    done < <(echo "$TREE_JSON" | python3 -c "
import sys, json, os
try: data = json.load(sys.stdin)
except Exception: sys.exit(0)
year_folders = {'1ste jaar', '2de jaar', '3de jaar', '4de jaar master'}
seen = set()
for item in data.get('tree', []):
    parts = item['path'].split('/')
    if len(parts) < 2 or parts[0] not in year_folders: continue
    stem, ext = os.path.splitext(os.path.basename(item['path']))
    if ext not in ('.tex', '.typ'): continue
    pdf = stem.replace(' ', '_').replace('&', '.') + '.pdf'
    # jaar + vakmap, zodat elk vak zijn eigen map krijgt
    folder = '/'.join(parts[:2]) if len(parts) > 2 else parts[0]
    if pdf not in seen:
        seen.add(pdf); print(f'{pdf}\t{folder}')
")
    echo "${C_YELLOW}${#YEAR_MAP[@]} via repo tree (fallback)${C_RESET}"
fi
echo

# Step 3: Download each PDF into its course subfolder
n_down=0; n_ok=0; n_fail=0; n_moved=0; bytes_down=0
i=0
for line in "${ASSET_LINES[@]}"; do
    i=$((i+1))
    IFS=$'\t' read -r pdf_name pdf_url remote_size <<< "$line"
    year_folder="${YEAR_MAP[$pdf_name]}"

    draw_bar "$i" "$TOTAL" "$pdf_name"

    if [ -n "$year_folder" ]; then
        dest_dir="$TARGET_DIR/$year_folder"
        mkdir -p "$dest_dir"
        display_path="$year_folder/$pdf_name"
    else
        dest_dir="$TARGET_DIR"
        display_path="$pdf_name"
    fi
    output_path="$dest_dir/$pdf_name"

    # Migration: move file from old flat location if it exists there
    old_path="$TARGET_DIR/$pdf_name"
    if [ "$dest_dir" != "$TARGET_DIR" ] && [ -f "$old_path" ] && [ ! -f "$output_path" ]; then
        mv "$old_path" "$output_path"
        n_moved=$((n_moved+1))
        status "  ${C_BLUE}→${C_RESET} moved ${display_path}"
    fi

    # Check if download is needed (compare file size)
    if [ -f "$output_path" ]; then
        local_size=$(stat -c%s "$output_path" 2>/dev/null || stat -f%z "$output_path" 2>/dev/null)
        if [ -n "$remote_size" ] && [ "$local_size" = "$remote_size" ]; then
            n_ok=$((n_ok+1))
            status "  ${C_DIM}✓ ${display_path}  (up to date)${C_RESET}"
            draw_bar "$i" "$TOTAL" "$pdf_name"
            continue
        fi
    fi

    if curl -sfL "$pdf_url" -o "$output_path"; then
        n_down=$((n_down+1))
        bytes_down=$((bytes_down + remote_size))
        status "  ${C_GREEN}⬇${C_RESET} ${display_path}  ${C_DIM}($(human_size "$remote_size"))${C_RESET}"
    else
        n_fail=$((n_fail+1))
        status "  ${C_RED}✗ ${display_path}  (download failed)${C_RESET}"
    fi
    draw_bar "$i" "$TOTAL" "$pdf_name"
done
clear_line

# --- Summary ---
echo
rule
summary="  ${C_GREEN}${n_down} downloaded${C_RESET} · ${C_DIM}${n_ok} up-to-date${C_RESET}"
[ "$n_moved" -gt 0 ] && summary="$summary · ${C_BLUE}${n_moved} moved${C_RESET}"
if [ "$n_fail" -gt 0 ]; then
    summary="$summary · ${C_RED}${n_fail} failed${C_RESET}"
else
    summary="$summary · ${C_GREEN}0 failed${C_RESET}"
fi
echo "$summary"
[ "$bytes_down" -gt 0 ] && echo "  ${C_DIM}Downloaded $(human_size "$bytes_down") this run.${C_RESET}"
rule
echo "  ${C_BOLD}Done! PDFs organized per year and course.${C_RESET}"

# --- Recent changes (who contributed what) ---
COMMIT_COUNT=15
echo
echo "  ${C_BOLD}${C_CYAN}🛠  Recent changes (last ${COMMIT_COUNT} commits)${C_RESET}"
rule
COMMITS=$(curl -s "$API_BASE/commits?sha=MAIN&per_page=$COMMIT_COUNT")
if [[ $COMMITS == *'"sha"'* ]]; then
    echo "$COMMITS" | IS_TTY="$IS_TTY" python3 -c "
import sys, json, os
tty = os.environ.get('IS_TTY') == '1'
y = '\033[33m' if tty else ''; d = '\033[2m' if tty else ''; r = '\033[0m' if tty else ''
try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(0)
for c in data:
    sha = c.get('sha','')[:7]
    author = (c.get('commit',{}).get('author',{}) or {}).get('name','?')
    msg = (c.get('commit',{}).get('message','') or '').splitlines()[0]
    if len(msg) > 60: msg = msg[:57] + '...'
    print(f'  {y}{sha}{r} {d}{author:<18.18}{r} {msg}')
"
else
    echo "  ${C_DIM}(could not load commit history — offline?)${C_RESET}"
fi
rule

# --- Contribute call-to-action ---
echo
echo "  ${C_BOLD}${C_GREEN}🙌  Found a mistake or want to add your own notes?${C_RESET}"
echo "     Contributions are very welcome! Open a pull request or issue:"
echo "     ${C_BLUE}${C_BOLD}https://github.com/$REPO${C_RESET}"
echo

# Keep the window open when launched by double-click (the terminal would
# otherwise close instantly and you'd never see the output).
if [ -t 0 ]; then
    read -rn1 -p "  Press any key to close..." _ || true
    echo
fi
