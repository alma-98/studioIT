#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT FIX PART 008A"
echo " Change Floating SMS to SMS Only"
echo "=============================================="

FILE="src/components/sms/FloatingSMS.tsx"

if [ -f "$FILE" ]; then

python3 <<'PY'
from pathlib import Path

file = Path("src/components/sms/FloatingSMS.tsx")

text = file.read_text()

text = text.replace(
    'https://wa.me/6285283397198',
    'sms:+6285283397198'
)

text = text.replace(
    'SMS / WhatsApp',
    'SMS StudioIT'
)

file.write_text(text)

print("Floating SMS updated")
PY

else
    echo "File tidak ditemukan:"
    echo "$FILE"
    exit 1
fi


echo "[1/3] Build Validation..."

npm run build


echo "[2/3] Git Commit..."

git add src/components/sms/FloatingSMS.tsx

git commit -m "Fix PART 008A Floating SMS Only" || true


echo "[3/3] Deploy Firebase..."

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " FIX COMPLETE"
echo " SMS Link : sms:+6285283397198"
echo "=============================================="
