#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT PART 008B.7"
echo " Technology Stack Premium"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/7] Backup..."

mkdir -p backup/part-008b7-$STAMP

cp src/pages/Landing/components/Technology.tsx \
backup/part-008b7-$STAMP/ 2>/dev/null || true


echo "[2/7] Create Technology Component..."

mkdir -p src/pages/Landing/components


cat <<'TECH' > src/pages/Landing/components/Technology.tsx

import { motion } from "framer-motion";

import {
Code2,
FileCode2,
Flame,
BrainCircuit,
Cloud,
Link,
Database,
ShieldCheck
} from "lucide-react";


export default function Technology(){

const technologies=[

{
title:"React",
desc:"Modern Frontend Development",
icon:Code2
},

{
title:"TypeScript",
desc:"Clean and Reliable Code",
icon:FileCode2
},

{
title:"Firebase",
desc:"Cloud Backend & Database",
icon:Flame
},

{
title:"Artificial Intelligence",
desc:"Smart Digital Solution",
icon:BrainCircuit
},

{
title:"Cloud Platform",
desc:"Scalable Infrastructure",
icon:Cloud
},

{
title:"API Integration",
desc:"Connected Digital Ecosystem",
icon:Link
},

{
title:"Database System",
desc:"Secure Data Management",
icon:Database
},

{
title:"Security System",
desc:"Protected Application",
icon:ShieldCheck
}

]


return(

<section
style={{
padding:"90px 24px",
background:"#FFE8E8"
}}
>


<div
style={{
maxWidth:"1200px",
margin:"auto"
}}
>


<div
style={{
textAlign:"center",
marginBottom:"50px"
}}
>


<h2
style={{
fontFamily:"Poppins",
fontSize:"30px",
color:"#1F2937"
}}
>

Teknologi Kami

</h2>


<h3
style={{
fontFamily:"Poppins",
fontSize:"24px",
color:"#374151"
}}
>

Membangun Solusi Digital Dengan Teknologi Modern

</h3>


<p
style={{
maxWidth:"800px",
margin:"20px auto",
color:"#374151",
lineHeight:"1.8"
}}
>

StudioIT menggunakan teknologi modern untuk membangun
aplikasi yang cepat, aman, scalable, dan siap berkembang
mengikuti kebutuhan bisnis.

</p>


</div>



<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(240px,1fr))",
gap:"28px"
}}
>


{
technologies.map((item,index)=>{

const Icon=item.icon;


return(

<motion.div

key={item.title}

initial={{
opacity:0,
y:30
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.08
}}

whileHover={{
y:-8
}}

style={{
background:"#FFFFFF",
padding:"32px",
borderRadius:"20px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)",
textAlign:"center"
}}

>


<div

style={{
width:"64px",
height:"64px",
borderRadius:"18px",
background:"#FFE8E8",
display:"flex",
alignItems:"center",
justifyContent:"center",
margin:"0 auto 20px"
}}

>

<Icon
size={32}
color="#E63946"
/>

</div>



<h3

style={{
fontFamily:"Poppins"
}}

>

{item.title}

</h3>



<p

style={{
color:"#374151",
lineHeight:"1.6"
}}

>

{item.desc}

</p>


</motion.div>

)

})

}


</div>


</div>


</section>

)

}

TECH


echo "[3/7] Integrate Landing..."

python3 <<'PY'
from pathlib import Path

p=Path("src/pages/Landing/LandingPage.tsx")

text=p.read_text()

if "Technology" not in text:
    text=text.replace(
        'import PortfolioPreview from "./components/PortfolioPreview";',
        'import PortfolioPreview from "./components/PortfolioPreview";\nimport Technology from "./components/Technology";'
    )

    text=text.replace(
        '<PortfolioPreview/>',
        '<PortfolioPreview/>\n<Technology/>'
    )

p.write_text(text)

print("Technology integrated")
PY


echo "[4/7] Build..."

npm run build


echo "[5/7] Commit..."

git add .

git commit -m "PART 008B.7 Technology Stack Premium Section" || true


echo "[6/7] Push..."

git push origin main || true


echo "[7/7] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " PART 008B.7 COMPLETE"
echo " Backup:"
echo " backup/part-008b7-$STAMP"
echo "=============================================="

