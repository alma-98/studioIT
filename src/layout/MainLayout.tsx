
import { Outlet } from "react-router-dom";

import Navbar from "../components/layout/Navbar";
import Footer from "../components/layout/Footer";
import FloatingSMS from "../components/sms/FloatingSMS";



export default function MainLayout(){

return (

<div
style={{
minHeight:"100vh",
background:"#FFE8E8"
}}
>


<Navbar/>


<main>

<Outlet/>

</main>


<Footer/>





<FloatingSMS/>


</div>

)

}

