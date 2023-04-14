//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using System.Web.UI.WebControls;
//using Salud.Tamaulipas;
//using System.Text;
//using System.Web.UI;
///// <summary>
///// Descripción breve de UsersADH
///// </summary>
//public class UsersADH : Users
//{
//    EncryptDecrypt cripto = new EncryptDecrypt();
//    public UsersADH()
//    {
//        //
//        // TODO: Agregar aquí la lógica del constructor
//        //
//    }

//    public UsersADH(string userLogin)
//    {
//        try { base.ID = userLogin; base.Cargar(); Cargar(); }
//        catch (Exception ex) { throw ex; }
//    }

//    #region Propiedades
//    bool administrar = false;
//    public new bool Administrar { get { return administrar; } set { administrar = value; } }

//    bool banco_sangre = false;
//    public bool BancoSangre { get { return banco_sangre; } set { banco_sangre = value; } }

//    bool hemodialisis = false;
//    public bool Hemodialisis { get { return hemodialisis; } set { hemodialisis = value; } }

//    bool mensajes = false;
//    public new bool Mensajes { get { return mensajes; } set { mensajes = value; } }

//    bool registro = false;
//    public  bool Registro { get { return registro; } set { registro = value; } }

//    bool reportes = false;
//    public bool Reportes { get { return reportes; } set { reportes = value; } }

//    int id_unidad_salud = 0;
//    public int IdUnidadSalud { get { return id_unidad_salud; } set { id_unidad_salud = value; } }
//    #endregion

//    #region Metodos

//    public override void Cargar()
//    {

//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = @"bitaseg.proc_UserBuscarId";//NO REQUIERE MODIFICAR
//            //PARAMS
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = base.ID;

//            SqlDataReader dr = cmd.ExecuteReader();
//            if (dr.Read())
//            {
//                uos = Convert.ToBoolean(dr["uos"]);
//                dictaminador = Convert.ToBoolean(dr["dictaminador"]);
//                dds = Convert.ToBoolean(dr["dds"]);
//                dos = Convert.ToBoolean(dr["dos"]);
//                deas = Convert.ToBoolean(dr["deas"]);
//                das = Convert.ToBoolean(dr["das"]);
//                correspondencia = Convert.ToBoolean(dr["correspondencia"]);
//                rechazados = Convert.ToBoolean(dr["rechazados"]);
//                entregados = Convert.ToBoolean(dr["entregados"]);
//                bitacora = Convert.ToBoolean(dr["bitacora"]);
//                captura = Convert.ToBoolean(dr["captura"]);
//                busqueda = Convert.ToBoolean(dr["busqueda"]);
//                //id_unidad_salud = Convert.ToInt32(dr["id_unidad_salud"]);
//            }

//            dr.Close();

//        }
//        catch (Exception ex)
//        {
//            throw (ex);
//        }
//        finally
//        {
//            cnn.Close();
//            cnn.Dispose();
//        }
//    }

//    public new void Lista(string nombreBuscar, string userLogin, GridView grd)
//    {
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = "adh.proc_UserLista";
//            cmd.Parameters.Add("@nombre_buscar", SqlDbType.NVarChar, 50).Value = nombreBuscar;
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
//            SqlDataAdapter da = new SqlDataAdapter(cmd);
//            DataTable dt = new DataTable();
//            da.Fill(dt);

//            grd.DataSource = dt;
//            grd.DataBind();

//            da.Dispose();

//            GridDecorator.MakeGridViewPrinterFriendly(grd);


//        }
//        catch (Exception ex)
//        {
//            throw (ex);
//        }
//        finally
//        {
//            cnn.Close();
//            cnn.Dispose();
//        }
//    }

//    public override bool Grabar()
//    {
//        bool grabo = false;
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = "adh.proc_UserGrabar";
//            //PARAMS
//            cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50).Value = base.ID;
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = UserLogin;
//            cmd.Parameters.Add("@iniciales", SqlDbType.NVarChar, 50).Value = Iniciales;
//            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = IdPersona;
//            cmd.Parameters.Add("@activo", SqlDbType.Bit).Value = Activo;
//            cmd.Parameters.Add("@mensajes", SqlDbType.Bit).Value = Mensajes;
//            cmd.Parameters.Add("@activar_notificaciones", SqlDbType.Bit).Value = ActivarNotificaciones;
//            //
//            cmd.Parameters.Add("@administrar", SqlDbType.Bit).Value = administrar;
//            cmd.Parameters.Add("@banco_sangre", SqlDbType.Bit).Value = banco_sangre;
//            cmd.Parameters.Add("@hemodialisis", SqlDbType.Bit).Value = hemodialisis;
//            cmd.Parameters.Add("@mensajes2", SqlDbType.Bit).Value = mensajes;
//            cmd.Parameters.Add("@registro", SqlDbType.Bit).Value = registro;
//            cmd.Parameters.Add("@reportes", SqlDbType.Bit).Value = reportes;
//            cmd.Parameters.Add("@id_unidad_salud", SqlDbType.Bit).Value = id_unidad_salud;
//            //
//            cmd.Parameters.Add("@user_login_graba", SqlDbType.NVarChar, 50).Value = base.UserReg;
//            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = RemoteAddr;
//            UserLogin = Convert.ToString(cmd.ExecuteScalar());
//            grabo = true;
//        }
//        catch (Exception ex)
//        {
//            throw (ex);
//        }
//        finally
//        {
//            cnn.Close();
//            cnn.Dispose();
//        }
//        return grabo;
//    }

//    public override bool Login(string pUserLogin, string pUserPassword, string remoteAddr)
//    {
//        bool logged = false;
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = "adh.proc_UserLogin";
//            //PARAMS
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
//            cmd.Parameters.Add("@user_password", SqlDbType.NVarChar, 4000).Value = cripto.Encrypt(pUserPassword);
//            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = remoteAddr;
//            SqlDataReader dr = cmd.ExecuteReader();
//            if (dr.Read())
//            {
//                logged = true;
//            }
//            else
//            {
//                throw (new Exception("Nombre de usuario y contraseña correctos"));
//            }
//            dr.Close();
//            return logged;
//        }
//        catch (Exception ex)
//        {
//            throw (ex);
//        }
//        finally
//        {
//            cnn.Close();
//            cnn.Dispose();
//        }
//    }

//    public new static string ShowMenu(string pUserLogin, string pageName, Page page)
//    {
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        string[] pager = pageName.Split('.');
//        StringBuilder strMenus = new StringBuilder("");
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandText = "adh.proc_UserMenu";
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
//            SqlDataReader dr = cmd.ExecuteReader();

//            if (dr.Read())
//            {
//                //Inicio
//                strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-home {0}\"></i>&nbsp;INICIO</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("default.aspx", page)));

//                //Banco de Sangre
//                if (Convert.ToBoolean(dr["banco_sangre"]))
//                {
//                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-flask\"></i>&nbsp;BANCO DE SANGRE</a></li>", pager[0] == "banco" ? "active" : "", Strings.GetUrl("banco-sangre", page)));
//                }

//                //Hemodialisis
//                if (Convert.ToBoolean(dr["hemodialisis"]))
//                {
//                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-print\"></i>&nbsp;HEMODIÁLISIS</a></li>", pager[0] == "hemodialisis" ? "active" : "", Strings.GetUrl("hemodialisis", page)));
//                }

//                //Mensajes
//                if (Convert.ToBoolean(dr["mensajes"]))
//                {
//                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-envelope\"></i>&nbsp;MENSAJERÍA <sup><span id=\"contador_mensajes\" class=\"counter\" ></span></sup></a></li>", pager[0] == "mensajes" ? "active" : "", Strings.GetUrl("mensajes", page)));
//                }

//                //Registro
//                if (Convert.ToBoolean(dr["registro"]))
//                {
//                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-pencil\"></i>&nbsp;REGISTRO</a></li>", pager[0] == "registro" ? "active" : "", Strings.GetUrl("registro", page)));
//                }

//                //Reportes
//                if (Convert.ToBoolean(dr["reportes"]))
//                {
//                    strMenus.Append(String.Format("<li class=\"{0}\"><a href=\"{1}\"><i class=\"fa fa-file\"></i>&nbsp;REPORTES</a></li>", pager[0] == "reportes" ? "active" : "", Strings.GetUrl("reportes/default.aspx", page)));
//                }

//            }
//            return strMenus.ToString();
//        }
//        catch (Exception ex)
//        {
//            throw ex;
//        }
//        finally
//        {
//            cnn.Close();
//            cnn.Dispose();
//        }
//    }

//    public new static string ShowAdminMenu(string pUserLogin, Page page)
//    {
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        StringBuilder strMenus = new StringBuilder("");
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandText = "select administrar from [adh].[users] where user_login=@user_login";
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
//            SqlDataReader dr = cmd.ExecuteReader();
//            if (dr.Read())
//            {
//                if (Convert.ToBoolean(dr["administrar"]))
//                {
//                    strMenus.Append(String.Format("<a class=\"dropdown-item {0}\" href=\"{1}\"><i class=\"fa fa-gear icon\"></i>Administrar </a>", page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[0] == "sistema" && page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[1] == "admin" ? "active" : "", Strings.GetUrl("admin", page)));
//                }
//            }
//        }
//        catch (Exception ex)
//        {
//            throw ex;
//        }
//        finally
//        {
//            cnn.Close();
//        }
//        return strMenus.ToString();
//    }

//    public void MostrarUnidadesSalud(GridView grd)
//    {
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = "adh.proc_UserUnidadSaludLista";
//            //PARAMS
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = UserLogin;
//            DataTable dt = new DataTable();
//            SqlDataAdapter da = new SqlDataAdapter(cmd);
//            da.Fill(dt);
//            grd.DataSource = dt;
//            grd.DataBind();
//            //
//            GridDecorator.MakeGridViewPrinterFriendly(grd);
//            //
//            da.Dispose();
//        }

//        catch (Exception ex)
//        {
//            throw (ex);
//        }
//        finally
//        {
//            cnn.Close();
//            cnn.Dispose();
//        }
//    }

//    public bool ActivarUnidadesSalud(string userLogin, string datos, string userLoginGraba, string remoteAddr)
//    {
//        bool retorno = false;
//        //Función para el inicio de sesión, regresará false en caso de fallar
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {
//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = "adh.proc_UserUnidadSaludActivar";
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
//            cmd.Parameters.Add("@datos", SqlDbType.NVarChar, -1).Value = datos;
//            cmd.Parameters.Add("@user_login_graba", SqlDbType.NVarChar, 50).Value = userLoginGraba;
//            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = remoteAddr;
//            cmd.ExecuteNonQuery();

//            retorno = true;

//        }
//        catch (Exception ex)
//        {
//            throw (ex);

//        }
//        finally
//        {
//            cnn.Close();
//        }
//        return retorno;
//    }

//    public bool PasswordSetADH(string passwordNew, String user_login, string userReg, string reporteAddr)
//    {
//        //Función para el inicio de sesión, regresará false en caso de fallar
//        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
//        try
//        {

//            cnn.Open();
//            SqlCommand cmd = new SqlCommand();
//            cmd.Connection = cnn;
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.CommandText = "adh.proc_UserSetPassword";
//            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_login;
//            cmd.Parameters.Add("@user_password_new", SqlDbType.NVarChar, -1).Value = cripto.Encrypt(passwordNew);
//            cmd.Parameters.Add("@user_reg", SqlDbType.NVarChar, 50).Value = userReg;
//            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = reporteAddr;
//            cmd.ExecuteNonQuery();
//            cmd.Dispose();

//            return (true);

//        }
//        catch (Exception ex) { throw (ex); }
//        finally { cnn.Close(); }
//    }

//    #endregion
//}
