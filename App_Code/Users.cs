using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
/// <summary>
/// Descripción breve de Users
/// </summary>
public class Users : Personas
{
    public Users()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public Users(string userLogin)
    {
        try { id = userLogin; Cargar(); }
        catch (Exception ex) { throw ex; }
    }
    EncryptDecrypt cripto = new EncryptDecrypt();

    #region Propiedades
    string id = "0";
    string user_login = "0";
    string user_password = "";
    int id_persona = 0;
    bool activo = true;
    bool administrar = false;
    bool activar_notificaciones = true;
    bool mensajes = true;


    public int Id_Persona { get { return id_persona; } set { id_persona = value; } }
    public string ID { get { return id; } set { id = value; } }
    public string UserLogin { get { return user_login; } set { user_login = value; } }
    public string UserPassword { get { return user_password; } set { user_password = value; } }
    public bool Activo { get { return activo; } set { activo = value; } }
    public bool Administrar { get { return administrar; } set { administrar = value; } }
    public bool ActivarNotificaciones { get { return activar_notificaciones; } set { activar_notificaciones = value; } }
    public bool Mensajes { get { return mensajes; } set { mensajes = value; } }


    string iniciales = "";

    public string Iniciales { get { return iniciales; } set { iniciales = value; } }


    #endregion
    #region Metodos

    public virtual void Cargar()
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
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = id;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                user_login = dr["user_login"].ToString();
                iniciales = dr["iniciales"].ToString();
                //Datos persona
                base.Cargar(Convert.ToInt32(dr["id_persona"]));
              
            }
            dr.Close();

        }

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }
    public virtual bool Login(string pUserLogin, string pUserPassword, string remoteAddr)
    {
        bool logged ;
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

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }
    public bool ChangePassword(string passwordOld, string passwordNew, string reporteAddr)
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
                CommandText = "bitaseg.proc_UserChangePassword"
            };
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_login;
            cmd.Parameters.Add("@user_password_old", SqlDbType.NVarChar, 4000).Value = cripto.Encrypt(passwordOld);
            cmd.Parameters.Add("@user_password_new", SqlDbType.NVarChar, 4000).Value = cripto.Encrypt(passwordNew);
            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = reporteAddr;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            return (true);

        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); }
    }
    public bool PasswordSet(string passwordNew, string userReg, string reporteAddr)
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
  
    public static string ShowMenu(string pUserLogin, string pageName, Page page)
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
                //Inicio
                strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\" name=\"anc_default\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("default.aspx", page)));

            }
            else
            {
                strMenus.Append(String.Format("<li class=\"{0}\"><a id='anchorfocus' href=\"{1}\" name=\"anc_default\"><i class=\"fa fa-home {0}\"></i>&nbsp;Inicio</a></li>", pager[0] == "default" ? "active" : "", Strings.GetUrl("inicio.aspx", page)));


            }
            return strMenus.ToString();
        }
        catch (Exception ex) { throw ex; }
        finally { cnn.Close(); }
    }
    public void Lista(string nombreBuscar, string userLogin,string Sistema, GridView grd)
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

            GridDecorator.MakeGridViewPrinterFriendly(grd);


        }

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    public static string ShowAdminMenu(string pUserLogin, Page page)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        StringBuilder strMenus = new StringBuilder("");
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = cnn,
                CommandText = "select administrar,administrar_distintivo from bitaseg.users where user_login=@user_login"
            };
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                if (Convert.ToBoolean(dr["administrar"]))
                {
                    strMenus.Append(String.Format("<a class=\"dropdown-item {0}\" href=\"{1}\"><i class=\"fa fa-gear icon\"></i>Administrar </a>", page.ToString().Replace("ASP.", "").Replace("_", ".").Split('.')[0] == "admin" ? "active" : "", Strings.GetUrl("admin", page)));
                }




            }
            return strMenus.ToString();
        }
        catch (Exception ex) { throw ex; }
        finally { cnn.Close(); }
    }
    //public bool ValidarUsuario(string userLogin)
    //{
    //    int RowCount = 0;
    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    try
    //    {
    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cnn;
    //        cmd.CommandText = "select count(*) as conteo from users where user_login =@user_login and activo=1";
    //        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
    //        RowCount = Convert.ToInt32(cmd.ExecuteScalar());

    //        return RowCount == 0 ? false : true;
    //    }
    //    catch (Exception ex) { throw ex; }
    //    finally { cnn.Close(); }
    //}
    //public bool ValidarUsuaios(string listaUsuarios)
    //{
    //    try
    //    {
    //        string[] usuarios = listaUsuarios.Trim().TrimEnd(',').Split(',');
    //        foreach (string u in usuarios)
    //        {
    //            if (!ValidarUsuario(u.Trim())) { throw new Exception(String.Format("El usuario '{0}' no existe", u)); }
    //        }
    //        return true;
    //    }
    //    catch (Exception ex) { throw ex; }
    //}

    //public bool EstablecerEMail(string pUserLogin, string eMail, string reporteAddr)
    //{
    //    //Función para el inicio de sesión, regresará false en caso de fallar
    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    try
    //    {

    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cnn;
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.CommandText = "proc_UserEstablecerEMail";
    //        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
    //        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = eMail;
    //        cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = reporteAddr;
    //        cmd.ExecuteNonQuery();
    //        cmd.Dispose();

    //        return (true);

    //    }
    //    catch (Exception ex) { throw (ex); }
    //    finally { cnn.Close(); }
    //}
    //public bool ConfirmarMail(string pUserLogin, string eMail, string reporteAddr)
    //{
    //    //Función para el inicio de sesión, regresará false en caso de fallar
    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    try
    //    {

    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cnn;
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.CommandText = "proc_UserConfirmarEMail";
    //        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = pUserLogin;
    //        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = eMail;
    //        cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = reporteAddr;
    //        cmd.ExecuteNonQuery();
    //        cmd.Dispose();

    //        return (true);

    //    }
    //    catch (Exception ex) { throw (ex); }
    //    finally { cnn.Close(); }
    //}
    //public override bool Grabar()
    //{
    //    SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
    //    try
    //    {
    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cnn;
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.CommandText = "proc_UserGrabar";
    //        //PARAMS
    //        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50).Value = id;
    //        cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_login;
    //        cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = IdPersona;



    //        cmd.Parameters.Add("@user_login_graba", SqlDbType.NVarChar, 50).Value = base.UserReg;
    //        cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = RemoteAddr;
    //        user_login = Convert.ToString(cmd.ExecuteScalar());
    //        return true;
    //    }

    //    catch (Exception ex) { throw (ex); }
    //    finally { cnn.Close(); cnn.Dispose(); }
    //}
    #endregion

    public virtual void DatosDeRegistro(string user_login)
    {

        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
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
                id_persona = Convert.ToInt32(dr["id_persona"]);
                base.Cargar(Convert.ToInt32(dr["id_persona"]));
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
   
}