param(
    [string]$GodotPath = $env:GODOT4,
    [switch]$Editor,
    [switch]$Test,
    [switch]$SmokeTest,
    [switch]$Headless
)
$ErrorActionPreference = 'Stop'
$env:DOTNET_CLI_TELEMETRY_OPTOUT = '1'
$env:DOTNET_CLI_HOME = Join-Path $PSScriptRoot '.dotnet'
$env:NUGET_PACKAGES = Join-Path $PSScriptRoot '.nuget'
$dotnetCommand = Get-Command dotnet -ErrorAction SilentlyContinue
$dotnetPath = if ($dotnetCommand) { $dotnetCommand.Source } else { 'C:\Program Files\dotnet\dotnet.exe' }
if (!(Test-Path -LiteralPath $dotnetPath)) { throw 'Install .NET SDK 8 or later, then run Start.ps1 again.' }

if ($Test) {
    & $dotnetPath run --project (Join-Path $PSScriptRoot 'Tests/Mordor.Tests.csproj') -- $PSScriptRoot
    if ($LASTEXITCODE -ne 0) { throw 'Regression tests failed.' }
    exit 0
}

if (!$GodotPath) {
    $GodotPath = Join-Path (Split-Path -Parent $PSScriptRoot) '.tools/godot-4.6/Godot_v4.6-stable_mono_win64/Godot_v4.6-stable_mono_win64_console.exe'
}
if (!(Test-Path -LiteralPath $GodotPath)) {
    throw 'Godot 4.6 .NET was not found. Pass -GodotPath <path-to-Godot-.NET.exe>, or set GODOT4. See README.md.'
}

& $dotnetPath build (Join-Path $PSScriptRoot 'MordorRemastered.csproj') --nologo -p:NuGetAudit=false
if ($LASTEXITCODE -ne 0) { throw 'The Godot client build failed.' }
& $GodotPath --headless --path $PSScriptRoot --editor --import --quit
if ($LASTEXITCODE -ne 0) { throw 'Godot import failed.' }
$engineArgs = @('--path', $PSScriptRoot)
if ($Editor) { $engineArgs += '--editor' }
if ($Headless) { $engineArgs += '--headless' }
if ($SmokeTest) { $engineArgs += @('--', '--smoke-test') }
& $GodotPath @engineArgs
if ($LASTEXITCODE -ne 0) { throw 'Godot exited with an error.' }
