
import {
Code2,
Smartphone,
BrainCircuit,
Cloud
} from "lucide-react";


export default function ServicesPreview(){

const services=[
["Website Development",Code2],
["Mobile Application",Smartphone],
["Artificial Intelligence",BrainCircuit],
["Cloud Solution",Cloud]
]


return(

<section style={{padding:"80px 24px"}}>


<h2 style={{textAlign:"center"}}>
Solusi Teknologi Lengkap Untuk Bisnis
</h2>


<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(220px,1fr))",
gap:"24px",
marginTop:"40px"
}}
>


{
services.map(([title,Icon]:any)=>(

<div
key={title}
style={{
background:"#FFFFFF",
padding:"30px",
borderRadius:"18px",
boxShadow:"0 10px 30px rgba(0,0,0,.08)"
}}
>

<Icon
color="#E63946"
size={35}
/>

<h3>
{title}
</h3>

<p>
Solusi digital modern yang siap berkembang.
</p>

</div>

))

}

</div>


</section>

)

}

