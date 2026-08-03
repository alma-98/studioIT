#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES ICON LIST"
echo " Replace Service Description With Icons"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-icon-list-$STAMP

cp src/pages/Services/index.tsx \
backup/services-icon-list-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


# Tambahkan import icon jika belum ada
if 'lucide-react' not in text:
    text = text.replace(
        'import {',
        'import {\nGlobe,\nSmartphone,\nBrainCircuit,\nBuilding2,\nCloud,'
    )


old_array_start = text.find("const services=[")

old_array_end = text.find("];", old_array_start)


if old_array_start != -1 and old_array_end != -1:

    new_array = '''
const services=[

{
name:"Website Development",
icon:Globe
},

{
name:"Mobile Application",
icon:Smartphone
},

{
name:"Artificial Intelligence",
icon:BrainCircuit
},

{
name:"Enterprise System",
icon:Building2
},

{
name:"Cloud Infrastructure",
icon:Cloud
}

];
'''

    text = (
        text[:old_array_start]
        +
        new_array
        +
        text[old_array_end+2:]
    )


# Ganti isi map card
old_map = """

<h3

style={{
fontFamily:"Poppins"
}}

>

{item}

</h3>


<p

style={{
color:"#374151"
}}

>

Solusi teknologi modern untuk mendukung kebutuhan bisnis.

</p>

"""


new_map = """

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
size={30}
color="#E63946"
/>

</div>


<h3

style={{
fontFamily:"Poppins"
}}

>

{item.name}

</h3>

"""


text = text.replace(old_map,new_map)


p.write_text(text)

print("Service icon list updated")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Update Services cards with icons only" || true

git push origin main || true


firebase deploy --only hosting


echo "=============================================="
echo " SERVICES ICON LIST COMPLETE"
echo " Backup:"
echo " backup/services-icon-list-$STAMP"
echo "=============================================="

