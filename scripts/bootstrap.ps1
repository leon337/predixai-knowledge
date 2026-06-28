$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RootDir = Split-Path -Parent $ScriptDir
Set-Location $RootDir

Write-Host ""
Write-Host "=== PredixAI Knowledge Hub Bootstrap ==="
Write-Host ""

$folders = @(
    "academy",
    "research",
    "articles",
    "books",
    "prompts",
    "templates",
    "assets",
    "cases",
    "agents",
    "tools",
    "ui",
    "ux",
    "lx",
    "roadmap",
    "foundation",
    "scripts"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null

    $readme = Join-Path $folder "README.md"

    if (!(Test-Path $readme)) {
        "# $folder`r`n`r`nPasta oficial da PredixAI Knowledge Hub para $folder." |
            Set-Content -Encoding UTF8 -Path $readme
    }
}

Write-Host "Pastas verificadas."

$foundationScript = Join-Path $ScriptDir "fill_foundation_full.ps1"

if (Test-Path $foundationScript) {
    & $foundationScript
    Write-Host "Documentos da fundacao atualizados."
} else {
    Write-Host "ERRO: scripts/fill_foundation_full.ps1 nao encontrado."
    exit 1
}

Write-Host ""
Write-Host "Bootstrap concluido com sucesso."