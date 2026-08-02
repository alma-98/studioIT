#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005A - GLOBAL CSS RESET"
echo "========================================"

mkdir -p src/styles

cat > src/styles/global.css <<'EOCSS'
/* =========================================================
   StudioIT v1.0
   Part 005A - Global CSS Reset
========================================================= */

/* ---------- Reset ---------- */

*,
*::before,
*::after{
  margin:0;
  padding:0;
  box-sizing:border-box;
}

html{
  scroll-behavior:smooth;
  -webkit-text-size-adjust:100%;
}

body{
  min-height:100vh;
  text-rendering:optimizeLegibility;
  -webkit-font-smoothing:antialiased;
  -moz-osx-font-smoothing:grayscale;
  background:var(--background);
  color:var(--text);
  overflow-x:hidden;
}

#root{
  min-height:100vh;
}

img,
picture,
svg,
video,
canvas{
  display:block;
  max-width:100%;
}

a{
  color:inherit;
  text-decoration:none;
}

button{
  font:inherit;
  cursor:pointer;
  background:none;
  border:none;
}

input,
textarea,
select,
button{
  font:inherit;
}

input:focus,
textarea:focus,
select:focus{
  outline:none;
}

ul,
ol{
  list-style:none;
}

table{
  width:100%;
  border-collapse:collapse;
}

hr{
  border:none;
  border-top:1px solid var(--border);
}

::selection{
  background:var(--primary);
  color:#fff;
}

::-webkit-scrollbar{
  width:10px;
}

::-webkit-scrollbar-track{
  background:#f3f3f3;
}

::-webkit-scrollbar-thumb{
  background:var(--primary);
  border-radius:20px;
}

::-webkit-scrollbar-thumb:hover{
  background:var(--secondary);
}
EOCSS

echo ""
echo "Global CSS berhasil dibuat."

echo ""
echo "Running Build..."
npm run build

echo ""
echo "Git Add..."
git add .

echo ""
echo "Git Commit..."
git commit -m "Part 005A - Global CSS Reset" || true

echo ""
echo "Git Push..."
git push

echo ""
echo "Firebase Deploy..."
firebase deploy

echo ""
echo "========================================"
echo " PART 005A SELESAI"
echo "========================================"

