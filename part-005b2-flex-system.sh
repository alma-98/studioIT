#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.2 - FLEX SYSTEM"
echo "========================================"

mkdir -p src/layout

########################################
# UPDATE layout.css
########################################

cat >> src/styles/layout.css <<'EOCSS'

/* =======================================================
   FLEX SYSTEM
======================================================= */

.flex-row{
    display:flex;
    flex-direction:row;
}

.flex-column{
    display:flex;
    flex-direction:column;
}

.flex-wrap{
    flex-wrap:wrap;
}

.items-start{
    align-items:flex-start;
}

.items-center{
    align-items:center;
}

.items-end{
    align-items:flex-end;
}

.justify-start{
    justify-content:flex-start;
}

.justify-center{
    justify-content:center;
}

.justify-between{
    justify-content:space-between;
}

.justify-around{
    justify-content:space-around;
}

.justify-end{
    justify-content:flex-end;
}

.gap-xs{
    gap:8px;
}

.gap-sm{
    gap:12px;
}

.gap-md{
    gap:20px;
}

.gap-lg{
    gap:32px;
}

.gap-xl{
    gap:48px;
}
EOCSS

########################################
# FLEX
########################################

cat > src/layout/Flex.tsx <<'EOT'
import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Flex({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-row ${className}`}>
            {children}
        </div>
    );

}
EOT

########################################
# STACK
########################################

cat > src/layout/Stack.tsx <<'EOT'
import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Stack({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-column ${className}`}>
            {children}
        </div>
    );

}
EOT

########################################
# ROW
########################################

cat > src/layout/Row.tsx <<'EOT'
import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Row({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-row items-center ${className}`}>
            {children}
        </div>
    );

}
EOT

########################################
# COLUMN
########################################

cat > src/layout/Column.tsx <<'EOT'
import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Column({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-column ${className}`}>
            {children}
        </div>
    );

}
EOT

########################################
# UPDATE INDEX
########################################

cat > src/layout/index.ts <<'EOT'
export { default as Container } from "./Container";
export { default as Section } from "./Section";

export { default as Flex } from "./Flex";
export { default as Stack } from "./Stack";
export { default as Row } from "./Row";
export { default as Column } from "./Column";
EOT

########################################
# BUILD
########################################

echo ""
echo "Running Build..."
npm run build

########################################
# GIT
########################################

git add .

git commit -m "Part 005B.2 - Flex System" || true

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.2 SELESAI"
echo "========================================"

