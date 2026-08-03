#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT PART 008B.4"
echo " Landing Content Premium UI"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/10] Backup..."

mkdir -p backup/part-008b4-$STAMP

cp -R src/pages/Landing backup/part-008b4-$STAMP/


echo "[2/10] Create Premium Section Helper..."

mkdir -p src/pages/Landing/components


echo "[3/10] Update About..."

cat <<'ABOUT' > src/pages/Landing/components/About.tsx

import { motion } from "framer-motion";
import { Building2 } from "lucide-react";


export default function About(){

return(

<section style={{padding:"80px 24px"}}>

<motion.div
initial={{opacity:0,y:30}}
whileInView={{opacity:1,y:0}}
transition={{duration:.6}}
style={{
maxWidth:"1000px",
margin:"auto",
textAlign:"center"
}}
>

<Building2
size={45}
color="#E63946"
/>


<h2>
Membangun Masa Depan Digital Bersama Teknologi Modern
</h2>


<p>
StudioIT adalah Software House dan Digital Agency yang membantu perusahaan,
UMKM, startup, dan organisasi melakukan transformasi digital melalui solusi
teknologi inovatif, scalable, dan sesuai kebutuhan bisnis.
</p>


</motion.div>

</section>

)

}

ABOUT


echo "[4/10] Update Services..."

cat <<'SERVICE' > src/pages/Landing/components/ServicesPreview.tsx

import {
Code2,
Smartphone,
BrainCircuit,
Cloud
} from "lucide-react";


export default function ServicesPreview(){

const services=[
["Website Development",Code2],
["Mobile Application",Smartphone],
["Artificial Intelligence",BrainCircuit],
["Cloud Solution",Cloud]
]


return(

<section style={{padding:"80px 24px"}}>


<h2 style={{textAlign:"center"}}>
Solusi Teknologi Lengkap Untuk Bisnis
</h2>


<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(220px,1fr))",
gap:"24px",
marginTop:"40px"
}}
>


{
services.map(([title,Icon]:any)=>(

<div
key={title}
style={{
background:"#FFFFFF",
padding:"30px",
borderRadius:"18px",
boxShadow:"0 10px 30px rgba(0,0,0,.08)"
}}
>

<Icon
color="#E63946"
size={35}
/>

<h3>
{title}
</h3>

<p>
Solusi digital modern yang siap berkembang.
</p>

</div>

))

}

</div>


</section>

)

}

SERVICE


echo "[5/10] Update Why Choose..."

cat <<'WHY' > src/pages/Landing/components/WhyChooseUs.tsx

export default function WhyChooseUs(){

const items=[
"Tim profesional berpengalaman",
"Teknologi modern dan terpercaya",
"Solusi scalable sesuai bisnis",
"Dukungan jangka panjang"
]


return(

<section style={{padding:"80px 24px"}}>

<h2>
Mengapa Memilih StudioIT?
</h2>


<ul>

{
items.map(x=>
<li key={x}>{x}</li>
)
}

</ul>


</section>

)

}

WHY


echo "[6/10] Update Process..."

cat <<'PROCESS' > src/pages/Landing/components/Process.tsx

export default function Process(){

const steps=[
"Consultation",
"Planning",
"Development",
"Launch"
]


return(

<section style={{padding:"80px 24px"}}>

<h2>
Proses Pengembangan
</h2>


<div
style={{
display:"grid",
gridTemplateColumns:"repeat(4,1fr)",
gap:"20px"
}}
>

{
steps.map((s,i)=>(

<div
key={s}
style={{
background:"#FFFFFF",
padding:"25px",
borderRadius:"15px"
}}
>

<h3>
0{i+1}
</h3>

<p>{s}</p>

</div>

))
}

</div>

</section>

)

}

PROCESS


echo "[7/10] Update CTA..."

cat <<'CTA' > src/pages/Landing/components/CTA.tsx

export default function CTA(){

return(

<section
style={{
padding:"80px 24px",
background:"#E63946",
color:"#FFFFFF",
textAlign:"center"
}}
>

<h2>
Siap Melakukan Transformasi Digital?
</h2>

<p>
Bangun solusi teknologi bersama StudioIT.
</p>


<a
href="mailto:alma.budsteddy88@gmail.com"
>

<button
style={{
padding:"14px 30px",
borderRadius:"12px",
border:"none"
}}
>
Konsultasi Project
</button>

</a>


</section>

)

}

CTA


echo "[8/10] Build..."

npm run build


echo "[9/10] Git..."

git add .

git commit -m "PART 008B.4 Premium Landing Content" || true

git push origin main || true


echo "[10/10] Firebase..."

firebase deploy --only hosting


echo "=============================================="
echo " PART 008B.4 COMPLETE"
echo " Backup:"
echo " backup/part-008b4-$STAMP"
echo "=============================================="

