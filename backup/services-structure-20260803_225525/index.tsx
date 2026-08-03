

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
fontSize:"16px",
fontWeight:600,
color:"#E63946",
marginBottom:"15px"
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
fontSize:"24px",
color:"#1F2937",
marginBottom:"25px"
}}

>

Solusi Teknologi Kami

</h2>


<div

style={{
display:"grid",
gap:"14px"
}}

>


{

[
"Website Development",
"Mobile Application",
"Artificial Intelligence",
"Enterprise System",
"Cloud Infrastructure"

].map(item=>(

<div

key={item}

style={{

fontFamily:"Poppins",
fontSize:"18px",
color:"#374151"

}}

>

{item}

</div>

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
fontFamily:"Poppins",
fontSize:"30px",
textAlign:"center"
}}

>

Layanan StudioIT

</h2>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(260px,1fr))",
gap:"28px",
marginTop:"40px"
}}

>


{
services.map((item,index)=>{

const Icon=item.icon;


return(

<motion.div

key={item.title}

initial={{
opacity:0,
y:20
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.08
}}

whileHover={{
y:-8
}}

style={{
background:"#FFFFFF",
padding:"30px",
borderRadius:"20px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)",
textAlign:"center"
}}

>


<div

style={{
width:"64px",
height:"64px",
borderRadius:"18px",
background:"#FFE8E8",
display:"flex",
justifyContent:"center",
alignItems:"center",
margin:"auto"
}}

>

<Icon
size={32}
color="#E63946"
/>

</div>


<h3
style={{
fontFamily:"Poppins"
}}
>
{item.title}
</h3>


<p
style={{
color:"#374151"
}}
>
{item.desc}
</p>


</motion.div>

)

})

}


</div>


</div>


</section>


</div>

)

}

