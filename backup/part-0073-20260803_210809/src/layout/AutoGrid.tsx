import type { ReactNode } from "react";

type Size = "sm" | "md" | "lg";

interface AutoGridProps{
    children:ReactNode;
    size?:Size;
    className?:string;
}

export default function AutoGrid({
    children,
    size="md",
    className=""
}:AutoGridProps){

    const gridClass =
        size==="sm"
        ? "auto-grid-sm"
        : size==="lg"
        ? "auto-grid-lg"
        : "auto-grid";

    return(
        <div className={`${gridClass} ${className}`}>
            {children}
        </div>
    );
}
