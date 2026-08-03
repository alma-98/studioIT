#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX ABOUT TWO COLUMN"
echo " Remove Icon + Corporate Layout"
echo "=============================================="

cat <<'ABOUT' > src/pages/Landing/components/About.tsx

import { motion } from "framer-motion";


export default function About(){

return(

<section
style={{
padding:"90px 24px",
background:"#FFFFFF"
}}
>


<div
style={{
maxWidth:"1200px",
margin:"auto"
}}
>


<motion.div

initial={{
opacity:0,
y:30
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
duration:.6
}}

>


<h2
style={{

fontFamily:"Poppins",

fontSize:"30px",

lineHeight:"1.3",

color:"#1F2937",

textAlign:"center",

marginBottom:"50px"

}}
>

Membangun Masa Depan Digital
<br/>
Bersama Teknologi Modern

</h2>



<div

style={{

display:"grid",

gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",

gap:"40px"

}}

>



<div>

<h3
style={{
fontFamily:"Poppins",
fontSize:"22px",
color:"#E63946"
}}
>

StudioIT

</h3>


<p
style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151"
}}
>

StudioIT adalah Software House dan Digital Agency
yang membantu perusahaan, UMKM, startup, dan organisasi
melakukan transformasi digital melalui solusi teknologi
inovatif, scalable, dan sesuai kebutuhan bisnis.

</p>


</div>



<div>


<h3
style={{
fontFamily:"Poppins",
fontSize:"22px",
color:"#E63946"
}}
>

Solusi Digital Modern

</h3>


<p
style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151"
}}
>

Kami membangun solusi digital modern mulai dari
Website Development, Mobile Application, AI,
Cloud Solution, hingga Sistem Informasi Bisnis
yang siap berkembang mengikuti kebutuhan Anda.

</p>


</div>


</div>


</motion.div>


</div>


</section>

)

}

ABOUT


echo "[1/3] About updated"


echo "[2/3] Build..."

npm run build


echo "[3/3] Commit Deploy..."

git add src/pages/Landing/components/About.tsx

git commit -m "Redesign About section two column layout" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " ABOUT TWO COLUMN COMPLETE"
echo "=============================================="

