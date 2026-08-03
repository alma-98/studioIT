

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



</div>

))

}


</div>


</div>


</section>


</div>

)

}

