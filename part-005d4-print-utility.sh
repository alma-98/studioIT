#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005D.4 - PRINT UTILITY"
echo "========================================"

mkdir -p src/styles

FILE="src/styles/print.css"

cat > "$FILE" <<'CSS'
/* ======================================================
   StudioIT Print Utility
====================================================== */

/* Hide on Screen */

.print-only{
display:none;
}

/* Hide on Print */

.no-print{
display:block;
}

/* Page Break */

.page-break-before{
break-before:page;
page-break-before:always;
}

.page-break-after{
break-after:page;
page-break-after:always;
}

.page-break-inside-avoid{
break-inside:avoid;
page-break-inside:avoid;
}

/* Print Orientation */

.print-portrait{
page:portrait;
}

.print-landscape{
page:landscape;
}

/* Print Rules */

@media print{

html,
body{
background:#ffffff !important;
color:#000000 !important;
font-size:12pt;
line-height:1.5;
}

/* Visibility */

.print-only{
display:block !important;
}

.no-print{
display:none !important;
}

/* Links */

a{
color:#000 !important;
text-decoration:underline;
}

/* Images */

img{
max-width:100% !important;
page-break-inside:avoid;
}

/* Tables */

table{
width:100%;
border-collapse:collapse;
page-break-inside:auto;
}

tr{
page-break-inside:avoid;
page-break-after:auto;
}

thead{
display:table-header-group;
}

tfoot{
display:table-footer-group;
}

/* Code */

pre,
code{
white-space:pre-wrap;
word-break:break-word;
}

/* Remove Effects */

*{
box-shadow:none !important;
text-shadow:none !important;
filter:none !important;
animation:none !important;
transition:none !important;
}

/* Container */

.container-responsive{
max-width:100%;
padding:0;
margin:0;
}

}

/* Orientation */

@page portrait{
size:A4 portrait;
margin:15mm;
}

@page landscape{
size:A4 landscape;
margin:15mm;
}
CSS

MAIN="src/main.tsx"

if ! grep -q 'print.css' "$MAIN"; then
awk '
/import "\.\/styles\/accessibility\.css";/{
print;
print "import \"./styles/print.css\";";
next
}
{print}
' "$MAIN" > "$MAIN.tmp"

mv "$MAIN.tmp" "$MAIN"
fi

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

git commit -m "PART 005D.4 - Print Utility" || echo "Tidak ada perubahan"

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
echo "PART 005D.4 SELESAI"
echo "========================================"

