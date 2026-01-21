#!/bin/bash
# Find common issue markers in .tex files and print as compiler-like warnings

# Search recursively for .tex files, ignore .git directory
# grep options:
# -r: recursive
# -n: line number
# -E: extended regex
# -I: ignore binary files
grep -rnE -I --include="*.tex" "(@issue|@todo|TODO|FIXME|TODO:)" . | \
while IFS=: read -r file line content; do
    # Trim leading whitespace
    trimmed="${content#"${content%%[![:space:]]*}"}"
    # Output in VS Code problem matcher format
    echo "$file:$line:1: warning: $trimmed"
done
