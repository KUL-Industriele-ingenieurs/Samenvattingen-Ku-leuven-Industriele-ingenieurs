# Pre-commit hook to automatically manage PDFs and enforce branch rules
# 1. Block commits to protected branches (main, alpha)
# 2. Unstage generated PDFs (those with matching .tex files)
# 3. Keep reference PDFs (those without matching .tex files)

# --- 1. Enforce Branch Rules ---
$currentBranch = git rev-parse --abbrev-ref HEAD
$protectedBranches = @('main', 'master', 'alpha')

if ($protectedBranches -contains $currentBranch) {
    Write-Host "🛑 ERROR: Direct commits to '$currentBranch' are not allowed!" -ForegroundColor Red
    Write-Host "--------------------------------------------------------" -ForegroundColor Red
    Write-Host "Please create your own branch to make changes:" -ForegroundColor Yellow
    Write-Host "  git checkout -b my-feature-branch" -ForegroundColor White
    Write-Host "--------------------------------------------------------" -ForegroundColor Red
    exit 1
}

# --- 2. Manage PDFs ---
Write-Host "Checking PDFs..." -ForegroundColor Cyan

# Use NUL-separated names to handle filenames safely
$stagedRaw = git diff --cached --name-only -z
if ($stagedRaw) {
    $stagedPdfs = ($stagedRaw -split "`0") | Where-Object { $_ -match '\.pdf$' }
    $unstagedAny = $false

    foreach ($pdfFile in $stagedPdfs) {
        if ([string]::IsNullOrWhiteSpace($pdfFile)) { continue }

        $texFile = [System.IO.Path]::ChangeExtension($pdfFile, '.tex')
        $typFile = [System.IO.Path]::ChangeExtension($pdfFile, '.typ')
        
        if ((Test-Path $texFile) -or (Test-Path $typFile)) {
            $matchingFile = if (Test-Path $texFile) { ".tex" } else { ".typ" }
            Write-Host "Unstaging generated PDF: $pdfFile (matches $matchingFile file)" -ForegroundColor Yellow
            git reset HEAD -- $pdfFile 2>&1 | Out-Null
            $unstagedAny = $true
        } else {
            Write-Host "Keeping reference PDF: $pdfFile" -ForegroundColor Green
        }
    }

    if ($unstagedAny) {
        Write-Host "🛑 ERROR: Generated PDFs were staged and have been unstaged. Please review the unstaged PDFs and commit again without them." -ForegroundColor Red
        exit 1
    }
}

Write-Host "PDF check complete." -ForegroundColor Cyan
exit 0
