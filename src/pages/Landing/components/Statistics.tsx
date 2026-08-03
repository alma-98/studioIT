
export default function Statistics(){

const data=[
["100+","Project"],
["50+","Client"],
["10+","Technology"],
["24/7","Support"]
]


return(

<section
style={{
padding:"60px 24px"
}}
>

<div
style={{
display:"grid",
gridTemplateColumns:"repeat(auto-fit,minmax(180px,1fr))",
gap:"20px"
}}
>


{
data.map(item=>(

<div
key={item[1]}
style={{
background:"#FFFFFF",
padding:"30px",
borderRadius:"16px",
textAlign:"center",
boxShadow:"0 10px 25px rgba(0,0,0,.08)"
}}
>

<h2
style={{
color:"#E63946"
}}
>
{item[0]}
</h2>

<p>
{item[1]}
</p>

</div>

))
}


</div>

</section>

)

}

