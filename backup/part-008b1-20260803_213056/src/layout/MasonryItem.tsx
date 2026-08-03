import type { ReactNode } from "react";

interface MasonryItemProps{

    children:ReactNode;
    className?:string;

}

export default function MasonryItem({

    children,
    className=""

}:MasonryItemProps){

    return(

        <div className={`masonry-item ${className}`}>

            {children}

        </div>

    );

}
