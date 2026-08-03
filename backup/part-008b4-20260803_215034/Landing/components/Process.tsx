

export default function Process(){

const steps=[
"Consultation",
"Planning",
"Development",
"Launch"
]


return(

<section
style={{
padding:"80px 24px",
textAlign:"center"
}}
>

<h2>
Proses Pengembangan
</h2>


<div>

{
steps.map((step,index)=>(

<div
key={step}
style={{
margin:"15px"
}}
>

<strong>
0{index+1}
</strong>

{" "}
{step}

</div>

))
}

</div>


</section>

)

}

