#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 007.1 - REACT ROUTER ACTIVATION"
echo "========================================"

echo ""
echo "Checking project..."

if [ ! -f "src/main.tsx" ]; then
    echo "ERROR: src/main.tsx tidak ditemukan."
    exit 1
fi

if [ ! -f "src/routes/AppRouter.tsx" ]; then
    echo "ERROR: src/routes/AppRouter.tsx tidak ditemukan."
    exit 1
fi

mkdir -p backup

cp src/main.tsx backup/main.tsx.$(date +%Y%m%d_%H%M%S)

echo ""
echo "Updating main.tsx..."

cat > src/main.tsx <<'TS'
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";

import "./styles/global.css";
import "./styles/variables.css";
import "./styles/colors.css";
import "./styles/theme.css";
import "./styles/typography.css";
import "./styles/layout.css";
import "./styles/utilities.css";
import "./styles/breakpoints.css";
import "./styles/animations.css";
import "./styles/accessibility.css";
import "./styles/print.css";

import AppRouter from "./routes/AppRouter";
import { StudioThemeProvider } from "./theme";

createRoot(
  document.getElementById("root")!
).render(
  <StrictMode>
    <StudioThemeProvider>
      <AppRouter />
    </StudioThemeProvider>
  </StrictMode>
);
TS

echo ""
echo "========================================"
echo "Running Build..."
echo "========================================"

npm run build

echo ""
echo "========================================"
echo "Git Commit"
echo "========================================"

git add .

git commit -m "PART 007.1 - React Router Activation" || echo "Tidak ada perubahan"

echo ""
echo "========================================"
echo "Push Github"
echo "========================================"

git push

echo ""
echo "========================================"
echo "Deploy Firebase"
echo "========================================"

firebase deploy --only hosting

echo ""
echo "========================================"
echo "PART 007.1 SELESAI"
echo "========================================"

