
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

