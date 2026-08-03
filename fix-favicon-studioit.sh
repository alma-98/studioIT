#!/usr/bin/env bash
set -e

echo "=============================================="
echo " StudioIT FIX FAVICON"
echo " Text: StudioIT"
echo "=============================================="

cat <<'SVG' > public/favicon.svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">

<rect
width="512"
height="512"
rx="80"
fill="#E63946"
/>

<text
x="256"
y="285"
text-anchor="middle"
font-family="Arial, Helvetica, sans-serif"
font-size="92"
font-weight="700"
fill="#FFFFFF"
>
StudioIT
</text>

</svg>
SVG


echo "[1/3] Update index.html favicon..."

python3 <<'PY'
from pathlib import Path

p = Path("index.html")

if p.exists():
    text = p.read_text()

    if "favicon.svg" not in text:
        text = text.replace(
            "</head>",
            '<link rel="icon" type="image/svg+xml" href="/favicon.svg" />\n</head>'
        )

    p.write_text(text)

print("favicon linked")
PY


echo "[2/3] Build..."

npm run build


echo "[3/3] Deploy..."

git add public/favicon.svg index.html

git commit -m "Update StudioIT favicon branding" || true

git push origin main || true

firebase deploy --only hosting || true


echo "=============================================="
echo " FAVICON UPDATE COMPLETE"
echo " StudioIT favicon active"
echo "=============================================="
