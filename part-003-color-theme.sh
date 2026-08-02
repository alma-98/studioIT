#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 003 - COLOR THEME"
echo "========================================"

mkdir -p src/theme
mkdir -p src/styles

########################################
# PALETTE
########################################

cat > src/theme/palette.ts <<'EOT'
const palette = {
  rose50: "#FFE8E8",
  red500: "#E63946",
  red400: "#FF6B6B",
  orange400: "#F4A261",
  gray800: "#1F2937",
  gray700: "#374151",
  white: "#FFFFFF",
};

export default palette;
EOT

########################################
# SEMANTIC COLOR
########################################

cat > src/theme/semantic.ts <<'EOT'
import palette from "./palette";

const semantic = {
  background: palette.rose50,
  primary: palette.red500,
  secondary: palette.red400,
  accent: palette.orange400,
  surface: palette.white,
  text: palette.gray700,
  heading: palette.gray800,
  border: "#E5E7EB",
  success: "#16A34A",
  warning: "#F59E0B",
  danger: "#DC2626",
};

export default semantic;
EOT

########################################
# COLORS
########################################

cat > src/theme/colors.ts <<'EOT'
import palette from "./palette";
import semantic from "./semantic";

export { palette, semantic };

const colors = {
  ...palette,
  ...semantic,
};

export default colors;
EOT

########################################
# UPDATE THEME INDEX
########################################

cat > src/theme/index.ts <<'EOT'
export { default as colors } from "./colors";
export { default as palette } from "./palette";
export { default as semantic } from "./semantic";
export { default as typography } from "./typography";

export * from "./spacing";
export * from "./radius";
export * from "./shadow";
export * from "./breakpoints";

export { default as StudioThemeProvider } from "./provider";
EOT

########################################
# VARIABLES.CSS
########################################

cat > src/styles/variables.css <<'EOT'
:root{

--background:#FFE8E8;
--primary:#E63946;
--secondary:#FF6B6B;
--accent:#F4A261;

--text:#374151;
--heading:#1F2937;

--surface:#FFFFFF;
--border:#E5E7EB;

--success:#16A34A;
--warning:#F59E0B;
--danger:#DC2626;

}
EOT

########################################
# COLORS.CSS
########################################

cat > src/styles/colors.css <<'EOT'
.bg-background{background:var(--background);}
.bg-primary{background:var(--primary);}
.bg-secondary{background:var(--secondary);}
.bg-accent{background:var(--accent);}
.bg-surface{background:var(--surface);}

.text-heading{color:var(--heading);}
.text-body{color:var(--text);}
.text-primary{color:var(--primary);}
.text-secondary{color:var(--secondary);}
.text-accent{color:var(--accent);}

.border-default{
border:1px solid var(--border);
}
EOT

########################################
# THEME.CSS
########################################

cat > src/styles/theme.css <<'EOT'
html,
body,
#root{
margin:0;
padding:0;
min-height:100%;
background:var(--background);
color:var(--text);
}

*{
box-sizing:border-box;
}

body{
font-family:Inter,sans-serif;
}

h1,h2,h3,h4,h5,h6{
color:var(--heading);
}
EOT

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

git commit -m "Part 003 - Color Theme" || true

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 003 SELESAI"
echo "========================================"

