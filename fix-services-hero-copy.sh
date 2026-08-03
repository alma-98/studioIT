#!/bin/bash

set -e

echo "=============================================="
echo " StudioIT UPDATE SERVICES HERO COPY"
echo " Option 3 Premium Copy"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-copy-$STAMP

cp src/pages/Services/index.tsx \
backup/services-copy-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


text = text.replace(
"Solusi Teknologi Digital<br/>Untuk Bisnis Modern",
"Solusi Digital Inovatif Untuk Pertumbuhan Bisnis"
)


text = text.replace(
"StudioIT menyediakan layanan pengembangan teknologi\nmulai dari website, aplikasi mobile, sistem enterprise,\nAI, cloud, hingga integrasi digital untuk membantu bisnis\nmelakukan transformasi digital.",
"StudioIT membangun teknologi modern mulai dari aplikasi,\nplatform digital, AI, hingga cloud solution untuk membantu\nbisnis berkembang di era digital."
)


text = text.replace(
"Solusi Teknologi Digital\nUntuk Bisnis Modern",
"Solusi Digital Inovatif Untuk Pertumbuhan Bisnis"
)


text = text.replace(
"StudioIT menyediakan layanan pengembangan teknologi\nmulai dari website, aplikasi mobile, sistem enterprise,\nAI, cloud, hingga integrasi digital untuk membantu bisnis\nmelakukan transformasi digital.",
"StudioIT membangun teknologi modern mulai dari aplikasi,\nplatform digital, AI, hingga cloud solution untuk membantu\nbisnis berkembang di era digital."
)


p.write_text(text)

print("Services hero copy updated")
PY


echo "[1/3] Build..."

npm run build


echo "[2/3] Commit..."

git add src/pages/Services/index.tsx

git commit -m "Update Services hero premium copy" || true

git push origin main || true


echo "[3/3] Deploy..."

firebase deploy --only hosting


echo "=============================================="
echo " SERVICES HERO COPY COMPLETE"
echo " Backup:"
echo " backup/services-copy-$STAMP"
echo "=============================================="

