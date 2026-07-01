# Como aplicar no notebook do Leo

## Windows PowerShell

```powershell
cd C:\Users\Leo\Documents\GitHub\predixai-knowledge
Copy-Item -Recurse -Force C:\CAMINHO\DO\PACOTE\* .
python -m json.tool ecosystem_context.json > $null
git diff --check
```

## Linux Mint

```bash
cd ~/Documents/GitHub/predixai-knowledge
cp -r /caminho/do/pacote/* .
python -m json.tool ecosystem_context.json >/dev/null
git diff --check
```

## O que cada comando faz

- `cd`: entra na pasta do repositório.
- `Copy-Item` ou `cp -r`: copia os arquivos novos para dentro do projeto.
- `python -m json.tool`: valida se o JSON está correto.
- `git diff --check`: procura espaços inválidos e problemas básicos no diff.
