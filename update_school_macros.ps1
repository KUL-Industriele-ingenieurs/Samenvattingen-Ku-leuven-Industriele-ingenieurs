# update_school_macros.ps1
# Script to copy school-macros.sty to all subdirectories containing .tex files

$source = "school-macros.sty"
if (-not (Test-Path $source)) {
    Write-Error "Source file '$source' not found in current directory."
    exit 1
}

# Get subdirectories up to two levels deep
$level1 = Get-ChildItem -Directory
$level2 = $level1 | ForEach-Object { Get-ChildItem -Path $_.FullName -Directory -ErrorAction SilentlyContinue }
# Combine and remove duplicates
$subdirs = $level1 + $level2 | Sort-Object -Property FullName -Unique

foreach ($dir in $subdirs) {
    # Check if the directory contains any .tex files directly
    $hasTex = Get-ChildItem -Path $dir.FullName -Filter "*.tex" -ErrorAction SilentlyContinue | Select-Object -First 1

    if ($hasTex) {
        Copy-Item -Path $source -Destination $dir.FullName -Force
        Write-Host "Copied to: $($dir.FullName)"
    }
}

Write-Host "Update complete."
