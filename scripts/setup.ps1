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
    "roadmap"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null

    $readme = Join-Path $folder "README.md"

    if (!(Test-Path $readme)) {
        "# $folder`r`n`r`nDocumentação da pasta $folder." | Out-File $readme -Encoding utf8
    }
}

Write-Host ""
Write-Host "✅ Estrutura criada com sucesso!"