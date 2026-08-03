
import { motion } from "framer-motion";
import { CheckCircle } from "lucide-react";

import HeroVisual from "./HeroVisual";


export default function Hero(){

const features=[
"Website Development",
"Mobile Application",
"Artificial Intelligence",
"Enterprise System",
"Cloud Infrastructure"
]


return(

<section

style={{

padding:"90px 24px",

background:
"linear-gradient(135deg,#FFE8E8,#FFFFFF)"

}}

>


<div

style={{

maxWidth:"1200px",

margin:"auto",

display:"grid",

gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",

gap:"60px",

alignItems:"center"

}}

>


<motion.div

initial={{
opacity:0,
x:-40
}}

animate={{
opacity:1,
x:0
}}

transition={{
duration:.8
}}

>


<div

style={{

display:"inline-block",

background:"#E63946",

color:"#FFFFFF",

padding:"8px 18px",

borderRadius:"30px",

fontFamily:"Poppins",

fontSize:"14px"

}}

>

Software House & Digital Agency

</div>



<h1

style={{

fontFamily:"Poppins",

fontSize:"42px",

lineHeight:"1.25",

color:"#1F2937",

marginTop:"25px"

}}

>

Transformasi Digital
<br/>
Untuk Indonesia Maju

</h1>



<p

style={{

fontFamily:"Inter",

color:"#374151",

fontSize:"18px",

lineHeight:"1.8"

}}

>

StudioIT membantu perusahaan, UMKM, startup,
dan organisasi membangun solusi teknologi modern
melalui software development, AI, cloud,
dan sistem digital terintegrasi.

</p>



<div>

{
features.map(feature=>(

<div

key={feature}

style={{

display:"flex",

gap:"10px",

alignItems:"center",

marginTop:"12px"

}}

>

<CheckCircle
size={18}
color="#E63946"
/>

<span>
{feature}
</span>


</div>

))

}

</div>



<a

href="mailto:alma.budsteddy88@gmail.com"

style={{
textDecoration:"none"
}}

>


<button

style={{

marginTop:"35px",

background:"#E63946",

color:"#FFFFFF",

border:"none",

padding:"15px 35px",

borderRadius:"12px",

fontFamily:"Poppins",

fontSize:"16px",

cursor:"pointer"

}}

>

Konsultasi Project

</button>


</a>


</motion.div>



<motion.div

initial={{
opacity:0,
x:40
}}

animate={{
opacity:1,
x:0
}}

transition={{
duration:.8
}}

>

<HeroVisual/>

</motion.div>


</div>


</section>

)

}

