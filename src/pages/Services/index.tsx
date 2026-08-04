import { motion } from "framer-motion";

import {
Globe,
Smartphone,
BrainCircuit,
Building2,
Cloud
} from "lucide-react";


const services = [
{
name:"Website Development",
icon:Globe
},
{
name:"Mobile Application",
icon:Smartphone
},
{
name:"Artificial Intelligence",
icon:BrainCircuit
},
{
name:"Enterprise System",
icon:Building2
},
{
name:"Cloud Infrastructure",
icon:Cloud
}
];


export default function Services(){

return (

<div>

<section

style={{
width:"100%",
padding:"clamp(60px,8vw,100px) 24px",
background:"#FFE8E8",
textAlign:"left",
overflow:"hidden"
}}

>

<div

style={{
maxWidth:"1200px",
width:"100%",
margin:"auto",
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(260px,1fr))",
gap:"clamp(24px,4vw,60px)",
alignItems:"center"
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
duration:0.6
}}

>


<p

style={{
display:"inline-block",
background:"#E63946",
color:"#FFFFFF",
padding:"8px 18px",
borderRadius:"30px",
marginBottom:"24px",
fontFamily:"Poppins",
fontSize:"14px",
fontWeight:600
}}

>

Layanan Kami

</p>



<h1

style={{
fontFamily:"Poppins",
fontSize:"32px",
lineHeight:"1.2",
color:"#1F2937"
}}

>

Solusi Teknologi Digital Untuk Kebutuhan Bisnis

</h1>



<p

style={{
fontFamily:"Inter",
fontSize:"17px",
lineHeight:"1.8",
color:"#374151",
textAlign:"left"
}}

>

StudioIT menyediakan solusi teknologi digital yang membantu perusahaan, UMKM, dan startup melakukan transformasi bisnis melalui pengembangan software, aplikasi mobile, artificial intelligence, sistem enterprise, dan cloud infrastructure.

Dengan pendekatan teknologi modern dan scalable, StudioIT membantu membangun sistem digital yang lebih efisien, terintegrasi, dan siap mendukung pertumbuhan bisnis di era digital.

</p>


</motion.div>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(220px,1fr))",
gap:"16px"
}}

>


{

services.map((item,index)=>{

const Icon=item.icon;

return (

<motion.div

key={item.name}

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

padding:"12px 18px",
borderRadius:"12px",
display:"flex",
alignItems:"center",
gap:"12px",
boxShadow:"0 8px 20px rgba(0,0,0,.06)"
}}

>

<Icon
size={18}
color="#E63946"
/>


<span

style={{
fontFamily:"Poppins",
fontSize:"14px",
fontWeight:500,
color:"#1F2937"
}}

>

{item.name}

</span>


</motion.div>

)

})

}


</div>


</div>


</section>




<section
  style={{
    width:"100%",
    padding:"80px 24px",
    background:"#FFFFFF"
  }}
>

<div
style={{
maxWidth:"1200px",
margin:"0 auto"
}}
>

<h2
style={{
fontFamily:"Poppins",
fontSize:"32px",
fontWeight:700,
textAlign:"center",
color:"#1F2937",
marginBottom:"12px"
}}
>
Layanan Kami & Estimasi Pengerjaan
</h2>

<p
style={{
fontFamily:"Inter",
fontSize:"16px",
textAlign:"center",
color:"#6B7280",
marginBottom:"40px"
}}
>
Estimasi waktu pengerjaan dapat berbeda sesuai ruang lingkup proyek, kompleksitas fitur, kebutuhan integrasi, dan proses revisi. Express Delivery tersedia untuk proyek tertentu.
</p>

<div
style={{
overflowX:"auto",
borderRadius:"20px",
boxShadow:"0 10px 30px rgba(0,0,0,.08)"
}}
>

<table
style={{
width:"100%",
borderCollapse:"collapse",
background:"#FFFFFF",
minWidth:"1100px"
}}
>

<thead>

<tr
style={{
background:"#E63946",
color:"#FFFFFF"
}}
>

<th style={{padding:"18px",textAlign:"left"}}>Kategori</th>
<th style={{padding:"18px",textAlign:"left"}}>Layanan</th>
<th style={{padding:"18px",textAlign:"center"}}>Estimasi</th>

</tr>

</thead>

<tbody>

<tr>
<td style={{padding:"18px",fontWeight:600}}>🌐 Web Solutions</td>
<td style={{padding:"18px"}}>Landing Page, Company Profile, Company Portal, E-Commerce, Dashboard, Custom Website</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>1 hari – 6 minggu</td>
</tr>

<tr style={{background:"#FFF8F8"}}>
<td style={{padding:"18px",fontWeight:600}}>📱 Mobile Solutions</td>
<td style={{padding:"18px"}}>Android App, iOS App, Cross Platform App, Mobile Dashboard</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>1 minggu – 3 bulan</td>
</tr>

<tr>
<td style={{padding:"18px",fontWeight:600}}>💼 Business Solutions</td>
<td style={{padding:"18px"}}>HRIS, ERP, CRM, POS, Inventory, Payroll, Booking System, LMS, School System, Clinic System</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>2 minggu – 6 bulan</td>
</tr>

<tr style={{background:"#FFF8F8"}}>
<td style={{padding:"18px",fontWeight:600}}>🤖 AI Solutions</td>
<td style={{padding:"18px"}}>AI Chatbot, AI Assistant, AI Automation, AI Analytics, AI Recommendation</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>1 hari – 2 bulan</td>
</tr>

<tr>
<td style={{padding:"18px",fontWeight:600}}>🔗 Integration Solutions</td>
<td style={{padding:"18px"}}>Payment Gateway, WhatsApp API, Google API, Firebase, Third Party API</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>1 hari – 3 minggu</td>
</tr>

<tr style={{background:"#FFF8F8"}}>
<td style={{padding:"18px",fontWeight:600}}>🎨 Design Solutions</td>
<td style={{padding:"18px"}}>UI Design, UX Design, Wireframe, Prototype, Design System</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>2 hari – 4 minggu</td>
</tr>

<tr>
<td style={{padding:"18px",fontWeight:600}}>☁️ Cloud & Infrastructure</td>
<td style={{padding:"18px"}}>Hosting, Cloud Deployment, Database, DevOps, CI/CD, Monitoring</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>1 hari – 2 minggu</td>
</tr>

<tr style={{background:"#FFF8F8"}}>
<td style={{padding:"18px",fontWeight:600}}>🛠️ Maintenance & Support</td>
<td style={{padding:"18px"}}>Bug Fix, Feature Enhancement, Security Update, Performance Optimization, Technical Support</td>
<td style={{padding:"18px",textAlign:"center",fontWeight:600}}>Mulai 1 hari</td>
</tr>

</tbody>

</table>

</div>

</div>

</section>


</div>

)

}
