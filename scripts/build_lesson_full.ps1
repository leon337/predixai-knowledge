param(
    [string]$LessonSlug = "aula-01",
    [string]$LessonTitle = "Aula 01 - Engenharia Reversa de Conhecimento",
    [string]$ModuleTitle = "Módulo 01 - Mentalidade do Arquiteto",
    [string]$SourceMd = "academy/modulo-01-mentalidade-do-arquiteto/aula-01/AULA_01.md"
)

$ErrorActionPreference = "Stop"
$RootDir = (Resolve-Path ".").Path
Set-Location $RootDir

function Write-Utf8NoBom {
    param([string]$Path, [string]$Text)

    $fullPath = Join-Path $RootDir $Path
    $dir = Split-Path -Parent $fullPath

    if ($dir -and !(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }

    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($fullPath, $Text, $utf8)
}

function Read-Utf8 {
    param([string]$Path)
    return [System.IO.File]::ReadAllText((Join-Path $RootDir $Path), [System.Text.Encoding]::UTF8)
}

function HtmlEncode {
    param([string]$Text)
    return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Test-BrokenEncoding {
    param([string]$Text)

    $replacement = [string][char]0xFFFD
    $badDash = ([string][char]0x00E2) + ([string][char]0x20AC)
    $badLatin1 = [regex]'(\u00C3[\u0080-\u00BF]|\u00C2[\u0080-\u00BF])'

    return (
        $Text.Contains($replacement) -or
        $Text.Contains($badDash) -or
        $badLatin1.IsMatch($Text)
    )
}

function Assert-CleanText {
    param([string]$Path, [string]$Text)

    if (Test-BrokenEncoding $Text) {
        throw "Erro real de encoding encontrado em: $Path"
    }
}

function Convert-MarkdownSimple {
    param([string]$Markdown)

    $lines = $Markdown -split "`r?`n"
    $html = ""
    $inList = $false

    foreach ($line in $lines) {
        $raw = $line.TrimEnd()

        if ($raw.Trim() -eq "") {
            if ($inList) {
                $html += "</ul>`n"
                $inList = $false
            }
            continue
        }

        if ($raw -match "^# (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<h1>$(HtmlEncode $Matches[1])</h1>`n"
        }
        elseif ($raw -match "^## (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<h2>$(HtmlEncode $Matches[1])</h2>`n"
        }
        elseif ($raw -match "^### (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<h3>$(HtmlEncode $Matches[1])</h3>`n"
        }
        elseif ($raw -match "^---+$") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<hr />`n"
        }
        elseif ($raw -match "^> (.+)") {
            if ($inList) { $html += "</ul>`n"; $inList = $false }
            $html += "<blockquote>$(HtmlEncode $Matches[1])</blockquote>`n"
        }
        elseif ($raw -match "^- \[x\] (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li><strong>Concluído:</strong> $(HtmlEncode $Matches[1])</li>`n"
        }
        elseif ($raw -match "^- \[ \] (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li><strong>Pendente:</strong> $(HtmlEncode $Matches[1])</li>`n"
        }
        elseif ($raw -match "^- (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li>$(HtmlEncode $Matches[1])</li>`n"
        }
        elseif ($raw -match "^\* (.+)") {
            if (!$inList) { $html += "<ul>`n"; $inList = $true }
            $html += "<li>$(HtmlEncode $Matches[1])</li>`n"
        }
        else {
            if ($inList) {
                $html += "</ul>`n"
                $inList = $false
            }

            $html += "<p>$(HtmlEncode $raw)</p>`n"
        }
    }

    if ($inList) {
        $html += "</ul>`n"
    }

    return $html
}

function CopyBlock {
    param(
        [string]$Id,
        [string]$Label,
        [string]$Title,
        [string]$Description,
        [string]$Text
    )

    $safeText = HtmlEncode $Text

    return @"
<section class="copy-card">
  <span class="copy-label">$Label</span>
  <h2>$Title</h2>
  <p>$Description</p>
  <textarea class="copy-box" id="$Id" readonly>$safeText</textarea>
  <div class="copy-actions">
    <button class="copy-btn" data-copy="$Id" onclick="copyText('$Id')">Copiar</button>
  </div>
</section>
"@
}

function New-CopyPage {
    param(
        [string]$Path,
        [string]$Badge,
        [string]$Title,
        [string]$Description,
        [string]$Body
    )

    $html = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$Title - PredixAI Academy</title>
  <link rel="stylesheet" href="../../styles.css" />
  <link rel="stylesheet" href="../../copy-tools.css" />
</head>

<body>
  <header>
    <div class="badge">$Badge</div>
    <h1>$Title</h1>
    <p>$Description</p>
  </header>

  <nav>
    <a href="../../index.html">Home</a>
    <a href="../../academy.html">Academy</a>
    <a href="index.html">Aula</a>
    <a href="quiz.html">Quiz</a>
    <a href="pdf.html">PDF</a>
    <a href="social-pack.html">Social Pack</a>
    <a href="podcast.html">Podcast</a>
  </nav>

  <main class="copy-page">
$Body
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>

  <script>
    function copyText(id) {
      const field = document.getElementById(id);
      field.focus();
      field.select();
      field.setSelectionRange(0, 999999);
      navigator.clipboard.writeText(field.value);

      const button = document.querySelector("[data-copy='" + id + "']");
      const original = button.innerText;
      button.innerText = "Copiado!";
      button.classList.add("success");

      setTimeout(() => {
        button.innerText = original;
        button.classList.remove("success");
      }, 1300);
    }
  </script>
</body>
</html>
"@

    Write-Utf8NoBom -Path $Path -Text $html
}

function Get-QuizFromMarkdown {
    param([string]$Markdown)

    $questions = @()
    $matches = [regex]::Matches($Markdown, '(?ms)^###\s*(\d+)\.\s*(.+?)\r?\n\r?\n(.*?)(?=\r?\n###\s*\d+\.|\r?\n##\s|\z)')

    foreach ($match in $matches) {
        $block = $match.Groups[3].Value
        $answerMatch = [regex]::Match($block, '(?m)^Resposta correta:\s*([A-E])')
        $optionMatches = [regex]::Matches($block, '(?m)^([A-E])\)\s*(.+)$')

        if ($answerMatch.Success -and $optionMatches.Count -gt 0) {
            $options = @()

            foreach ($opt in $optionMatches) {
                $options += [ordered]@{
                    letter = $opt.Groups[1].Value
                    text = $opt.Groups[2].Value
                }
            }

            $questions += [ordered]@{
                number = $match.Groups[1].Value
                question = $match.Groups[2].Value
                options = $options
                answer = $answerMatch.Groups[1].Value
            }
        }
    }

    if ($questions.Count -eq 0) {
        throw "Nenhuma pergunta de quiz foi encontrada no Markdown."
    }

    return $questions
}

Write-Host "== Fábrica PredixAI v3.2 =="

if (!(Test-Path $SourceMd)) {
    throw "Arquivo da aula não encontrado: $SourceMd"
}

$LessonDir = "docs/academy/$LessonSlug"

New-Item -ItemType Directory -Force -Path $LessonDir | Out-Null
New-Item -ItemType Directory -Force -Path "docs/downloads" | Out-Null
New-Item -ItemType Directory -Force -Path "media/prompts" | Out-Null
New-Item -ItemType Directory -Force -Path "media/social-packs" | Out-Null

$markdown = Read-Utf8 $SourceMd
Assert-CleanText -Path $SourceMd -Text $markdown

Write-Utf8NoBom -Path "$LessonDir/$LessonSlug.md" -Text $markdown

$lessonHtmlContent = Convert-MarkdownSimple $markdown

$copyCss = @"
.copy-page {
  max-width: 1100px;
  margin: 0 auto;
}

.copy-hero {
  background: linear-gradient(135deg, #0F172A, #1E293B);
  color: #FFFFFF;
  border-radius: 24px;
  padding: 32px;
  margin-bottom: 28px;
  box-shadow: 0 12px 32px rgba(15, 23, 42, 0.22);
}

.copy-hero h1 {
  margin: 0 0 12px;
  font-size: clamp(2rem, 5vw, 3.5rem);
  line-height: 1.05;
}

.copy-hero p {
  color: #E2E8F0;
  font-size: 1.08rem;
  max-width: 760px;
}

.copy-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 18px;
  margin-bottom: 26px;
}

.copy-card {
  background: #FFFFFF;
  border: 1px solid #CBD5E1;
  border-radius: 20px;
  padding: 22px;
  box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
  scroll-margin-top: 20px;
}

.copy-card h2,
.copy-card h3 {
  margin-top: 0;
  color: #0F172A;
}

.copy-card p {
  color: #475569;
}

.copy-label {
  display: inline-flex;
  align-items: center;
  background: #DBEAFE;
  color: #1D4ED8;
  border-radius: 999px;
  padding: 6px 12px;
  font-size: 0.82rem;
  font-weight: 700;
  margin-bottom: 10px;
}

.copy-box {
  width: 100%;
  min-height: 120px;
  resize: vertical;
  border: 1px solid #CBD5E1;
  border-radius: 16px;
  padding: 16px;
  background: #F8FAFC;
  color: #0F172A;
  font-size: 0.98rem;
  line-height: 1.55;
  font-family: Consolas, Monaco, 'Courier New', monospace;
  margin-top: 10px;
  box-sizing: border-box;
}

.copy-actions {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  margin-top: 12px;
}

.copy-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border: none;
  background: #2563EB;
  color: #FFFFFF;
  border-radius: 999px;
  padding: 11px 16px;
  font-weight: 800;
  cursor: pointer;
  text-decoration: none;
}

.copy-btn.secondary {
  background: #0F172A;
}

.copy-btn.success {
  background: #059669;
}

.platform-tabs {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  margin: 18px 0 24px;
}

.platform-pill {
  display: inline-flex;
  align-items: center;
  background: #FFFFFF;
  border: 1px solid #CBD5E1;
  color: #0F172A;
  border-radius: 999px;
  padding: 10px 14px;
  font-weight: 800;
  text-decoration: none;
}

.platform-pill:hover {
  background: #EFF6FF;
  border-color: #2563EB;
}

@media (min-width: 860px) {
  .copy-grid.two {
    grid-template-columns: repeat(2, 1fr);
  }

  .copy-grid.three {
    grid-template-columns: repeat(3, 1fr);
  }
}
"@

Write-Utf8NoBom -Path "docs/copy-tools.css" -Text $copyCss

$package = [ordered]@{
    slug = $LessonSlug
    title = $LessonTitle
    module = $ModuleTitle
    level = "Iniciante"
    status = "Publicado"
    version = "v3.2"
    language = "pt-BR"
    cta = "Acesse a aula completa, baixe o PDF e responda o quiz."
    platforms = @("YouTube Shorts", "Instagram", "TikTok", "LinkedIn", "X", "Podcast", "Carrossel")
    generated = @("index.html", "pdf.html", "quiz.html", "social-pack.html", "podcast.html", "video-prompts.html", "image-prompts.html", "carousel-prompts.html", "$LessonSlug.pdf")
}

$packageJson = $package | ConvertTo-Json -Depth 10
Write-Utf8NoBom -Path "academy/modulo-01-mentalidade-do-arquiteto/aula-01/lesson.package.json" -Text $packageJson
Write-Utf8NoBom -Path "$LessonDir/meta.json" -Text $packageJson

$indexHtml = @"
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
    <a href="../../foundation.html">Fundação</a>
    <a href="../../research.html">Research</a>
  </nav>

  <main>
    <section class="panel lesson-actions">
      <a class="button" href="pdf.html">Abrir PDF</a>
      <a class="button" href="quiz.html">Fazer Quiz</a>
      <a class="button" href="social-pack.html">Social Pack</a>
      <a class="button" href="podcast.html">Podcast</a>
      <a class="button" href="video-prompts.html">Vídeos</a>
      <a class="button" href="image-prompts.html">Imagens</a>
      <a class="button" href="carousel-prompts.html">Carrossel</a>
    </section>

    <section class="lesson">
$lessonHtmlContent
    </section>
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>
</body>
</html>
"@

Write-Utf8NoBom -Path "$LessonDir/index.html" -Text $indexHtml

$printHtml = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <title>$LessonTitle</title>
  <style>
    @page {
      size: A4;
      margin: 18mm 16mm;
    }

    body {
      font-family: Arial, Helvetica, sans-serif;
      color: #111827;
      line-height: 1.6;
      margin: 0;
      padding: 0;
      -webkit-print-color-adjust: exact;
      print-color-adjust: exact;
    }

    .cover {
      background: linear-gradient(135deg, #0F172A, #1E293B);
      color: white;
      border-radius: 18px;
      padding: 32px;
      margin-bottom: 28px;
    }

    .cover h1 {
      font-size: 32px;
      line-height: 1.12;
      margin: 0 0 10px;
      color: white;
    }

    .cover p {
      color: #E2E8F0;
      font-size: 15px;
      margin: 0;
    }

    h1, h2, h3 {
      color: #0F172A;
      page-break-after: avoid;
    }

    h1 {
      font-size: 26px;
      border-bottom: 3px solid #2563EB;
      padding-bottom: 8px;
    }

    h2 {
      font-size: 21px;
      margin-top: 26px;
    }

    h3 {
      font-size: 17px;
    }

    p, li {
      font-size: 13.5px;
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
      margin: 24px 0;
    }

    .footer-note {
      margin-top: 38px;
      padding: 16px;
      border-radius: 14px;
      background: #EFF6FF;
      color: #1E3A8A;
      font-weight: bold;
    }
  </style>
</head>

<body>
  <section class="cover">
    <h1>$LessonTitle</h1>
    <p>$ModuleTitle · Academia PredixAI · Material oficial em português do Brasil</p>
  </section>

$lessonHtmlContent

  <section class="footer-note">
    Continue estudando no PredixAI Knowledge Hub. Aula, quiz e materiais de publicação disponíveis na plataforma.
  </section>
</body>
</html>
"@

Write-Utf8NoBom -Path "$LessonDir/print.html" -Text $printHtml

$pdfBody = @"
<section class="copy-hero">
  <h1>PDF Premium da Aula 01</h1>
  <p>Material oficial para estudar, revisar e compartilhar a aula sobre Engenharia Reversa de Conhecimento.</p>
</section>

<section class="copy-grid two">
  <section class="copy-card">
    <span class="copy-label">Download</span>
    <h2>Baixar PDF</h2>
    <p>Baixe o material em PDF gerado sem cabeçalho e rodapé automático do navegador.</p>
    <div class="copy-actions">
      <a class="copy-btn" href="../../downloads/$LessonSlug.pdf">Baixar PDF</a>
      <a class="copy-btn secondary" href="index.html">Ler aula completa</a>
    </div>
  </section>

  <section class="copy-card">
    <span class="copy-label">Benefício</span>
    <h2>O que este PDF entrega</h2>
    <p>Você aprende a diferença entre copiar e estudar a lógica por trás de algo pronto, transformando isso em conhecimento reutilizável.</p>
  </section>
</section>
"@

New-CopyPage -Path "$LessonDir/pdf.html" -Badge "PDF Premium" -Title "PDF da Aula 01" -Description "Material de estudo da Academia PredixAI." -Body $pdfBody

$browserCandidates = @(
    "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
    "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
    "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
    "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
)

$browser = $browserCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1

if (!$browser) {
    throw "Edge ou Chrome não encontrado para gerar PDF."
}

$pdfPath = Join-Path (Resolve-Path "docs/downloads").Path "$LessonSlug.pdf"
$printUrl = (New-Object System.Uri((Resolve-Path "$LessonDir/print.html").Path)).AbsoluteUri

& $browser --headless=new --disable-gpu --no-pdf-header-footer --print-to-pdf-no-header "--print-to-pdf=$pdfPath" $printUrl | Out-Host

if (!(Test-Path $pdfPath)) {
    throw "PDF não foi gerado."
}

$quiz = Get-QuizFromMarkdown $markdown
$quizJson = $quiz | ConvertTo-Json -Depth 20

$quizHtml = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quiz - $LessonTitle</title>
  <link rel="stylesheet" href="../../styles.css" />
  <style>
    .quiz-shell {
      max-width: 920px;
      margin: 0 auto;
    }

    .progress-wrap {
      background: #E2E8F0;
      border-radius: 999px;
      overflow: hidden;
      height: 16px;
      margin: 20px 0;
    }

    .progress-bar {
      width: 0%;
      height: 100%;
      background: #2563EB;
      transition: width 0.25s ease;
    }

    .quiz-card {
      background: #FFFFFF;
      border: 1px solid #CBD5E1;
      border-radius: 20px;
      padding: 24px;
      box-shadow: 0 8px 20px rgba(15, 23, 42, 0.08);
    }

    .option-btn {
      width: 100%;
      border: 1px solid #CBD5E1;
      background: #F8FAFC;
      color: #0F172A;
      border-radius: 14px;
      padding: 14px;
      text-align: left;
      margin: 8px 0;
      cursor: pointer;
      font-size: 1rem;
      font-weight: 700;
    }

    .option-btn.correct {
      background: #DCFCE7;
      border-color: #22C55E;
      color: #166534;
    }

    .option-btn.wrong {
      background: #FEE2E2;
      border-color: #EF4444;
      color: #991B1B;
    }

    .feedback {
      margin-top: 16px;
      font-weight: 800;
      font-size: 1.1rem;
    }

    .score-box {
      background: #ECFDF5;
      border: 1px solid #A7F3D0;
      color: #065F46;
      border-radius: 20px;
      padding: 22px;
      margin-top: 18px;
      display: none;
    }
  </style>
</head>

<body>
  <header>
    <div class="badge">Quiz Gamificado</div>
    <h1>$LessonTitle</h1>
    <p>Teste seu aprendizado e avance na Academia PredixAI.</p>
  </header>

  <nav>
    <a href="../../index.html">Home</a>
    <a href="../../academy.html">Academy</a>
    <a href="index.html">Voltar para aula</a>
    <a href="pdf.html">PDF</a>
    <a href="social-pack.html">Social Pack</a>
  </nav>

  <main class="quiz-shell">
    <section class="panel">
      <h2 id="stepTitle">Questão 1</h2>
      <div class="progress-wrap">
        <div class="progress-bar" id="progressBar"></div>
      </div>
    </section>

    <section class="quiz-card" id="quizCard">
      <h2 id="questionText"></h2>
      <div id="options"></div>
      <div class="feedback" id="feedback"></div>
      <div style="margin-top: 16px;">
        <button class="button" id="nextBtn" onclick="nextQuestion()" style="display:none;">Próxima</button>
      </div>
    </section>

    <section class="score-box" id="scoreBox">
      <h2>Resultado final</h2>
      <p id="scoreText"></p>
      <div style="margin-top: 16px;">
        <a class="button" href="pdf.html">Revisar PDF</a>
        <a class="button" href="index.html">Voltar para aula</a>
      </div>
    </section>
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>

  <script>
    const quizData = $quizJson;
    let current = 0;
    let score = 0;
    let answered = false;

    function renderQuestion() {
      answered = false;
      document.getElementById("feedback").innerText = "";
      document.getElementById("nextBtn").style.display = "none";

      const item = quizData[current];
      document.getElementById("stepTitle").innerText = "Questão " + (current + 1) + " de " + quizData.length;
      document.getElementById("questionText").innerText = item.question;
      document.getElementById("progressBar").style.width = ((current) / quizData.length * 100) + "%";

      const options = document.getElementById("options");
      options.innerHTML = "";

      item.options.forEach(option => {
        const btn = document.createElement("button");
        btn.className = "option-btn";
        btn.innerText = option.letter + ") " + option.text;
        btn.onclick = () => answer(option.letter, btn);
        options.appendChild(btn);
      });
    }

    function answer(letter, button) {
      if (answered) return;

      answered = true;
      const item = quizData[current];
      const allButtons = document.querySelectorAll(".option-btn");

      allButtons.forEach(btn => {
        if (btn.innerText.startsWith(item.answer + ")")) {
          btn.classList.add("correct");
        }
      });

      if (letter === item.answer) {
        score++;
        button.classList.add("correct");
        document.getElementById("feedback").innerText = "Correto. Você entendeu a lógica.";
      } else {
        button.classList.add("wrong");
        document.getElementById("feedback").innerText = "Ainda não. Revise esse ponto na aula.";
      }

      document.getElementById("nextBtn").style.display = "inline-flex";
    }

    function nextQuestion() {
      current++;

      if (current >= quizData.length) {
        finishQuiz();
      } else {
        renderQuestion();
      }
    }

    function finishQuiz() {
      document.getElementById("quizCard").style.display = "none";
      document.getElementById("progressBar").style.width = "100%";
      document.getElementById("stepTitle").innerText = "Quiz concluído";

      const percent = Math.round((score / quizData.length) * 100);
      document.getElementById("scoreBox").style.display = "block";
      document.getElementById("scoreText").innerText =
        "Você acertou " + score + " de " + quizData.length + " questões. Aproveitamento: " + percent + "%.";
    }

    renderQuestion();
  </script>
</body>
</html>
"@

Write-Utf8NoBom -Path "$LessonDir/quiz.html" -Text $quizHtml

$shortTitle = "Copiar não ensina. Engenharia reversa ensina. #IA #PredixAI"
$shortDesc = "Engenharia reversa de conhecimento não é copiar. É estudar algo pronto, entender a lógica e transformar isso em conhecimento reutilizável. Aula 01 da Academia PredixAI."
$shortPrompt = "Crie um vídeo vertical 9:16, estilo educativo e cinematográfico, em português do Brasil. A cena começa com uma pessoa olhando para uma tela cheia de códigos e anotações, confusa. Texto na tela: 'Copiar não é aprender'. Depois a cena muda para a mesma pessoa organizando ideias em um quadro, conectando problema, lógica e solução. Texto na tela: 'Engenharia reversa é entender a lógica'. O vídeo deve ter ritmo rápido, visual moderno, clima de descoberta e final com a frase: 'Transforme conteúdo em conhecimento reutilizável'. Duração aproximada: 20 segundos."
$podcastPrompt = "Crie um episódio de podcast em português do Brasil sobre o tema: Engenharia Reversa de Conhecimento não é copiar. O episódio deve ter dois apresentadores com conversa natural, educativa e acessível. A abertura deve apresentar a diferença entre copiar e estudar a lógica. O desenvolvimento deve explicar como observar algo pronto, identificar o problema, entender a estrutura, reconhecer decisões importantes e transformar isso em conhecimento reutilizável. Inclua um exemplo prático usando um repositório no GitHub. Termine com um resumo e uma chamada para acessar a Aula 01 da Academia PredixAI. Duração estimada: 8 a 12 minutos."

$socialBody = @"
<section class="copy-hero">
  <h1>Social Pack da Aula 01</h1>
  <p>Conteúdos prontos para YouTube Shorts, Instagram, TikTok, LinkedIn, X e podcast.</p>
</section>

<div class="platform-tabs">
  <a class="platform-pill" href="#youtube">YouTube Shorts</a>
  <a class="platform-pill" href="#instagram">Instagram</a>
  <a class="platform-pill" href="#tiktok">TikTok</a>
  <a class="platform-pill" href="#linkedin">LinkedIn</a>
  <a class="platform-pill" href="#x">X</a>
  <a class="platform-pill" href="#podcast">Podcast</a>
</div>

<section id="youtube" class="copy-grid">
$(CopyBlock "yt-title" "YouTube Shorts" "Título + hashtags até 100 caracteres" "Use como título do Short." $shortTitle)
$(CopyBlock "yt-desc" "YouTube Shorts" "Descrição" "Use na descrição do YouTube Shorts." $shortDesc)
$(CopyBlock "yt-prompt" "YouTube Creator" "Prompt vertical 9:16" "Prompt em linguagem natural para gerar vídeo vertical." $shortPrompt)
</section>

<section id="instagram" class="copy-grid">
$(CopyBlock "ig-title" "Instagram Reels" "Título + hashtags até 100 caracteres" "Use no Reels." "Você estuda ou só copia? #IA #Aprendizado #PredixAI")
$(CopyBlock "ig-caption" "Instagram" "Legenda" "Legenda pronta para Instagram." "A diferença entre copiar e aprender está na lógica. Quem copia depende. Quem entende a estrutura cria liberdade. Essa é a base da Engenharia Reversa de Conhecimento.")
</section>

<section id="tiktok" class="copy-grid">
$(CopyBlock "tk-title" "TikTok" "Título + hashtags até 100 caracteres" "Use no TikTok." "Pare de copiar. Comece a entender. #IA #Estudos #PredixAI")
$(CopyBlock "tk-script" "TikTok" "Roteiro rápido" "Roteiro curto para gravação." "Gancho: Pare de copiar tudo que você vê na internet. Desenvolvimento: copiar te dá uma resposta, mas entender a lógica te dá autonomia. Fechamento: engenharia reversa de conhecimento é transformar conteúdo pronto em aprendizado reutilizável.")
</section>

<section id="linkedin" class="copy-grid">
$(CopyBlock "lk-post" "LinkedIn" "Post educativo" "Use como publicação no LinkedIn." "Engenharia reversa de conhecimento não é copiar. É observar algo pronto, entender a lógica por trás da construção e transformar esse aprendizado em método reutilizável. Essa habilidade é essencial para quem quer estudar tecnologia, IA, programação, produtos digitais e negócios com mais profundidade.")
</section>

<section id="x" class="copy-grid">
$(CopyBlock "x-post" "X" "Post curto" "Use como post no X." "Copiar te deixa dependente. Entender a lógica te torna arquiteto. Engenharia reversa de conhecimento é transformar algo pronto em aprendizado reutilizável. #PredixAI #IA")
$(CopyBlock "x-thread" "X" "Thread educativa" "Use como sequência no X." "1/ Copiar não é aprender.`n`n2/ Engenharia reversa de conhecimento é estudar algo pronto e entender a lógica por trás.`n`n3/ Primeiro você identifica o problema.`n`n4/ Depois observa a estrutura.`n`n5/ Depois entende as decisões.`n`n6/ Por fim, transforma isso em método reutilizável.`n`n7/ Esse é o caminho para deixar de ser consumidor e começar a pensar como arquiteto.")
</section>

<section id="podcast" class="copy-grid">
$(CopyBlock "podcast-prompt-social" "Podcast Gemini" "Prompt para podcast" "Copie e cole no Gemini." $podcastPrompt)
</section>
"@

New-CopyPage -Path "$LessonDir/social-pack.html" -Badge "Social Pack" -Title "Social Pack da Aula 01" -Description "Conteúdos prontos para copiar, colar e publicar." -Body $socialBody

$podcastBody = @"
<section class="copy-hero">
  <h1>Podcast Gemini da Aula 01</h1>
  <p>Roteiro e prompt prontos para transformar a aula em episódio de áudio.</p>
</section>

<section class="copy-grid">
$(CopyBlock "pod-title" "Podcast" "Título do episódio" "Use como título do podcast." "Copiar vs Engenharia Reversa de Conhecimento")
$(CopyBlock "pod-desc" "Podcast" "Descrição do episódio" "Use como descrição." "Neste episódio, explicamos por que engenharia reversa de conhecimento não é copiar. É estudar algo pronto, entender sua lógica e transformar isso em aprendizado reutilizável.")
$(CopyBlock "pod-prompt" "Gemini" "Prompt para Gemini" "Copie e cole no Gemini para gerar o podcast." $podcastPrompt)
</section>
"@

New-CopyPage -Path "$LessonDir/podcast.html" -Badge "Podcast" -Title "Podcast da Aula 01" -Description "Prompt operacional para gerar podcast no Gemini." -Body $podcastBody

$videoBody = @"
<section class="copy-hero">
  <h1>Prompts de Vídeo da Aula 01</h1>
  <p>Prompts verticais em português BR para YouTube Creator, Shorts, Reels e TikTok.</p>
</section>

<section class="copy-grid">
$(CopyBlock "video-01" "Vídeo 01" "Gancho: copiar não é aprender" "Prompt vertical 9:16." $shortPrompt)
$(CopyBlock "video-02" "Vídeo 02" "Gancho: você consome ou transforma?" "Prompt vertical 9:16." "Crie um vídeo vertical 9:16, educativo e impactante. Comece com a frase na tela: 'Você consome conteúdo ou transforma conteúdo em conhecimento?'. Mostre uma pilha de vídeos, posts e códigos passando rápido na tela. Depois mostre esse conteúdo sendo organizado em um sistema visual com blocos: problema, lógica, estrutura, aplicação. Narração em português BR explicando que a PredixAI transforma estudo em método reutilizável. Final com CTA: 'Acesse a Aula 01 da Academia PredixAI'.")
</section>
"@

New-CopyPage -Path "$LessonDir/video-prompts.html" -Badge "Vídeo Vertical" -Title "Prompts de Vídeo da Aula 01" -Description "Prompts para vídeos curtos no formato vertical." -Body $videoBody

$imageBody = @"
<section class="copy-hero">
  <h1>Prompts de Imagem da Aula 01</h1>
  <p>Prompts para gerar capas, posts e imagens estáticas em IA visual.</p>
</section>

<section class="copy-grid">
$(CopyBlock "img-01" "Imagem" "Capa principal" "Prompt para gerar imagem no ChatGPT ou Nano Banana." "Crie uma imagem vertical 9:16, estilo tecnológico e educativo, mostrando a diferença entre copiar e fazer engenharia reversa de conhecimento. À esquerda, uma pessoa apenas copiando conteúdo sem entender, com tons vermelhos e sensação de dependência. À direita, uma pessoa analisando lógica, estrutura e decisões em um quadro digital, com tons azuis e verdes, sensação de clareza e evolução. Texto principal: 'Copiar não é aprender'. Texto secundário: 'Entender a lógica é liberdade'. Visual limpo, moderno, cinematográfico, com identidade de inteligência artificial.")
$(CopyBlock "img-02" "Imagem" "Post de impacto" "Prompt para imagem única." "Crie uma imagem vertical 9:16 com fundo escuro moderno, elementos de inteligência artificial, blocos de conhecimento conectados e uma frase central grande: 'Quem copia depende. Quem entende constrói.' Use estilo premium, tecnológico, educativo e limpo.")
</section>
"@

New-CopyPage -Path "$LessonDir/image-prompts.html" -Badge "Imagem" -Title "Prompts de Imagem da Aula 01" -Description "Prompts visuais prontos para gerar imagens." -Body $imageBody

$carouselBody = @"
<section class="copy-hero">
  <h1>Carrossel da Aula 01</h1>
  <p>Roteiro e prompts para criar carrossel educativo em redes sociais.</p>
</section>

<section class="copy-grid">
$(CopyBlock "car-title" "Carrossel" "Título + hashtags até 100 caracteres" "Use como título do post." "Copiar não é aprender. Entender é construir. #IA #PredixAI")
$(CopyBlock "car-slides" "Carrossel" "Texto dos slides" "Use como roteiro do carrossel." "Slide 1: Copiar não é aprender.`nSlide 2: Copiar te dá resposta rápida, mas não cria entendimento.`nSlide 3: Engenharia reversa começa com uma pergunta: qual problema isso resolve?`nSlide 4: Depois você observa a estrutura.`nSlide 5: Em seguida, identifica as decisões importantes.`nSlide 6: Por fim, transforma isso em método reutilizável.`nSlide 7: PredixAI: conhecimento que vira produto.")
$(CopyBlock "car-prompt" "Carrossel" "Prompt visual" "Prompt para gerar carrossel em IA visual." "Crie um carrossel vertical 9:16 com 7 slides, estilo tecnológico, educativo e premium. Use fundo escuro, detalhes em azul e verde, elementos de inteligência artificial, diagramas simples e tipografia forte. Tema: 'Copiar não é aprender. Entender é construir.' Cada slide deve ter pouco texto, alto contraste e visual limpo para redes sociais.")
</section>
"@

New-CopyPage -Path "$LessonDir/carousel-prompts.html" -Badge "Carrossel" -Title "Carrossel da Aula 01" -Description "Roteiro e prompts para carrossel." -Body $carouselBody

Write-Utf8NoBom -Path "media/social-packs/$LessonSlug.md" -Text "Social Pack publicado em docs/academy/$LessonSlug/social-pack.html"
Write-Utf8NoBom -Path "media/prompts/$LessonSlug-video-prompts.md" -Text $shortPrompt
Write-Utf8NoBom -Path "media/prompts/$LessonSlug-image-prompts.md" -Text "Prompts de imagem publicados em docs/academy/$LessonSlug/image-prompts.html"
Write-Utf8NoBom -Path "media/prompts/$LessonSlug-carousel-prompts.md" -Text "Prompts de carrossel publicados em docs/academy/$LessonSlug/carousel-prompts.html"
Write-Utf8NoBom -Path "media/prompts/$LessonSlug-podcast-prompt.md" -Text $podcastPrompt

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
    <div class="badge">Aprendizado contínuo</div>
    <h1>Academy</h1>
    <p>Área oficial das aulas, módulos, quizzes, PDFs e trilhas da Academia PredixAI.</p>
  </header>

  <nav>
    <a href="index.html">Home</a>
    <a href="foundation.html">Fundação</a>
    <a href="research.html">Research</a>
    <a href="academy.html">Academy</a>
    <a href="agents.html">Agents</a>
    <a href="media.html">Media</a>
    <a href="roadmap.html">Roadmap</a>
  </nav>

  <main>
    <section class="hero">
      <h2>Objetivo da área</h2>
      <p>Transformar conhecimento técnico em aprendizado claro, guiado e validado por exercícios.</p>
    </section>

    <h2 class="section-title">$ModuleTitle</h2>
    <p class="section-subtitle">Trilha oficial da Academia PredixAI.</p>

    <section class="grid">
      <div class="card">
        <h3>Aula 01</h3>
        <p>Engenharia Reversa de Conhecimento</p>
        <a href="academy/$LessonSlug/">Abrir aula</a>
      </div>
    </section>

    <section class="panel path">
      <h2>Pacote da Aula 01</h2>
      <ul>
        <li>PDF premium.</li>
        <li>Quiz gamificado.</li>
        <li>Social Pack com caixas copiáveis.</li>
        <li>Prompts de vídeo, imagem, carrossel e podcast.</li>
      </ul>
    </section>
  </main>

  <footer>
    PredixAI BR - Aprenda a pensar. Construa o futuro.
  </footer>
</body>
</html>
"@

Write-Utf8NoBom -Path "docs/academy.html" -Text $academyHtml

$required = @(
    "$LessonDir/index.html",
    "$LessonDir/pdf.html",
    "$LessonDir/quiz.html",
    "$LessonDir/social-pack.html",
    "$LessonDir/podcast.html",
    "$LessonDir/video-prompts.html",
    "$LessonDir/image-prompts.html",
    "$LessonDir/carousel-prompts.html",
    "$LessonDir/meta.json",
    "docs/downloads/$LessonSlug.pdf"
)

foreach ($item in $required) {
    if (!(Test-Path $item)) {
        throw "Arquivo obrigatório não encontrado: $item"
    }
}

$validateFiles = @(
    "$LessonDir/index.html",
    "$LessonDir/$LessonSlug.md",
    "$LessonDir/social-pack.html",
    "$LessonDir/quiz.html",
    "$LessonDir/print.html"
)

foreach ($file in $validateFiles) {
    $content = Read-Utf8 $file
    Assert-CleanText -Path $file -Text $content
}

$socialCheck = Read-Utf8 "$LessonDir/social-pack.html"
foreach ($anchor in @('id="youtube"', 'id="instagram"', 'id="tiktok"', 'id="linkedin"', 'id="x"', 'id="podcast"')) {
    if ($socialCheck -notmatch [regex]::Escape($anchor)) {
        throw "Âncora ausente no social-pack.html: $anchor"
    }
}

git diff --check

Write-Host "Validação concluída com sucesso."

git add .
$status = git status --porcelain

if ($status) {
    git commit -m "feat: install lesson factory v3.2"
    git push
}
else {
    Write-Host "Sem alterações para publicar."
}

git status
Write-Host "Fábrica v3.2 aplicada com sucesso."
