import {
Globe,
Smartphone,
BrainCircuit,
Building2,
Cloud
} from "lucide-react";


export default function Services(){

const services=[

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


return (

<div>






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


<p

style={{
display:"inline-block",
background:"#E63946",
color:"#FFFFFF",
padding:"8px 18px",
borderRadius:"20px",
fontFamily:"Poppins",
fontSize:"14px",
fontWeight:600
}}

>

Layanan Kami

</p>


<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",
gap:"60px",
alignItems:"center",
marginTop:"40px"
}}

>


<div>

<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"left",
maxWidth:"800px"
}}

>

StudioIT menyediakan solusi teknologi digital yang dirancang sesuai kebutuhan bisnis, mulai dari pengembangan website, aplikasi mobile, sistem enterprise, hingga solusi AI dan cloud. Kami membantu perusahaan, UMKM, dan startup membangun sistem yang modern, scalable, dan siap mendukung pertumbuhan bisnis di era digital.

</p>

</div>



<div

style={{
display:"grid",
gap:"14px",
marginTop:"0",
justifyItems:"start"
}}

>


{

services.map(item=>(

<div

key={item.name}
style={{

background:"#FFFFFF",
width:"240px",
padding:"14px 20px",
borderRadius:"12px",
boxShadow:"0 10px 30px rgba(0,0,0,.08)",
textAlign:"left"

}}

>

<div

style={{
display:"flex",
alignItems:"center",
gap:"14px"
}}

>

<item.icon
size={20}
color="#E63946"
/>


<h3

style={{
fontFamily:"Poppins",
fontSize:"16px",
fontWeight:600,
margin:0
}}

>

{item.name}

</h3>

</div>


</div>

))

}


</div>


</div>


</div>


</section>


</div>

)

}
