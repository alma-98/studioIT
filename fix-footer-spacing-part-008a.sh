#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT FIX FOOTER SPACING"
echo "=============================================="

FILE="src/components/layout/Footer.tsx"

python3 <<'PY'
from pathlib import Path

file = Path("src/components/layout/Footer.tsx")

text = file.read_text()

start = text.find("<div\nstyle={{\nmarginTop:\"20px\"")

end = text.find("</div>\n\n\n\n<p", start)

if start != -1 and end != -1:

    replacement = '''
<div
style={{
marginTop:"20px",
fontSize:"14px",
lineHeight:"1.8"
}}
>

<div
style={{
display:"flex",
justifyContent:"center",
gap:"20px"
}}
>
<span>SMS</span>

<a
href="sms:+6285283397198"
style={{
color:"#FFFFFF"
}}
>
+6285283397198
</a>

</div>


<div
style={{
display:"flex",
justifyContent:"center",
gap:"20px"
}}
>

<span>Email</span>

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
'''

    text=text[:start]+replacement+text[end+len("</div>\n\n\n\n"):]

file.write_text(text)

print("Footer spacing updated")
PY


npm run build


git add src/components/layout/Footer.tsx

git commit -m "Fix footer text alignment and spacing" || true

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " FOOTER FIX COMPLETE"
echo "=============================================="
