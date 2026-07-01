# ADR-002 — Firebase-first para protótipo da memória

## Status
Aprovado como direção técnica inicial.

## Contexto
O GitHub Pages é suficiente para portal público, mas não resolve banco real, login, sincronização entre dispositivos, colaboração, galeria, gráficos e histórico editável.

## Decisão
Criar futuramente um protótipo separado chamado `predixai-knowledge-app` com Firebase-first.

## Motivos
- Firebase oferece Hosting, Firestore e Auth no mesmo ecossistema.
- Firestore é suficiente para memória em formato de documentos.
- Auth resolve login.
- Hosting permite evoluir para app.
- Supabase continua como alternativa para fase SQL.

## Não fazer agora
- Não migrar o site atual ainda.
- Não abandonar GitHub Pages.
- Não misturar app experimental com portal oficial sem validação.
