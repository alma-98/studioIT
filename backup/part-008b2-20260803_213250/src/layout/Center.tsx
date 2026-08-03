import type { ReactNode } from "react";

interface CenterProps{
    children:ReactNode;
    column?:boolean;
    className?:string;
}

export default function Center({
    children,
    column=false,
    className=""
}:CenterProps){

    return(
        <div
            className={`${
                column ? "center-column" : "center"
            } ${className}`}
        >
            {children}
        </div>
    );
}
