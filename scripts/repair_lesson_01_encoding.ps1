$ErrorActionPreference = "Stop"

$files = @(
  "academy/modulo-01-mentalidade-do-arquiteto/aula-01/AULA_01.md",
  "docs/academy/aula-01/aula-01.md",
  "docs/academy/aula-01/index.html",
  "docs/academy/aula-01/quiz.html",
  "docs/academy/aula-01/print.html"
)

foreach ($file in $files) {
  if (Test-Path $file) {
    $text = Get-Content $file -Raw

    if ($text -match "Ã|â|Â") {
      $fixed = [System.Text.Encoding]::UTF8.GetString(
        [System.Text.Encoding]::GetEncoding(1252).GetBytes($text)
      )

      Set-Content -Encoding UTF8 -Path $file -Value $fixed
      Write-Host "Corrigido encoding: $file"
    }
  }
}

if (Test-Path "docs/academy/aula-01/index.html") {
  $html = Get-Content "docs/academy/aula-01/index.html" -Raw

  $html = $html.Replace(
    'href="../../downloads/aula-01.pdf">Baixar PDF</a>',
    'href="pdf.html">Abrir PDF</a>'
  )

  if ($html -notmatch 'video-prompts.html') {
    $html = $html.Replace(
      '<a class="button" href="social-pack.md">Social Pack</a>',
      '<a class="button" href="social-pack.html">Social Pack</a>
      <a class="button" href="podcast.html">Podcast</a>
      <a class="button" href="video-prompts.html">Vídeos</a>
      <a class="button" href="image-prompts.html">Imagens</a>
      <a class="button" href="carousel-prompts.html">Carrossel</a>'
    )
  }

  Set-Content -Encoding UTF8 -Path "docs/academy/aula-01/index.html" -Value $html
}

.\scripts\build_lesson_full.ps1 `
  -LessonSlug "aula-01" `
  -LessonTitle "Aula 01 - Engenharia Reversa de Conhecimento" `
  -SourceMd "academy/modulo-01-mentalidade-do-arquiteto/aula-01/AULA_01.md"

if (Test-Path "docs/academy/aula-01/index.html") {
  $html = Get-Content "docs/academy/aula-01/index.html" -Raw

  $html = $html.Replace(
    'href="../../downloads/aula-01.pdf">Baixar PDF</a>',
    'href="pdf.html">Abrir PDF</a>'
  )

  $html = $html.Replace(
    'href="social-pack.md">Social Pack</a>',
    'href="social-pack.html">Social Pack</a>'
  )

  Set-Content -Encoding UTF8 -Path "docs/academy/aula-01/index.html" -Value $html
}

git add .
git commit -m "fix: repair lesson 01 encoding and navigation"
git push
git status
