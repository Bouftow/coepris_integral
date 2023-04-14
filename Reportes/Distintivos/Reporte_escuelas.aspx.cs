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

public partial class Reportes_Distintivos_Reporte_escuelas : System.Web.UI.Page
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
            BindData_MSYS(usuarios.NumeroCoordinacion.ToString());
            ddlCoord.SelectedValue = usuarios.NumeroCoordinacion.ToString();
            NCord.InnerText = usuarios.NumeroCoordinacion.ToString();

        }
    }

    protected void ExportToExcel_Click(object sender, EventArgs e)
    {
        DataTable dataTable = ViewState["dtbl"] as DataTable;


        var dtCAN = dataTable;

        //dtCAN.Columns.RemoveAt(11);
        dtCAN.Columns.Remove("id_estatus");
        dtCAN.Columns.Remove("id_distintivo");
        dtCAN.Columns.Remove("sesion");
        ExcelPackage excel = new ExcelPackage();
        var workSheet = excel.Workbook.Worksheets.Add("Value");
        var totalCols = dtCAN.Columns.Count;
        var totalRows = dtCAN.Rows.Count;

        //workSheet.Column(1).Style.Font.Color.SetColor(Color.Red);



        workSheet.Row(1).Style.Font.Color.SetColor(Color.White);
        workSheet.Row(1).Style.Fill.PatternType = ExcelFillStyle.Solid;
        workSheet.Row(1).Style.Fill.BackgroundColor.SetColor(Color.FromArgb(51, 122, 183));
        workSheet.Row(1).Style.Font.Bold = true;
        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        workSheet.Cells["A1"].Value = "Folio";
        workSheet.Cells["B1"].Value = "Fecha de Registro";
        workSheet.Cells["C1"].Value = "Coordinacion";
        workSheet.Cells["D1"].Value = "Municipio";
        workSheet.Cells["E1"].Value = "Localidad";
        workSheet.Cells["F1"].Value = "Nombre de la institución";
        workSheet.Cells["G1"].Value = "Clave del Centro de Trabajo";
        workSheet.Cells["H1"].Value = "Nivel Educativo";
        workSheet.Cells["I1"].Value = "Dirección de la institución";
        workSheet.Cells["J1"].Value = "Nombre del responsable";
        workSheet.Cells["L1"].Value = "Teléfono";
        workSheet.Cells["L1"].Value = "Correo electrónico";
        workSheet.Cells["M1"].Value = "Estatus actual";
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
                workSheet.Cells[row + 1, 2].Style.Numberformat.Format = "dd/mmmm/yyyy hh:mm";
            }
        }
        workSheet.Cells["A1"].Value = "Folio";
        workSheet.Cells["B1"].Value = "Fecha de Registro";
        workSheet.Cells["C1"].Value = "Coordinacion";
        workSheet.Cells["D1"].Value = "Municipio";
        workSheet.Cells["E1"].Value = "Localidad";
        workSheet.Cells["F1"].Value = "Nombre de la institución";
        workSheet.Cells["G1"].Value = "Clave del Centro de Trabajo";
        workSheet.Cells["H1"].Value = "Nivel Educativo";
        workSheet.Cells["I1"].Value = "Dirección de la institución";
        workSheet.Cells["J1"].Value = "Nombre del responsable";
        workSheet.Cells["L1"].Value = "Teléfono";
        workSheet.Cells["L1"].Value = "Correo electrónico";
        workSheet.Cells["M1"].Value = "Estatus actual";
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
    protected void ExportToExcel_ClickMSYS(object sender, EventArgs e)
    {
        DataTable dataTable = ViewState["dtbl3"] as DataTable;


        var dtCAN = dataTable;

        //dtCAN.Columns.RemoveAt(11);
        dtCAN.Columns.Remove("id_estatus");
        dtCAN.Columns.Remove("id_distintivo");
        dtCAN.Columns.Remove("sesion");
        ExcelPackage excel = new ExcelPackage();
        var workSheet = excel.Workbook.Worksheets.Add("Value");
        var totalCols = dtCAN.Columns.Count;
        var totalRows = dtCAN.Rows.Count;

        //workSheet.Column(1).Style.Font.Color.SetColor(Color.Red);



        workSheet.Row(1).Style.Font.Color.SetColor(Color.White);
        workSheet.Row(1).Style.Fill.PatternType = ExcelFillStyle.Solid;
        workSheet.Row(1).Style.Fill.BackgroundColor.SetColor(Color.FromArgb(51, 122, 183));
        workSheet.Row(1).Style.Font.Bold = true;
        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        workSheet.Cells["A1"].Value = "Folio";
        workSheet.Cells["B1"].Value = "Fecha de Registro";
        workSheet.Cells["C1"].Value = "Coordinacion";
        workSheet.Cells["D1"].Value = "Municipio";
        workSheet.Cells["E1"].Value = "Localidad";
        workSheet.Cells["F1"].Value = "Nombre de la institución";
        workSheet.Cells["G1"].Value = "Clave del Centro de Trabajo";
        workSheet.Cells["H1"].Value = "Nivel Educativo";
        workSheet.Cells["I1"].Value = "Colonia";
        workSheet.Cells["J1"].Value = "CP";
        workSheet.Cells["K1"].Value = "Calle";
        workSheet.Cells["L1"].Value = "NumExt";
        workSheet.Cells["M1"].Value = "NumInt";
        workSheet.Cells["N1"].Value = "Entrecalles";
        workSheet.Cells["O1"].Value = "Nombre del responsable";
        workSheet.Cells["P1"].Value = "Teléfono";
        workSheet.Cells["Q1"].Value = "Correo electrónico";
        workSheet.Cells["R1"].Value = "Estatus actual";
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
                workSheet.Cells[row + 1, 2].Style.Numberformat.Format = "dd/mmmm/yyyy hh:mm";
            }
        }
        workSheet.Cells["A1"].Value = "Folio";
        workSheet.Cells["B1"].Value = "Fecha de Registro";
        workSheet.Cells["C1"].Value = "Coordinacion";
        workSheet.Cells["D1"].Value = "Municipio";
        workSheet.Cells["E1"].Value = "Localidad";
        workSheet.Cells["F1"].Value = "Nombre de la institución";
        workSheet.Cells["G1"].Value = "Clave del Centro de Trabajo";
        workSheet.Cells["H1"].Value = "Nivel Educativo";
        workSheet.Cells["I1"].Value = "Colonia";
        workSheet.Cells["J1"].Value = "CP";
        workSheet.Cells["K1"].Value = "Calle";
        workSheet.Cells["L1"].Value = "NumExt";
        workSheet.Cells["M1"].Value = "NumInt";
        workSheet.Cells["N1"].Value = "Entrecalles";
        workSheet.Cells["O1"].Value = "Nombre del responsable";
        workSheet.Cells["P1"].Value = "Teléfono";
        workSheet.Cells["Q1"].Value = "Correo electrónico";
        workSheet.Cells["R1"].Value = "Estatus actual";
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

    public DataTable BindData(string id_coordinacion)
    {
        if (id_coordinacion == "87") { id_coordinacion = "numerocoordinacion"; }
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText =
                "select id_distintivo " +
                ",folio " +
                ",fecha_reg " +
                ",bitaseg.Obtener_NombreCoordinacion(numerocoordinacion) as coordinacion " +
                ",municipio " +
                ",localidad " +
                ",nombreest as nombre_escuela " +

                ",razon_social " +
                ",IIF(nivel_educativo is null, 'No se seleccionó ningun nivel', nivel_educativo) as nivel_educativo " +
                ",('Colonia: ' + colonia + '. C.P.: ' + cp + '. Calle: ' + calle + '. NumExt: ' + numext + '. NumInt: ' + numint + '. Referencias: ' + entrecalles) as direccion " +

                ",(nombre + ' ' + apellidop + ' ' + apellidom) as Nombre_Responsable " +
                ",tel " +
                ",correo " +
                ",id_estatus " +
                ",sesion " +

                ",nombre_estatus " +
                "from bitaseg.Distintivos_Registros where sesion is not null and (id_giro = 13 or id_giro=14) order by fecha_reg";
        cmd.Connection = cnn;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        ViewState["dtbl"] = dt;
        return dt;
    }

    public DataTable BindData_MSYS(string id_coordinacion)
    {
        if (id_coordinacion == "87") { id_coordinacion = "numerocoordinacion"; }
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText =
                "select id_distintivo " +
                ",folio " +
                ",fecha_reg " +
                ",bitaseg.Obtener_NombreCoordinacion(numerocoordinacion) as coordinacion " +
                ",municipio " +
                ",localidad " +
                ",nombreest as nombre_escuela " +

                ",razon_social " +
                ",IIF(nivel_educativo is null, 'No se seleccionó ningun nivel', nivel_educativo) as nivel_educativo " +
                ",colonia, cp, calle, numext, numint,  entrecalles" +

                ",(nombre + ' ' + apellidop + ' ' + apellidom) as Nombre_Responsable " +
                ",tel " +
                ",correo " +
                ",id_estatus " +
                ",sesion " +

                ",nombre_estatus " +
                "from bitaseg.Distintivos_Registros where sesion is not null and (id_giro = 13 or id_giro=14) and nivel_educativo like '%superior%' order by fecha_reg";
        cmd.Connection = cnn;
        DataTable dt3 = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt3);
        GridView3.DataSource = dt3;
        GridView3.DataBind();
        ViewState["dtbl3"] = dt3;
        return dt3;
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

    //protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        //Obtener el ID de la consulta para luego ponerlo como el selected value
    //        int n = Convert.ToInt32((e.Row.FindControl("id_estatus") as Label).Text);

    //        SqlConnection con = new SqlConnection();
    //        con.ConnectionString = Principal.CnnStr0;
    //        con.Open();
    //        DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);


    //        SqlCommand cmd = new SqlCommand("select * from bitaseg.Estatus_Distintivo", con);
    //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
    //        DataTable dt = new DataTable();
    //        sda.Fill(dt);
    //        con.Close();

    //        DropDownList1.DataSource = dt;
    //        DropDownList1.DataTextField = "nombre_estatus";
    //        DropDownList1.DataValueField = "id_estatus";
    //        DropDownList1.DataBind();
    //        if (n==0) {
    //            DropDownList1.Items.Insert(0, new ListItem("--Selecciona un estatus--", "0"));
    //        }
    //        //poner el selected value
    //        DropDownList1.Text = n.ToString();
    //        //DropDownList1.Width = System.Web.UI.WebControls.Unit.Percentage(100);
    //    }


    //}
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    DropDownList ddl = sender as DropDownList;
    //    GridViewRow row = (GridViewRow)ddl.NamingContainer;
    //    //Estatus que tiene cada que se recarga
    //    var x = row.FindControl("id_estatus") as Label;
    //    //Id del Customer
    //    var y = row.FindControl("id_distintivo") as Label;

    //    if (Convert.ToInt32(ddl.SelectedValue) != 0)
    //    {

    //        try
    //        {

    //            SqlConnection cna = new SqlConnection();
    //            cna.ConnectionString = Principal.CnnStr0;
    //            cna.Open();
    //            SqlCommand cma = new SqlCommand("UPDATE bitaseg.Distintivos_Registros SET id_estatus = ('" + ddl.SelectedValue + "'),nombre_estatus = ('" + ddl.SelectedItem.Text + "') where id_Distintivo = ('" + y.Text + "') ");
    //            cma.Connection = cna;
    //            cma.ExecuteNonQuery();
    //            cna.Close();
    //        }
    //        catch (Exception ex)
    //        {
    //            LblMsg.Text = ex.Message;
    //        }

    //        //Response.Write("<script>alert('El id_Estatus es: "+ x.Text+ " y el id_Distintivo es:  "+y.Text +"')</script>");

    //    }
    //}
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