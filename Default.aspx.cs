using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);


        //if (User.Identity.Name == "pruebas")
        //{
        //    Response.Write("<script>alert('Bienvenido al usuario de pruebas.');window.location ='sistema/Cursos/default.aspx';</script>");

        //}

    }
}