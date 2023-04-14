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
public partial class Distintivo_Registro : System.Web.UI.Page
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
        Privadas.Visible = false;
        Publicas.Visible = false;
        if ( Convert.ToInt32(Request.Params["id"]) == 13) {
            Publicas.Visible = true;
        }
       if (Convert.ToInt32(Request.Params["id"]) == 14)
        {
                
            Privadas.Visible = true;
        }

        string sessionId = this.Session.SessionID;
        sessionid.Value = Session.SessionID;

        string path = Server.MapPath(String.Format("~/uploads/Distintivo/{0}", sessionId));
        if (Directory.Exists(path))
        {
            botonverde.Visible = true;
            Evidencia.HRef = String.Format("~/uploads/Distintivo/{0}", sessionId) + "/Evidencias.pdf";
            btnEnviar.Visible = true;
            
        }
        else { botonverde.Visible = false; btnEnviar.Visible = false; }


        //var x = cripto.Encrypt(Request.Params["id"]);
        
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            if (Convert.ToInt32(Request.Params["id"]) == 13 || Convert.ToInt32(Request.Params["id"]) == 14)
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

        sessionid.Value = this.Session.SessionID;
        string path = Server.MapPath(String.Format("~/uploads/Distintivo/{0}", sessionid.Value));
        if ((Directory.Exists(path)))
        {
            bool verificar_publicas = true;
            bool verificar_privadas = true;
            if (Convert.ToInt32(Request.Params["id"]) == 13) { if (!(RadioButton1.Checked || RadioButton2.Checked)) {  verificar_publicas = false; } }
            if (Convert.ToInt32(Request.Params["id"]) == 14) { if (hdn_select.Value == null || hdn_select.Value == "") { verificar_privadas = false; } }
            if (Page.IsValid == true && ddlMunicipio.SelectedValue != "-1" && verificar_privadas && verificar_publicas)
        {
                try
                {
                    Distintivos distintivo = new Distintivos();

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

                    if (Convert.ToInt32(Request.Params["id"]) == 13)
                    {
                        if (RadioButton1.Checked) { distintivo.Nivel_Educativo = "Media Superior"; }
                        if (RadioButton2.Checked) { distintivo.Nivel_Educativo = "Superior"; }
                    }
                    else
                    {
                        distintivo.Nivel_Educativo = hdn_select.Value.ToString();
                    }


                    distintivo.Sesion = sessionid.Value;
                    if (Convert.ToInt32(Request.Params["id"]) != 0)
                    {
                        distintivo.IDgiro = Convert.ToInt32(Request.Params["id"]);
                    }

                    var id_encrypt = cripto.Encrypt(distintivo.Grabar_Distintivo());
                    id_encrypt = id_encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");

                    Response.Redirect("gracias.aspx?id=" + id_encrypt + "&id_g=" + Convert.ToInt32(Request.Params["id"]));


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
                //Response.Write("<script>alert('"+hdn_select.Value+"')</script>");
            string textoerror = "Favor de llenar los siguientes campos obligatorios:";
                if (ddlMunicipio.SelectedValue == "-1") { textoerror = textoerror + " <br/> ● Favor de seleccionar municipio"; }
                if (Convert.ToInt32(Request.Params["id"]) == 13) { if (!(RadioButton1.Checked || RadioButton2.Checked)) { textoerror = textoerror + " <br/> ● Favor de seleccionar el nivel educativo"; } }
                if (Convert.ToInt32(Request.Params["id"]) == 14) { if (hdn_select.Value == null || hdn_select.Value == "") { textoerror = textoerror + " <br/> ● Favor de seleccionar el nivel educativo"; } }

            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalInfoSave').modal(\"hide\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);

            LblMsg.Text = MessageStyles.Danger(textoerror, false);
        }
        }
        else
        {
            string textoerror = "Favor de subir el archivo solicitado y esperar a que la información se cargue correctamente";
            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalInfoSave').modal(\"hide\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);

            LblMsgFile.Text = MessageStyles.Danger(textoerror, false);
        }

    }

    protected void btn_registro_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }



   
    
}