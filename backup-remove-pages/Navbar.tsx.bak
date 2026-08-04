
import { Link } from "react-router-dom";


export default function Navbar(){

const menus=[

{
name:"Home",
path:"/"
},

{
name:"Services",
path:"/services"
},

{
name:"Portfolio",
path:"/portfolio"
},

{
name:"Pricing",
path:"/pricing"
},

{
name:"Blog",
path:"/blog"
},

{
name:"Contact",
path:"/contact"
}

]


return(

<header

style={{

position:"sticky",

top:0,

zIndex:1000,

background:"#FFFFFF",

boxShadow:"0 4px 18px rgba(0,0,0,.08)"

}}

>


<nav

style={{

maxWidth:"1200px",

height:"72px",

margin:"auto",

padding:"0 24px",

display:"flex",

alignItems:"center",

justifyContent:"space-between"

}}

>


<Link

to="/"

style={{

textDecoration:"none"

}}

>

<h2

style={{

fontFamily:"Poppins",

color:"#E63946",

margin:0,

fontSize:"26px"

}}

>

StudioIT

</h2>

</Link>



<div

style={{

display:"flex",

alignItems:"center",

gap:"24px"

}}

>


{

menus.map(menu=>(

<Link

key={menu.name}

to={menu.path}

style={{

textDecoration:"none",

color:"#374151",

fontFamily:"Inter",

fontSize:"15px"

}}

>

{menu.name}

</Link>

))

}



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

borderRadius:"12px",

fontFamily:"Poppins",

cursor:"pointer",

fontSize:"14px"

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

