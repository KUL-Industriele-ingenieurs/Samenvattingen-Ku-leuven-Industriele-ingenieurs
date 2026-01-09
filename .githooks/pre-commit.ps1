# Pre-commit hook to automatically manage PDFs:
# 1. Unstage generated PDFs (those with matching .tex files)
# 2. Keep reference PDFs (those without matching .tex files)

Write-Host "Checking PDFs..." -ForegroundColor Cyan

# Get all staged PDFs
$stagedPdfs = git diff --cached --name-only | Where-Object { $_ -match '\.pdf$' }

foreach ($pdfFile in $stagedPdfs) {
    $texFile = $pdfFile -replace '\.pdf$', '.tex'
    
    # Check if matching .tex file exists
    $texExists = Test-Path $texFile
    if (-not $texExists) {
        # Check if it's tracked in git
        $gitCheck = git ls-files --error-unmatch $texFile 2>&1
        $texExists = $LASTEXITCODE -eq 0
    }
    
    if ($texExists) {
        Write-Host "Unstaging generated PDF: $pdfFile (matches .tex file)" -ForegroundColor Yellow
        git reset HEAD $pdfFile 2>&1 | Out-Null
    } else {
        Write-Host "Keeping reference PDF: $pdfFile" -ForegroundColor Green
    }
}

Write-Host "PDF check complete." -ForegroundColor Cyan
exit 0
