#!/bin/bash

set -e

echo "=============================================="
echo " FIX SERVICES TWO COLUMN WRAPPER"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-two-column-wrapper-$STAMP

cp src/pages/Services/index.tsx backup/services-two-column-wrapper-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


# sebelum paragraf
text = text.replace(
'''
<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"left",
maxWidth:"800px",
marginTop:"20px"
}}

>
''',
'''
<div

style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(320px,1fr))",
gap:"60px",
alignItems:"center",
marginTop:"40px"
}}

>


<div>

<p

style={{
fontFamily:"Inter",
fontSize:"16px",
lineHeight:"1.8",
color:"#374151",
textAlign:"left",
maxWidth:"800px"
}}

>
'''
)


# tutup kolom kiri setelah paragraf
text = text.replace(
'''
</p>



<div

style={{
display:"grid",
gap:"18px",
marginTop:"0",
justifyItems:"start"
}}
''',
'''
</p>

</div>



<div

style={{
display:"grid",
gap:"18px",
marginTop:"0",
justifyItems:"start"
}}
'''
)


# tutup wrapper utama sebelum section selesai
text = text.replace(
'''
</div>


</section>
''',
'''
</div>


</div>


</section>
''',
1
)


p.write_text(text)

print("Two column wrapper applied")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Fix Services two column layout wrapper" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES TWO COLUMN WRAPPER COMPLETE"
echo " Backup:"
echo " backup/services-two-column-wrapper-$STAMP"
echo "=============================================="

