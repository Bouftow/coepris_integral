using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
public partial class admin_persona_item : System.Web.UI.Page
{
    CatEstado edo = new CatEstado();
    CatMun mun = new CatMun();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                Personas per = new Personas(Convert.ToInt32(Request.Params["id"]));
                txtCURP.Text = per.CURP;
                txtINE.Text = per.INE;
                txtRFC.Text = per.RFC;
                txtGrado.Text = per.Prefijo;
                txtNombre.Text = per.Nombre;
                txtPaterno.Text = per.Paterno;
                txtMaterno.Text = per.Materno;
                txtFechaNac.Text = String.Format("{0:dd/MM/yyyy}", per.FechaNac);
                txtLugarNac.Text = per.LugarNac;
                txtEstadoNac.Text = per.EstadoNac;
                txtCalle.Text = per.Calle;
                txtNumExt.Text = per.NumExt;
                txtNumInt.Text = per.NumInt;
                txtColonia.Text = per.Colonia;
                txtCP.Text = per.CP;
                edo.MostrarLista(cboIdEstado, true);
                cboIdEstado.SelectedIndex = cboIdEstado.Items.IndexOf(cboIdEstado.Items.FindByValue(per.IdEstado.ToString()));
                mun.MostrarLista(Convert.ToInt32(cboIdEstado.SelectedValue), cboIdMun, true);
                cboIdMun.SelectedIndex = cboIdMun.Items.IndexOf(cboIdMun.Items.FindByValue(per.IdMun.ToString()));
                txtLocalidad.Text = per.Localidad;
                txtTelefono.Text = per.Telefono;
                txtTelefonoCel.Text = per.TelefonoCel;
                txtMail.Text = per.Email;
                
            }
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }

    }

    protected void cboIdEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        try { mun.MostrarLista(Convert.ToInt32(cboIdEstado.SelectedValue), cboIdMun, true); }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }
    }

    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        try
        {
            Personas per = new Personas(Convert.ToInt32(Request.Params["id"]));
            per.CURP = txtCURP.Text;
            per.INE = txtINE.Text;
            per.RFC = txtRFC.Text;
            per.Prefijo = txtGrado.Text;
            per.Nombre = txtNombre.Text;
            per.Paterno = txtPaterno.Text;
            per.Materno = txtMaterno.Text;
            per.FechaNac = Convert.ToDateTime(txtFechaNac.Text);
            per.LugarNac = txtLugarNac.Text;
            per.EstadoNac = txtEstadoNac.Text;
            per.Calle = txtCalle.Text;
            per.NumExt = txtNumExt.Text;
            per.NumInt = txtNumInt.Text;
            per.Colonia = txtColonia.Text;
            per.CP = txtCP.Text;
            per.IdEstado = Convert.ToInt32(cboIdEstado.SelectedValue);
            per.IdMun = Convert.ToInt32(cboIdMun.SelectedValue);
            per.Localidad = txtLocalidad.Text;
            per.Telefono = txtTelefono.Text;
            per.TelefonoCel = txtTelefonoCel.Text;
            per.Email = txtMail.Text;
            
            per.UserReg = User.Identity.Name;
            per.RemoteAddr = Request.ServerVariables["REMOTE_ADDR"].ToString();

            if (per.Grabar())
            {
                Response.Redirect(String.Format("persona-lista.aspx#ancla_{0}", per.IdPersona));
            }
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }
    }
}