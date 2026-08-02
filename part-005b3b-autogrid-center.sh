#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.3B - AUTOGRID + CENTER"
echo "========================================"

mkdir -p src/layout
mkdir -p src/styles

############################################################
# UPDATE layout.css
############################################################

cat >> src/styles/layout.css <<'EOCSS'

/* ==========================================================
   AUTOGRID
========================================================== */

.auto-grid{
    display:grid;
    gap:24px;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
}

.auto-grid-sm{
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
}

.auto-grid-lg{
    grid-template-columns:repeat(auto-fit,minmax(360px,1fr));
}

/* ==========================================================
   CENTER
========================================================== */

.center{
    display:flex;
    justify-content:center;
    align-items:center;
}

.center-column{
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
}

.text-center{
    text-align:center;
}

@media(max-width:768px){

.auto-grid,
.auto-grid-sm,
.auto-grid-lg{
    grid-template-columns:1fr;
}

}
EOCSS

############################################################
# AUTOGRID COMPONENT
############################################################

cat > src/layout/AutoGrid.tsx <<'EOT'
import type { ReactNode } from "react";

type Size = "sm" | "md" | "lg";

interface AutoGridProps{
    children:ReactNode;
    size?:Size;
    className?:string;
}

export default function AutoGrid({
    children,
    size="md",
    className=""
}:AutoGridProps){

    const gridClass =
        size==="sm"
        ? "auto-grid-sm"
        : size==="lg"
        ? "auto-grid-lg"
        : "auto-grid";

    return(
        <div className={`${gridClass} ${className}`}>
            {children}
        </div>
    );
}
EOT

############################################################
# CENTER COMPONENT
############################################################

cat > src/layout/Center.tsx <<'EOT'
import type { ReactNode } from "react";

interface CenterProps{
    children:ReactNode;
    column?:boolean;
    className?:string;
}

export default function Center({
    children,
    column=false,
    className=""
}:CenterProps){

    return(
        <div
            className={`${
                column ? "center-column" : "center"
            } ${className}`}
        >
            {children}
        </div>
    );
}
EOT

############################################################
# UPDATE INDEX
############################################################

if ! grep -q 'AutoGrid' src/layout/index.ts; then
cat >> src/layout/index.ts <<'EOT'
export { default as AutoGrid } from "./AutoGrid";
export { default as Center } from "./Center";
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

git commit -m "Part 005B.3B - AutoGrid & Center" || true

git push

############################################################
# FIREBASE
############################################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.3B SELESAI"
echo "========================================"

