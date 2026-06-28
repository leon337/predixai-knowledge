param(
    [Parameter(Mandatory=$true)]
    [string]$LessonSlug,

    [Parameter(Mandatory=$true)]
    [string]$LessonTitle,

    [Parameter(Mandatory=$true)]
    [string]$SourceMd,

    [string]$ModuleTitle = "Modulo 01 - Mentalidade do Arquiteto"
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RootDir = Split-Path -Parent $ScriptDir
Set-Location $RootDir

if (!(Test-Path $SourceMd)) {
    Write-Host "Arquivo Markdown nao encontrado: $SourceMd"
    exit 1
}

$LessonDir = "docs/academy/$LessonSlug"
New-Item -ItemType Directory -Force -Path $LessonDir | Out-Null

$DestMd = "$LessonDir/$LessonSlug.md"
Copy-Item $SourceMd $DestMd -Force

$meta = @{
    slug = $LessonSlug
    title = $LessonTitle
    module = $ModuleTitle
    status = "Publicado"
}

$meta | ConvertTo-Json | Set-Content -Encoding UTF8 -Path "$LessonDir/meta.json"

$lessonHtml = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$LessonTitle - PredixAI Academy</title>
  <link rel="stylesheet" href="../../styles.css" />
  <style>
    .lesson {
      background: #FFFFFF;
      border: 1px solid #CBD5E1;
      border-radius: 18px;
      padding: 24px;
      box-shadow: 0 8px 20px rgba(15, 23, 42, 0.08);
    }

    .lesson h1, .lesson h2, .lesson h3 {
      color: #0F172A;
    }

    .lesson p, .lesson li {
      color: #475569;
    }

    .lesson blockquote {
      border-left: 4px solid #10B981;
      padding: 10px 14px;
      color: #334155;
      background: #ECFDF5;
      border-radius: 10px;
    }
  </style>
</head>

<body>
  <header>
    <div class="badge">$ModuleTitle</div>
    <h1>$LessonTitle</h1>
    <p>Academia PredixAI</p>
  </header>

  <nav>
    <a href="../../index.html">Home</a>
    <a href="../../academy.html">Academy</a>
    <a href="../../foundation.html">Fundacao</a>
    <a href="../../research.html">Research</a>
  </nav>

  <main>
    <section class="lesson" id="content">
      Carregando aula...
    </section>
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
  <script>
    fetch("$LessonSlug.md")
      .then(response => response.text())
      .then(markdown => {
        document.getElementById("content").innerHTML = marked.parse(markdown);
      });
  </script>
</body>
</html>
"@

Set-Content -Encoding UTF8 -Path "$LessonDir/index.html" -Value $lessonHtml

$cards = ""

Get-ChildItem "docs/academy" -Directory | Sort-Object Name | ForEach-Object {
    $metaPath = Join-Path $_.FullName "meta.json"

    if (Test-Path $metaPath) {
        $lesson = Get-Content $metaPath -Raw | ConvertFrom-Json

        $cards += @"
      <div class="card">
        <h3>$($lesson.slug.ToUpper())</h3>
        <p>$($lesson.title)</p>
        <a href="academy/$($lesson.slug)/">Abrir aula</a>
      </div>

"@
    }
}

$academyHtml = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Academy - PredixAI Knowledge Hub</title>
  <link rel="stylesheet" href="styles.css" />
</head>

<body>
  <header>
    <div class="badge">Aprendizado continuo</div>
    <h1>Academy</h1>
    <p>Area oficial das aulas, modulos, quizzes, PDFs e trilhas da Academia PredixAI.</p>
  </header>

  <nav>
    <a href="index.html">Home</a>
    <a href="foundation.html">Fundacao</a>
    <a href="research.html">Research</a>
    <a href="academy.html">Academy</a>
    <a href="agents.html">Agents</a>
    <a href="media.html">Media</a>
    <a href="roadmap.html">Roadmap</a>
  </nav>

  <main>
    <section class="hero">
      <h2>Objetivo da area</h2>
      <p>Transformar conhecimento tecnico em aprendizado claro, guiado e validado por exercicios.</p>
    </section>

    <h2 class="section-title">$ModuleTitle</h2>
    <p class="section-subtitle">Trilha oficial da Academia PredixAI.</p>

    <section class="grid">
$cards
    </section>

    <section class="panel path">
      <h2>Proximos passos</h2>
      <ul>
        <li>Gerar PDF da aula.</li>
        <li>Criar quiz interativo.</li>
        <li>Criar pagina de download.</li>
        <li>Transformar a aula em conteudo social.</li>
      </ul>
    </section>
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>
</body>
</html>
"@

Set-Content -Encoding UTF8 -Path "docs/academy.html" -Value $academyHtml

git add .
git commit -m "chore: add lesson publishing automation"
git push

Write-Host "Aula publicada e Academy atualizada com sucesso."
