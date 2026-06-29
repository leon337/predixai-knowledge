$ErrorActionPreference = "Stop"

$LessonSlug = "aula-01"
$LessonTitle = "Aula 01 - Engenharia Reversa de Conhecimento"
$LessonDir = "docs/academy/$LessonSlug"

New-Item -ItemType Directory -Force -Path $LessonDir | Out-Null
New-Item -ItemType Directory -Force -Path "media/prompts" | Out-Null

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
      }, 1400);
    }
  </script>
</body>
</html>
"@

    Set-Content -Encoding UTF8 -Path $Path -Value $html
}

function CopyBlock {
    param(
        [string]$Id,
        [string]$Label,
        [string]$Title,
        [string]$Description,
        [string]$Text
    )

    $safeText = [System.Net.WebUtility]::HtmlEncode($Text)

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

$pdfBody = @"
<section class="copy-hero">
  <h1>PDF Premium da Aula 01</h1>
  <p>Material oficial para estudar, revisar e compartilhar a aula sobre Engenharia Reversa de Conhecimento.</p>
</section>

<section class="copy-grid two">
  <section class="copy-card">
    <span class="copy-label">Download</span>
    <h2>Baixar PDF</h2>
    <p>Use este botão para baixar o material em PDF da Aula 01.</p>
    <div class="copy-actions">
      <a class="copy-btn" href="../../downloads/aula-01.pdf">Baixar PDF</a>
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

New-CopyPage `
  -Path "$LessonDir/pdf.html" `
  -Badge "PDF Premium" `
  -Title "PDF da Aula 01" `
  -Description "Material de estudo da Academia PredixAI." `
  -Body $pdfBody

$socialBody = @"
<section class="copy-hero">
  <h1>Social Pack da Aula 01</h1>
  <p>Conteúdos prontos para YouTube Shorts, Instagram, TikTok, LinkedIn e X.</p>
</section>

<div class="platform-tabs">
  <a class="platform-pill" href="#youtube">YouTube Shorts</a>
  <a class="platform-pill" href="#instagram">Instagram</a>
  <a class="platform-pill" href="#tiktok">TikTok</a>
  <a class="platform-pill" href="#linkedin">LinkedIn</a>
  <a class="platform-pill" href="#x">X</a>
</div>

<section class="copy-grid">
$(CopyBlock "yt-title" "YouTube Shorts" "Título + hashtags até 100 caracteres" "Use como título do Short." "Copiar não ensina. Engenharia reversa ensina. #IA #Aprendizado #PredixAI")

$(CopyBlock "yt-desc" "YouTube Shorts" "Descrição" "Use na descrição do YouTube Shorts." "Engenharia reversa de conhecimento não é copiar. É estudar algo pronto, entender a lógica e transformar isso em conhecimento reutilizável. Aula 01 da Academia PredixAI.")

$(CopyBlock "yt-prompt" "YouTube Creator" "Prompt vertical 9:16" "Prompt em linguagem natural para gerar vídeo vertical." "Crie um vídeo vertical 9:16, estilo educativo e cinematográfico, em português do Brasil. A cena começa com uma pessoa olhando para uma tela cheia de códigos e anotações, confusa. Texto na tela: 'Copiar não é aprender'. Depois a cena muda para a mesma pessoa organizando ideias em um quadro, conectando problema, lógica e solução. Texto na tela: 'Engenharia reversa é entender a lógica'. O vídeo deve ter ritmo rápido, visual moderno, clima de descoberta e final com a frase: 'Transforme conteúdo em conhecimento reutilizável'. Duração aproximada: 20 segundos.")

$(CopyBlock "reels-title" "Instagram Reels" "Título + hashtags até 100 caracteres" "Use no Reels." "Você estuda ou só copia? #IA #Aprendizado #PredixAI")

$(CopyBlock "reels-desc" "Instagram Reels" "Legenda" "Legenda pronta para Instagram." "A diferença entre copiar e aprender está na lógica. Quem copia depende. Quem entende a estrutura cria liberdade. Essa é a base da Engenharia Reversa de Conhecimento.")

$(CopyBlock "tiktok-title" "TikTok" "Título + hashtags até 100 caracteres" "Use no TikTok." "Pare de copiar. Comece a entender. #IA #Estudos #PredixAI")

$(CopyBlock "linkedin-post" "LinkedIn" "Post educativo" "Use como publicação no LinkedIn." "Engenharia reversa de conhecimento não é copiar. É observar algo pronto, entender a lógica por trás da construção e transformar esse aprendizado em método reutilizável. Essa habilidade é essencial para quem quer estudar tecnologia, IA, programação, produtos digitais e negócios com mais profundidade.")

$(CopyBlock "x-post" "X" "Post curto" "Use como post no X." "Copiar te deixa dependente. Entender a lógica te torna arquiteto. Engenharia reversa de conhecimento é transformar algo pronto em aprendizado reutilizável. #PredixAI #IA")

$(CopyBlock "x-thread" "X" "Thread educativa" "Use como sequência no X." "1/ Copiar não é aprender.`n`n2/ Engenharia reversa de conhecimento é estudar algo pronto e entender a lógica por trás.`n`n3/ Primeiro você identifica o problema.`n`n4/ Depois observa a estrutura.`n`n5/ Depois entende as decisões.`n`n6/ Por fim, transforma isso em método reutilizável.`n`n7/ Esse é o caminho para deixar de ser consumidor e começar a pensar como arquiteto.")
</section>
"@

New-CopyPage `
  -Path "$LessonDir/social-pack.html" `
  -Badge "Social Pack" `
  -Title "Social Pack da Aula 01" `
  -Description "Conteúdos prontos para copiar, colar e publicar." `
  -Body $socialBody

$podcastPrompt = "Crie um episódio de podcast em português do Brasil sobre o tema: Engenharia Reversa de Conhecimento não é copiar. O episódio deve ter dois apresentadores com conversa natural, educativa e acessível. A abertura deve apresentar a diferença entre copiar e estudar a lógica. O desenvolvimento deve explicar como observar algo pronto, identificar o problema, entender a estrutura, reconhecer decisões importantes e transformar isso em conhecimento reutilizável. Inclua um exemplo prático usando um repositório no GitHub. Termine com um resumo e uma chamada para acessar a Aula 01 da Academia PredixAI. Duração estimada: 8 a 12 minutos."

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

New-CopyPage `
  -Path "$LessonDir/podcast.html" `
  -Badge "Podcast" `
  -Title "Podcast da Aula 01" `
  -Description "Prompt operacional para gerar podcast no Gemini." `
  -Body $podcastBody

$videoBody = @"
<section class="copy-hero">
  <h1>Prompts de Vídeo da Aula 01</h1>
  <p>Prompts verticais em português BR para YouTube Creator, Shorts, Reels e TikTok.</p>
</section>

<section class="copy-grid">
$(CopyBlock "video-01" "Vídeo 01" "Gancho: copiar não é aprender" "Prompt vertical 9:16." "Crie um vídeo vertical 9:16 em português do Brasil. Mostre uma pessoa copiando algo da internet sem entender, com expressão confusa. Texto na tela: 'Copiar não é aprender'. Em seguida, mostre a pessoa analisando a estrutura, separando problema, lógica e solução em um quadro. Texto na tela: 'Aprender é entender a lógica'. Estilo moderno, educativo, com ritmo rápido, iluminação cinematográfica e sensação de descoberta. Final: 'Engenharia Reversa de Conhecimento'. Duração: 20 segundos.")

$(CopyBlock "video-02" "Vídeo 02" "Gancho: você consome ou transforma?" "Prompt vertical 9:16." "Crie um vídeo vertical 9:16, educativo e impactante. Comece com a frase na tela: 'Você consome conteúdo ou transforma conteúdo em conhecimento?'. Mostre uma pilha de vídeos, posts e códigos passando rápido na tela. Depois mostre esse conteúdo sendo organizado em um sistema visual com blocos: problema, lógica, estrutura, aplicação. Narração em português BR explicando que a PredixAI transforma estudo em método reutilizável. Final com CTA: 'Acesse a Aula 01 da Academia PredixAI'.")
</section>
"@

New-CopyPage `
  -Path "$LessonDir/video-prompts.html" `
  -Badge "Vídeo Vertical" `
  -Title "Prompts de Vídeo da Aula 01" `
  -Description "Prompts para vídeos curtos no formato vertical." `
  -Body $videoBody

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

New-CopyPage `
  -Path "$LessonDir/image-prompts.html" `
  -Badge "Imagem" `
  -Title "Prompts de Imagem da Aula 01" `
  -Description "Prompts visuais prontos para gerar imagens." `
  -Body $imageBody

$carouselBody = @"
<section class="copy-hero">
  <h1>Carrossel da Aula 01</h1>
  <p>Roteiro e prompts para criar carrossel educativo em redes sociais.</p>
</section>

<section class="copy-grid">
$(CopyBlock "car-title" "Carrossel" "Título + hashtags até 100 caracteres" "Use como título do post." "Copiar não é aprender. Entender é construir. #IA #Aprendizado #PredixAI")

$(CopyBlock "car-slides" "Carrossel" "Texto dos slides" "Use como roteiro do carrossel." "Slide 1: Copiar não é aprender.`nSlide 2: Copiar te dá resposta rápida, mas não cria entendimento.`nSlide 3: Engenharia reversa começa com uma pergunta: qual problema isso resolve?`nSlide 4: Depois você observa a estrutura.`nSlide 5: Em seguida, identifica as decisões importantes.`nSlide 6: Por fim, transforma isso em método reutilizável.`nSlide 7: PredixAI: conhecimento que vira produto.")

$(CopyBlock "car-prompt" "Carrossel" "Prompt visual" "Prompt para gerar carrossel em IA visual." "Crie um carrossel vertical 9:16 com 7 slides, estilo tecnológico, educativo e premium. Use fundo escuro, detalhes em azul e verde, elementos de inteligência artificial, diagramas simples e tipografia forte. Tema: 'Copiar não é aprender. Entender é construir.' Cada slide deve ter pouco texto, alto contraste e visual limpo para redes sociais.")
</section>
"@

New-CopyPage `
  -Path "$LessonDir/carousel-prompts.html" `
  -Badge "Carrossel" `
  -Title "Carrossel da Aula 01" `
  -Description "Roteiro e prompts para carrossel." `
  -Body $carouselBody

Set-Content -Encoding UTF8 -Path "media/prompts/aula-01-video-prompts.md" -Value "Prompts de video da Aula 01 publicados em docs/academy/aula-01/video-prompts.html"
Set-Content -Encoding UTF8 -Path "media/prompts/aula-01-image-prompts.md" -Value "Prompts de imagem da Aula 01 publicados em docs/academy/aula-01/image-prompts.html"
Set-Content -Encoding UTF8 -Path "media/prompts/aula-01-carousel-prompts.md" -Value "Prompts de carrossel da Aula 01 publicados em docs/academy/aula-01/carousel-prompts.html"
Set-Content -Encoding UTF8 -Path "media/prompts/aula-01-podcast-prompt.md" -Value $podcastPrompt

git add .
git commit -m "feat: add operational copy pages for lesson 01"
git push
git status
