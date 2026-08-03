#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES HERO TWO COLUMN"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-hero-two-column-$STAMP

cp src/pages/Services/index.tsx \
backup/services-hero-two-column-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()

old_start = text.find("<section")
old_end = text.find("</section>")

if old_start != -1 and old_end != -1:

    hero = '''
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
'''

    text = hero + text[old_end+10:]

    p.write_text(text)

print("Services hero updated")
PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Services/index.tsx

git commit -m "Update Services hero two column layout" || true

git push origin main || true


echo "[3/3] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES HERO TWO COLUMN COMPLETE"
echo " Backup:"
echo " backup/services-hero-two-column-$STAMP"
echo "=============================================="

