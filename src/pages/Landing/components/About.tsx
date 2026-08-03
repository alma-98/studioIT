
import { motion } from "framer-motion";
import { Building2 } from "lucide-react";


export default function About(){

return(

<section style={{padding:"80px 24px"}}>

<motion.div
initial={{opacity:0,y:30}}
whileInView={{opacity:1,y:0}}
transition={{duration:.6}}
style={{
maxWidth:"1000px",
margin:"auto",
textAlign:"center"
}}
>

<Building2
size={45}
color="#E63946"
/>


<h2>
Membangun Masa Depan Digital Bersama Teknologi Modern
</h2>


<p>
StudioIT adalah Software House dan Digital Agency yang membantu perusahaan,
UMKM, startup, dan organisasi melakukan transformasi digital melalui solusi
teknologi inovatif, scalable, dan sesuai kebutuhan bisnis.
</p>


</motion.div>

</section>

)

}

