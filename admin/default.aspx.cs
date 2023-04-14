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
        if (usuarios.Administrar == false)
        {
            Response.Write("<script>alert('No tiene permisos para acceder a esta pagina. Contacte al administrador del sitio web para más detalles.');window.location ='../default.aspx';</script>");

        }

        switch (s)
        {
            case "admin":
                break;
            case "todos":
                //newprov.Attributes.Add("style", "display:none");
                break;
            case "administrador":
                //newprov.Attributes.Add("style", "display:none");
                usuarios_bitaseg.Attributes.Add("style", "display:none");
                //reportegas.Attributes.Add("style", "display:none");
                //reporteproveedores.Attributes.Add("style", "display:none");
                personas_bitaseg.Attributes.Add("style", "display:none");
                break;
            case "cis":
                //reportegas.Attributes.Add("style", "display:none");
                //reporteproveedores.Attributes.Add("style", "display:none");
                //newprov.Attributes.Add("style", "display:none");
                break;
            case "comisionado":
                //reportegas.Attributes.Add("style", "display:none");
                //reporteproveedores.Attributes.Add("style", "display:none");
                //newprov.Attributes.Add("style", "display:none");
                break;
            default:
                //reportegas.Attributes.Add("style", "display:none");
                //reporteproveedores.Attributes.Add("style", "display:none");
                //newprov.Attributes.Add("style", "display:none");
                break;
        }
    }

    //protected void Cargar()
    //{
    //    Usuarios usuarios = new Usuarios();
    //    usuarios.DatosDeRegistro(User.Identity.Name);
    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    try
    //    {
    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cnn;

    //        cmd.CommandText = " select * from bitaseg.usuarios " +
    //            " inner join bitaseg.users on Usuarios.user_login = users.user_login" +
    //            " inner join bitaseg.persona ON Usuarios.user_login = persona.user_login" +
    //            " inner join bitaseg.Coordinaciones on Usuarios.id_coordinacion = Coordinaciones.id_coordinacion" +
    //            " where persona.id_persona = @par";
    //        //PARAMS
    //        cmd.Parameters.Add("@par", SqlDbType.Int).Value = usuarios.Id_Persona;
    //        SqlDataReader dr = cmd.ExecuteReader();
    //        if (dr.Read())
    //        {
    //             a.InnerHtml = dr["victoria"].ToString();
    //             b.InnerText = dr["abasolo"].ToString();
               
    //        }
            
    //        dr.Close();
       
    //    }

    //    catch (Exception ex) { throw (ex); }
    //    finally { cnn.Close(); cnn.Dispose(); }

        

    //}

}