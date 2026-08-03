#!/bin/bash

set -e

echo "=============================================="
echo " REBUILD SERVICES HOME STYLE"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-home-style-$STAMP

cp src/pages/Services/index.tsx \
backup/services-home-style-$STAMP/


cat <<'TSX' > src/pages/Services/index.tsx
import {
Globe,
Smartphone,
BrainCircuit,
Building2,
Cloud
} from "lucide-react";


const services = [
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


export default function Services(){

return (

<div>

<section

style={{
padding:"90px 24px",
background:"#FFE8E8"
}}

>

<div

style={{
maxWidth:"1200px",
margin:"auto",
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",
gap:"70px",
alignItems:"center"
}}

>


<div>


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



<h1

style={{
fontFamily:"Poppins",
fontSize:"42px",
lineHeight:"1.2",
color:"#1F2937"
}}

>

Solusi Teknologi Digital
<br/>
Untuk Kebutuhan Bisnis

</h1>



<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"left"
}}

>

StudioIT menyediakan layanan pengembangan teknologi
mulai dari website, aplikasi mobile, AI, sistem enterprise,
hingga cloud infrastructure untuk membantu bisnis
melakukan transformasi digital.

</p>


</div>



<div

style={{
display:"grid",
gap:"18px"
}}

>


{

services.map(item=>{

const Icon=item.icon;

return (

<div

key={item.name}

style={{
background:"#FFFFFF",
padding:"18px 22px",
borderRadius:"16px",
display:"flex",
alignItems:"center",
gap:"14px",
boxShadow:"0 8px 20px rgba(0,0,0,.06)"
}}

>

<Icon
size={22}
color="#E63946"
/>


<span

style={{
fontFamily:"Poppins",
fontSize:"16px",
fontWeight:600,
color:"#1F2937"
}}

>

{item.name}

</span>


</div>

)

})

}


</div>


</div>


</section>


</div>

)

}
TSX


npm run build


git add src/pages/Services/index.tsx

git commit -m "Rebuild Services page with Home StudioIT style" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES HOME STYLE COMPLETE"
echo " Backup:"
echo " backup/services-home-style-$STAMP"
echo "=============================================="

