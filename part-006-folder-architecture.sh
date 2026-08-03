#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 006 - FOLDER ARCHITECTURE"
echo "========================================"

echo ""
echo "Creating folder structure..."

mkdir -p \
src/api \
src/assets/fonts \
src/assets/icons \
src/assets/images \
src/components/common \
src/components/layout \
src/components/ui \
src/components/forms \
src/components/cards \
src/components/modals \
src/components/tables \
src/components/navigation \
src/hooks \
src/context \
src/layout \
src/lib \
src/pages/Home \
src/pages/About \
src/pages/Services \
src/pages/Portfolio \
src/pages/Pricing \
src/pages/FAQ \
src/pages/Contact \
src/pages/Blog \
src/pages/Login \
src/pages/Register \
src/pages/Dashboard \
src/pages/Admin \
src/router \
src/services \
src/store \
src/styles \
src/theme \
src/types \
src/utils \
src/constants \
src/config \
src/firebase \
src/data \
src/mocks \
src/providers \
src/guards \
src/interfaces \
src/models \
src/tests \
src/__tests__ \
src/scripts \
public/images \
public/icons \
audit

echo ""
echo "Creating .gitkeep..."

find src -type d -exec touch {}/.gitkeep \;
find public -type d -exec touch {}/.gitkeep \;

echo ""
echo "Creating README..."

cat > src/README.md <<'TXT'
# StudioIT Source Structure

This directory contains the complete source code for StudioIT.

Main folders:

- api
- assets
- components
- config
- constants
- context
- data
- firebase
- guards
- hooks
- interfaces
- layout
- lib
- mocks
- models
- pages
- providers
- router
- scripts
- services
- store
- styles
- tests
- theme
- types
- utils
TXT

REPORT="audit/FOLDER_ARCHITECTURE_006.txt"

echo "========================================" > "$REPORT"
echo "StudioIT Folder Architecture" >> "$REPORT"
echo "========================================" >> "$REPORT"
echo "" >> "$REPORT"

echo "Created: $(date)" >> "$REPORT"

echo "" >> "$REPORT"

find src | sort >> "$REPORT"

echo ""
echo "========================================"
echo "Running Build..."
echo "========================================"

npm run build

echo ""
echo "========================================"
echo "Git Commit"
echo "========================================"

git add .

git commit -m "PART 006 - Folder Architecture" || echo "No changes"

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
echo "PART 006 SELESAI"
echo "========================================"

echo ""
echo "Report:"
echo "$REPORT"

