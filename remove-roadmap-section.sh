#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT REMOVE ROADMAP SECTION"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/5] Backup..."

mkdir -p backup/remove-roadmap-$STAMP

cp src/pages/Landing/LandingPage.tsx \
backup/remove-roadmap-$STAMP/


echo "[2/5] Remove Roadmap Import & Component..."

python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Landing/LandingPage.tsx")

text = p.read_text()

text = text.replace(
'import Roadmap from "./components/Roadmap";\n',
''
)

text = text.replace(
'<Roadmap/>',
''
)

p.write_text(text)

print("Roadmap removed")
PY


echo "[3/5] Build..."

npm run build


echo "[4/5] Commit..."

git add .

git commit -m "Remove Roadmap section from Landing Page" || true

git push origin main || true


echo "[5/5] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " ROADMAP REMOVED"
echo " Backup:"
echo " backup/remove-roadmap-$STAMP"
echo "=============================================="

