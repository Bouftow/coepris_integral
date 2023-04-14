using System;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Descripción breve de Atencion_ciudadana
/// </summary>
public class Atencion_ciudadana
{
    public Atencion_ciudadana()
    {


    }
    public Atencion_ciudadana(int prmId)
    {
        try
        {
            id_solicitud = prmId;
            Mostrar();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }

    }

    #region Variables

    int id_solicitud = 0;
    int folio_solicitud = 0;
    int tipo_solicitud = 0;
    string solicitud = "";

    int id_estatus = 0;
    string estatus = "";
    //Datos Del Solicitante
    int id_persona = 0;
    string curp = "";
    string nombre = "";
    string primer_apellido = "";
    string segundo_apellido = "";
    int telefono = 0;

    int id_municipio = 0;
    string municipio = "";
    // Este es de la solicitud
    string zona = "";
    //
    string localidad = "";
    string cp = "";
    string colonia = "";
    string calle = "";
    string entre1 = "";
    string entre2 = "";
    string numint = "";
    string numext = "";

    //Datos del Paciente
    string curp_extra = "";
    string nombre_extra = "";
    string primer_apellido_extra = "";
    string segundo_apellido_extra = "";

    //Datos de la solicitud
    string c000 = "";
    string noficio = "";
    string sac = "";
    string descripcion = "";

    DateTime fecha_reg = DateTime.Now;

    //bool descargado = false;
    #endregion

    #region Propiedades

    public int IDsolicitud { get { return id_solicitud; } set { id_solicitud = value; } }
    public int IDPersona { get { return id_persona; } set { id_persona = value; } }
    public int FolioSolicitud { get { return folio_solicitud; } set { folio_solicitud = value; } }
    public int TipoSolicitud { get { return tipo_solicitud; } set { tipo_solicitud = value; } }
    public string Solicitud { get { return solicitud; } set { solicitud = value; } }


    public int IDEstatus { get { return id_estatus; } set { id_estatus = value; } }
    public string Estatus { get { return estatus; } set { estatus = value; } }

    public string CURP { get { return curp; } set { curp = value; } }
    public string Nombre { get { return nombre; } set { nombre = value; } }
    public string PrimerApellido { get { return primer_apellido; } set { primer_apellido = value; } }
    public string SegundoApellido { get { return segundo_apellido; } set { segundo_apellido = value; } }
    public int Telefono { get { return telefono; } set { telefono = value; } }



    public int IDmunicipio { get { return id_municipio; } set { id_municipio = value; } }
    public string Municipio { get { return municipio; } set { municipio = value; } }
    public string Zona { get { return zona; } set { zona = value; } }
    public string Localidad { get { return localidad; } set { localidad = value; } }
    public string CP { get { return cp; } set { cp = value; } }
    public string Colonia { get { return colonia; } set { colonia = value; } }
    public string Calle { get { return calle; } set { calle = value; } }
    public string Entre1 { get { return entre1; } set { entre1 = value; } }
    public string Entre2 { get { return entre2; } set { entre2 = value; } }
    public string NumInt { get { return numint; } set { numint = value; } }
    public string NumExt { get { return numext; } set { numext = value; } }


    public string CURP_Extra { get { return curp_extra; } set { curp_extra = value; } }
    public string Nombre_Extra { get { return nombre_extra; } set { nombre_extra = value; } }
    public string PrimerApellido_Extra { get { return primer_apellido_extra; } set { primer_apellido_extra = value; } }
    public string SegundoApellido_Extra { get { return segundo_apellido_extra; } set { segundo_apellido_extra = value; } }


    public string C000 { get { return c000; } set { c000 = value; } }
    public string NOficio { get { return noficio; } set { noficio = value; } }
    public string SAC { get { return sac; } set { sac = value; } }
    public string Descripcion { get { return descripcion; } set { descripcion = value; } }


    public DateTime FechaReg { get { return fecha_reg; } set { fecha_reg = value; } }

    //public bool Descargado { get { return descargado; } set { descargado = value; } }




    #endregion

    #region Métodos
    //public static string ShowMenu(/*string pUserLogin,*/ string pageName, Page page)
    //{
    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    string[] pager = pageName.Split('.');
    //    StringBuilder strMenus = new StringBuilder("");
    //    try
    //    {
    //        //    cnn.Open();
    //        //    SqlCommand cmd = new SqlCommand();
    //        //    cmd.Connection = cnn;
    //        //    cmd.CommandText = "bitaseg.proc_UserMenu";
    //        //    cmd.CommandType = CommandType.StoredProcedure;
    //        //    cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
    //        //    SqlDataReader dr = cmd.ExecuteReader();

    //        //if (dr.Read())
    //        //{
    //        ////Inicio
    //        //strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-home\"></i>&nbsp;Inicio</a></li>", pager[0] == "active" ? "active" : "", Strings.GetUrl("default.aspx", page)));

    //        strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("Distintivo/Default.aspx", page)));

    //        //BITACORA  
    //        //if (Convert.ToBoolean(dr["bitacora"]))
    //        //{
    //        strMenus.Append(String.Format("<li class=\"{0}\"><a id='menu_registro' style='display:none' href=\"{1}\"><i class=\"fa fa-pencil-square-o\"></i>&nbsp;Registro</a></li>", pager[0] == "Registro" ? "active" : "disable", Strings.GetUrl("Distintivo/Registro.aspx", page)));
    //        //}
    //        //CAPTURA  
    //        //if (Convert.ToBoolean(dr["captura"]))
    //        //{
    //        strMenus.Append(String.Format("<li class=\"{0}\"><a id='menu_gracias' style='display:none' href=\"{1}\"><i class=\"fa fa-check-circle\"></i>&nbsp;¡Gracias!</a></li>", pager[0] == "gracias" ? "active" : "disable", Strings.GetUrl("Distintivo/Gracias.aspx", page)));
    //        //}


    //        //    }
    //        return strMenus.ToString();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //    finally
    //    {
    //        //cnn.Close();
    //        //cnn.Dispose();
    //    }
    //}
    private void Mostrar()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from sst_atn.solicitudes where id_solicitud=@id_solicitud";
            cmd.Parameters.Add("@id_solicitud", SqlDbType.Int).Value = id_solicitud;
            cmd.Connection = cnn;


            SqlDataReader drp = cmd.ExecuteReader();
            if (drp.Read())
            {
                id_solicitud = Convert.ToInt32(drp["id_solicitud"]);
                tipo_solicitud = Convert.ToInt32(drp["tipo_solicitud"]);
                folio_solicitud = Convert.ToInt32(drp["folio"]);

                solicitud = drp["solicitud"].ToString();
                
                id_estatus = Convert.ToInt32(drp["id_estatus"]);
                estatus = drp["estatus"].ToString();

                id_persona = Convert.ToInt32(drp["id_persona"]);

                curp = drp["curp"].ToString();
                nombre = drp["nombre"].ToString();
                primer_apellido = drp["primer_apellido"].ToString();
                segundo_apellido = drp["segundo_apellido"].ToString();
                telefono = Convert.ToInt32(drp["telefono"]);

                id_municipio = Convert.ToInt32(drp["id_municipio"]);

                municipio = drp["municipio"].ToString();
                zona = drp["zona"].ToString();
                localidad = drp["localidad"].ToString();
                cp = drp["cp"].ToString();
                colonia = drp["colonia"].ToString();
                calle = drp["calle"].ToString();
                entre1 = drp["entre1"].ToString();
                entre2 = drp["entre2"].ToString();
                numint = drp["numint"].ToString();
                numext = drp["numext"].ToString();

                curp_extra = drp["curp_extra"].ToString();
                nombre_extra = drp["nombre_extra"].ToString();
                primer_apellido_extra = drp["primer_apellido_extra"].ToString();
                segundo_apellido_extra = drp["segundo_apellido_extra"].ToString();


                c000 = drp["c000"].ToString();
                noficio = drp["noficio"].ToString();
                sac = drp["sac"].ToString();
                descripcion = drp["descripcion"].ToString();

                fecha_reg = Convert.ToDateTime(drp["fecha_reg"].ToString());
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
            cmd.CommandText = "sst_atn.[proc_atnGuardar]";


           
            //cmd.Parameters.Add("@cp", SqlDbType.NVarChar, -1).Value = cp;



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