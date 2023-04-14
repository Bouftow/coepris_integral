using Salud.Tamaulipas;
using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

public partial class Verificacion : System.Web.UI.Page
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
       

       

        if (!Page.IsPostBack)
        {
            try
            {
                var id_decrypt = cripto.Decrypt(Request.Params["id"].ToString());

                Comedores comedor = new Comedores(Convert.ToInt32(id_decrypt));
                Escuelas escuelas = new Escuelas(comedor.ClaveCT);

                var n = escuelas.Control.ToString();
                switch (n)
                {
                    case "PÚBLICO": n = "PÚBLICA</strong>"; break;
                    case "PRIVADO": n = "PRIVADA</strong>"; break;
                    default: break;
                }
                lblControl.Text = "<strong>ESCUELA " + n;

                lblNombreCompleto.Text= "<strong>Nombre del responsable:</strong>  " + comedor.Nombre.ToString() +" "+ comedor.Apellidop.ToString() +" "+ comedor.Apellidom.ToString();
                lblTel.Text= "<strong>Número Teléfonico:</strong>  " + comedor.Tel.ToString();
                lblCorreo.Text= "<strong>Correo Electrónico:</strong>  " +comedor.Correo.ToString();

                lblClave.Text = "<strong>Clave del Centro de Trabajo:</strong>  " + comedor.ClaveCT.ToString();
                lblNombre.Text = "<strong>Nombre de la institución educativa:</strong>  " + escuelas.Nombre.ToString();
                lblUnidadConsumo.Text = "<strong>Tipo de Unidad de Consumo:</strong>  " + comedor.UnidadConsumo.ToString();
                lblLocalidad.Text = "<strong>Localidad:</strong>  " + escuelas.Localidad.ToString();
                lblMunicipio.Text = "<strong>Municipio:</strong>  " + escuelas.Municipio.ToString();
                lblCoordinacion.Text = "<strong>Coordinación de COEPRIS:</strong>  " + escuelas.NombreCoordinacion.ToString();
                lblTurno.Text = "<strong>Turno:</strong>  " + escuelas.Turno.ToString();
                lblTIpo.Text = "<strong>Nivel Educativo:</strong>  " + escuelas.Tipo.ToString();
                lblAmbito.Text = "<strong>Ámbito:</strong>  " + escuelas.Ambito.ToString();

                lblVialidad.Text = "<strong>Vialidad:</strong>  " + escuelas.Vialidad.ToString();
                lblColonia.Text = "<strong>Colonia:</strong>  " + escuelas.Colonia.ToString();
                lblNumExt.Text = "<strong>Número exterior:</strong>  " + escuelas.NumExt.ToString();
                lblCP.Text = "<strong>Código Postal:</strong>  " + escuelas.CP.ToString();
















            }
            catch (Exception Ex)
            {
                lblErrorModal.Text = Ex.ToString();
                StringBuilder strScript2 = new StringBuilder();
                strScript2.Append("$('#ModalSolLicSan').modal(\"show\")");
                ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);
            }

        }

    }
}