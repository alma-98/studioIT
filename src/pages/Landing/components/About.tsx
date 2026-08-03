
import { motion } from "framer-motion";
import {
Code2,
BrainCircuit,
Cloud
} from "lucide-react";


export default function About(){

const features=[

{
title:"Software Solution",
desc:"Membangun aplikasi digital modern untuk kebutuhan bisnis.",
icon:Code2
},

{
title:"AI Innovation",
desc:"Menggunakan teknologi AI untuk meningkatkan efisiensi.",
icon:BrainCircuit
},

{
title:"Cloud Technology",
desc:"Solusi cloud yang aman dan scalable.",
icon:Cloud
}

]


return(

<section
style={{
padding:"100px 24px",
background:"#FFFFFF"
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

transition={{
duration:.6
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
margin:"0 auto 25px"
}}

>

<Code2
size={32}
color="#E63946"
/>

</div>



<h2

style={{

fontFamily:"Poppins",

fontSize:"32px",

color:"#1F2937"

}}

>

Membangun Masa Depan Digital
Bersama Teknologi Modern

</h2>



<p

style={{

fontFamily:"Inter",

fontSize:"17px",

lineHeight:"1.8",

color:"#374151",

maxWidth:"850px",

margin:"25px auto"

}}

>

StudioIT adalah Software House dan Digital Agency
yang membantu perusahaan, UMKM, startup, dan organisasi
melakukan transformasi digital melalui solusi teknologi
inovatif, scalable, dan sesuai kebutuhan bisnis.

</p>


<p

style={{

fontFamily:"Inter",

fontSize:"17px",

lineHeight:"1.8",

color:"#374151",

maxWidth:"850px",

margin:"0 auto 50px"

}}

>

Kami membangun solusi digital modern mulai dari
Website Development, Mobile Application, AI,
Cloud Solution, hingga Sistem Informasi Bisnis
yang siap berkembang mengikuti kebutuhan Anda.

</p>



<div

style={{

display:"grid",

gridTemplateColumns:"repeat(auto-fit,minmax(240px,1fr))",

gap:"24px"

}}

>


{
features.map((item)=>{

const Icon=item.icon;


return(

<motion.div

key={item.title}

whileHover={{
y:-8
}}

style={{

background:"#FFFFFF",

padding:"30px",

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


</motion.div>


</div>


</section>

)

}

