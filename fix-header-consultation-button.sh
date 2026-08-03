#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX HEADER CTA"
echo " Konsultasi Project Email"
echo "=============================================="

python3 <<'PY'
from pathlib import Path

p = Path("src/components/layout/Navbar.tsx")

text = p.read_text()

text = text.replace(
"Mulai Project",
"Konsultasi Project"
)


old = '''
<button
style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"12px 22px",
borderRadius:"10px",
cursor:"pointer"
}}
>

Konsultasi Project

</button>
'''


new = '''
<a
href="mailto:alma.budsteddy88@gmail.com"
style={{
textDecoration:"none"
}}
>

<button
style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"12px 22px",
borderRadius:"10px",
cursor:"pointer"
}}
>

Konsultasi Project

</button>

</a>
'''


text = text.replace(old,new)

p.write_text(text)

print("Header CTA updated")
PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/components/layout/Navbar.tsx

git commit -m "Update header CTA to consultation email" || true


echo "[3/3] Deploy..."

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " HEADER CTA UPDATE COMPLETE"
echo "=============================================="

