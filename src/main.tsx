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
