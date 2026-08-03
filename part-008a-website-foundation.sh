#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT PART 008A"
echo " Website Foundation Core"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

echo "[1/10] Backup..."
mkdir -p backup/part-008a-$STAMP
cp -R src backup/part-008a-$STAMP/src


echo "[2/10] Create Component Structure..."

mkdir -p src/components/layout
mkdir -p src/components/sms


echo "[3/10] Create Navbar..."

cat <<'NAV' > src/components/layout/Navbar.tsx
export default function Navbar(){

return (
<nav
style={{
height:"64px",
display:"flex",
alignItems:"center",
justifyContent:"space-between",
padding:"0 24px",
background:"#FFFFFF"
}}
>

<h2
style={{
fontFamily:"Poppins",
color:"#E63946"
}}
>
StudioIT
</h2>


<div>
<a href="/">Home</a>{" "}
<a href="/services">Services</a>{" "}
<a href="/portfolio">Portfolio</a>{" "}
<a href="/contact">Contact</a>
</div>

</nav>
)

}
NAV


echo "[4/10] Create Footer..."

cat <<'FOOT' > src/components/layout/Footer.tsx
export default function Footer(){

return(

<footer
style={{
background:"#1F2937",
color:"#FFFFFF",
padding:"40px",
textAlign:"center"
}}
>

<h2>
StudioIT
</h2>

<p>
Transformasi Digital Untuk Indonesia Maju
</p>

<p>
Powered By Investment Technology Indonesia
</p>

<p>
https://investment-tech-indonesia.web.app
</p>

<p>
SMS / WhatsApp
<br/>
+6285283397198
</p>

<p>
Email
<br/>
alma.budsteddy88@gmail.com
</p>


<p>
© 2026 StudioIT. All rights reserved.
</p>


</footer>

)

}
FOOT


echo "[5/10] Create Floating SMS..."

cat <<'SMS' > src/components/sms/FloatingSMS.tsx

export default function FloatingSMS(){

return(

<a
href="https://wa.me/6285283397198"
target="_blank"
style={{
position:"fixed",
right:"24px",
bottom:"24px",
background:"#E63946",
color:"#FFFFFF",
padding:"14px 18px",
borderRadius:"50px",
zIndex:9999,
textDecoration:"none",
fontWeight:600
}}
>

SMS / WhatsApp

</a>

)

}

SMS


echo "[6/10] Update Main Layout..."

cat <<'LAYOUT' > src/layout/MainLayout.tsx

import {Outlet} from "react-router-dom";

import Navbar from "../components/layout/Navbar";
import Footer from "../components/layout/Footer";
import FloatingSMS from "../components/sms/FloatingSMS";


export default function MainLayout(){

return(

<div
style={{
minHeight:"100vh",
background:"#FFE8E8"
}}
>

<Navbar/>

<main>

<Outlet/>

</main>


<Footer/>

<FloatingSMS/>


</div>

)

}

LAYOUT


echo "[7/10] Update Routes..."

cat <<'ROUTE' > src/routes/AppRouter.tsx

import {
BrowserRouter,
Routes,
Route
}
from "react-router-dom";


import MainLayout 
from "../layout/MainLayout";


import Home 
from "../pages/Home";


export default function AppRouter(){


return(

<BrowserRouter>

<Routes>

<Route element={<MainLayout/>}>

<Route
path="/"
element={<Home/>}
/>


</Route>


</Routes>


</BrowserRouter>

)


}

ROUTE


echo "[8/10] Build Validation..."

npm run build


echo "[9/10] Git Commit..."

git add .

git commit -m "PART 008A Website Foundation Core" || true


echo "[10/10] Deploy..."

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " PART 008A COMPLETE"
echo " Backup:"
echo " backup/part-008a-$STAMP"
echo "=============================================="

