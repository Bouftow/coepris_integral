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
public class Comedores
{
    public Comedores()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public Comedores(int prmId)
    {
        try
        {
            id_comedor = prmId;
            Mostrar();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }

    }
    #region Variables
    
    int id_comedor = 0;
    int folio = 0;
    int id_escuela = 0;
    int id_coordinacion = 0;
    string nombrecoordinacion = "";
    string nombre = "";
    string apellidop = "";
    string apellidom = "";
    string tel = "";
    string correo = "";
    string claveCT = "";
    string unidad_consumo = "";
    DateTime fecha_reg = DateTime.Now;

    bool descargado = false;
    bool capacitado = false;
    #endregion

    #region Propiedades
   
    public int IDcomedor { get { return id_comedor; } set { id_comedor = value; } }
    public int Folio { get { return folio; } set { folio = value; } }
    public int IDescuela { get { return id_escuela; } set { id_escuela = value; } }
    public int IDcoordinacion { get { return id_coordinacion; } set { id_coordinacion = value; } }
    public string NombreCoordinacion { get { return nombrecoordinacion; } set { nombrecoordinacion = value; } }
    public string Nombre { get { return nombre; } set { nombre = value; } }
    public string Apellidop { get { return apellidop; } set { apellidop = value; } }
    public string Apellidom { get { return apellidom; } set { apellidom = value; } }
    public string Tel { get { return tel; } set { tel = value; } }
    public string Correo { get { return correo; } set { correo = value; } }
    public string ClaveCT { get { return claveCT; } set { claveCT = value; } }
    public string UnidadConsumo { get { return unidad_consumo; } set { unidad_consumo = value; } }
    public bool Descargado { get { return descargado; } set { descargado = value; } }
    public bool Capacitado { get { return capacitado; } set { capacitado = value; } }
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
            strMenus.Append(String.Format("<li class=\"{0}\"><a id='registromenu' href=\"{1}\"><i class=\"fa fa-pencil {0}\"></i>&nbsp;Registro</a></li>", pager[0] == "registro" ? "active" : "invisible", Strings.GetUrl("ComedoresEscolares/Registro.aspx", page)));
            strMenus.Append(String.Format("<li class=\"{0}\"><a id='capacitacionmenu' href=\"{1}\"><i class=\"fa fa-video {0}\"></i>&nbsp;Capacitación</a></li>", pager[0] == "capacitacion" ? "active" : "invisible", Strings.GetUrl("ComedoresEscolares/Capacitacion.aspx", page)));


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

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_ComedorMostrar";
            cmd.Connection = cnn;
            cmd.Parameters.Add("@id_comedor", SqlDbType.Int).Value = id_comedor;
            cmd.Connection = cnn;

            SqlDataReader drp = cmd.ExecuteReader();
            if (drp.Read())
            {
                id_escuela = Convert.ToInt32(drp["id_escuela"]);
                id_coordinacion = Convert.ToInt32(drp["id_coordinacion"]);
                nombrecoordinacion = drp["nombrecoordinacion"].ToString();
                folio = Convert.ToInt32(drp["folio"]);
                nombre = drp["nombre"].ToString();
                apellidop = drp["apellidop"].ToString();
                apellidom = drp["apellidom"].ToString();
                tel = drp["tel"].ToString();
                correo = drp["correo"].ToString();
                claveCT = drp["claveCT"].ToString();
                unidad_consumo = drp["unidad_consumo_txt"].ToString();

                fecha_reg = Convert.ToDateTime(drp["fecha_reg"].ToString());
                descargado = Convert.ToBoolean(drp["descargado"]);
                capacitado = Convert.ToBoolean(drp["capacitado"]);

            }
            drp.Close();
            cnn.Close();
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
   
    public string Grabar_Comedor()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_ComedorGuardar";
            
            cmd.Parameters.Add("@id_escuela", SqlDbType.Int).Value = id_escuela;
            cmd.Parameters.Add("@id_coordinacion", SqlDbType.Int).Value = id_coordinacion;
            cmd.Parameters.Add("@nombrecoordinacion", SqlDbType.NVarChar, -1).Value = nombrecoordinacion;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, -1).Value = nombre;
            cmd.Parameters.Add("@apellidop", SqlDbType.NVarChar, -1).Value = apellidop;
            cmd.Parameters.Add("@apellidom", SqlDbType.NVarChar, -1).Value = apellidom;
            cmd.Parameters.Add("@tel", SqlDbType.NVarChar, -1).Value = tel;
            cmd.Parameters.Add("@correo", SqlDbType.NVarChar, -1).Value = correo;
            cmd.Parameters.Add("@claveCT", SqlDbType.NVarChar, -1).Value = claveCT;
            cmd.Parameters.Add("@unidad_consumo", SqlDbType.NVarChar, -1).Value = unidad_consumo;
            

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