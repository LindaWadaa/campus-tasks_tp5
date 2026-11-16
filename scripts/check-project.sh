#!/usr/bin/env bash
set -euo pipefail
for f in Dockerfile compose.yaml app.py requirements.txt tests/test_smoke.py; do
  [ -f "$f" ] || { echo "Fichier manquant : $f" >&2; exit 1; }
done
if git ls-files | grep -E '^\.env($|\.)' >/dev/null; then
  echo "Un fichier .env est suivi par Git" >&2; exit 1
fi
echo "projet OK"
