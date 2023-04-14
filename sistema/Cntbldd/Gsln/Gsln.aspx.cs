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

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        foreach (ListItem item in DropDownList2.Items)
        {
            if (item.Value == "5")
                item.Attributes.Add("style", "display:none");
        }

        chklist.Items[3].Attributes.Add("style", "display:none");

        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        //if (usuarios.Rol != "admin")
        //{
        //    if (usuarios.Rol != "todos")
        //    {
        //        Response.Write("<script>alert('No tiene permisos. Contacte al administrador');window.location ='../../admin/default.aspx';</script>");
        //    }
        //}


        if (!Page.IsPostBack)
        {
            NCord.InnerText = DropDownList1.SelectedValue;
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
            ExportToExcel.Visible = false;


        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {

        string Text = ((Button)sender).Text;
        string ID = ((Button)sender).Text;
        //Response.Write("<script>alert('"+ID.ToString()+"') </script>");
        Response.Redirect(Page.ResolveClientUrl("~/VerDatos.aspx?id=" + ID.ToString() + ""));
    }
    protected void Button_Click(object sender, EventArgs e)
    {

        if ((Fecha1.Text != null && Fecha1.Text != "") && (Fecha2.Text != null && Fecha2.Text != ""))
        {
            try
            {
                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = Principal.CnnStr0;
                cnn.Open();
                //SqlCommand cmd = new SqlCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = cnn;
                //cmd.CommandText = "bitaseg.proc_RptGsln";
                var chknombre = chklist.Items[0].Selected;
                var nombre = "";
                if (chknombre == true) { nombre = "(nombre + ' ' + (case when apellido1 is null then '' else apellido1 end) + ' ' + (case when apellido2 is null then '' else apellido2 end)) AS nombre_completo"; }
                else nombre = "'' as nombre_completo";

                var chkultimafecha = chklist.Items[1].Selected;
                var ultimafecha = "";
                if (chkultimafecha == true) { ultimafecha = "ultima_fecha"; }
                else ultimafecha = "''";

                var chkoficial = chklist.Items[2].Selected;
                var oficial = "";
                if (chkoficial == true) { oficial = "iif(oficial = 1, 'Sí', 'No') as oficial"; }
                else oficial = "''";

                var chkpuesto = chklist.Items[3].Selected;
                var puesto = "";
                if (chkpuesto == true) { puesto = "puesto"; }
                else puesto = "''";

                var chkactividad = chklist.Items[4].Selected;
                var actividad = "";
                if (chkactividad == true) { actividad = "actividad"; }
                else actividad = "''";

                var chkotra = chklist.Items[5].Selected;
                var otra = "";
                if (chkotra == true) { otra = "(case when especificacion_otra is null then '' else especificacion_otra end) as especificacion"; }
                else otra = "''";

                var chkcantidad = chklist.Items[6].Selected;
                var cantidad = "";
                if (chkcantidad == true) { cantidad = "('$'+cantidad) as cantidad"; }
                else cantidad = "''";

                var chkrendimiento = chklist.Items[7].Selected;
                var rendimiento = "";
                if (chkrendimiento == true) { rendimiento = "(rendimiento+' km') as rendimiento"; }
                else rendimiento = "''";

                var chkcilindraje = chklist.Items[8].Selected;
                var cilindraje = "";
                if (chkcilindraje == true) { cilindraje = "(cilindraje+' cilindros')as cilindraje"; }
                else cilindraje = "''";

                var chkuser_reg = chklist.Items[9].Selected;
                var user_reg = "";
                if (chkuser_reg == true) { user_reg = "user_reg"; }
                else user_reg = "''";

                var chkfecha_reg = chklist.Items[10].Selected;
                var fecha_reg = "";
                if (chkfecha_reg == true) { fecha_reg = "fecha_reg"; }
                else fecha_reg = "''";

                var fecha1 = Convert.ToDateTime(Fecha1.Text);
                var fecha2 = Convert.ToDateTime(Fecha2.Text);

                var coord = "";
                if (DropDownList1.SelectedValue.ToString() != "-1") { coord = DropDownList1.SelectedValue; }
                else { coord = "coordinacion"; }


                var todo = "''";
                var a = Convert.ToInt32(chklist.Items[0].Selected)
                      + Convert.ToInt32(chklist.Items[1].Selected)
                      + Convert.ToInt32(chklist.Items[2].Selected)
                      + Convert.ToInt32(chklist.Items[3].Selected)
                      + Convert.ToInt32(chklist.Items[4].Selected)
                      + Convert.ToInt32(chklist.Items[5].Selected)
                      + Convert.ToInt32(chklist.Items[6].Selected)
                      + Convert.ToInt32(chklist.Items[7].Selected)
                      + Convert.ToInt32(chklist.Items[8].Selected)
                      + Convert.ToInt32(chklist.Items[9].Selected)
                      + Convert.ToInt32(chklist.Items[10].Selected);


                if (a == 0)
                {

                    todo = "(nombre + ' ' + (case when apellido1 is null then '' else apellido1 end) + ' ' + (case when apellido2 is null then '' else apellido2 end)) AS nombre_completo,(case when especificacion_otra is null then '' else especificacion_otra end) as especificacion, rendimiento, iif(oficial = 1, 'Sí', 'No') as oficial, cantidad, * ";

                }

                var dropdown = Convert.ToInt32(DropDownList2.SelectedValue);
                var ordenar = "";
                switch (dropdown)

                {
                    case 0:
                        ordenar = "nombre_completo";
                        break;
                    case 1:
                        ordenar = "ultima_fecha";
                        break;
                    case 2:
                        ordenar = "empleados.oficial";
                        break;
                    case 3:
                        ordenar = "puesto";
                        break;
                    case 4:
                        ordenar = "actividad";
                        break;
                    case 5:
                        ordenar = "especificacion";
                        break;
                    case 6:
                        ordenar = "Convert(int,Gsln.cantidad)";
                        break;
                    case 7:
                        ordenar = "Convert(int,Gsln.rendimiento)";
                        break;
                    case 8:
                        ordenar = "cilindraje";
                        break;
                    case 9:
                        ordenar = "user_reg";
                        break;
                    case 10:
                        ordenar = "fecha_reg";
                        break;

                    default:
                        break;
                }
                var ak = "";
                var asdc = valor.Value;

                if (asdc == "0") { ak = " asc"; } else ak = "desc";

                var between = "fecha_reg";
                if (Radio2.Checked == true) { between = "ultima_fecha"; }
                else between = "fecha_reg";



                //cmd.Parameters.Add("@fecha1", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha1.Text);
                //cmd.Parameters.Add("@fecha2", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha2.Text);
                //var coord = DropDownList1.SelectedValue;
                //if (DropDownList1.SelectedValue == "-1") { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value =0; }
                //else { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = DropDownList1.SelectedValue; }
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select empleados.id_empleado," + fecha_reg + "," + user_reg + "," + cilindraje + "," + nombre + "," + otra + ", " + rendimiento + ", " + oficial + "," + cantidad + ", " + ultimafecha + "," + puesto + ", " + actividad + " , " + todo + "" +
                    "from bitaseg.Gsln inner join bitaseg.empleados on Gsln.id_empleado = empleados.id_empleado " +
                    "where (n_completo LIKE '%" + like.Text + "%') and coordinacion=" + coord + " and " + between + " between CONVERT(datetime,('" + fecha1.ToString("s") + "')) and  CONVERT(datetime,('" + fecha2.ToString("s") + "'))" +
                    "Order by " + ordenar + "  " + ak + " ";

                cmd.Connection = cnn;

                DataTable dtCAN = new DataTable();
                SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
                daCAN.Fill(dtCAN);
                grdCancelados.DataSource = dtCAN;
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
                    grdCancelados.Columns[8].Visible = false;
                    grdCancelados.Columns[9].Visible = false;
                    grdCancelados.Columns[10].Visible = false;
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
                    grdCancelados.Columns[8].Visible = true;
                    grdCancelados.Columns[9].Visible = true;
                    grdCancelados.Columns[10].Visible = true;
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
                            grdCancelados.Columns[8].Visible = true;
                            grdCancelados.Columns[9].Visible = true;
                            grdCancelados.Columns[10].Visible = true;
                        }

                    }

                }
                grdCancelados.Columns[3].Visible = false;



                grdCancelados.DataSource = dtCAN;
                //dtCAN.Rows.OfType<DataRow>().ToList().ForEach(f => f.SetField("monto", String.Concat("$", f["monto"])));
                grdCancelados.ShowFooter = false;
                if (chklist.Items[6].Selected == true)
                {
                    grdCancelados.ShowFooter = true;
                    //grdCancelados.Columns[2].ItemStyle(;
                    grdCancelados.Columns[6].FooterStyle.BackColor = Color.FromArgb(210, 210, 210);
                    grdCancelados.Columns[6].FooterStyle.ForeColor = Color.FromArgb(40, 40, 40);
                    grdCancelados.Columns[6].FooterStyle.Font.Bold = true;
                }


                grdCancelados.DataBind();
                cnn.Close(); // siempre cerrar conexiones.

                ExportToExcel.Visible = true;

            }

            catch (Exception Ex)
            {


                LblMsg.Text = Ex.Message;
            }
        }
        else
        {
            //Response.Write("<script>alert(' Seleccione un rango de fechas válido ') </script>");

            LblMsg.Text = "<br />" + MessageStyles.Danger("Seleccione un rango de fechas válido", false);
           

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
        grdCancelados.Columns[8].Visible = false;
        grdCancelados.Columns[9].Visible = false;
        grdCancelados.Columns[10].Visible = false;
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
                    grdCancelados.Columns[8].Visible = true;
                    grdCancelados.Columns[9].Visible = true;
                    grdCancelados.Columns[10].Visible = true;
                }

            }

        }



        //grdCancelados.DataSource = dtCAN;
        ////dtCAN.Rows.OfType<DataRow>().ToList().ForEach(f => f.SetField("monto", String.Concat("$", f["monto"])));
        //grdCancelados.ShowFooter = false;
        //if (chklist.Items[6].Selected == true)
        //{
        //    grdCancelados.ShowFooter = true;
        //    //grdCancelados.Columns[2].ItemStyle(;
        //    grdCancelados.Columns[6].FooterStyle.BackColor = Color.FromArgb(210, 210, 210);
        //    grdCancelados.Columns[6].FooterStyle.ForeColor = Color.FromArgb(40, 40, 40);
        //    grdCancelados.Columns[6].FooterStyle.Font.Bold = true;
        //}



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


    int subtotal = 0;

    protected void grdCancelados_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (chklist.Items[6].Selected == true)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.RowType != DataControlRowType.EmptyDataRow))
            {
                var x = e.Row.Cells[6].Text;
                var y = x.Substring(1);
                subtotal += Convert.ToInt32(y);
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[6].Text = "Total: " + "$" + Convert.ToString(subtotal);
            }
            //Response.Write("<script>alert("+subtotal+")</script>");
        }

    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, new ListItem("Selecciona Coordinación", "-1"));
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Write("<script>window.location ='../../admin/default.aspx';</script>");

    }

}