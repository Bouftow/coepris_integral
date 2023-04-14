using Salud.Tamaulipas;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Distintivo_Registro : System.Web.UI.Page
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
        //var x = cripto.Encrypt(Request.Params["id"]);
        //Response.Write("<script>alert('" + x + "')</script>");
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            if (Convert.ToInt32(Request.Params["id"]) != 0)
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand
                {
                    Connection = cnn,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "bitaseg.Distintivo_BuscarNombreGiro"
                };
                cmd.Parameters.Add("@id_giro", SqlDbType.NVarChar, 50).Value = Convert.ToInt32(Request.Params["id"]);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    carga.Text = dr["nombre_giro"].ToString();
                }

                if (carga.Text == "")
                {
                    StringBuilder strScript = new StringBuilder();
                    strScript.Append("$('#ModalSolLicSan').modal(\"show\");");
                    lblErrorModal.Text = "El giro al que está intentando acceder aún no se encuentra disponible";

                    ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
                }
                dr.Close();

                

            }
            else
            {

                StringBuilder strScript = new StringBuilder();
                strScript.Append("$('#ModalSolLicSan').modal(\"show\")");
                ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
            }

        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message;
            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalSolLicSan').modal(\"show\"); $(\".modal\").on(\"hidden.bs.modal\", function() {window.location = 'default.aspx';});");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
        }
        finally { cnn.Close(); }
        
    }
    

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (ddlMedio_Conocido.SelectedValue == "-1")
        {
            string textoerror = "Selecciona el medio por el cual te enteraste del sistema";


            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalInfoSave').modal(\"hide\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);

            LblMsg.Text = MessageStyles.Danger(textoerror, false);
        }
        else if (ddlMedio_Conocido.SelectedValue == "8" && txtmedio_conocido.Text.Length==0) {

            string textoerror = "No debes dejar vacío el campo \"Otro\"";


            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalInfoSave').modal(\"hide\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);

            LblMsg.Text = MessageStyles.Danger(textoerror, false);
        
        }
        else { 
            if (Page.IsValid == true && ddlMunicipio.SelectedValue != "-1")
        {
            
            const string Format = "1:{0}|2:{1}|3:{2}|4:{3}|5:{4}|6:{5}|7:{6}";
            string g = string.Format(Format,
               chkLunes.Checked ? 1 : 0,
               chkMartes.Checked ? 1 : 0,
               chkMiercoles.Checked ? 1 : 0,
               chkJueves.Checked ? 1 : 0,
               chkViernes.Checked ? 1 : 0,
               chkSabado.Checked ? 1 : 0,
               chkDomingo.Checked ? 1 : 0);

            if (chkLunes.Checked == false) { txtHoraLunesAbre.Text = "00:00"; txtHoraLunesCierra.Text = "00:00"; }
            if (txtHoraLunesAbre.Text == null || txtHoraLunesAbre.Text == "") { txtHoraLunesAbre.Text = "00:00"; }
            if (txtHoraLunesCierra.Text == null || txtHoraLunesCierra.Text == "") { txtHoraLunesCierra.Text = "00:00"; }

            if (chkMartes.Checked == false) { txtHoraMartesAbre.Text = "00:00"; txtHoraMartesCierra.Text = "00:00"; }
            if (txtHoraMartesAbre.Text == null || txtHoraMartesAbre.Text == "") { txtHoraMartesAbre.Text = "00:00"; }
            if (txtHoraMartesCierra.Text == null || txtHoraMartesCierra.Text == "") { txtHoraMartesCierra.Text = "00:00"; }

            if (chkMiercoles.Checked == false) { txtHoraMiercolesAbre.Text = "00:00"; txtHoraMiercolesCierra.Text = "00:00"; }
            if (txtHoraMiercolesAbre.Text == null || txtHoraMiercolesAbre.Text == "") { txtHoraMiercolesAbre.Text = "00:00"; }
            if (txtHoraMiercolesCierra.Text == null || txtHoraMiercolesCierra.Text == "") { txtHoraMiercolesCierra.Text = "00:00"; }

            if (chkJueves.Checked == false) { txtHoraJuevesAbre.Text = "00:00"; txtHoraJuevesCierra.Text = "00:00"; }
            if (txtHoraJuevesAbre.Text == null || txtHoraJuevesAbre.Text == "") { txtHoraJuevesAbre.Text = "00:00"; }
            if (txtHoraJuevesCierra.Text == null || txtHoraJuevesCierra.Text == "") { txtHoraJuevesCierra.Text = "00:00"; }

            if (chkViernes.Checked == false) { txtHoraViernesAbre.Text = "00:00"; txtHoraViernesCierra.Text = "00:00"; }
            if (txtHoraViernesAbre.Text == null || txtHoraViernesAbre.Text == "") { txtHoraViernesAbre.Text = "00:00"; }
            if (txtHoraViernesCierra.Text == null || txtHoraViernesCierra.Text == "") { txtHoraViernesCierra.Text = "00:00"; }

            if (chkSabado.Checked == false) { txtHoraSabadoAbre.Text = "00:00"; txtHoraSabadoCierra.Text = "00:00"; ; }
            if (txtHoraSabadoAbre.Text == null || txtHoraSabadoAbre.Text == "") { txtHoraSabadoAbre.Text = "00:00"; }
            if (txtHoraSabadoCierra.Text == null || txtHoraSabadoCierra.Text == "") { txtHoraSabadoCierra.Text = "00:00"; }

            if (chkDomingo.Checked == false) { txtHoraDomingoAbre.Text = "00:00"; txtHoraDomingoCierra.Text = "00:00"; }
            if (txtHoraDomingoAbre.Text == null || txtHoraDomingoAbre.Text == "") { txtHoraDomingoAbre.Text = "00:00"; }
            if (txtHoraDomingoCierra.Text == null || txtHoraDomingoCierra.Text == "") { txtHoraDomingoCierra.Text = "00:00"; }

            const string H1 = "1={0}-{1}|2={2}-{3}|3={4}-{5}|4={6}-{7}|5={8}-{9}|6={10}-{11}|7={12}-{13}";
            string horario1 = string.Format(H1,
               txtHoraLunesAbre.Text.ToString(),
               txtHoraLunesCierra.Text.ToString(),
               txtHoraMartesAbre.Text.ToString(),
               txtHoraMartesCierra.Text.ToString(),
               txtHoraMiercolesAbre.Text.ToString(),
               txtHoraMiercolesCierra.Text.ToString(),
               txtHoraJuevesAbre.Text.ToString(),
               txtHoraJuevesCierra.Text.ToString(),
               txtHoraViernesAbre.Text.ToString(),
               txtHoraViernesCierra.Text.ToString(),
               txtHoraSabadoAbre.Text.ToString(),
               txtHoraSabadoCierra.Text.ToString(),
               txtHoraDomingoAbre.Text.ToString(),
               txtHoraDomingoCierra.Text.ToString());
            try
            {
                Distintivos distintivo = new Distintivos();
                g = g.Replace(" ", "");
                horario1 = horario1.Replace(" ", "");

                distintivo.Nombre = txtNombre.Text;
                distintivo.Apellidom = txtApellidom.Text;
                distintivo.Apellidop = txtApellidop.Text;
                distintivo.Tel = txtTel.Text;
                distintivo.Correo = txtCorreo.Text;
                distintivo.Nombreest = txtNombre_est.Text;
                distintivo.RazonSocial = txtRazonSocial.Text;
                distintivo.Colonia = txtColonia.Text;
                distintivo.Calle = txtCalle.Text;
                distintivo.Numext = txtNum_ext.Text;
                distintivo.Numint = txtNum_int.Text;
                distintivo.Entrecalles = txtEntreCalles.Text;
                distintivo.Localidad = txtLocalidad.Text;
                distintivo.Municipio = ddlMunicipio.SelectedValue.ToString();
                distintivo.Cp = txtCP.Text;
                distintivo.Dias_laborales = g;
                distintivo.Hest = horario1;

                if (ddlMedio_Conocido.SelectedValue != "8") { distintivo.MedioConocido = ddlMedio_Conocido.SelectedItem.Text.ToString(); }
                else if (ddlMedio_Conocido.SelectedValue == "8") { distintivo.MedioConocido = txtmedio_conocido.Text.ToString(); }
                
                if (Convert.ToInt32(Request.Params["id"]) != 0)
                {
                    distintivo.IDgiro = Convert.ToInt32(Request.Params["id"]);
                }

                var id_encrypt = cripto.Encrypt(distintivo.Grabar_Distintivo());
                id_encrypt = id_encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");

                Response.Redirect("gracias.aspx?id=" + id_encrypt);


            }

            catch (Exception Ex)
            {
                ////Lblmsg.Text = Ex.Message;
                ///
                LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);

                //Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
            }
        }
            else {

            string textoerror = "Favor de llenar los siguientes campos obligatorios:";
            if (ddlMunicipio.SelectedValue == "-1"){ textoerror = textoerror + " <br/> ● Favor de seleccionar municipio"; }
            
           
            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalInfoSave').modal(\"hide\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);

            LblMsg.Text = MessageStyles.Danger(textoerror, false);
        }
        }
    }

    protected void btn_registro_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }



    protected void ddlMunicipio_Load(object sender, EventArgs e)
    {
        
        ListItem liMunicipio = new ListItem("Seleccione un municipio", "-1");
        ddlMunicipio.Items.Insert(0, liMunicipio);
    }

    protected void ddlMunicipio_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlMunicipio.Items.Remove(ddlMunicipio.Items.FindByValue("-1"));

    }
    protected void ddlMedio_Conocido_Load(object sender, EventArgs e)
    {

        ListItem liMedio = new ListItem("Seleccione una opción", "-1");
        ddlMedio_Conocido.Items.Insert(0, liMedio);
    }
    protected void ddlMedio_Conocido_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlMedio_Conocido.Items.Remove(ddlMedio_Conocido.Items.FindByValue("-1"));

    }
}