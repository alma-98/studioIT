#!/bin/bash

set -e

echo "=============================================="
echo " FIX PART 008B.2"
echo " Header + SMS Cleanup"
echo "=============================================="


echo "[1/4] Remove duplicate SMS..."

python3 <<'PY'
from pathlib import Path

p=Path("src/layout/MainLayout.tsx")

text=p.read_text()

text=text.replace(
'import PopupSMS from "../components/sms/PopupSMS";',
''
)

text=text.replace(
'<PopupSMS/>',
''
)

p.write_text(text)

print("PopupSMS removed")
PY



echo "[2/4] Upgrade Navbar..."


cat <<'NAV' > src/components/layout/Navbar.tsx

import { Link } from "react-router-dom";


export default function Navbar(){

return(

<header
style={{
position:"sticky",
top:0,
zIndex:1000,
background:"#FFFFFF",
boxShadow:"0 4px 15px rgba(0,0,0,.08)"
}}
>


<nav
style={{
height:"72px",
display:"flex",
alignItems:"center",
justifyContent:"space-between",
padding:"0 32px"
}}
>


<div>

<h2
style={{
fontFamily:"Poppins",
color:"#E63946",
margin:0
}}
>
StudioIT
</h2>

</div>



<div
style={{
display:"flex",
gap:"24px",
alignItems:"center"
}}
>


<Link to="/">
Home
</Link>


<Link to="/services">
Services
</Link>


<Link to="/portfolio">
Portfolio
</Link>


<Link to="/pricing">
Pricing
</Link>


<Link to="/blog">
Blog
</Link>


<Link to="/contact">
Contact
</Link>



<button
style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"12px 22px",
borderRadius:"10px",
cursor:"pointer"
}}
>

Mulai Project

</button>


</div>


</nav>


</header>

)

}

NAV



echo "[3/4] Build..."

npm run build



echo "[4/4] Commit Deploy..."

git add .

git commit -m "Fix StudioIT header and remove duplicate SMS" || true

git push origin main || true

firebase deploy --only hosting


echo "=============================================="
echo " FIX COMPLETE"
echo "=============================================="

