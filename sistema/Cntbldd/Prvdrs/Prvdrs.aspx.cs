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
using System.ComponentModel;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.Services;
using System.Linq;
using System.Xml.Linq;
using System.Globalization;


public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Usuarios usuarios = new Usuarios();
        //usuarios.DatosDeRegistro(User.Identity.Name);
        //if (usuarios.Rol != "admin")
        //{
        //    if (usuarios.Rol != "todos") {
        //    Response.Write("<script>alert('No tiene permisos. Contacte al administrador');window.location ='../../admin/default.aspx';</script>");
        //    }
        //}
        //ocultar.Visible = false;
        //if (RadioButtonList1.SelectedValue == "1") { labelxd.InnerText = "Registro"; }
        //else { labelxd.InnerText = "Rechazo"; }
        //Calendar1.SelectionChanged += new EventHandler(this.Selection_Change);
        if (!Page.IsPostBack)
        {
           
            NCord.InnerText= DropDownList1.SelectedValue;
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
            //ExportToExcel.Visible = false;

        }
        //if (Page.IsPostBack) {
          
        //}
    }


    //protected void Selection_Change(Object sender, EventArgs e)
    //{

    //    Fecha1.Text = "";
    //    foreach (DateTime day in Calendar1.SelectedDates)
    //    {
    //        Fecha1.Text = day.Date.ToString("yyyy-MM-dd");

    //    }
    //}
    //protected void Selection_Change2(Object sender, EventArgs e)
    //{

    //    Fecha2.Text = "";
    //    foreach (DateTime day in Calendar2.SelectedDates)
    //    {
    //        Fecha2.Text = day.Date.ToString("yyyy-MM-dd");

    //    }
    //}

   
    protected void Button_Click(object sender, EventArgs e)
    {

        if ((Fecha1.Text != null && Fecha1.Text != "") || (Fecha2.Text != null && Fecha2.Text != ""))
        {
            try
            {
                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = Principal.CnnStr0;
                cnn.Open();
               
                var chkproveedor = chklist.Items[0].Selected;
                var proveedor = "";
                if (chkproveedor == true) { proveedor = "nombre_proveedor"; }
                else proveedor = "''";

                var chkinsumos = chklist.Items[1].Selected;
                var insumos = "";
                if (chkinsumos == true) { insumos = "insumos_adquiridos"; }
                else insumos = "''";

                var chkmonto = chklist.Items[2].Selected;
                var monto = "";
                if (chkmonto == true) { monto = "('$'+ monto) as monto"; }
                else monto = "''";

                var chkfecha_factura = chklist.Items[3].Selected;
                var fecha_factura = "";
                if (chkfecha_factura == true) { fecha_factura = "fecha_factura"; }
                else fecha_factura = "''";

                var chkdireccion = chklist.Items[5].Selected;
                var direccion = "";
                if (chkdireccion == true) { direccion = "(municipio + ', ' + colonia + ', ' + calle) as direccion"; }
                else direccion = "''";

                var chktelefono = chklist.Items[4].Selected;
                var telefono = "";
                if (chktelefono == true) { telefono = "telefono"; }
                else telefono = "''";

                var chkuser_reg = chklist.Items[6].Selected;
                var user_reg = "";
                if (chkuser_reg == true) { user_reg = "Proveedores_Insumos.user_reg"; }
                else user_reg = "''";

                var chkfecha_reg = chklist.Items[7].Selected;
                var fecha_reg = "";
                if (chkfecha_reg == true) { fecha_reg = " Proveedores_Insumos.fecha_reg"; }
                else fecha_reg = "''";

                


                var fecha1 = Convert.ToDateTime(Fecha1.Text);
                var fecha2 = Convert.ToDateTime(Fecha2.Text);

                var coord = "";
                if (DropDownList1.SelectedValue.ToString() != "-1") { coord = DropDownList1.SelectedValue; }
                else { coord = "proveedores_insumos.coordinacion"; }


                var todo = "''";
                var a = Convert.ToInt32(chklist.Items[0].Selected)
                      + Convert.ToInt32(chklist.Items[1].Selected)
                      + Convert.ToInt32(chklist.Items[2].Selected)
                      + Convert.ToInt32(chklist.Items[3].Selected)
                      + Convert.ToInt32(chklist.Items[4].Selected)
                      + Convert.ToInt32(chklist.Items[5].Selected)
                      + Convert.ToInt32(chklist.Items[6].Selected)
                      + Convert.ToInt32(chklist.Items[7].Selected);



                if (a == 0)
                {
                    Response.Write("<script>alert(a) </script>");

                    todo = " nombre_proveedor, (municipio+', ' + colonia+ ', ' +calle)as direccion, telefono, insumos_adquiridos, monto, fecha_factura, Proveedores_Insumos.fecha_reg, Proveedores_Insumos.user_reg";

                }

                var dropdown = Convert.ToInt32(DropDownList2.SelectedValue);
                var ordenar = "";
                switch (dropdown)

                {
                    case 0:
                        ordenar = "nombre_proveedor";
                        break;
                    case 1:
                        ordenar = "insumos_adquiridos";
                        break;
                    case 2:
                        ordenar = "monto";
                        break;
                    case 3:
                        ordenar = "fecha_factura";
                        break;
                    case 4:
                        ordenar = "direccion";
                        break;
                    case 5:
                        ordenar = "telefono";
                        break;
                    case 6:
                        ordenar = "Proveedores_Insumos.user_reg";
                        break;
                    case 7:
                        ordenar = "Proveedores_Insumos.fecha_reg";
                        break;


                    default:
                        break;
                }
                var ak = "";
                var asdc = valor.Value;

                if (asdc == "0") { ak = " asc"; } else ak = "desc";

                var between = "Proveedores_Insumos.fecha_reg";
                if (Radio2.Checked == true) { between = "proveedores_insumos.fecha_factura"; }
                else between = "Proveedores_Insumos.fecha_reg";
               




                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select proveedores.id_proveedor, " + proveedor + ", " + telefono + ", " + direccion + "," + insumos + "," + monto + "," + fecha_factura + "," + user_reg + "," + fecha_reg + "," + todo + " " +
                    "from bitaseg.Proveedores_Insumos inner join bitaseg.proveedores on Proveedores_Insumos.id_proveedor = proveedores.id_proveedor " +
                    "where (nombre_proveedor LIKE '%" + like.Text + "%') and Proveedores_Insumos.coordinacion=" + coord + " and " + between + " between CONVERT(datetime,('" + fecha1.ToString("s") + "')) and  CONVERT(datetime,('" + fecha2.ToString("s") + "'))" +
                    "Order by " + ordenar + "  " + ak + " ";

                cmd.Connection = cnn;

                DataTable dtCAN = new DataTable();
                SqlDataAdapter daCAN = new SqlDataAdapter(cmd);



                daCAN.Fill(dtCAN);
              
                if (a != 0)
                {

                    grdCancelados.Columns[0].Visible = false;
                    grdCancelados.Columns[1].Visible = false;
                    grdCancelados.Columns[2].Visible = false;
                    grdCancelados.Columns[3].Visible = false;
                    grdCancelados.Columns[4].Visible = false;
                    grdCancelados.Columns[5].Visible = false;
                    grdCancelados.Columns[6].Visible = false;
                    grdCancelados.Columns[7].Visible = false;
                }
                else
                {
                    grdCancelados.Columns[0].Visible = true;
                    grdCancelados.Columns[1].Visible = true;
                    grdCancelados.Columns[2].Visible = true;
                    grdCancelados.Columns[3].Visible = true;
                    grdCancelados.Columns[4].Visible = true;
                    grdCancelados.Columns[5].Visible = true;
                    grdCancelados.Columns[6].Visible = true;
                    grdCancelados.Columns[7].Visible = true;
                }
                string YrStr = "";
                for (int i = 0; i < chklist.Items.Count; i++)
                {
                    if (chklist.Items[i].Selected)
                    {
                        YrStr += chklist.Items[i].Value + ";";
                        if (YrStr != "")
                        {
                            grdCancelados.Columns[i].Visible = true;

                        }
                        else
                        {
                            grdCancelados.Columns[0].Visible = true;
                            grdCancelados.Columns[1].Visible = true;
                            grdCancelados.Columns[2].Visible = true;
                            grdCancelados.Columns[3].Visible = true;
                            grdCancelados.Columns[4].Visible = true;
                            grdCancelados.Columns[5].Visible = true;
                            grdCancelados.Columns[6].Visible = true;
                            grdCancelados.Columns[7].Visible = true;
                        }

                    }

                }

                //grdCancelados.Columns[4].ItemStyle.CssClass = "Ancho";




                grdCancelados.DataSource = dtCAN;
                //dtCAN.Rows.OfType<DataRow>().ToList().ForEach(f => f.SetField("monto", String.Concat("$", f["monto"])));
                grdCancelados.ShowFooter = false;
                if (chklist.Items[2].Selected == true)
                {
                    grdCancelados.ShowFooter = true;
                    //grdCancelados.Columns[2].ItemStyle(;
                    grdCancelados.Columns[2].FooterStyle.BackColor = Color.FromArgb(210, 210, 210);
                    grdCancelados.Columns[2].FooterStyle.ForeColor = Color.FromArgb(40, 40, 40);
                    grdCancelados.Columns[2].FooterStyle.Font.Bold = true;
                }



                grdCancelados.DataBind();
                cnn.Close(); // siempre cerrar conexiones.

                //ExportToExcel.Visible = true;
              
            }

            catch (Exception Ex)
            {
               
                Response.Write("<script>alert('" + Ex.Message + "') </script>");
                lblmsg.InnerText = Ex.Message;
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
        cmd.CommandText = "bitaseg.proc_RptGsln";

        cmd.Parameters.Add("@fecha1", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha1.Text);
        cmd.Parameters.Add("@fecha2", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha2.Text);
        var coord = DropDownList1.SelectedValue;
        if (DropDownList1.SelectedValue == "-1") { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = 0; }
        else { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = DropDownList1.SelectedValue; }
        DataTable dtCAN = new DataTable();
        SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
        daCAN.Fill(dtCAN);
        grdCancelados.DataSource = dtCAN;
        grdCancelados.Columns[0].Visible = false;
        grdCancelados.Columns[1].Visible = false;
        grdCancelados.Columns[2].Visible = false;
        grdCancelados.Columns[3].Visible = false;
        grdCancelados.Columns[4].Visible = false;
        grdCancelados.Columns[5].Visible = false;
        grdCancelados.Columns[6].Visible = false;
        grdCancelados.Columns[7].Visible = false;
        string YrStr = "";
        for (int i = 0; i < chklist.Items.Count; i++)
        {
            if (chklist.Items[i].Selected)
            {
                YrStr += chklist.Items[i].Value + ";";
                if (YrStr != "")
                {
                    grdCancelados.Columns[i].Visible = true;
                }
                else
                {
                    grdCancelados.Columns[0].Visible = true;
                    grdCancelados.Columns[1].Visible = true;
                    grdCancelados.Columns[2].Visible = true;
                    grdCancelados.Columns[3].Visible = true;
                    grdCancelados.Columns[4].Visible = true;
                    grdCancelados.Columns[5].Visible = true;
                    grdCancelados.Columns[6].Visible = true;
                    grdCancelados.Columns[7].Visible = true;
                }

            }

        }

       

        grdCancelados.DataBind();
        cnn.Close(); // siempre cerrar conexiones.
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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString() == "87")
        {
            NCord.InnerText = "Administrador";
        }
        else
        {
            NCord.InnerText = DropDownList1.SelectedValue.ToString();
        }
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0,new ListItem("Selecciona Coordinacion", "-1")); 
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Write("<script>window.location ='../../admin/default.aspx';</script>");

    }


    int subtotal = 0;

    protected void grdCancelados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (chklist.Items[2].Selected == true) {
        if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.RowType != DataControlRowType.EmptyDataRow))
        {
                var x = e.Row.Cells[2].Text;
                var y = x.Substring(1);
                subtotal += Convert.ToInt32(y);

        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {

            e.Row.Cells[2].Text = "Total: "+"$" + Convert.ToString(subtotal);
            }
        }
        

    }


    //int subtotal = 0;

    //protected void grdCancelados_DataBound(object sender, GridViewRowEventArgs e)
    //{

    //    if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.RowType != DataControlRowType.EmptyDataRow))
    //    {
    //        subtotal += Convert.ToInt32(e.Row.Cells[2].Text);
    //    }
    //    if (e.Row.RowType == DataControlRowType.Footer)
    //    {
    //        e.Row.Cells[0].Text = "Totales";

    //        e.Row.Cells[1].Text = Convert.ToString(subtotal);
    //    }

    //}
}