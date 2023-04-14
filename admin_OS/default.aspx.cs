using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UsuariosOS usuarios = new UsuariosOS();
        usuarios.DatosDeRegistro(User.Identity.Name);
        var s = usuarios.Reguser;


        if (usuarios.Administrar == false)
        {
            Response.Write("<script>alert('No tiene permisos para acceder a esta pagina. Contacte al administrador del sitio web para más detalles.');window.location ='../default.aspx';</script>");

        }




    }
}