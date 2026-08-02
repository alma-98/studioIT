#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.4B - CONTENT + SIDEBAR"
echo "========================================"

mkdir -p src/layout
mkdir -p src/styles

##########################################################
# UPDATE LAYOUT.CSS
##########################################################

cat >> src/styles/layout.css <<'EOCSS'

/* =======================================================
   CONTENT
======================================================= */

.content{
    flex:1;
    width:100%;
    min-width:0;
    padding:24px;
}

.content-fluid{
    width:100%;
}

.content-center{
    max-width:1280px;
    margin:0 auto;
}

/* =======================================================
   SIDEBAR
======================================================= */

.sidebar{
    width:280px;
    min-width:280px;
    max-width:280px;
    min-height:100vh;
    background:#ffffff;
    border-right:1px solid var(--border);
    transition:.3s ease;
}

.sidebar-content{
    padding:24px;
}

.sidebar-sticky{
    position:sticky;
    top:0;
}

.sidebar-dark{
    background:var(--heading);
    color:#ffffff;
}

.sidebar-collapse{
    width:90px;
    min-width:90px;
    max-width:90px;
}

@media(max-width:992px){

.sidebar{

width:100%;
min-width:100%;
max-width:100%;
min-height:auto;

}

}

EOCSS

##########################################################
# CONTENT COMPONENT
##########################################################

cat > src/layout/Content.tsx <<'EOT'
import type { ReactNode } from "react";

interface ContentProps{

    children:ReactNode;
    className?:string;

    center?:boolean;

}

export default function Content({

    children,
    className="",
    center=false

}:ContentProps){

    return(

        <section
            className={
                `content ${
                    center ? "content-center" : ""
                } ${className}`
            }
        >

            {children}

        </section>

    );

}
EOT

##########################################################
# SIDEBAR COMPONENT
##########################################################

cat > src/layout/Sidebar.tsx <<'EOT'
import type { ReactNode } from "react";

interface SidebarProps{

    children:ReactNode;
    className?:string;

    dark?:boolean;
    sticky?:boolean;
    collapse?:boolean;

}

export default function Sidebar({

    children,
    className="",
    dark=false,
    sticky=false,
    collapse=false

}:SidebarProps){

    const classes=[
        "sidebar",
        dark ? "sidebar-dark" : "",
        sticky ? "sidebar-sticky" : "",
        collapse ? "sidebar-collapse" : "",
        className
    ].join(" ");

    return(

        <aside className={classes}>

            <div className="sidebar-content">

                {children}

            </div>

        </aside>

    );

}
EOT

##########################################################
# UPDATE INDEX
##########################################################

if ! grep -q 'Content' src/layout/index.ts; then

cat >> src/layout/index.ts <<'EOT'
export { default as Content } from "./Content";
export { default as Sidebar } from "./Sidebar";
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

git commit -m "Part 005B.4B - Content & Sidebar" || true

git push

##########################################################
# FIREBASE
##########################################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.4B SELESAI"
echo "========================================"

