using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Configuration;

public partial class Reportes_Reporte_Memo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
        MostrarDatos();

    }

    void MostrarDatos()
    {
        try
        {
            Usuarios usuarios = new Usuarios();
            usuarios.DatosDeRegistro(User.Identity.Name);
            var numcord = usuarios.NumeroCoordinacion;
            //Response.Write("<script>alert('" + "memo-cis" + "')</script>");
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_CargarGrids";
            cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = numcord;
            cmd.Parameters.Add("@grid", SqlDbType.VarChar, 20).Value = "memo_cis";
            cmd.Connection = cnn;
            DataTable dtueas = new DataTable();
            SqlDataAdapter daueas = new SqlDataAdapter(cmd);
            daueas.Fill(dtueas);
            grdUEAS.DataSource = dtueas;
            grdUEAS.DataBind();




            string[] words = { "The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog." };

            var unreadablePhrase = string.Concat(words);
           // System.Console.WriteLine(unreadablePhrase);

            var readablePhrase = string.Join(" ", words);
            // System.Console.WriteLine(readablePhrase);



            // Taking a string 
            String str = "Geeks, For, Ge,eks";
            //String str = grdUEAS.Rows[4].ToString();

            String[] spearator = { "," };

            // using the method 
            String[] strlist = str.Split(spearator,StringSplitOptions.RemoveEmptyEntries);

            foreach (String s in strlist)
            {
                Response.Write("<script>alert('" + s + "');</script>");
            }

            cnn.Close(); // siempre cerrar conexiones. 
        }
        catch (Exception Ex)
        {
            /// Lblmsg.Text = Ex.Message;
            Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MostrarDatos();
        UpdatePanel1.Update();
    }
}