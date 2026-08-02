#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 004 - TYPOGRAPHY"
echo "========================================"

mkdir -p src/theme
mkdir -p src/styles
mkdir -p src/components/ui

########################################
# TYPOGRAPHY TOKEN
########################################

cat > src/theme/typography.ts <<'EOT'
const typography = {

  fontFamily: {
    logo: "Poppins, sans-serif",
    heading: "Poppins, sans-serif",
    menu: "Poppins, sans-serif",
    button: "Poppins, sans-serif",
    card: "Poppins, sans-serif",
    body: "Inter, sans-serif",
    dashboard: "Inter, sans-serif",
    form: "Inter, sans-serif",
    table: "Inter, sans-serif",
  },

  fontSize: {
    h1: "64px",
    h2: "48px",
    h3: "36px",
    h4: "30px",
    h5: "24px",
    h6: "20px",

    xl: "20px",
    lg: "18px",
    md: "16px",
    sm: "14px",
    xs: "12px",
  },

  fontWeight: {
    light:300,
    regular:400,
    medium:500,
    semibold:600,
    bold:700,
    extrabold:800
  },

  lineHeight:{
    tight:1.2,
    normal:1.5,
    relaxed:1.8
  }

};

export default typography;
EOT

########################################
# TYPOGRAPHY CSS
########################################

cat > src/styles/typography.css <<'EOT'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@300;400;500;600;700;800&display=swap');

body{
    font-family:'Inter',sans-serif;
    font-size:16px;
    line-height:1.5;
}

.logo,
.navbar,
.menu,
.heading,
button,
.btn,
.card-title,
h1,h2,h3,h4,h5,h6{
    font-family:'Poppins',sans-serif;
}

.table,
input,
textarea,
select{
    font-family:'Inter',sans-serif;
}
EOT

########################################
# TEXT COMPONENT
########################################

cat > src/components/ui/Text.tsx <<'EOT'
import type { ReactNode } from "react";
import typography from "../../theme/typography";

type Props={
  children:ReactNode;
};

export default function Text({children}:Props){

  return(
    <p
      style={{
        fontFamily:typography.fontFamily.body,
        fontSize:typography.fontSize.md,
        fontWeight:typography.fontWeight.regular,
        lineHeight:typography.lineHeight.normal
      }}
    >
      {children}
    </p>
  );

}
EOT

########################################
# HEADING COMPONENT
########################################

cat > src/components/ui/Heading.tsx <<'EOT'
import type { ReactNode } from "react";
import typography from "../../theme/typography";

type Props={
  children:ReactNode;
};

export default function Heading({children}:Props){

  return(
    <h2
      style={{
        fontFamily:typography.fontFamily.heading,
        fontSize:typography.fontSize.h2,
        fontWeight:typography.fontWeight.bold
      }}
    >
      {children}
    </h2>
  );

}
EOT

########################################
# UPDATE MAIN
########################################

if ! grep -q 'typography.css' src/main.tsx; then
  python3 - <<'PY'
from pathlib import Path

p = Path("src/main.tsx")
text = p.read_text()

anchor = 'import "./styles/theme.css";'

if anchor in text:
    text = text.replace(anchor, anchor + '\nimport "./styles/typography.css";')

p.write_text(text)
PY
fi

########################################
# BUILD
########################################

echo ""
echo "Running Build..."

npm run build

########################################
# GIT
########################################

git add .

git commit -m "Part 004 - Typography" || true

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 004 SELESAI"
echo "========================================"

