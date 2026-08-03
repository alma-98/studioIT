
import { motion } from "framer-motion";
import { ArrowRight, Code2 } from "lucide-react";


export default function Hero(){

return (

<section
style={{
padding:"100px 24px",
background:"#FFE8E8",
textAlign:"center"
}}
>

<motion.div
initial={{opacity:0,y:30}}
animate={{opacity:1,y:0}}
transition={{duration:.8}}
>

<Code2
size={60}
color="#E63946"
/>


<h1
style={{
fontFamily:"Poppins",
fontSize:"48px",
color:"#1F2937"
}}
>
Transformasi Digital Untuk Indonesia Maju
</h1>


<p
style={{
fontFamily:"Inter",
maxWidth:"700px",
margin:"20px auto",
color:"#374151"
}}
>
StudioIT menghadirkan solusi teknologi modern:
Website, Mobile Apps, AI, Cloud Solution,
dan Sistem Digital Bisnis.
</p>


<div>

<a href="mailto:alma.budsteddy88@gmail.com" style={{textDecoration:"none"}}>\n<button
style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"14px 28px",
borderRadius:"12px",
cursor:"pointer"
}}
>
Konsultasi Project
<ArrowRight size={18}/>
</button>\n</a>


</div>


</motion.div>

</section>

)

}

