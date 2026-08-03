#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.7 - SHADOW UTILITY"
echo "========================================"

FILE="src/styles/utilities.css"

mkdir -p src/styles
touch "$FILE"

if ! grep -q "SHADOW UTILITIES" "$FILE"; then

cat >> "$FILE" <<'CSS'


/* ======================================================
   SHADOW UTILITIES
====================================================== */

/* No Shadow */

.shadow-none{
box-shadow:none;
}

/* Extra Small */

.shadow-xs{
box-shadow:0 1px 2px rgba(0,0,0,.05);
}

/* Small */

.shadow-sm{
box-shadow:
0 1px 2px rgba(0,0,0,.08),
0 1px 3px rgba(0,0,0,.04);
}

/* Default */

.shadow{
box-shadow:
0 2px 4px rgba(0,0,0,.08),
0 4px 6px rgba(0,0,0,.06);
}

/* Medium */

.shadow-md{
box-shadow:
0 4px 6px rgba(0,0,0,.10),
0 8px 12px rgba(0,0,0,.08);
}

/* Large */

.shadow-lg{
box-shadow:
0 10px 20px rgba(0,0,0,.12),
0 6px 8px rgba(0,0,0,.08);
}

/* Extra Large */

.shadow-xl{
box-shadow:
0 20px 30px rgba(0,0,0,.15),
0 12px 16px rgba(0,0,0,.10);
}

/* 2XL */

.shadow-2xl{
box-shadow:
0 30px 60px rgba(0,0,0,.20),
0 15px 25px rgba(0,0,0,.12);
}

/* Inner */

.shadow-inner{
box-shadow:
inset 0 2px 4px rgba(0,0,0,.08);
}

/* Soft */

.shadow-soft{
box-shadow:
0 6px 24px rgba(0,0,0,.08);
}

/* Card */

.shadow-card{
box-shadow:
0 8px 24px rgba(15,23,42,.08);
}

/* Floating */

.shadow-floating{
box-shadow:
0 20px 40px rgba(0,0,0,.15);
}

/* Hover */

.hover-shadow:hover{
box-shadow:
0 8px 24px rgba(0,0,0,.12);
transition:box-shadow .25s ease;
}

.hover-shadow-lg:hover{
box-shadow:
0 20px 40px rgba(0,0,0,.18);
transition:box-shadow .25s ease;
}

CSS

fi

echo ""
echo "========================================"
echo "Running Build..."
echo "========================================"

npm run build

echo ""
echo "========================================"
echo "Git Status"
echo "========================================"

git status

echo ""
echo "========================================"
echo "Commit"
echo "========================================"

git add .

git commit -m "PART 005C.7 - Shadow Utility" || echo "Tidak ada perubahan untuk di-commit."

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
echo "PART 005C.7 SELESAI"
echo "========================================"

