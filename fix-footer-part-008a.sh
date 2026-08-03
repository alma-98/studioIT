#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT FIX PART 008A"
echo " Update Footer Information"
echo "=============================================="

FILE="src/components/layout/Footer.tsx"

if [ ! -f "$FILE" ]; then
  echo "Footer tidak ditemukan: $FILE"
  exit 1
fi

cat <<'FOOTER' > "$FILE"
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

<h2>
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


<p>
SMS
<br/>
<a
href="sms:+6285283397198"
style={{
color:"#FFFFFF"
}}
>
+6285283397198
</a>
</p>


<p>
Email
<br/>
<a
href="mailto:alma.budsteddy88@gmail.com"
style={{
color:"#FFFFFF"
}}
>
alma.budsteddy88@gmail.com
</a>
</p>


<p>
© 2026 StudioIT. All rights reserved.
</p>


</footer>

)

}
FOOTER


echo "[1/3] Footer updated"

echo "[2/3] Build validation..."
npm run build


echo "[3/3] Git Commit & Deploy..."

git add src/components/layout/Footer.tsx

git commit -m "Update StudioIT footer information" || true

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " FOOTER UPDATE COMPLETE"
echo "=============================================="
