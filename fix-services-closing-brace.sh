#!/bin/bash

set -e

echo "=============================================="
echo " FIX SERVICES CLOSING BRACE"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-closing-$STAMP

cp src/pages/Services/index.tsx \
backup/services-closing-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text().rstrip()

if not text.endswith("}"):
    text += "\n\n}\n"
    p.write_text(text)
    print("Closing brace added")
else:
    print("Closing brace already exists")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Fix Services component closing brace" || true

git push origin main || true


firebase deploy --only hosting


echo "=============================================="
echo " SERVICES CLOSING BRACE COMPLETE"
echo " Backup:"
echo " backup/services-closing-$STAMP"
echo "=============================================="
