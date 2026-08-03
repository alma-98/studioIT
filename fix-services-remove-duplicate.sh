#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT SERVICES CLEAN DUPLICATE"
echo " Remove Solusi Teknologi Kami Section"
echo " Keep Hero"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-clean-$STAMP

cp src/pages/Services/index.tsx \
backup/services-clean-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


start = text.find("Solusi Teknologi Kami")


if start != -1:

    # cari section penutup setelah bagian tersebut
    section_start = text.rfind("<section",0,start)

    section_end = text.find("</section>", start)

    if section_start != -1 and section_end != -1:

        text = (
            text[:section_start]
            +
            text[section_end+10:]
        )

else:
    print("Solusi Teknologi Kami tidak ditemukan")


p.write_text(text)

print("Duplicate section removed")

PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Services/index.tsx

git commit -m "Remove duplicate Services technology section" || true

git push origin main || true


echo "[3/3] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES CLEAN COMPLETE"
echo " Backup:"
echo " backup/services-clean-$STAMP"
echo "=============================================="

