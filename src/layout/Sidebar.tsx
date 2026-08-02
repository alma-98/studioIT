import type { ReactNode } from "react";

interface SidebarProps{

    children:ReactNode;
    className?:string;

    dark?:boolean;
    sticky?:boolean;
    collapse?:boolean;

}

export default function Sidebar({

    children,
    className="",
    dark=false,
    sticky=false,
    collapse=false

}:SidebarProps){

    const classes=[
        "sidebar",
        dark ? "sidebar-dark" : "",
        sticky ? "sidebar-sticky" : "",
        collapse ? "sidebar-collapse" : "",
        className
    ].join(" ");

    return(

        <aside className={classes}>

            <div className="sidebar-content">

                {children}

            </div>

        </aside>

    );

}
