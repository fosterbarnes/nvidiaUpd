param([ValidateSet('x64', 'arm64')][string]$Architecture)

#requires -Version 7.0
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$installerFolder = "$repoRoot\.installer"
$installerOutput = "$installerFolder\Output"
$ISCC = 'C:\Program Files (x86)\Inno Setup 6\ISCC.exe'

$scripts = @{
    x64   = "$installerFolder\nvidiaUpd.x64.installer.iss"
    arm64 = "$installerFolder\nvidiaUpd.arm64.installer.iss"
}

$required = @(
    "$repoRoot\icon.ico"
    "$repoRoot\LICENSE"
    "$installerFolder\nvidiaUpd.installer.template.iss"
    "$installerFolder\nvidiaUpd.installer.code.iss"
)
foreach ($path in $required) {
    if (-not (Test-Path -LiteralPath $path)) { throw "Required file not found: $path" }
}
if (-not (Test-Path -LiteralPath $ISCC)) { throw "Inno Setup compiler not found: $ISCC" }

$targets = if ($Architecture) { @($Architecture) } else { @('x64', 'arm64') }
if (-not $Architecture) {
    Write-Host 'Clearing old installers...'
    Remove-Item $installerOutput -Recurse -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType Directory -Path $installerOutput -Force | Out-Null

Set-Location -LiteralPath $installerFolder
foreach ($arch in $targets) {
    $iss = $scripts[$arch]
    Write-Host "Building $arch installer..."
    & $ISCC $iss
    if ($LASTEXITCODE) { throw "ISCC failed ($LASTEXITCODE): $iss" }
}
Write-Host "Done. Output: $installerOutput"
