# PredixAI BR — REPOSITORY_MAP

## Mapa oficial

| Repositório | Deve conter | Não deve conter |
|---|---|---|
| `predixai-platform` | Core, vision, OCR, capture, perception, auditoria, segurança, runtime e ferramentas base | Produtos verticais grandes como moradia permanente |
| `predixai-trader` | Futuro produto Trader, scripts de operação observadora, testes de produto, documentação de produto | Motores genéricos que servem outros produtos |
| `predixai-knowledge` | Memória global, site, decisões, PTPs, problemas, ideias, roadmap e handoffs | Código runtime de produtos |
| `predixai-agents` | Agentes executáveis, manifests, templates, prompts operacionais, runners, benchmarks | Conhecimento conceitual longo que pertence ao Knowledge |
| `predixai-academy` | Plataforma final de ensino, cursos, trilhas, gamificação, alunos, progresso e certificações | Material bruto não curado |
| `academia-predixai` | Estudos brutos, fontes, transcrições, rascunhos, pesquisas e material para aulas | Plataforma final de ensino |

## Relação entre os repositórios

```text
academia-predixai  -> predixai-knowledge -> predixai-academy
        estudos       memória oficial       plataforma final

predixai-platform  -> predixai-trader
   motores base        produto vertical futuro

predixai-knowledge -> predixai-agents
 conceitos/regras     execução dos agentes
```

## Regra de consulta

Antes de continuar qualquer PTP relevante, consultar:

1. `predixai-knowledge/ECOSYSTEM_STATE.md`
2. `predixai-knowledge/ecosystem_context.json`
3. `predixai-knowledge/REPOSITORY_MAP.md`
4. Documentos específicos do repositório-alvo
