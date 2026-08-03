import type { ReactNode } from "react";

interface ContentProps{

    children:ReactNode;
    className?:string;

    center?:boolean;

}

export default function Content({

    children,
    className="",
    center=false

}:ContentProps){

    return(

        <section
            className={
                `content ${
                    center ? "content-center" : ""
                } ${className}`
            }
        >

            {children}

        </section>

    );

}
