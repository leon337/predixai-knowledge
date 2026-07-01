# PredixAI BR — ECOSYSTEM_STATE

Data oficial: 2026-07-01
Modo: ECO-BASE-001 — Construção Organizacional

## Estado macro

A PredixAI BR deixou de ser apenas o produto **PredixAI Trader** e passa a ser tratada como ecossistema com memória, produtos, agentes, academia e acervo de estudos.

## Missão oficial

Transformar Inteligência Artificial em soluções práticas que resolvem problemas reais para pessoas e empresas.

## Regra máxima do ecossistema

Toda decisão deve responder: **esta decisão fortalece a missão da PredixAI BR de democratizar IA por meio de soluções práticas que resolvem problemas reais?**

## Produto atual

- Produto em execução: **PredixAI Trader**.
- Local atual: `predixai-platform`.
- Estado da V1: **Observador**.
- Ultimo PTP aprovado: **PTP-103 - Overnight Observer**.
- Proximo passo: **auditoria final da V1 Trader**.
- Status do PTP-103: publicado no `predixai-platform`.
- Correcao validada: `MarketSessionRecorder.close_session` chamado com `session_id=session.id` e `status="completed"`.
- PTP-102 preservado: smoke test do Triple Rebound Observer aprovado.

## Repositórios oficiais

| Repositório | Função definitiva | Estado | Branch |
|---|---|---|---|
| `predixai-platform` | Núcleo técnico reutilizável da PredixAI BR | ativo; contém PredixAI Trader temporariamente | `main` |
| `predixai-knowledge` | Memória global, site oficial de contexto e documentação viva | ativo; alvo desta organização | `main` |
| `predixai-agents` | Agentes inteligentes executáveis, manifests, templates, runners e benchmarks | ativo; implementação de agentes deve morar aqui | `main` |
| `predixai-academy` | Plataforma oficial de ensino da PredixAI | ativo; produto educacional final | `main` |
| `academia-predixai` | Acervo bruto de estudos e material-fonte | ativo; não confundir com a plataforma final | `main` |

## Política nova

Toda atualização relevante em qualquer repositório oficial deve gerar atualização correspondente no `predixai-knowledge` e no site GitHub Pages quando afetar contexto público do projeto.

## Bloqueios ativos

- Não migrar o Trader ainda.
- PTP-103 ja foi publicado; nao republicar sem nova validacao.
- Proximo passo do Trader: auditoria final da V1, sem migrar o Trader agora.
- Não fazer commit sem validação.
- Não fazer push sem aprovação do Leo.
