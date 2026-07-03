$scriptDir = "$env:APPDATA\nvidiaUpd"
$scriptPath = "$scriptDir\nvidiaUpd.ps1"
New-Item -ItemType Directory -Path $scriptDir -Force | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/fosterbarnes/nvidiaUpd/refs/heads/main/nvidiaUpd.ps1" -OutFile $scriptPath
if (!(Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force | Out-Null }
$functionBlock = @"
function nvidiaUpd { & "$scriptPath" }
Set-Alias -Name nvupd -Value nvidiaUpd -Force
Set-Alias -Name nvidiaupdate -Value nvidiaUpd -Force
"@
$existing = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
if ($existing -notmatch "function nvidiaUpd") { Add-Content -Path $PROFILE -Value "`n$functionBlock" }
. $PROFILE; Write-Host "Done! Restart pwsh and run 'nvupd' to update"
