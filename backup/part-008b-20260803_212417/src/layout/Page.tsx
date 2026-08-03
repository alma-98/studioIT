import type { ReactNode } from "react";

interface PageProps{
    children:ReactNode;
    className?:string;
}

export default function Page({
    children,
    className=""
}:PageProps){

    return(
        <div
            className={`page ${className}`}
        >
            {children}
        </div>
    );

}
