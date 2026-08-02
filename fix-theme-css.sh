#!/bin/bash

set -e

mkdir -p src/styles

########################################
# variables.css
########################################

cat > src/styles/variables.css <<'EOT'
:root{
  --color-background:#FFE8E8;
  --color-primary:#E63946;
  --color-secondary:#FF6B6B;
  --color-accent:#F4A261;
  --color-dark:#1F2937;
  --color-text:#374151;
  --color-white:#FFFFFF;
}
EOT

########################################
# colors.css
########################################

cat > src/styles/colors.css <<'EOT'
.bg-primary{background:var(--color-primary);}
.bg-secondary{background:var(--color-secondary);}
.bg-accent{background:var(--color-accent);}
.bg-background{background:var(--color-background);}

.text-primary{color:var(--color-primary);}
.text-dark{color:var(--color-dark);}
.text-body{color:var(--color-text);}
.text-white{color:var(--color-white);}
EOT

########################################
# theme.css (buat jika belum ada)
########################################

if [ ! -f src/styles/theme.css ]; then
cat > src/styles/theme.css <<'EOT'
html,
body,
#root{
  background:var(--color-background);
  color:var(--color-text);
  min-height:100%;
}

*{
  box-sizing:border-box;
}
EOT
fi

echo "======================================"
echo "Theme CSS dibuat"
echo "======================================"

npm run build

git add .

git commit -m "Fix Theme CSS" || true

git push

firebase deploy

echo ""
echo "======================================"
echo "FIX SELESAI"
echo "======================================"

