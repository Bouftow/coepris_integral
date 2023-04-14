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

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ////PARA BORRAR LAS COOKIES PARA TODOS
        //try { 
        

        //    HttpCookie ExampleCookie = Request.Cookies["NombreCorto"];
        //    ExampleCookie.Value= "";
        //    HttpCookie ExampleCookie2 = Request.Cookies["NombreCompleto"];
        //    ExampleCookie2.Value = "";
        //    Response.Cookies.Add(ExampleCookie);
        //    Response.Cookies.Add(ExampleCookie2);

        //}
        //catch(Exception Ex)
        //{
        //    throw Ex;
        //}

        StringBuilder strScript = new StringBuilder();
        ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
      
        if (!Page.IsPostBack)
        {
            dos.Visible = false;
            tres.Visible = false;
            aparecer.Visible = false;
        }
        else
        {
            try { 
            ddlGiros.Items[0].Enabled = false;
            }
            catch (Exception Ex) { }
        }
            

    }
    private void CargarDDLGiros()
    {
        try {

            ddlGiros.DataSource = GetData("bitaseg.spGetDistintivosGiros", null);
            ddlGiros.DataBind();
            ListItem liGiros = new ListItem("Seleccione un giro", "-1");
            ddlGiros.Items.Insert(0, liGiros);

        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
        }
    }
    private DataSet GetData(string SPName, SqlParameter SPParameter)

    {
        string CS = ConfigurationManager.ConnectionStrings["dbCnnStr"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        SqlDataAdapter da = new SqlDataAdapter(SPName, con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        if (SPParameter != null)
        {
            da.SelectCommand.Parameters.Add(SPParameter);
        }


        DataSet DS = new DataSet();
        da.Fill(DS);
        return DS;

    }

    protected void ddlGiros_SelectedIndexChanged(object sender, EventArgs e)
    {

        aparecer.Visible = true;
        SG.Visible = false;
        //SH.Visible = false;
        //EmbedSrc = "Archivos/Giros/" + ddlGiros.SelectedItem.Text.ToString() + ".pdf";
        //Response.Write("<script>alert('"+EmbedSrc.ToString()+"')</script>");

        //embed.Text = string.Format("<embed src=\"{0}\" type=\"application/pdf\" style=\"border:dotted\" width=\"100%\" height=\"500px\"></embed>", "Archivos/Giros/" + ddlGiros.SelectedItem.Text.ToString() + ".pdf");
        //embed.Text = string.Format("<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"500px\"><p class=\"text-center\">Tu navegador no cuenta con lectura de archivos en formato PDF. </br>  En lugar de eso <a href = \"Archivos/Giros/Giro1.pdf\">clic aquí para descargar el archivo PDF.</a></p></object>", "Archivos/Giros/" + ddlGiros.SelectedItem.Text.ToString() + ".pdf");
        
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select iframe from bitaseg.Distintivos_Giros where id_giro=@id_Giro";
            cmd.Parameters.Add("@id_giro", SqlDbType.VarChar, 20).Value = ddlGiros.SelectedValue;
            cmd.Connection = cnn;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                    embed.Text= dr["iframe"].ToString();

                if (ddlGiros.SelectedValue == "13" || ddlGiros.SelectedValue == "14")
                {
                    embedvideo.Text = "<iframe src=\"https://drive.google.com/file/d/1QDg89JdFCjzKthTytS32UhBDxUjFcmRf/preview\" width=\"100%\" height =\"500\" ></iframe>".ToString();

                }
                else { embedvideo.Text = ""; }

            }
            dr.Close();
            cnn.Close();
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

        
            //Response.Write("<script>alert('" + ddlGiros.SelectedValue.ToString() + "')</script>");
        //Esta es una opción para cargar un script jquery
        //StringBuilder strScript = new StringBuilder();
        //strScript.Append("$('#ModalSolLicSan').modal(\"show\")");
        //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);


    }

    protected void btn_registro_ServerClick(object sender, EventArgs e)
    {
        if (ddlGiros.SelectedValue == "13" || ddlGiros.SelectedValue == "14" )
        {
            Response.Redirect("Registro_Escuelas.aspx?id=" + ddlGiros.SelectedValue.ToString() + "");
        }
        else
        {
            Response.Redirect("Registro.aspx?id=" + ddlGiros.SelectedValue.ToString() + "");
        }
    }

    protected void btn_descargar_ServerClick(object sender, EventArgs e)
    {
        try
        {
            string NombrePDF = "";
            if (ddlGiros.SelectedItem.Value == "5") { NombrePDF = "Textiles.pdf"; }
            else { NombrePDF = ddlGiros.SelectedItem.ToString() + ".pdf"; }
            
            var filePath = Server.MapPath(@"~/Distintivo/Archivos/Giros/" + NombrePDF + "");
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + NombrePDF + "\"");
            Response.TransmitFile(filePath);
            Response.End();
        }
        catch (Exception Ex)
        {
            LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);
            
        }
        //var coverFolderPath1 = 
        //var directory = new DirectoryInfo(coverFolderPath1);

        //// or...
        //FileInfo myFile = directory.GetFiles().First();

        //Response.AddHeader("Content-Disposition", "attachment;filename=\"" +"amix.pdf"+ "\"");
        //Response.TransmitFile(myFile.FullName);
        //Response.End();
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        //imgDistintivo.Visible = false;
        uno.Visible = false;
        dos.Visible = true;
        tres.Visible = true;
        CargarDDLGiros();
    }
}