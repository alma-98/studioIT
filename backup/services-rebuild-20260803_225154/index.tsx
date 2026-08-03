
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
gap:"50px",
alignItems:"center"
}}

>


<div
style={{
textAlign:"left"
}}
>


<h1

style={{
fontFamily:"Poppins",
fontSize:"36px",
color:"#1F2937"
}}

>

Software House
<br/>
& Digital Agency

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

StudioIT adalah Software House dan Digital Agency yang membantu
perusahaan, UMKM, startup, dan organisasi membangun solusi
teknologi modern melalui pengembangan website, aplikasi mobile,
sistem enterprise, Artificial Intelligence (AI), cloud solution,
dan integrasi digital.

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
fontSize:"30px",
color:"#1F2937"
}}

>

Partner Teknologi Untuk
<br/>
Transformasi Digital

</h2>



<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"justify"
}}

>

StudioIT membantu bisnis menciptakan solusi digital modern
yang aman, scalable, dan siap berkembang mengikuti kebutuhan
bisnis masa depan.

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
textAlign:"center",
marginBottom:"50px"
}}

>

Layanan StudioIT

</h2>



<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(260px,1fr))",
gap:"28px"
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
y:30
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
padding:"32px",
borderRadius:"22px",
textAlign:"center",
boxShadow:"0 15px 35px rgba(0,0,0,.08)"
}}

>


<div

style={{
width:"64px",
height:"64px",
borderRadius:"18px",
background:"#FFE8E8",
display:"flex",
alignItems:"center",
justifyContent:"center",
margin:"0 auto 20px"
}}

>

<Icon
size={32}
color="#E63946"
/>

</div>



<h3

style={{
fontFamily:"Poppins",
fontSize:"18px"
}}

>

{item.title}

</h3>



<p

style={{
fontFamily:"Inter",
fontSize:"14px",
lineHeight:"1.7",
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



<section

style={{
padding:"80px 24px",
background:"#FFE8E8",
textAlign:"center"
}}

>


<h2

style={{
fontFamily:"Poppins",
fontSize:"28px"
}}

>

Siap Membangun Solusi Digital?

</h2>


<p

style={{
color:"#374151",
margin:"20px"
}}

>

Konsultasikan kebutuhan project Anda bersama StudioIT.

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
padding:"14px 30px",
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

