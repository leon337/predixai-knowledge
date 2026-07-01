# FIREBASE_SECURITY_RULES_PLAN

## Principios
- Deny by default.
- Escrita publica proibida.
- Usuario precisa estar autenticado.
- Usuario so edita documentos proprios.
- Project events devem ser protegidos.
- Secrets nunca entram no Git.

## Collections
- memory_items: read auth, create auth, update/delete owner.
- research_sources: read auth, create auth, update/delete owner.
- media_assets: read auth, create auth, update/delete owner.
- user_profiles: owner only.
- project_events: read auth, write blocked ate regra admin.
