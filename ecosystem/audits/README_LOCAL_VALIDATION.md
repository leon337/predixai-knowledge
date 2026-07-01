# README_LOCAL_VALIDATION

Depois da aplicação local, executar:

```bat
python -m json.tool ecosystem_context.json > nul
python -m json.tool ecosystem_site_content.json > nul
python -m json.tool docs\_site_manifest.json > nul
python scripts\validate_ecosystem_files.py
python scripts\validate_site_links.py
git diff --check
git status -sb
```

Não fazer commit/push antes da aprovação do Leo.
