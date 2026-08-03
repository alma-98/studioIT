type Props={
children:React.ReactNode;
};

export default function Card({children}:Props){

return(

<div
style={{
background:"#fff",
borderRadius:16,
padding:24,
boxShadow:"0 10px 25px rgba(0,0,0,.08)"
}}
>

{children}

</div>

);

}
