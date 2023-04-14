using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
using System.Text;

public partial class admin_usuario_unidad_salud : System.Web.UI.Page
{
    Usuarios user = new Usuarios();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                Usuarios user = new Usuarios(new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()));
                //Usuarios.MostrarUnidadesSalud(grdCoordinaciones);
            }
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }
    }
    //
    //
    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        try
        {
            ////CicloGrabarSucursales();
            StringBuilder strDatos = new StringBuilder();
            for (int i = 0; i <= grdCoordinaciones.Rows.Count - 1; i++)
            {
                int id = Convert.ToInt32(grdCoordinaciones.DataKeys[i].Value);
                CheckBox chk = (CheckBox)grdCoordinaciones.Rows[i].FindControl("chkSucursalActivar");
                RadioButton opt = (RadioButton)grdCoordinaciones.Rows[i].FindControl("optSucursalEstablecer");
                strDatos.Append(String.Format("{0}#{1}#{2}$", id, chk.Checked, opt.Checked));

            }
            //user.ActivarUnidadesSalud(new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()), strDatos.ToString().TrimEnd('$'), User.Identity.Name, Request.ServerVariables["REMOTE_ADDR"].ToString()).ToString();
            lblMessage.Text = MessageStyles.Info(String.Format("Unidades de Salud del Usuario: \"{0}\" actualizadas. {1}", new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()), DateTime.Now), true);
            lblMessage.Text = strDatos.ToString().TrimEnd('$');
        }
        catch (Exception ex) {
            lblMessage.Text = MessageStyles.Danger(ex.Message, true);
        }
        Response.Redirect("usuario-lista.aspx");

       
    }
    //
    //
    protected void grdCoordinaciones_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chk = e.Row.FindControl("chkSucursalActivar") as CheckBox;
            RadioButton opt = e.Row.FindControl("optSucursalEstablecer") as RadioButton;

            chk.Attributes.Add("onClick", String.Format("EnableOption(\"{0}\",\"{1}\")", chk.ClientID, opt.ClientID));
        }
    }
    //
    //
    ////void CicloGrabarSucursales()
    ////{
    ////    try
    ////    {
    ////        StringBuilder strDatos = new StringBuilder();
    ////        for (int i = 0; i <= grdCoordinaciones.Rows.Count - 1; i++)
    ////        {
    ////            int id = Convert.ToInt32(grdCoordinaciones.DataKeys[i].Value);
    ////            CheckBox chk = (CheckBox)grdCoordinaciones.Rows[i].FindControl("chkSucursalActivar");
    ////            RadioButton opt = (RadioButton)grdCoordinaciones.Rows[i].FindControl("optSucursalEstablecer");
    ////            strDatos.Append(String.Format("{0}#{1}#{2}$", id, chk.Checked, opt.Checked));

    ////        }
    ////        user.ActivarUnidadesSalud(new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()), strDatos.ToString().TrimEnd('$'), User.Identity.Name, Request.ServerVariables["REMOTE_ADDR"].ToString()).ToString();
    ////        //lblMessage.Text = MessageStyles.Info(strDatos.ToString().TrimEnd('$'),false);
    ////        lblMessage.Text = MessageStyles.Info(String.Format("Unidades de Salud del Usuario: \"{0}\" actualizadas. {1}", new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()), DateTime.Now), true);
    ////        ////lblMessage.Text = new EncryptDecrypt().Decrypt(Request.Params["id"].Trim())+", "+strDatos.ToString().TrimEnd('$')+", "+ User.Identity.Name+", "+ Request.ServerVariables["REMOTE_ADDR"].ToString();
    ////    }
    ////    catch (Exception ex)
    ////    {
    ////        throw ex;
    ////    }
    ////}
    //
    //
}