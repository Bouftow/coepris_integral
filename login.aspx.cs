using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
using System.Data.SqlClient;
using System.Data;
using System.Text;


public partial class login : System.Web.UI.Page
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string orolo = TimeZoneInfo.Utc.ToString();
        //Response.Write("<script>alert('"+ orolo +"')</script>");
        chkRemember.InputAttributes["class"] = "checkbox";
        chkRemember.Checked = true;
        Request.ServerVariables["REMOTE_ADDR"].ToString();
       
        if (!IsPostBack)
        {
            if (Request.Cookies["UserLog"] != null && Request.Cookies["UserPass"] != null)
            {
                txtUserLogin.Text = Request.Cookies["UserLog"].Value;
                txtUserPassword.Attributes["value"] = Request.Cookies["UserPass"].Value;
               
            }
        }
    }


    protected void btnOK_Click(object sender, EventArgs e)
    {

        if (chkRemember.Checked)
        {
            Response.Cookies["UserLog"].Value = txtUserLogin.Text;
            //Response.Cookies["UserPass"].Value = txtUserPassword.Text;
            //Response.Cookies["PswEncr"].Value = cripto.Encrypt(txtUserPassword.Text);
            Response.Cookies["UserLog"].Expires = DateTime.Now.AddMinutes(1);
            //Response.Cookies["UserPass"].Expires = DateTime.Now.AddMinutes(1);
            //Response.Cookies["PswEncr"].Expires = DateTime.Now.AddMinutes(1);
            
        }
        else
        {
            Response.Cookies["UserLog"].Expires = DateTime.Now.AddMinutes(-1);
            //Response.Cookies["UserPass"].Expires = DateTime.Now.AddMinutes(-1);
            
        }
        try
        {
            Users user = new Users();
            if (user.Login(txtUserLogin.Text, txtUserPassword.Text, Request.ServerVariables["REMOTE_ADDR"].ToString()))
            {
                user.DatosDeRegistro(txtUserLogin.Text);
               
                //user = new Usuarios(txtUserLogin.Text);
                Personas personas = new Personas();
                personas.Cargar(user.Id_Persona);
                Cookies.SetCookie(this, "NombreCorto", personas.NombreCorto);
                Cookies.SetCookie(this, "NombreCompleto", personas.NombreCompleto);
                Cookies.SetCookie(this, "Rem_dd", Request.ServerVariables["REMOTE_ADDR"].ToString());

                //FormsAuthentication.RedirectFromLoginPage(txtUserLogin.Text, chkRemember.Checked);
                FormsAuthentication.SetAuthCookie(txtUserLogin.Text, chkRemember.Checked);
                
                if (txtUserLogin.Text=="pruebas"){ Response.Redirect("sistema/cursos/default.aspx"); }
                else { FormsAuthentication.RedirectFromLoginPage(txtUserLogin.Text, chkRemember.Checked); }


            }
            else {
                Response.Write("<script>alert('No tiene permisos. Contacte al administrador');</script>");
            }

        }
      

        catch (Exception ex)
        {
            lblMessage.Text = ex.Message ;
            
        }
    }
}