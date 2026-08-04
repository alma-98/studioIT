
import { motion } from "framer-motion";
import { ExternalLink } from "lucide-react";


export default function Portfolio(){

const projects=[

{
title:"Toko Data",
category:"Data Management Platform",
desc:"Platform pengelolaan data berbasis web untuk membantu organisasi mengelola informasi secara terstruktur.",
link:"https://toko-data.web.app/",
tech:"Web Application"
},


{
title:"Toko POS Kasir",
category:"Point of Sale System",
desc:"Aplikasi kasir digital untuk mendukung transaksi penjualan, manajemen produk, dan laporan bisnis.",
link:"https://toko-pos-kasir.web.app/",
tech:"POS • Business System"
},


{
title:"QuestDemon",
category:"Gamification Platform",
desc:"Platform gamifikasi dengan sistem misi, tantangan, dan pencapaian pengguna.",
link:"https://questdemon.web.app/",
tech:"Web Platform"
},


{
title:"AlmaMobiiee",
category:"Automotive Digital Platform",
desc:"Platform digital otomotif dengan pengalaman interaktif dan branding karakter.",
link:"https://almamobiiee.web.app/",
tech:"Interactive Platform"
},


{
title:"AlmaMobiiee Gift",
category:"Gift & Merchandise Platform",
desc:"Platform katalog merchandise dan produk hadiah dengan tampilan modern.",
link:"https://almamobiieegift.web.app/",
tech:"E-Commerce Platform"
},


{
title:"Workforce Intelligence Platform",
category:"AI Human Resource Information System",
desc:"Platform AI HRIS untuk workforce analytics, employee intelligence, dan AI recommendation.",
link:"https://workforceip.web.app/",
tech:"React • Firebase • AI"
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
marginBottom:"50px"
}}
>


<h2
style={{
fontFamily:"Poppins",
fontSize:"30px",
color:"#1F2937"
}}
>

Portfolio Project

</h2>


<p
style={{
maxWidth:"800px",
margin:"20px auto",
color:"#374151",
lineHeight:"1.8"
}}
>

Solusi Digital Yang Telah Dan Sedang Dikembangkan StudioIT.

Jelajahi berbagai project teknologi StudioIT yang dibangun
menggunakan teknologi modern dengan fokus pada performa,
keamanan, skalabilitas, dan pengalaman pengguna.

</p>


</div>



<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(300px,1fr))",
gap:"28px"
}}
>


{
projects.map((project,index)=>(

<motion.div

key={project.title}

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
borderRadius:"20px",
padding:"30px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)"
}}

>


<div
style={{
display:"inline-block",
background:"#FFE8E8",
color:"#E63946",
padding:"6px 14px",
borderRadius:"20px",
fontSize:"13px"
}}
>

🚧 Dalam Pengembangan

</div>



<h3
style={{
fontFamily:"Poppins",
marginTop:"20px"
}}
>
{project.title}
</h3>



<p
style={{
color:"#E63946",
fontSize:"14px"
}}
>
{project.category}
</p>



<p
style={{
color:"#374151",
lineHeight:"1.7"
}}
>
{project.desc}
</p>



<div
style={{
background:"#FFE8E8",
padding:"8px 12px",
borderRadius:"10px",
display:"inline-block",
fontSize:"13px"
}}
>

{project.tech}

</div>



<br/>


<a

href={project.link}

target="_blank"

rel="noreferrer"

style={{
display:"inline-flex",
alignItems:"center",
gap:"8px",
marginTop:"20px",
color:"#E63946",
textDecoration:"none"
}}

>

Live Demo

<ExternalLink size={16}/>

</a>


</motion.div>


))

}


</div>


</div>


</section>


)

}

