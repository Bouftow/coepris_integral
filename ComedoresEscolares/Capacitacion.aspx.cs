using System;
using System.Web.UI;
using Salud.Tamaulipas;
using System.Text;
using System.Data.SqlClient;
public partial class Default : System.Web.UI.Page
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            try
            {
              
               
                //I82X5exjK422E8H+qZdAJg==
                var id_decrypt = cripto.Decrypt(Request.Params["id"].ToString());
                Comedores comedores = new Comedores(Convert.ToInt32(id_decrypt));

                
                //LblMsg.Text = "<br />" + MessageStyles.Danger(Convert.ToInt32(id_decrypt).ToString(), false);
                //LblMsg.Text = LblMsg.Text+ "<br />" + MessageStyles.Danger(comedores.Folio.ToString(), false);


            }
            catch (Exception Ex)
            {

                //LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);
                lblErrorModal.Text = "Para poder continuar a la capacitación es necesario registrarse, de clic en el botón de abajo para ir a la pantalla de registro";
                btn_registro.InnerText = "Volver al registro";
                //lblErrorModal.Text = lblErrorModal.Text +  "<br />" + MessageStyles.Danger(Ex.Message, false);
                StringBuilder strScript2 = new StringBuilder();
                strScript2.Append("$('#ModalSolLicSan').modal(\"show\")");
                ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);

            }
        }
    }

    protected void btn_registro_ServerClick(object sender, EventArgs e)
    {
        if (btn_registro.InnerText == "Volver al registro") { Response.Redirect("Registro.aspx"); }
        try
        {
            var id_decrypt = cripto.Decrypt(Request.Params["id"].ToString());
            Comedores comedor = new Comedores(Convert.ToInt32(id_decrypt));

            if (comedor.Capacitado == false)
            {
                SqlConnection cna = new SqlConnection();
                cna.ConnectionString = Principal.CnnStr0;
                cna.Open();
                SqlCommand cma = new SqlCommand("UPDATE bitaseg.Comedores_Escuelas SET capacitado = 1  where id_comedor = ('" + id_decrypt + "') ");
                cma.Connection = cna;
                cma.ExecuteNonQuery();
                cna.Close();
            }
           
            if (txtVerif.Value != "")
            {


                var id_encrypt = Request.Params["id"].ToString();
                id_encrypt = id_encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");

                Response.Redirect("gracias.aspx?id=" + id_encrypt);


                //Response.Redirect("Gracias.aspx");
            }
        }
        catch (Exception Ex)
        {

            LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);
            StringBuilder strScript2 = new StringBuilder();
            strScript2.Append("$('#ModalSolLicSan').modal(\"show\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);




        }

        
    }




   
}