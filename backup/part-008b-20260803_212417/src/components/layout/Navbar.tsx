export default function Navbar(){

return (
<nav
style={{
height:"64px",
display:"flex",
alignItems:"center",
justifyContent:"space-between",
padding:"0 24px",
background:"#FFFFFF"
}}
>

<h2
style={{
fontFamily:"Poppins",
color:"#E63946"
}}
>
StudioIT
</h2>


<div>
<a href="/">Home</a>{" "}
<a href="/services">Services</a>{" "}
<a href="/portfolio">Portfolio</a>{" "}
<a href="/contact">Contact</a>
</div>

</nav>
)

}
