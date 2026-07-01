# DATABASE_READINESS_PLAN

## Estado atual
O site usa GitHub Pages + localStorage para validar a experiÃªncia de memÃ³ria editÃ¡vel.

## Problema
localStorage nÃ£o Ã© banco real:
- nÃ£o sincroniza entre dispositivos;
- nÃ£o tem login;
- nÃ£o tem backup central;
- nÃ£o permite colaboraÃ§Ã£o;
- nÃ£o gera histÃ³rico oficial automaticamente.

## DecisÃ£o V2.4
NÃ£o migrar ainda. Preparar a arquitetura e escolher o backend gratuito.

## Candidato principal
Firebase:
- Firebase Hosting;
- Firestore;
- Firebase Auth.

## Alternativa
Supabase:
- Postgres;
- Auth;
- Storage.

## EstratÃ©gia recomendada
1. Manter GitHub Pages como portal oficial pÃºblico.
2. Criar protÃ³tipo `predixai-knowledge-app`.
3. Testar Firebase com autenticaÃ§Ã£o e coleÃ§Ã£o `memory_items`.
4. Sincronizar exportaÃ§Ãµes importantes para `ecosystem/brain`.
5. SÃ³ depois decidir migraÃ§Ã£o total.
