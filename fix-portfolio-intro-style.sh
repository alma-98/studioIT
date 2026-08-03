#!/bin/bash

set -e

echo "=============================================="
echo " FIX PORTFOLIO INTRO LIKE SERVICES STYLE"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/portfolio-intro-$STAMP

cp src/pages/Portfolio/index.tsx \
backup/portfolio-intro-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Portfolio/index.tsx")

text = p.read_text()


# ganti heading lama
text = text.replace(
'''
<h1
style={{
fontFamily:"Poppins",
fontSize:"38px",
color:"#1F2937"
}}
>

Portfolio Project Project

</h1>
''',
'''
<p

style={{
display:"inline-block",
background:"#E63946",
color:"#FFFFFF",
padding:"8px 18px",
borderRadius:"30px",
fontFamily:"Poppins",
fontSize:"14px",
fontWeight:600
}}

>

Portfolio Project

</p>



<h1

style={{
fontFamily:"Poppins",
fontSize:"38px",
color:"#1F2937"
}}

>

Solusi Digital
<br/>
Untuk Bisnis Modern

</h1>
'''
)


# rapikan paragraf
text = text.replace(
'''
Solusi digital yang telah dan sedang dikembangkan StudioIT.

Jelajahi berbagai project teknologi yang dibangun dengan
teknologi modern dengan fokus pada performa, keamanan,
skalabilitas, dan pengalaman pengguna.
''',
'''
Solusi digital yang telah dan sedang dikembangkan StudioIT.
Jelajahi berbagai project teknologi yang dibangun dengan
teknologi modern dengan fokus pada performa, keamanan,
skalabilitas, dan pengalaman pengguna terbaik.
'''
)


p.write_text(text)

print("Portfolio intro updated")

PY


npm run build


git add src/pages/Portfolio/index.tsx

git commit -m "Update Portfolio intro to StudioIT style" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " PORTFOLIO INTRO COMPLETE"
echo " Backup:"
echo " backup/portfolio-intro-$STAMP"
echo "=============================================="

