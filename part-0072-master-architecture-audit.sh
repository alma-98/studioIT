#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 007.2 MASTER ARCHITECTURE AUDIT"
echo "========================================"

mkdir -p audit

REPORT="audit/MASTER_ARCHITECTURE_REPORT.txt"

{
echo "========================================"
echo "StudioIT Master Architecture Report"
echo "========================================"
echo
echo "Generated : $(date)"
echo

echo "========================================"
echo "PROJECT ROOT"
echo "========================================"
find . -maxdepth 2 | sort

echo
echo "========================================"
echo "SRC STRUCTURE"
echo "========================================"
find src | sort

echo
echo "========================================"
echo "ROUTER"
echo "========================================"
find src/router src/routes -type f 2>/dev/null | sort

echo
echo "========================================"
echo "LAYOUT"
echo "========================================"
find src/layout src/layouts -type f 2>/dev/null | sort

echo
echo "========================================"
echo "PAGES"
echo "========================================"
find src/pages -type f 2>/dev/null | sort

echo
echo "========================================"
echo "COMPONENTS"
echo "========================================"
find src/components -type f 2>/dev/null | sort

echo
echo "========================================"
echo "STYLES"
echo "========================================"
find src/styles -type f 2>/dev/null | sort

echo
echo "========================================"
echo "THEME"
echo "========================================"
find src/theme -type f 2>/dev/null | sort

echo
echo "========================================"
echo "FIREBASE"
echo "========================================"

[ -f firebase.json ] && cat firebase.json
[ -f .firebaserc ] && cat .firebaserc

echo
echo "========================================"
echo "PACKAGE"
echo "========================================"

cat package.json

echo
echo "========================================"
echo "MAIN ENTRY"
echo "========================================"

cat src/main.tsx

echo
echo "========================================"
echo "APP"
echo "========================================"

[ -f src/App.tsx ] && cat src/App.tsx

echo
echo "========================================"
echo "EMPTY FILES"
echo "========================================"

find src -type f -empty

echo
echo "========================================"
echo "DUPLICATE FILE NAMES"
echo "========================================"

find src -type f -exec basename {} \; \
| sort \
| uniq -d

echo
echo "========================================"
echo "BUILD"
echo "========================================"

npm run build

echo
echo "========================================"
echo "GIT STATUS"
echo "========================================"

git status

echo
echo "========================================"
echo "END OF REPORT"
echo "========================================"

} > "$REPORT"

echo
echo "========================================"
echo "Audit selesai"
echo "========================================"

cat "$REPORT"

echo
echo "========================================"
echo "Git Commit"
echo "========================================"

git add .

git commit -m "PART 007.2 Master Architecture Audit" || true

echo
echo "========================================"
echo "Push Github"
echo "========================================"

git push

echo
echo "========================================"
echo "Deploy Firebase"
echo "========================================"

firebase deploy --only hosting

echo
echo "========================================"
echo "PART 007.2 SELESAI"
echo "========================================"

echo
echo "Report:"
echo "$REPORT"

