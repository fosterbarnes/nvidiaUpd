$scriptDir = "$env:APPDATA\nvidiaUpd"
$scriptPath = "$scriptDir\nvidiaUpd.ps1"
New-Item -ItemType Directory -Path $scriptDir -Force | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/fosterbarnes/nvidiaUpd/refs/heads/main/nvidiaUpd.ps1" -OutFile $scriptPath

$registerScript = Join-Path $env:TEMP 'nvidiaUpd-register-profile.ps1'
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/fosterbarnes/nvidiaUpd/refs/heads/main/.installer/register-profile.ps1" -OutFile $registerScript
& $registerScript -ScriptPath $scriptPath
. $PROFILE; Write-Host "Done! Restart pwsh and run 'nvupd' to update"
