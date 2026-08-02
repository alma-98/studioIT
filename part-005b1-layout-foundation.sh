#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 005B.1 - LAYOUT FOUNDATION"
echo "========================================"

mkdir -p src/layout
mkdir -p src/styles

########################################
# layout.css
########################################

cat > src/styles/layout.css <<'EOCSS'
.container{
    width:100%;
    max-width:1280px;
    margin:0 auto;
    padding-left:24px;
    padding-right:24px;
}

.section{
    padding:80px 0;
}

.section-sm{
    padding:48px 0;
}

.section-lg{
    padding:120px 0;
}

.flex{
    display:flex;
}

.flex-center{
    display:flex;
    justify-content:center;
    align-items:center;
}

.grid{
    display:grid;
    gap:24px;
}

.grid-2{
    grid-template-columns:repeat(2,1fr);
}

.grid-3{
    grid-template-columns:repeat(3,1fr);
}

.grid-4{
    grid-template-columns:repeat(4,1fr);
}

@media(max-width:1024px){

.grid-4{
grid-template-columns:repeat(2,1fr);
}

.grid-3{
grid-template-columns:repeat(2,1fr);
}

}

@media(max-width:768px){

.grid-2,
.grid-3,
.grid-4{

grid-template-columns:1fr;

}

.container{

padding-left:20px;
padding-right:20px;

}

}
EOCSS

########################################
# Container
########################################

cat > src/layout/Container.tsx <<'EOT'
import type { ReactNode } from "react";

type Props={
 children:ReactNode;
};

export default function Container({children}:Props){

 return(
  <div className="container">
   {children}
  </div>
 );

}
EOT

########################################
# Section
########################################

cat > src/layout/Section.tsx <<'EOT'
import type { ReactNode } from "react";

type Props={
 children:ReactNode;
 className?:string;
};

export default function Section({
 children,
 className=""
}:Props){

 return(
  <section className={`section ${className}`}>
   {children}
  </section>
 );

}
EOT

########################################
# index.ts
########################################

cat > src/layout/index.ts <<'EOT'
export {default as Container} from "./Container";
export {default as Section} from "./Section";
EOT

########################################
# import layout.css
########################################

if ! grep -q "layout.css" src/main.tsx; then
python3 <<'PY'
from pathlib import Path

p=Path("src/main.tsx")

text=p.read_text()

text=text.replace(
'import "./styles/typography.css";',
'import "./styles/typography.css";\nimport "./styles/layout.css";'
)

p.write_text(text)
PY
fi

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

git commit -m "Part 005B.1 - Layout Foundation" || true

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 005B.1 SELESAI"
echo "========================================"

