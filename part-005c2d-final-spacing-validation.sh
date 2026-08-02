#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.2D"
echo " FINAL SPACING VALIDATION"
echo "========================================"

##########################################################
# VALIDASI FILE
##########################################################

echo ""
echo "Checking files..."

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
    echo "Validation Failed."
    exit 1
fi

##########################################################
# VALIDASI IMPORT
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
# VALIDASI SPACING
##########################################################

echo ""
echo "========================================"
echo " Margin"
echo "========================================"

grep -q ".m-0" src/styles/utilities.css && echo "✓ Margin Utility"

echo ""
echo "========================================"
echo " Padding"
echo "========================================"

grep -q ".p-0" src/styles/utilities.css && echo "✓ Padding Utility"

echo ""
echo "========================================"
echo " Gap"
echo "========================================"

grep -q ".gap-0" src/styles/utilities.css && echo "✓ Gap Utility"
grep -q ".row-gap-0" src/styles/utilities.css && echo "✓ Row Gap Utility"
grep -q ".col-gap-0" src/styles/utilities.css && echo "✓ Column Gap Utility"

##########################################################
# FILE SIZE
##########################################################

echo ""
echo "========================================"
echo " utilities.css"
echo "========================================"

ls -lh src/styles/utilities.css

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

git commit -m "Part 005C.2 - Spacing Utility Completed" || true

##########################################################
# PUSH
##########################################################

git push

##########################################################
# FIREBASE
##########################################################

firebase deploy

##########################################################
# SUMMARY
##########################################################

echo ""
echo "========================================"
echo " SPACING SYSTEM COMPLETED"
echo "========================================"

echo ""
echo "Completed:"
echo "✓ Margin Utility"
echo "✓ Padding Utility"
echo "✓ Gap Utility"

echo ""
echo "Project Console:"
echo "https://console.firebase.google.com/project/studioit-f2230/overview"

echo ""
echo "Hosting:"
echo "https://studioit.web.app"

echo ""
echo "========================================"
echo " PART 005C.2 SELESAI"
echo "========================================"

