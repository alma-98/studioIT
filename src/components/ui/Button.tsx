import { colors } from "../../theme";

type Props={
children:React.ReactNode;
};

export default function Button({children}:Props){

return(

<button
style={{
background:colors.primary,
color:"#fff",
border:"none",
padding:"14px 28px",
borderRadius:10,
cursor:"pointer",
fontWeight:600
}}
>

{children}

</button>

);

}
