#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 002C - THEME PROVIDER"
echo "========================================"

mkdir -p src/theme
mkdir -p src/context

########################################
# THEME CONTEXT
########################################

cat > src/context/ThemeContext.tsx <<'EOT'
import {
  createContext,
  useContext,
  useMemo,
  useState,
  type ReactNode,
} from "react";

type ThemeMode = "light";

type ThemeContextType = {
  mode: ThemeMode;
  toggleTheme: () => void;
};

const ThemeContext = createContext<ThemeContextType>({
  mode: "light",
  toggleTheme: () => {},
});

export function ThemeProvider({
  children,
}: {
  children: ReactNode;
}) {
  const [mode] = useState<ThemeMode>("light");

  const value = useMemo(
    () => ({
      mode,
      toggleTheme: () => {},
    }),
    [mode]
  );

  return (
    <ThemeContext.Provider value={value}>
      {children}
    </ThemeContext.Provider>
  );
}

export function useTheme() {
  return useContext(ThemeContext);
}
EOT

########################################
# THEME PROVIDER
########################################

cat > src/theme/provider.tsx <<'EOT'
import type { ReactNode } from "react";
import { ThemeProvider } from "../context/ThemeContext";

export default function StudioThemeProvider({
  children,
}: {
  children: ReactNode;
}) {
  return (
    <ThemeProvider>
      {children}
    </ThemeProvider>
  );
}
EOT

########################################
# THEME INDEX
########################################

cat > src/theme/index.ts <<'EOT'
export { default as colors } from "./colors";
export { default as typography } from "./typography";

export * from "./spacing";
export * from "./radius";
export * from "./shadow";
export * from "./breakpoints";

export { default as StudioThemeProvider } from "./provider";
EOT

########################################
# UPDATE MAIN.TSX
########################################

cat > src/main.tsx <<'EOT'
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";

import "./styles/global.css";
import "./styles/variables.css";
import "./styles/colors.css";
import "./styles/theme.css";

import App from "./App";
import { StudioThemeProvider } from "./theme";

createRoot(
  document.getElementById("root")!
).render(
  <StrictMode>
    <StudioThemeProvider>
      <App />
    </StudioThemeProvider>
  </StrictMode>
);
EOT

########################################
# BUILD
########################################

echo ""
echo "Running build..."

npm run build

########################################
# GIT
########################################

git add .

git commit -m "Part 002C - Theme Provider" || true

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 002C SELESAI"
echo "========================================"

