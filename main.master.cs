using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
public partial class main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Cookies.GetCookie(Page, "NombreCorto", "z") == "z")
        {
            Users user = new Users(Context.User.Identity.Name);
            Cookies.SetCookie(Page, "NombreCorto", user.NombreCorto);
            Cookies.SetCookie(Page, "NombreCompleto", user.NombreCompleto);
        }

        try
        {
            if (Request.Cookies["NombreCorto"].Value == "")
            {
                id_Menu_Perfil.Visible = false;
            }
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
    }
    protected void btnLogOff_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Cookies["UserLog"].Expires = DateTime.Now.AddMinutes(-1);
        Response.Cookies["NombreCompleto"].Expires = DateTime.Now.AddMinutes(-1);
        Response.Cookies["NombreCorto"].Expires = DateTime.Now.AddMinutes(-1);
        Response.Redirect(Strings.GetUrl("default.aspx", Page));
    }

    public HtmlGenericControl test
    {
        get { return this.head; }
    }

}
