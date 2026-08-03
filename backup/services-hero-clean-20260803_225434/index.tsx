
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
desc:"Menciptakan desain digital modern yang mudah digunakan.",
icon:Palette
},

{
title:"Enterprise System",
desc:"Membangun ERP, CRM, HRIS, POS, dan sistem informasi bisnis.",
icon:Building2
},

{
title:"Artificial Intelligence",
desc:"Mengembangkan AI, automation, analytics, dan intelligent system.",
icon:BrainCircuit
},

{
title:"Cloud Solution",
desc:"Membangun infrastruktur cloud yang aman dan scalable.",
icon:Cloud
},

{
title:"API Integration",
desc:"Menghubungkan berbagai sistem melalui API.",
icon:Link
},

{
title:"Maintenance & Support",
desc:"Monitoring, update, dan pengembangan fitur lanjutan.",
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
maxWidth:"1200px",
margin:"auto",
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",
gap:"50px",
alignItems:"center"
}}

>


<div
style={{
textAlign:"left"
}}
>


<h1

style={{
fontFamily:"Poppins",
fontSize:"36px",
color:"#1F2937"
}}

>

Software House
<br/>
&amp; Digital Agency

</h1>


<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"justify"
}}

>

StudioIT adalah Software House dan Digital Agency yang membantu
perusahaan, UMKM, startup, dan organisasi membangun solusi
teknologi modern melalui pengembangan website, aplikasi mobile,
sistem enterprise, Artificial Intelligence (AI), cloud solution,
dan integrasi digital.

</p>


</div>



<div

style={{
textAlign:"right"
}}

>


<h2

style={{
fontFamily:"Poppins",
fontSize:"30px",
color:"#1F2937"
}}

>

Partner Teknologi Untuk
<br/>
Transformasi Digital

</h2>


<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"justify"
}}

>

StudioIT membantu bisnis menciptakan solusi digital modern
yang aman, scalable, dan siap berkembang mengikuti kebutuhan
bisnis masa depan.

</p>


<a

href="mailto:alma.budsteddy88@gmail.com"

>

<button

style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"14px 28px",
borderRadius:"14px",
cursor:"pointer"
}}

>

Konsultasi Project

</button>


</a>


</div>


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
textAlign:"center"
}}

>

Layanan StudioIT

</h2>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(260px,1fr))",
gap:"28px",
marginTop:"40px"
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
y:20
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
padding:"30px",
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
justifyContent:"center",
alignItems:"center",
margin:"auto"
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


</div>

)

}

