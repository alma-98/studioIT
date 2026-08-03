import type { ReactNode } from "react";

type Props={
    children:ReactNode;
    className?:string;
};

export default function Flex({
    children,
    className=""
}:Props){

    return(
        <div className={`flex-row ${className}`}>
            {children}
        </div>
    );

}
