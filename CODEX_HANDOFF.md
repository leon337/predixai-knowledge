# PredixAI BR — CODEX_HANDOFF

## Função

Codex deve usar este arquivo antes de qualquer PTP, build, validação ou publicação.

## Ordem mínima de leitura

1. `ECOSYSTEM_STATE.md`
2. `ecosystem_context.json`
3. `REPOSITORY_MAP.md`
4. `PTP_LEDGER.md`
5. `PROBLEMS_LOG.md`
6. Documento específico do repositório-alvo

## Restrições ativas

- Não migrar Trader agora.
- Não publicar PTP-103.
- Não executar reset destrutivo.
- Não commitar sem validação.
- Não fazer push sem aprovação do Leo.

## Estado crítico

- Último PTP aprovado: PTP-102.
- PTP pendente: PTP-103.
- Erro pendente: `MarketSessionRecorder.close_session()` recebeu argumentos incompatíveis.

## Próxima ação permitida

Após aprovação do Leo: aplicar ECO-BASE-001 no `predixai-knowledge`, validar e só depois retornar ao PTP-103.
