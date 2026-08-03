#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT FAQ UPDATE"
echo " Remove Testimonial + Setup FAQ"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")


echo "[1/6] Backup..."

mkdir -p backup/faq-update-$STAMP

cp src/pages/Landing/LandingPage.tsx \
backup/faq-update-$STAMP/



echo "[2/6] Remove Testimonial..."

python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Landing/LandingPage.tsx")

text = p.read_text()

# remove possible testimonial import
lines=[]

for line in text.splitlines():
    if "Testimonial" not in line:
        lines.append(line)

text="\n".join(lines)


# remove component usage
text=text.replace(
"<Testimonial/>",
""
)

p.write_text(text)

print("Testimonial removed")
PY



echo "[3/6] Create FAQ Component..."

cat <<'FAQ' > src/pages/Landing/components/FAQ.tsx

import { motion } from "framer-motion";


export default function FAQ(){

const questions=[

"Berapa lama proses pembuatan website?",

"Apakah StudioIT menerima project custom?",

"Teknologi apa yang digunakan?",

"Apakah tersedia maintenance setelah project selesai?",

"Bagaimana proses konsultasi project?"

]


return(

<section
style={{
padding:"90px 24px",
background:"#FFFFFF"
}}
>

<div
style={{
maxWidth:"900px",
margin:"auto"
}}
>


<div
style={{
textAlign:"center",
marginBottom:"45px"
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
gap:"18px"
}}
>


{
questions.map((question,index)=>(

<motion.div

key={question}

initial={{
opacity:0,
y:20
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.1
}}

style={{
padding:"22px",
background:"#FFE8E8",
borderRadius:"16px",
fontFamily:"Inter"
}}

>

<strong
style={{
color:"#E63946"
}}
>
0{index+1}
</strong>


<div
style={{
marginTop:"10px"
}}
>
{question}
</div>


</motion.div>

))

}


</div>


</div>


</section>

)

}

FAQ


echo "[4/6] Integrate FAQ..."

python3 <<'PY'
from pathlib import Path

p=Path("src/pages/Landing/LandingPage.tsx")

text=p.read_text()

if 'import FAQ from "./components/FAQ";' not in text:
    text=text.replace(
        'import PortfolioPreview from "./components/PortfolioPreview";',
        'import PortfolioPreview from "./components/PortfolioPreview";\nimport FAQ from "./components/FAQ";'
    )

if '<FAQ/>' not in text:
    text=text.replace(
        '<PortfolioPreview/>',
        '<PortfolioPreview/>\n<FAQ/>'
    )

p.write_text(text)

print("FAQ integrated")
PY



echo "[5/6] Build..."

npm run build


echo "[6/6] Commit Deploy..."

git add .

git commit -m "Remove testimonial and add FAQ section" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " FAQ UPDATE COMPLETE"
echo " Backup:"
echo " backup/faq-update-$STAMP"
echo "=============================================="

