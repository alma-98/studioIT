
import { motion } from "framer-motion";
import { Code2 } from "lucide-react";


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

initial={{
opacity:0,
y:30
}}

animate={{
opacity:1,
y:0
}}

transition={{
duration:.8
}}

>


<div
style={{
display:"inline-block",
background:"#FFFFFF",
color:"#E63946",
padding:"8px 18px",
borderRadius:"30px",
fontFamily:"Poppins",
fontSize:"14px",
marginBottom:"20px"
}}
>

Software House & Digital Agency

</div>



<Code2
size={60}
color="#E63946"
/>



<h1

style={{
fontFamily:"Poppins",
fontSize:"48px",
color:"#1F2937",
lineHeight:"1.2"
}}

>

Transformasi Digital Untuk Indonesia Maju

</h1>



<p

style={{
fontFamily:"Inter",
maxWidth:"850px",
margin:"24px auto",
color:"#374151",
lineHeight:"1.8"
}}

>

StudioIT adalah Software House dan Digital Agency yang menyediakan solusi teknologi modern untuk membantu perusahaan, UMKM, startup, instansi pemerintah, sekolah, universitas, rumah sakit, developer, dan individu melakukan transformasi digital.

<br/><br/>

Kami membangun Website Development, Mobile Application, Sistem Informasi, ERP, CRM, POS, HRIS, Artificial Intelligence (AI), Cloud Solution, API Integration, Maintenance, hingga konsultasi teknologi sesuai kebutuhan bisnis.

<br/><br/>

Dengan teknologi modern dan pendekatan scalable, StudioIT membantu menciptakan solusi digital yang cepat, aman, dan siap berkembang.

</p>



<div
style={{
display:"flex",
justifyContent:"center",
gap:"15px",
flexWrap:"wrap",
marginTop:"30px"
}}
>

<span>Website Development</span>

<span>Mobile Apps</span>

<span>AI Solution</span>

<span>Cloud System</span>


</div>



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

padding:"14px 32px",

borderRadius:"12px",

cursor:"pointer",

marginTop:"35px",

fontFamily:"Poppins",

fontSize:"16px"

}}

>

Konsultasi Project

</button>


</a>



</motion.div>


</section>


)

}

