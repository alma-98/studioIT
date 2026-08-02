#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 001 - FOUNDATION ARCHITECTURE"
echo "========================================"

echo ""
echo "Creating folder structure..."

mkdir -p src/assets
mkdir -p src/components/common
mkdir -p src/components/layout
mkdir -p src/components/ui

mkdir -p src/layouts

mkdir -p src/pages/Home
mkdir -p src/pages/About
mkdir -p src/pages/Services
mkdir -p src/pages/Portfolio
mkdir -p src/pages/Pricing
mkdir -p src/pages/Blog
mkdir -p src/pages/Contact
mkdir -p src/pages/Login
mkdir -p src/pages/Register

mkdir -p src/routes
mkdir -p src/firebase
mkdir -p src/services
mkdir -p src/hooks
mkdir -p src/context
mkdir -p src/constants
mkdir -p src/utils
mkdir -p src/styles
mkdir -p src/types

echo "Creating constants..."

cat > src/constants/theme.ts <<'EOT'
export const Theme = {
  colors: {
    background: "#FFE8E8",
    primary: "#E63946",
    secondary: "#FF6B6B",
    accent: "#F4A261",
    dark: "#1F2937",
    text: "#374151",
    white: "#FFFFFF"
  },
  font: {
    heading: "Poppins",
    body: "Inter"
  }
};
EOT

echo "Creating MainLayout..."

cat > src/layouts/MainLayout.tsx <<'EOT'
import { Outlet } from "react-router-dom";

export default function MainLayout() {
  return (
    <div
      style={{
        minHeight: "100vh",
        background: "#FFE8E8"
      }}
    >
      <Outlet />
    </div>
  );
}
EOT

echo "Creating Home Page..."

cat > src/pages/Home/index.tsx <<'EOT'
export default function Home() {
  return (
    <div
      style={{
        minHeight: "100vh",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        flexDirection: "column"
      }}
    >
      <h1>StudioIT</h1>

      <p>Transformasi Digital Untuk Indonesia Maju</p>
    </div>
  );
}
EOT

echo "Creating Router..."

cat > src/routes/AppRouter.tsx <<'EOT'
import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";

import MainLayout from "../layouts/MainLayout";
import Home from "../pages/Home";

export default function AppRouter(){

return(

<BrowserRouter>

<Routes>

<Route element={<MainLayout/>}>

<Route
path="/"
element={<Home/>}
/>

</Route>

</Routes>

</BrowserRouter>

);

}
EOT

echo "Updating App.tsx..."

cat > src/App.tsx <<'EOT'
import AppRouter from "./routes/AppRouter";

export default function App() {
  return <AppRouter />;
}
EOT

echo "Creating global style..."

cat > src/styles/global.css <<'EOT'
@import "tailwindcss";

html,
body,
#root{
margin:0;
padding:0;
width:100%;
min-height:100%;
font-family:Inter,sans-serif;
background:#FFE8E8;
}

*{
box-sizing:border-box;
}
EOT

echo "Updating main.tsx..."

cat > src/main.tsx <<'EOT'
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";

import "./styles/global.css";

import App from "./App";

createRoot(
document.getElementById("root")!
).render(

<StrictMode>

<App/>

</StrictMode>

);
EOT

echo ""
echo "Running Build..."

npm run build

echo ""
echo "Git Add..."

git add .

git commit -m "Part 001 - Foundation Architecture" || true

echo ""
echo "Git Push..."

git push

echo ""
echo "Firebase Deploy..."

firebase deploy

echo ""
echo "========================================"
echo " PART 001 SELESAI"
echo "========================================"

