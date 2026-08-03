import type { ReactNode } from "react";

type GridColumns = 1 | 2 | 3 | 4 | 5 | 6 | "auto";

interface GridProps{
    children:ReactNode;
    cols?:GridColumns;
    gap?:"xs"|"sm"|"md"|"lg"|"xl";
    className?:string;
}

export default function Grid({
    children,
    cols=3,
    gap="md",
    className=""
}:GridProps){

    const gridClass =
        cols==="auto"
        ? "grid-auto"
        : `grid-${cols}`;

    return(
        <div
            className={`grid ${gridClass} grid-gap-${gap} ${className}`}
        >
            {children}
        </div>
    );

}
