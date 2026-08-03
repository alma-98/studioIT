
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

