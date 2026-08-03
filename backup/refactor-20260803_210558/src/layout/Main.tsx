import type { ReactNode } from "react";

interface MainProps{

    children:ReactNode;
    className?:string;

    center?:boolean;

    scroll?:boolean;

}

export default function Main({

    children,
    className="",
    center=false,
    scroll=false

}:MainProps){

    let classes="main";

    if(center){

        classes+=" main-center";

    }

    if(scroll){

        classes+=" main-scroll";

    }

    return(

        <main
            className={`${classes} ${className}`}
        >

            {children}

        </main>

    );

}
