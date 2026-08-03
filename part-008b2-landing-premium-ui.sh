#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT PART 008B.2"
echo " Landing Page Premium UI Enhancement"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/12] Backup..."

mkdir -p backup/part-008b2-$STAMP

cp -R src backup/part-008b2-$STAMP/src


echo "[2/12] Install UI Dependencies..."

npm install framer-motion lucide-react


echo "[3/12] Create Landing Components..."

mkdir -p src/pages/Landing/components


echo "[4/12] Create Premium Hero..."

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
color:"#374151"
}}
>
StudioIT menghadirkan solusi teknologi modern:
Website, Mobile Apps, AI, Cloud Solution,
dan Sistem Digital Bisnis.
</p>


<div>

<button
style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"14px 28px",
borderRadius:"12px",
cursor:"pointer"
}}
>
Mulai Project
<ArrowRight size={18}/>
</button>


</div>


</motion.div>

</section>

)

}

HERO



echo "[5/12] Create Premium Card Style..."


cat <<'CARD' > src/pages/Landing/components/Statistics.tsx

export default function Statistics(){

const data=[
["100+","Project"],
["50+","Client"],
["10+","Technology"],
["24/7","Support"]
]


return(

<section
style={{
padding:"60px 24px"
}}
>

<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(180px,1fr))",
gap:"20px"
}}
>


{
data.map(item=>(

<div
key={item[1]}
style={{
background:"#FFFFFF",
padding:"30px",
borderRadius:"16px",
textAlign:"center",
boxShadow:"0 10px 25px rgba(0,0,0,.08)"
}}
>

<h2
style={{
color:"#E63946"
}}
>
{item[0]}
</h2>

<p>
{item[1]}
</p>

</div>

))
}


</div>

</section>

)

}

CARD



echo "[6/12] Create Process Section..."


cat <<'PROCESS' > src/pages/Landing/components/Process.tsx


export default function Process(){

const steps=[
"Consultation",
"Planning",
"Development",
"Launch"
]


return(

<section
style={{
padding:"80px 24px",
textAlign:"center"
}}
>

<h2>
Proses Pengembangan
</h2>


<div>

{
steps.map((step,index)=>(

<div
key={step}
style={{
margin:"15px"
}}
>

<strong>
0{index+1}
</strong>

{" "}
{step}

</div>

))
}

</div>


</section>

)

}

PROCESS



echo "[7/12] Update Landing Page..."


cat <<'PAGE' > src/pages/Landing/LandingPage.tsx

import Hero from "./components/Hero";
import Statistics from "./components/Statistics";
import About from "./components/About";
import ServicesPreview from "./components/ServicesPreview";
import WhyChooseUs from "./components/WhyChooseUs";
import PortfolioPreview from "./components/PortfolioPreview";
import Technology from "./components/Technology";
import Process from "./components/Process";
import Testimonial from "./components/Testimonial";
import FAQ from "./components/FAQ";
import CTA from "./components/CTA";


export default function LandingPage(){

return(

<>

<Hero/>

<Statistics/>

<About/>

<ServicesPreview/>

<WhyChooseUs/>

<PortfolioPreview/>

<Technology/>

<Process/>

<Testimonial/>

<FAQ/>

<CTA/>

</>

)

}

PAGE



echo "[8/12] Update CSS Foundation..."

cat <<'CSS' >> src/styles/global.css

body{
margin:0;
font-family:Inter,Arial,sans-serif;
}

button{
font-family:Poppins,Arial,sans-serif;
}

h1,h2,h3{
font-family:Poppins,Arial,sans-serif;
}

CSS



echo "[9/12] Build Validation..."

npm run build


echo "[10/12] Git Commit..."

git add .

git commit -m "PART 008B.2 Landing Premium UI Enhancement" || true


echo "[11/12] Push..."

git push origin main || true


echo "[12/12] Firebase Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " PART 008B.2 COMPLETE"
echo " Backup:"
echo " backup/part-008b2-$STAMP"
echo "=============================================="

