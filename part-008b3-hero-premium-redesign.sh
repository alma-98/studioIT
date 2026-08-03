#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT PART 008B.3"
echo " Hero Premium Redesign"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/9] Backup..."

mkdir -p backup/part-008b3-$STAMP

cp src/pages/Landing/components/Hero.tsx \
backup/part-008b3-$STAMP/Hero.tsx


echo "[2/9] Create Hero Visual Component..."

cat <<'VISUAL' > src/pages/Landing/components/HeroVisual.tsx

import { motion } from "framer-motion";
import {
Code2,
BrainCircuit,
Cloud,
Smartphone
} from "lucide-react";


export default function HeroVisual(){

const items=[
{
icon:<Code2 size={28}/>,
title:"Software Development"
},
{
icon:<BrainCircuit size={28}/>,
title:"AI Solution"
},
{
icon:<Cloud size={28}/>,
title:"Cloud System"
},
{
icon:<Smartphone size={28}/>,
title:"Mobile Apps"
}
]


return(

<div
style={{
display:"grid",
gap:"16px"
}}
>

{
items.map((item,index)=>(

<motion.div

key={item.title}

initial={{
opacity:0,
x:30
}}

animate={{
opacity:1,
x:0
}}

transition={{
delay:index*.15
}}

style={{
background:"#FFFFFF",
padding:"20px",
borderRadius:"18px",
display:"flex",
alignItems:"center",
gap:"15px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)"
}}

>

<div
style={{
color:"#E63946"
}}
>
{item.icon}
</div>

<span
style={{
fontFamily:"Inter",
color:"#374151"
}}
>
{item.title}
</span>


</motion.div>

))

}

</div>

)

}

VISUAL


echo "[3/9] Create Premium Hero..."


cat <<'HERO' > src/pages/Landing/components/Hero.tsx

import { motion } from "framer-motion";
import { CheckCircle } from "lucide-react";

import HeroVisual from "./HeroVisual";


export default function Hero(){

const features=[
"Website Development",
"Mobile Application",
"Artificial Intelligence",
"Enterprise System",
"Cloud Infrastructure"
]


return(

<section

style={{

padding:"90px 24px",

background:
"linear-gradient(135deg,#FFE8E8,#FFFFFF)"

}}

>


<div

style={{

maxWidth:"1200px",

margin:"auto",

display:"grid",

gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",

gap:"60px",

alignItems:"center"

}}

>


<motion.div

initial={{
opacity:0,
x:-40
}}

animate={{
opacity:1,
x:0
}}

transition={{
duration:.8
}}

>


<div

style={{

display:"inline-block",

background:"#E63946",

color:"#FFFFFF",

padding:"8px 18px",

borderRadius:"30px",

fontFamily:"Poppins",

fontSize:"14px"

}}

>

Software House & Digital Agency

</div>



<h1

style={{

fontFamily:"Poppins",

fontSize:"52px",

lineHeight:"1.15",

color:"#1F2937",

marginTop:"25px"

}}

>

Transformasi Digital
<br/>
Untuk Indonesia Maju

</h1>



<p

style={{

fontFamily:"Inter",

color:"#374151",

fontSize:"18px",

lineHeight:"1.8"

}}

>

StudioIT membantu perusahaan, UMKM, startup,
dan organisasi membangun solusi teknologi modern
melalui software development, AI, cloud,
dan sistem digital terintegrasi.

</p>



<div>

{
features.map(feature=>(

<div

key={feature}

style={{

display:"flex",

gap:"10px",

alignItems:"center",

marginTop:"12px"

}}

>

<CheckCircle
size={18}
color="#E63946"
/>

<span>
{feature}
</span>


</div>

))

}

</div>



<a

href="mailto:alma.budsteddy88@gmail.com"

style={{
textDecoration:"none"
}}

>


<button

style={{

marginTop:"35px",

background:"#E63946",

color:"#FFFFFF",

border:"none",

padding:"15px 35px",

borderRadius:"12px",

fontFamily:"Poppins",

fontSize:"16px",

cursor:"pointer"

}}

>

Konsultasi Project

</button>


</a>


</motion.div>



<motion.div

initial={{
opacity:0,
x:40
}}

animate={{
opacity:1,
x:0
}}

transition={{
duration:.8
}}

>

<HeroVisual/>

</motion.div>


</div>


</section>

)

}

HERO


echo "[4/9] Build..."

npm run build


echo "[5/9] Git Add..."

git add .


echo "[6/9] Commit..."

git commit -m "PART 008B.3 Hero Premium Redesign" || true


echo "[7/9] Push..."

git push origin main || true


echo "[8/9] Firebase Deploy..."

firebase deploy --only hosting


echo "[9/9] Complete"

echo "=============================================="
echo " PART 008B.3 COMPLETE"
echo " Backup:"
echo " backup/part-008b3-$STAMP"
echo "=============================================="

