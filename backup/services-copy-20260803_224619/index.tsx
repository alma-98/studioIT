
import { motion } from "framer-motion";

import {
Code2,
Smartphone,
Palette,
Building2,
BrainCircuit,
Cloud,
Link,
Settings
} from "lucide-react";


export default function Services(){


const services=[

{
title:"Website Development",
desc:"Membangun website profesional, cepat, responsive, dan scalable untuk kebutuhan bisnis.",
icon:Code2
},

{
title:"Mobile Application",
desc:"Mengembangkan aplikasi Android dan iOS dengan pengalaman pengguna modern.",
icon:Smartphone
},

{
title:"UI/UX Design",
desc:"Menciptakan desain digital yang modern, mudah digunakan, dan sesuai kebutuhan pengguna.",
icon:Palette
},

{
title:"Enterprise System",
desc:"Membangun ERP, CRM, HRIS, POS, dan sistem informasi bisnis.",
icon:Building2
},

{
title:"Artificial Intelligence",
desc:"Mengembangkan solusi AI, automation, analytics, dan intelligent system.",
icon:BrainCircuit
},

{
title:"Cloud Solution",
desc:"Membangun infrastruktur cloud yang aman, stabil, dan scalable.",
icon:Cloud
},

{
title:"API Integration",
desc:"Menghubungkan berbagai sistem melalui API dan integrasi digital.",
icon:Link
},

{
title:"Maintenance & Support",
desc:"Menjaga performa sistem melalui monitoring, update, dan pengembangan fitur.",
icon:Settings
}

]


return(

<div>


<section
style={{
padding:"100px 24px",
background:"#FFE8E8"
}}
>

<div
style={{
maxWidth:"1100px",
margin:"auto",
textAlign:"center"
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

>


<h1

style={{
fontFamily:"Poppins",
fontSize:"42px",
color:"#1F2937"
}}

>

Solusi Teknologi Digital
Untuk Bisnis Modern

</h1>


<p

style={{
fontFamily:"Inter",
fontSize:"17px",
lineHeight:"1.8",
maxWidth:"850px",
margin:"25px auto",
color:"#374151"
}}

>

StudioIT menyediakan layanan pengembangan teknologi
mulai dari website, aplikasi mobile, sistem enterprise,
AI, cloud, hingga integrasi digital untuk membantu bisnis
melakukan transformasi digital.

</p>


</motion.div>


</div>

</section>



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


<h2

style={{
fontFamily:"Poppins",
fontSize:"30px",
textAlign:"center",
marginBottom:"50px"
}}

>

Layanan StudioIT

</h2>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(260px,1fr))",
gap:"28px"
}}

>


{
services.map((item,index)=>{

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
borderRadius:"22px",
textAlign:"center",
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
fontFamily:"Poppins",
fontSize:"18px"
}}

>

{item.title}

</h3>



<p

style={{
fontFamily:"Inter",
fontSize:"14px",
lineHeight:"1.7",
color:"#374151"
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



<section

style={{
padding:"80px 24px",
background:"#FFE8E8",
textAlign:"center"
}}

>


<h2

style={{
fontFamily:"Poppins",
fontSize:"28px"
}}

>

Siap Membangun Solusi Digital?

</h2>


<p

style={{
color:"#374151",
margin:"20px"
}}

>

Konsultasikan kebutuhan project Anda bersama StudioIT.

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
padding:"14px 30px",
borderRadius:"14px",
fontFamily:"Poppins",
cursor:"pointer"
}}

>

Konsultasi Project

</button>


</a>


</section>


</div>

)

}

