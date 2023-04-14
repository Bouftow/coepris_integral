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
public class Distintivos
{
    public Distintivos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public Distintivos(int prmId)
    {
        try
        {
            id_Distintivo = prmId;
            Mostrar();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }

    }
    #region Variables
    
    int id_Distintivo = 0;

    int id_establecimiento = 0;
    int folio = 0;

    int id_giro = 0;
    string nombre = "";
    string apellidop = "";
    string apellidom = "";
    string tel = "";
    string correo = "";
    string nombreest = "";
    string razon_social = "";
    string colonia = "";
    string calle = "";
    string numext = "";
    string numint = "";
    string entrecalles = "";
    string localidad = "";
    string municipio = "";
    string cp = "";
    string dias_laborales = "";
    string hest = "";

    string nivel_educativo = "";
    string sesion = "";
    string medio_conocido = "";
    DateTime fecha_reg = DateTime.Now;

    bool descargado = false;
    #endregion

    #region Propiedades
   
    public int IDestablecimiento { get { return id_establecimiento; } set { id_establecimiento = value; } }
    public int Folio { get { return folio; } set { folio = value; } }
    public int IDgiro { get { return id_giro; } set { id_giro = value; } }
    public string Nombre { get { return nombre; } set { nombre = value; } }
    public string Apellidop { get { return apellidop; } set { apellidop = value; } }
    public string Apellidom { get { return apellidom; } set { apellidom = value; } }
    public string Tel { get { return tel; } set { tel = value; } }
    public string Correo { get { return correo; } set { correo = value; } }
    public string Nombreest { get { return nombreest; } set { nombreest = value; } }
    public string RazonSocial { get { return razon_social; } set { razon_social = value; } }
    public string Calle { get { return calle; } set { calle = value; } }
    public string Colonia { get { return colonia; } set { colonia = value; } }
    public string Numext { get { return numext; } set { numext = value; } }
    public string Numint { get { return numint; } set { numint = value; } }
    public string Entrecalles { get { return entrecalles; } set { entrecalles = value; } }
    public string Localidad { get { return localidad; } set { localidad = value; } }
    public string Municipio { get { return municipio; } set { municipio = value; } }
    public string Cp { get { return cp; } set { cp = value; } }
    public string Dias_laborales { get { return dias_laborales; } set { dias_laborales = value; } }
    public string Hest { get { return hest; } set { hest = value; } }
    public DateTime FechaReg { get { return fecha_reg; } set { fecha_reg = value; } }

    public bool Descargado { get { return descargado; } set { descargado = value; } }


    public string Nivel_Educativo { get { return nivel_educativo; } set { nivel_educativo = value; } }

    public string Sesion { get { return sesion; } set { sesion = value; } }

    public string MedioConocido { get { return medio_conocido; } set { medio_conocido = value; } }


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

            strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("Distintivo/Default.aspx", page)));

            //BITACORA  
            //if (Convert.ToBoolean(dr["bitacora"]))
            //{
            strMenus.Append(String.Format("<li class=\"{0}\"><a id='menu_registro' style='display:none' href=\"{1}\"><i class=\"fa fa-pencil-square-o\"></i>&nbsp;Registro</a></li>", pager[0] == "Registro" ? "active" : "disable", Strings.GetUrl("Distintivo/Registro.aspx", page)));
            //}
            //CAPTURA  
            //if (Convert.ToBoolean(dr["captura"]))
            //{
            strMenus.Append(String.Format("<li class=\"{0}\"><a id='menu_gracias' style='display:none' href=\"{1}\"><i class=\"fa fa-check-circle\"></i>&nbsp;¡Gracias!</a></li>", pager[0] == "gracias" ? "active" : "disable", Strings.GetUrl("Distintivo/Gracias.aspx", page)));
            //}


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
            cmd.CommandText = "select * from bitaseg.Distintivos_Registros where id_Distintivo=@id_Distintivo";
            cmd.Parameters.Add("@id_Distintivo", SqlDbType.Int).Value = id_Distintivo;
            cmd.Connection = cnn;


            SqlDataReader drp = cmd.ExecuteReader();
            if (drp.Read())
            {
                id_establecimiento = Convert.ToInt32(drp["id_establecimiento"]);
                folio = Convert.ToInt32(drp["folio"]);
                nombre = drp["nombre"].ToString();
                nombreest = drp["nombreest"].ToString();
                razon_social = drp["razon_social"].ToString();
                apellidop = drp["apellidop"].ToString();
                apellidom = drp["apellidom"].ToString();
                tel = drp["tel"].ToString();
                correo = drp["correo"].ToString();
                colonia = drp["colonia"].ToString();
                calle = drp["calle"].ToString();
                entrecalles = drp["entrecalles"].ToString();
                numext = drp["numext"].ToString();
                numint = drp["numint"].ToString();
                localidad = drp["localidad"].ToString();
                municipio = drp["municipio"].ToString();
                cp = drp["cp"].ToString();
                dias_laborales = drp["dias_laborales"].ToString();
                hest = drp["hest"].ToString();

                id_giro = Convert.ToInt32(drp["id_giro"]);
                nivel_educativo = drp["nivel_educativo"].ToString();
                sesion = drp["sesion"].ToString();
                medio_conocido = drp["medio_conocido"].ToString();

                fecha_reg = Convert.ToDateTime(drp["fecha_reg"].ToString());

                descargado = Convert.ToBoolean(drp["descargado"]);

            }
            drp.Close();
            cnn.Close();
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
    public string Grabar_Distintivo()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_DistintivoGuardar";

            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, -1).Value = nombre;
            cmd.Parameters.Add("@apellidop", SqlDbType.NVarChar, -1).Value = apellidop;
            cmd.Parameters.Add("@apellidom", SqlDbType.NVarChar, -1).Value = apellidom;
            cmd.Parameters.Add("@tel", SqlDbType.NVarChar, -1).Value = tel;
            cmd.Parameters.Add("@correo", SqlDbType.NVarChar, -1).Value = correo;
            cmd.Parameters.Add("@nombreest", SqlDbType.NVarChar, -1).Value = nombreest;
            cmd.Parameters.Add("@razon_social", SqlDbType.NVarChar, -1).Value = razon_social;
            cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, -1).Value = colonia;
            cmd.Parameters.Add("@calle", SqlDbType.NVarChar, -1).Value = calle;
            cmd.Parameters.Add("@numext", SqlDbType.NVarChar, -1).Value = numext;
            cmd.Parameters.Add("@numint", SqlDbType.NVarChar, -1).Value = numint;
            cmd.Parameters.Add("@entrecalles", SqlDbType.NVarChar, -1).Value = entrecalles;
            cmd.Parameters.Add("@localidad", SqlDbType.NVarChar, -1).Value = localidad;
            cmd.Parameters.Add("@municipio", SqlDbType.NVarChar, -1).Value = municipio;
            cmd.Parameters.Add("@cp", SqlDbType.NVarChar, -1).Value = cp;
            cmd.Parameters.Add("@dias_laborales", SqlDbType.NVarChar).Value = dias_laborales;
            cmd.Parameters.Add("@hest", SqlDbType.NVarChar).Value = hest;
            cmd.Parameters.Add("@id_giro", SqlDbType.Int).Value = id_giro;

            cmd.Parameters.Add("@nivel_educativo", SqlDbType.NVarChar, -1).Value = nivel_educativo;
            cmd.Parameters.Add("@sesion", SqlDbType.NVarChar, -1).Value = sesion;
            cmd.Parameters.Add("@medio_conocido", SqlDbType.NVarChar, -1).Value = medio_conocido;

            cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
            if (cmd.Connection.State == ConnectionState.Closed) { cmd.Connection.Open(); }
            cmd.ExecuteNonQuery();
            string id = cmd.Parameters["@id"].Value.ToString();
            cnn.Close();
            return id;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    #endregion

}