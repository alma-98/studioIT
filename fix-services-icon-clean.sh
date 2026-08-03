#!/bin/bash

set -e

echo "=============================================="
echo " SERVICES CLEAN PINK ICON"
echo " Remove Icon Background"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-icon-clean-$STAMP

cp src/pages/Services/index.tsx \
backup/services-icon-clean-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


# hapus container background icon
old = '''
<div

style={{
width:"60px",
height:"60px",
borderRadius:"18px",
background:"#FFE8E8",
display:"flex",
alignItems:"center",
justifyContent:"center",
margin:"0 auto 20px"
}}

>

<item.icon
size={28}
color="#E63946"
/>

</div>
'''


new = '''
<item.icon
size={28}
color="#E63946"
/>
'''


text = text.replace(old,new)


# jika ukuran icon berbeda
text = text.replace(
'''
<div

style={{
width:"48px",
height:"48px",
borderRadius:"14px",
background:"#FFE8E8",
display:"flex",
alignItems:"center",
justifyContent:"center"
}}

>

<item.icon
size={28}
color="#E63946"
/>

</div>
''',
new
)


# card tetap putih dan compact
text = text.replace(
'background:"#FFE8E8",\npadding:"30px"',
'background:"#FFFFFF",\npadding:"22px 24px"'
)


p.write_text(text)

print("Clean pink icon applied")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Clean Services icons without background" || true

git push origin main || true


firebase deploy --only hosting


echo "=============================================="
echo " SERVICES ICON CLEAN COMPLETE"
echo " Backup:"
echo " backup/services-icon-clean-$STAMP"
echo "=============================================="

