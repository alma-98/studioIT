#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.6 - RADIUS UTILITY"
echo "========================================"

FILE="src/styles/utilities.css"

mkdir -p src/styles
touch "$FILE"

if ! grep -q "RADIUS UTILITIES" "$FILE"; then

cat >> "$FILE" <<'CSS'


/* ======================================================
   RADIUS UTILITIES
====================================================== */

/* Radius Size */

.rounded-none{border-radius:0;}
.rounded-sm{border-radius:0.125rem;}
.rounded{border-radius:0.25rem;}
.rounded-md{border-radius:0.375rem;}
.rounded-lg{border-radius:0.5rem;}
.rounded-xl{border-radius:0.75rem;}
.rounded-2xl{border-radius:1rem;}
.rounded-3xl{border-radius:1.5rem;}
.rounded-full{border-radius:9999px;}

/* Top */

.rounded-t-none{
border-top-left-radius:0;
border-top-right-radius:0;
}

.rounded-t{
border-top-left-radius:0.25rem;
border-top-right-radius:0.25rem;
}

.rounded-t-md{
border-top-left-radius:0.375rem;
border-top-right-radius:0.375rem;
}

.rounded-t-lg{
border-top-left-radius:0.5rem;
border-top-right-radius:0.5rem;
}

/* Bottom */

.rounded-b-none{
border-bottom-left-radius:0;
border-bottom-right-radius:0;
}

.rounded-b{
border-bottom-left-radius:0.25rem;
border-bottom-right-radius:0.25rem;
}

.rounded-b-md{
border-bottom-left-radius:0.375rem;
border-bottom-right-radius:0.375rem;
}

.rounded-b-lg{
border-bottom-left-radius:0.5rem;
border-bottom-right-radius:0.5rem;
}

/* Left */

.rounded-l{
border-top-left-radius:0.25rem;
border-bottom-left-radius:0.25rem;
}

.rounded-l-lg{
border-top-left-radius:0.5rem;
border-bottom-left-radius:0.5rem;
}

/* Right */

.rounded-r{
border-top-right-radius:0.25rem;
border-bottom-right-radius:0.25rem;
}

.rounded-r-lg{
border-top-right-radius:0.5rem;
border-bottom-right-radius:0.5rem;
}

/* Individual Corners */

.rounded-tl{border-top-left-radius:0.25rem;}
.rounded-tr{border-top-right-radius:0.25rem;}
.rounded-bl{border-bottom-left-radius:0.25rem;}
.rounded-br{border-bottom-right-radius:0.25rem;}

.rounded-tl-lg{border-top-left-radius:0.5rem;}
.rounded-tr-lg{border-top-right-radius:0.5rem;}
.rounded-bl-lg{border-bottom-left-radius:0.5rem;}
.rounded-br-lg{border-bottom-right-radius:0.5rem;}

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

git commit -m "PART 005C.6 - Radius Utility" || echo "Tidak ada perubahan untuk di-commit."

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
echo "PART 005C.6 SELESAI"
echo "========================================"

