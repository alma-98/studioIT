import type { ReactNode } from "react";

interface WrapperProps{

    children:ReactNode;
    className?:string;

    fluid?:boolean;
    center?:boolean;

}

export default function Wrapper({

    children,
    className="",
    fluid=false,
    center=false

}:WrapperProps){

    let classes="wrapper";

    if(fluid){

        classes+=" wrapper-fluid";

    }

    if(center){

        classes+=" wrapper-center";

    }

    return(

        <div className={`${classes} ${className}`}>

            {children}

        </div>

    );

}
