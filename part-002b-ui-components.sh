#!/bin/bash

set -e

echo "========================================"
echo " StudioIT v1.0"
echo " PART 002B - UI COMPONENTS"
echo "========================================"

mkdir -p src/components/ui

########################################
# CONTAINER
########################################

cat > src/components/ui/Container.tsx <<'EOT'
import type { ReactNode } from "react";

type Props = {
  children: ReactNode;
};

export default function Container({ children }: Props) {
  return (
    <div
      style={{
        width: "100%",
        maxWidth: "1280px",
        margin: "0 auto",
        padding: "0 24px",
      }}
    >
      {children}
    </div>
  );
}
EOT

########################################
# SECTION
########################################

cat > src/components/ui/Section.tsx <<'EOT'
import type { ReactNode } from "react";

type Props = {
  children: ReactNode;
};

export default function Section({ children }: Props) {
  return (
    <section
      style={{
        padding: "80px 0",
      }}
    >
      {children}
    </section>
  );
}
EOT

########################################
# HEADING
########################################

cat > src/components/ui/Heading.tsx <<'EOT'
import type { ReactNode } from "react";
import typography from "../../theme/typography";

type Props = {
  children: ReactNode;
};

export default function Heading({ children }: Props) {
  return (
    <h2
      style={{
        fontFamily: typography.fontFamily.heading,
        fontSize: typography.fontSize.h2,
        fontWeight: typography.fontWeight.bold,
        marginBottom: "20px",
      }}
    >
      {children}
    </h2>
  );
}
EOT

########################################
# TEXT
########################################

cat > src/components/ui/Text.tsx <<'EOT'
import type { ReactNode } from "react";
import typography from "../../theme/typography";

type Props = {
  children: ReactNode;
};

export default function Text({ children }: Props) {
  return (
    <p
      style={{
        fontFamily: typography.fontFamily.body,
        fontSize: typography.fontSize.md,
        lineHeight: typography.lineHeight.normal,
      }}
    >
      {children}
    </p>
  );
}
EOT

########################################
# BADGE
########################################

cat > src/components/ui/Badge.tsx <<'EOT'
import type { ReactNode } from "react";
import colors from "../../theme/colors";

type Props = {
  children: ReactNode;
};

export default function Badge({ children }: Props) {
  return (
    <span
      style={{
        background: colors.primary,
        color: colors.white,
        padding: "6px 12px",
        borderRadius: "999px",
        fontSize: "12px",
        fontWeight: 600,
      }}
    >
      {children}
    </span>
  );
}
EOT

########################################
# INPUT
########################################

cat > src/components/ui/Input.tsx <<'EOT'
import type { InputHTMLAttributes } from "react";

export default function Input(
  props: InputHTMLAttributes<HTMLInputElement>
) {
  return (
    <input
      {...props}
      style={{
        width: "100%",
        padding: "12px",
        borderRadius: "10px",
        border: "1px solid #ddd",
      }}
    />
  );
}
EOT

########################################
# TEXTAREA
########################################

cat > src/components/ui/Textarea.tsx <<'EOT'
import type { TextareaHTMLAttributes } from "react";

export default function Textarea(
  props: TextareaHTMLAttributes<HTMLTextAreaElement>
) {
  return (
    <textarea
      {...props}
      style={{
        width: "100%",
        minHeight: "140px",
        padding: "12px",
        borderRadius: "10px",
        border: "1px solid #ddd",
      }}
    />
  );
}
EOT

########################################
# SELECT
########################################

cat > src/components/ui/Select.tsx <<'EOT'
import type { SelectHTMLAttributes } from "react";

export default function Select(
  props: SelectHTMLAttributes<HTMLSelectElement>
) {
  return (
    <select
      {...props}
      style={{
        width: "100%",
        padding: "12px",
        borderRadius: "10px",
        border: "1px solid #ddd",
      }}
    />
  );
}
EOT

########################################
# GRID
########################################

cat > src/components/ui/Grid.tsx <<'EOT'
import type { ReactNode } from "react";

type Props = {
  children: ReactNode;
};

export default function Grid({ children }: Props) {
  return (
    <div
      style={{
        display: "grid",
        gap: "24px",
        gridTemplateColumns: "repeat(auto-fit,minmax(280px,1fr))",
      }}
    >
      {children}
    </div>
  );
}
EOT

########################################
# FLEX
########################################

cat > src/components/ui/Flex.tsx <<'EOT'
import type { ReactNode } from "react";

type Props = {
  children: ReactNode;
};

export default function Flex({ children }: Props) {
  return (
    <div
      style={{
        display: "flex",
        gap: "16px",
        alignItems: "center",
      }}
    >
      {children}
    </div>
  );
}
EOT

########################################
# INDEX EXPORT
########################################

cat > src/components/ui/index.ts <<'EOT'
export { default as Button } from "./Button";
export { default as Card } from "./Card";
export { default as Container } from "./Container";
export { default as Section } from "./Section";
export { default as Heading } from "./Heading";
export { default as Text } from "./Text";
export { default as Badge } from "./Badge";
export { default as Input } from "./Input";
export { default as Textarea } from "./Textarea";
export { default as Select } from "./Select";
export { default as Grid } from "./Grid";
export { default as Flex } from "./Flex";
EOT

########################################
# BUILD
########################################

echo "Running build..."
npm run build

########################################
# GIT
########################################

git add .

git commit -m "Part 002B - UI Components" || true

git push

########################################
# FIREBASE
########################################

firebase deploy

echo ""
echo "========================================"
echo " PART 002B SELESAI"
echo "========================================"

