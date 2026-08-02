#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.4A - PAGE + MAIN"
echo "========================================"

mkdir -p src/layout

##########################################################
# UPDATE layout.css
##########################################################

cat >> src/styles/layout.css <<'EOCSS'

/* =======================================================
   PAGE LAYOUT
======================================================= */

.page{
    width:100%;
    min-height:100vh;
    display:flex;
    flex-direction:column;
    background:var(--background);
}

.main{
    flex:1;
    width:100%;
}

.main-scroll{
    overflow:auto;
}

.main-center{
    display:flex;
    justify-content:center;
    align-items:center;
}

.main-full{
    width:100%;
    min-height:100vh;
}

EOCSS

##########################################################
# PAGE COMPONENT
##########################################################

cat > src/layout/Page.tsx <<'EOT'
import type { ReactNode } from "react";

interface PageProps{
    children:ReactNode;
    className?:string;
}

export default function Page({
    children,
    className=""
}:PageProps){

    return(
        <div
            className={`page ${className}`}
        >
            {children}
        </div>
    );

}
EOT

##########################################################
# MAIN COMPONENT
##########################################################

cat > src/layout/Main.tsx <<'EOT'
import type { ReactNode } from "react";

interface MainProps{

    children:ReactNode;
    className?:string;

    center?:boolean;

    scroll?:boolean;

}

export default function Main({

    children,
    className="",
    center=false,
    scroll=false

}:MainProps){

    let classes="main";

    if(center){

        classes+=" main-center";

    }

    if(scroll){

        classes+=" main-scroll";

    }

    return(

        <main
            className={`${classes} ${className}`}
        >

            {children}

        </main>

    );

}
EOT

##########################################################
# UPDATE INDEX
##########################################################

if ! grep -q 'Page' src/layout/index.ts; then

cat >> src/layout/index.ts <<'EOT'
export { default as Page } from "./Page";
export { default as Main } from "./Main";
EOT

fi

##########################################################
# BUILD
##########################################################

echo ""
echo "Running Build..."

npm run build

##########################################################
# GIT
##########################################################

git add .

git commit -m "Part 005B.4A - Page Layout" || true

git push

##########################################################
# FIREBASE
##########################################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.4A SELESAI"
echo "========================================"

