#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT PART 008A FIX"
echo " Footer Alignment + Replace Firebase Logo"
echo "=============================================="

echo "[1/5] Update Footer..."

cat <<'FOOTER' > src/components/layout/Footer.tsx
export default function Footer(){

return(

<footer
style={{
background:"#1F2937",
color:"#FFFFFF",
padding:"40px",
textAlign:"center"
}}
>


<h2
style={{
fontFamily:"Poppins",
marginBottom:"10px"
}}
>
StudioIT
</h2>


<p>
Transformasi Digital Untuk Indonesia Maju
</p>


<p>
Powered By{" "}
<a
href="https://investment-tech-indonesia.web.app"
target="_blank"
rel="noopener noreferrer"
style={{
color:"#FFFFFF"
}}
>
Investment Technology Indonesia
</a>
</p>


<div
style={{
marginTop:"20px",
lineHeight:"2"
}}
>

<div>
<strong>SMS</strong>
&nbsp;&nbsp;
<a
href="sms:+6285283397198"
style={{
color:"#FFFFFF"
}}
>
+6285283397198
</a>
</div>


<div>
<strong>Email</strong>
&nbsp;&nbsp;
<a
href="mailto:alma.budsteddy88@gmail.com"
style={{
color:"#FFFFFF"
}}
>
alma.budsteddy88@gmail.com
</a>
</div>


</div>


<p
style={{
marginTop:"20px"
}}
>
© 2026 StudioIT. All rights reserved.
</p>


</footer>

)

}
FOOTER


echo "[2/5] Replace Vite Firebase Icons..."

rm -f src/assets/vite.svg
rm -f public/favicon.svg


echo "[3/5] Create StudioIT Branding Icon..."

cat <<'SVG' > public/favicon.svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">

<rect width="512" height="512" rx="100" fill="#E63946"/>

<text
x="256"
y="310"
font-size="220"
text-anchor="middle"
fill="white"
font-family="Arial"
font-weight="bold">
S
</text>

</svg>
SVG


echo "[4/5] Update HTML Title..."

python3 <<'PY'
from pathlib import Path

p=Path("index.html")

if p.exists():
    t=p.read_text()
    t=t.replace(
        "<title>Vite + React + TS</title>",
        "<title>StudioIT - Transformasi Digital Untuk Indonesia Maju</title>"
    )
    p.write_text(t)

print("HTML updated")
PY


echo "[5/5] Build..."

npm run build


git add .

git commit -m "Update StudioIT footer alignment and branding icon" || true

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " UPDATE COMPLETE"
echo "=============================================="
