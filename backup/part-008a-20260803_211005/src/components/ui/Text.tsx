import type { ReactNode } from "react";
import typography from "../../theme/typography";

type Props={
  children:ReactNode;
};

export default function Text({children}:Props){

  return(
    <p
      style={{
        fontFamily:typography.fontFamily.body,
        fontSize:typography.fontSize.md,
        fontWeight:typography.fontWeight.regular,
        lineHeight:typography.lineHeight.normal
      }}
    >
      {children}
    </p>
  );

}
