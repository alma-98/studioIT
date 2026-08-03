#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005D.3 - ACCESSIBILITY UTILITY"
echo "========================================"

mkdir -p src/styles

FILE="src/styles/accessibility.css"

cat > "$FILE" <<'CSS'
/* ======================================================
   StudioIT Accessibility Utility
====================================================== */

/* ==========================================
   Screen Reader
========================================== */

.sr-only{
position:absolute;
width:1px;
height:1px;
padding:0;
margin:-1px;
overflow:hidden;
clip:rect(0,0,0,0);
white-space:nowrap;
border:0;
}

.not-sr-only{
position:static;
width:auto;
height:auto;
padding:inherit;
margin:inherit;
overflow:visible;
clip:auto;
white-space:normal;
}

/* ==========================================
   Focus
========================================== */

.focus-ring:focus{
outline:3px solid var(--color-primary,#2563eb);
outline-offset:3px;
}

.focus-none:focus{
outline:none;
}

.focus-visible:focus-visible{
outline:3px solid var(--color-primary,#2563eb);
outline-offset:3px;
}

/* ==========================================
   Cursor
========================================== */

.cursor-auto{cursor:auto;}
.cursor-default{cursor:default;}
.cursor-pointer{cursor:pointer;}
.cursor-wait{cursor:wait;}
.cursor-text{cursor:text;}
.cursor-move{cursor:move;}
.cursor-help{cursor:help;}
.cursor-not-allowed{cursor:not-allowed;}
.cursor-grab{cursor:grab;}
.cursor-grabbing{cursor:grabbing;}
.cursor-crosshair{cursor:crosshair;}
.cursor-zoom-in{cursor:zoom-in;}
.cursor-zoom-out{cursor:zoom-out;}

/* ==========================================
   Pointer Events
========================================== */

.pointer-events-none{
pointer-events:none;
}

.pointer-events-auto{
pointer-events:auto;
}

/* ==========================================
   User Select
========================================== */

.select-none{
user-select:none;
}

.select-text{
user-select:text;
}

.select-all{
user-select:all;
}

.select-auto{
user-select:auto;
}

/* ==========================================
   Visibility
========================================== */

.invisible{
visibility:hidden;
}

.visible{
visibility:visible;
}

/* ==========================================
   Disabled
========================================== */

.disabled{
opacity:.5;
pointer-events:none;
cursor:not-allowed;
}

.disabled-soft{
opacity:.7;
pointer-events:none;
}

/* ==========================================
   Keyboard Navigation
========================================== */

.keyboard-only:focus{
outline:3px solid var(--color-primary,#2563eb);
outline-offset:4px;
}

/* ==========================================
   Reduced Motion
========================================== */

@media (prefers-reduced-motion: reduce){

*,
*::before,
*::after{

animation-duration:.01ms !important;
animation-iteration-count:1 !important;
transition-duration:.01ms !important;
scroll-behavior:auto !important;

}

}

/* ==========================================
   High Contrast
========================================== */

@media (prefers-contrast: more){

.high-contrast{

border:2px solid currentColor !important;
box-shadow:none !important;

}

}

/* ==========================================
   Forced Colors
========================================== */

@media (forced-colors: active){

.forced-color-adjust-auto{
forced-color-adjust:auto;
}

.forced-color-adjust-none{
forced-color-adjust:none;
}

}

/* ==========================================
   Skip Link
========================================== */

.skip-link{

position:absolute;
left:-9999px;
top:0;
background:#000;
color:#fff;
padding:.75rem 1rem;
z-index:9999;

}

.skip-link:focus{

left:1rem;
top:1rem;

}
CSS

MAIN="src/main.tsx"

if ! grep -q 'accessibility.css' "$MAIN"; then

awk '
/import "\.\/styles\/animations\.css";/{
print;
print "import \"./styles/accessibility.css\";";
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

git commit -m "PART 005D.3 - Accessibility Utility" || echo "Tidak ada perubahan"

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
echo "PART 005D.3 SELESAI"
echo "========================================"

