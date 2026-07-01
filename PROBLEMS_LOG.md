# PredixAI BR — PROBLEMS_LOG

## P-001 — Contexto global fragmentado

Problema: o projeto cresceu para vários repositórios e o contexto ainda estava concentrado no Trader.

Impacto: risco de decisões duplicadas, documentação divergente e perda de memória.

Status: tratado pelo ECO-BASE-001.

## P-002 — predixai-platform acumulando produto vertical

Problema: o Trader está dentro do núcleo técnico.

Impacto: risco de acoplamento e crescimento desorganizado.

Status: criar plano de migração, sem mover agora.

## P-003 - PTP-103 falhou no build

Erro:

```text
TypeError: MarketSessionRecorder.close_session() takes 1 positional argument but 2 positional arguments (and 1 keyword-only argument) were given
```

Status: resolvido em 2026-07-01.

Resolucao:
- PTP-103 - Overnight Observer publicado no `predixai-platform`.
- Chamada corrigida para `close_session(session_id=session.id, status="completed")`.
- `MarketSessionRecorder.close_session` preservou assinatura keyword-only.
- PTP-102 validado como preservado.
- Proximo passo: auditoria final da V1 Trader.

## P-004 — Site ainda não era portal global completo

Problema: site tinha Knowledge Hub, mas precisava de páginas públicas de ecossistema.

Status: páginas propostas em `docs/`.
