using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using Salud.Tamaulipas;
public partial class admin_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Cargar();
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        var s = usuarios.Rol;
        //if (usuarios.Administrar == false)
        //{
        //    Response.Write("<script>alert('No tiene permisos para acceder a esta pagina. Contacte al administrador del sitio web para más detalles.');window.location ='../default.aspx';</script>");

        //}

        switch (s)
        {
            case "admin":
                break;
            default:
                break;
        }
    }



}