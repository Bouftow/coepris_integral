using Salud.Tamaulipas;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        StringBuilder strScript = new StringBuilder();
        ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
        if (!Page.IsPostBack)
        {
        }
    }
 
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Registro.aspx?id=" + ddlGiros.SelectedValue.ToString() + "");
        Response.Redirect("Registro.aspx");
    }
}