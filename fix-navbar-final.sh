#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT NAVBAR FINAL"
echo " Menu + CTA Update"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/6] Backup Navbar..."

mkdir -p backup/navbar-$STAMP

cp src/components/layout/Navbar.tsx \
backup/navbar-$STAMP/


echo "[2/6] Update Navbar..."


cat <<'NAVBAR' > src/components/layout/Navbar.tsx

import { Link } from "react-router-dom";


export default function Navbar(){

const menus=[

{
name:"Home",
path:"/"
},

{
name:"Services",
path:"/services"
},

{
name:"Portfolio",
path:"/portfolio"
},

{
name:"Pricing",
path:"/pricing"
},

{
name:"Blog",
path:"/blog"
},

{
name:"Contact",
path:"/contact"
}

]


return(

<header

style={{

position:"sticky",

top:0,

zIndex:1000,

background:"#FFFFFF",

boxShadow:"0 4px 18px rgba(0,0,0,.08)"

}}

>


<nav

style={{

maxWidth:"1200px",

height:"72px",

margin:"auto",

padding:"0 24px",

display:"flex",

alignItems:"center",

justifyContent:"space-between"

}}

>


<Link

to="/"

style={{

textDecoration:"none"

}}

>

<h2

style={{

fontFamily:"Poppins",

color:"#E63946",

margin:0,

fontSize:"26px"

}}

>

StudioIT

</h2>

</Link>



<div

style={{

display:"flex",

alignItems:"center",

gap:"24px"

}}

>


{

menus.map(menu=>(

<Link

key={menu.name}

to={menu.path}

style={{

textDecoration:"none",

color:"#374151",

fontFamily:"Inter",

fontSize:"15px"

}}

>

{menu.name}

</Link>

))

}



<a

href="mailto:alma.budsteddy88@gmail.com"

style={{

textDecoration:"none"

}}

>


<button

style={{

background:"#E63946",

color:"#FFFFFF",

border:"none",

padding:"12px 22px",

borderRadius:"12px",

fontFamily:"Poppins",

cursor:"pointer",

fontSize:"14px"

}}

>

Konsultasi Project

</button>


</a>



</div>


</nav>


</header>


)

}

NAVBAR


echo "[3/6] Build..."

npm run build


echo "[4/6] Commit..."

git add src/components/layout/Navbar.tsx

git commit -m "Finalize StudioIT navbar menu and consultation CTA" || true


echo "[5/6] Push..."

git push origin main || true


echo "[6/6] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " NAVBAR FINAL COMPLETE"
echo " Backup:"
echo " backup/navbar-$STAMP"
echo "=============================================="

