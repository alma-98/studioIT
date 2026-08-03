
#!/bin/bash

set -e

STAMP=$(date +"%Y%m%d_%H%M%S")

echo "=============================================="
echo " PART 008B.1"
echo " Landing Page Integration"
echo " Architecture Cleanup"
echo "=============================================="

echo ""
echo "[1/10] Backup..."

mkdir -p backup/part-008b1-$STAMP

cp -r src backup/part-008b1-$STAMP/src

echo "Backup created"

echo ""
echo "[2/10] Cleanup unused layouts..."

rm -rf src/layouts

echo "Removed src/layouts"

echo ""
echo "[3/10] Update Router..."

cat <<'ROUTER' > src/routes/AppRouter.tsx

import {
 BrowserRouter,
 Routes,
 Route
} from "react-router-dom";


import MainLayout from "../layout/MainLayout";


import Home from "../pages/Home";
import Services from "../pages/Services";
import Portfolio from "../pages/Portfolio";
import Pricing from "../pages/Pricing";
import Contact from "../pages/Contact";
import Login from "../pages/Login";
import Register from "../pages/Register";
import Dashboard from "../pages/Dashboard";
import Admin from "../pages/Admin";
import Blog from "../pages/Blog";
import FAQ from "../pages/FAQ";


export default function AppRouter(){

return (

<BrowserRouter>

<Routes>


<Route element={<MainLayout/>}>


<Route
path="/"
element={<Home/>}
/>


<Route
path="/services"
element={<Services/>}
/>


<Route
path="/portfolio"
element={<Portfolio/>}
/>


<Route
path="/pricing"
element={<Pricing/>}
/>


<Route
path="/blog"
element={<Blog/>}
/>


<Route
path="/faq"
element={<FAQ/>}
/>


<Route
path="/contact"
element={<Contact/>}
/>


<Route
path="/login"
element={<Login/>}
/>


<Route
path="/register"
element={<Register/>}
/>


<Route
path="/dashboard"
element={<Dashboard/>}
/>


<Route
path="/admin"
element={<Admin/>}
/>


</Route>


</Routes>

</BrowserRouter>

)

}

ROUTER

echo "Router updated"


echo ""
echo "[4/10] Update MainLayout Global Popup SMS..."

cat <<'LAYOUT' > src/layout/MainLayout.tsx

import { Outlet } from "react-router-dom";

import Navbar from "../components/layout/Navbar";
import Footer from "../components/layout/Footer";
import FloatingSMS from "../components/sms/FloatingSMS";
import PopupSMS from "../components/sms/PopupSMS";


export default function MainLayout(){

return (

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


<PopupSMS/>


<FloatingSMS/>


</div>

)

}

LAYOUT


echo "MainLayout updated"


echo ""
echo "[5/10] Verify Landing..."

test -f src/pages/Landing/LandingPage.tsx \
&& echo "Landing OK" \
|| echo "Landing missing"


echo ""
echo "[6/10] Build..."

npm run build


echo ""
echo "[7/10] Git add..."

git add .


echo ""
echo "[8/10] Commit..."

git commit -m "PART 008B.1 Landing integration architecture cleanup" || true


echo ""
echo "[9/10] Push..."

git push || true


echo ""
echo "[10/10] Firebase Deploy..."

firebase deploy --only hosting


echo ""
echo "=============================================="
echo " PART 008B.1 COMPLETE"
echo " Backup:"
echo " backup/part-008b1-$STAMP"
echo "=============================================="

