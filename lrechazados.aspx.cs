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


public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (RadioButtonList1.SelectedValue == "1") { labelxd.InnerText = "Registro"; }
        else { labelxd.InnerText = "Rechazo"; }
        Calendar1.SelectionChanged += new EventHandler(this.Selection_Change);
        if (!Page.IsPostBack)
        {
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
            ExportToExcel.Visible = false;
           
            rech.Text = "true";
        }
    }


    protected void Selection_Change(Object sender, EventArgs e)
    {

        Fecha1.Text = "";
        foreach (DateTime day in Calendar1.SelectedDates)
        {
            Fecha1.Text = day.Date.ToString("yyyy-MM-dd");

        }
    }
    protected void Selection_Change2(Object sender, EventArgs e)
    {

        Fecha2.Text = "";
        foreach (DateTime day in Calendar2.SelectedDates)
        {
            Fecha2.Text = day.Date.ToString("yyyy-MM-dd");

        }
    }

    protected void grdCancelados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Create an instance of the datarow
            DataRowView rowData = (DataRowView)e.Row.DataItem;
            //use this object to test data to make decisions
            string myColumnId = (rowData["rechazo"].ToString());
            //e.Row.Cells[5].Font.Bold = true;
            e.Row.Cells[6].ForeColor = Color.Black;
            // Response.Write("<script>alert('Jaja " + myColumnId + "') </script>");


            string a = (rowData["folio"].ToString());

            //Button button = new Button();
            //button.ID = rowData["folio"].ToString();
            //button.Text = "Ver Datos";
            //button.Click += new EventHandler(Unnamed_Click);
            //button.CssClass = "boton-azo";
            //button.Attributes.Add("onserverclick", "window.location ='~/VerDatos.aspx?id=" + a.ToString() + "'");

            //e.Row.Cells[1].Controls.Add(button);


        }

        // button.Attributes.Add("autopostback", "false");
        // button.Text = (rowData["folio"].ToString());
        // button.Attributes.Add("onserverclick", "window.location ='~/VerDatos.aspx?id=" + a.ToString()+"'") ;
        // button.Click += (s, r) => { Response.Redirect(Page.ResolveClientUrl("~/VerDatos.aspx?id=" + a.ToString() + ""));};
        // Response.Redirect(Page.ResolveClientUrl("~/VerDatos.aspx?id=" + a.ToString() + ""));

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {

        string Text = ((Button)sender).Text;
        string ID = ((Button)sender).Text;
        Response.Write("<script>alert('a') </script>");
        //Response.Redirect(Page.ResolveClientUrl("~/VerDatos.aspx?id=" + ID.ToString() + ""));
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
           
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grdCancelados.Rows[rowIndex];
            
            string folio = row.Cells[1].Text;

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('\\nFolio: " + country + "');", true);
            Response.Redirect(Page.ResolveClientUrl("~/VerDatos.aspx?id=" + folio + ""));

        }
    }
        protected void Button_Click(object sender, EventArgs e)
    {

        if ((Fecha1.Text != null && Fecha1.Text != "") || (Fecha2.Text != null && Fecha2.Text != ""))
        {
            try
            {
                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = Principal.CnnStr0;
                cnn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cnn;
                cmd.CommandText = "bitaseg.proc_RechazadosRango";

                cmd.Parameters.Add("@fecha1", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha1.Text);
                cmd.Parameters.Add("@fecha2", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha2.Text);
                cmd.Parameters.Add("@value", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonList1.SelectedValue);
                cmd.Parameters.Add("@Estados", SqlDbType.NVarChar, -1).Value = "Rechazados";
                DataTable dtCAN = new DataTable();
                SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
                daCAN.Fill(dtCAN);
                grdCancelados.DataSource = dtCAN;
                grdCancelados.DataBind();
                //SqlDataReader dr = cmd.ExecuteReader();
                //if (dr.Read())
                //{

                //    r1.InnerText = (string)dr["folioseguimiento"];
                //    r2.InnerText = (string)dr["riesgo"];



                //}
                //dr.Close();
                cnn.Close();

                ExportToExcel.Visible = true;
                //grdCancelados.Columns[].Visible = false;
                //Response.Write("<script>alert('" + Convert.ToInt32(RadioButtonList1.SelectedValue) + "||" + Convert.ToDateTime(Message.Text) + "') </script>");
            }

            catch (Exception Ex)
            {
                Response.Write("<script>alert('" + Ex.Message + RadioButtonList1.SelectedValue + Convert.ToDateTime(Fecha2.Text) + "') </script>");
            }
        }
        else
        {
            Response.Write("<script>alert(' Seleccione un rango de fechas ') </script>");

        }
    }



    public DataTable Value()
    {
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = cnn;
        cmd.CommandText = "bitaseg.proc_RechazadosRango";

        cmd.Parameters.Add("@fecha1", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha1.Text);
        cmd.Parameters.Add("@fecha2", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha2.Text);
        cmd.Parameters.Add("@value", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonList1.SelectedValue);
        cmd.Parameters.Add("@Estados", SqlDbType.NVarChar, -1).Value = "Rechazados";
        DataTable dtCAN = new DataTable();
        SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
        daCAN.Fill(dtCAN);
        grdCancelados.DataSource = dtCAN;
        grdCancelados.DataBind();
        cnn.Close();
        return dtCAN;
    }

    protected void ExportToExcel_Click(object sender, EventArgs e)
    {
        var dtCAN = Value();
        ExcelPackage excel = new ExcelPackage();
        var workSheet = excel.Workbook.Worksheets.Add("Value");
        var totalCols = dtCAN.Columns.Count;
        var totalRows = dtCAN.Rows.Count;

        for (var col = 1; col <= totalCols; col++)
        {
            workSheet.Cells[1, col].Value = dtCAN.Columns[col - 1].ColumnName;
            workSheet.Cells["A1:K20"].AutoFitColumns();
        }
        for (var row = 1; row <= totalRows; row++)
        {
            for (var col = 0; col < totalCols; col++)
            {
                workSheet.Cells[row + 1, col + 1].Value = dtCAN.Rows[row - 1][col];
                workSheet.Cells["A1:K20"].AutoFitColumns();
            }
        }
        using (var memoryStream = new MemoryStream())
        {
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;  filename=ReporteTramites.xlsx");
            excel.SaveAs(memoryStream);
            memoryStream.WriteTo(Response.OutputStream);
            Response.Flush();
            Response.End();
        }
    }

    //protected void Prueba_Click(object sender, EventArgs e)
    //{
    //    Response.Write("<script>alert('a')</script>");
    //}
}