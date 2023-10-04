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
using System.Configuration;
/// <summary>
/// Descripción breve de UsersADH
/// </summary>
public class Usuarios : Users
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    public Usuarios()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public Usuarios(string userLogin)
    {
        try { base.ID = userLogin; base.Cargar(); Cargar(); }
        catch (Exception ex) { throw ex; }
    }

    #region Variables
    bool mensajes = false;
    bool administrar = false;
    bool administrar_distintivo = false;
    bool registro = false;

    bool reportes_bitacora = false;
    bool reportes_distintivo = false;

    int id_coordinacion = 0;
    int id_persona = 0;
    string nombre_coordinacion = "";
    string reguser = "";

    string rol = "";
    bool uos = false;
    bool dictaminador = false;
    bool dds = false;
    bool dos = false;
    bool deas = false;
    bool das = false;
    bool correspondencia = false;
    bool coordinacion = false;
    bool cis = false;
    bool ueas = false;
    bool oficom = false;
    bool monitoreo = false;

    bool uos_sl = false;
    bool dictaminador_sl = false;
    bool dds_sl = false;
    bool dos_sl = false;
    bool deas_sl = false;
    bool das_sl = false;
    bool correspondencia_sl = false;
    bool coordinacion_sl = false;
    bool cis_sl = false;
    bool ueas_sl = false;
    bool oficom_sl = false;

    bool rechazados = false;
    bool entregados = false;
    bool finalizados = false;

    bool bitacora = false;
    bool captura = false;
    bool busqueda = false;
    bool solucionar = false;
    bool requisitos = false;

    bool acver = false;


    //s-Sistema
    string sistema = "";


    #endregion
    #region Propiedades

    public string Sistema { get { return sistema; } set { sistema = value; } }

    public new bool Mensajes { get { return mensajes; } set { mensajes = value; } }
    public new bool Administrar { get { return administrar; } set { administrar = value; } }
    public bool Administrar_Distintivo { get { return administrar_distintivo; } set { administrar_distintivo = value; } }
    public bool Reportes_Bitacora { get { return reportes_bitacora; } set { reportes_bitacora = value; } }
    public bool Reportes_Distintivo { get { return reportes_distintivo; } set { reportes_distintivo = value; } }
    public bool Registro { get { return registro; } set { registro = value; } }
    public int NumeroCoordinacion { get { return id_coordinacion; } set { id_coordinacion = value; } }
    public new int Id_Persona { get { return id_persona; } set { id_persona = value; } }
    public string NombreCoordinacion { get { return nombre_coordinacion; } set { nombre_coordinacion = value; } }
    public string Reguser { get { return reguser; } set { reguser = value; } }
    public string Rol { get { return rol; } set { rol = value; } }
    public bool UOS { get { return uos; } set { uos = value; } }
    public bool DICTAMINADOR { get { return dictaminador; } set { dictaminador = value; } }
    public bool DDS { get { return dds; } set { dds = value; } }
    public bool DOS { get { return dos; } set { dos = value; } }
    public bool DEAS { get { return deas; } set { deas = value; } }
    public bool DAS { get { return das; } set { das = value; } }
    public bool CORRESPONDENCIA { get { return correspondencia; } set { correspondencia = value; } }
    public bool COORDINACION { get { return coordinacion; } set { coordinacion = value; } }
    public bool CIS { get { return cis; } set { cis = value; } }
    public bool UEAS { get { return ueas; } set { ueas = value; } }
    public bool OFICOM { get { return oficom; } set { oficom = value; } }
    public bool MONITOREO { get { return monitoreo; } set { monitoreo = value; } }

    public bool UOS_sl { get { return uos_sl; } set { uos_sl = value; } }
    public bool DICTAMINADOR_sl { get { return dictaminador_sl; } set { dictaminador_sl = value; } }
    public bool DDS_sl { get { return dds_sl; } set { dds_sl = value; } }
    public bool DOS_sl { get { return dos_sl; } set { dos_sl = value; } }
    public bool DEAS_sl { get { return deas_sl; } set { deas_sl = value; } }
    public bool DAS_sl { get { return das_sl; } set { das_sl = value; } }
    public bool CORRESPONDENCIA_sl { get { return correspondencia_sl; } set { correspondencia_sl = value; } }
    public bool COORDINACION_sl { get { return coordinacion_sl; } set { coordinacion_sl = value; } }
    public bool CIS_sl { get { return cis_sl; } set { cis_sl = value; } }
    public bool UEAS_sl { get { return ueas_sl; } set { ueas_sl = value; } }
    public bool OFICOM_sl { get { return oficom_sl; } set { oficom_sl = value; } }



    public bool RECHAZADOS { get { return rechazados; } set { rechazados = value; } }
    public bool ENTREGADOS { get { return entregados; } set { entregados = value; } }
    public bool FINALIZADOS { get { return finalizados; } set { finalizados = value; } }


    public bool BITACORA { get { return bitacora; } set { bitacora = value; } }
    public bool CAPTURA { get { return captura; } set { captura = value; } }
    public bool BUSQUEDA { get { return busqueda; } set { busqueda = value; } }
    public bool SOLUCIONAR { get { return solucionar; } set { solucionar = value; } }
    public bool REQUISITOS { get { return requisitos; } set { requisitos = value; } }

    public bool ACVER { get { return acver; } set { acver = value; } }
    #endregion

    #region Metodos

    public override void Cargar()
    {

        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandType = CommandType.StoredProcedure,
                CommandText = @"bitaseg.proc_UserBuscarId"
            };
            //PARAMS
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = base.ID;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                mensajes = Convert.ToBoolean(dr["mensajes"]);
                administrar = Convert.ToBoolean(dr["administrar"]);
                registro = Convert.ToBoolean(dr["registro"]);

                uos = Convert.ToBoolean(dr["uos"]);
                dictaminador = Convert.ToBoolean(dr["dictaminador"]);
                dds = Convert.ToBoolean(dr["dds"]);
                dos = Convert.ToBoolean(dr["dos"]);
                deas = Convert.ToBoolean(dr["deas"]);
                das = Convert.ToBoolean(dr["das"]);
                correspondencia = Convert.ToBoolean(dr["correspondencia"]);
                coordinacion = Convert.ToBoolean(dr["coordinacion"]);
                cis = Convert.ToBoolean(dr["cis"]);
                ueas = Convert.ToBoolean(dr["ueas"]);
                oficom = Convert.ToBoolean(dr["oficom"]);

                uos_sl = Convert.ToBoolean(dr["uos_sl"]);
                dictaminador_sl = Convert.ToBoolean(dr["dictaminador_sl"]);
                dds_sl = Convert.ToBoolean(dr["dds_sl"]);
                dos_sl = Convert.ToBoolean(dr["dos_sl"]);
                deas_sl = Convert.ToBoolean(dr["deas_sl"]);
                das_sl = Convert.ToBoolean(dr["das_sl"]);
                correspondencia_sl = Convert.ToBoolean(dr["correspondencia_sl"]);
                coordinacion_sl = Convert.ToBoolean(dr["coordinacion_sl"]);
                cis_sl = Convert.ToBoolean(dr["cis_sl"]);
                ueas_sl = Convert.ToBoolean(dr["ueas_sl"]);
                oficom_sl = Convert.ToBoolean(dr["oficom_sl"]);

                monitoreo = Convert.ToBoolean(dr["monitoreo"]);
                acver = Convert.ToBoolean(dr["acver"]);

                reportes_bitacora = Convert.ToBoolean(dr["reportes_bitacora"]);
                reportes_distintivo = Convert.ToBoolean(dr["reportes_distintivo"]);
                administrar_distintivo = Convert.ToBoolean(dr["administrar_distintivo"]);


                rechazados = Convert.ToBoolean(dr["rechazados"]);
                entregados = Convert.ToBoolean(dr["entregados"]);
                finalizados = Convert.ToBoolean(dr["finalizados"]);

                bitacora = Convert.ToBoolean(dr["bitacora"]);
                captura = Convert.ToBoolean(dr["captura"]);
                busqueda = Convert.ToBoolean(dr["busqueda"]);

                solucionar = Convert.ToBoolean(dr["solucionar"]);
                requisitos = Convert.ToBoolean(dr["requisitos"]);
                NumeroCoordinacion = Convert.ToInt32(dr["id_coordinacion"]);
            }

            dr.Close();

        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
    }
    public new void Lista(string nombreBuscar, string userLogin, string Sistema, GridView grd)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandType = CommandType.StoredProcedure,
                CommandText = "bitaseg.proc_UserLista"
            };
            cmd.Parameters.Add("@nombre_buscar", SqlDbType.NVarChar, 50).Value = nombreBuscar;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
            cmd.Parameters.Add("@sistema", SqlDbType.NVarChar, 50).Value = Sistema;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            grd.DataSource = dt;
            grd.DataBind();

            da.Dispose();

            GridDecorator.MakeGridViewPrinterFriendly(grd);


        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
    }
    public override bool Grabar()
    {
        bool grabo = false;
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandType = CommandType.StoredProcedure,
                CommandText = "bitaseg.proc_UserGrabar"
            };


            //PARAMS
            //De qué sistema viene
            cmd.Parameters.Add("@sistema", SqlDbType.NVarChar, -1).Value = sistema;

            cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50).Value = base.ID;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = UserLogin;
            cmd.Parameters.Add("@iniciales", SqlDbType.NVarChar, 50).Value = Iniciales;
            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = IdPersona;
            cmd.Parameters.Add("@activo", SqlDbType.Bit).Value = Activo;
            cmd.Parameters.Add("@mensajes", SqlDbType.Bit).Value = Mensajes;
            cmd.Parameters.Add("@activar_notificaciones", SqlDbType.Bit).Value = ActivarNotificaciones;
            //
            cmd.Parameters.Add("@administrar", SqlDbType.Bit).Value = administrar;
            cmd.Parameters.Add("@mensajes2", SqlDbType.Bit).Value = mensajes;
            cmd.Parameters.Add("@registro", SqlDbType.Bit).Value = registro;
            //
            cmd.Parameters.Add("@id_coordinacion", SqlDbType.Int).Value = NumeroCoordinacion;

            cmd.Parameters.Add("@uos", SqlDbType.Bit).Value = uos;
            cmd.Parameters.Add("@dictaminador", SqlDbType.Bit).Value = dictaminador;
            cmd.Parameters.Add("@dds", SqlDbType.Bit).Value = dds;
            cmd.Parameters.Add("@dos", SqlDbType.Bit).Value = dos;
            cmd.Parameters.Add("@deas", SqlDbType.Bit).Value = deas;
            cmd.Parameters.Add("@das", SqlDbType.Bit).Value = das;
            cmd.Parameters.Add("@correspondencia", SqlDbType.Bit).Value = correspondencia;
            cmd.Parameters.Add("@coordinacion", SqlDbType.Bit).Value = coordinacion;
            cmd.Parameters.Add("@cis", SqlDbType.Bit).Value = cis;
            cmd.Parameters.Add("@ueas", SqlDbType.Bit).Value = ueas;
            cmd.Parameters.Add("@oficom", SqlDbType.Bit).Value = oficom;

            cmd.Parameters.Add("@uos_sl", SqlDbType.Bit).Value = uos_sl;
            cmd.Parameters.Add("@dictaminador_sl", SqlDbType.Bit).Value = dictaminador_sl;
            cmd.Parameters.Add("@dds_sl", SqlDbType.Bit).Value = dds_sl;
            cmd.Parameters.Add("@dos_sl", SqlDbType.Bit).Value = dos_sl;
            cmd.Parameters.Add("@deas_sl", SqlDbType.Bit).Value = deas_sl;
            cmd.Parameters.Add("@das_sl", SqlDbType.Bit).Value = das_sl;
            cmd.Parameters.Add("@correspondencia_sl", SqlDbType.Bit).Value = correspondencia_sl;
            cmd.Parameters.Add("@coordinacion_sl", SqlDbType.Bit).Value = coordinacion_sl;
            cmd.Parameters.Add("@cis_sl", SqlDbType.Bit).Value = cis_sl;
            cmd.Parameters.Add("@ueas_sl", SqlDbType.Bit).Value = ueas_sl;
            cmd.Parameters.Add("@oficom_sl", SqlDbType.Bit).Value = oficom_sl;

            cmd.Parameters.Add("@monitoreo", SqlDbType.Bit).Value = monitoreo;

            cmd.Parameters.Add("@entregados", SqlDbType.Bit).Value = entregados;
            cmd.Parameters.Add("@rechazados", SqlDbType.Bit).Value = rechazados;
            cmd.Parameters.Add("@finalizados", SqlDbType.Bit).Value = finalizados;

            cmd.Parameters.Add("@bitacora", SqlDbType.Bit).Value = bitacora;
            cmd.Parameters.Add("@captura", SqlDbType.Bit).Value = captura;
            cmd.Parameters.Add("@busqueda", SqlDbType.Bit).Value = busqueda;


            cmd.Parameters.Add("@solucionar", SqlDbType.Bit).Value = solucionar;
            cmd.Parameters.Add("@requisitos", SqlDbType.Bit).Value = requisitos;
            cmd.Parameters.Add("@reportes_bitacora", SqlDbType.Bit).Value = reportes_bitacora;
            //

            //Distintivo
            cmd.Parameters.Add("@administrar_distintivo", SqlDbType.Bit).Value = administrar_distintivo;
            cmd.Parameters.Add("@reportes_distintivo", SqlDbType.Bit).Value = reportes_distintivo;
            //
            //Actas de verificación
            cmd.Parameters.Add("@acver", SqlDbType.Bit).Value = acver;
            //
            cmd.Parameters.Add("@user_login_graba", SqlDbType.NVarChar, 50).Value = base.UserReg;
            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = RemoteAddr;
            UserLogin = Convert.ToString(cmd.ExecuteScalar());
            grabo = true;
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
        return grabo;
    }
    public override bool Login(string pUserLogin, string pUserPassword, string remoteAddr)
    {
        bool logged;
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandType = CommandType.StoredProcedure,
                CommandText = "bitaseg.proc_UserLogin"
            };
            //PARAMS
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            cmd.Parameters.Add("@user_password", SqlDbType.NVarChar, 4000).Value = cripto.Encrypt(pUserPassword);
            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = remoteAddr;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                logged = true;
            }
            else
            {
                throw (new Exception("Nombre de usuario y contraseña correctos"));
            }
            dr.Close();
            return logged;
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
    }
    public static string ElegirSubSistema(string pUserLogin, string pageName, Page page)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        string[] pager = pageName.Split('.');
        StringBuilder strMenus = new StringBuilder("");
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandText = "bitaseg.proc_UserMenu",
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                ////Inicio
                //strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-home\"></i>&nbsp;Inicio</a></li>", pager[0] == "active" ? "active" : "", Strings.GetUrl("default.aspx", page)));

                strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("default.aspx", page)));
                //strMenus.Append(String.Format("<li class=\"{0}\"><a id='sistemas' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Sistemas</a></li>", pager[0] == "default" ? "" : "", Strings.GetUrl("sistema/avisos/default.aspx", page)));


             
            }
            return strMenus.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
    }
    public new static string ShowMenu(string pUserLogin, string pageName, Page page)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        string[] pager = pageName.Split('.');
        StringBuilder strMenus = new StringBuilder("");
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandText = "bitaseg.proc_UserMenu",
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                ////Inicio
                //strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-home\"></i>&nbsp;Inicio</a></li>", pager[0] == "active" ? "active" : "", Strings.GetUrl("default.aspx", page)));

                strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("default.aspx", page)));
                strMenus.Append(String.Format("<li class=\"{0}\"><a id='sistemas' href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;Avisos de Funcionamiento</a></li>", pager[0] == "default" ? "" : "", Strings.GetUrl("sistema/avisos/default.aspx", page)));


                if (Convert.ToBoolean(dr["bitaseg"]))
                {
                    //BITACORA  
                    if (Convert.ToBoolean(dr["bitacora"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-anchor\"></i>&nbsp;Bitácora Todo</a></li>", pager[0] == "bitacora" ? "active" : "", Strings.GetUrl("lbitacora.aspx", page)));
                    }
                    //CAPTURA  
                    if (Convert.ToBoolean(dr["captura"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil-square-o\"></i>&nbsp;Capturar Nuevo</a></li>", pager[0] == "captura" ? "active" : "", Strings.GetUrl("lcaptura.aspx", page)));
                    }
                    //BUSQUEDA  
                    if (Convert.ToBoolean(dr["busqueda"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-search\"></i>&nbsp;Busqueda</a></li>", pager[0] == "busqueda" ? "active" : "", Strings.GetUrl("lbusqueda.aspx", page)));
                    }

                    //Mensajes
                    //if (Convert.ToBoolean(dr["mensajes"]))
                    //{
                    //    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-envelope\"></i>&nbsp;MENSAJERÍA <sup><span id=\"contador_mensajes\" class=\"counter\" ></span></sup></a></li>", pager[0] == "mensajes" ? "active" : "", Strings.GetUrl("mensajes", page)));
                    //}

                    //Registro
                    //if (Convert.ToBoolean(dr["registro"]))
                    //{
                    //    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-clone\"></i>&nbsp;Registro</a></li>", pager[0] == "registro" ? "active" : "", Strings.GetUrl("registro", page)));
                    //}

                    //CIS    
                    if (Convert.ToBoolean(dr["cis"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;CIS</a></li>", pager[0] == "cis" ? "active" : "", Strings.GetUrl("lcis.aspx", page)));
                    }
                    //UEAS  
                    if (Convert.ToBoolean(dr["ueas"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;UEAS</a></li>", pager[0] == "ueas" ? "active" : "", Strings.GetUrl("lueas.aspx", page)));
                    }
                    //COORDINACION  
                    if (Convert.ToBoolean(dr["coordinacion"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Coordinación</a></li>", pager[0] == "coordinacion" ? "active" : "", Strings.GetUrl("lcoordinacion.aspx", page)));
                    }
                    //UOS  
                    if (Convert.ToBoolean(dr["uos"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;UOS</a></li>", pager[0] == "uos" ? "active" : "", Strings.GetUrl("luos.aspx", page)));
                    }
                    //DICTAMINADOR  
                    if (Convert.ToBoolean(dr["dictaminador"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Dictaminador</a></li>", pager[0] == "dictaminador" ? "active" : "", Strings.GetUrl("ldictaminador.aspx", page)));
                    }
                    //DDS  
                    if (Convert.ToBoolean(dr["dds"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DDS</a></li>", pager[0] == "dds" ? "active" : "", Strings.GetUrl("ldds.aspx", page)));
                    }
                    //DOS  
                    if (Convert.ToBoolean(dr["dos"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DOS</a></li>", pager[0] == "dos" ? "active" : "", Strings.GetUrl("ldos.aspx", page)));
                    }
                    //DEAS  
                    if (Convert.ToBoolean(dr["deas"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DEAS</a></li>", pager[0] == "deas" ? "active" : "", Strings.GetUrl("ldeas.aspx", page)));
                    }
                    //DAS
                    if (Convert.ToBoolean(dr["das"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DALS</a></li>", pager[0] == "das" ? "active" : "", Strings.GetUrl("ldas.aspx", page)));
                    }
                    //CORRESPONDENCIA  
                    if (Convert.ToBoolean(dr["correspondencia"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Correspondencia</a></li>", pager[0] == "correspondencia" ? "active" : "", Strings.GetUrl("lcorrespondencia.aspx", page)));
                    }
                    //OFICINA DEL COMISIONADO  
                    if (Convert.ToBoolean(dr["oficom"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Oficina del Comisionado</a></li>", pager[0] == "oficom" ? "active" : "", Strings.GetUrl("loficom.aspx", page)));
                    }


                    //CIS_SL    
                    if (Convert.ToBoolean(dr["cis_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;CIS*</a></li>", pager[0] == "cis_sl" ? "active" : "", Strings.GetUrl("lcis_sl.aspx", page)));
                    }
                    //UEAS _SL 
                    if (Convert.ToBoolean(dr["ueas_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;UEAS*</a></li>", pager[0] == "ueas_sl" ? "active" : "", Strings.GetUrl("lueas_sl.aspx", page)));
                    }
                    //COORDINACION_SL 
                    if (Convert.ToBoolean(dr["coordinacion_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Coordinación*</a></li>", pager[0] == "coordinacion_sl" ? "active" : "", Strings.GetUrl("lcoordinacion_sl.aspx", page)));
                    }
                    //UOS_SL  
                    if (Convert.ToBoolean(dr["uos_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;UOS*</a></li>", pager[0] == "uos_sl" ? "active" : "", Strings.GetUrl("luos_sl.aspx", page)));
                    }
                    //DICTAMINADOR_SL
                    if (Convert.ToBoolean(dr["dictaminador_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Dictaminador*</a></li>", pager[0] == "dictaminador_sl" ? "active" : "", Strings.GetUrl("ldictaminador_sl.aspx", page)));
                    }
                    //DDS_SL  
                    if (Convert.ToBoolean(dr["dds_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DDS*</a></li>", pager[0] == "dds_sl" ? "active" : "", Strings.GetUrl("ldds_sl.aspx", page)));
                    }
                    //DOS_SL  
                    if (Convert.ToBoolean(dr["dos_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DOS*</a></li>", pager[0] == "dos_sl" ? "active" : "", Strings.GetUrl("ldos_sl.aspx", page)));
                    }
                    //DEAS_SL  
                    if (Convert.ToBoolean(dr["deas_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DEAS*</a></li>", pager[0] == "deas_sl" ? "active" : "", Strings.GetUrl("ldeas_sl.aspx", page)));
                    }
                    //DAS_SL
                    if (Convert.ToBoolean(dr["das_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;DALS*</a></li>", pager[0] == "das_sl" ? "active" : "", Strings.GetUrl("ldas_sl.aspx", page)));
                    }
                    //CORRESPONDENCIA_SL  
                    if (Convert.ToBoolean(dr["correspondencia_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Correspondencia*</a></li>", pager[0] == "correspondencia_sl" ? "active" : "", Strings.GetUrl("lcorrespondencia_sl.aspx", page)));
                    }
                    //OFICINA DEL COMISIONADO_SL  
                    if (Convert.ToBoolean(dr["oficom_sl"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;Oficina del Comisionado*</a></li>", pager[0] == "oficom_sl" ? "active" : "", Strings.GetUrl("loficom_sl.aspx", page)));
                    }


                    //MONITOREO 
                    if (Convert.ToBoolean(dr["monitoreo"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;CAT</a></li>", pager[0] == "monitoreo" ? "active" : "", Strings.GetUrl("lcat.aspx", page)));
                    }

                    //ENTREGADOS  
                    if (Convert.ToBoolean(dr["entregados"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-child\"></i>&nbsp;Entregados</a></li>", pager[0] == "entregados" ? "active" : "", Strings.GetUrl("lentregados.aspx", page)));
                    }

                    //RECHAZADOS  
                    if (Convert.ToBoolean(dr["rechazados"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-remove\"></i>&nbsp;Rechazados</a></li>", pager[0] == "rechazados" ? "active" : "", Strings.GetUrl("lrechazados.aspx", page)));
                    }
                    //FINALIZADOS  
                    if (Convert.ToBoolean(dr["finalizados"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-check\"></i>&nbsp;Finalizados</a></li>", pager[0] == "finalizados" ? "active" : "", Strings.GetUrl("lfinalizados.aspx", page)));
                    }

                    //SOLUCIONAR PROBLEMAS  
                    if (Convert.ToBoolean(dr["solucionar"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-bullseye\"></i>&nbsp;Solucionador</a></li>", pager[0] == "solucionar" ? "active" : "", Strings.GetUrl("lsolucionar.aspx", page)));
                    }
                    //REQUISITOS
                    if (Convert.ToBoolean(dr["Requisitos"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-list-alt\"></i>&nbsp;Requisitos Trámites</a></li>", pager[0] == "requisitos" ? "active" : "", Strings.GetUrl("requisitos.aspx", page)));
                    }
                }

                if (Convert.ToBoolean(dr["distintivo"]))
                {
                    if (Convert.ToBoolean(dr["reportes_distintivo"]))
                    {
                        strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-list-alt\"></i>&nbsp;Reportes</a></li>", pager[0] == "reportes_distintivo" ? "active" : "", Strings.GetUrl("Reportes/Distintivos/default.aspx", page)));
                    }
                }
                    ////ACTAS DE VERIFICACIÓN 
                    //if (Convert.ToBoolean(dr["acver"]))
                    //{
                    //    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-check-square-o\"></i>&nbsp;Actas Verificación</a></li>", pager[0] == "acver" ? "active" : "", Strings.GetUrl("Dctmatm/Av-atn-med-amb.aspx", page)));
                    //}
                }
            return strMenus.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
    }
    public new static string ShowAdminMenu(string pUserLogin, Page page)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        StringBuilder strMenus = new StringBuilder("");
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandText = "select administrar,administrar_distintivo from [bitaseg].[usuarios] where user_login=@user_login"
            };
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (Convert.ToBoolean(dr["administrar"]))
                {
                    strMenus.Append(String.Format("<a class=\"dropdown-item {0}\" href=\"{1}\"><i class=\"fa fa-gear icon\"></i>Administrar </a>", page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[0] == "sistema" && page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[1] == "admin" ? "active" : "", Strings.GetUrl("admin", page)));
                }
                if (Convert.ToBoolean(dr["administrar_distintivo"]))
                {
                    strMenus.Append(String.Format("<a class=\"dropdown-item {0}\" href=\"{1}\"><i class=\"fa fa-gear icon\"></i>Administrar </a>", page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[0] == "sistema" && page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[1] == "admin" ? "active" : "", Strings.GetUrl("Distintivo/admin", page)));
                }

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cnn.Close();
        }
        return strMenus.ToString();
    }
    public bool PasswordSetADH(string passwordNew, String user_login, string userReg, string reporteAddr)
    {
        //Función para el inicio de sesión, regresará false en caso de fallar
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {

            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandType = CommandType.StoredProcedure,
                CommandText = "bitaseg.proc_UserSetPassword"
            };
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_login;
            cmd.Parameters.Add("@user_password_new", SqlDbType.NVarChar, -1).Value = cripto.Encrypt(passwordNew);
            cmd.Parameters.Add("@user_reg", SqlDbType.NVarChar, 50).Value = userReg;
            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = reporteAddr;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            return (true);

        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); }
    }

    //public void InfoLogin()
    //{

    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    try
    //    {
    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cnn;
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        //cmd.CommandText = @"bitaseg.proc_ObtenerCoord";
    //        cmd.CommandText = @"bitaseg.proc_UserBuscarId";
    //        //PARAMS
    //        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = base.ID;

    //        SqlDataReader dr = cmd.ExecuteReader();
    //        if (dr.Read())
    //        {

    //            mensajes = Convert.ToBoolean(dr["mensajes"]);
    //            administrar = Convert.ToBoolean(dr["administrar"]);
    //            registro = Convert.ToBoolean(dr["registro"]);
    //            id_coordinacion = Convert.ToInt32(dr["id_coordinacion"]);

    //            uos = Convert.ToBoolean(dr["uos"]);
    //            dictaminador = Convert.ToBoolean(dr["dictaminador"]);
    //            dds = Convert.ToBoolean(dr["dds"]);
    //            dos = Convert.ToBoolean(dr["dos"]);
    //            deas = Convert.ToBoolean(dr["deas"]);
    //            das = Convert.ToBoolean(dr["das"]);
    //            correspondencia = Convert.ToBoolean(dr["correspondencia"]);
    //            coordinacion = Convert.ToBoolean(dr["coordinacion"]);
    //            cis = Convert.ToBoolean(dr["cis"]);
    //            ueas = Convert.ToBoolean(dr["ueas"]);
    //            oficom = Convert.ToBoolean(dr["oficom"]);

    //            uos_sl = Convert.ToBoolean(dr["uos_sl"]);
    //            dictaminador_sl = Convert.ToBoolean(dr["dictaminador_sl"]);
    //            dds_sl = Convert.ToBoolean(dr["dds_sl"]);
    //            dos_sl = Convert.ToBoolean(dr["dos_sl"]);
    //            deas_sl = Convert.ToBoolean(dr["deas_sl"]);
    //            das_sl = Convert.ToBoolean(dr["das_sl"]);
    //            correspondencia_sl = Convert.ToBoolean(dr["correspondencia_sl"]);
    //            coordinacion_sl = Convert.ToBoolean(dr["coordinacion_sl"]);
    //            cis_sl = Convert.ToBoolean(dr["cis_sl"]);
    //            ueas_sl = Convert.ToBoolean(dr["ueas_sl"]);
    //            oficom_sl = Convert.ToBoolean(dr["oficom_sl"]);

    //            monitoreo = Convert.ToBoolean(dr["monitoreo"]);
    //            acver = Convert.ToBoolean(dr["acver"]);


    //            rechazados = Convert.ToBoolean(dr["rechazados"]);
    //            entregados = Convert.ToBoolean(dr["entregados"]);
    //            finalizados = Convert.ToBoolean(dr["finalizados"]);

    //            bitacora = Convert.ToBoolean(dr["bitacora"]);
    //            captura = Convert.ToBoolean(dr["captura"]);
    //            busqueda = Convert.ToBoolean(dr["busqueda"]);

    //            solucionar = Convert.ToBoolean(dr["solucionar"]);
    //            requisitos = Convert.ToBoolean(dr["requisitos"]);

    //        }

    //        dr.Close();

    //    }
    //    catch (Exception ex)
    //    {
    //        throw (ex);
    //    }
    //    finally
    //    {
    //        cnn.Close();
    //        cnn.Dispose();
    //    }
    //}
    public override void DatosDeRegistro(string user_login)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            if (string.IsNullOrEmpty(Principal.CnnStr0))
            {
                // La cadena de conexión no se encuentra en el archivo de configuración
                throw new ConfigurationErrorsException("La cadena de conexión 'dbCnnStr' no se ha configurado correctamente.");
            }

            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandType = CommandType.StoredProcedure,
                CommandText = @"bitaseg.proc_DatosRegistro"
            };
            //PARAMS
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_login;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                rol = dr["rol"].ToString();
                id_persona =Convert.ToInt32(dr["id_persona"]);

                uos = Convert.ToBoolean(dr["uos"]);
                dictaminador = Convert.ToBoolean(dr["dictaminador"]);
                dds = Convert.ToBoolean(dr["dds"]);
                dos = Convert.ToBoolean(dr["dos"]);
                deas = Convert.ToBoolean(dr["deas"]);
                das = Convert.ToBoolean(dr["das"]);
                correspondencia = Convert.ToBoolean(dr["correspondencia"]);
                coordinacion = Convert.ToBoolean(dr["coordinacion"]);
                cis = Convert.ToBoolean(dr["cis"]);
                ueas = Convert.ToBoolean(dr["ueas"]);
                oficom = Convert.ToBoolean(dr["oficom"]);

                uos_sl = Convert.ToBoolean(dr["uos_sl"]);
                dictaminador_sl = Convert.ToBoolean(dr["dictaminador_sl"]);
                dds_sl = Convert.ToBoolean(dr["dds_sl"]);
                dos_sl = Convert.ToBoolean(dr["dos_sl"]);
                deas_sl = Convert.ToBoolean(dr["deas_sl"]);
                das_sl = Convert.ToBoolean(dr["das_sl"]);
                correspondencia_sl = Convert.ToBoolean(dr["correspondencia_sl"]);
                coordinacion_sl = Convert.ToBoolean(dr["coordinacion_sl"]);
                cis_sl = Convert.ToBoolean(dr["cis_sl"]);
                ueas_sl = Convert.ToBoolean(dr["ueas_sl"]);
                oficom_sl = Convert.ToBoolean(dr["oficom_sl"]);

                monitoreo = Convert.ToBoolean(dr["monitoreo"]);
                acver = Convert.ToBoolean(dr["acver"]);


                rechazados = Convert.ToBoolean(dr["rechazados"]);
                entregados = Convert.ToBoolean(dr["entregados"]);
                finalizados = Convert.ToBoolean(dr["finalizados"]);

                bitacora = Convert.ToBoolean(dr["bitacora"]);
                captura = Convert.ToBoolean(dr["captura"]);
                busqueda = Convert.ToBoolean(dr["busqueda"]);

                solucionar = Convert.ToBoolean(dr["solucionar"]);
                requisitos = Convert.ToBoolean(dr["requisitos"]);

                administrar = Convert.ToBoolean(dr["administrar"]);
                administrar_distintivo = Convert.ToBoolean(dr["administrar_distintivo"]);
                reportes_bitacora = Convert.ToBoolean(dr["reportes_bitacora"]);
                reportes_distintivo = Convert.ToBoolean(dr["reportes_distintivo"]);
                reguser = Convert.ToString(dr["user_login"]);
                id_coordinacion = Convert.ToInt32(dr["id_coordinacion"]);
                nombre_coordinacion = dr["nombre_coordinacion"].ToString();
            }

            dr.Close();

        }
        //catch (ConfigurationErrorsException ex)
        //{
        //    Console.WriteLine("Error de configuración: " + ex.Message);
        //}
        catch (Exception ex)
        {

            throw (ex);
        }
        
        finally
        {
            cnn.Close();
            cnn.Dispose();
        }
    }


    #endregion
    
}


//public void MostrarUnidadesSalud(GridView grd)
//{
//    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//    try
//    {
//        cnn.Open();
//        SqlCommand cmd = new SqlCommand();
//        cmd.Connection = cnn;
//        cmd.CommandType = CommandType.StoredProcedure;
//        cmd.CommandText = "adh.proc_UserUnidadSaludLista";
//        //PARAMS
//        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = UserLogin;
//        DataTable dt = new DataTable();
//        SqlDataAdapter da = new SqlDataAdapter(cmd);
//        da.Fill(dt);
//        grd.DataSource = dt;
//        grd.DataBind();
//        //
//        GridDecorator.MakeGridViewPrinterFriendly(grd);
//        //
//        da.Dispose();
//    }

//    catch (Exception ex)
//    {
//        throw (ex);
//    }
//    finally
//    {
//        cnn.Close();
//        cnn.Dispose();
//    }
//}
//public bool ActivarUnidadesSalud(string userLogin, string datos, string userLoginGraba, string remoteAddr)
//{
//    bool retorno = false;
//    //Función para el inicio de sesión, regresará false en caso de fallar
//    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//    try
//    {
//        cnn.Open();
//        SqlCommand cmd = new SqlCommand();
//        cmd.Connection = cnn;
//        cmd.CommandType = CommandType.StoredProcedure;
//        cmd.CommandText = "adh.proc_UserUnidadSaludActivar";
//        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
//        cmd.Parameters.Add("@datos", SqlDbType.NVarChar, -1).Value = datos;
//        cmd.Parameters.Add("@user_login_graba", SqlDbType.NVarChar, 50).Value = userLoginGraba;
//        cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = remoteAddr;
//        cmd.ExecuteNonQuery();

//        retorno = true;

//    }
//    catch (Exception ex)
//    {
//        throw (ex);

//    }
//    finally
//    {
//        cnn.Close();
//    }
//    return retorno;
//}



