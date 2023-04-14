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

        if (usuarios.Rol != "administrador")
        {
            if (usuarios.Rol != "todos")
            {
                Response.Write("<script>alert('No tiene permisos. Contacte al administrador');window.location ='../../admin/default.aspx';</script>");
            }
        }

        NombreDeCoordinacion.InnerText = "COORDINACIÓN NÚMERO " + usuarios.NumeroCoordinacion+ " : " + usuarios.NombreCoordinacion;
        //Response.Write("<script>alert('"+ usuarios.NombreCoordinacion +"') </script>");

        if (!IsPostBack) { 
            PersonasDropDownList();
            ActividadesDropDownList();
            Buttona.Visible = false;
        }
        if (IsPostBack)
        {
            //switch (txtCilindraje.Text.ToString())
            //{
            //    case "4":
            //        txtRendimiento.Text = (Convert.ToInt32(txtCantidad.Text) / 20 * 15).ToString();
            //        break;
            //    case "6":
            //        txtRendimiento.Text = (Convert.ToInt32(txtCantidad.Text) / 20 * 12).ToString();
            //        break;
            //    case "8":
            //        txtRendimiento.Text = (Convert.ToInt32(txtCantidad.Text) / 20 * 9).ToString();
            //        break;
            //    default:
            //        break;
            //}
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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCilindraje.Text = "";
        txtCantidad.Text = "";
        txtOficial.Text = "";
        txtVehiculo.Text = "";
            
       
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

                txtOficial.Text = dr["oficial"].ToString();
                txtVehiculo.Text = dr["vehiculo"].ToString();
                txtCilindraje.Text = dr["cilindraje"].ToString();

            }
            dr.Close();
            cnn.Close();

        
        
    }





    private void PersonasDropDownList()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);

        SqlParameter parameter = new SqlParameter();
        parameter.ParameterName = "@coordinacion";
        parameter.Value = usuarios.NumeroCoordinacion;

        DropDownList1.DataSource = GetData("bitaseg.spGetPersonas", parameter);
        DropDownList1.DataBind();

        ListItem liCategoria = new ListItem("Seleccione una Persona", "-1");
        DropDownList1.Items.Insert(0, liCategoria);

     
    }
    private void ActividadesDropDownList()
    {

        DropDownList2.DataSource = GetData("bitaseg.[spGetActividades]", null);
        DropDownList2.DataBind();

        ListItem liCategoria = new ListItem("Seleccione una actividad", "-1");
        DropDownList2.Items.Insert(0, liCategoria);



        otra.Visible = false;   
        txtOtra.Visible = false;
        txtOtra.Enabled = false;



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


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedValue.ToString() == "Otra")
        {
            otra.Visible = true;
            txtOtra.Visible = true;
            txtOtra.Enabled = true;
        }
        else
        {
            otra.Visible = false;
            txtOtra.Visible = false;
            txtOtra.Enabled = false;
        }

        Buttona.Visible = true;
    }
    protected void Button_Click(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('" + txtCantidad.Text + "," + txtCilindraje.Text + "," + txtOficial.Text + "," + txtOtra.Text + "," + txtRendimiento.Text + "," + txtVehiculo.Text + "," + DropDownList1.SelectedValue + " ')</script>");
        if (Fecha1.Text != null && Fecha1.Text != "")
        {
            try
            {
                SqlConnection cna = new SqlConnection();
                cna.ConnectionString = Principal.CnnStr0;
                cna.Open();


                var id_empleado = DropDownList1.SelectedValue;
                var ultima_fecha = Fecha1.Text;
                var a = txtCantidad.Text.ToString();
                var cantidad = a.Substring(1, (a.Length - 1));
                //var cantidad = txtCantidad.Text;
                var actividad = DropDownList2.SelectedValue;
                var especificacion_otra = txtOtra.Text;

             
                var b = txtRendimiento.Text.ToString();
                var rendimiento = b.Substring(0, b.Length - 3);
                //var rendimiento = txtRendimiento.Text;



                Usuarios usuarios = new Usuarios();
                usuarios.DatosDeRegistro(User.Identity.Name);


                var fecha_reg = DateTime.Now;
                var user_reg = usuarios.Reguser;

                //SqlCommand cmda = new SqlCommand(" Insert Into bitaseg.imgchar (folio) values ('" + folio.Text + "')");
                SqlCommand cma = new SqlCommand("Insert Into bitaseg.Gsln (id_empleado, ultima_fecha, cantidad, actividad,especificacion_otra, rendimiento, fecha_reg,user_reg)" +
                    "values(@id_empleado, @ultima_fecha, @cantidad, @actividad, @especificacion_otra, @rendimiento, @fecha_reg, @user_reg) ");

                cma.Parameters.Add("@id_empleado", SqlDbType.Int).Value = id_empleado;
                cma.Parameters.Add("@ultima_fecha", SqlDbType.DateTime).Value = ultima_fecha;
                cma.Parameters.Add("@cantidad", SqlDbType.VarChar, -1).Value = cantidad;
                cma.Parameters.Add("@actividad", SqlDbType.VarChar, -1).Value = actividad;
                cma.Parameters.Add("@especificacion_otra", SqlDbType.VarChar, 20).Value = especificacion_otra;
                cma.Parameters.Add("@rendimiento", SqlDbType.VarChar, -1).Value = rendimiento;
                cma.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
                cma.Parameters.Add("@user_reg", SqlDbType.VarChar, -1).Value = user_reg;

                cma.Connection = cna;
                cma.ExecuteNonQuery();
                cna.Close();


                //Response.Write("<script>alert('Información capturada');window.location ='../../admin/default.aspx';</script>");
                Response.Write("<script>alert('Información capturada');window.location ='../../Cntbldd/Gsln/GslnCptr.aspx';</script>");
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
        //var b = txtRendimiento.Text.ToString();
        //var rendimiento = b.Substring(0, b.Length - 3);
        //Response.Write("<script>alert('"+rendimiento+"')</script>");

    }
}