#!/bin/bash

set -e

echo "=============================================="
echo " FIX SERVICES TWO COLUMN JSX STRUCTURE"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-two-column-fix-$STAMP

cp src/pages/Services/index.tsx backup/services-two-column-fix-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


start = text.find("<div\n\nstyle={{\ndisplay:\"grid\"")

if start != -1:

    end = text.find("</div>\n\n\n</div>\n\n\n</section>", start)

    if end != -1:

        replacement = r'''
<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",
gap:"60px",
alignItems:"center",
marginTop:"40px"
}}

>


<div

style={{
textAlign:"left"
}}

>

<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"justify"
}}

>

StudioIT menyediakan solusi teknologi digital yang dirancang sesuai kebutuhan bisnis, mulai dari pengembangan website, aplikasi mobile, sistem enterprise, hingga solusi AI dan cloud. Kami membantu perusahaan, UMKM, dan startup membangun sistem yang modern, scalable, dan siap mendukung pertumbuhan bisnis di era digital.

</p>

</div>



<div

style={{
display:"grid",
gap:"18px"
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
display:"flex",
alignItems:"center",
gap:"15px",
fontFamily:"Poppins",
fontSize:"18px",
color:"#374151"
}}

>

<div

style={{
width:"14px",
height:"14px",
borderRadius:"50%",
background:"#E63946"
}}

>

</div>

{item}

</div>

))

}

</div>


</div>
'''

        text = text[:start] + replacement + text[end+len("</div>\n\n\n</div>"):]

    else:
        print("Section end tidak ditemukan")
else:
    print("Section grid tidak ditemukan")


p.write_text(text)

print("JSX structure fixed")

PY


npm run build

git add src/pages/Services/index.tsx

git commit -m "Fix Services two column JSX structure" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES JSX FIX COMPLETE"
echo " Backup:"
echo " backup/services-two-column-fix-$STAMP"
echo "=============================================="

