#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.3C - SPACER + MASONRY"
echo "========================================"

mkdir -p src/layout
mkdir -p src/styles

############################################################
# UPDATE layout.css
############################################################

cat >> src/styles/layout.css <<'EOCSS'

/* ==========================================================
   SPACER
========================================================== */

.spacer-xs{height:8px;}
.spacer-sm{height:16px;}
.spacer-md{height:24px;}
.spacer-lg{height:48px;}
.spacer-xl{height:72px;}
.spacer-2xl{height:96px;}

/* ==========================================================
   MASONRY
========================================================== */

.masonry{
    column-count:3;
    column-gap:24px;
}

.masonry-item{
    break-inside:avoid;
    margin-bottom:24px;
    width:100%;
}

@media(max-width:1200px){

.masonry{
    column-count:2;
}

}

@media(max-width:768px){

.masonry{
    column-count:1;
}

}
EOCSS

############################################################
# SPACER COMPONENT
############################################################

cat > src/layout/Spacer.tsx <<'EOT'
interface SpacerProps{

    size?:
        |"xs"
        |"sm"
        |"md"
        |"lg"
        |"xl"
        |"2xl";

}

export default function Spacer({

    size="md"

}:SpacerProps){

    return(

        <div
            aria-hidden="true"
            className={`spacer-${size}`}
        />

    );

}
EOT

############################################################
# MASONRY COMPONENT
############################################################

cat > src/layout/Masonry.tsx <<'EOT'
import type { ReactNode } from "react";

interface MasonryProps{

    children:ReactNode;
    className?:string;

}

export default function Masonry({

    children,
    className=""

}:MasonryProps){

    return(

        <div className={`masonry ${className}`}>

            {children}

        </div>

    );

}
EOT

############################################################
# MASONRY ITEM
############################################################

cat > src/layout/MasonryItem.tsx <<'EOT'
import type { ReactNode } from "react";

interface MasonryItemProps{

    children:ReactNode;
    className?:string;

}

export default function MasonryItem({

    children,
    className=""

}:MasonryItemProps){

    return(

        <div className={`masonry-item ${className}`}>

            {children}

        </div>

    );

}
EOT

############################################################
# UPDATE INDEX
############################################################

if ! grep -q 'Spacer' src/layout/index.ts; then

cat >> src/layout/index.ts <<'EOT'
export { default as Spacer } from "./Spacer";
export { default as Masonry } from "./Masonry";
export { default as MasonryItem } from "./MasonryItem";
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

git commit -m "Part 005B.3C - Spacer & Masonry" || true

git push

############################################################
# FIREBASE
############################################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.3C SELESAI"
echo "========================================"

