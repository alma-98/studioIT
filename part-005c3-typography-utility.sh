#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.3 - TYPOGRAPHY UTILITY"
echo "========================================"

FILE="src/styles/utilities.css"

mkdir -p src/styles

touch "$FILE"

if ! grep -q "TYPOGRAPHY UTILITIES" "$FILE"; then

cat >> "$FILE" <<'CSS'


/* =======================================================
   TYPOGRAPHY UTILITIES
======================================================= */

/* Font Size */
.text-xs{font-size:.75rem;}
.text-sm{font-size:.875rem;}
.text-base{font-size:1rem;}
.text-lg{font-size:1.125rem;}
.text-xl{font-size:1.25rem;}
.text-2xl{font-size:1.5rem;}
.text-3xl{font-size:1.875rem;}
.text-4xl{font-size:2.25rem;}
.text-5xl{font-size:3rem;}
.text-6xl{font-size:3.75rem;}

/* Font Weight */
.font-thin{font-weight:100;}
.font-extralight{font-weight:200;}
.font-light{font-weight:300;}
.font-normal{font-weight:400;}
.font-medium{font-weight:500;}
.font-semibold{font-weight:600;}
.font-bold{font-weight:700;}
.font-extrabold{font-weight:800;}
.font-black{font-weight:900;}

/* Text Align */
.text-left{text-align:left;}
.text-center{text-align:center;}
.text-right{text-align:right;}
.text-justify{text-align:justify;}

/* Line Height */
.leading-none{line-height:1;}
.leading-tight{line-height:1.25;}
.leading-snug{line-height:1.375;}
.leading-normal{line-height:1.5;}
.leading-relaxed{line-height:1.625;}
.leading-loose{line-height:2;}

/* Letter Spacing */
.tracking-tighter{letter-spacing:-0.05em;}
.tracking-tight{letter-spacing:-0.025em;}
.tracking-normal{letter-spacing:0;}
.tracking-wide{letter-spacing:0.025em;}
.tracking-wider{letter-spacing:0.05em;}
.tracking-widest{letter-spacing:0.1em;}

/* Text Transform */
.uppercase{text-transform:uppercase;}
.lowercase{text-transform:lowercase;}
.capitalize{text-transform:capitalize;}
.normal-case{text-transform:none;}

/* Decoration */
.underline{text-decoration:underline;}
.line-through{text-decoration:line-through;}
.no-underline{text-decoration:none;}

/* Overflow */
.truncate{
overflow:hidden;
white-space:nowrap;
text-overflow:ellipsis;
}

.break-words{
overflow-wrap:break-word;
word-break:break-word;
}

.break-all{
word-break:break-all;
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
echo "Git Commit"
echo "========================================"

git add .

git commit -m "Part 005C.3 Typography Utility" || true

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
echo "PART 005C.3 SELESAI"
echo "========================================"

