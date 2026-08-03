
import { motion } from "framer-motion";
import {
Code2,
BrainCircuit,
Cloud,
Smartphone
} from "lucide-react";


export default function HeroVisual(){

const items=[
{
icon:<Code2 size={28}/>,
title:"Software Development"
},
{
icon:<BrainCircuit size={28}/>,
title:"AI Solution"
},
{
icon:<Cloud size={28}/>,
title:"Cloud System"
},
{
icon:<Smartphone size={28}/>,
title:"Mobile Apps"
}
]


return(

<div
style={{
display:"grid",
gap:"16px"
}}
>

{
items.map((item,index)=>(

<motion.div

key={item.title}

initial={{
opacity:0,
x:30
}}

animate={{
opacity:1,
x:0
}}

transition={{
delay:index*.15
}}

style={{
background:"#FFFFFF",
padding:"20px",
borderRadius:"18px",
display:"flex",
alignItems:"center",
gap:"15px",
boxShadow:"0 15px 35px rgba(0,0,0,.08)"
}}

>

<div
style={{
color:"#E63946"
}}
>
{item.icon}
</div>

<span
style={{
fontFamily:"Inter",
color:"#374151"
}}
>
{item.title}
</span>


</motion.div>

))

}

</div>

)

}

