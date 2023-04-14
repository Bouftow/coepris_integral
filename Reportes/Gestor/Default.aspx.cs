using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sistema_Avisos_Pruebas_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "EMPRESAS DE SERVICIOS DE CONTROL DE PLAGAS URBANAS "+DateTime.Today.ToString("MMMM-yyyy") +".xlsx"));
        Response.ContentType = "application/octet-stream";
        Response.WriteFile("TAMLIC.xlsx");
        Response.End();
    }
}