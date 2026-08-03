
import { motion } from "framer-motion";


export default function Services(){

const services=[

"Website Development",
"Mobile Application",
"Artificial Intelligence",
"Enterprise System",
"Cloud Infrastructure"

];


return (

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
gap:"60px",
alignItems:"center"
}}

>


<div>

<p

style={{
fontFamily:"Poppins",
fontWeight:600,
color:"#E63946"
}}

>

Software House & Digital Agency

</p>


<h1

style={{
fontFamily:"Poppins",
fontSize:"42px",
lineHeight:"1.2",
color:"#1F2937"
}}

>

Transformasi Digital
<br/>
Untuk Indonesia Maju

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

StudioIT membantu perusahaan, UMKM, startup, dan organisasi
membangun solusi teknologi modern melalui software development,
AI, cloud, dan sistem digital terintegrasi.

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
fontSize:"26px",
color:"#1F2937"
}}

>

Solusi Teknologi Kami

</h2>



<div

style={{
marginTop:"25px",
display:"grid",
gap:"16px"
}}

>


{

services.map((item,index)=>(

<motion.div

key={item}

initial={{
opacity:0,
x:20
}}

whileInView={{
opacity:1,
x:0
}}

transition={{
delay:index*.1
}}

style={{

fontFamily:"Poppins",
fontSize:"18px",
color:"#374151"

}}

>

{item}

</motion.div>

))

}


</div>


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
textAlign:"center",
fontFamily:"Poppins",
fontSize:"30px"
}}

>

Layanan StudioIT

</h2>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(220px,1fr))",
gap:"25px",
marginTop:"40px"
}}

>


{

services.map(item=>(

<div

key={item}

style={{

background:"#FFFFFF",
padding:"30px",
borderRadius:"18px",
boxShadow:"0 10px 30px rgba(0,0,0,.08)",
textAlign:"center"

}}

>

<h3

style={{
fontFamily:"Poppins"
}}

>

{item}

</h3>


<p

style={{
color:"#374151"
}}

>

Solusi teknologi modern untuk mendukung kebutuhan bisnis.

</p>


</div>

))

}


</div>


</div>


</section>


</div>

)

}

