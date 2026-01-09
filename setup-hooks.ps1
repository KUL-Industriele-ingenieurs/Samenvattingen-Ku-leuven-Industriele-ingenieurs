# Git Hooks Setup Script
# Run this once after cloning the repository

Write-Host "Setting up git hooks..." -ForegroundColor Cyan

# Configure git to use .githooks directory
git config core.hooksPath .githooks

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Git hooks configured successfully!" -ForegroundColor Green
    Write-Host "  Pre-commit hook will automatically filter out generated PDFs." -ForegroundColor Gray
} else {
    Write-Host "✗ Failed to configure git hooks" -ForegroundColor Red
    exit 1
}
