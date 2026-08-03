
export default function WhyChooseUs(){

const items=[
"Tim profesional berpengalaman",
"Teknologi modern dan terpercaya",
"Solusi scalable sesuai bisnis",
"Dukungan jangka panjang"
]


return(

<section style={{padding:"80px 24px"}}>

<h2>
Mengapa Memilih StudioIT?
</h2>


<ul>

{
items.map(x=>
<li key={x}>{x}</li>
)
}

</ul>


</section>

)

}

