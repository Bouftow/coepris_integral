using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Distintivo_admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        
        if (usuarios.Administrar == false)
        {
            Response.Write("<script>alert('No tiene permisos para acceder a esta pagina. Contacte al administrador del sitio web para más detalles.');window.location ='../default.aspx';</script>");

        }
    }
}