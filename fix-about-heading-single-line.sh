#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX ABOUT HEADING"
echo " Single Line Heading"
echo "=============================================="

python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Landing/components/About.tsx")

text = p.read_text()

text = text.replace(
'''
Membangun Masa Depan Digital
<br/>
Bersama Teknologi Modern
''',
'''
Membangun Masa Depan Digital Bersama Teknologi Modern
'''
)


text = text.replace(
'fontSize:"30px"',
'fontSize:"26px"'
)


text = text.replace(
'lineHeight:"1.3"',
'lineHeight:"1.4"'
)


p.write_text(text)

print("About heading updated")
PY


npm run build


git add src/pages/Landing/components/About.tsx

git commit -m "Fix About heading single line layout" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " ABOUT HEADING FIX COMPLETE"
echo "=============================================="

