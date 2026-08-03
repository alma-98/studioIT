#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.5 - BORDER UTILITY"
echo "========================================"

FILE="src/styles/utilities.css"

mkdir -p src/styles
touch "$FILE"

if ! grep -q "BORDER UTILITIES" "$FILE"; then

cat >> "$FILE" <<'CSS'


/* ======================================================
   BORDER UTILITIES
====================================================== */

/* Border Width */

.border-0{border-width:0;}
.border{border-width:1px;}
.border-2{border-width:2px;}
.border-4{border-width:4px;}
.border-8{border-width:8px;}

/* Border Direction */

.border-t{border-top-width:1px;}
.border-r{border-right-width:1px;}
.border-b{border-bottom-width:1px;}
.border-l{border-left-width:1px;}

.border-x{
border-left-width:1px;
border-right-width:1px;
}

.border-y{
border-top-width:1px;
border-bottom-width:1px;
}

/* Border Style */

.border-solid{
border-style:solid;
}

.border-dashed{
border-style:dashed;
}

.border-dotted{
border-style:dotted;
}

.border-double{
border-style:double;
}

.border-none{
border-style:none;
}

/* Border Color */

.border-primary{
border-color:var(--color-primary);
}

.border-secondary{
border-color:var(--color-secondary);
}

.border-success{
border-color:var(--color-success);
}

.border-warning{
border-color:var(--color-warning);
}

.border-danger{
border-color:var(--color-danger);
}

.border-info{
border-color:var(--color-info);
}

.border-white{
border-color:#ffffff;
}

.border-black{
border-color:#000000;
}

.border-default{
border-color:var(--color-border);
}

.border-transparent{
border-color:transparent;
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

git commit -m "PART 005C.5 - Border Utility" || echo "Tidak ada perubahan untuk di-commit."

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
echo "PART 005C.5 SELESAI"
echo "========================================"

