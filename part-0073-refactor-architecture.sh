#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT PART 0073"
echo " Architecture Refactor"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

echo "[1/8] Backup..."
mkdir -p backup/part-0073-$STAMP

cp -R src backup/part-0073-$STAMP/src

echo "[2/8] Normalize Layout Structure..."

if [ -f src/layouts/MainLayout.tsx ]; then
    cp src/layouts/MainLayout.tsx src/layout/MainLayout.tsx
fi


echo "[3/8] Update Router Import..."

python3 <<'PY'
from pathlib import Path

files = [
    Path("src/routes/AppRouter.tsx")
]

for file in files:
    if file.exists():
        text=file.read_text()
        text=text.replace(
            '../layouts/MainLayout',
            '../layout/MainLayout'
        )
        file.write_text(text)

print("Router import updated")
PY


echo "[4/8] Remove Duplicate Empty Files..."

rm -f src/router/AppRouter.tsx 2>/dev/null || true
rm -f src/layouts/MainLayout.tsx 2>/dev/null || true


echo "[5/8] Clean Empty Folder..."

rmdir src/router 2>/dev/null || true
rmdir src/layouts 2>/dev/null || true


echo "[6/8] Verify Structure..."

echo ""
echo "ACTIVE ROUTER:"
cat src/routes/AppRouter.tsx

echo ""
echo "ACTIVE LAYOUT:"
cat src/layout/MainLayout.tsx


echo "[7/8] Build Test..."

npm run build


echo "[8/8] Finished"

echo "=============================================="
echo " Refactor SUCCESS"
echo " Backup:"
echo " backup/part-0073-$STAMP"
echo "=============================================="
