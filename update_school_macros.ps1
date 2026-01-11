# update_school_macros.ps1
# Script to copy school-macros.sty to all subdirectories containing .tex files

$source = "school-macros.sty"
if (-not (Test-Path $source)) {
    Write-Error "Source file '$source' not found in current directory."
    exit 1
}

# Get immediate subdirectories only
$subdirs = Get-ChildItem -Directory

foreach ($dir in $subdirs) {
    # Check if the immediate subdirectory contains any .tex files directly
    $hasTex = Get-ChildItem -Path $dir.FullName -Filter "*.tex" -ErrorAction SilentlyContinue | Select-Object -First 1
    
    if ($hasTex) {
        Copy-Item -Path $source -Destination $dir.FullName -Force
        Write-Host "Copied to: $($dir.Name)"
    }
}

Write-Host "Update complete."
