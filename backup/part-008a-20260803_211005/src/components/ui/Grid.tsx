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
