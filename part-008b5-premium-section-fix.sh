#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT PART 008B.5"
echo " Premium Section Components Fix"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/8] Backup..."

mkdir -p backup/part-008b5-$STAMP

cp src/pages/Landing/components/ServicesPreview.tsx \
backup/part-008b5-$STAMP/

cp src/pages/Landing/components/WhyChooseUs.tsx \
backup/part-008b5-$STAMP/


echo "[2/8] Update Services Premium..."


cat <<'SERVICE' > src/pages/Landing/components/ServicesPreview.tsx

import { motion } from "framer-motion";

import {
Code2,
Smartphone,
BrainCircuit,
Cloud
} from "lucide-react";


export default function ServicesPreview(){

const services=[

{
title:"Website Development",
desc:"Website profesional dan aplikasi web modern untuk kebutuhan bisnis.",
icon:Code2
},

{
title:"Mobile Application",
desc:"Aplikasi mobile Android dan iOS dengan pengalaman pengguna terbaik.",
icon:Smartphone
},

{
title:"Artificial Intelligence",
desc:"Solusi AI untuk membantu otomatisasi dan pengambilan keputusan bisnis.",
icon:BrainCircuit
},

{
title:"Cloud Solution",
desc:"Infrastruktur cloud yang aman, cepat, dan scalable.",
icon:Cloud
}

]


return(

<section
style={{
padding:"90px 24px"
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
fontFamily:"Poppins"
}}
>
Layanan StudioIT
</h2>


<p
style={{
color:"#374151"
}}
>
Solusi teknologi lengkap untuk mendukung pertumbuhan bisnis digital.
</p>


</div>



<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(250px,1fr))",
gap:"28px"
}}
>


{
services.map((service,index)=>{

const Icon=service.icon;


return(

<motion.div

key={service.title}

initial={{
opacity:0,
y:30
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.1
}}

whileHover={{
y:-8
}}

style={{
background:"#FFFFFF",
padding:"32px",
borderRadius:"20px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)"
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

marginBottom:"20px"

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
{service.title}
</h3>


<p
style={{
color:"#374151",
lineHeight:"1.7"
}}
>
{service.desc}
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

SERVICE



echo "[3/8] Update Why Choose StudioIT..."


cat <<'WHY' > src/pages/Landing/components/WhyChooseUs.tsx

import {motion} from "framer-motion";

import {
Users,
Settings,
Rocket,
ShieldCheck
} from "lucide-react";


export default function WhyChooseUs(){


const items=[

{
title:"Tim Profesional",
desc:"Developer dan designer berpengalaman yang memahami kebutuhan bisnis.",
icon:Users
},

{
title:"Teknologi Modern",
desc:"Menggunakan teknologi terbaru untuk solusi digital berkualitas.",
icon:Settings
},

{
title:"Solusi Scalable",
desc:"Sistem dirancang agar dapat berkembang mengikuti bisnis.",
icon:Rocket
},

{
title:"Dukungan Berkelanjutan",
desc:"Maintenance dan support setelah project selesai.",
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
fontFamily:"Poppins"
}}
>
Mengapa Memilih StudioIT?
</h2>


<p>
Partner teknologi untuk membangun solusi digital masa depan.
</p>


</div>



<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(250px,1fr))",
gap:"28px"
}}
>


{
items.map((item,index)=>{

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
delay:index*.1
}}

whileHover={{
y:-8
}}

style={{

background:"#FFFFFF",

padding:"32px",

borderRadius:"20px",

boxShadow:"0 15px 35px rgba(0,0,0,.08)"

}}

>


<div

style={{

width:"64px",

height:"64px",

borderRadius:"18px",

background:"#E63946",

display:"flex",

alignItems:"center",

justifyContent:"center"

}}

>

<Icon
size={32}
color="#FFFFFF"
/>


</div>


<h3
style={{
fontFamily:"Poppins",
marginTop:"20px"
}}
>
{item.title}
</h3>


<p
style={{
color:"#374151",
lineHeight:"1.7"
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

WHY



echo "[4/8] Build Validation..."

npm run build


echo "[5/8] Git Add..."

git add .


echo "[6/8] Commit..."

git commit -m "PART 008B.5 Premium section components" || true


echo "[7/8] Push..."

git push origin main || true


echo "[8/8] Firebase Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " PART 008B.5 COMPLETE"
echo " Backup:"
echo " backup/part-008b5-$STAMP"
echo "=============================================="

