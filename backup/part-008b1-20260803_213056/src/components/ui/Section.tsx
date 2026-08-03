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
