# PREDIXAI LESSON PACKAGE STANDARD v2

## 1. Objetivo

Toda aula da Academia PredixAI deve ser tratada como uma unidade de produto.

Uma aula aprovada deve gerar automaticamente:

- conteúdo educacional;
- página HTML;
- PDF premium;
- quiz gamificado;
- pacote de vídeos verticais;
- pacote de imagens e carrosséis;
- podcast para Gemini;
- posts para redes sociais;
- metadados;
- links no site.

Regra central:

Uma aula entra. Um ecossistema de conteúdo sai.

---

## 2. Definição de Aula Aprovada

Antes de gerar o pacote completo, a aula precisa cumprir:

- objetivo claro;
- linguagem em português do Brasil;
- público-alvo definido;
- explicação didática;
- exemplos práticos;
- checklist;
- exercício;
- quiz;
- resumo;
- CTA principal;
- revisão conceitual;
- revisão de clareza;
- revisão de aplicação prática.

Nenhuma automação deve transformar rascunho fraco em pacote final.

---

## 3. Estrutura Obrigatória da Aula

Toda aula deve conter:

- título;
- módulo;
- nível;
- objetivo;
- introdução;
- explicação principal;
- exemplos;
- analogia simples;
- checklist;
- erros comuns;
- exercício prático;
- resumo executivo;
- glossário;
- quiz;
- flashcards;
- produtos derivados;
- próximo passo.

---

## 4. PDF Premium

O PDF deve ser produto oficial, não impressão simples.

Requisitos:

- capa profissional;
- título forte;
- identidade visual PredixAI;
- boa hierarquia visual;
- espaçamento confortável;
- leitura mobile e desktop;
- português BR;
- sem erro de encoding;
- CTA final;
- link para site/aula;
- pronto para ser usado como material gratuito.

---

## 5. Quiz Gamificado

O quiz deve conter:

- perguntas objetivas;
- alternativas A-E;
- botões clicáveis;
- feedback visual por resposta;
- pontuação;
- barra de progresso;
- mensagem final;
- CTA para próxima aula;
- possibilidade futura de medalhas, ranking e certificado.

Objetivo:

Validar aprendizado e aumentar engajamento.

---

## 6. Pacote de Vídeo Vertical

Todo vídeo deve seguir formato vertical 9:16.

Obrigatório para YouTube Shorts, Reels e TikTok:

- título + hashtags com no máximo 100 caracteres;
- descrição;
- hashtags;
- gancho nos primeiros segundos;
- roteiro de narração;
- texto na tela;
- prompt em linguagem natural;
- direção visual da cena;
- duração estimada;
- CTA final.

O conteúdo deve seguir os princípios do canal Viralizou BR:

- conflito inicial;
- curiosidade aberta;
- progressão visual;
- frases curtas;
- retenção;
- fechamento com próximo passo.

---

## 7. Pacote de Imagens e Carrosséis

Toda aula deve gerar prompts para imagens e carrosséis.

Cada carrossel deve conter:

- objetivo;
- formato recomendado;
- texto da capa;
- texto de cada slide;
- prompt visual por slide;
- legenda;
- CTA;
- hashtags.

As imagens devem poder ser geradas no ChatGPT, Nano Banana ou outra IA visual.

---

## 8. Podcast para Gemini

Cada aula deve gerar um roteiro de podcast.

Obrigatório:

- título do episódio;
- descrição;
- prompt para Gemini;
- tom dos apresentadores;
- abertura;
- desenvolvimento em blocos;
- exemplo prático;
- resumo;
- CTA;
- encerramento;
- duração estimada.

O podcast deve soar natural, educativo e acessível.

---

## 9. Pacote por Plataforma

Cada aula deve gerar conteúdo para:

### YouTube Shorts

- título + hashtags até 100 caracteres;
- descrição;
- hashtags;
- roteiro curto;
- prompt vertical para YouTube Creator.

### Instagram

- Reels;
- carrossel;
- legenda;
- stories;
- CTA para PDF ou aula.

### TikTok

- roteiro rápido;
- gancho forte;
- linguagem direta;
- CTA para seguir ou comentar.

### LinkedIn

- post educativo;
- reflexão estratégica;
- autoridade profissional;
- link da aula.

### X

- post curto;
- thread educativa;
- frase de impacto;
- bastidor do projeto;
- CTA para aula/PDF;
- hashtags.

---

## 10. CTA e Lead

Toda aula deve ter um CTA principal.

Exemplos:

- baixar PDF;
- acessar aula completa;
- responder quiz;
- comentar palavra-chave;
- seguir perfil;
- entrar na lista de espera;
- compartilhar.

Toda aula deve ter uma promessa clara de valor.

Exemplo:

Baixe o PDF gratuito e aprenda a transformar qualquer conteúdo em conhecimento reutilizável.

---

## 11. Metadados

Cada aula deve ter meta.json com:

- slug;
- título;
- módulo;
- nível;
- status;
- versão;
- data;
- tags;
- público-alvo;
- CTA principal;
- produtos gerados;
- links publicados.

---

## 12. Estrutura de Pastas

Para cada aula:

academy/modulo-xx/nome-do-modulo/aula-xx/
- AULA_XX.md

docs/academy/aula-xx/
- index.html
- quiz.html
- aula-xx.md
- social-pack.md
- podcast.md
- meta.json

docs/downloads/
- aula-xx.pdf

media/social-packs/
- aula-xx.md

media/prompts/
- aula-xx-video-prompts.md
- aula-xx-image-prompts.md
- aula-xx-carousel-prompts.md
- aula-xx-podcast-prompt.md

---

## 13. Validação Antes da Publicação

Antes do commit e push, validar:

- HTML da aula existe;
- PDF foi gerado;
- quiz tem perguntas;
- social pack existe;
- podcast existe;
- prompts de vídeo existem;
- prompts de imagem existem;
- meta.json existe;
- link aparece na Academy;
- não há erro de encoding;
- git status foi conferido.

---

## 14. Automação

Nenhuma aula deve ser publicada manualmente arquivo por arquivo.

Fluxo oficial:

Aula aprovada -> script único -> pacote completo -> commit -> push.

Script oficial:

scripts/build_lesson_full.ps1

---

## 15. OpenClaw

O OpenClaw poderá ser usado futuramente para executar o script oficial.

Regra:

O OpenClaw não deve improvisar estrutura.

Ele deve executar comandos aprovados e scripts oficiais.

---

## 16. Regra Máxima

Aula não é apenas conteúdo.

Aula é produto educacional, isca digital, base de autoridade, material de distribuição e combustível para agentes.

Cada aula deve ensinar, engajar, distribuir, captar e fortalecer a PredixAI.
