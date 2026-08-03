

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


<h2

style={{
textAlign:"center",
fontFamily:"Poppins",
fontSize:"30px"
}}

>

Layanan Kami

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

