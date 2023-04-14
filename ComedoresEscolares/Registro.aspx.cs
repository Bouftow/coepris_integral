using Salud.Tamaulipas;
using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

public partial class Registro : System.Web.UI.Page
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {


        txtLocalidad.Enabled = false;
        txtTipo.Enabled = false;
        txtNombreEscuela.Enabled = false;

        //var v = cripto.Encrypt("1");
        //Response.Write("<script>alert('" + v + "') </script>");
        //var x = cripto.Encrypt(Request.Params["id"]);
        //Response.Write("<script>alert('" + x + "')</script>");

        //StringBuilder strScript = new StringBuilder();
        //strScript.Append("$('#ModalSolLicSan').modal(\"show\");");
        //lblErrorModal.Text = "El giro al que está intentando acceder aún no se encuentra disponible";

    }
    

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        lblErrorModal.Text = "";
        lblErrorModal.Text =

             (RequiredFieldValidator2.IsValid ? (!Regex.IsMatch(txtNombre.Text, @"^[^\s]+(\s+[^\s]+)*$") ? "El nombre no debe iniciar ni finalizar con espacio<br/>" : "") : RequiredFieldValidator2.ErrorMessage + "<br/>") +
             (RequiredFieldValidator3.IsValid ? (!Regex.IsMatch(txtApellidop.Text, @"^[^\s]+(\s+[^\s]+)*$") ? "El primer apellido no debe iniciar ni finalizar con espacio<br/>" : "") : RequiredFieldValidator3.ErrorMessage + "<br/>") +
             (RequiredFieldValidator4.IsValid ? (!Regex.IsMatch(txtApellidom.Text, @"^[^\s]+(\s+[^\s]+)*$") ? "El segundo apellido no debe iniciar ni finalizar con espacio<br/>" : "") : RequiredFieldValidator4.ErrorMessage + "<br/>") +
             (RequiredFieldValidator13.IsValid ? (!Regex.IsMatch(txtTel.Text, @"^[0-9]{10}$") ? "Ingrese un número telefónico de 10 dígitos<br/>" : "") : RequiredFieldValidator13.ErrorMessage + "<br/>") +
             (RequiredFieldValidator5.IsValid ? (!Regex.IsMatch(txtCorreo.Text, @"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$") ? "Correo electrónico no válido<br/>" : "") : RequiredFieldValidator5.ErrorMessage + "<br/>") +
             (RequiredFieldValidator1.IsValid ? (!Regex.IsMatch(txtClave.Text, @"^[^\s]+(\s+[^\s]+)*$") ? "La clave del centro de trabajo no debe iniciar ni finalizar con espacio<br/>" : "") : RequiredFieldValidator1.ErrorMessage + "<br/>") +
             (select.Value != "-1" ? "" : "Seleccione un tipo de unidad de consumo escolar<br/>");
        ;


        if (txtNombreEscuela.Text=="") {
            lblErrorModal.Text = lblErrorModal.Text + "Si el nombre de escuela no se autocompletó, significa que su escuela no está en nuestro Padrón, aborte su regístro y reporte la situación a nuestras lineas de contacto que se mostrarán al final de la página.";
        }
        
        if (!(lblErrorModal.Text == "")) {

            
            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalSolLicSan').modal(\"show\");");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
      
            
        }
        else {

            try
            {

                Comedores comedor = new Comedores();
                Escuelas escuela = new Escuelas(txtClave.Text);

                comedor.IDescuela = escuela.IDescuela;
                comedor.IDcoordinacion = escuela.IDcoordinacion;
                comedor.NombreCoordinacion = escuela.NombreCoordinacion;

                comedor.Nombre = txtNombre.Text.ToUpper();
                comedor.Apellidop = txtApellidop.Text.ToUpper();
                comedor.Apellidom = txtApellidom.Text.ToUpper();
                comedor.Tel = txtTel.Text;
                comedor.Correo = txtCorreo.Text;
                comedor.ClaveCT = txtClave.Text.ToUpper();
                comedor.UnidadConsumo = select.Value.ToString().ToUpper();
               


                var id_encrypt = cripto.Encrypt(comedor.Grabar_Comedor());
                id_encrypt = id_encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");


                
                Response.Redirect("Capacitacion.aspx?id=" + id_encrypt);

            }

            catch (Exception Ex)
            {
                ////Lblmsg.Text = Ex.Message;
                ///
                LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);

                //Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
            }
        }
    }

    protected void btn_registro_ServerClick(object sender, EventArgs e)
    {
      
    }

    [System.Web.Services.WebMethod]
    public static List<string> GetCountryNames(string term)
    {
        List<string> ListaResultados = new List<string>();
        using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
        {
            string weird = '\u0022'+ "Escuelas" + '\u0022'+": [";
            SqlCommand cmd = new SqlCommand("bitaseg.[spGetEscuelas]", con);
            cmd.CommandType = CommandType.StoredProcedure;

           
            cmd.Parameters.Add("@term", SqlDbType.VarChar,10).Value = term;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ListaResultados.Add(dr["claveCT"].ToString());
                weird = weird + dr["jeison"].ToString();
            }


            {
                weird = weird + "]";
                //"Escuelas": [
                //{ "id":1,"cord":10,"nombrecoordinacion":"VALLE HERMOSO""clave":"28DJN0591P","nombre":"HEROES DE CHAPULTEPEC","tipo":"PREESCOLAR"}
                //{ "id":2,"cord":1,"nombrecoordinacion":"VICTORIA""clave":"28DJN0559G","nombre":"XOCHITL PALOMINO CONTRERAS","tipo":"PREESCOLAR"}
                //{ "id":3,"cord":1,"nombrecoordinacion":"VICTORIA""clave":"28DPR0413C","nombre":"PROF. JOSE DEL CARMEN TIRADO","tipo":"PRIMARIA"}
                //{ "id":4,"cord":6,"nombrecoordinacion":"MANTE""clave":"28DJN0084K","nombre":"FRANCISCO VILLA","tipo":"PREESCOLAR"}
                //{ "id":5,"cord":9,"nombrecoordinacion":"MIGUEL ALEMÁN""clave":"28DPR0234R","nombre":"DR. GABINO BARREDA","tipo":"PRIMARIA"}

                //]

            }

           
            return ListaResultados;
        }
    }


    protected void txtClave_TextChanged(object sender, EventArgs e)
    {
        try
        {
            Escuelas escuela = new Escuelas(txtClave.Text);
            
            txtNombreEscuela.Text = escuela.Nombre.ToUpper();
            txtLocalidad.Text = escuela.Localidad.ToUpper();
            txtTipo.Text = escuela.Tipo.ToUpper();

        }

        catch (Exception Ex)
        {
            ////Lblmsg.Text = Ex.Message;
            ///
            LblMsg.Text = "<br /> Si ve este mensaje de error, favor de reportarlo lo antes posible y no continuar con su registro." + MessageStyles.Danger(Ex.Message, false);

            //Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
        }

        
    }
}