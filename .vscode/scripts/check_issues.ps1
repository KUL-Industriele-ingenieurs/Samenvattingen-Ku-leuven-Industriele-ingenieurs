# Find common issue markers in .tex files and print as compiler-like warnings
Get-ChildItem -Recurse -Filter '*.tex' -ErrorAction SilentlyContinue |
  Select-String -Pattern '@issue|@todo|TODO|FIXME' |
  ForEach-Object { Write-Output ($_.Path + ':' + $_.LineNumber + ':1: warning: ' + ($_.Line.Trim())) }