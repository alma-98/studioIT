#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX HERO CTA"
echo " Konsultasi Project Email"
echo "=============================================="

FILE="src/pages/Landing/components/Hero.tsx"


python3 <<'PY'
from pathlib import Path

p=Path("src/pages/Landing/components/Hero.tsx")

text=p.read_text()


text=text.replace(
"Mulai Project",
"Konsultasi Project"
)


text=text.replace(
"<button",
'<a href="mailto:alma.budsteddy88@gmail.com" style={{textDecoration:"none"}}>\\n<button'
)


text=text.replace(
"</button>",
"</button>\\n</a>"
)


p.write_text(text)

print("Hero CTA updated")
PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Landing/components/Hero.tsx

git commit -m "Update Hero CTA to Konsultasi Project email" || true


echo "[3/3] Deploy..."

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " HERO CTA UPDATE COMPLETE"
echo " Email: alma.budsteddy88@gmail.com"
echo "=============================================="

