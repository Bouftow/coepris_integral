using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
using System.Text;
using System.Web.UI;

/// <summary>
/// Descripción breve de Distintivos
/// </summary>
public class Escuelas
{
    public Escuelas()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public Escuelas(string llave)
    {
        try
        {
            claveCT = llave;
            Mostrar();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }

    }
    #region Variables
    int id_escuela = 0;
    int id_coordinacion = 0;
    string nombrecoordinacion = "";
    string claveCT = "";
    string turno = "";

    string nombre = "";
    string municipio = "";
    string localidad = "";
    string control = "";
    string ambito = "";
    string tipo = "";

    string vialidad = "";
    string numext = "";
    string cp = "";
    string colonia = "";
    
    DateTime fecha_reg = DateTime.Now;

    bool descargado = false;
    #endregion

    #region Propiedades
   
    public int IDescuela { get { return id_escuela; } set { id_escuela = value; } }
    public int IDcoordinacion { get { return id_coordinacion; } set { id_coordinacion = value; } }
    public string NombreCoordinacion { get { return nombrecoordinacion; } set { nombrecoordinacion = value; } }
    public string Nombre { get { return nombre; } set { nombre = value; } }
    public string ClaveCT { get { return claveCT; } set { claveCT = value; } }
    public string Turno { get { return turno; } set { turno = value; } }
    public string Municipio { get { return municipio; } set { municipio = value; } }
    public string Localidad { get { return localidad; } set { localidad = value; } }
    public string Control { get { return control; } set { control = value; } }
    public string Ambito { get { return ambito; } set { ambito = value; } }
    public string Tipo { get { return tipo; } set { tipo = value; } }
    public string Vialidad { get { return vialidad; } set { vialidad = value; } }
    public string NumExt { get { return numext; } set { numext = value; } }
    public string CP { get { return cp; } set { cp = value; } }
    public string Colonia { get { return colonia; } set { colonia = value; } }


    public DateTime FechaReg { get { return fecha_reg; } set { fecha_reg = value; } }
    #endregion

    #region Métodos
    public static string ShowMenu(/*string pUserLogin,*/ string pageName, Page page)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        string[] pager = pageName.Split('.');
        StringBuilder strMenus = new StringBuilder("");
        try
        {
            //    cnn.Open();
            //    SqlCommand cmd = new SqlCommand();
            //    cmd.Connection = cnn;
            //    cmd.CommandText = "bitaseg.proc_UserMenu";
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            //    SqlDataReader dr = cmd.ExecuteReader();

            //if (dr.Read())
            //{
            ////Inicio
            //strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-home\"></i>&nbsp;Inicio</a></li>", pager[0] == "active" ? "active" : "", Strings.GetUrl("default.aspx", page)));

            strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("ComedoresEscolares/Default.aspx", page)));
            strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-pencil {0}\"></i>&nbsp;Registro</a></li>", pager[0] == "registro" ? "active" : "", Strings.GetUrl("ComedoresEscolares/Registro.aspx", page)));
            strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-video {0}\"></i>&nbsp;Capacitación</a></li>", pager[0] == "capacitacion" ? "active" : "", Strings.GetUrl("ComedoresEscolares/Capacitacion.aspx", page)));


            //    }
            return strMenus.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            //cnn.Close();
            //cnn.Dispose();
        }
    }
    private void Mostrar()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bitaseg.Escuelas where claveCT=@claveCT";
            cmd.Parameters.Add("@claveCT", SqlDbType.VarChar,-1).Value = claveCT;
            cmd.Connection = cnn;


            SqlDataReader drp = cmd.ExecuteReader();
            if (drp.Read())
            {
                id_escuela = Convert.ToInt32(drp["id_escuela"]);
                id_coordinacion = Convert.ToInt32(drp["id_coordinacion"]);
                nombrecoordinacion = drp["nombrecoordinacion"].ToString();
                claveCT = drp["claveCT"].ToString();

                turno = drp["turno"].ToString();
                nombre = drp["nombre"].ToString();
                municipio = drp["municipio"].ToString();
                localidad = drp["localidad"].ToString();
                control = drp["control"].ToString();
                ambito = drp["ambito"].ToString();
                tipo = drp["tipo"].ToString();

                vialidad = drp["vialidad"].ToString();
                numext = drp["numext"].ToString();
                cp = drp["cp"].ToString();
                colonia = drp["colonia"].ToString();


            }
            drp.Close();
            cnn.Close();
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
    public void Grabar_Escuela()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.[proc_EscuelaGuardar]";

           
            cmd.Parameters.Add("@claveCT", SqlDbType.NVarChar, -1).Value = claveCT;
            cmd.Parameters.Add("@turno", SqlDbType.NVarChar, -1).Value = turno;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, -1).Value = nombre;
            cmd.Parameters.Add("@municipio", SqlDbType.NVarChar, -1).Value = municipio;
            cmd.Parameters.Add("@localidad", SqlDbType.NVarChar, -1).Value = localidad;
            cmd.Parameters.Add("@control", SqlDbType.NVarChar, -1).Value = control;
            cmd.Parameters.Add("@ambito", SqlDbType.NVarChar, -1).Value = ambito;
            cmd.Parameters.Add("@tipo", SqlDbType.NVarChar, -1).Value = tipo;
            cmd.Parameters.Add("@vialidad", SqlDbType.NVarChar, -1).Value = vialidad;
            cmd.Parameters.Add("@numext", SqlDbType.NVarChar, -1).Value = numext;
            cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, -1).Value = colonia;
            cmd.Parameters.Add("@cp", SqlDbType.NVarChar, -1).Value = cp;



            cmd.ExecuteNonQuery();
            cnn.Close();
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }


    #endregion

}