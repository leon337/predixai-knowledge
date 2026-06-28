$docs = @{
"foundation/PREDIXAI_KNOWLEDGE_SYSTEM.md" = @'
# PREDIXAI KNOWLEDGE SYSTEM

O conhecimento é o principal ativo da PredixAI BR.

Todo estudo deve ser documentado, versionado e reutilizado para gerar aulas, agentes, produtos, artigos, vídeos e soluções práticas.
'@

"foundation/PREDIXAI_RESEARCH_SYSTEM.md" = @'
# PREDIXAI RESEARCH SYSTEM

Sistema oficial de pesquisa da PredixAI BR.

Toda pesquisa deve priorizar fontes confiáveis, validação técnica, engenharia reversa e aplicação prática na PredixAI.
'@

"foundation/PREDIXAI_CONTENT_SYSTEM.md" = @'
# PREDIXAI CONTENT SYSTEM

Pesquisar uma vez. Publicar em vários formatos.

Cada aula deve gerar Markdown, HTML, PDF, blog, newsletter, carrossel, vídeo, shorts e base para agentes.
'@

"foundation/PREDIXAI_QUALITY_SYSTEM.md" = @'
# PREDIXAI QUALITY SYSTEM

Nenhum conteúdo será publicado sem revisão técnica, didática e visual.

Qualidade é requisito, não etapa opcional.
'@

"foundation/PREDIXAI_ROLE_SYSTEM.md" = @'
# PREDIXAI ROLE SYSTEM

Define os papéis humanos e dos agentes: pesquisador, professor, redator, designer, revisor, marketing e publicador.
'@

"foundation/PREDIXAI_WORKFLOW_SYSTEM.md" = @'
# PREDIXAI WORKFLOW SYSTEM

Fluxo oficial: ideia, pesquisa, validação, engenharia reversa, aula, revisão, publicação, distribuição e melhoria contínua.
'@

"foundation/KNOWLEDGE_HUB_FOUNDATION.md" = @'
# KNOWLEDGE HUB FOUNDATION

O PredixAI Knowledge Hub organiza todo o conhecimento da PredixAI em pesquisa, academia, mídia, agentes, livros, casos e produtos.
'@

"foundation/PLATFORM_ARCHITECTURE.md" = @'
# PLATFORM ARCHITECTURE

A plataforma será construída em camadas: entrada, pipeline de conhecimento, hub central, produtos e feedback contínuo.
'@

"foundation/PREDIXAI_LEARNING_DESIGN_SYSTEM.md" = @'
# PREDIXAI LEARNING DESIGN SYSTEM

Todo design será Mobile First e seguirá boas práticas de UI, UX e Learning Experience.

Paleta oficial:
- #0F172A
- #2563EB
- #10B981
- #F8FAFC
- #111827
'@

"foundation/MODELO_OFICIAL_DA_AULA.md" = @'
# MODELO OFICIAL DA AULA

Toda aula terá objetivo, pré-requisitos, conteúdo, exemplos, glossário, exercícios, quiz A-E, flashcards, resumo, PDF, HTML e publicação.
'@
}

foreach ($file in $docs.Keys) {
    Set-Content -Encoding UTF8 -Path $file -Value $docs[$file]
}

Write-Host "✅ Todos os documentos da fundação foram preenchidos."