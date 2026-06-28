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
    throw "Arquivo Markdown nao encontrado: $SourceMd"
}

function Convert-MarkdownSimple {
    param([string]$Markdown)

    $lines = $Markdown -split "`r?`n"
    $html = ""
    $inList = $false

    foreach ($line in $lines) {
        $safe = [System.Net.WebUtility]::HtmlEncode($line)

        if ($line.Trim() -eq "") {
            if ($inList) {
                $html += "</ul>`n"
                $inList = $false
            }
            continue
        }

        if ($line -match "^# (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<h1>$([System.Net.WebUtility]::HtmlEncode($Matches[1]))</h1>`n"
        }
        elseif ($line -match "^## (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<h2>$([System.Net.WebUtility]::HtmlEncode($Matches[1]))</h2>`n"
        }
        elseif ($line -match "^### (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<h3>$([System.Net.WebUtility]::HtmlEncode($Matches[1]))</h3>`n"
        }
        elseif ($line -match "^---+$") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<hr />`n"
        }
        elseif ($line -match "^> (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<blockquote>$([System.Net.WebUtility]::HtmlEncode($Matches[1]))</blockquote>`n"
        }
        elseif ($line -match "^- \[x\] (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li>✅ $([System.Net.WebUtility]::HtmlEncode($Matches[1]))</li>`n"
        }
        elseif ($line -match "^- \[ \] (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li>⬜ $([System.Net.WebUtility]::HtmlEncode($Matches[1]))</li>`n"
        }
        elseif ($line -match "^- (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li>$([System.Net.WebUtility]::HtmlEncode($Matches[1]))</li>`n"
        }
        else {
            if ($inList) {
                $html += "</ul>`n"
                $inList = $false
            }
            $html += "<p>$safe</p>`n"
        }
    }

    if ($inList) {
        $html += "</ul>`n"
    }

    return $html
}

New-Item -ItemType Directory -Force -Path "docs/academy/$LessonSlug" | Out-Null
New-Item -ItemType Directory -Force -Path "docs/downloads" | Out-Null
New-Item -ItemType Directory -Force -Path "media/social-packs" | Out-Null

$markdown = Get-Content $SourceMd -Raw
$DestMd = "docs/academy/$LessonSlug/$LessonSlug.md"
Set-Content -Encoding UTF8 -Path $DestMd -Value $markdown

$meta = [ordered]@{
    slug = $LessonSlug
    title = $LessonTitle
    module = $ModuleTitle
    status = "Publicado"
}

$meta | ConvertTo-Json | Set-Content -Encoding UTF8 -Path "docs/academy/$LessonSlug/meta.json"

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

    .lesson-actions {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
      margin-bottom: 18px;
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
    <section class="panel lesson-actions">
      <a class="button" href="../../downloads/$LessonSlug.pdf">Baixar PDF</a>
      <a class="button" href="quiz.html">Fazer Quiz</a>
      <a class="button" href="social-pack.md">Social Pack</a>
    </section>

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

Set-Content -Encoding UTF8 -Path "docs/academy/$LessonSlug/index.html" -Value $lessonHtml

$quizMatches = [regex]::Matches($markdown, '(?ms)^###\s*(\d+)\.\s*(.+?)\r?\n\r?\n(.*?)(?:\r?\n\r?\nResposta correta:\s*([A-E]))')
$questions = @()

foreach ($match in $quizMatches) {
    $options = @()
    $optionMatches = [regex]::Matches($match.Groups[3].Value, '(?m)^([A-E])\)\s*(.+)$')

    foreach ($option in $optionMatches) {
        $options += [ordered]@{
            letter = $option.Groups[1].Value
            text = $option.Groups[2].Value
        }
    }

    $questions += [ordered]@{
        number = $match.Groups[1].Value
        question = $match.Groups[2].Value
        options = $options
        answer = $match.Groups[4].Value
    }
}

$quizJson = $questions | ConvertTo-Json -Depth 10

$quizHtml = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quiz - $LessonTitle</title>
  <link rel="stylesheet" href="../../styles.css" />
  <style>
    .quiz-card {
      background: #FFFFFF;
      border: 1px solid #CBD5E1;
      border-radius: 18px;
      padding: 22px;
      margin-bottom: 16px;
      box-shadow: 0 8px 20px rgba(15, 23, 42, 0.08);
    }

    .option {
      display: block;
      margin: 10px 0;
      padding: 12px;
      border: 1px solid #CBD5E1;
      border-radius: 12px;
      cursor: pointer;
    }

    .result {
      font-weight: bold;
      margin-top: 18px;
      font-size: 20px;
      color: #0F172A;
    }
  </style>
</head>

<body>
  <header>
    <div class="badge">Quiz</div>
    <h1>$LessonTitle</h1>
    <p>Teste de aprendizagem da Academia PredixAI</p>
  </header>

  <nav>
    <a href="../../index.html">Home</a>
    <a href="../../academy.html">Academy</a>
    <a href="index.html">Voltar para aula</a>
  </nav>

  <main>
    <form id="quiz"></form>
    <button class="button" onclick="checkQuiz()">Corrigir Quiz</button>
    <div class="result" id="result"></div>
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>

  <script>
    const quizData = $quizJson;
    const form = document.getElementById("quiz");

    quizData.forEach((item, index) => {
      const card = document.createElement("section");
      card.className = "quiz-card";

      let html = "<h3>" + item.number + ". " + item.question + "</h3>";

      item.options.forEach(option => {
        html += "<label class='option'>";
        html += "<input type='radio' name='q" + index + "' value='" + option.letter + "'> ";
        html += option.letter + ") " + option.text;
        html += "</label>";
      });

      card.innerHTML = html;
      form.appendChild(card);
    });

    function checkQuiz() {
      let score = 0;

      quizData.forEach((item, index) => {
        const selected = document.querySelector("input[name='q" + index + "']:checked");

        if (selected && selected.value === item.answer) {
          score++;
        }
      });

      document.getElementById("result").innerText =
        "Resultado: " + score + " de " + quizData.length + " acertos.";
    }
  </script>
</body>
</html>
"@

Set-Content -Encoding UTF8 -Path "docs/academy/$LessonSlug/quiz.html" -Value $quizHtml

$socialPack = @"
# Social Pack - $LessonTitle

## Objetivo

Transformar a aula em conteudo para redes sociais, captacao de audiencia e distribuicao da PredixAI Academy.

---

## Post 1

Engenharia reversa de conhecimento nao e copiar.

E estudar algo pronto, entender a logica e transformar isso em conhecimento reutilizavel.

---

## Post 2

A maioria das pessoas consome conteudo.

A PredixAI transforma conteudo em sistema.

---

## Carrossel Instagram

### Slide 1
Voce estuda ou apenas consome conteudo?

### Slide 2
Engenharia reversa de conhecimento e aprender desmontando a logica.

### Slide 3
Primeiro entenda o objetivo.

### Slide 4
Depois entenda a estrutura.

### Slide 5
Depois identifique decisoes importantes.

### Slide 6
Por fim, transforme em aula, PDF, agente ou produto.

### Slide 7
PredixAI Knowledge Hub: conhecimento que vira produto.

---

## Roteiro de Short

Gancho:
Voce nao precisa apenas assistir aulas. Voce precisa aprender a desmontar conhecimento.

Desenvolvimento:
Quando voce ve um repositorio, video ou ferramenta, pergunte: qual problema isso resolve? Como foi construido? O que posso aplicar?

Fechamento:
Esse e o metodo da PredixAI: estudar uma vez, documentar e reutilizar varias vezes.

---

## CTA

Baixe a Aula 01 gratuita da Academia PredixAI.
"@

Set-Content -Encoding UTF8 -Path "media/social-packs/$LessonSlug.md" -Value $socialPack
Set-Content -Encoding UTF8 -Path "docs/academy/$LessonSlug/social-pack.md" -Value $socialPack

$lessonBody = Convert-MarkdownSimple -Markdown $markdown

$printHtml = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <title>$LessonTitle</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      color: #111827;
      line-height: 1.6;
      max-width: 900px;
      margin: 40px auto;
      padding: 0 24px;
    }

    h1, h2, h3 {
      color: #0F172A;
    }

    h1 {
      border-bottom: 3px solid #2563EB;
      padding-bottom: 12px;
    }

    blockquote {
      border-left: 4px solid #10B981;
      background: #ECFDF5;
      padding: 10px 14px;
      border-radius: 8px;
    }

    hr {
      border: 0;
      border-top: 1px solid #CBD5E1;
      margin: 28px 0;
    }

    li {
      margin-bottom: 6px;
    }
  </style>
</head>
<body>
$lessonBody
</body>
</html>
"@

$PrintPath = "docs/academy/$LessonSlug/print.html"
Set-Content -Encoding UTF8 -Path $PrintPath -Value $printHtml

$browserCandidates = @(
    "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
    "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
    "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
)

$browser = $browserCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1

if (!$browser) {
    throw "Nenhum navegador Edge/Chrome encontrado para gerar PDF."
}

$pdfPath = (Join-Path (Resolve-Path "docs/downloads").Path "$LessonSlug.pdf")
$printUrl = (New-Object System.Uri((Resolve-Path $PrintPath).Path)).AbsoluteUri

& $browser --headless --disable-gpu "--print-to-pdf=$pdfPath" $printUrl | Out-Host

if (!(Test-Path $pdfPath)) {
    throw "PDF nao foi gerado."
}

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
        <li>Revisar PDF da aula.</li>
        <li>Validar quiz interativo.</li>
        <li>Distribuir social pack.</li>
        <li>Preparar proxima aula.</li>
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
$status = git status --porcelain

if ($status) {
    git commit -m "feat: build full lesson package $LessonSlug"
    git push
}
else {
    Write-Host "Sem alteracoes para publicar."
}

Write-Host "Pacote completo da aula gerado com sucesso."
