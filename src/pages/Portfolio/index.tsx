
import { motion } from "framer-motion";
import { ExternalLink } from "lucide-react";


export default function Portfolio(){


const projects=[

{
title:"Toko Data",
category:"Data Management Platform",
tech:"React • TypeScript • Firebase",
desc:"Platform pengelolaan data berbasis web untuk membantu organisasi mengelola informasi secara terstruktur, aman, dan mudah diakses.",
link:"https://toko-data.web.app/"
},

{
title:"Toko POS Kasir",
category:"Point of Sale System",
tech:"React • Firebase • Database",
desc:"Aplikasi kasir digital untuk transaksi penjualan, manajemen produk, dan laporan operasional bisnis.",
link:"https://toko-pos-kasir.web.app/"
},

{
title:"QuestDemon",
category:"Gamification Platform",
tech:"Web Technology",
desc:"Platform gamifikasi dengan sistem misi, tantangan, dan pencapaian untuk meningkatkan keterlibatan pengguna.",
link:"https://questdemon.web.app/"
},

{
title:"AlmaMobiiee",
category:"Automotive Digital Platform",
tech:"Web • Interactive Experience",
desc:"Platform digital otomotif dengan pengalaman interaktif dan konsep branding teknologi kreatif.",
link:"https://alma-98.github.io/almaMobiiee/"
},

{
title:"AlmaMobiiee Gift",
category:"Gift & Merchandise Platform",
tech:"Web Application",
desc:"Platform katalog merchandise dan produk hadiah dengan tampilan modern dan mudah digunakan.",
link:"https://almamobiieegift.web.app/"
},

{
title:"Workforce Intelligence Platform",
category:"AI HRIS Platform",
tech:"React • TypeScript • Firebase • AI",
desc:"Platform AI HRIS untuk workforce analytics, employee intelligence, AI recommendation, dan data pipeline.",
link:"https://workforceip.web.app/"
}

]


return(

<div>


<section

style={{
padding:"100px 24px",
background:"#FFE8E8",
textAlign:"left"
}}

>


<div
style={{
maxWidth:"1200px",
margin:"auto"
}}
>


<p

style={{
display:"inline-block",
background:"#E63946",
color:"#FFFFFF",
padding:"8px 18px",
borderRadius:"30px",
fontFamily:"Poppins",
fontSize:"14px",
fontWeight:600,
marginBottom:"24px"
}}

>

Proyek Kami

</p>



<h1

style={{
fontFamily:"Poppins",
fontSize:"32px",
color:"#1F2937"
}}

>

Solusi Digital Untuk Bisnis Modern

</h1>


<p
style={{
fontFamily:"Inter",
fontSize:"17px",
lineHeight:"1.8",
color:"#374151"
}}
>

StudioIT menghadirkan berbagai solusi teknologi digital yang telah dan sedang dikembangkan untuk membantu bisnis melakukan transformasi digital. Kami membangun berbagai project mulai dari website, aplikasi mobile, sistem enterprise, hingga solusi berbasis AI dengan menggunakan teknologi modern yang fokus pada performa, keamanan, skalabilitas, dan pengalaman pengguna.

Setiap project dikembangkan dengan pendekatan yang terstruktur untuk menghasilkan solusi digital yang efektif, mudah dikembangkan, dan siap mendukung kebutuhan bisnis di masa depan.

</p>


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


<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(300px,1fr))",
gap:"30px"
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
padding:"30px",
borderRadius:"22px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)"
}}

>


<div

style={{
display:"inline-block",
background:"#FFE8E8",
color:"#E63946",
padding:"7px 14px",
borderRadius:"20px",
fontSize:"13px"
}}

>

🚧 Dalam Pengembangan

</div>



<h2

style={{
fontFamily:"Poppins",
fontSize:"22px",
marginTop:"22px"
}}

>

{project.title}

</h2>



<p

style={{
color:"#E63946",
fontFamily:"Inter"
}}

>

{project.category}

</p>



<p

style={{
fontFamily:"Inter",
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
gap:"8px",
alignItems:"center",
marginTop:"20px",
color:"#E63946",
textDecoration:"none",
fontFamily:"Poppins"
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



<section

style={{
padding:"80px 24px",
background:"#FFE8E8",
textAlign:"left"
}}

>


<h2
style={{
fontFamily:"Poppins"
}}
>

Punya Ide Project Digital?

</h2>


<p
style={{
color:"#374151"
}}
>

Mari bangun solusi teknologi bersama StudioIT.

</p>


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
padding:"14px 28px",
borderRadius:"14px",
fontFamily:"Poppins",
cursor:"pointer"
}}

>

Konsultasi Project

</button>

</a>


</section>


</div>

)

}

