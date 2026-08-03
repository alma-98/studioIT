#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FAQ ACCORDION DROPDOWN"
echo "=============================================="

cat <<'FAQ' > src/pages/Landing/components/FAQ.tsx

import { useState } from "react";
import { ChevronDown } from "lucide-react";


export default function FAQ(){

const items=[

{
q:"Berapa lama proses pembuatan website?",
a:"Proses pengerjaan tergantung kompleksitas project, fitur, dan kebutuhan bisnis."
},

{
q:"Apakah StudioIT menerima project custom?",
a:"Ya, StudioIT menerima pengembangan solusi custom sesuai kebutuhan bisnis."
},

{
q:"Teknologi apa yang digunakan?",
a:"StudioIT menggunakan React, TypeScript, Firebase, AI, Cloud, dan teknologi modern lainnya."
},

{
q:"Apakah tersedia maintenance setelah project selesai?",
a:"Ya, tersedia layanan maintenance dan support setelah project selesai."
},

{
q:"Bagaimana proses konsultasi project?",
a:"Dimulai dari konsultasi kebutuhan, analisis solusi, proposal, kemudian proses pengembangan."
}

]


const [open,setOpen]=useState<number|null>(null);


return(

<section
style={{
padding:"80px 24px",
background:"#FFFFFF"
}}
>

<div
style={{
maxWidth:"850px",
margin:"auto"
}}
>


<div
style={{
textAlign:"center",
marginBottom:"35px"
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
gap:"12px"
}}
>


{
items.map((item,index)=>(

<div
key={item.q}
style={{
border:"1px solid #FFE8E8",
borderRadius:"12px",
overflow:"hidden"
}}
>


<button

onClick={()=>setOpen(open===index?null:index)}

style={{

width:"100%",

padding:"16px 20px",

background:"#FFFFFF",

border:"none",

display:"flex",

justifyContent:"space-between",

alignItems:"center",

cursor:"pointer",

fontFamily:"Inter",

fontSize:"15px",

textAlign:"left"

}}

>

<span>
{item.q}
</span>


<ChevronDown

size={18}

color="#E63946"

style={{

transform:
open===index
?"rotate(180deg)"
:"rotate(0deg)",

transition:"0.3s"

}}

/>


</button>



{
open===index &&

<div

style={{

padding:"0 20px 18px",

color:"#374151",

lineHeight:"1.7",

fontSize:"14px"

}}

>

{item.a}

</div>

}


</div>

))

}


</div>


</div>


</section>

)

}

FAQ


npm run build


git add src/pages/Landing/components/FAQ.tsx

git commit -m "Update FAQ accordion dropdown design" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " FAQ DROPDOWN COMPLETE"
echo "=============================================="

