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
using Salud.Tamaulipas;

public partial class Reportes_Distintivos_Reporteador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        

        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        if (!Page.IsPostBack)
        {
            
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
            //ExportToExcel.Visible = false;
            BindData(usuarios.NumeroCoordinacion.ToString());
            ddlCoord.SelectedValue = usuarios.NumeroCoordinacion.ToString();
            NCord.InnerText = usuarios.NumeroCoordinacion.ToString();


            
        }
        //GridView2.Rows[Convert.ToInt32(id_distintivo.Value)].FindControl("Dropdownlist1").Focus();



        //StringBuilder strScript2 = new StringBuilder();
        //strScript2.Append("alert('" + (id_distintivo.Value) + "')");
        //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);
    }



    protected void ExportToExcel_Click(object sender, EventArgs e)
    {
        DataTable dataTable = ViewState["dtbl"] as DataTable;


        var dtCAN = dataTable;
        
        //dtCAN.Columns.RemoveAt(11);
        dtCAN.Columns.Remove("id_estatus");
        ExcelPackage excel = new ExcelPackage();
        var workSheet = excel.Workbook.Worksheets.Add("Value");
        var totalCols = dtCAN.Columns.Count;
        var totalRows = dtCAN.Rows.Count;

        //workSheet.Column(1).Style.Font.Color.SetColor(Color.Red);



        workSheet.Row(1).Style.Font.Color.SetColor(Color.White);
        workSheet.Row(1).Style.Fill.PatternType = ExcelFillStyle.Solid;
        workSheet.Row(1).Style.Fill.BackgroundColor.SetColor(Color.FromArgb(51,122,183));
        workSheet.Row(1).Style.Font.Bold = true;
        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        workSheet.Cells["A1"].Value = "id Distintivo";
        workSheet.Cells["B1"].Value = "Giro del establecimiento";
        workSheet.Cells["C1"].Value = "Fecha de Registro";
        workSheet.Cells["D1"].Value = "Coordinacion";
        workSheet.Cells["E1"].Value = "Municipio";
        workSheet.Cells["F1"].Value = "Localidad";
        workSheet.Cells["G1"].Value = "Nombre del establecimiento";
        workSheet.Cells["H1"].Value = "Dirección del establecimiento";
        workSheet.Cells["I1"].Value = "Nombre del responsable";
        workSheet.Cells["J1"].Value = "Teléfono";
        workSheet.Cells["K1"].Value = "Correo electrónico";
        workSheet.Cells["L1"].Value = "Medio por el cual se enteró";
        for (var col = 1; col <= totalCols; col++)
        {
            workSheet.Cells[1, col].Value = dtCAN.Columns[col - 1].ColumnName;
            //workSheet.Cells["A1:XX5000"].AutoFitColumns();
        }
        for (var row = 1; row <= totalRows; row++)
        {
            for (var col = 0; col < totalCols; col++)
            {
                workSheet.Cells[row + 1, col + 1].Value = dtCAN.Rows[row - 1][col];
                workSheet.Cells["A1:XX5000"].AutoFitColumns();//que se ajuste el tamaño de la celda dependiendo la info
                //LA LINEA QUE SIGUE ES PARA CAMBIAR EL FORMATO DEL ARCHIVO DE EXCEL A "FECHA" EN TODAS LAS FILAS DE LA COLUMNA B. 
                //Y su estructura es >>>> (Fila, Columna) = (2,2) = (2,B)
                workSheet.Cells[row + 1, 3].Style.Numberformat.Format = "dd/mmmm/yyyy hh:mm";
            }
        }
        workSheet.Cells["A1"].Value = "id Distintivo";
        workSheet.Cells["B1"].Value = "Giro del establecimiento";
        workSheet.Cells["C1"].Value = "Fecha de Registro";
        workSheet.Cells["D1"].Value = "Coordinacion";
        workSheet.Cells["E1"].Value = "Municipio";
        workSheet.Cells["F1"].Value = "Localidad";
        workSheet.Cells["G1"].Value = "Nombre del establecimiento";
        workSheet.Cells["H1"].Value = "Dirección del establecimiento";
        workSheet.Cells["I1"].Value = "Nombre del responsable";
        workSheet.Cells["J1"].Value = "Teléfono";
        workSheet.Cells["K1"].Value = "Correo electrónico";
        workSheet.Cells["L1"].Value = "Medio por el cual se enteró";
        workSheet.Cells["A1:XX5000"].AutoFitColumns();

        using (var memoryStream = new MemoryStream())
        {
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;  filename=ReporteDistintivos.xlsx");
            excel.SaveAs(memoryStream);
            memoryStream.WriteTo(Response.OutputStream);
            Response.Flush();
            Response.End();
        }
    }




   
    protected void ddlCoord_DataBound(object sender, EventArgs e)
    {
        ddlCoord.Items.Insert(0, new ListItem("Selecciona Coordinación", "-1"));
        if (ddlCoord.Items.FindByValue("87") != null)
        {
            ddlCoord.Items.FindByText("ADMINISTRADOR").Text = "TODAS LAS COORDINACIONES";
        }
       
    }
    protected void ddlCoord_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoord.Items.Remove(ddlCoord.Items.FindByValue("-1"));
        if (ddlCoord.SelectedValue.ToString() == "87")
        {
            NCord.InnerText = "Administrador";
        }
        else
        {
            NCord.InnerText = ddlCoord.SelectedValue.ToString();
        }

        BindData(ddlCoord.SelectedValue);
    }
    public DataTable BindData(string id_coordinacion)
    {
        if (id_coordinacion == "87") { id_coordinacion = "numerocoordinacion"; }
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText =
                "select id_distintivo, " +
                "bitaseg.Obtener_NombreGiro_Distintivos(id_giro) as giro" +
                ",fecha_reg " +
                ",bitaseg.Obtener_NombreCoordinacion(numerocoordinacion) as coordinacion " +
                ",municipio " +
                ",localidad " +
                ",nombreest " +
                ",('Colonia: ' + colonia + '. C.P.: ' + cp + '. Calle: ' + calle + '. NumExt: ' + numext + '. NumInt: ' + numint + '. Referencias: ' + entrecalles) as direccion " +
                //",(" +
                //"(IIF(SUBSTRING(dias_laborales, 3, 1) = '1', 'Lunes ', '')) +" +
                //"(IIF(SUBSTRING(dias_laborales, 7, 1) = '1', 'Martes ', '')) +" +
                //"(IIF(SUBSTRING(dias_laborales, 11, 1) = '1', 'Miércoles ', '')) +" +
                //"(IIF(SUBSTRING(dias_laborales, 15, 1) = '1', 'Jueves ', '')) +" +
                //"(IIF(SUBSTRING(dias_laborales, 19, 1) = '1', 'Viernes ', '')) +" +
                //"(IIF(SUBSTRING(dias_laborales, 23, 1) = '1', 'Sábado ', '')) +" +
                //"(IIF(SUBSTRING(dias_laborales, 27, 1) = '1', 'Domingo ', '')) " +
                //") as dias_laborales2 " +
                //",hest " +
                ",(nombre + ' ' + apellidop + ' ' + apellidom) as Nombre_Responsable " +
                ",tel " +
                ",correo " +
                ",id_estatus,nombre_estatus,medio_conocido "  +
                "from bitaseg.Distintivos_Registros where (id_giro <> 13 and id_giro <> 14) and numerocoordinacion=" + id_coordinacion+" order by fecha_reg";
        cmd.Connection = cnn;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        ViewState["dtbl"] = dt;
        
        
        return dt;
    }






    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Obtener el ID de la consulta para luego ponerlo como el selected value
            int n = Convert.ToInt32((e.Row.FindControl("id_estatus") as Label).Text);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = Principal.CnnStr0;
            con.Open();
            DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);


            SqlCommand cmd = new SqlCommand("select * from bitaseg.Estatus_Distintivo", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();

            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "nombre_estatus";
            DropDownList1.DataValueField = "id_estatus";
            DropDownList1.DataBind();

            //nombre_ddl.Value = DropDownList1.ID;
            //id_estatus_ddl.Value = DropDownList1.SelectedValue;
            var row_index = e.Row.RowIndex.ToString();

            if (n==0) {
                DropDownList1.Items.Insert(0, new ListItem("--Selecciona un estatus--", "0"));
            }
            //poner el selected value
            DropDownList1.Text = n.ToString();
            //DropDownList1.Width = System.Web.UI.WebControls.Unit.Percentage(100);

            
            
           
            
            
            //StringBuilder strScript2 = new StringBuilder();
            //strScript2.Append("alert('')");
            //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);

        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        DropDownList ddl = sender as DropDownList;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        //Estatus que tiene cada que se recarga
        var x = row.FindControl("id_estatus") as Label;
        //Id del Customer
        var y = row.FindControl("id_distintivo") as Label;
        var z = row.RowIndex.ToString();

        id_distintivo.Value = z;
       
        if (Convert.ToInt32(ddl.SelectedValue) != 0)
        {

            try
            {

                SqlConnection cna = new SqlConnection();
                cna.ConnectionString = Principal.CnnStr0;
                cna.Open();
                SqlCommand cma = new SqlCommand("UPDATE bitaseg.Distintivos_Registros SET id_estatus = ('" + ddl.SelectedValue + "'),nombre_estatus = ('" + ddl.SelectedItem.Text + "') where id_Distintivo = ('" + y.Text + "') ");
                cma.Connection = cna;
                cma.ExecuteNonQuery();
                cna.Close();
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
            }





            //nombre_ddl.Value = ddl.ClientID;

            //Response.Write("<script>alert('El id_Estatus es: "+ x.Text+ " y el id_Distintivo es:  "+y.Text +"')</script>");
            //Response.Write("<script>alert('"+ row.RowIndex.ToString() + "')</script>");

            //StringBuilder strScript2 = new StringBuilder();
            //strScript2.Append("alert('" + y.Text + "');");
            //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);


            if (id_distintivo.Value != "")
            {
                GridView2.Rows[Convert.ToInt32(id_distintivo.Value)].FindControl("Dropdownlist1").Focus();



                //StringBuilder strScript2 = new StringBuilder();
                //strScript2.Append("alert('" + (id_distintivo.Value) + "')");
                //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);
            }
        }
    }
    protected void GridView2_Sorting(object sender, GridViewSortEventArgs e)//Cuando se da click en el Header
    {
        
        
        DataTable dataTable = ViewState["dtbl"] as DataTable;

        

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);


            switch (sort.Value.ToString())
            {
                case "":
                case null:
                    dataView.Sort = e.SortExpression + " " + "ASC";
                    sort.Value = "ASC";
                    break;
                case "ASC":
                    dataView.Sort = e.SortExpression + " " + "DESC";
                    sort.Value = "DESC";
                    break;
                case "DESC":
                    dataView.Sort = e.SortExpression + " " + "ASC";
                    sort.Value = "ASC";
                    break;
                default:
                    
                    break;
                    
            }
            dataTable = dataView.ToTable();
            ViewState["dtbl"] = dataTable;


            GridView2.DataSource = dataView;
            GridView2.DataBind();

            //Response.Write("<script>alert('" + sort.Value + "')</script>");
        }
    }




}