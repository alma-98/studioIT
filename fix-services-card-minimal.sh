#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES MINIMAL CARD"
echo " Add paragraph + Icon Service Card"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-card-minimal-$STAMP

cp src/pages/Services/index.tsx \
backup/services-card-minimal-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


old = """
<h2

style={{
textAlign:"center",
fontFamily:"Poppins",
fontSize:"30px"
}}

>

Layanan Kami

</h2>
"""


new = """
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


<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"center",
maxWidth:"800px",
margin:"20px auto"
}}

>

StudioIT menyediakan solusi teknologi digital yang dirancang sesuai kebutuhan bisnis, mulai dari pengembangan website, aplikasi mobile, sistem enterprise, hingga solusi AI dan cloud. Kami membantu perusahaan, UMKM, dan startup membangun sistem yang modern, scalable, dan siap mendukung pertumbuhan bisnis di era digital.

</p>
"""


text=text.replace(old,new)


# ganti isi card sederhana
text=text.replace(
"""
<p

style={{
color:"#374151"
}}

>

Solusi teknologi modern untuk mendukung kebutuhan bisnis.

</p>
""",
""
)


p.write_text(text)

print("Services card simplified")

PY


npm run build

git add src/pages/Services/index.tsx

git commit -m "Update Services intro and simplify cards" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES CARD MINIMAL COMPLETE"
echo " Backup:"
echo " backup/services-card-minimal-$STAMP"
echo "=============================================="

