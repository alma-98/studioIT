#!/bin/bash

set -e

echo "=============================================="
echo " FIX PART 008B.1"
echo " Create Route Placeholder Pages"
echo "=============================================="

echo "[1/4] Create Pages..."

create_page(){

DIR=$1
NAME=$2

mkdir -p src/pages/$DIR

cat <<EOF2 > src/pages/$DIR/index.tsx
export default function $NAME(){

return (

<section
style={{
padding:"80px 24px",
textAlign:"center"
}}
>

<h1>
$NAME
</h1>

<p>
StudioIT $NAME Page
</p>

</section>

)

}
EOF2

}


create_page Services Services
create_page Portfolio Portfolio
create_page Pricing Pricing
create_page Contact Contact
create_page Login Login
create_page Register Register
create_page Dashboard Dashboard
create_page Admin Admin
create_page FAQ FAQ
create_page Blog Blog


echo "[2/4] Create PopupSMS..."

cat <<'SMS' > src/components/sms/PopupSMS.tsx

export default function PopupSMS(){

return (

<div
style={{
position:"fixed",
bottom:"90px",
right:"24px",
background:"#FFFFFF",
padding:"12px 18px",
borderRadius:"12px",
boxShadow:"0 5px 20px rgba(0,0,0,.15)",
zIndex:9998
}}
>

<a
href="sms:+6285283397198"
style={{
color:"#E63946",
textDecoration:"none"
}}
>
SMS StudioIT
</a>

</div>

)

}

SMS


echo "[3/4] Build Test..."

npm run build


echo "[4/4] Commit..."

git add .

git commit -m "Fix PART 008B.1 route placeholder pages" || true

git push || true


echo "=============================================="
echo " FIX COMPLETE"
echo "=============================================="
