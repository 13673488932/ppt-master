#!/usr/bin/env bash
# Codex Cloud install script for the user's PPT Master fork.
# This file is additive; it does not replace or patch the upstream skill.
set -Eeuo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "ERROR: Python 3.10+ is required." >&2
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_DIR="${REPO_ROOT}/skills/ppt-master"

if [[ ! -f "${SKILL_DIR}/SKILL.md" || ! -f "${SKILL_DIR}/scripts/attribution_guard.py" ]]; then
  echo "ERROR: This is not a complete PPT Master checkout." >&2
  exit 1
fi

python3 - <<'PY'
import sys
if sys.version_info < (3, 10):
    raise SystemExit("ERROR: Python 3.10+ is required")
print("Python:", sys.version.split()[0])
PY

# Fail closed: do not bypass or modify the upstream integrity gate.
python3 "${SKILL_DIR}/scripts/attribution_guard.py"

# Installs the original upstream project's declared requirements.
python3 -m pip install -r "${REPO_ROOT}/requirements.txt"

# Sanity-check key importable dependencies without generating a deck.
python3 - <<'PY'
from importlib import import_module
for module in ("pptx", "yaml", "mammoth", "fitz", "PIL", "xlsxwriter"):
    import_module(module)
    print("OK:", module)
PY

# Re-run the original guard after setup.
python3 "${SKILL_DIR}/scripts/attribution_guard.py"
echo "PPT Master dependencies and attribution guard: OK"
echo "Next: read skills/ppt-master/SKILL.md and follow its routing workflow before producing any slides."
