#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.8 - UTILITY VALIDATION"
echo "========================================"

mkdir -p audit

FILE="src/styles/utilities.css"
REPORT="audit/UTILITY_VALIDATION_005C8.txt"

echo "========================================" > "$REPORT"
echo "StudioIT Utility Validation" >> "$REPORT"
echo "========================================" >> "$REPORT"
echo "" >> "$REPORT"
echo "Tanggal : $(date)" >> "$REPORT"
echo "" >> "$REPORT"

echo "Checking utility file..." | tee -a "$REPORT"

if [ ! -f "$FILE" ]; then
    echo "❌ utilities.css tidak ditemukan." | tee -a "$REPORT"
    exit 1
fi

echo "" >> "$REPORT"
echo "========================================" >> "$REPORT"
echo "UTILITY BLOCK CHECK" >> "$REPORT"
echo "========================================" >> "$REPORT"

check_block () {

KEY="$1"

if grep -q "$KEY" "$FILE"; then
    echo "✅ $KEY" | tee -a "$REPORT"
else
    echo "❌ $KEY" | tee -a "$REPORT"
fi

}

check_block "DISPLAY UTILITIES"
check_block "SPACING"
check_block "TYPOGRAPHY UTILITIES"
check_block "COLOR UTILITIES"
check_block "BORDER UTILITIES"
check_block "RADIUS UTILITIES"
check_block "SHADOW UTILITIES"

echo "" >> "$REPORT"
echo "========================================" >> "$REPORT"
echo "FILE SIZE" >> "$REPORT"
echo "========================================" >> "$REPORT"

wc -l "$FILE" >> "$REPORT"

echo "" >> "$REPORT"
echo "========================================" >> "$REPORT"
echo "BUILD" >> "$REPORT"
echo "========================================" >> "$REPORT"

npm run build >> "$REPORT" 2>&1

echo "" >> "$REPORT"
echo "========================================" >> "$REPORT"
echo "GIT STATUS" >> "$REPORT"
echo "========================================" >> "$REPORT"

git status >> "$REPORT"

echo ""
echo "========================================"
echo "Validation Report"
echo "========================================"

cat "$REPORT"

echo ""
echo "========================================"
echo "Commit"
echo "========================================"

git add .

git commit -m "PART 005C.8 - Utility Validation" || echo "Tidak ada perubahan untuk di-commit."

echo ""
echo "========================================"
echo "Push Github"
echo "========================================"

git push

echo ""
echo "========================================"
echo "Deploy Firebase"
echo "========================================"

firebase deploy --only hosting

echo ""
echo "========================================"
echo "PART 005C.8 SELESAI"
echo "========================================"

echo ""
echo "Report:"
echo "$REPORT"

