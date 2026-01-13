<#
.SYNOPSIS
  Find (and optionally delete) LaTeX auxiliary files across a workspace.

.DESCRIPTION
  Searches for common LaTeX auxiliary files (*.aux, *.log, *.toc, *.out, ...)
  under the specified path and prints a compact report. When run with
  -Delete the script will remove the matched files. The script supports
  PowerShell's built-in -WhatIf and -Confirm behaviour.

.PARAMETER Path
  Root path to search. Defaults to the current directory.

.PARAMETER Recurse
  When set (default) the search is recursive.

.PARAMETER Delete
  When set, matched files are deleted (subject to confirmation or -Force).

.PARAMETER Force
  When set together with -Delete, skip the interactive confirmation.

.PARAMETER Patterns
  Override file patterns to search for.

.EXAMPLE
  # Dry run (report matches only)
  .\latex_aux_check.ps1 -Path . -Recurse

  # Dry run with -WhatIf support
  .\latex_aux_check.ps1 -Path . -Recurse -WhatIf

  # Delete matches (interactive confirmation)
  .\latex_aux_check.ps1 -Path . -Recurse -Delete

  # Force delete without prompt
  .\latex_aux_check.ps1 -Path . -Recurse -Delete -Force

#>
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
  [Parameter(Position=0)]
  [string]$Path = (Get-Location).Path,

  [Parameter()]
  [switch]$Recurse,

  [Parameter()]
  [switch]$Delete = $false,

  [Parameter()]
  [switch]$Force = $false,

  [Parameter()]
  [string[]]$Patterns = @(
    '*.aux','*.log','*.out','*.toc','*.fdb_latexmk','*.fls','*.synctex.gz','*.synctex(busy)',
    '*.lof','*.lot','*.nav','*.snm','*.vrb','*.bbl','*.blg','*.bcf','*.run.xml','*.idx','*.ilg','*.ind',
    '*.bak','*.bak[0-9]','*.bak*','*.sav','*.auxlock'
  )

)

# Default handling for switch parameters: do not assign default back to the switch variable (avoids PSAvoidDefaultValueSwitchParameter)
if (-not $PSBoundParameters.ContainsKey('Recurse')) {
  $ShouldRecurse = $true
} else {
  $ShouldRecurse = [bool]$Recurse
}

function Get-Matches {
  param($Root, $Patterns, $Recurse)
  $matchList = @()
  foreach ($p in $Patterns) {
    try {
      if ($Recurse) {
        $items = Get-ChildItem -Path $Root -Filter $p -File -Recurse -ErrorAction SilentlyContinue
      } else {
        $items = Get-ChildItem -Path $Root -Filter $p -File -ErrorAction SilentlyContinue
      }
      if ($items) { $matchList += $items }
    } catch {
      Write-Verbose ("Pattern search failed for {0}: {1}" -f $p, $_.Exception.Message)
    }
  }
  return $matchList | Sort-Object FullName -Unique
}

# Normalize path
$RootPath = Resolve-Path -Path $Path -ErrorAction Stop
Write-Host ("Searching: {0}" -f $RootPath) -ForegroundColor Cyan

$found = Get-Matches -Root $RootPath -Patterns $Patterns -Recurse $ShouldRecurse

if (-not $found -or $found.Count -eq 0) {
  Write-Host "No LaTeX auxiliary files found." -ForegroundColor Green
  exit 0
}

# Output summary table
$grouped = $found | Group-Object DirectoryName | Sort-Object Count -Descending
Write-Host ("Found {0} files in {1} directories:`n" -f $found.Count, $grouped.Count) -ForegroundColor Yellow

foreach ($g in $grouped) {
  Write-Host ("[{0} files]  {1}" -f $g.Count, $g.Name)
  $g.Group | Select-Object @{Name='Name';Expression={$_.Name}}, @{Name='SizeKB';Expression={[math]::Round($_.Length/1KB,2)}}, @{Name='Modified';Expression={$_.LastWriteTime}} | Format-Table -AutoSize
  Write-Host ""
}


if (-not $Delete) {
  Write-Host "Run with -Delete to remove these files (script supports -WhatIf and -Confirm)." -ForegroundColor Cyan
  exit 0
}

# Deletion flow
if ($Delete) {
  $count = $found.Count
  if (-not $Force) {
    $confirm = Read-Host "Delete $count files? Type 'yes' to confirm"
    if ($confirm -ne 'yes') {
      Write-Host "Aborting delete." -ForegroundColor Red
      exit 1
    }
  }

  foreach ($f in $found) {
    $target = $f.FullName
    if ($PSCmdlet.ShouldProcess($target, 'Delete')) {
      try {
        Remove-Item -LiteralPath $target -Force -ErrorAction SilentlyContinue
        Write-Host "Deleted: $target" -ForegroundColor Green
      } catch {
        Write-Warning "Failed to delete $target : $_"
      }
    }
  }
  Write-Host "Deletion complete." -ForegroundColor Green
}
