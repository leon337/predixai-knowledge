$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RootDir = Split-Path -Parent $ScriptDir
Set-Location $RootDir

$docs = [ordered]@{

"foundation/PREDIXAI_KNOWLEDGE_SYSTEM.md" = @'
# PREDIXAI KNOWLEDGE SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Knowledge System define como todo conhecimento da PredixAI BR deve ser criado, organizado, documentado, versionado, reutilizado e transformado em produtos.

A PredixAI nao deve tratar conhecimento como informacao solta. Todo aprendizado relevante deve virar patrimonio intelectual.

---

## 2. Principio Central

> O conhecimento e o principal ativo da PredixAI BR.

A tecnologia pode mudar. Ferramentas podem mudar. Modelos de IA podem mudar.  
Mas conhecimento bem estruturado continua gerando valor.

---

## 3. O que e conhecimento na PredixAI

Conhecimento e qualquer informacao validada que possa ajudar a PredixAI a:

- tomar melhores decisoes;
- criar produtos;
- formar pessoas;
- treinar agentes;
- melhorar processos;
- gerar conteudo;
- resolver problemas reais.

---

## 4. Ciclo do Conhecimento

1. Ideia
2. Pesquisa
3. Validacao
4. Engenharia Reversa
5. Organizacao
6. Documentacao
7. Aplicacao
8. Publicacao
9. Feedback
10. Nova Versao

---

## 5. Regra do Patrimonio

Nenhum estudo importante deve ficar preso apenas em:

- conversas;
- memoria humana;
- prints;
- videos assistidos;
- respostas de IA;
- arquivos soltos.

Todo conhecimento relevante deve ser registrado no Knowledge Hub.

---

## 6. Multiplicacao de Valor

Uma pesquisa pode gerar:

- aula;
- PDF;
- artigo;
- video;
- short;
- carrossel;
- newsletter;
- agente;
- documento tecnico;
- ferramenta;
- produto;
- consultoria.

Pesquisar uma vez. Reutilizar muitas vezes.

---

## 7. Modularidade

Todo conhecimento deve ser organizado em partes pequenas e reutilizaveis.

Exemplo:

- conceito;
- principio;
- exemplo;
- checklist;
- estudo de caso;
- exercicio;
- quiz;
- decisao arquitetural.

---

## 8. Versionamento

Todo conhecimento deve possuir:

- nome;
- versao;
- data;
- status;
- responsavel;
- historico de alteracoes.

Nada e definitivo. Tudo pode evoluir.

---

## 9. Papel da IA

A IA pode ajudar a pesquisar, resumir, revisar, organizar, ensinar e transformar conteudo.

Mas a responsabilidade final pela qualidade e da PredixAI.

A IA acelera o processo. Ela nao substitui criterio humano.

---

## 10. Missao

Transformar conhecimento em solucoes praticas que geram impacto real para pessoas, empresas e produtos da PredixAI BR.

---

## 11. Regra Maxima

Toda decisao deve responder:

> Isso fortalece o conhecimento da PredixAI e ajuda a transformar esse conhecimento em valor pratico?

'@

"foundation/PREDIXAI_RESEARCH_SYSTEM.md" = @'
# PREDIXAI RESEARCH SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Research System define como a PredixAI deve pesquisar, validar e transformar fontes externas em conhecimento confiavel.

A pesquisa e a materia-prima do Knowledge Hub.

---

## 2. Filosofia

Nao pesquisamos apenas para responder perguntas.

Pesquisamos para construir patrimonio intelectual.

---

## 3. Fontes Prioritarias

### Nivel A

- documentacao oficial;
- codigo-fonte oficial;
- papers;
- RFCs;
- especificacoes tecnicas.

### Nivel B

- livros;
- repositorios open source;
- conferencias;
- artigos tecnicos profundos.

### Nivel C

- YouTube tecnico;
- podcasts;
- blogs tecnicos;
- entrevistas.

### Nivel D

- redes sociais;
- comentarios;
- opinioes;
- foruns.

Fontes de Nivel D nunca devem ser usadas sozinhas para decisao tecnica importante.

---

## 4. Fluxo de Pesquisa

1. Definir o objetivo da pesquisa.
2. Listar fontes.
3. Classificar fontes.
4. Validar confiabilidade.
5. Ler ou assistir profundamente.
6. Extrair conceitos.
7. Identificar decisoes.
8. Comparar alternativas.
9. Aplicar ao contexto da PredixAI.
10. Documentar no Knowledge Hub.

---

## 5. Engenharia Reversa

Ao estudar um projeto, sempre responder:

- Qual problema resolve?
- Por que foi criado?
- Como esta organizado?
- Quais tecnologias usa?
- Quais decisoes foram tomadas?
- Quais alternativas existem?
- O que serve para a PredixAI?
- O que nao serve?
- O que pode virar aula?
- O que pode virar agente?

---

## 6. Pesquisa de Repositorios

Para repositorios GitHub, seguir a ordem:

1. README
2. Estrutura de pastas
3. Dependencias
4. Fluxo principal
5. Modulos internos
6. Testes
7. Issues relevantes
8. Historico de commits, quando necessario
9. Licoes aprendidas

Nunca iniciar pelo codigo sem entender o objetivo do projeto.

---

## 7. Pesquisa de Videos

Para videos tecnicos:

- criar indice por topicos;
- registrar timestamps;
- extrair conceitos;
- separar opiniao de fato;
- identificar ferramentas citadas;
- comparar com documentacao oficial quando necessario;
- gerar resumo e licoes.

---

## 8. Pesquisa de Ferramentas

Toda ferramenta deve ser avaliada por:

- custo;
- alternativa gratuita;
- alternativa open source;
- curva de aprendizado;
- utilidade para a PredixAI;
- dependencia externa;
- risco de obsolescencia.

---

## 9. Saidas da Pesquisa

Toda pesquisa deve gerar pelo menos:

- resumo executivo;
- ficha tecnica;
- licoes aprendidas;
- aplicacao na PredixAI;
- possiveis conteudos derivados;
- possiveis agentes derivados.

---

## 10. Regra de Qualidade

Quando houver duvida, pesquisar mais.

Velocidade nao pode vencer confiabilidade.

'@

"foundation/PREDIXAI_CONTENT_SYSTEM.md" = @'
# PREDIXAI CONTENT SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Content System define como a PredixAI transforma conhecimento em conteudo reutilizavel, publicavel e comercializavel.

---

## 2. Principio Central

> Pesquisar uma vez. Publicar em muitos formatos.

Uma unica aula ou pesquisa deve gerar varios ativos.

---

## 3. Fluxo Oficial de Conteudo

1. Pesquisa
2. Engenharia Reversa
3. Resumo Executivo
4. Aula
5. Checklist
6. Exercicios
7. Quiz
8. Flashcards
9. PDF
10. HTML
11. Markdown
12. Artigo
13. Newsletter
14. Carrossel
15. Shorts
16. Video longo
17. Base para agentes
18. Publicacao

---

## 4. Produtos Derivados de Uma Aula

Cada aula deve poder gerar:

- material do curso;
- pagina HTML;
- PDF gratuito;
- post de blog;
- carrossel para Instagram;
- roteiro de short;
- roteiro de video longo;
- conteudo para newsletter;
- base de conhecimento para agentes;
- perguntas frequentes;
- exercicios e quiz.

---

## 5. Site como Fonte Oficial

O site oficial da PredixAI deve ser a fonte central.

Redes sociais distribuem conteudo.  
O site organiza e preserva o conteudo.

---

## 6. PDF como Isca de Valor

Cada aula concluida deve gerar um PDF completo ou resumo premium.

O PDF pode ser usado para:

- atrair leads;
- fortalecer autoridade;
- distribuir no Instagram;
- alimentar comunidade;
- gerar lista de espera.

---

## 7. Conteudo para Redes Sociais

Toda aula deve permitir criacao de:

- 1 carrossel;
- 3 posts curtos;
- 3 shorts;
- 1 roteiro de video longo;
- 1 chamada para download do PDF.

---

## 8. Linguagem

A linguagem deve ser:

- clara;
- objetiva;
- didatica;
- acessivel para iniciantes;
- sem perder rigor tecnico.

Explicar simples nao significa simplificar errado.

---

## 9. Reutilizacao

Nenhum conteudo deve ser produzido apenas para um canal.

Antes de criar, perguntar:

> Como isso pode ser reutilizado em aula, PDF, artigo, video, agente ou produto?

---

## 10. Regra Maxima

Conteudo bom e aquele que ensina, gera confianca e abre caminho para produtos futuros da PredixAI.

'@

"foundation/PREDIXAI_QUALITY_SYSTEM.md" = @'
# PREDIXAI QUALITY SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Quality System define os criterios minimos de qualidade tecnica, didatica e visual para todo conteudo produzido.

---

## 2. Principio Central

> Qualidade nao e etapa opcional. E requisito.

Nada deve ser publicado apenas porque esta pronto.  
Deve estar correto, claro e util.

---

## 3. Tres Pilares da Qualidade

### Qualidade Tecnica

- informacao correta;
- fontes confiaveis;
- conceitos atualizados;
- exemplos coerentes;
- ausencia de falsas promessas.

### Qualidade Didatica

- linguagem clara;
- progressao logica;
- exemplos simples;
- exercicios adequados;
- revisao de pontos importantes.

### Qualidade Visual

- padrao consistente;
- boa leitura mobile;
- contraste adequado;
- componentes organizados;
- layout limpo.

---

## 4. Checklist de Aula

Uma aula so pode ser concluida quando possuir:

- objetivo;
- prerequisitos;
- tempo estimado;
- nivel;
- conteudo principal;
- exemplos;
- glossario;
- estudo de caso;
- resumo executivo;
- exercicios;
- quiz A-E;
- correcao comentada;
- flashcards;
- licao aprendida;
- PDF;
- HTML;
- Markdown;
- roteiro de video;
- base para agentes.

---

## 5. Revisoes Obrigatorias

### Revisao Tecnica

Verifica se o conteudo esta correto.

### Revisao Didatica

Verifica se o aluno consegue entender.

### Revisao Estrategica

Verifica se o conteudo fortalece a PredixAI.

### Revisao Visual

Verifica se o conteudo esta bem apresentado.

---

## 6. Indicadores de Qualidade

Futuramente, medir:

- taxa de conclusao;
- taxa de aprovacao;
- questoes mais erradas;
- tempo medio de estudo;
- feedback dos alunos;
- downloads de PDF;
- visitas na pagina;
- conversao em leads.

---

## 7. Versionamento de Qualidade

Toda melhoria deve gerar nova versao.

Exemplo:

- Aula 001 v1.0
- Aula 001 v1.1
- Aula 001 v2.0

---

## 8. Regra de Publicacao

Nenhum conteudo deve ir para o publico sem passar pelo checklist minimo.

Rapido demais hoje pode virar retrabalho amanha.

'@

"foundation/PREDIXAI_ROLE_SYSTEM.md" = @'
# PREDIXAI ROLE SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Role System define os papeis humanos e dos agentes de IA no processo de producao de conhecimento.

---

## 2. Principio Central

> Uma funcao. Uma responsabilidade. Um responsavel.

Mesmo que uma unica IA execute varias tarefas, os papeis devem ser separados.

---

## 3. Diretor Academico

Responsavel: Leo

Responsabilidades:

- aprovar estrategia;
- definir prioridades;
- validar direcao;
- aprovar mudancas importantes;
- decidir quando publicar.

---

## 4. Arquiteto do Conhecimento

Responsabilidades:

- organizar metodologia;
- definir estrutura dos modulos;
- manter coerencia entre documentos;
- transformar ideias soltas em sistema;
- evitar duplicidade e confusao.

---

## 5. Pesquisador IA

Responsabilidades:

- buscar fontes;
- validar informacoes;
- comparar referencias;
- estudar repositorios;
- estudar videos;
- gerar fichas de pesquisa.

---

## 6. Professor IA

Responsabilidades:

- explicar conteudo;
- adaptar linguagem ao aluno;
- criar exemplos;
- organizar progressao;
- gerar exercicios.

---

## 7. Redator IA

Responsabilidades:

- escrever PDFs;
- escrever artigos;
- criar newsletters;
- organizar Markdown;
- transformar aula em texto final.

---

## 8. Designer IA

Responsabilidades:

- organizar visual;
- aplicar Design System;
- montar carrosseis;
- pensar mobile first;
- melhorar legibilidade.

---

## 9. Revisor IA

Responsabilidades:

- verificar erros;
- revisar clareza;
- apontar lacunas;
- validar consistencia;
- sugerir melhorias.

---

## 10. Marketing IA

Responsabilidades:

- criar chamadas;
- criar CTAs;
- planejar distribuicao;
- transformar aulas em conteudo de atracao;
- pensar funil de leads.

---

## 11. Publicador IA

Responsabilidades:

- preparar arquivos;
- versionar;
- publicar no GitHub;
- atualizar site;
- organizar entregas.

---

## 12. Regra de Governanca

Um papel pode ser executado por uma pessoa ou por uma IA, mas a responsabilidade deve estar clara.

'@

"foundation/PREDIXAI_WORKFLOW_SYSTEM.md" = @'
# PREDIXAI WORKFLOW SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Workflow System define como uma ideia vira conhecimento, conteudo, produto e melhoria continua.

---

## 2. Fluxo Principal

1. Ideia
2. Pesquisa
3. Validacao
4. Engenharia Reversa
5. Organizacao
6. Aula ou Documento
7. Revisao
8. Aprovacao
9. Publicacao
10. Distribuicao
11. Feedback
12. Nova versao

---

## 3. Estados de Trabalho

Cada item deve estar em um dos estados:

- Planejado
- Em andamento
- Em revisao
- Aprovado
- Publicado
- Atualizado
- Arquivado

---

## 4. Fluxo dos Agentes

1. Pesquisador entrega base
2. Arquiteto organiza
3. Professor transforma em aula
4. Redator transforma em material
5. Designer aplica visual
6. Revisor valida
7. Marketing cria distribuicao
8. Publicador entrega ao publico

---

## 5. Regra de Retorno

Se uma etapa falhar, o item volta para a etapa anterior.

Exemplo:

- Quiz ruim volta para Professor.
- Visual ruim volta para Designer.
- Fonte fraca volta para Pesquisador.
- Conteudo confuso volta para Redator.

---

## 6. Fluxo da Aula

1. Definir tema
2. Definir objetivo
3. Produzir conteudo
4. Criar exemplos
5. Criar exercicios
6. Criar quiz
7. Criar resumo
8. Criar PDF
9. Criar HTML
10. Publicar
11. Coletar feedback

---

## 7. Regra do Continue

Quando o usuario disser "continue" dentro deste projeto, o assistente deve:

- mostrar painel de progresso;
- identificar etapa atual;
- executar o proximo passo logico;
- evitar pular etapas;
- manter o checklist atualizado.

---

## 8. Regra Maxima

Todo fluxo deve reduzir confusao, evitar retrabalho e preservar contexto.

'@

"foundation/KNOWLEDGE_HUB_FOUNDATION.md" = @'
# KNOWLEDGE HUB FOUNDATION

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

O PredixAI Knowledge Hub e o repositorio central do conhecimento estruturado da PredixAI BR.

Ele organiza pesquisas, aulas, agentes, artigos, livros, casos, ferramentas, templates e decisoes.

---

## 2. Missao

Transformar conhecimento em ativos reutilizaveis para educacao, produtos, agentes, marketing e consultoria.

---

## 3. Visao

Ser a principal base brasileira de conhecimento aplicado em IA, engenharia, automacao, negocios e produtos digitais.

---

## 4. Estrutura

O Knowledge Hub sera organizado em areas:

- foundation
- academy
- research
- articles
- books
- prompts
- templates
- assets
- cases
- agents
- tools
- ui
- ux
- lx
- roadmap

---

## 5. Funcao de Cada Area

### foundation

Documentos principais da metodologia.

### academy

Aulas, modulos, quizzes e materiais educacionais.

### research

Pesquisas e engenharia reversa.

### articles

Artigos e publicacoes.

### books

Livros e capitulos.

### prompts

Prompts reutilizaveis.

### templates

Modelos de documentos.

### assets

Imagens, logos e recursos visuais.

### cases

Estudos de caso.

### agents

Base de conhecimento dos agentes.

### tools

Scripts e automacoes.

### ui

Padroes de interface.

### ux

Padroes de experiencia do usuario.

### lx

Padroes de experiencia de aprendizagem.

### roadmap

Planejamento e evolucao.

---

## 6. Regras

- Nada importante fica apenas em chat.
- Toda decisao relevante deve ser documentada.
- Todo documento deve evoluir por versoes.
- Todo conhecimento deve ser reutilizavel.
- Todo estudo deve gerar ativos futuros.

---

## 7. Papel no Ecossistema

O Knowledge Hub alimenta:

- PredixAI Academy
- PredixAI Agents
- PredixAI Media
- PredixAI Platform
- PredixAI Trader
- futuros produtos.

'@

"foundation/PLATFORM_ARCHITECTURE.md" = @'
# PLATFORM ARCHITECTURE

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

Definir a arquitetura conceitual do ecossistema PredixAI baseado em conhecimento.

---

## 2. Camadas da Plataforma

### Camada 1 - Entrada

Fontes de conhecimento:

- GitHub
- YouTube
- documentacao
- papers
- livros
- artigos
- experimentos
- clientes
- ideias internas.

---

### Camada 2 - Knowledge Pipeline

Transforma informacao bruta em conhecimento estruturado.

Etapas:

1. captura;
2. pesquisa;
3. validacao;
4. engenharia reversa;
5. organizacao;
6. documentacao.

---

### Camada 3 - Knowledge Hub

Repositorio central com:

- documentos;
- aulas;
- pesquisas;
- agentes;
- artigos;
- templates;
- decisoes;
- casos.

---

### Camada 4 - Produtos

O conhecimento alimenta:

- cursos;
- PDFs;
- site;
- videos;
- shorts;
- agentes;
- consultorias;
- softwares;
- ferramentas.

---

### Camada 5 - Feedback

Todo produto gera feedback.

Esse feedback volta ao Knowledge Hub e melhora as proximas versoes.

---

## 3. Motores da PredixAI

### Motor 1 - Producao de Conhecimento

Transforma fontes em conhecimento.

### Motor 2 - Producao de Produtos

Transforma conhecimento em valor de mercado.

---

## 4. Repositorios Relacionados

- predixai-knowledge
- academia-predixai
- predixai-academy
- predixai-agents
- predixai-platform

---

## 5. Principio Arquitetural

O conhecimento e o nucleo.

A Academia, os agentes e os produtos sao saidas desse nucleo.

'@

"foundation/PREDIXAI_LEARNING_DESIGN_SYSTEM.md" = @'
# PREDIXAI LEARNING DESIGN SYSTEM

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

Definir os principios visuais, interativos e educacionais usados na PredixAI.

Este documento une:

- UI Design
- UX Design
- Learning Experience
- Mobile First
- Acessibilidade
- Gamificacao

---

## 2. Mobile First

Todo conteudo deve ser pensado primeiro para smartphones.

A maioria dos usuarios acessara aulas, PDFs, quizzes e videos pelo celular.

---

## 3. UI Design

As interfaces devem ser:

- limpas;
- consistentes;
- legiveis;
- responsivas;
- objetivas.

---

## 4. UX Design

A experiencia deve reduzir esforco mental.

Regras:

- uma tela, um objetivo;
- botoes claros;
- navegacao simples;
- feedback visual;
- progresso visivel;
- no maximo tres toques para achar conteudo importante.

---

## 5. Learning Experience

A plataforma deve ajudar o aluno a aprender, nao apenas consumir conteudo.

Recursos esperados:

- quiz;
- flashcards;
- progresso;
- revisao de erros;
- repeticao espacada;
- desafios praticos;
- liberacao por nivel;
- gamificacao.

---

## 6. Paleta Oficial

### Azul Profundo

#0F172A  
Uso: fundo premium, cabecalhos, areas institucionais.

### Azul Tecnologia

#2563EB  
Uso: botoes, links, elementos principais.

### Verde IA

#10B981  
Uso: progresso, sucesso, conclusao.

### Fundo Claro

#F8FAFC  
Uso: areas de leitura.

### Texto Principal

#111827  
Uso: texto em fundo claro.

### Texto Secundario

#64748B  
Uso: legendas e apoio.

### Bordas

#CBD5E1  
Uso: cards, linhas, separadores.

### Alerta

#F59E0B  
Uso: atencao.

### Erro

#EF4444  
Uso: erro, reprovacao.

### Branco

#FFFFFF  
Uso: cards e areas limpas.

---

## 7. Componentes

- cards;
- botoes;
- barras de progresso;
- quiz;
- flashcards;
- alertas;
- tabelas;
- blocos de codigo;
- roadmap;
- certificados;
- player de video.

---

## 8. Acessibilidade

A plataforma deve considerar:

- contraste;
- tamanho de fonte;
- leitura mobile;
- modo claro;
- modo escuro;
- area de toque;
- linguagem simples.

---

## 9. Regra Maxima

Design bom e aquele que ajuda o aluno a continuar aprendendo.

'@

"foundation/MODELO_OFICIAL_DA_AULA.md" = @'
# MODELO OFICIAL DA AULA

Versao: 1.0  
Status: Fundacao Oficial  
Projeto: PredixAI Knowledge Hub

---

## 1. Proposito

Padronizar todas as aulas da Academia PredixAI.

Toda aula deve seguir a mesma estrutura para manter consistencia e qualidade.

---

## 2. Identificacao da Aula

Toda aula deve conter:

- codigo;
- titulo;
- modulo;
- fase;
- versao;
- data;
- nivel;
- tempo estimado;
- prerequisitos;
- status.

---

## 3. Painel de Progresso

Toda aula deve iniciar com:

- programa;
- fase;
- modulo;
- aula atual;
- status;
- proximo passo;
- percentual de conclusao.

---

## 4. Objetivos

Cada aula deve ter no maximo cinco objetivos.

Formato:

Ao final desta aula, o aluno sera capaz de...

---

## 5. Conteudo Principal

O conteudo deve ser claro, progressivo e didatico.

Deve usar:

- exemplos;
- analogias;
- listas;
- diagramas simples;
- aplicacao pratica.

---

## 6. Estudo de Caso

Sempre que possivel, a aula deve mostrar aplicacao na PredixAI ou em um projeto real.

---

## 7. Resumo Executivo

Resumo curto para revisao rapida.

---

## 8. Glossario

Termos tecnicos devem ser explicados em linguagem simples.

---

## 9. Exercicios

Antes do quiz, o aluno deve praticar o conceito.

---

## 10. Quiz

Todo quiz deve ter:

- 10 perguntas;
- 5 alternativas;
- apenas uma correta;
- respostas A, B, C, D ou E.

---

## 11. Correcao Comentada

A correcao deve explicar:

- por que a resposta correta esta certa;
- por que as outras estao erradas.

---

## 12. Flashcards

A aula deve gerar perguntas curtas para revisao.

---

## 13. Licao Aprendida

Toda aula deve terminar com uma frase-principio.

---

## 14. Produtos Gerados

Ao final, a aula deve gerar:

- Markdown;
- HTML;
- PDF;
- artigo;
- roteiro de video;
- roteiro de short;
- carrossel;
- base para agentes.

---

## 15. Criterio de Conclusao

A aula so e concluida quando:

- conteudo foi produzido;
- quiz foi criado;
- materiais foram gerados;
- revisao foi feita;
- publicacao foi realizada.

'@
}

foreach ($file in $docs.Keys) {
    $dir = Split-Path $file
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    Set-Content -Encoding UTF8 -Path $file -Value $docs[$file]
}

Write-Host "Todos os documentos completos da fundacao foram preenchidos."