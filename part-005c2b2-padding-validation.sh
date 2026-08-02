#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.2B.2"
echo " PADDING UTILITY VALIDATION"
echo "========================================"

##########################################################
# VALIDASI FILE
##########################################################

echo ""
echo "Checking Files..."

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
# VALIDASI PADDING
##########################################################

echo ""
echo "Checking Padding Utility..."

PADDING_CLASSES=(
".p-0"
".pt-0"
".pb-0"
".pl-0"
".pr-0"
".px-0"
".py-0"
)

for CLASS in "${PADDING_CLASSES[@]}"
do
    if grep -q "$CLASS" src/styles/utilities.css; then
        echo "✓ $CLASS"
    else
        echo "✗ $CLASS"
        FAILED=1
    fi
done

if [ "$FAILED" -eq 1 ]; then
    echo ""
    echo "Padding Utility Validation Failed."
    exit 1
fi

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

echo ""
echo "========================================"
echo " GIT ADD"
echo "========================================"

git add .

##########################################################
# COMMIT
##########################################################

echo ""
echo "========================================"
echo " GIT COMMIT"
echo "========================================"

git commit -m "Part 005C.2B - Padding Utility Completed" || true

##########################################################
# PUSH
##########################################################

echo ""
echo "========================================"
echo " GIT PUSH"
echo "========================================"

git push

##########################################################
# FIREBASE
##########################################################

echo ""
echo "========================================"
echo " FIREBASE DEPLOY"
echo "========================================"

firebase deploy

##########################################################
# SUMMARY
##########################################################

echo ""
echo "========================================"
echo " PADDING UTILITY COMPLETED"
echo "========================================"

echo ""
echo "Project Console:"
echo "https://console.firebase.google.com/project/studioit-f2230/overview"

echo ""
echo "Hosting:"
echo "https://studioit.web.app"

echo ""
echo "========================================"
echo " PART 005C.2B SELESAI"
echo "========================================"

