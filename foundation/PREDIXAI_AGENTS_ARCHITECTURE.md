# Arquitetura Oficial PredixAI Agents

**Arquivo:** `PREDIXAI_AGENTS_ARCHITECTURE.md`
**Projeto:** PredixAI BR
**Versão:** v1.0
**Status:** Documento fundacional ativo
**Local recomendado:** `foundation/PREDIXAI_AGENTS_ARCHITECTURE.md`
**Responsável arquitetural:** Leo, Arquiteto fundador da PredixAI BR
**Uso previsto:** ChatGPT, Codex, OpenClaw e futuros agentes da PredixAI

---

## 1. Visão geral

A Arquitetura PredixAI Agents define o modelo oficial de uso de agentes humanos e agentes de IA no projeto PredixAI BR.

Seu objetivo é garantir que planejamento, execução, validação, investigação e publicação ocorram com papéis separados, limites claros, evidências rastreáveis e auditoria.

A PredixAI não trata agentes de IA como autoridade final. Agentes podem planejar, executar, validar, investigar, resumir e publicar dentro de regras definidas, mas nenhuma decisão crítica deve avançar sem fonte primária, evidência, validação e aprovação adequada.

Esta arquitetura existe para impedir execução sem contexto, validação superficial, publicação prematura, documentação falsa, consenso artificial e perda de rastreabilidade entre chats, GitHub, PTPs, Milestones e documentos oficiais.

O documento se aplica ao uso de ChatGPT, Codex, OpenClaw e futuros agentes da PredixAI, respeitando os três modos oficiais de execução: Construção, Validação e Publicação.

---

## 2. Resumo executivo

A PredixAI Agents é uma arquitetura operacional baseada em papéis, modos e evidências.

Ela organiza como agentes devem acessar contexto, executar tarefas, validar resultados, investigar claims, acompanhar pendências e publicar Milestones.

O objetivo é usar IA com produtividade sem abrir mão de segurança, auditoria e consistência arquitetural.

Princípio central:

> A PredixAI não confia em agente isolado.
> A PredixAI confia em sistema com papéis, limites, evidências, validação e auditoria.

---

## 3. Escopo de uso

Este documento deve orientar:

- planejamento de Milestones;
- criação de PTPs;
- execução de código;
- validação de funcionalidades;
- auditoria de relatórios;
- publicação de Milestones;
- uso de agentes locais;
- uso de agentes em nuvem;
- organização de pendências;
- criação de documentos oficiais;
- criação de futuros agentes da PredixAI.

Este documento não substitui o Arquiteto.

Ele orienta a operação, reduz ambiguidade e define regras para que humanos e agentes atuem de forma coordenada.

---

## 4. Cinco pilares da PredixAI Agents

A arquitetura PredixAI Agents é sustentada por cinco pilares obrigatórios:

1. Memória.
2. Contenção.
3. Benchmark.
4. Operação.
5. Investigação.

Esses pilares existem para impedir que agentes atuem sem contexto, sem limite, sem critério de escolha, sem visibilidade operacional ou sem evidência.

### 4.1 Memória

A Memória preserva o estado do projeto, decisões, regras, Milestones, PTPs, pendências, validações e contexto mínimo necessário para que humanos e agentes não recomecem do zero a cada sessão.

A Memória deve entregar apenas o contexto necessário para a tarefa atual, evitando releitura desnecessária, excesso de tokens e reabertura de decisões já validadas.

A Memória deve responder:

- qual é o estado atual do projeto;
- qual foi a última Milestone concluída;
- quais decisões estão vigentes;
- quais regras precisam ser respeitadas;
- quais pendências existem;
- qual contexto mínimo o agente precisa para executar a tarefa.

### 4.2 Contenção

A Contenção define o que cada agente pode ler, alterar, executar e publicar.

Ela protege o projeto contra alterações fora do escopo, exposição de segredos, execução perigosa, documentação fora do modo correto, commit prematuro, push indevido e quebra de arquitetura.

Todo agente executor deve atuar dentro de modo, escopo e permissões previamente definidos.

A Contenção deve responder:

- qual é o modo ativo;
- qual é o escopo autorizado;
- quais arquivos podem ser alterados;
- quais arquivos não podem ser alterados;
- quais comandos podem ser executados;
- quais ações são proibidas;
- quais evidências serão exigidas.

### 4.3 Benchmark

O Benchmark mede agentes, modelos e ferramentas por evidência operacional.

A PredixAI não escolhe agentes apenas por reputação, custo, velocidade ou qualidade aparente da conversa. A escolha deve considerar entrega real, aderência ao escopo, testes, custo, tempo, retrabalho, segurança, relatório e respeito à arquitetura.

O Benchmark deve ser usado de forma seletiva, especialmente quando a escolha do agente impactar qualidade, risco, custo ou produtividade.

Benchmark não é ritual. É ferramenta de decisão.

### 4.4 Operação

A Operação dá visibilidade às pendências do projeto.

Ela acompanha issues, pull requests, PTPs, Milestones, bloqueios, validações pendentes, documentação pendente e divergências entre chats, relatórios, GitHub e estado oficial do projeto.

Pendência invisível não pode ser tratada como ausência de problema.

A Operação deve responder:

- o que está pendente;
- o que está bloqueado;
- o que foi validado;
- o que ainda depende de ação;
- o que diverge entre GitHub, relatório e documentação;
- o que precisa ser resolvido antes da próxima fase.

### 4.5 Investigação

A Investigação separa afirmação de evidência.

Relatórios de agentes, validações, publicações e decisões críticas devem ser decompostos em claims verificáveis. Cada claim relevante deve possuir fonte primária, evidência rastreável, contraevidência quando aplicável, grau de confiança, risco restante e veredito.

Na PredixAI, consenso de agentes ou LLMs não substitui fonte primária.

Evidência auditável tem prioridade sobre narrativa, fluência ou concordância.

---

## 5. Papéis oficiais da PredixAI Agents

A PredixAI Agents é organizada por papéis funcionais separados.

Um papel não representa obrigatoriamente uma IA diferente. Ele pode ser exercido por humano, ChatGPT, Codex, OpenClaw, script, checklist ou futuro agente especializado.

A separação de papéis existe para impedir que um mesmo agente planeje, execute, valide, audite e aprove o próprio trabalho.

### 5.1 Arquiteto

O Arquiteto define direção, escopo, prioridade, Milestone, PTP, risco, modo de execução e decisão final.

Na PredixAI BR, o Arquiteto fundador é Leo.

ChatGPT pode atuar como assistente de arquitetura, planejamento, investigação e organização, mas não substitui a aprovação do Arquiteto em decisões críticas.

O Arquiteto é responsável por:

- definir objetivo;
- definir escopo;
- definir Milestone;
- definir PTP;
- classificar risco;
- autorizar modo de execução;
- aprovar ou rejeitar avanço;
- resolver conflitos;
- tomar decisão final.

### 5.2 Memória

A Memória preserva e recupera o estado oficial do projeto.

Ela deve fornecer contexto mínimo e relevante para a tarefa atual, incluindo estado do projeto, regras vigentes, decisões, Milestones, PTPs, pendências e limitações conhecidas.

A Memória não deve forçar releitura desnecessária de arquivos já validados nem reabrir decisões aprovadas sem motivo.

### 5.3 Operador

O Operador acompanha pendências operacionais do projeto.

Ele observa issues, pull requests, PTPs, Milestones, bloqueios, validações pendentes, documentos pendentes e divergências entre chats, relatórios, GitHub e estado oficial.

O Operador não resolve tudo sozinho. Sua função é tornar pendências visíveis para decisão.

### 5.4 Executor

O Executor implementa o escopo autorizado.

Ele pode ser Codex, OpenClaw, OpenCode, humano, script local ou outro agente. Deve atuar dentro do modo definido, respeitando escopo, arquivos permitidos, comandos autorizados e limites de segurança.

O Executor deve entregar evidências mínimas do que fez e não pode aprovar o próprio trabalho.

### 5.5 Validador

O Validador prova funcionamento.

Ele executa testes, validações práticas, verificações de comportamento, análise de logs, checagem de arquivos gerados e reprodução do resultado esperado.

O Validador deve classificar o resultado como:

- aprovado;
- reprovado;
- parcialmente validado;
- bloqueado.

### 5.6 Investigador

O Investigador audita claims.

Ele transforma relatórios e afirmações em claims verificáveis e exige fonte primária, evidência rastreável, contraevidência quando aplicável, grau de confiança, risco restante e veredito.

O Investigador não aceita fluência, consenso ou autoridade como prova suficiente.

### 5.7 Benchmark

O Benchmark compara agentes, modelos, ferramentas e fluxos quando a escolha impactar qualidade, custo, tempo, risco ou retrabalho.

Ele deve ser usado de forma seletiva, principalmente para adoção de agente novo, troca de ferramenta, escolha de modelo, definição de fluxo multiagente ou tarefa crítica.

### 5.8 Publicador

O Publicador executa o fechamento formal no MODO 3 — Publicação.

Ele atualiza documentos oficiais, prepara commit, executa push, confirma auditoria GitHub e gera relatório final.

O Publicador não deve implementar escopo novo durante a publicação.

---

## 6. Modos oficiais de execução

A PredixAI opera com três modos oficiais de execução:

1. MODO 1 — Construção.
2. MODO 2 — Validação.
3. MODO 3 — Publicação.

Cada modo possui objetivo, permissões, proibições e critério de avanço.

Agentes não devem misturar modos.

### 6.1 MODO 1 — Construção

Objetivo: implementar o escopo solicitado com o menor impacto possível.

Neste modo, o agente executor deve:

- implementar apenas o escopo autorizado;
- alterar somente os arquivos necessários;
- executar testes mínimos relacionados ao escopo;
- executar `compileall`;
- executar `git diff --check`;
- relatar arquivos alterados, comandos executados, resultados e limitações.

Neste modo, o agente não deve:

- atualizar documentação oficial;
- atualizar `CHANGELOG.md`;
- atualizar `PROJECT_STATE.md`;
- atualizar `predixai_context.json`;
- fazer commit;
- fazer push;
- publicar;
- declarar Milestone concluída;
- ampliar escopo sem autorização do Arquiteto.

Critério de avanço para MODO 2:

- escopo implementado;
- testes mínimos executados;
- `compileall` executado;
- `git diff --check` executado;
- relatório curto e auditável entregue.

### 6.2 MODO 2 — Validação

Objetivo: provar que a funcionalidade implementada funciona de forma adequada.

Neste modo, o agente validador deve:

- executar testes completos relevantes;
- realizar validação prática quando aplicável;
- analisar logs e arquivos gerados;
- verificar o comportamento esperado;
- corrigir erros encontrados dentro do escopo autorizado;
- registrar evidências;
- emitir veredito explícito.

Neste modo, o agente não deve:

- atualizar documentação oficial;
- fazer commit;
- fazer push;
- publicar;
- declarar Milestone concluída;
- abrir novo escopo sem autorização do Arquiteto.

Vereditos possíveis:

- aprovado para publicação;
- reprovado;
- parcialmente validado;
- bloqueado.

Critério de avanço para MODO 3:

- funcionalidade validada;
- evidências registradas;
- erros críticos resolvidos;
- limitações conhecidas declaradas;
- aprovação do Arquiteto para publicação.

### 6.3 MODO 3 — Publicação

Objetivo: registrar oficialmente o estado validado da Milestone.

Este modo só pode ocorrer após validação aprovada.

Neste modo, o Publicador deve:

- atualizar `PROJECT_STATE.md`;
- atualizar `CHANGELOG.md`;
- atualizar `predixai_context.json`;
- revisar o diff final;
- preparar commit;
- executar push;
- auditar GitHub;
- gerar relatório final;
- registrar pendências restantes.

Neste modo, o agente não deve:

- implementar novo escopo;
- corrigir bug grande sem voltar ao modo adequado;
- publicar sem validação aprovada;
- ignorar pendência crítica;
- declarar Milestone concluída sem commit, push e auditoria GitHub.

Critério de conclusão:

- documentação oficial atualizada;
- commit realizado;
- push realizado;
- GitHub auditado;
- relatório final emitido;
- Milestone formalmente encerrada.

---

## 7. Evidência, investigação e auditoria

A PredixAI não trata relatório, fluência, consenso ou autoridade de agente como prova final.

Toda afirmação crítica deve ser tratada como claim verificável.

### 7.1 Claim

Claim é uma afirmação que pode ser comprovada, refutada ou permanecer inconclusiva.

Exemplos de claims:

- “o escopo foi implementado”;
- “os testes passaram”;
- “a validação foi concluída”;
- “o commit foi feito”;
- “o push foi realizado”;
- “a documentação foi atualizada”;
- “a Milestone foi concluída”.

Nenhuma claim crítica deve avançar sem evidência suficiente.

### 7.2 Evidência

Evidência é qualquer artefato verificável que sustenta ou contradiz uma claim.

Evidências fortes incluem:

- Git diff;
- saída real de teste;
- log;
- print real;
- arquivo gerado;
- hash de commit;
- GitHub após push;
- documentação oficial;
- saída de comando;
- validação prática;
- relatório de auditoria.

A evidência deve ser rastreável e, sempre que possível, ligada a uma fonte primária.

### 7.3 Fonte primária

Fonte primária é a origem mais direta da verdade sobre uma claim.

Na PredixAI:

- código deve ser confirmado no repositório;
- teste deve ser confirmado pela saída real do comando;
- publicação deve ser confirmada no GitHub;
- documentação deve ser confirmada no arquivo oficial;
- Milestone deve ser confirmada por validação, documentação, commit, push, auditoria GitHub e relatório final.

Fonte primária tem prioridade sobre narrativa, relatório, consenso ou impressão.

### 7.4 Contraevidência

A investigação deve procurar também evidências contra a claim.

Contraevidência pode incluir:

- teste falhando;
- arquivo esperado não alterado;
- diff fora do escopo;
- documentação alterada no modo errado;
- commit ausente;
- push não confirmado;
- issue crítica ainda aberta;
- validação simulada sem declaração de limitação;
- divergência entre relatório e GitHub.

Contraevidência relevante deve ser registrada antes da decisão.

### 7.5 Status da claim

Cada claim crítica deve receber um dos seguintes status:

- **Comprovada:** há evidência forte e fonte primária suficiente.
- **Parcialmente comprovada:** há alguma evidência, mas falta confirmação importante.
- **Não comprovada:** a claim foi feita, mas não há evidência suficiente.
- **Contradita:** há evidência contra a claim.
- **Bloqueada:** não foi possível verificar por limitação externa.

### 7.6 Veredito

A investigação deve produzir veredito objetivo.

Vereditos possíveis:

- aprovado para próxima fase;
- reprovado;
- parcialmente validado;
- bloqueado;
- devolver ao Executor;
- exigir nova evidência;
- abrir novo PTP;
- levar ao Arquiteto.

### 7.7 Auditoria

A auditoria verifica se claims, evidências, fontes primárias, contraevidências, modo de execução e documentação estão coerentes.

Nenhuma Milestone deve ser considerada concluída sem validação prática, documentação oficial quando aplicável, commit, push, auditoria GitHub e relatório final.

---

## 8. Classificação de risco

A PredixAI deve classificar o risco de cada tarefa antes de definir quais agentes, modos e camadas de auditoria serão utilizados.

A governança deve ser proporcional ao risco.

### 8.1 Baixo risco

Tarefas de baixo risco são pequenas, reversíveis e não afetam arquitetura, funcionalidade validada, documentação oficial, publicação, segredos ou Milestones.

Exemplos:

- correção de texto simples;
- ajuste de formatação;
- organização de checklist;
- rascunho de conteúdo;
- anotação interna.

Camadas mínimas:

- Executor;
- revisão simples quando aplicável.

### 8.2 Médio risco

Tarefas de médio risco afetam funcionalidade localizada ou arquivo relevante, mas não alteram arquitetura, estado oficial ou publicação.

Exemplos:

- correção de função pequena;
- criação de teste específico;
- ajuste de script auxiliar;
- melhoria localizada de parser;
- correção de comportamento isolado.

Camadas mínimas:

- Memória mínima;
- Executor;
- Validador;
- evidência mínima;
- Investigador leve quando houver claim crítica.

### 8.3 Alto risco

Tarefas de alto risco afetam arquitetura, fluxo principal, validação, OCR, calibração, documentação oficial, Milestone ou comportamento já validado.

Exemplos:

- alteração em módulo principal;
- mudança em fluxo de PTP;
- ajuste de OCR ou calibração visual;
- alteração de regra de Milestone;
- edição de `PROJECT_STATE.md`;
- edição de `predixai_context.json`;
- edição de `CHANGELOG.md`;
- mudança em comportamento validado.

Camadas mínimas:

- Arquiteto;
- Memória;
- Operador;
- Executor;
- Validador;
- Investigador;
- evidência forte;
- aprovação antes de avanço.

### 8.4 Crítico

Tarefas críticas afetam publicação, commit, push, estado oficial, segredos, deploy, credenciais, dados sensíveis, decisão estratégica ou fechamento de Milestone.

Exemplos:

- publicação de Milestone;
- commit;
- push;
- configuração de token;
- alteração de segredo;
- deploy;
- alteração de documento fundacional;
- decisão arquitetural irreversível;
- uso de agente novo em tarefa sensível.

Camadas obrigatórias:

- Arquiteto;
- Memória;
- Operador;
- Executor autorizado;
- Validador;
- Investigador;
- Publicador, quando for MODO 3;
- auditoria GitHub;
- relatório final;
- aprovação explícita.

### 8.5 Regra de proporcionalidade

A PredixAI deve aplicar controle proporcional ao risco.

Tarefa simples não deve receber burocracia excessiva.

Tarefa crítica não deve ser executada com fluxo leve.

Regra operacional:

- baixo risco: velocidade;
- médio risco: evidência mínima;
- alto risco: validação forte;
- crítico: auditoria completa.

---

## 9. Regras operacionais para ChatGPT, Codex e OpenClaw

A PredixAI pode utilizar diferentes agentes e ferramentas, desde que cada uma atue dentro de papel, modo, escopo e limite definidos.

Nenhuma ferramenta deve ser tratada como autoridade final isolada.

### 9.1 Regras para ChatGPT

Na PredixAI, ChatGPT pode atuar como:

- Arquiteto assistente;
- planejador;
- investigador;
- auditor de relatórios;
- organizador de conhecimento;
- gerador de prompts para Codex, OpenClaw e futuros agentes;
- estruturador de documentos e decisões.

ChatGPT deve:

- respeitar o modo ativo da tarefa;
- separar afirmação de evidência;
- exigir fonte primária para claims críticas;
- apontar incertezas e limitações;
- ajudar o Arquiteto a decidir com base em evidência;
- gerar prompts claros para execução, validação ou publicação;
- consultar fonte atual quando a informação puder ter mudado.

ChatGPT não deve:

- declarar Milestone concluída sem validação, commit, push e auditoria GitHub;
- aceitar relatório de agente como prova final;
- inventar estado do repositório;
- aprovar publicação sem evidência;
- misturar construção, validação e publicação;
- substituir a decisão final do Arquiteto em decisões críticas.

### 9.2 Regras para Codex

Na PredixAI, Codex atua principalmente como Executor de desenvolvimento.

Codex deve:

- ler apenas o contexto mínimo obrigatório antes da execução, conforme a política vigente;
- respeitar o modo ativo: Construção, Validação ou Publicação;
- implementar apenas o escopo autorizado;
- alterar somente arquivos necessários;
- executar testes exigidos pelo modo;
- executar `compileall` quando aplicável;
- executar `git diff --check` no MODO 1;
- relatar arquivos alterados, comandos executados, resultados, limitações e pendências;
- corrigir erros encontrados durante validação quando estiver autorizado.

Codex não deve:

- atualizar documentação oficial no MODO 1 ou MODO 2;
- atualizar `PROJECT_STATE.md`, `CHANGELOG.md` ou `predixai_context.json` fora do MODO 3;
- fazer commit fora do MODO 3;
- fazer push fora do MODO 3;
- ampliar escopo sem autorização;
- alterar arquitetura sem aprovação;
- ocultar falhas de teste;
- declarar Milestone concluída sem auditoria GitHub.

### 9.3 Regras para OpenClaw

Na PredixAI, OpenClaw pode atuar como Executor local no computador do Arquiteto.

OpenClaw deve:

- executar apenas comandos autorizados;
- respeitar o diretório do projeto;
- preservar arquivos fora do escopo;
- registrar saída de comandos;
- respeitar o modo ativo;
- aplicar alterações pequenas e auditáveis;
- apoiar validação local quando necessário;
- entregar relatório com evidências.

OpenClaw não deve:

- acessar segredos sem autorização explícita;
- executar comandos destrutivos sem autorização explícita;
- alterar arquivos fora do projeto;
- fazer commit ou push fora do MODO 3;
- publicar sem validação aprovada;
- assumir decisão arquitetural;
- executar ações irreversíveis sem confirmação do Arquiteto.

### 9.4 Regras comuns

Todos os agentes devem:

- respeitar o escopo autorizado;
- atuar dentro do modo definido;
- declarar limitações;
- registrar evidências;
- diferenciar fato, hipótese e recomendação;
- permitir auditoria posterior;
- preservar a consistência arquitetural do projeto.

Nenhum agente deve aprovar sozinho o próprio trabalho.

Na PredixAI, execução precisa de validação, validação precisa de evidência, publicação precisa de auditoria e decisão crítica precisa do Arquiteto.

---

## 10. Fluxo operacional completo

O fluxo operacional completo da PredixAI Agents deve seguir esta ordem:

1. Classificar o risco da tarefa.
2. Consultar memória mínima obrigatória.
3. Verificar pendências relevantes.
4. Definir modo de execução.
5. Autorizar escopo.
6. Executar com limite.
7. Validar com evidência.
8. Investigar claims críticas.
9. Aprovar, rejeitar, bloquear ou devolver.
10. Publicar apenas no MODO 3.
11. Auditar GitHub quando aplicável.
12. Registrar decisão e estado oficial.

Se alguma etapa crítica falhar, o fluxo não deve avançar.

---

## 11. Proibições oficiais

É proibido:

- agente aprovar o próprio trabalho;
- publicar sem validação aprovada;
- fazer commit fora do MODO 3;
- fazer push fora do MODO 3;
- atualizar documentação oficial no MODO 1 ou MODO 2;
- ignorar teste falho;
- ocultar limitação;
- expor segredo;
- executar comando destrutivo sem autorização explícita;
- tomar consenso de LLM como prova;
- declarar Milestone concluída sem GitHub;
- declarar validação sem evidência;
- ampliar escopo sem autorização do Arquiteto;
- misturar construção, validação e publicação.

---

## 12. Decisões oficiais incorporadas

Este documento consolida as seguintes decisões arquiteturais:

- **PredixAI-MEM-001:** adoção de memória persistente do projeto.
- **PredixAI-JAIL-001:** execução segura e limitada para agentes.
- **PredixAI-BENCH-010:** benchmark com tarefa fixa, evidência, custo, tempo e retrabalho.
- **PredixAI-OPS-009:** monitoramento de pendências antes de construção, validação e publicação.
- **PredixAI-INV-010:** investigação baseada em claims, fonte primária, evidência e veredito.
- **PredixAI-AGENTS-010:** arquitetura de agentes com papéis, modos e governança proporcional ao risco.
- **PredixAI-DOC-010:** geração deste documento como versão fundacional v1.0 da Arquitetura Oficial PredixAI Agents.

---

## 13. Checklist rápido de uso

Antes de executar:

- Qual é o risco da tarefa?
- Qual é o modo ativo?
- Qual é o escopo autorizado?
- Qual contexto mínimo deve ser lido?
- Quais arquivos podem ser alterados?
- Quais ações são proibidas?
- Qual evidência será exigida?
- Quem precisa aprovar o avanço?

Depois de executar:

- O que foi alterado?
- Quais comandos foram executados?
- Quais testes rodaram?
- Qual evidência existe?
- Há falha ou limitação?
- Há pendência restante?
- A claim está comprovada?
- Pode avançar para a próxima fase?

---

## 14. Encerramento

A PredixAI não usa IA como aposta.

A PredixAI usa IA como arquitetura operacional.

Agentes são úteis quando possuem papel, limite, evidência e auditoria.

A produtividade da PredixAI não deve nascer de improviso, mas de um sistema em que humanos e agentes atuam com responsabilidade clara, validação real e histórico auditável.

Princípio final:

> Agente isolado ajuda.
> Sistema de agentes governa.
> Evidência decide.
> Arquiteto aprova.
