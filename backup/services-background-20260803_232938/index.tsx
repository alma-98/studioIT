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
background:"#FFFFFF"
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


<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"left",
maxWidth:"800px",
marginTop:"20px"
}}

>

StudioIT menyediakan solusi teknologi digital yang dirancang sesuai kebutuhan bisnis, mulai dari pengembangan website, aplikasi mobile, sistem enterprise, hingga solusi AI dan cloud. Kami membantu perusahaan, UMKM, dan startup membangun sistem yang modern, scalable, dan siap mendukung pertumbuhan bisnis di era digital.

</p>



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

key={item.name}

style={{

background:"#FFFFFF",
padding:"30px",
borderRadius:"18px",
boxShadow:"0 10px 30px rgba(0,0,0,.08)",
textAlign:"center"

}}

>

<div

style={{
width:"60px",
height:"60px",
borderRadius:"18px",
background:"#FFE8E8",
display:"flex",
alignItems:"center",
justifyContent:"center",
margin:"0 auto 20px"
}}

>

<item.icon
size={30}
color="#E63946"
/>

</div>


<h3

style={{
fontFamily:"Poppins"
}}

>

{item.name}

</h3>


</div>

))

}


</div>


</div>


</section>


</div>

)

}
