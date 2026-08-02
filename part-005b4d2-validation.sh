#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.4D.2"
echo " LAYOUT VALIDATION"
echo "========================================"

##########################################################
# VALIDASI STRUKTUR
##########################################################

echo ""
echo "Checking Layout Structure..."

FILES=(
"src/layout/Container.tsx"
"src/layout/Section.tsx"
"src/layout/Flex.tsx"
"src/layout/Stack.tsx"
"src/layout/Row.tsx"
"src/layout/Column.tsx"
"src/layout/Grid.tsx"
"src/layout/AutoGrid.tsx"
"src/layout/Center.tsx"
"src/layout/Spacer.tsx"
"src/layout/Masonry.tsx"
"src/layout/MasonryItem.tsx"
"src/layout/Page.tsx"
"src/layout/Main.tsx"
"src/layout/Content.tsx"
"src/layout/Sidebar.tsx"
"src/layout/Wrapper.tsx"
"src/layout/Shell.tsx"
"src/layout/index.ts"
"src/layout/README.md"
)

MISSING=0

for FILE in "${FILES[@]}"
do
    if [ -f "$FILE" ]; then
        echo "✓ $FILE"
    else
        echo "✗ $FILE"
        MISSING=1
    fi
done

if [ "$MISSING" -eq 1 ]; then
    echo ""
    echo "========================================"
    echo " ERROR"
    echo " Ada file layout yang belum tersedia."
    echo "========================================"
    exit 1
fi

##########################################################
# TYPESCRIPT BUILD
##########################################################

echo ""
echo "========================================"
echo " Running Build"
echo "========================================"

npm run build

##########################################################
# GIT STATUS
##########################################################

echo ""
echo "========================================"
echo " Git Status"
echo "========================================"

git status

##########################################################
# GIT
##########################################################

echo ""
echo "========================================"
echo " Git Add"
echo "========================================"

git add .

echo ""
echo "========================================"
echo " Git Commit"
echo "========================================"

git commit -m "Part 005B - Layout System Completed" || true

echo ""
echo "========================================"
echo " Git Push"
echo "========================================"

git push

##########################################################
# FIREBASE
##########################################################

echo ""
echo "========================================"
echo " Firebase Deploy"
echo "========================================"

firebase deploy

##########################################################
# SUMMARY
##########################################################

echo ""
echo "========================================"
echo " LAYOUT SYSTEM COMPLETED"
echo "========================================"

echo ""
echo "Completed Components:"
echo ""

find src/layout -maxdepth 1 -type f | sort

echo ""
echo "Hosting:"
echo "https://studioit.web.app"

echo ""
echo "========================================"
echo " PART 005B SELESAI"
echo "========================================"

