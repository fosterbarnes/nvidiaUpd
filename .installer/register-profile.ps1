param(
    [Parameter(Mandatory)]
    [string]$ScriptPath
)

if (!(Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force | Out-Null }
$functionBlock = @"
function nvidiaUpd { & "$ScriptPath" }
Set-Alias -Name nvupd -Value nvidiaUpd -Force
Set-Alias -Name nvidiaupdate -Value nvidiaUpd -Force
"@
$existing = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
if ($existing -notmatch "function nvidiaUpd") { Add-Content -Path $PROFILE -Value "`n$functionBlock" }
