#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.4C - WRAPPER + SHELL"
echo "========================================"

mkdir -p src/layout
mkdir -p src/styles

##########################################################
# UPDATE layout.css
##########################################################

cat >> src/styles/layout.css <<'EOCSS'

/* =======================================================
   WRAPPER
======================================================= */

.wrapper{
    width:100%;
    margin:0 auto;
}

.wrapper-fluid{
    width:100%;
}

.wrapper-center{
    max-width:1440px;
    margin-left:auto;
    margin-right:auto;
}

.wrapper-full{
    width:100%;
    min-height:100vh;
}

/* =======================================================
   SHELL
======================================================= */

.shell{
    display:flex;
    min-height:100vh;
    width:100%;
}

.shell-column{
    flex-direction:column;
}

.shell-row{
    flex-direction:row;
}

.shell-center{
    justify-content:center;
    align-items:center;
}

.shell-between{
    justify-content:space-between;
}

.shell-grow{
    flex:1;
}

@media(max-width:992px){

.shell{
    flex-direction:column;
}

}
EOCSS

##########################################################
# WRAPPER COMPONENT
##########################################################

cat > src/layout/Wrapper.tsx <<'EOT'
import type { ReactNode } from "react";

interface WrapperProps{

    children:ReactNode;
    className?:string;

    fluid?:boolean;
    center?:boolean;

}

export default function Wrapper({

    children,
    className="",
    fluid=false,
    center=false

}:WrapperProps){

    let classes="wrapper";

    if(fluid){

        classes+=" wrapper-fluid";

    }

    if(center){

        classes+=" wrapper-center";

    }

    return(

        <div className={`${classes} ${className}`}>

            {children}

        </div>

    );

}
EOT

##########################################################
# SHELL COMPONENT
##########################################################

cat > src/layout/Shell.tsx <<'EOT'
import type { ReactNode } from "react";

interface ShellProps{

    children:ReactNode;
    className?:string;

    column?:boolean;
    center?:boolean;

}

export default function Shell({

    children,
    className="",
    column=false,
    center=false

}:ShellProps){

    let classes="shell";

    classes += column
        ? " shell-column"
        : " shell-row";

    if(center){

        classes+=" shell-center";

    }

    return(

        <div className={`${classes} ${className}`}>

            {children}

        </div>

    );

}
EOT

##########################################################
# UPDATE INDEX
##########################################################

if ! grep -q 'Wrapper' src/layout/index.ts; then

cat >> src/layout/index.ts <<'EOT'
export { default as Wrapper } from "./Wrapper";
export { default as Shell } from "./Shell";
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

git commit -m "Part 005B.4C - Wrapper & Shell" || true

git push

##########################################################
# FIREBASE
##########################################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.4C SELESAI"
echo "========================================"

