# ADR-001 — Separar PredixAI Trader do predixai-platform

## Status

Proposto. Não executar ainda.

## Contexto

O `predixai-platform` nasceu como plataforma central e recebeu o primeiro produto, PredixAI Trader. Com o crescimento do ecossistema, o Trader virou produto vertical grande.

## Decisão

Criar futuramente um repositório `predixai-trader` para o produto Trader.

## Consequências positivas

- Plataforma volta a ser núcleo reutilizável.
- Produto Trader ganha documentação e ciclo próprios.
- Reduz acoplamento.
- Facilita novos produtos da PredixAI.

## Consequências negativas

- Migração exige cuidado com imports.
- Scripts Windows podem quebrar.
- Histórico precisa ser preservado.
- Testes devem ser reorganizados.

## Restrições

- Não migrar no ECO-BASE-001.
- Não resolver PTP-103 antes da organização global.
- Não commitar sem validação.
