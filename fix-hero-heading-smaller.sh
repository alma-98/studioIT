#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX HERO HEADING SMALLER"
echo "=============================================="

python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Landing/components/Hero.tsx")

text = p.read_text()

text = text.replace(
'fontSize:"42px"',
'fontSize:"36px"'
)

text = text.replace(
'lineHeight:"1.25"',
'lineHeight:"1.3"'
)

p.write_text(text)

print("Heading updated to 36px")
PY


npm run build


git add src/pages/Landing/components/Hero.tsx

git commit -m "Reduce Hero heading size" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " HERO HEADING SMALLER COMPLETE"
echo "=============================================="

