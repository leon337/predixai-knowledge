# ADR-003 — Criar predixai-knowledge-app separado

## Status
Proposto.

## Contexto
O Knowledge Hub atual é site público e estático. Ele não deve ser quebrado por uma migração prematura.

## Decisão
Criar futuramente um repositório separado chamado `predixai-knowledge-app`.

## Motivos
- Reduz risco.
- Mantém o site público funcionando.
- Permite testar Firebase sem afetar a memória oficial.
- Permite evoluir para app real com login e banco.

## Não fazer agora
- Não migrar o predixai-knowledge.
- Não apagar GitHub Pages.
- Não misturar protótipo instável com portal oficial.
