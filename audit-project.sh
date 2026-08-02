#!/bin/bash

set -e

mkdir -p audit

REPORT=audit/PROJECT_AUDIT.md

echo "# StudioIT Project Audit" > "$REPORT"
echo "" >> "$REPORT"
echo "Tanggal : $(date)" >> "$REPORT"
echo "" >> "$REPORT"

echo "## Project Structure" >> "$REPORT"
tree -L 3 >> "$REPORT" 2>/dev/null || find . -maxdepth 3 >> "$REPORT"

FILES=(
package.json
vite.config.ts
firebase.json
src/main.tsx
src/App.tsx
src/styles/global.css
src/styles/theme.css
src/styles/colors.css
src/styles/variables.css
src/styles/typography.css
src/theme/index.ts
src/theme/colors.ts
src/theme/palette.ts
src/theme/semantic.ts
src/theme/typography.ts
)

for FILE in "${FILES[@]}"
do
    if [ -f "$FILE" ]; then
        SAFE=$(echo "$FILE" | sed 's#/#_#g')

        echo "" >> "$REPORT"
        echo "===================================" >> "$REPORT"
        echo "$FILE" >> "$REPORT"
        echo "===================================" >> "$REPORT"

        cat "$FILE" >> "$REPORT"

        cp "$FILE" "audit/$SAFE"
    fi
done

echo ""
echo "======================================="
echo "Audit selesai"
echo "======================================="
echo ""
echo "Laporan:"
echo "$REPORT"
echo ""
echo "File audit disalin ke folder:"
echo "audit/"
