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

    int id_persona = 0; //useless

    int id_solicitud = 0;
    int folio_solicitud = 0;
    int id_origen = 0;
    int id_tipo_solicitud = 0;
    string solicitud = "";
    decimal costo = 0.0M;

    int id_persona_paciente = 0;
    int id_persona_solicitante = 0;
	int id_parentesco = 0;

    //Datos del solicitante
    string curp_sol = "";
    int id_seguridad_social_sol = 0;
	DateTime fecha_nac_sol = new DateTime(1920, 01, 01);
    string telefono_sol = "";
    string nombre_sol = "";
    string primer_apellido_sol = "";
    string segundo_apellido_sol = "";
    int id_municipio_sol = 0;

    string localidad_sol = "";
    string cp_sol = "";
    string colonia_sol = "";
    string calle_sol = "";
    string entre1_sol = "";
    string entre2_sol = "";
    string referencias_sol = "";
    string numint_sol = "";
    string numext_sol = "";
    //Datos del paciente
    string curp_pac = "";
    int id_seguridad_social_pac = 0;
    DateTime fecha_nac_pac = new DateTime(1920, 01, 01);
    string telefono_pac = "";
    string nombre_pac = "";
    string primer_apellido_pac = "";
    string segundo_apellido_pac = "";
    int id_municipio_pac = 0;

    string localidad_pac = "";
    string cp_pac = "";
    string colonia_pac = "";
    string calle_pac = "";
    string entre1_pac = "";
    string entre2_pac = "";
    string referencias_pac = "";
    string numint_pac = "";
    string numext_pac = "";

    //Datos de la solicitud
    int id_estatus = 0;
    string estatus = "";

    int id_municipio_solicitud = 0;

    string c000 = "";
    string noficio = "";
    string sac = "";
    string id_presidente_republica = "";
    string descripcion = "";
    string adscripcion = "";
    DateTime fecha_reg = DateTime.Now;

    //bool descargado = false;
    #endregion

    #region Propiedades

    public int IDsolicitud { get { return id_solicitud; } set { id_solicitud = value; } }
    public int IDPersona { get { return id_persona; } set { id_persona = value; } }
    public int FolioSolicitud { get { return folio_solicitud; } set { folio_solicitud = value; } }
    public int IDTipoSolicitud { get { return id_tipo_solicitud; } set { id_tipo_solicitud = value; } }
    public int IDOrigen { get { return id_origen; } set { id_origen = value; } }
    public string Solicitud { get { return solicitud; } set { solicitud = value; } }
    public decimal Costo { get { return costo; } set { costo = value; } }


    public int IDEstatus { get { return id_estatus; } set { id_estatus = value; } }
    public string Estatus { get { return estatus; } set { estatus = value; } }


    //DATOS DEL SOLICITANTE
    public string CURP_Sol { get { return curp_sol; } set { curp_sol = value; } }
    public int IDSeguridadSocial_Sol { get { return id_seguridad_social_sol; } set { id_seguridad_social_sol = value; } }
    public DateTime FechaNac_Sol { get { return fecha_nac_sol; } set { fecha_nac_sol = value; } }
    public string Telefono_Sol { get { return telefono_sol; } set { telefono_sol = value; } }

    public string Nombre_Sol { get { return nombre_sol; } set { nombre_sol = value; } }
    public string PrimerApellido_Sol { get { return primer_apellido_sol; } set { primer_apellido_sol = value; } }
    public string SegundoApellido_Sol { get { return segundo_apellido_sol; } set { segundo_apellido_sol = value; } }

    public int IDmunicipio_Sol { get { return id_municipio_sol; } set { id_municipio_sol = value; } }
    public string Localidad_Sol { get { return localidad_sol; } set { localidad_sol = value; } }
    public string CP_Sol { get { return cp_sol; } set { cp_sol = value; } }
    public string Colonia_Sol { get { return colonia_sol; } set { colonia_sol = value; } }
    public string Calle_Sol { get { return calle_sol; } set { calle_sol = value; } }
    public string Entre1_Sol { get { return entre1_sol; } set { entre1_sol = value; } }
    public string Entre2_Sol { get { return entre2_sol; } set { entre2_sol = value; } }
    public string Referencias_Sol { get { return referencias_sol; } set { referencias_sol = value; } }
    public string NumInt_Sol { get { return numint_sol; } set { numint_sol = value; } }
    public string NumExt_Sol { get { return numext_sol; } set { numext_sol = value; } }

    //DATOS DEL PACIENTE
    public string CURP_Pac { get { return curp_pac; } set { curp_pac = value; } }
    public int IDSeguridadSocial_Pac { get { return id_seguridad_social_pac; } set { id_seguridad_social_pac = value; } }
    public DateTime FechaNac_Pac { get { return fecha_nac_pac; } set { fecha_nac_pac = value; } }
    public string Telefono_Pac { get { return telefono_pac; } set { telefono_pac = value; } }

    public string Nombre_Pac { get { return nombre_pac; } set { nombre_pac = value; } }
    public string PrimerApellido_Pac { get { return primer_apellido_pac; } set { primer_apellido_pac = value; } }
    public string SegundoApellido_Pac { get { return segundo_apellido_pac; } set { segundo_apellido_pac = value; } }

    public int IDmunicipio_Pac { get { return id_municipio_pac; } set { id_municipio_pac = value; } }
    public string Localidad_Pac { get { return localidad_pac; } set { localidad_pac = value; } }
    public string CP_Pac { get { return cp_pac; } set { cp_pac = value; } }
    public string Colonia_Pac { get { return colonia_pac; } set { colonia_pac = value; } }
    public string Calle_Pac { get { return calle_pac; } set { calle_pac = value; } }
    public string Entre1_Pac { get { return entre1_pac; } set { entre1_pac = value; } }
    public string Entre2_Pac { get { return entre2_pac; } set { entre2_pac = value; } }
    public string Referencias_Pac { get { return referencias_pac; } set { referencias_pac = value; } }
    public string NumInt_Pac { get { return numint_pac; } set { numint_pac = value; } }
    public string NumExt_Pac { get { return numext_pac; } set { numext_pac = value; } }


    public int IDParentesco { get { return id_parentesco; } set { id_parentesco = value; } }


    public int IDMunicipio_Solicitud { get { return id_municipio_solicitud; } set { id_municipio_solicitud = value; } }
    public string C000 { get { return c000; } set { c000 = value; } }
    public string NOficio { get { return noficio; } set { noficio = value; } }
    public string SAC { get { return sac; } set { sac = value; } }
    public string ID_PRESIDENTE_REPUBLICA { get { return id_presidente_republica; } set { id_presidente_republica = value; } }
    public string Descripcion { get { return descripcion; } set { descripcion = value; } }
    public string Adscripcion { get { return adscripcion; } set { adscripcion = value; } }


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
    public void Grabar_Solicitud()
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

            cmd.Parameters.Add("@id_solicitud", SqlDbType.Int).Value = id_solicitud;
            cmd.Parameters.Add("@folio_solicitud", SqlDbType.Int).Value = folio_solicitud;
            cmd.Parameters.Add("@id_origen", SqlDbType.Int).Value = id_origen;
            cmd.Parameters.Add("@id_tipo_solicitud", SqlDbType.Int).Value = id_tipo_solicitud;
            cmd.Parameters.Add("@solicitud", SqlDbType.NVarChar, -1).Value = solicitud;
            cmd.Parameters.Add("@costo", SqlDbType.Money).Value = costo;

           

            cmd.Parameters.Add("@id_persona_paciente", SqlDbType.Int).Value = id_persona_paciente;
            cmd.Parameters.Add("@id_persona_solicitante", SqlDbType.Int).Value = id_persona_solicitante;
            cmd.Parameters.Add("@id_parentesco", SqlDbType.Int).Value = id_parentesco;

            cmd.Parameters.Add("@id_municipio_solicitud", SqlDbType.Int).Value = id_municipio_solicitud;

            //Datos Del Solicitante
            cmd.Parameters.Add("@curp_sol", SqlDbType.NVarChar, -1).Value = curp_sol;
            cmd.Parameters.Add("@id_seguridad_social_sol", SqlDbType.Int).Value = id_seguridad_social_sol;
            cmd.Parameters.Add("@fecha_nac_sol", SqlDbType.DateTime).Value = fecha_nac_sol;

            cmd.Parameters.Add("@telefono_sol", SqlDbType.NVarChar, 15).Value = telefono_sol;
            cmd.Parameters.Add("@nombre_sol", SqlDbType.NVarChar, -1).Value = nombre_sol;
            cmd.Parameters.Add("@primer_apellido_sol", SqlDbType.NVarChar, -1).Value = primer_apellido_sol;
            cmd.Parameters.Add("@segundo_apellido_sol", SqlDbType.NVarChar, -1).Value = segundo_apellido_sol;

            cmd.Parameters.Add("@id_municipio_sol", SqlDbType.Int).Value = id_municipio_sol;

            cmd.Parameters.Add("@localidad_sol", SqlDbType.NVarChar, -1).Value = localidad_sol;
            cmd.Parameters.Add("@cp_sol", SqlDbType.NVarChar, -1).Value = cp_sol;
            cmd.Parameters.Add("@colonia_sol", SqlDbType.NVarChar, -1).Value = colonia_sol;
            cmd.Parameters.Add("@calle_sol", SqlDbType.NVarChar, -1).Value = calle_sol;
            cmd.Parameters.Add("@entre1_sol", SqlDbType.NVarChar, -1).Value = entre1_sol;
            cmd.Parameters.Add("@entre2_sol", SqlDbType.NVarChar, -1).Value = entre2_sol;
            cmd.Parameters.Add("@referencias_sol", SqlDbType.NVarChar, -1).Value = referencias_sol;
            cmd.Parameters.Add("@numint_sol", SqlDbType.NVarChar, -1).Value = numint_sol;
            cmd.Parameters.Add("@numext_sol", SqlDbType.NVarChar, -1).Value = numext_sol;

            //Datos Del Paciente
            cmd.Parameters.Add("@curp_pac", SqlDbType.NVarChar, -1).Value = curp_pac;
            cmd.Parameters.Add("@id_seguridad_social_pac", SqlDbType.Int).Value = id_seguridad_social_pac;
            cmd.Parameters.Add("@fecha_nac_pac", SqlDbType.DateTime).Value = fecha_nac_pac;

            cmd.Parameters.Add("@telefono_pac", SqlDbType.NVarChar, 15).Value = telefono_pac;
            cmd.Parameters.Add("@nombre_pac", SqlDbType.NVarChar, -1).Value = nombre_pac;
            cmd.Parameters.Add("@primer_apellido_pac", SqlDbType.NVarChar, -1).Value = primer_apellido_pac;
            cmd.Parameters.Add("@segundo_apellido_pac", SqlDbType.NVarChar, -1).Value = segundo_apellido_pac;

            cmd.Parameters.Add("@id_municipio_pac", SqlDbType.Int).Value = id_municipio_pac;

            cmd.Parameters.Add("@localidad_pac", SqlDbType.NVarChar, -1).Value = localidad_pac;
            cmd.Parameters.Add("@cp_pac", SqlDbType.NVarChar, -1).Value = cp_pac;
            cmd.Parameters.Add("@colonia_pac", SqlDbType.NVarChar, -1).Value = colonia_pac;
            cmd.Parameters.Add("@calle_pac", SqlDbType.NVarChar, -1).Value = calle_pac;
            cmd.Parameters.Add("@entre1_pac", SqlDbType.NVarChar, -1).Value = entre1_pac;
            cmd.Parameters.Add("@entre2_pac", SqlDbType.NVarChar, -1).Value = entre2_pac;
            cmd.Parameters.Add("@referencias_pac", SqlDbType.NVarChar, -1).Value = referencias_pac;
            cmd.Parameters.Add("@numint_pac", SqlDbType.NVarChar, -1).Value = numint_pac;
            cmd.Parameters.Add("@numext_pac", SqlDbType.NVarChar, -1).Value = numext_pac;

            //Datos de la solicitud

            cmd.Parameters.Add("@c000", SqlDbType.NVarChar, -1).Value = c000;
            cmd.Parameters.Add("@noficio", SqlDbType.NVarChar, -1).Value = noficio;
            cmd.Parameters.Add("@sac", SqlDbType.NVarChar, -1).Value = sac;
            cmd.Parameters.Add("@ID_presidente_republica", SqlDbType.NVarChar, -1).Value = id_presidente_republica;
            cmd.Parameters.Add("@descripcion", SqlDbType.NVarChar, -1).Value = descripcion;
            cmd.Parameters.Add("@adscripcion", SqlDbType.NVarChar, -1).Value = adscripcion;
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;

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