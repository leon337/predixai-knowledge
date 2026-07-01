# SECURITY_ACCEPTANCE_CRITERIA

## Antes do app
- Nenhuma collection com escrita publica.
- created_by obrigatorio em documentos editaveis.
- user_profiles acessivel somente ao proprio usuario.
- project_events com escrita bloqueada ate regra admin.
- variaveis sensiveis fora do Git.

## Depois do app
- testar create/update/delete por usuario autenticado.
- testar tentativa sem login.
- testar tentativa de editar item de outro usuario.
