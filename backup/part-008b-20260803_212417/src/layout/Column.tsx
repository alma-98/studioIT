import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Column({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-column ${className}`}>
            {children}
        </div>
    );

}
