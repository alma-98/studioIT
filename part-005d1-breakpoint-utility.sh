#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005D.1 - BREAKPOINT UTILITY"
echo "========================================"

mkdir -p src/styles

cat > src/styles/breakpoints.css <<'CSS'
/* =========================================================
   BREAKPOINT UTILITY
========================================================= */

/* Mobile */
@media (max-width:639px){

.hide-sm{
display:none !important;
}

.show-sm{
display:block !important;
}

.container-responsive{
padding:1rem;
}

.text-responsive{
font-size:.9rem;
}

.grid-responsive-2,
.grid-responsive-3,
.grid-responsive-4{
display:grid;
grid-template-columns:1fr;
gap:1rem;
}

.stack-mobile{
display:flex;
flex-direction:column;
gap:1rem;
}

.flex-mobile{
flex-direction:column;
}

}

/* Tablet */
@media (min-width:640px) and (max-width:1023px){

.hide-md{
display:none !important;
}

.show-md{
display:block !important;
}

.container-responsive{
padding:1.5rem;
}

.grid-responsive-2{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:1.25rem;
}

.grid-responsive-3{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:1.25rem;
}

.grid-responsive-4{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:1.25rem;
}

}

/* Desktop */
@media (min-width:1024px){

.hide-lg{
display:none !important;
}

.show-lg{
display:block !important;
}

.container-responsive{
max-width:1440px;
margin:auto;
padding:2rem;
}

.grid-responsive-2{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:1.5rem;
}

.grid-responsive-3{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:1.5rem;
}

.grid-responsive-4{
display:grid;
grid-template-columns:repeat(4,1fr);
gap:1.5rem;
}

}
CSS

MAIN="src/main.tsx"

if ! grep -q 'breakpoints.css' "$MAIN"; then
awk '
/import "\.\/styles\/utilities\.css";/{
print;
print "import \"./styles/breakpoints.css\";";
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

git commit -m "PART 005D.1 - Breakpoint Utility" || echo "Tidak ada perubahan untuk di-commit."

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
echo "PART 005D.1 SELESAI"
echo "========================================"

