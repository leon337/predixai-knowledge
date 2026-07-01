# ECO-BASE-001 — Auditoria dos Repositórios

Data: 2026-07-01
Modo: Construção Organizacional

## Limitação operacional

Esta auditoria foi feita com acesso ao GitHub conectado e aos arquivos públicos/visíveis. O ambiente atual não acessa diretamente `C:\Users\Leo\Documents\GitHub\...`, portanto não foi possível capturar o patch real das alterações locais pendentes do PTP-103.

## Repositórios auditados

| Repositório | Função validada | Observação |
|---|---|---|
| `predixai-platform` | Núcleo técnico e moradia temporária do Trader | README confirma plataforma e Trader como primeiro produto; PROJECT_STATE confirma PTP-102 aprovado e PTP-103 pendente |
| `predixai-knowledge` | Memória global e site | README mínimo; `docs/index.html` já existe e deve receber links globais |
| `predixai-agents` | Agentes inteligentes | README mínimo com função clara |
| `predixai-academy` | Plataforma final de ensino | README confirma ensino, gamificação, agentes, certificações e progresso |
| `academia-predixai` | Acervo/estudos | README indica plataforma de estudos; precisa ser tratado como acervo bruto |

## Estado do Trader

- Último PTP aprovado: PTP-102.
- Próximo PTP pendente: PTP-103.
- Falha pendente: assinatura incompatível de `MarketSessionRecorder.close_session()`.
- Migração: não iniciada.

## Inconsistências encontradas

1. `predixai-platform` ainda carrega o produto Trader, apesar de dever ser núcleo técnico.
2. `predixai-knowledge` tem site, mas ainda precisava de páginas oficiais do ecossistema.
3. `predixai-academy` e `academia-predixai` podem ser confundidos sem mapa oficial.
4. PTP-103 tem arquivos locais pendentes que não devem ser apagados.

## Arquivos versionados

A listagem completa por `git ls-files` deve ser executada no notebook do Leo, pois este ambiente não tem acesso ao working tree local nem consegue clonar via rede do container. Este pacote inclui documentação pronta para ser aplicada no `predixai-knowledge`.
