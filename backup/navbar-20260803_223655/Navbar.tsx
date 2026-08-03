
import { Link } from "react-router-dom";


export default function Navbar(){

return(

<header
style={{
position:"sticky",
top:0,
zIndex:1000,
background:"#FFFFFF",
boxShadow:"0 4px 15px rgba(0,0,0,.08)"
}}
>


<nav
style={{
height:"72px",
display:"flex",
alignItems:"center",
justifyContent:"space-between",
padding:"0 32px"
}}
>


<div>

<h2
style={{
fontFamily:"Poppins",
color:"#E63946",
margin:0
}}
>
StudioIT
</h2>

</div>



<div
style={{
display:"flex",
gap:"24px",
alignItems:"center"
}}
>


<Link to="/">
Home
</Link>


<Link to="/services">
Services
</Link>


<Link to="/portfolio">
Portfolio
</Link>


<Link to="/pricing">
Pricing
</Link>


<Link to="/blog">
Blog
</Link>


<Link to="/contact">
Contact
</Link>



<a
href="mailto:alma.budsteddy88@gmail.com"
style={{
textDecoration:"none"
}}
>

<button
style={{
background:"#E63946",
color:"#FFFFFF",
border:"none",
padding:"12px 22px",
borderRadius:"10px",
cursor:"pointer"
}}
>

Konsultasi Project

</button>

</a>


</div>


</nav>


</header>

)

}

