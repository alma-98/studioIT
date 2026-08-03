#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005D.2 - ANIMATION UTILITY"
echo "========================================"

mkdir -p src/styles

FILE="src/styles/animations.css"

cat > "$FILE" <<'CSS'
/* ======================================================
   StudioIT Animation Utility
====================================================== */

/* ===============================
   Transition
================================ */

.transition{
transition:all .3s ease;
}

.transition-fast{
transition:all .15s ease;
}

.transition-slow{
transition:all .6s ease;
}

.transition-none{
transition:none;
}

/* ===============================
   Duration
================================ */

.duration-100{transition-duration:.1s;}
.duration-200{transition-duration:.2s;}
.duration-300{transition-duration:.3s;}
.duration-500{transition-duration:.5s;}
.duration-700{transition-duration:.7s;}
.duration-1000{transition-duration:1s;}

/* ===============================
   Delay
================================ */

.delay-100{transition-delay:.1s;}
.delay-200{transition-delay:.2s;}
.delay-300{transition-delay:.3s;}
.delay-500{transition-delay:.5s;}

/* ===============================
   Timing
================================ */

.ease{transition-timing-function:ease;}
.ease-in{transition-timing-function:ease-in;}
.ease-out{transition-timing-function:ease-out;}
.ease-in-out{transition-timing-function:ease-in-out;}
.linear{transition-timing-function:linear;}

/* ===============================
   Hover Scale
================================ */

.scale-hover:hover{
transform:scale(1.05);
}

.scale-sm:hover{
transform:scale(.95);
}

.scale-lg:hover{
transform:scale(1.1);
}

/* ===============================
   Hover Rotate
================================ */

.rotate-hover:hover{
transform:rotate(5deg);
}

.rotate-45{
transform:rotate(45deg);
}

.rotate-90{
transform:rotate(90deg);
}

.rotate-180{
transform:rotate(180deg);
}

/* ===============================
   Hover Translate
================================ */

.translate-up:hover{
transform:translateY(-8px);
}

.translate-down:hover{
transform:translateY(8px);
}

.translate-left:hover{
transform:translateX(-8px);
}

.translate-right:hover{
transform:translateX(8px);
}

/* ===============================
   Hover Effects
================================ */

.hover-lift:hover{
transform:translateY(-6px);
}

.hover-grow:hover{
transform:scale(1.05);
}

.hover-shrink:hover{
transform:scale(.95);
}

.hover-bright:hover{
filter:brightness(1.1);
}

/* ===============================
   Keyframes
================================ */

@keyframes fadeIn{
from{
opacity:0;
}
to{
opacity:1;
}
}

@keyframes fadeOut{
from{
opacity:1;
}
to{
opacity:0;
}
}

@keyframes slideUp{
from{
opacity:0;
transform:translateY(40px);
}
to{
opacity:1;
transform:translateY(0);
}
}

@keyframes slideDown{
from{
opacity:0;
transform:translateY(-40px);
}
to{
opacity:1;
transform:translateY(0);
}
}

@keyframes slideLeft{
from{
opacity:0;
transform:translateX(-40px);
}
to{
opacity:1;
transform:translateX(0);
}
}

@keyframes slideRight{
from{
opacity:0;
transform:translateX(40px);
}
to{
opacity:1;
transform:translateX(0);
}
}

@keyframes pulse{
0%{
transform:scale(1);
}
50%{
transform:scale(1.05);
}
100%{
transform:scale(1);
}
}

@keyframes bounce{
0%,100%{
transform:translateY(0);
}
50%{
transform:translateY(-12px);
}
}

@keyframes spin{
to{
transform:rotate(360deg);
}
}

/* ===============================
   Animation Classes
================================ */

.animate-fade{
animation:fadeIn .5s ease both;
}

.animate-fade-out{
animation:fadeOut .5s ease both;
}

.animate-slide-up{
animation:slideUp .5s ease both;
}

.animate-slide-down{
animation:slideDown .5s ease both;
}

.animate-slide-left{
animation:slideLeft .5s ease both;
}

.animate-slide-right{
animation:slideRight .5s ease both;
}

.animate-pulse{
animation:pulse 1.5s infinite;
}

.animate-bounce{
animation:bounce 1s infinite;
}

.animate-spin{
animation:spin 1s linear infinite;
}

/* ===============================
   Fill Mode
================================ */

.fill-forwards{
animation-fill-mode:forwards;
}

.fill-backwards{
animation-fill-mode:backwards;
}

.fill-both{
animation-fill-mode:both;
}
CSS

MAIN="src/main.tsx"

if ! grep -q 'animations.css' "$MAIN"; then
awk '
/import "\.\/styles\/breakpoints\.css";/{
print;
print "import \"./styles/animations.css\";";
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

git commit -m "PART 005D.2 - Animation Utility" || echo "Tidak ada perubahan"

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
echo "PART 005D.2 SELESAI"
echo "========================================"

