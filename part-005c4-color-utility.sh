#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005C.4 - COLOR UTILITY"
echo "========================================"

FILE="src/styles/utilities.css"

mkdir -p src/styles
touch "$FILE"

if ! grep -q "COLOR UTILITIES" "$FILE"; then

cat >> "$FILE" <<'CSS'


/* ======================================================
   COLOR UTILITIES
====================================================== */

/* TEXT */

.text-primary{color:var(--color-primary);}
.text-secondary{color:var(--color-secondary);}
.text-success{color:var(--color-success);}
.text-warning{color:var(--color-warning);}
.text-danger{color:var(--color-danger);}
.text-info{color:var(--color-info);}

.text-white{color:#fff;}
.text-black{color:#000;}

.text-muted{color:var(--color-text-muted);}
.text-body{color:var(--color-text);}
.text-heading{color:var(--color-heading);}


/* BACKGROUND */

.bg-primary{background:var(--color-primary);}
.bg-secondary{background:var(--color-secondary);}
.bg-success{background:var(--color-success);}
.bg-warning{background:var(--color-warning);}
.bg-danger{background:var(--color-danger);}
.bg-info{background:var(--color-info);}

.bg-white{background:#fff;}
.bg-black{background:#000;}

.bg-surface{background:var(--color-surface);}
.bg-card{background:var(--color-card);}
.bg-body{background:var(--color-background);}


/* BORDER */

.border-primary{border-color:var(--color-primary);}
.border-secondary{border-color:var(--color-secondary);}
.border-success{border-color:var(--color-success);}
.border-warning{border-color:var(--color-warning);}
.border-danger{border-color:var(--color-danger);}
.border-info{border-color:var(--color-info);}

.border-white{border-color:#fff;}
.border-black{border-color:#000;}

.border-default{border-color:var(--color-border);}


/* HOVER */

.hover-primary:hover{
color:var(--color-primary);
}

.hover-secondary:hover{
color:var(--color-secondary);
}

.hover-success:hover{
color:var(--color-success);
}

.hover-warning:hover{
color:var(--color-warning);
}

.hover-danger:hover{
color:var(--color-danger);
}

.hover-info:hover{
color:var(--color-info);
}

.hover-bg-primary:hover{
background:var(--color-primary);
}

.hover-bg-secondary:hover{
background:var(--color-secondary);
}

.hover-bg-success:hover{
background:var(--color-success);
}

.hover-bg-warning:hover{
background:var(--color-warning);
}

.hover-bg-danger:hover{
background:var(--color-danger);
}

.hover-bg-info:hover{
background:var(--color-info);
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

git commit -m "Part 005C.4 Color Utility" || true

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
echo "PART 005C.4 SELESAI"
echo "========================================"

