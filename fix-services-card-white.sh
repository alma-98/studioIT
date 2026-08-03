#!/bin/bash

set -e

echo "=============================================="
echo " SERVICES WHITE STACK CARD"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-white-card-$STAMP

cp src/pages/Services/index.tsx backup/services-white-card-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


old = '''
{

services.map(item=>(

<div

key={item.name}

'''

new = '''
{

services.map(item=>(

<div

key={item.name}

style={{
background:"#FFFFFF",
padding:"22px 24px",
borderRadius:"16px",
boxShadow:"0 8px 25px rgba(0,0,0,0.08)",
display:"flex",
alignItems:"center",
gap:"18px"
}}

'''

text=text.replace(old,new)


# tambah icon container jika belum ada
text=text.replace(
'''
<item.icon
size={30}
color="#E63946"
/>
''',
'''
<item.icon
size={28}
color="#E63946"
/>
'''
)


p.write_text(text)

print("White service cards updated")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Create white stacked service cards" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES WHITE CARD COMPLETE"
echo " Backup:"
echo " backup/services-white-card-$STAMP"
echo "=============================================="

