
import { motion } from "framer-motion";


export default function About(){

return(

<section
style={{
padding:"100px 24px",
background:"#FFFFFF"
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

style={{
maxWidth:"900px",
margin:"auto",
textAlign:"center"
}}

>


<h2
style={{
fontFamily:"Poppins",
fontSize:"32px",
color:"#1F2937",
marginBottom:"25px"
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
color:"#374151"
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
marginTop:"20px"
}}
>

Kami membangun solusi digital modern mulai dari
Website Development, Mobile Application, AI,
Cloud Solution, hingga Sistem Informasi Bisnis
yang siap berkembang mengikuti kebutuhan Anda.

</p>


</motion.div>


</section>

)

}

