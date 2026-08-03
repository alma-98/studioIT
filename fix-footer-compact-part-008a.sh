#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT FIX FOOTER COMPACT"
echo "=============================================="

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
fontFamily:"Poppins"
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
fontSize:"14px",
lineHeight:"1.6"
}}
>

<div>
SMS{" "}
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
Email{" "}
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


<p>
© 2026 StudioIT. All rights reserved.
</p>


</footer>

)

}
FOOTER


npm run build

git add src/components/layout/Footer.tsx

git commit -m "Compact StudioIT footer spacing" || true

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " FOOTER COMPACT COMPLETE"
echo "=============================================="
