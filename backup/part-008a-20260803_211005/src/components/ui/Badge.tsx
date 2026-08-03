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
