using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
/// <summary>
/// Descripción breve de Personas
/// </summary>
public class Personas
{
    #region Constructores
    public Personas() { }
    public Personas(int idPersona) { try { id_persona = idPersona; Cargar(); } catch (Exception ex) { throw ex; } }
    public Personas(string curpPersona) { try { curp = curpPersona; BuscarPorCURP(); } catch (Exception ex) { throw ex; } }
    #endregion

    #region Propiedades
    int id_persona = 0;
    public int IdPersona { get { return id_persona; } set { id_persona = value; } }
    string curp = "";
    public string CURP { get { return curp; } set { curp = value; } }
    string ine = "";
    public string INE { get { return ine; } set { ine = value; } }
    string rfc = "";
    public string RFC { get { return rfc; } set { rfc = value; } }
    string prefijo = "";
    public string Prefijo { get { return prefijo; } set { prefijo = value; } }
    string paterno = "";
    public string Paterno { get { return paterno; } set { paterno = value; } }
    string materno = "";
    public string Materno { get { return materno; } set { materno = value; } }
    string nombre = "";
    public string Nombre { get { return nombre; } set { nombre = value; } }
    string nombre_completo = "";
    public string NombreCompleto { get { return nombre_completo; } set { nombre_completo = value; } }
    string mostrar = "";
    public string NombreCorto { get { return mostrar; } set { mostrar = value; } }

    DateTime fecha_nac = new DateTime(1900, 1, 1);
    public DateTime FechaNac { get { return fecha_nac; } set { fecha_nac = value; } }
    string email = "";
    public string Email { get { return email; } set { email = value; } }
    string foto = "";
    public string Foto { get { return foto; } set { foto = value; } }
    string foto_tmb = "";
    public string FotoTmb { get { return foto_tmb; } set { foto_tmb = value; } }
    string lugar_nac = "";
    public string LugarNac { get { return lugar_nac; } set { lugar_nac = value; } }
    string estado_nac = "";
    public string EstadoNac { get { return estado_nac; } set { estado_nac = value; } }
    string telefono = "";
    public string Telefono { get { return telefono; } set { telefono = value; } }
    string telefono_cel = "";
    public string TelefonoCel { get { return telefono_cel; } set { telefono_cel = value; } }
    string calle = "";
    public string Calle { get { return calle; } set { calle = value; } }
    string referencia = "";
    public string Referencia { get { return referencia; } set { referencia = value; } }
    string num_ext = "";
    public string NumExt { get { return num_ext; } set { num_ext = value; } }
    string num_int = "";
    public string NumInt { get { return num_int; } set { num_int = value; } }
    string colonia = "";
    public string Colonia { get { return colonia; } set { colonia = value; } }
    string cp = "";
    public string CP { get { return cp; } set { cp = value; } }
    int id_estado = 0;
    public int IdEstado { get { return id_estado; } set { id_estado = value; } }
    int id_mun = 0;
    public int IdMun { get { return id_mun; } set { id_mun = value; } }
    string localidad = "";

    string sexo = "";
    public string Sexo { get { return sexo; } set { sexo = value; } }

    public string Localidad { get { return localidad; } set { localidad = value; } }
    string user_reg = "";
    public string UserReg { get { return user_reg; } set { user_reg = value; } }
    string remote_addr = "";
    public string RemoteAddr { get { return remote_addr; } set { remote_addr = value; } }
    DateTime fecha_reg = DateTime.Now;
    public DateTime FechaReg { get { return fecha_reg; } set { fecha_reg = value; } }
    #endregion

    #region Métodos
    public void Cargar(int idPersona)
    {
        try
        {
            id_persona = idPersona;
            Cargar();
        }
        catch (Exception ex) { throw ex; }
    }
    private void Cargar()
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"bitaseg.proc_PersonaBuscarId";
            //PARAMS
            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = id_persona;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                mostrar = dr["mostrar"].ToString();
                nombre_completo = dr["nombre_completo"].ToString();
                id_persona = Convert.ToInt32(dr["id_persona"]);
                curp = dr["curp"].ToString();
                ine = dr["ine"].ToString();
                rfc = dr["rfc"].ToString();
                prefijo = dr["prefijo"].ToString();
                nombre = dr["nombre"].ToString();
                paterno = dr["paterno"].ToString();
                materno = dr["materno"].ToString();
                email = dr["email"].ToString();
                fecha_nac = Convert.ToDateTime(dr["fecha_nac"]);
                foto = dr["foto"].ToString();
                foto_tmb = dr["foto_tmb"].ToString();
                lugar_nac = dr["lugar_nac"].ToString();
                estado_nac = dr["estado_nac"].ToString();
                telefono = dr["telefono"].ToString();
                telefono_cel = dr["telefono_cel"].ToString();
                calle = dr["calle"].ToString();
                referencia = dr["referencia"].ToString();
                num_ext = dr["num_ext"].ToString();
                num_int = dr["num_int"].ToString();
                colonia = dr["colonia"].ToString();
                cp = dr["cp"].ToString();
                id_estado = dr["id_estado"] == DBNull.Value ? 0 : Convert.ToInt32(dr["id_estado"]);
                id_mun = dr["id_mun"] == DBNull.Value ? 0 : Convert.ToInt32(dr["id_mun"]);
                localidad = dr["localidad"].ToString();
                sexo = dr["sexo"].ToString();
                fecha_reg = Convert.ToDateTime(dr["fecha_reg"]);
                user_reg = dr["user_login"].ToString();
            }
            dr.Close();
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    private void BuscarPorCURP(string curpPersona) { try { curp = curpPersona; BuscarPorCURP(); } catch (Exception ex) { throw ex; } }
    private void BuscarPorCURP()
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = @"proc_PersonaBuscarCURP";
            //PARAMS
            cmd.Parameters.Add("@curp", SqlDbType.NVarChar, 18).Value = curp;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id_persona = Convert.ToInt32(dr["id_persona"]);
                curp = dr["curp"].ToString();
                ine = dr["ine"].ToString();
                rfc = dr["rfc"].ToString();
                prefijo = dr["prefijo"].ToString();
                nombre = dr["nombre"].ToString();
                paterno = dr["paterno"].ToString();
                materno = dr["materno"].ToString();
                email = dr["email"].ToString();
                fecha_nac = Convert.ToDateTime(dr["fecha_nac"]);
                foto = dr["foto"].ToString();
                foto_tmb = dr["foto_tmb"].ToString();
                lugar_nac = dr["lugar_nac"].ToString();
                estado_nac = dr["estado_nac"].ToString();
                telefono = dr["telefono"].ToString();
                telefono_cel = dr["telefono_cel"].ToString();
                calle = dr["calle"].ToString();
                referencia = dr["referencia"].ToString();
                num_ext = dr["num_ext"].ToString();
                num_int = dr["num_int"].ToString();
                colonia = dr["colonia"].ToString();
                cp = dr["cp"].ToString();
                id_estado = dr["id_estado"] == DBNull.Value ? 0 : Convert.ToInt32(dr["id_estado"]);
                id_mun = dr["id_mun"] == DBNull.Value ? 0 : Convert.ToInt32(dr["id_mun"]);
                localidad = dr["localidad"].ToString();
                sexo = dr["sexo"].ToString();
                fecha_reg = Convert.ToDateTime(dr["fecha_reg"]);
                user_reg = dr["user_login"].ToString();
            }
            dr.Close();
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }
    public string BuscarCURPJSon(string CURP, string userLogin)
    {
        string json = "";
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_PersonaBuscarCURP";
            cmd.Parameters.Add("@CURP", SqlDbType.NVarChar, 50).Value = CURP;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                json = String.Format("{{ \"IdPersona\" : {0}, \"Nombre\" : \"{1}\", \"Paterno\" : \"{2}\", \"Materno\" : \"{3}\", \"Idestado\" : {4}, \"Idmun\" : {5}, \"Localidad\" : \"{6}\", \"Calle\" : \"{7}\", \"Referencia\" : \"{8}\", \"NumExt\" : \"{9}\", \"NumInt\" : \"{10}\", \"Colonia\" : \"{11}\", \"CodPostal\" : \"{12}\", \"Telefono\" : \"{13}\", \"Celular\" : \"{14}\", \"RFC\" : \"{15}\", \"Mail\" : \"{16}\", \"sexo\":\"{17}\" }}",
                    dr["id_persona"], dr["nombre"], dr["paterno"], dr["materno"], dr["id_estado"], dr["id_mun"], dr["localidad"], dr["calle"], dr["referencia"], dr["num_ext"], dr["num_int"], dr["colonia"], dr["cp"], dr["telefono"], dr["telefono_cel"], dr["rfc"], dr["email"], dr["sexo"]);
            }
            return json;
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    public virtual bool Grabar()
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_PersonaGrabar";
            //PARAMS
            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = id_persona;
            cmd.Parameters.Add("@rfc", SqlDbType.NVarChar, 20).Value = rfc;
            cmd.Parameters.Add("@prefijo", SqlDbType.NVarChar, 10).Value = prefijo;
            cmd.Parameters.Add("@paterno", SqlDbType.NVarChar, 50).Value = paterno;
            cmd.Parameters.Add("@materno", SqlDbType.NVarChar, 50).Value = materno;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = user_reg;
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
            cmd.Parameters.Add("@fecha_nac", SqlDbType.DateTime).Value = fecha_nac;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
            cmd.Parameters.Add("@curp", SqlDbType.NVarChar, 18).Value = curp;
            cmd.Parameters.Add("@ine", SqlDbType.NVarChar, 50).Value = ine;
            cmd.Parameters.Add("@lugar_nac", SqlDbType.NVarChar, 255).Value = lugar_nac;
            cmd.Parameters.Add("@estado_nac", SqlDbType.NVarChar, 255).Value = estado_nac;
            cmd.Parameters.Add("@telefono", SqlDbType.NVarChar, 15).Value = telefono;
            cmd.Parameters.Add("@telefono_cel", SqlDbType.NVarChar, 20).Value = telefono_cel;
            cmd.Parameters.Add("@calle", SqlDbType.NVarChar, 255).Value = calle;
            cmd.Parameters.Add("@referencia", SqlDbType.NVarChar, 255).Value = referencia;
            cmd.Parameters.Add("@num_ext", SqlDbType.NVarChar, 10).Value = num_ext;
            cmd.Parameters.Add("@num_int", SqlDbType.NVarChar, 10).Value = num_int;
            cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, 150).Value = colonia;
            cmd.Parameters.Add("@cp", SqlDbType.NVarChar, 5).Value = cp;
            cmd.Parameters.Add("@id_estado", SqlDbType.SmallInt).Value = id_estado;
            cmd.Parameters.Add("@id_mun", SqlDbType.SmallInt).Value = id_mun;
            cmd.Parameters.Add("@localidad", SqlDbType.NVarChar, 150).Value = localidad;
            cmd.Parameters.Add("@sexo", SqlDbType.NVarChar, 1).Value = sexo;
            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = remote_addr;
            id_persona = Convert.ToInt32(cmd.ExecuteScalar());
            return true;
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    public virtual bool GrabarFoto(string nombreArchivo, string userLogin, string remoteAddr)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "proc_PersonaGrabarFoto";
            //PARAMS
            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = id_persona;
            cmd.Parameters.Add("@foto", SqlDbType.NVarChar, 150).Value = nombreArchivo;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
            cmd.Parameters.Add("@remote_addr", SqlDbType.NVarChar, 50).Value = remoteAddr;

            id_persona = Convert.ToInt32(cmd.ExecuteScalar());
            return true;
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    public virtual void Buscar(string textoBuscar, string userLogin, GridView grd)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_PersonaBuscar";
            cmd.Parameters.Add("@texto_buscar", SqlDbType.NVarChar, 50).Value = textoBuscar;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = userLogin;
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
    #endregion

}