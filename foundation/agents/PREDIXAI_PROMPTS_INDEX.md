# Índice — Prompts Oficiais PredixAI Agents

**Projeto:** PredixAI BR
**Pacote:** Prompts operacionais para Codex, OpenClaw e Agente Investigador
**Versão:** v1.0
**Status:** pronto para uso em `foundation/` ou pasta de agentes

---

## Arquivos do pacote

1. `PREDIXAI_CODEX_PROMPT_MODO_1.md`
   Prompt para Construção.
   Uso: implementar código sem documentação, sem commit e sem push.

2. `PREDIXAI_CODEX_PROMPT_MODO_2.md`
   Prompt para Validação.
   Uso: executar testes completos relevantes, validação prática, correções dentro do escopo e veredito.

3. `PREDIXAI_CODEX_PROMPT_MODO_3.md`
   Prompt para Publicação.
   Uso: atualizar documentação oficial, commit, push, auditoria GitHub e relatório final somente após validação aprovada.

4. `PREDIXAI_INVESTIGATOR_PROMPT.md`
   Prompt para Agente Investigador.
   Uso: auditar relatórios, separar claims de evidências, classificar status e emitir veredito.

5. `PREDIXAI_OPENCLAW_LOCAL_EXECUTOR_PROMPT.md`
   Prompt para OpenClaw Executor Local.
   Uso: executar comandos localmente no notebook com diretório autorizado, segurança, limites e evidência.

---

## Regra central

Construção não publica.
Validação não documenta oficialmente.
Publicação não implementa escopo novo.
Relatório não é prova.
Fonte primária vence narrativa.
Evidência decide.
Arquiteto aprova.

---

## Local recomendado

Opção 1:

`foundation/`

Opção 2:

`foundation/agents/`

Opção 3:

`agents/prompts/`

Para a PredixAI Knowledge Hub, a recomendação inicial é:

`foundation/agents/`

Mantém os prompts organizados sem misturar todos os arquivos fundacionais na raiz de `foundation/`.
