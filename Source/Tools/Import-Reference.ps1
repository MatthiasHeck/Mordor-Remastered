$ErrorActionPreference = 'Stop'
$sourceRoot = Split-Path -Parent $PSScriptRoot
$researchRoot = Join-Path (Split-Path -Parent $sourceRoot) 'research/local-original'
$dataRoot = Join-Path $sourceRoot 'Data'
$tables = @('races-local.csv','guilds-local.csv','spells-local.csv','guild-spell-access-local.csv',
 'items-local.csv','monsters-local.csv','item-subtypes-local.csv','item-classes-local.csv',
 'monster-types-local.csv','monster-subtypes-local.csv','item-spell-links-local.csv',
 'dungeon-cells-local.csv','dungeon-floors-local.csv','dungeon-areas-local.csv',
 'dungeon-teleporters-local.csv','dungeon-chutes-local.csv','enum-labels-decompiled.csv')
$entries = foreach ($table in $tables) {
    $inputPath = Join-Path $researchRoot $table
    $outputPath = Join-Path $dataRoot $table
    Copy-Item -LiteralPath $inputPath -Destination $outputPath
    Set-Content -LiteralPath ($outputPath + '.import') -Value '[remap]','', 'importer="keep"'
    [ordered]@{ file=$table; source="research/local-original/$table";
        sha256=(Get-FileHash -LiteralPath $outputPath -Algorithm SHA256).Hash.ToLowerInvariant();
        records=@(Import-Csv -LiteralPath $outputPath).Count }
}
$manifest = [ordered]@{
    schema=1; design_version='1.3'; ruleset='reference-prototype-v1';
    evidence='Extracted file facts and static decompiler candidates. Runtime parity is unverified.';
    executable_sha256='bd1332c37eb9d6a024d95ba1b70daf03c1a6c64c622964fb3d8bcc6297d06309';
    files=@($entries)
}
$manifest | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $dataRoot 'manifest.json') -Encoding utf8
Write-Output "Preserved $($tables.Count) reference tables without rewriting CSV bytes."
