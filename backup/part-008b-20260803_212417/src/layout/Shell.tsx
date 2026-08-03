import type { ReactNode } from "react";

interface ShellProps{

    children:ReactNode;
    className?:string;

    column?:boolean;
    center?:boolean;

}

export default function Shell({

    children,
    className="",
    column=false,
    center=false

}:ShellProps){

    let classes="shell";

    classes += column
        ? " shell-column"
        : " shell-row";

    if(center){

        classes+=" shell-center";

    }

    return(

        <div className={`${classes} ${className}`}>

            {children}

        </div>

    );

}
