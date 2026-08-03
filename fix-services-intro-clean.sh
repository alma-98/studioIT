#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES INTRO CLEAN"
echo " Remove Service List From Intro"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-intro-clean-$STAMP

cp src/pages/Services/index.tsx \
backup/services-intro-clean-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


# Ganti bagian heading Layanan StudioIT menjadi Layanan Kami
text = text.replace(
"Layanan StudioIT",
"Layanan Kami"
)


# Hapus daftar capability pada hero jika masih ada
remove_blocks = [
"Website Development",
"Mobile Application",
"Artificial Intelligence",
"Enterprise System",
"Cloud Infrastructure"
]


# Hapus blok array/list visual kanan
start = text.find("<h2")
end = text.find("</div>", start)

if start != -1:
    section = text[start:end]

    if any(item in section for item in remove_blocks):
        text = text.replace(section, "")


# Update deskripsi intro
old_text = """
Solusi teknologi modern untuk membantu bisnis berkembang
melalui software, aplikasi, AI, cloud, dan sistem digital
"""

new_text = """
Solusi teknologi modern untuk membantu bisnis berkembang
melalui software, aplikasi, AI, cloud, dan sistem digital
yang dirancang untuk meningkatkan efisiensi, inovasi,
serta pertumbuhan bisnis.
"""

text = text.replace(old_text, new_text)


p.write_text(text)

print("Services intro cleaned")

PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Services/index.tsx

git commit -m "Clean Services intro section" || true

git push origin main || true


echo "[3/3] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES INTRO CLEAN COMPLETE"
echo " Backup:"
echo " backup/services-intro-clean-$STAMP"
echo "=============================================="

