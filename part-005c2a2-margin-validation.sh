#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.2A.2"
echo " MARGIN UTILITY VALIDATION"
echo "========================================"

##########################################################
# VALIDASI FILE
##########################################################

echo ""
echo "Checking Utility Files..."

FILES=(
"src/styles/utilities.css"
"src/main.tsx"
)

FAILED=0

for FILE in "${FILES[@]}"
do
    if [ -f "$FILE" ]; then
        echo "✓ $FILE"
    else
        echo "✗ $FILE"
        FAILED=1
    fi
done

if [ "$FAILED" -eq 1 ]; then
    echo ""
    echo "========================================"
    echo " VALIDATION FAILED"
    echo "========================================"
    exit 1
fi

##########################################################
# CEK IMPORT
##########################################################

echo ""
echo "Checking utilities.css import..."

if grep -q 'utilities.css' src/main.tsx; then
    echo "✓ utilities.css imported"
else
    echo "✗ utilities.css NOT imported"
    exit 1
fi

##########################################################
# CEK MARGIN UTILITIES
##########################################################

echo ""
echo "Checking Margin Utilities..."

grep -q ".m-0" src/styles/utilities.css && echo "✓ Margin Utility ditemukan"

##########################################################
# BUILD
##########################################################

echo ""
echo "========================================"
echo " BUILD PROJECT"
echo "========================================"

npm run build

##########################################################
# GIT STATUS
##########################################################

echo ""
echo "========================================"
echo " GIT STATUS"
echo "========================================"

git status

##########################################################
# GIT ADD
##########################################################

git add .

##########################################################
# COMMIT
##########################################################

git commit -m "Part 005C.2A - Margin Utility Completed" || true

##########################################################
# PUSH
##########################################################

git push

##########################################################
# FIREBASE DEPLOY
##########################################################

firebase deploy

##########################################################
# SUMMARY
##########################################################

echo ""
echo "========================================"
echo " MARGIN UTILITY COMPLETED"
echo "========================================"

echo ""
echo "Project Console:"
echo "https://console.firebase.google.com/project/studioit-f2230/overview"

echo ""
echo "Hosting:"
echo "https://studioit.web.app"

echo ""
echo "========================================"
echo " PART 005C.2A SELESAI"
echo "========================================"

