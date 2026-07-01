# PredixAI BR — GLOBAL_DECISIONS

## ECO-BASE-001-D001 — PredixAI BR é ecossistema

Decisão: tratar PredixAI BR como ecossistema multi-repositório, não como sinônimo de Trader.

Motivo: reduzir perda de contexto, duplicidade de documentação e acoplamento indevido.

## ECO-BASE-001-D002 — predixai-knowledge é fonte oficial de memória

Decisão: todo contexto global vive no `predixai-knowledge` e no site público.

Motivo: humanos, ChatGPT, Codex, OpenClaw e agentes precisam de fonte única.

## ECO-BASE-001-D003 — predixai-platform volta a ser núcleo técnico

Decisão: o `predixai-platform` deve conter motores reutilizáveis e não ser moradia permanente do Trader.

Motivo: preservar escalabilidade do ecossistema.

## ECO-BASE-001-D004 — Trader será separado, mas não agora

Decisão: criar plano formal de migração para futuro `predixai-trader`, sem executar a migração nesta fase.

Motivo: evitar quebra de imports, histórico, banco, scripts e validações.

## ECO-BASE-001-D005 — GitHub Pages vira portal de contexto

Decisão: `docs/index.html` deve apontar para páginas públicas de ecossistema, repositórios, decisões, problemas, ideias, roadmap e handoff.

Motivo: consulta rápida e auditável.
