using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
public partial class admin_usuario_lista : System.Web.UI.Page
{
    UsuariosOS users = new UsuariosOS();
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            if (!Page.IsPostBack) {
                txtTextoBuscar.Text = Cookies.GetCookie(this, "txtTextoBuscar.Text", String.Format(""));
                users.Lista(txtTextoBuscar.Text,User.Identity.Name, grdLista);
            }
            else { Cookies.SetCookie(this, "txtTextoBuscar.Text", txtTextoBuscar.Text); }
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message,true); }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            
                users.Lista(txtTextoBuscar.Text, User.Identity.Name, grdLista);
                panelLista.Update();
            
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }
    }

    //Tarea
    //Tarea
    [System.Web.Services.WebMethod]
    public static string SetPwd(string userLogin, string userPwd)
    {

        try
        {
            if (userLogin.ToLower() == "admin") { throw new Exception("Imposible cambiar esta contraseña"); }
            UsuariosOS user = new UsuariosOS(userLogin);
            user.PasswordSetADH(userPwd, userLogin, HttpContext.Current.User.Identity.Name, HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString());
            return "ok";
        }
        catch (Exception ex) { return String.Format("error : {0}", ex.Message); }
    }
}