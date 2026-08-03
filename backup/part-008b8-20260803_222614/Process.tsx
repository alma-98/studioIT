
export default function Process(){

const steps=[
"Consultation",
"Planning",
"Development",
"Launch"
]


return(

<section style={{padding:"80px 24px"}}>

<h2>
Proses Pengembangan
</h2>


<div
style={{
display:"grid",
gridTemplateColumns:"repeat(4,1fr)",
gap:"20px"
}}
>

{
steps.map((s,i)=>(

<div
key={s}
style={{
background:"#FFFFFF",
padding:"25px",
borderRadius:"15px"
}}
>

<h3>
0{i+1}
</h3>

<p>{s}</p>

</div>

))
}

</div>

</section>

)

}

