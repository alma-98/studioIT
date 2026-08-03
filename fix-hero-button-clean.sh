#!/bin/bash

set -e

echo "=============================================="
echo " FIX HERO BUTTON CLEAN"
echo " Remove Arrow Icon"
echo "=============================================="

FILE="src/pages/Landing/components/Hero.tsx"


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Landing/components/Hero.tsx")

text = p.read_text()

# Remove icon import
text = text.replace(
'import { ArrowRight, Code2 } from "lucide-react";',
'import { Code2 } from "lucide-react";'
)

# Remove ArrowRight component
text = text.replace(
'''
<ArrowRight size={18}/>
''',
''
)

# Remove gap style if only for icon
text = text.replace(
'''
gap:"8px"
''',
''
)

p.write_text(text)

print("Hero button cleaned")
PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Landing/components/Hero.tsx

git commit -m "Remove Hero CTA arrow icon" || true


echo "[3/3] Deploy..."

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " HERO BUTTON CLEAN COMPLETE"
echo "=============================================="

