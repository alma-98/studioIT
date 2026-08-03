#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FIX PROCESS DEVELOPMENT"
echo " Premium Workflow Section"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/6] Backup..."

mkdir -p backup/process-$STAMP

cp src/pages/Landing/components/Process.tsx \
backup/process-$STAMP/ 2>/dev/null || true


echo "[2/6] Update Process Component..."


cat <<'PROCESS' > src/pages/Landing/components/Process.tsx

import { motion } from "framer-motion";


export default function Process(){

const steps=[

{
number:"01",
title:"Consultation",
desc:"Memahami kebutuhan bisnis, tujuan project, dan solusi teknologi yang paling sesuai."
},

{
number:"02",
title:"Planning",
desc:"Menyusun strategi project, UI/UX, arsitektur sistem, dan timeline pengembangan."
},

{
number:"03",
title:"Development",
desc:"Membangun solusi digital melalui proses coding, integrasi fitur, dan pengujian sistem."
},

{
number:"04",
title:"Launch",
desc:"Melakukan deployment, optimasi, dan memastikan solusi siap digunakan."
}

]


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


<div
style={{
textAlign:"center",
marginBottom:"45px"
}}
>

<h2
style={{
fontFamily:"Poppins",
fontSize:"28px",
color:"#1F2937"
}}
>
Proses Pengembangan
</h2>


<p
style={{
fontFamily:"Inter",
color:"#374151",
maxWidth:"750px",
margin:"15px auto",
lineHeight:"1.7"
}}
>
Metode kerja terstruktur StudioIT dalam membangun solusi digital
mulai dari konsultasi hingga produk siap digunakan.
</p>


</div>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(240px,1fr))",
gap:"25px"
}}

>


{
steps.map((step,index)=>(

<motion.div

key={step.number}

initial={{
opacity:0,
y:25
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.1
}}

whileHover={{
y:-6
}}

style={{
background:"#FFE8E8",
padding:"32px",
borderRadius:"20px",
textAlign:"center"
}}

>


<div

style={{
fontFamily:"Poppins",
fontSize:"36px",
fontWeight:700,
color:"#E63946"
}}

>

{step.number}

</div>



<h3

style={{
fontFamily:"Poppins",
fontSize:"18px",
marginTop:"15px",
color:"#1F2937"
}}

>

{step.title}

</h3>



<p

style={{
fontFamily:"Inter",
fontSize:"14px",
lineHeight:"1.7",
color:"#374151"
}}

>

{step.desc}

</p>


</motion.div>

))

}


</div>


</div>


</section>

)

}

PROCESS


echo "[3/6] Build..."

npm run build


echo "[4/6] Commit..."

git add src/pages/Landing/components/Process.tsx

git commit -m "Fix Process Development premium workflow section" || true


echo "[5/6] Push..."

git push origin main || true


echo "[6/6] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " PROCESS DEVELOPMENT COMPLETE"
echo " Backup:"
echo " backup/process-$STAMP"
echo "=============================================="

