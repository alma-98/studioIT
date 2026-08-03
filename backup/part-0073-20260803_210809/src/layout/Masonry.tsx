import type { ReactNode } from "react";

interface MasonryProps{

    children:ReactNode;
    className?:string;

}

export default function Masonry({

    children,
    className=""

}:MasonryProps){

    return(

        <div className={`masonry ${className}`}>

            {children}

        </div>

    );

}
