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
/// Descripción breve de UsersADH
/// </summary>
public class UsuariosOS : Users
{
    EncryptDecrypt cripto = new EncryptDecrypt();
    public UsuariosOS()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public UsuariosOS(string userLogin)
    {
        try { base.ID = userLogin; base.Cargar(); Cargar(); }
        catch (Exception ex) { throw ex; }
    }

    #region Variables
    bool mensajes = false;
    bool administrar = false;
    bool registro = false;
    int id_coordinacion = 0;
    int id_persona = 0;
    string nombre_coordinacion = "";
    string reguser = "";

    string rol = "";
    bool acver = false;



    #endregion
    #region Propiedades
    public new bool Mensajes { get { return mensajes; } set { mensajes = value; } }
    public new bool Administrar { get { return administrar; } set { administrar = value; } }
    public bool Registro { get { return registro; } set { registro = value; } }
    public int NumeroCoordinacion { get { return id_coordinacion; } set { id_coordinacion = value; } }
    //public int Id_Persona { get { return id_persona; } set { id_persona = value; } }
    public string NombreCoordinacion { get { return nombre_coordinacion; } set { nombre_coordinacion = value; } }
    public string Reguser { get { return reguser; } set { reguser = value; } }
    public string Rol { get { return rol; } set { rol = value; } }
    
    public bool ACVER { get { return acver; } set { acver = value; } }
    #endregion

    #region Metodos

    public override void Cargar()
    {

        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"dctm.proc_UserBuscarId";
            //PARAMS
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = base.ID;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                mensajes = Convert.ToBoolean(dr["mensajes"]);
                administrar = Convert.ToBoolean(dr["administrar"]);
                registro = Convert.ToBoolean(dr["registro"]);

             
                acver = Convert.ToBoolean(dr["acver"]);
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
    public new void Lista(string nombreBuscar, string userLogin, GridView grd)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Dctm.proc_UserLista";
            cmd.Parameters.Add("@nombre_buscar", SqlDbType.NVarChar, 50).Value = nombreBuscar;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
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
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Dctm.proc_UserGrabar";
            //PARAMS
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
        bool logged = false;
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_UserLogin";
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
    public new static string ShowMenu(string pUserLogin, string pageName, Page page)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        string[] pager = pageName.Split('.');
        StringBuilder strMenus = new StringBuilder("");
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandText = "dctm.proc_UserMenu";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                ////Inicio
                //strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-home\"></i>&nbsp;Inicio</a></li>", pager[0] == "active" ? "active" : "", Strings.GetUrl("default.aspx", page)));

           

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

            

                //ACTAS DE VERIFICACIÓN 
                if (Convert.ToBoolean(dr["acver"]))
                {
                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-check-square-o\"></i>&nbsp;Actas Verificación</a></li>", pager[0] == "acver" ? "active" : "", Strings.GetUrl("Dctmatm/Av-atn-med-amb.aspx", page)));
                }
                //ACTAS DE VERIFICACIÓN 
                if (Convert.ToBoolean(dr["decesos"]))
                {
                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-address-book\"></i>&nbsp;Decesos</a></li>", pager[0] == "decesos" ? "active" : "", Strings.GetUrl("Inf_Fune/C1_vic.aspx", page)));
                }


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
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandText = "select administrar from [dctm].[usuarios] where user_login=@user_login";
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (Convert.ToBoolean(dr["administrar"]))
                {
                    strMenus.Append(String.Format("<a class=\"dropdown-item {0}\" href=\"{1}\"><i class=\"fa fa-gear icon\"></i>Administrar </a>", page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[0] == "sistema" && page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[1] == "admin" ? "active" : "", Strings.GetUrl("admin_OS", page)));
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
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_UserSetPassword";
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
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"bitaseg.proc_DatosRegistro";
            //PARAMS
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_login;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                rol = dr["rol"].ToString();
                id_persona = Convert.ToInt32(dr["id_persona"]);

                acver = Convert.ToBoolean(dr["acver"]);

                administrar = Convert.ToBoolean(dr["administrar"]);
                reguser = Convert.ToString(dr["user_login"]);
                id_coordinacion = Convert.ToInt32(dr["id_coordinacion"]);
                nombre_coordinacion = dr["nombre_coordinacion"].ToString();
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


    #endregion


}






