import type { ReactNode } from "react";
import typography from "../../theme/typography";

type Props={
  children:ReactNode;
};

export default function Heading({children}:Props){

  return(
    <h2
      style={{
        fontFamily:typography.fontFamily.heading,
        fontSize:typography.fontSize.h2,
        fontWeight:typography.fontWeight.bold
      }}
    >
      {children}
    </h2>
  );

}
