using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
public partial class admin_persona_lista : System.Web.UI.Page
{
    Personas personas = new Personas();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
               personas.Buscar(txtTextoBuscar.Text, User.Identity.Name, grdLista);
            }
        }
        catch (Exception ex) {lblMessage.Text = MessageStyles.Danger(ex.Message, true); }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            personas.Buscar(txtTextoBuscar.Text, User.Identity.Name, grdLista);

        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }
    }
}