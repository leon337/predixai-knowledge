from pathlib import Path
import sys

required = [
    "ECOSYSTEM_STATE.md",
    "ecosystem_context.json",
    "ecosystem_site_content.json",
    "REPOSITORY_MAP.md",
    "GLOBAL_DECISIONS.md",
    "PTP_LEDGER.md",
    "PROBLEMS_LOG.md",
    "IDEAS_LOG.md",
    "ROADMAP_GLOBAL.md",
    "CHAT_HANDOFF.md",
    "CODEX_HANDOFF.md",
    "OPENCLAW_HANDOFF.md",
    "AGENTS_HANDOFF.md",
    "TRADER_MIGRATION_PLAN.md",
    "docs/index.html",
    "docs/ecosystem.html",
    "docs/progress.html",
    "docs/courses.html",
    "docs/classes.html",
    "docs/products.html",
    "docs/repositories.html",
    "docs/history.html",
    "docs/roadmap-global.html",
    "docs/handoff.html",
    "docs/mindmap.html",
    "docs/decisions.html",
    "docs/problems.html",
    "docs/ideas.html",
    "docs/_site_manifest.json",
]

missing = [p for p in required if not Path(p).exists()]

if missing:
    print("ECOSYSTEM_FILES_FAIL")
    for item in missing:
        print(f"MISSING: {item}")
    sys.exit(1)

print("ECOSYSTEM_FILES_OK")
