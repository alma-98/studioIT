#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 002A - DESIGN SYSTEM"
echo "========================================"

mkdir -p src/theme
mkdir -p src/components/ui

########################################
# COLORS
########################################

cat > src/theme/colors.ts <<'EOT'
export const colors = {
  background: "#FFE8E8",
  primary: "#E63946",
  secondary: "#FF6B6B",
  accent: "#F4A261",
  dark: "#1F2937",
  text: "#374151",
  white: "#FFFFFF",
};

export default colors;
EOT

########################################
# TYPOGRAPHY
########################################

cat > src/theme/typography.ts <<'EOT'
export const typography = {
  heading: "Poppins",
  body: "Inter",

  h1: "64px",
  h2: "48px",
  h3: "36px",
  h4: "28px",
  h5: "22px",

  bodyLarge: "20px",
  body: "16px",
  small: "14px",
};
EOT

########################################
# SPACING
########################################

cat > src/theme/spacing.ts <<'EOT'
export const spacing = {
  xs:4,
  sm:8,
  md:16,
  lg:24,
  xl:32,
  xxl:48,
  section:96
};
EOT

########################################
# RADIUS
########################################

cat > src/theme/radius.ts <<'EOT'
export const radius={
sm:6,
md:10,
lg:16,
xl:24,
full:9999
};
EOT

########################################
# SHADOW
########################################

cat > src/theme/shadow.ts <<'EOT'
export const shadow={
sm:"0 2px 4px rgba(0,0,0,.08)",
md:"0 8px 20px rgba(0,0,0,.10)",
lg:"0 20px 40px rgba(0,0,0,.15)"
};
EOT

########################################
# BREAKPOINTS
########################################

cat > src/theme/breakpoints.ts <<'EOT'
export const breakpoints={
sm:640,
md:768,
lg:1024,
xl:1280,
xxl:1536
};
EOT

########################################
# INDEX
########################################

cat > src/theme/index.ts <<'EOT'
export * from "./colors";
export * from "./typography";
export * from "./spacing";
export * from "./radius";
export * from "./shadow";
export * from "./breakpoints";
EOT

########################################
# BUTTON
########################################

cat > src/components/ui/Button.tsx <<'EOT'
import { colors } from "../../theme";

type Props={
children:React.ReactNode;
};

export default function Button({children}:Props){

return(

<button
style={{
background:colors.primary,
color:"#fff",
border:"none",
padding:"14px 28px",
borderRadius:10,
cursor:"pointer",
fontWeight:600
}}
>

{children}

</button>

);

}
EOT

########################################
# CARD
########################################

cat > src/components/ui/Card.tsx <<'EOT'
type Props={
children:React.ReactNode;
};

export default function Card({children}:Props){

return(

<div
style={{
background:"#fff",
borderRadius:16,
padding:24,
boxShadow:"0 10px 25px rgba(0,0,0,.08)"
}}
>

{children}

</div>

);

}
EOT

########################################
# BUILD
########################################

npm run build

########################################
# GIT
########################################

git add .

git commit -m "Part 002A - Design System"

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 002A SELESAI"
echo "========================================"

