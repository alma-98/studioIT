import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Row({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-row items-center ${className}`}>
            {children}
        </div>
    );

}
