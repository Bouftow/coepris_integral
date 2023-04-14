using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reportes_Comedores_Captura_Escuelas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["ok"] == "1") { LblMsg.Visible = true; LblMsg.CssClass = ""; LblMsg.Text = MessageStyles.Success("Escuela capturada correctamente", false); }
        
    }

    protected void btn_Guardar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (ddlambito.SelectedIndex != 0 && ddlcontrol.SelectedIndex != 0 && ddltipo.SelectedIndex != 0 && ddlturno.SelectedIndex != 0)
            {

                Escuelas escuela = new Escuelas();

                escuela.ClaveCT = txtClaveCCT.Text;
                escuela.Nombre = txtNombre.Text;
                escuela.Localidad = txtLocalidad.Text;
                escuela.CP = txtCP.Text;
                escuela.Colonia = txtColonia.Text;
                escuela.Vialidad = txtVialidad.Text;
                escuela.NumExt = txtNumext.Text;


                escuela.Turno = ddlturno.Value;
                escuela.Tipo = ddltipo.Value;
                escuela.Control = ddlcontrol.Value;
                escuela.Ambito = ddlambito.Value;
                escuela.Municipio = ddlMunicipio.SelectedValue;

                escuela.Grabar_Escuela();

                Response.Redirect(Request.RawUrl);
            }

            else { 
            LblMsg.Visible = true;
            LblMsg.Text = "";
                LblMsg.CssClass = "alert alert-danger"; 
                if (ddlMunicipio.SelectedValue == "-1") { LblMsg.Text += "Elige un municipio<br />"; }
                if (ddlambito.SelectedIndex == 0) { LblMsg.Text += "Elige un ámbito<br />"; }
                if (ddlcontrol.SelectedIndex == 0) { LblMsg.Text += "Elige un tipo de control<br />"; }
                if (ddltipo.SelectedIndex == 0) { LblMsg.Text += "Elige un nivel educativo<br />"; }
                if (ddlturno.SelectedIndex == 0) { LblMsg.Text += "Elige un tipo de turno<br />"; }
            }

        }
        else { LblMsg.Visible = true; LblMsg.Text = "Rellena los campos con asterisco"; LblMsg.CssClass = "alert alert-danger"; }
        

    }
}