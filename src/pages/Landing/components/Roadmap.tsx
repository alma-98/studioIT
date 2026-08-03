
import { motion } from "framer-motion";

import {
Search,
LayoutDashboard,
Code2,
Rocket,
Settings
} from "lucide-react";


export default function Roadmap(){

const steps=[

{
number:"01",
title:"Discovery",
desc:"Memahami kebutuhan bisnis, tujuan project, dan solusi teknologi yang tepat.",
icon:Search
},

{
number:"02",
title:"Planning",
desc:"Menyusun strategi, UI/UX, arsitektur sistem, dan roadmap pengembangan.",
icon:LayoutDashboard
},

{
number:"03",
title:"Development",
desc:"Membangun aplikasi, integrasi fitur, database, dan pengujian sistem.",
icon:Code2
},

{
number:"04",
title:"Launch",
desc:"Deployment, optimasi, dan memastikan solusi siap digunakan.",
icon:Rocket
},

{
number:"05",
title:"Support",
desc:"Maintenance, monitoring, dan pengembangan fitur lanjutan.",
icon:Settings
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

Roadmap Pengembangan

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

Tahapan terstruktur StudioIT dalam membangun solusi digital
mulai dari konsep hingga implementasi.

</p>


</div>



<div

style={{

display:"grid",

gridTemplateColumns:"repeat(auto-fit,minmax(210px,1fr))",

gap:"22px"

}}

>


{

steps.map((step,index)=>{

const Icon=step.icon;


return(

<motion.div

key={step.title}

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

padding:"28px 22px",

borderRadius:"20px",

textAlign:"center"

}}

>



<div

style={{

fontFamily:"Poppins",

color:"#E63946",

fontSize:"14px",

marginBottom:"15px"

}}

>

{step.number}

</div>



<div

style={{

width:"56px",

height:"56px",

borderRadius:"18px",

background:"#FFFFFF",

display:"flex",

alignItems:"center",

justifyContent:"center",

margin:"0 auto 18px"

}}

>

<Icon

size={26}

color="#E63946"

/>

</div>



<h3

style={{

fontFamily:"Poppins",

fontSize:"18px"

}}

>

{step.title}

</h3>



<p

style={{

fontFamily:"Inter",

fontSize:"14px",

color:"#374151",

lineHeight:"1.6"

}}

>

{step.desc}

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

