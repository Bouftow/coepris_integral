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
/// Descripción breve de Avisos
/// </summary>
public class Avisos
{
    public Avisos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public Avisos(int prmId)
    {
        try
        {
            id_aviso = prmId;
            Mostrar();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }

    }
    #region Variables

    int id_aviso = 0;

    string P1_homoclave = "";
    string P1_nombre = "";
    string P1_modalidad = "";

    string P2_RFC_empresa = "";
    string P2_razon_social = "";

    string P2_RFC = "";
    string P2_CURP = "";
    string P2_Nombre = "";
    string P2_primer_apellido = "";
    string P2_segundo_apellido= "";
    string P2_lada= "";
    string P2_telefono= "";
    string P2_extension= "";
    string P2_correo= "";

    string P3_RFC = "";
    string P3_RazonSocial = "";

    string P3_CP = "";
    string P3_nombre_vialidad = "";
    string P3_numext = "";
    string P3_numint = "";
    string P3_colonia = "";
    string P3_localidad = "";
    string P3_municipio = "";
    string P3_estado = "";
    string P3_entre1 = "";
    string P3_entre2 = "";
    string P3_vialidad_posterior = "";
    string P3_lada = "";
    string P3_telefono = "";
    string P3_extension = "";

    bool tipo_persona = false;

    string folio = "";
    string reg_user = "";
    int numero_coordinacion = 0;
    DateTime fecha_reg = DateTime.Now;

   
    #endregion

    #region Propiedades

    public int IDestablecimiento { get { return id_aviso; } set { id_aviso = value; } }
    public string P1homoclave { get { return P1_homoclave; } set { P1_homoclave = value; } }
    public string P1nombre { get { return P1_nombre; } set { P1_nombre = value; } }
    public string P1modalidad { get { return P1_modalidad; } set { P1_modalidad = value; } }
    public string P2RFCEmpresa { get { return P2_RFC_empresa; } set { P2_RFC_empresa = value; } }
    public string P2razonsocial { get { return P2_razon_social; } set { P2_razon_social = value; } }
    public string P2RFC { get { return P2_RFC; } set { P2_RFC = value; } }
    public string P2CURP { get { return P2_CURP; } set { P2_CURP = value; } }
    public string P2Nombre { get { return P2_Nombre; } set { P2_Nombre = value; } }
    public string P2primerapellido { get { return P2_primer_apellido; } set { P2_primer_apellido = value; } }
    public string P2segundoapellido { get { return P2_segundo_apellido; } set { P2_segundo_apellido = value; } }
    public string P2lada { get { return P2_lada; } set { P2_lada = value; } }
    public string P2telefono { get { return P2_telefono; } set { P2_telefono = value; } }
    public string P2extension { get { return P2_extension; } set { P2_extension = value; } }
    public string P2correo { get { return P2_correo; } set { P2_correo = value; } }
    public string P3RFC { get { return P3_RFC; } set { P3_RFC = value; } }
    public string P3RazonSocial { get { return P3_RazonSocial; } set { P3_RazonSocial = value; } }
    public string P3CP { get { return P3_CP; } set { P3_CP = value; } }
    public string P3nombrevialidad { get { return P3_nombre_vialidad; } set { P3_nombre_vialidad = value; } }
    public string P3numext { get { return P3_numext; } set { P3_numext = value; } }
    public string P3numint { get { return P3_numint; } set { P3_numint = value; } }
    public string P3colonia { get { return P3_colonia; } set { P3_colonia = value; } }
    public string P3localidad { get { return P3_localidad; } set { P3_localidad = value; } }
    public string P3municipio { get { return P3_municipio; } set { P3_municipio = value; } }
    public string P3estado { get { return P3_estado; } set { P3_estado = value; } }
    public string P3entre1 { get { return P3_entre1; } set { P3_entre1 = value; } }
    public string P3entre2 { get { return P3_entre2; } set { P3_entre2 = value; } }
    public string P3vialidadposterior { get { return P3_vialidad_posterior; } set { P3_vialidad_posterior = value; } }
    public string P3lada { get { return P3_lada; } set { P3_lada = value; } }
    public string P3telefono { get { return P3_telefono; } set { P3_telefono = value; } }
    public string P3extension { get { return P3_extension; } set { P3_extension = value; } }
    

    public bool TipoPersona { get { return tipo_persona; } set { tipo_persona = value; } }



    public string Folio { get { return folio; } set { folio = value; } }
    public string RegUser { get { return reg_user; } set { reg_user = value; } }
    public int NumeroCoordinacion { get { return numero_coordinacion; } set { numero_coordinacion = value; } }
    public DateTime FechaReg { get { return fecha_reg; } set { fecha_reg = value; } }

   


    #endregion

    #region Métodos
    
    private void Mostrar()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bitaseg.AvFunc where id_aviso=@id_aviso";
            cmd.Parameters.Add("@id_aviso", SqlDbType.Int).Value = id_aviso;
            cmd.Connection = cnn;


            SqlDataReader drp = cmd.ExecuteReader();
            if (drp.Read())
            {
              

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
    public string[] Grabar_Aviso()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_AvFunc_Guardar";
           
            
            cmd.Parameters.Add("@P1_homoclave", SqlDbType.NVarChar, -1).Value = P1_homoclave;
            cmd.Parameters.Add("@P1_nombre", SqlDbType.NVarChar, -1).Value = P1_nombre;
            cmd.Parameters.Add("@P1_modalidad", SqlDbType.NVarChar, -1).Value = P1_modalidad;

            cmd.Parameters.Add("@P2_RFC_empresa", SqlDbType.NVarChar, -1).Value = P2_RFC_empresa;
            cmd.Parameters.Add("@P2_razon_social", SqlDbType.NVarChar, -1).Value = P2_razon_social;
            cmd.Parameters.Add("@P2_RFC", SqlDbType.NVarChar, -1).Value = P2_RFC;
            cmd.Parameters.Add("@P2_CURP", SqlDbType.NVarChar, -1).Value = P2_CURP;
            cmd.Parameters.Add("@P2_Nombre", SqlDbType.NVarChar, -1).Value = P2_Nombre;
            cmd.Parameters.Add("@P2_primer_apellido", SqlDbType.NVarChar, -1).Value = P2_primer_apellido;
            cmd.Parameters.Add("@P2_segundo_apellido", SqlDbType.NVarChar, -1).Value = P2_segundo_apellido;
            cmd.Parameters.Add("@P2_lada", SqlDbType.NVarChar, -1).Value = P2_lada;
            cmd.Parameters.Add("@P2_telefono", SqlDbType.NVarChar, -1).Value = P2_telefono;
            cmd.Parameters.Add("@P2_extension", SqlDbType.NVarChar, -1).Value = P2_extension;
            cmd.Parameters.Add("@P2_correo", SqlDbType.NVarChar, -1).Value = P2_correo;

            cmd.Parameters.Add("@P3_RFC", SqlDbType.NVarChar, -1).Value = P3_RFC;
            cmd.Parameters.Add("@P3_RazonSocial", SqlDbType.NVarChar, -1).Value = P3_RazonSocial;

            cmd.Parameters.Add("@P3_CP", SqlDbType.NVarChar, -1).Value = P3_CP;
            cmd.Parameters.Add("@P3_nombre_vialidad", SqlDbType.NVarChar, -1).Value = P3_nombre_vialidad;
            cmd.Parameters.Add("@P3_numext", SqlDbType.NVarChar, -1).Value = P3_numext;
            cmd.Parameters.Add("@P3_numint", SqlDbType.NVarChar, -1).Value = P3_numint;
            cmd.Parameters.Add("@P3_colonia", SqlDbType.NVarChar, -1).Value = P3_colonia;
            cmd.Parameters.Add("@P3_localidad", SqlDbType.NVarChar, -1).Value = P3_localidad;
            cmd.Parameters.Add("@P3_municipio", SqlDbType.NVarChar, -1).Value = P3_municipio;
            cmd.Parameters.Add("@P3_estado", SqlDbType.NVarChar, -1).Value = P3_estado;
            cmd.Parameters.Add("@P3_entre1", SqlDbType.NVarChar, -1).Value = P3entre1;
            cmd.Parameters.Add("@P3_entre2", SqlDbType.NVarChar, -1).Value = P3entre2;
            cmd.Parameters.Add("@P3_vialidad_posterior", SqlDbType.NVarChar, -1).Value = P3_vialidad_posterior;
            cmd.Parameters.Add("@P3_lada", SqlDbType.NVarChar, -1).Value = P3_lada;
            cmd.Parameters.Add("@P3_telefono", SqlDbType.NVarChar, -1).Value = P3_telefono;
            cmd.Parameters.Add("@P3_extension", SqlDbType.NVarChar, -1).Value = P3_extension;
            cmd.Parameters.Add("@tipo_persona", SqlDbType.Bit).Value = tipo_persona;
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;

            cmd.Parameters.Add("@reguser", SqlDbType.NVarChar,-1).Value = reg_user;
            cmd.Parameters.Add("@numero_coordinacion", SqlDbType.Int).Value = numero_coordinacion;

            cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@folio", SqlDbType.NVarChar,-1).Direction = ParameterDirection.Output;
            if (cmd.Connection.State == ConnectionState.Closed) { cmd.Connection.Open(); }
            cmd.ExecuteNonQuery();
            
            string id = cmd.Parameters["@id"].Value.ToString();
            string folio = cmd.Parameters["@folio"].Value.ToString();
            string[] id_y_folio = new string[] { id, folio };
            cnn.Close();
            return id_y_folio;

            //cmd.ExecuteNonQuery();
            //cnn.Close();
            //return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    #endregion

}