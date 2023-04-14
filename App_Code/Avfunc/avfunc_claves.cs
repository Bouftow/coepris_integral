using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
using System.Text;
using System.Web.UI;

/// <summary>
/// Descripción breve de Cir_Realizadas
/// </summary>
public class Avfunc_clavesscian
{
    public Avfunc_clavesscian()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    #region Propiedades

    int FOLIO_REGISTRO_DETALLE = 0;
    public int FOLIO_REGISTRO_DETALLE_GS { get { return FOLIO_REGISTRO_DETALLE; } set { FOLIO_REGISTRO_DETALLE = value; } }

    int FOLIO_REGISTRO = 0;
    public int FOLIO_REGISTRO_GS { get { return FOLIO_REGISTRO; } set { FOLIO_REGISTRO = value; } }

    string CLAVE_SCIAN = "";
    public string CLAVE_SCIAN_GS { get { return CLAVE_SCIAN; } set { CLAVE_SCIAN = value; } }

    string DESCRIPCION_SCIAN = "";
    public string DESCRIPCION_SCIAN_GS { get { return DESCRIPCION_SCIAN; } set { DESCRIPCION_SCIAN = value; } }

   

    #endregion

    #region Metodos

    public DataTable CargarGrid_ClavesScian(int id)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        DataTable tabla = new DataTable();
        try
        {
            cnn.Open();
            SqlCommand cmdCargarMascotas = new SqlCommand();
            cmdCargarMascotas.Connection = cnn;
            cmdCargarMascotas.CommandType = CommandType.StoredProcedure;
            cmdCargarMascotas.CommandText = "bitaseg.[proc_RegistroCargarDetalle_clavesscian]";
            cmdCargarMascotas.Parameters.Clear();
            cmdCargarMascotas.Parameters.AddWithValue("@Folio_Registro", id);
           
            //
            SqlDataAdapter da = new SqlDataAdapter(cmdCargarMascotas);
            da.Fill(tabla);
            da.Dispose();
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
        return (tabla);
    }

    public bool Eliminar(int id)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {


            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.[proc_EliminarRegistroDetalle_clavesscian]";
            cmd.Parameters.Add("@folio_registro", SqlDbType.Int).Value = id;

            cmd.ExecuteNonQuery();//graba los datos
            return true;
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); }
    }


    
    //     public bool Grabar_3R()
    //{
        //try
        //{
        //    SqlConnection cnn = new SqlConnection();
        //    cnn.ConnectionString = Principal.CnnStr0;
        //    cnn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Connection = cnn;
        //    cmd.CommandText = "bitaseg.proc_GuardarRegistroDetalle_clavesscian";

        //    cmd.Parameters.Add("@reguser", SqlDbType.VarChar, 20).Value = reguser;
        //    cmd.Parameters.Add("@numerocoordinacion", SqlDbType.Int).Value = numerocoordinacion;

        //    cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
        //    cmd.Parameters.Add("@id_statos", SqlDbType.Int).Value = statos;
        //    cmd.Parameters.Add("@requerimientos", SqlDbType.NVarChar, -1).Value = requerimientos;//requerimientos en cadena de texto
        //    cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
        //    cmd.Parameters.Add("@fecha_lim", SqlDbType.DateTime).Value = fecha_lim;
        //    cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = 0;
        //    cmd.Parameters.Add("@id_establecimiento", SqlDbType.Int).Value = 0;
        //    cmd.Parameters.Add("@id_responsable", SqlDbType.Int).Value = 0;
        //    cmd.Parameters.Add("@curp", SqlDbType.NVarChar, 18).Value = curp;
        //    cmd.Parameters.Add("@rfc_prop", SqlDbType.NVarChar, -1).Value = rfc_prop;
        //    cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
        //    cmd.Parameters.Add("@apellidop", SqlDbType.NVarChar, 50).Value = apellidop;
        //    cmd.Parameters.Add("@apellidom", SqlDbType.NVarChar, 50).Value = apellidom;
        //    cmd.Parameters.Add("@telfij", SqlDbType.NVarChar, 50).Value = telfij;
        //    cmd.Parameters.Add("@telmov", SqlDbType.NVarChar, 50).Value = telmov;
        //    cmd.Parameters.Add("@correo", SqlDbType.NVarChar, 50).Value = correo;
        //    cmd.Parameters.Add("@fecha_reg_per", SqlDbType.DateTime).Value = fecha_reg_per;
        //    cmd.Parameters.Add("@fecha_act_status", SqlDbType.DateTime).Value = fecha_act_status;
        //    cmd.Parameters.Add("@rfc", SqlDbType.NVarChar, 50).Value = rfc;
        //    cmd.Parameters.Add("@razonsocial", SqlDbType.NVarChar, -1).Value = razonsocial;
        //    cmd.Parameters.Add("@nombreest", SqlDbType.NVarChar, -1).Value = nombreest;
        //    cmd.Parameters.Add("@municipio", SqlDbType.NVarChar, -1).Value = municipio;
        //    cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, -1).Value = colonia;
        //    cmd.Parameters.Add("@calle", SqlDbType.NVarChar, -1).Value = calle;
        //    cmd.Parameters.Add("@fecha_reg_est", SqlDbType.DateTime).Value = fecha_reg_est;
        //    cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id_tramite;
        //    cmd.Parameters.Add("@riesgo", SqlDbType.Int).Value = riesgo;
        //    cmd.Parameters.Add("@verificacion", SqlDbType.Int).Value = verificacion;
        //    cmd.Parameters.Add("@modalidad", SqlDbType.Int).Value = modalidad;
        //    cmd.Parameters.Add("@categoria", SqlDbType.Int).Value = categoria;
        //    cmd.Parameters.Add("@rui", SqlDbType.NVarChar).Value = rui;
        //    cmd.Parameters.Add("@certificado_anterior", SqlDbType.NVarChar, 50).Value = certificado_anterior;
        //    cmd.Parameters.Add("@observaciones", SqlDbType.NVarChar, -1).Value = observaciones;
        //    cmd.Parameters.Add("@numero", SqlDbType.NVarChar, -1).Value = numero;

        //    cmd.Parameters.Add("@localidad", SqlDbType.NVarChar, 50).Value = localidad;
        //    cmd.Parameters.Add("@cp", SqlDbType.NVarChar, 50).Value = cp;
        //    cmd.Parameters.Add("@correoest", SqlDbType.NVarChar, 50).Value = correoest;
        //    cmd.Parameters.Add("@telest", SqlDbType.NVarChar, 50).Value = telest;
        //    //cmd.Parameters.Add("@giro", SqlDbType.NVarChar, 50).Value = giro;
        //    cmd.Parameters.Add("@referencias", SqlDbType.NVarChar, -1).Value = referencias;

        //    cmd.Parameters.Add("@est_dias_laborales", SqlDbType.NVarChar).Value = est_dias_laborales;
        //    cmd.Parameters.Add("@hest1", SqlDbType.NVarChar).Value = hest1;
        //    cmd.Parameters.Add("@hest2", SqlDbType.NVarChar).Value = hest2;

        //    cmd.Parameters.Add("@rnombre", SqlDbType.NVarChar, 50).Value = rnombre;
        //    cmd.Parameters.Add("@rapellidom", SqlDbType.NVarChar, 50).Value = rapellidom;
        //    cmd.Parameters.Add("@rapellidop", SqlDbType.NVarChar, 50).Value = rapellidop;
        //    cmd.Parameters.Add("@rgrado", SqlDbType.NVarChar, 50).Value = rgrado;
        //    cmd.Parameters.Add("@rcedula", SqlDbType.NVarChar, 50).Value = rcedula;
        //    //cmd.Parameters.Add("@horario", SqlDbType.NVarChar, 50).Value = horario;
        //    cmd.Parameters.Add("@fecha_reg_resp", SqlDbType.DateTime).Value = fecha_reg_resp;

        //    cmd.Parameters.Add("@r_dias_laborales", SqlDbType.NVarChar).Value = r_dias_laborales;
        //    cmd.Parameters.Add("@hr1", SqlDbType.NVarChar).Value = hr1;
        //    cmd.Parameters.Add("@hr2", SqlDbType.NVarChar).Value = hr2;
        //    cmd.Parameters.Add("@rfcr", SqlDbType.NVarChar).Value = rfc_r;


        //    cmd.Parameters.Add("@sollicsan", SqlDbType.Bit).Value = sollicsan;
        //    cmd.Parameters.Add("@solicitud", SqlDbType.Bit).Value = solicitud;
        //    cmd.Parameters.Add("@titulo", SqlDbType.Bit).Value = titulo;
        //    cmd.Parameters.Add("@cedula", SqlDbType.Bit).Value = cedula;
        //    cmd.Parameters.Add("@diploma", SqlDbType.Bit).Value = diploma;
        //    cmd.Parameters.Add("@curriculum", SqlDbType.Bit).Value = curriculum;
        //    cmd.Parameters.Add("@fotografias", SqlDbType.Bit).Value = fotografias;
        //    cmd.Parameters.Add("@pagoresponsable", SqlDbType.Bit).Value = pagoresponsable;
        //    cmd.Parameters.Add("@altasat", SqlDbType.Bit).Value = altasat;
        //    cmd.Parameters.Add("@planomemoria", SqlDbType.Bit).Value = planomemoria;
        //    cmd.Parameters.Add("@relacionmaterial", SqlDbType.Bit).Value = relacionmaterial;
        //    cmd.Parameters.Add("@pago", SqlDbType.Bit).Value = pago;
        //    cmd.Parameters.Add("@programaact", SqlDbType.Bit).Value = programaact;
        //    cmd.Parameters.Add("@fotocopiaconvenio", SqlDbType.Bit).Value = fotocopiaconvenio;
        //    cmd.Parameters.Add("@libroregistro", SqlDbType.Bit).Value = libroregistro;
        //    cmd.Parameters.Add("@descripciontecnicaembal", SqlDbType.Bit).Value = descripciontecnicaembal;
        //    cmd.Parameters.Add("@tarjetadecontrol", SqlDbType.Bit).Value = tarjetadecontrol;
        //    cmd.Parameters.Add("@cartaconsentimiento", SqlDbType.Bit).Value = cartaconsentimiento;
        //    cmd.Parameters.Add("@actaconstitutiva", SqlDbType.Bit).Value = actaconstitutiva;
        //    cmd.Parameters.Add("@reglamentointerno", SqlDbType.Bit).Value = reglamentointerno;
        //    cmd.Parameters.Add("@vistoproteccioncivil", SqlDbType.Bit).Value = vistoproteccioncivil;
        //    cmd.Parameters.Add("@relacionpersonal", SqlDbType.Bit).Value = relacionpersonal;
        //    cmd.Parameters.Add("@autorizaciondif", SqlDbType.Bit).Value = autorizaciondif;
        //    cmd.Parameters.Add("@cedulaautoevaluacion", SqlDbType.Bit).Value = cedulaautoevaluacion;
        //    cmd.Parameters.Add("@papelmembretado", SqlDbType.Bit).Value = papelmembretado;
        //    cmd.Parameters.Add("@autorizacionset", SqlDbType.Bit).Value = autorizacionset;
        //    cmd.Parameters.Add("@usodesuelo", SqlDbType.Bit).Value = usodesuelo;
        //    cmd.Parameters.Add("@procesolimpieza", SqlDbType.Bit).Value = procesolimpieza;
        //    cmd.Parameters.Add("@relaciontipoanalisis", SqlDbType.Bit).Value = relaciontipoanalisis;
        //    cmd.Parameters.Add("@actaverificacion", SqlDbType.Bit).Value = actaverificacion;
        //    cmd.Parameters.Add("@avisofunc", SqlDbType.Bit).Value = avisofunc;

        //    cmd.Parameters.Add("@doctecatmedhosp", SqlDbType.Bit).Value = doctecatmedhosp;
        //    cmd.Parameters.Add("@programamedico", SqlDbType.Bit).Value = programamedico;
        //    cmd.Parameters.Add("@caracteristicasmecanicas", SqlDbType.Bit).Value = caracteristicasmecanicas;
        //    cmd.Parameters.Add("@fotografiasdeunidad", SqlDbType.Bit).Value = fotografiasdeunidad;
        //    cmd.Parameters.Add("@licenciasanitariaanterior", SqlDbType.Bit).Value = licenciasanitariaanterior;
        //    cmd.Parameters.Add("@autorizacionresponsableanterior", SqlDbType.Bit).Value = autorizacionresponsableanterior;
        //    cmd.Parameters.Add("@antecedentesnopenales", SqlDbType.Bit).Value = antecedentesnopenales;
        //    cmd.Parameters.Add("@polizaseguro", SqlDbType.Bit).Value = polizaseguro;
        //    cmd.Parameters.Add("@programaalimentacion", SqlDbType.Bit).Value = programaalimentacion;


        //    cmd.Parameters.Add("@titulo_MR", SqlDbType.Bit).Value = titulo_MR;
        //    cmd.Parameters.Add("@cedula_MR", SqlDbType.Bit).Value = cedula_MR;
        //    cmd.Parameters.Add("@diploma_MR", SqlDbType.Bit).Value = diploma_MR;
        //    cmd.Parameters.Add("@curriculum_MR", SqlDbType.Bit).Value = curriculum_MR;
        //    cmd.Parameters.Add("@relacionpersonal_paramedico", SqlDbType.Bit).Value = relacionpersonal_paramedico;
        //    cmd.Parameters.Add("@documentacion_laboratorio", SqlDbType.Bit).Value = documentacion_laboratorio;
        //    cmd.Parameters.Add("@copialicencia_matriz", SqlDbType.Bit).Value = copialicencia_matriz;
        //    cmd.Parameters.Add("@copiaautorizacion_matriz", SqlDbType.Bit).Value = copiaautorizacion_matriz;
        //    cmd.Parameters.Add("@documentacion_tecnico", SqlDbType.Bit).Value = documentacion_tecnico;
        //    cmd.Parameters.Add("@documentacion_responsable", SqlDbType.Bit).Value = documentacion_responsable;
        //    cmd.Parameters.Add("@formalimpieza", SqlDbType.Bit).Value = formalimpieza;


        //    cmd.ExecuteNonQuery();
        //    cnn.Close();
        //    return true;
        //}
        //catch (Exception Ex)
        //{

        //    throw Ex;
        //}
    //}

    #endregion

}