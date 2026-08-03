#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX HERO HEADING SIZE"
echo "=============================================="

python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Landing/components/Hero.tsx")

text = p.read_text()

text = text.replace(
'fontSize:"52px"',
'fontSize:"42px"'
)

text = text.replace(
'lineHeight:"1.15"',
'lineHeight:"1.25"'
)

p.write_text(text)

print("Hero heading resized")
PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Landing/components/Hero.tsx

git commit -m "Adjust Hero heading size" || true


echo "[3/3] Deploy..."

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " HERO HEADING FIX COMPLETE"
echo "=============================================="

