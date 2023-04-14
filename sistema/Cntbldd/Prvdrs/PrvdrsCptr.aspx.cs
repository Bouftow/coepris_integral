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
       
        
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        //Response.Write("<script>alert('" + usuarios.Reguser + "') </script>");
        if (usuarios.Rol != "administrador")
        {
            if (usuarios.Rol != "todos")
            {
                Response.Write("<script>alert('No tiene permisos. Contacte al administrador');window.location ='../../admin/default.aspx';</script>");
            }
        }

        NombreDeCoordinacion.InnerText = "COORDINACIÓN NÚMERO " + usuarios.NumeroCoordinacion + " : " + usuarios.NombreCoordinacion;
        //Response.Write("<script>alert('"+ usuarios.NombreCoordinacion +"') </script>");

        if (!IsPostBack)
        {
           
            ProveedoresDropDownList();

            Buttona.Style["visibility"] = "hidden";
        }
        if (IsPostBack)
        {
            
            //Response.Write("<script>alert('" + a.Substring(1, (a.Length-1)) + "');</script>");

        }


    }
    protected void Selection_Change(Object sender, EventArgs e)
    {

        Fecha1.Text = "";
        foreach (DateTime day in Calendar1.SelectedDates)
        {
            Fecha1.Text = day.Date.ToString("yyyy-MM-dd");

        }
        if (DropDownList1.SelectedValue != "-1")
        {
            Buttona.Style["visibility"] = "display";
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {



        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select municipio, (colonia +', ' + calle )as direccion, referencias, telefono  from bitaseg.proveedores where id_proveedor = " + DropDownList1.SelectedValue + "";
        cmd.Connection = cnn;

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {

            txtTelefono.Text = dr["telefono"].ToString();
            txtDireccion.Text = dr["direccion"].ToString();
            txtMunicipio.Text = dr["municipio"].ToString();
            txtReferencias.Text = dr["referencias"].ToString();

        }
        dr.Close();
        cnn.Close();
        if (Fecha1.Text != "")
        {
            Buttona.Style["visibility"] = "display";
        }


    }
    private void ProveedoresDropDownList()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);

        SqlParameter parameter = new SqlParameter();
        parameter.ParameterName = "@coordinacion";
        parameter.Value = usuarios.NumeroCoordinacion;

        DropDownList1.DataSource = GetData("bitaseg.spGetProveedores", parameter);
        DropDownList1.DataBind();

        ListItem liCategoria = new ListItem("Seleccione un Proveedor", "-1");
        DropDownList1.Items.Insert(0, liCategoria);


    }
    //private void ActividadesDropDownList()
    //{

    //    DropDownList2.DataSource = GetData("bitaseg.[spGetActividades]", null);
    //    DropDownList2.DataBind();

    //    ListItem liCategoria = new ListItem("Seleccione una actividad", "-1");
    //    DropDownList2.Items.Insert(0, liCategoria);



    //    otra.Visible = false;   
    //    txtOtra.Visible = false;
    //    txtOtra.Enabled = false;



    //}
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


    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (DropDownList2.SelectedValue.ToString() == "Otra")
    //    {
    //        otra.Visible = true;
    //        txtOtra.Visible = true;
    //        txtOtra.Enabled = true;
    //    }
    //    else
    //    {
    //        otra.Visible = false;
    //        txtOtra.Visible = false;
    //        txtOtra.Enabled = false;
    //    }

    //    Buttona.Visible = true;
    //}
    protected void Button_Click(object sender, EventArgs e)
    {

        if (Fecha1.Text != null && Fecha1.Text != "")
        {
            try
            {
                SqlConnection cna = new SqlConnection();
                cna.ConnectionString = Principal.CnnStr0;
                cna.Open();


                var id_proveedor = DropDownList1.SelectedValue;
                
                var fecha_factura = Fecha1.Text;
                var insumos_adquiridos = txtInsumo.Text;

                var a = txtMonto.Text.ToString();
                var monto = a.Substring(1, (a.Length - 1));

                Usuarios usuarios = new Usuarios();
                usuarios.DatosDeRegistro(User.Identity.Name);


                var fecha_reg = DateTime.Now;
                var user_reg = usuarios.Reguser;
                var coordinacion = usuarios.NumeroCoordinacion;

                //SqlCommand cmda = new SqlCommand(" Insert Into bitaseg.imgchar (folio) values ('" + folio.Text + "')");
                SqlCommand cma = new SqlCommand("Insert Into bitaseg.proveedores_insumos (id_proveedor, coordinacion, fecha_factura, insumos_adquiridos,monto, fecha_reg,user_reg)" +
                    "values(@id_proveedor, @coordinacion, @fecha_factura, @insumos_adquiridos, @monto, @fecha_reg, @user_reg) ");

                cma.Parameters.Add("@id_proveedor", SqlDbType.Int).Value = id_proveedor;
                cma.Parameters.Add("@coordinacion", SqlDbType.Int).Value = coordinacion;
                cma.Parameters.Add("@fecha_factura", SqlDbType.DateTime).Value = fecha_factura;
                cma.Parameters.Add("@insumos_adquiridos", SqlDbType.VarChar, -1).Value = insumos_adquiridos;
                cma.Parameters.Add("@monto", SqlDbType.VarChar, -1).Value = monto;
                cma.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
                cma.Parameters.Add("@user_reg", SqlDbType.VarChar, -1).Value = user_reg;

                cma.Connection = cna;
                cma.ExecuteNonQuery();
                cna.Close();


                //Response.Write("<script>alert('Información capturada');window.location ='../../admin/default.aspx';</script>");
                Response.Write("<script>alert('Información capturada');window.location ='../../Cntbldd/Prvdrs/PrvdrsCptr.aspx';</script>");
            }

            catch (Exception Ex)
            {

                Response.Write("<script>alert('" + Ex.Message + "') </script>");
                lblmsg.InnerText = Ex.Message;
            }
        }
        else
        {
            Response.Write("<script>alert('Seleccione una Fecha ') </script>");

        }

    }
    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Write("<script>window.location ='../../admin/default.aspx';</script>");

    }
}