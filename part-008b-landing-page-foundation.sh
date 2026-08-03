#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT PART 008B"
echo " Landing Page Professional Foundation"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

echo "[1/10] Backup..."
mkdir -p backup/part-008b-$STAMP
cp -R src backup/part-008b-$STAMP/src


echo "[2/10] Create Landing Structure..."

mkdir -p src/pages/Landing/components


echo "[3/10] Create Landing Sections..."

create_section(){

FILE=$1
TITLE=$2
DESC=$3

cat <<EOF2 > src/pages/Landing/components/$FILE.tsx
export default function $FILE(){

return(

<section
style={{
padding:"80px 24px",
textAlign:"center"
}}
>

<h2>
$TITLE
</h2>

<p>
$DESC
</p>

</section>

)

}
EOF2

}


create_section Hero \
"Transformasi Digital Untuk Indonesia Maju" \
"StudioIT menyediakan solusi teknologi modern untuk website, aplikasi, AI, dan sistem digital bisnis."


create_section About \
"Tentang StudioIT" \
"Software House dan Digital Agency yang membantu bisnis melakukan transformasi digital."


create_section ServicesPreview \
"Layanan StudioIT" \
"Website Development, Mobile Apps, AI, ERP, CRM, Cloud Solution dan layanan teknologi lainnya."


create_section WhyChooseUs \
"Mengapa Memilih StudioIT" \
"Tim profesional, teknologi modern, solusi scalable, dan dukungan berkelanjutan."


create_section PortfolioPreview \
"Portfolio Project" \
"Lihat berbagai project teknologi yang telah dikembangkan."


create_section Technology \
"Teknologi Kami" \
"React, TypeScript, Firebase, AI, Cloud dan teknologi modern."


create_section Testimonial \
"Testimoni Client" \
"Kepercayaan client adalah prioritas StudioIT."


create_section FAQ \
"Frequently Asked Questions" \
"Pertanyaan umum mengenai layanan StudioIT."


create_section CTA \
"Siap Transformasi Digital?" \
"Mulai project teknologi Anda bersama StudioIT."


echo "[4/10] Create Landing Page..."

cat <<'PAGE' > src/pages/Landing/LandingPage.tsx

import Hero from "./components/Hero";
import About from "./components/About";
import ServicesPreview from "./components/ServicesPreview";
import WhyChooseUs from "./components/WhyChooseUs";
import PortfolioPreview from "./components/PortfolioPreview";
import Technology from "./components/Technology";
import Testimonial from "./components/Testimonial";
import FAQ from "./components/FAQ";
import CTA from "./components/CTA";


export default function LandingPage(){

return(

<>

<Hero/>

<About/>

<ServicesPreview/>

<WhyChooseUs/>

<PortfolioPreview/>

<Technology/>

<Testimonial/>

<FAQ/>

<CTA/>

</>

)

}

PAGE


echo "[5/10] Update Home Redirect..."

cat <<'HOME' > src/pages/Home/index.tsx

import LandingPage 
from "../Landing/LandingPage";


export default function Home(){

return <LandingPage/>

}

HOME


echo "[6/10] Update Router..."

python3 <<'PY'
from pathlib import Path

p=Path("src/routes/AppRouter.tsx")

text=p.read_text()

text=text.replace(
'import Home from "../pages/Home";',
'import Home from "../pages/Home";'
)

p.write_text(text)

print("Router checked")
PY


echo "[7/10] Build..."

npm run build


echo "[8/10] Git Commit..."

git add .

git commit -m "PART 008B Landing Page Professional Foundation" || true


echo "[9/10] Push..."

git push origin main || true


echo "[10/10] Firebase Deploy..."

firebase deploy --only hosting || true


echo "=============================================="
echo " PART 008B COMPLETE"
echo " Backup:"
echo " backup/part-008b-$STAMP"
echo "=============================================="

