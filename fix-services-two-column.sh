#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES TWO COLUMN"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-two-column-$STAMP

cp src/pages/Services/index.tsx backup/services-two-column-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


old = """
<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(220px,1fr))",
gap:"25px",
marginTop:"40px"
}}

>
"""


new = """
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

"""


text=text.replace(old,new)


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

print("Two column layout updated")

PY


npm run build

git add src/pages/Services/index.tsx

git commit -m "Update Services two column layout" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES TWO COLUMN COMPLETE"
echo " Backup:"
echo " backup/services-two-column-$STAMP"
echo "=============================================="

