param(
    [ValidateSet('Game', 'Editor', 'Workbench', 'Test')][string]$Mode = 'Game',
    [string]$GodotPath = ''
)
$ErrorActionPreference = 'Stop'
$projectDir = $PSScriptRoot
$repoDir = Split-Path -Parent $projectDir
if (-not $GodotPath) {
    $cached = Join-Path $repoDir '.tools/godot-4.6/Godot_v4.6-stable_mono_win64/Godot_v4.6-stable_mono_win64_console.exe'
    if (Test-Path -LiteralPath $cached) { $GodotPath = $cached }
    else {
        $command = Get-Command godot -ErrorAction SilentlyContinue
        if ($command) { $GodotPath = $command.Source }
        else { throw 'Godot 4.6 was not found. Pass -GodotPath with the executable path.' }
    }
}
$logDir = Join-Path $repoDir '.tools'
New-Item -ItemType Directory -Path $logDir -Force | Out-Null
$baseArguments = @('--path', $projectDir, '--log-file', (Join-Path $logDir 'godot-run.log'))
if ($Mode -ne 'Editor') {
    & $GodotPath @baseArguments --headless --editor --import
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    $importLog = Get-Content -LiteralPath (Join-Path $logDir 'godot-run.log') -Raw
    if ($importLog -match 'SCRIPT ERROR:') { throw 'Godot asset import or script validation failed.' }
}
if ($Mode -eq 'Test') {
    foreach ($test in @('test_port', 'test_ui', 'test_campaign', 'test_guilds', 'test_dungeon', 'test_combat', 'test_battle')) {
        & $GodotPath @baseArguments --headless --script "tests/$test.gd"
        if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
        $log = Get-Content -LiteralPath (Join-Path $logDir 'godot-run.log') -Raw
        if ($log -match 'SCRIPT ERROR:') { throw "Godot script failure in $test" }
    }
    exit 0
}
if ($Mode -eq 'Editor') { & $GodotPath @baseArguments --editor; exit $LASTEXITCODE }
if ($Mode -eq 'Workbench') { & $GodotPath @baseArguments 'res://ui/main.tscn'; exit $LASTEXITCODE }
$saveDir = Join-Path $projectDir 'Saves'
New-Item -ItemType Directory -Path $saveDir -Force | Out-Null
Set-Content -LiteralPath (Join-Path $saveDir '.gdignore') -Value '' -NoNewline
& $GodotPath @baseArguments -- "--save-dir=$saveDir"
exit $LASTEXITCODE
