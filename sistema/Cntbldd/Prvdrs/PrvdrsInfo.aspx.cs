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

        if (usuarios.Rol != "todos")
        {
            if (usuarios.Rol != "administrador")
            {
                Response.Write("<script>alert('No tiene permisos. Contacte al administrador');window.location ='../../admin/default.aspx';</script>");
            }
        }

        NombreDeCoordinacion.InnerText = "COORDINACIÓN NÚMERO " + usuarios.NumeroCoordinacion + " : " + usuarios.NombreCoordinacion;
        
        if (!IsPostBack)
        {
            ProveedoresDropDownList();

            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select nombre_proveedor,telefono,  ('COL.' +colonia+'; CALLE '+calle)as direccion,municipio, referencias from bitaseg.Proveedores where id_proveedor = " + (Convert.ToInt32(Request.Params["id"])) + "";
            cmd.Connection = cnn;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
               
                txtnombre_proveedor.Text = dr["nombre_proveedor"].ToString();
                txtTelefono.Text = string.Format("{0:#,##0.00}", dr["telefono"].ToString());
                txtDireccion.Text = dr["direccion"].ToString();
                txtMunicipio.Text = dr["municipio"].ToString();
                txtReferencias.Text = dr["referencias"].ToString();

            }
            dr.Close();
            cnn.Close();
            DropDownList1.SelectedValue = (Request.Params["id"]);
            Buttona.Style["visibility"] = "hidden";
        }
        if (IsPostBack)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select nombre_proveedor,telefono, ('COL.' +colonia+'; CALLE '+calle)as direccion,municipio, referencias from bitaseg.Proveedores where id_proveedor = " + DropDownList1.SelectedValue + "";
            cmd.Connection = cnn;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                txtnombre_proveedor.Text = dr["nombre_proveedor"].ToString();
                txtTelefono.Text = dr["telefono"].ToString();
                txtDireccion.Text = dr["direccion"].ToString();
                txtMunicipio.Text = dr["municipio"].ToString();
                txtReferencias.Text = dr["referencias"].ToString();

            }
            dr.Close();
            cnn.Close();
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

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Write("<script>window.location ='../../admin/default.aspx';</script>");

    }
}