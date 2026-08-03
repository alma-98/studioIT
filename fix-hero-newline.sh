#!/bin/bash

set -e

echo "=============================================="
echo " FIX HERO NEWLINE ISSUE"
echo "=============================================="

cat <<'HERO' > src/pages/Landing/components/Hero.tsx

import { motion } from "framer-motion";
import { ArrowRight, Code2 } from "lucide-react";


export default function Hero(){

return (

<section
style={{
padding:"100px 24px",
background:"#FFE8E8",
textAlign:"center"
}}
>

<motion.div
initial={{opacity:0,y:30}}
animate={{opacity:1,y:0}}
transition={{duration:.8}}
>

<Code2
size={60}
color="#E63946"
/>


<h1
style={{
fontFamily:"Poppins",
fontSize:"48px",
color:"#1F2937"
}}
>
Transformasi Digital Untuk Indonesia Maju
</h1>


<p
style={{
fontFamily:"Inter",
maxWidth:"700px",
margin:"20px auto",
color:"#374151",
lineHeight:"1.8"
}}
>
StudioIT menghadirkan solusi teknologi modern:
<br/>
Website, Mobile Apps, AI, Cloud Solution,
<br/>
dan Sistem Digital Bisnis.
</p>


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
padding:"14px 28px",
borderRadius:"12px",
cursor:"pointer",
display:"inline-flex",
alignItems:"center",
gap:"8px"
}}
>

Konsultasi Project

<ArrowRight size={18}/>

</button>

</a>


</motion.div>

</section>

)

}

HERO


echo "[1/3] Hero fixed"

echo "[2/3] Build..."

npm run build


echo "[3/3] Commit Deploy..."

git add src/pages/Landing/components/Hero.tsx

git commit -m "Fix Hero newline rendering and CTA" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " HERO FIX COMPLETE"
echo "=============================================="

