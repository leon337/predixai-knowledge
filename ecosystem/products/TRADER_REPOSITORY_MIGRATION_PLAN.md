# PredixAI Trader — Plano Formal de Separação

## Decisão

Separar futuramente o produto Trader do `predixai-platform` para um repositório próprio chamado `predixai-trader`.

## Não executar agora

Este documento é plano. Não mover arquivos nesta fase.

## Por que separar

- O Trader é produto vertical grande.
- O `predixai-platform` deve ser núcleo reutilizável.
- A separação evita acoplamento, confusão de contexto e documentação duplicada.

## O que fica no predixai-platform

- Core.
- Capture Engine.
- Vision Engine.
- OCR.
- Perception.
- Auditoria.
- Segurança.
- Runtime base.
- Ferramentas compartilháveis.

## O que vai para predixai-trader

- Código específico do Trader.
- Scripts de execução do Trader.
- Testes de produto Trader.
- Documentação de produto Trader.
- Dados e contratos específicos do Observador, quando aplicável.

## Como evitar quebra de imports

1. Mapear imports atuais.
2. Criar pacote de compatibilidade temporário.
3. Definir API pública do `predixai-platform`.
4. Migrar em etapas pequenas.
5. Validar testes após cada etapa.

## Como preservar histórico

Opções recomendadas:

1. `git subtree split` para preservar histórico por subdiretório.
2. Migração manual com referência de commits quando o histórico por pasta não for suficiente.
3. Registrar ADR final antes da migração.

## Riscos

- Quebra de imports.
- Perda de histórico.
- Duplicação de documentação.
- Dados locais fora do Git.
- Scripts `.bat` dependentes de caminho antigo.

## Critério de início

Só iniciar após:

- ECO-BASE-001 publicado.
- PTP-103 resolvido ou formalmente congelado.
- Plano aprovado pelo Leo.
- Backup/patch local salvo.
