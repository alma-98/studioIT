#!/bin/bash

set -e

echo "=============================================="
echo " FIX SERVICES BACKGROUND STYLE"
echo " Match Home Design"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-background-$STAMP

cp src/pages/Services/index.tsx \
backup/services-background-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


text = text.replace(
'background:"#FFFFFF"',
'background:"linear-gradient(135deg,#FFE8E8,#FFFFFF)"'
)


p.write_text(text)

print("Services background updated")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Update Services background to match Home style" || true

git push origin main || true


firebase deploy --only hosting


echo "=============================================="
echo " SERVICES BACKGROUND COMPLETE"
echo " Backup:"
echo " backup/services-background-$STAMP"
echo "=============================================="

