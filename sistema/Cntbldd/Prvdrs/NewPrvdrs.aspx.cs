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

        if (!IsPostBack) {
            PersonasDropDownList();
            //Buttona.Visible = false;
        }
     


    }
   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
     


        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select iif(oficial = 1, 'Oficial', 'Propio') as oficial, vehiculo, cilindraje from bitaseg.empleados where id_empleado = " + DropDownList1.SelectedValue + "";
        cmd.Connection = cnn;

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {

            //txtOficial.Text = dr["oficial"].ToString();
            //txtVehiculo.Text = dr["vehiculo"].ToString();
            //txtCilindraje.Text = dr["cilindraje"].ToString();

        }
        dr.Close();
        cnn.Close();
        Buttona.Visible = true;


    }





    private void PersonasDropDownList()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);

      
        DropDownList1.DataSource = GetData("bitaseg.spGetCoordinaciones", null);
        DropDownList1.DataBind();

        ListItem liCategoria = new ListItem("Seleccione una Coordinacion", "-1");
        DropDownList1.Items.Insert(0, liCategoria);

        DropDownList1.SelectedValue = usuarios.NumeroCoordinacion.ToString();

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


   
    protected void Button_Click(object sender, EventArgs e)
    {


        try
        {
            SqlConnection cna = new SqlConnection();
            cna.ConnectionString = Principal.CnnStr0;
            cna.Open();


          


            Usuarios usuarios = new Usuarios();
            usuarios.DatosDeRegistro(User.Identity.Name);


            var fecha_reg = DateTime.Now;
            var user_reg = usuarios.Reguser;

            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_newprov";

            //cmd.Parameters.Add("@reguser", SqlDbType.VarChar, 20).Value = reguser;
            //    "values(@id_empleado, @ultima_fecha, @cantidad, @actividad, @especificacion_otra, @rendimiento, @fecha_reg, @user_reg) ");

            cmd.Parameters.Add("@nombre_proveedor", SqlDbType.VarChar,-1).Value = txtNombreProv.Text;
            cmd.Parameters.Add("@coordinacion", SqlDbType.VarChar,-1).Value = DropDownList1.SelectedValue;
            cmd.Parameters.Add("@calle", SqlDbType.VarChar, -1).Value = txtCalle.Text;
            cmd.Parameters.Add("@colonia", SqlDbType.VarChar, -1).Value = txtColonia.Text;
            cmd.Parameters.Add("@municipio", SqlDbType.VarChar, -1).Value = ddlMunicipio.SelectedValue;
            cmd.Parameters.Add("@referencias", SqlDbType.VarChar, -1).Value = txtReferencias.Text;
            cmd.Parameters.Add("@telefono", SqlDbType.VarChar,-1).Value = txtTelefono.Text;
            cmd.Parameters.Add("@cp", SqlDbType.Int).Value = Convert.ToInt32(txtCp.Text);
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
            cmd.Parameters.Add("@user_reg", SqlDbType.VarChar, -1).Value = user_reg;
            

            cmd.Connection = cnn;
            cmd.ExecuteNonQuery();
            cna.Close();


            //Response.Write("<script>alert('Información capturada');window.location ='../../admin/default.aspx';</script>");
            Response.Write("<script>alert('Información capturada');window.location ='../../Cntbldd/Prvdrs/NewPrvdrs.aspx';</script>");
        }

        catch (Exception Ex)
        {

            Response.Write("<script>alert('" + Ex.Message + "') </script>");
            lblmsg.InnerText = Ex.Message;
        }
    }




}
