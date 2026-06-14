param(
    [switch]$NoSelfUpdate
)

# --- Configuration ---
$scriptVersion = "1.2.0"
$repo = "KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs"
$apiBase = "https://api.github.com/repos/$repo"
$rawBase = "https://raw.githubusercontent.com/$repo/MAIN"
$selfPath = $MyInvocation.MyCommand.Definition
$selfName = Split-Path -Leaf $selfPath
$targetDir = Split-Path -Parent $selfPath
$yearFolders = @('1ste jaar', '2de jaar', '3de jaar', '4de jaar master')

# --- UI helpers ---
function Write-Banner {
    Write-Host ""
    Write-Host "  +----------------------------------------------+" -ForegroundColor Cyan
    Write-Host "  |   KU Leuven Samenvattingen - PDF Sync        |" -ForegroundColor Cyan
    Write-Host ("  |   script v{0,-35}|" -f $scriptVersion) -ForegroundColor Cyan
    Write-Host "  +----------------------------------------------+" -ForegroundColor Cyan
    Write-Host ""
}

function Format-Size([long]$bytes) {
    $units = 'B', 'KB', 'MB', 'GB', 'TB'; $i = 0; $b = [double]$bytes
    while ($b -ge 1024 -and $i -lt 4) { $b /= 1024; $i++ }
    if ($i -eq 0) { return "$([int]$b) $($units[$i])" }
    return ("{0:N1} {1}" -f $b, $units[$i])
}

function Write-Rule { Write-Host "  ------------------------------------------------" -ForegroundColor DarkGray }

# --- Self-update: fetch the latest version of this script, show what changed ---
function Invoke-SelfUpdate {
    if ($NoSelfUpdate) { return }
    Write-Host "  Checking for script updates... " -ForegroundColor Cyan -NoNewline
    try {
        $latest = (Invoke-WebRequest -Uri "$rawBase/$selfName" -UseBasicParsing -ErrorAction Stop).Content
    } catch {
        Write-Host "offline, skipped" -ForegroundColor DarkGray; return
    }
    if ([string]::IsNullOrEmpty($latest)) { Write-Host "skipped" -ForegroundColor DarkGray; return }

    $current = Get-Content -Raw -Path $selfPath
    if ($current.Replace("`r`n", "`n") -eq $latest.Replace("`r`n", "`n")) {
        Write-Host "up to date" -ForegroundColor Green; return
    }

    Write-Host "update available!" -ForegroundColor Yellow
    Write-Host "  What changed in $selfName:" -ForegroundColor DarkGray
    Write-Rule
    $git = Get-Command git -ErrorAction SilentlyContinue
    if ($git) {
        $tmp = Join-Path ([System.IO.Path]::GetTempPath()) "update_latest.ps1"
        Set-Content -Path $tmp -Value $latest -NoNewline
        git --no-pager diff --no-index --color=always -- $selfPath $tmp
        Remove-Item $tmp -ErrorAction SilentlyContinue
    } else {
        $diff = Compare-Object ($current -split "`n") ($latest -split "`n")
        foreach ($d in $diff) {
            if ($d.SideIndicator -eq "=>") { Write-Host ("  + " + $d.InputObject) -ForegroundColor Green }
            else { Write-Host ("  - " + $d.InputObject) -ForegroundColor Red }
        }
    }
    Write-Rule
    Set-Content -Path $selfPath -Value $latest -NoNewline
    Write-Host "  Updated to the latest version. Re-running..." -ForegroundColor Green
    Write-Host ""
    & $selfPath -NoSelfUpdate
    exit $LASTEXITCODE
}

# =====================================================================
Write-Banner
Invoke-SelfUpdate

# Step 1: Build filename -> year folder mapping from the repo tree
Write-Host "  Fetching document list... " -ForegroundColor Cyan -NoNewline
try {
    $treeData = Invoke-RestMethod -Uri "$apiBase/git/trees/MAIN?recursive=1" -Method Get -ErrorAction Stop
} catch {
    Write-Host "failed" -ForegroundColor Red; Write-Error "Could not fetch repo tree."; exit 1
}

$yearMap = @{}
foreach ($item in $treeData.tree) {
    $parts = $item.path -split '/'
    if ($parts.Count -lt 2) { continue }
    $year = $parts[0]
    if ($year -notin $yearFolders) { continue }
    $fname = [System.IO.Path]::GetFileName($item.path)
    $ext = [System.IO.Path]::GetExtension($fname)
    if ($ext -notin @('.tex', '.typ')) { continue }
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($fname)
    $pdfName = $stem.Replace(' ', '_').Replace('&', '.') + '.pdf'
    if (-not $yearMap.ContainsKey($pdfName)) { $yearMap[$pdfName] = $year }
}
Write-Host "$($yearMap.Count) documents" -ForegroundColor Green

# Step 2: Fetch release data
Write-Host "  Fetching release... " -ForegroundColor Cyan -NoNewline
try {
    $releaseData = Invoke-RestMethod -Uri "$apiBase/releases/tags/latest" -Method Get -ErrorAction Stop
} catch {
    Write-Host "failed" -ForegroundColor Red; Write-Error "Release 'latest' not found."; exit 1
}
$pdfAssets = @($releaseData.assets | Where-Object { $_.name -like "*.pdf" })
if ($pdfAssets.Count -eq 0) { Write-Error "No PDF assets found in the 'latest' release."; exit 1 }
$total = $pdfAssets.Count
Write-Host "$total PDFs" -ForegroundColor Green
Write-Host ""

# Step 3: Download each PDF into its year subfolder
$nDown = 0; $nOk = 0; $nFail = 0; $nMoved = 0; $bytesDown = 0L
$i = 0
foreach ($asset in $pdfAssets) {
    $i++
    $pdfName = $asset.name
    $remoteSize = [long]$asset.size
    Write-Progress -Activity "Syncing PDFs" -Status "$i/$total  $pdfName" -PercentComplete ([int](($i / $total) * 100))

    $yearFolder = $yearMap[$pdfName]
    if ($yearFolder) {
        $destDir = Join-Path $targetDir $yearFolder
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir | Out-Null }
        $displayPath = "$yearFolder/$pdfName"
    } else {
        $destDir = $targetDir
        $displayPath = $pdfName
    }
    $outputPath = Join-Path $destDir $pdfName

    # Migration: move file from old flat location if it exists there
    $oldPath = Join-Path $targetDir $pdfName
    if ($destDir -ne $targetDir -and (Test-Path $oldPath) -and -not (Test-Path $outputPath)) {
        Move-Item -Path $oldPath -Destination $outputPath -Force
        $nMoved++
        Write-Host "  -> moved $displayPath" -ForegroundColor Blue
    }

    # Check if download is needed (compare file size)
    if (Test-Path $outputPath) {
        if ((Get-Item $outputPath).Length -eq $remoteSize) {
            $nOk++
            Write-Host "  v $displayPath  (up to date)" -ForegroundColor DarkGray
            continue
        }
    }

    try {
        Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $outputPath -ErrorAction Stop
        $nDown++; $bytesDown += $remoteSize
        Write-Host "  v $displayPath  ($(Format-Size $remoteSize))" -ForegroundColor Green
    } catch {
        $nFail++
        Write-Host "  x $displayPath  (download failed)" -ForegroundColor Red
    }
}
Write-Progress -Activity "Syncing PDFs" -Completed

# --- Summary ---
Write-Host ""
Write-Rule
Write-Host "  $nDown downloaded" -ForegroundColor Green -NoNewline
Write-Host " - $nOk up-to-date" -ForegroundColor DarkGray -NoNewline
if ($nMoved -gt 0) { Write-Host " - $nMoved moved" -ForegroundColor Blue -NoNewline }
if ($nFail -gt 0) { Write-Host " - $nFail failed" -ForegroundColor Red } else { Write-Host " - 0 failed" -ForegroundColor Green }
if ($bytesDown -gt 0) { Write-Host "  Downloaded $(Format-Size $bytesDown) this run." -ForegroundColor DarkGray }
Write-Rule
Write-Host "  Done! PDFs organized by year folder." -ForegroundColor White

# --- Recent changes (who contributed what) ---
$commitCount = 15
Write-Host ""
Write-Host "  Recent changes (last $commitCount commits)" -ForegroundColor Cyan
Write-Rule
try {
    $commits = Invoke-RestMethod -Uri "$apiBase/commits?sha=MAIN&per_page=$commitCount" -Method Get -ErrorAction Stop
    foreach ($c in $commits) {
        $sha = $c.sha.Substring(0, 7)
        $author = $c.commit.author.name
        $msg = ($c.commit.message -split "`n")[0]
        if ($msg.Length -gt 60) { $msg = $msg.Substring(0, 57) + '...' }
        Write-Host "  $sha " -ForegroundColor Yellow -NoNewline
        Write-Host ("{0,-18} " -f $author) -ForegroundColor DarkGray -NoNewline
        Write-Host $msg
    }
} catch {
    Write-Host "  (could not load commit history - offline?)" -ForegroundColor DarkGray
}
Write-Rule

# --- Contribute call-to-action ---
Write-Host ""
Write-Host "  Found a mistake or want to add your own notes?" -ForegroundColor Green
Write-Host "     Contributions are very welcome! Open a pull request or issue:"
Write-Host "     https://github.com/$repo" -ForegroundColor Blue
Write-Host ""
