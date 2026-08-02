#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.3A - GRID SYSTEM"
echo "========================================"

mkdir -p src/layout
mkdir -p src/styles

############################################################
# UPDATE layout.css
############################################################

cat >> src/styles/layout.css <<'EOCSS'

/* ==========================================================
   GRID SYSTEM
========================================================== */

.grid{
    display:grid;
    gap:24px;
}

.grid-1{
    grid-template-columns:repeat(1,minmax(0,1fr));
}

.grid-2{
    grid-template-columns:repeat(2,minmax(0,1fr));
}

.grid-3{
    grid-template-columns:repeat(3,minmax(0,1fr));
}

.grid-4{
    grid-template-columns:repeat(4,minmax(0,1fr));
}

.grid-5{
    grid-template-columns:repeat(5,minmax(0,1fr));
}

.grid-6{
    grid-template-columns:repeat(6,minmax(0,1fr));
}

.grid-auto{
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
}

.grid-start{
    align-items:start;
}

.grid-center{
    align-items:center;
}

.grid-end{
    align-items:end;
}

.grid-stretch{
    align-items:stretch;
}

.grid-gap-xs{
    gap:8px;
}

.grid-gap-sm{
    gap:12px;
}

.grid-gap-md{
    gap:20px;
}

.grid-gap-lg{
    gap:32px;
}

.grid-gap-xl{
    gap:48px;
}

@media(max-width:1200px){

.grid-6{
grid-template-columns:repeat(3,1fr);
}

.grid-5{
grid-template-columns:repeat(3,1fr);
}

.grid-4{
grid-template-columns:repeat(2,1fr);
}

}

@media(max-width:992px){

.grid-3{
grid-template-columns:repeat(2,1fr);
}

.grid-5{
grid-template-columns:repeat(2,1fr);
}

.grid-6{
grid-template-columns:repeat(2,1fr);
}

}

@media(max-width:768px){

.grid-2,
.grid-3,
.grid-4,
.grid-5,
.grid-6{

grid-template-columns:1fr;

}

.grid-auto{

grid-template-columns:1fr;

}

}

EOCSS

############################################################
# GRID COMPONENT
############################################################

cat > src/layout/Grid.tsx <<'EOT'
import type { ReactNode } from "react";

type GridColumns = 1 | 2 | 3 | 4 | 5 | 6 | "auto";

interface GridProps{
    children:ReactNode;
    cols?:GridColumns;
    gap?:"xs"|"sm"|"md"|"lg"|"xl";
    className?:string;
}

export default function Grid({
    children,
    cols=3,
    gap="md",
    className=""
}:GridProps){

    const gridClass =
        cols==="auto"
        ? "grid-auto"
        : `grid-${cols}`;

    return(
        <div
            className={`grid ${gridClass} grid-gap-${gap} ${className}`}
        >
            {children}
        </div>
    );

}
EOT

############################################################
# UPDATE INDEX
############################################################

if ! grep -q 'Grid' src/layout/index.ts; then

cat >> src/layout/index.ts <<'EOT'
export { default as Grid } from "./Grid";
EOT

fi

############################################################
# BUILD
############################################################

echo ""
echo "Running Build..."

npm run build

############################################################
# GIT
############################################################

git add .

git commit -m "Part 005B.3A - Grid System" || true

git push

############################################################
# FIREBASE
############################################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.3A SELESAI"
echo "========================================"

