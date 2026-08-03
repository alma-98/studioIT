#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES HERO CLEAN"
echo " Two Column Professional Layout"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-hero-clean-$STAMP

cp src/pages/Services/index.tsx \
backup/services-hero-clean-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()

start = text.find("<section")

end = text.find("</section>")

hero = """

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

"""


if start != -1 and end != -1:
    text = hero + text[end+10:]

p.write_text(text)

print("Services hero cleaned")

PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Services/index.tsx

git commit -m "Clean Services hero two column layout" || true

git push origin main || true


echo "[3/3] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES HERO CLEAN COMPLETE"
echo " Backup:"
echo " backup/services-hero-clean-$STAMP"
echo "=============================================="

