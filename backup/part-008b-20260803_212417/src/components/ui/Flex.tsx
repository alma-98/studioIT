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
