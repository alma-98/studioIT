
import { motion } from "framer-motion";


export default function FAQ(){

const questions=[

"Berapa lama proses pembuatan website?",

"Apakah StudioIT menerima project custom?",

"Teknologi apa yang digunakan?",

"Apakah tersedia maintenance setelah project selesai?",

"Bagaimana proses konsultasi project?"

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
maxWidth:"900px",
margin:"auto"
}}
>


<div
style={{
textAlign:"center",
marginBottom:"45px"
}}
>

<h2
style={{
fontFamily:"Poppins",
fontSize:"28px",
color:"#1F2937"
}}
>
Frequently Asked Questions
</h2>


<p
style={{
color:"#374151"
}}
>
Pertanyaan umum mengenai layanan StudioIT.
</p>


</div>



<div
style={{
display:"grid",
gap:"18px"
}}
>


{
questions.map((question,index)=>(

<motion.div

key={question}

initial={{
opacity:0,
y:20
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.1
}}

style={{
padding:"22px",
background:"#FFE8E8",
borderRadius:"16px",
fontFamily:"Inter"
}}

>

<strong
style={{
color:"#E63946"
}}
>
0{index+1}
</strong>


<div
style={{
marginTop:"10px"
}}
>
{question}
</div>


</motion.div>

))

}


</div>


</div>


</section>

)

}

