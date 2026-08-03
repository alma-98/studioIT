#!/bin/bash

echo "========================================"
echo " StudioIT v1.0"
echo " PROJECT AUDIT CHECKPOINT"
echo "========================================"

mkdir -p audit

REPORT="audit/PROJECT_AUDIT_005C.txt"

{
echo "========================================"
echo "StudioIT Project Audit"
echo "========================================"
echo ""
echo "Tanggal : $(date)"
echo ""

echo "========================================"
echo "ROOT"
echo "========================================"
find . -maxdepth 1 | sort

echo ""
echo "========================================"
echo "SRC"
echo "========================================"
find src -maxdepth 2 | sort

echo ""
echo "========================================"
echo "LAYOUT"
echo "========================================"
find src/layout -maxdepth 1 -type f | sort

echo ""
echo "========================================"
echo "STYLES"
echo "========================================"
find src/styles -maxdepth 1 -type f | sort

echo ""
echo "========================================"
echo "MAIN IMPORTS"
echo "========================================"
grep '^import' src/main.tsx

echo ""
echo "========================================"
echo "PACKAGE"
echo "========================================"
cat package.json

echo ""
echo "========================================"
echo "BUILD"
echo "========================================"

} > "$REPORT"

echo ""
echo "Running build..."
npm run build >> "$REPORT" 2>&1

echo ""
echo "Git Status..."
git status >> "$REPORT"

echo ""
echo "========================================"
echo "Audit selesai"
echo "========================================"
echo ""
echo "Laporan:"
echo "$REPORT"

