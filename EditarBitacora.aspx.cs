using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Services;
using System.Linq;
using System.Xml.Linq;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);


        Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
        txtCertificadoAnterior.Text = tramite.CertificadoAnterior;

        txtNombre.Text= tramite.Nombre;
        txtApellidop.Text= tramite.Apellidom;
        txtApellidom.Text = tramite.Apellidom;
        txtCurp.Text = tramite.Curp;
        txtTelfij.Text = tramite.Telfij;
        txtTelmov.Text = tramite.Telmov;
        txtCorreo.Text = tramite.Correo;
        txtRfc.Text = tramite.Rfc;
        txtNombreest.Text = tramite.Nombreest;
        txtMunicipio.Text = tramite.Municipio;
        txtColonia.Text = tramite.Colonia;
        txtCalle.Text = tramite.Calle;
        txtRazonsocial.Text = tramite.Razonsocial;

        txtRnombre.Text = tramite.Rnombre + " " + tramite.Rapellidop + " " + tramite.Rapellidom;
        txtRgrado.Text = tramite.Rgrado;
        txtRcedula.Text = tramite.Rcedula;
        txtRfcR.Text = tramite.Rfc_R;

        txtNumero.Text = tramite.Numero;
        txtCP.Text = tramite.CP;
        txtLocalidad.Text = tramite.Localidad;
        txtReferencias.Text = tramite.Referencias;
        txtCorreoest.Text = tramite.Correoest;
        txtTelest.Text = tramite.Telest;

        txtNombre.Text = tramite.Nombre + " " + tramite.Apellidop + " " + tramite.Apellidom;


        riesgo.Text = tramite.Riesgo.ToString();
        verificacion.Text = tramite.Verificacion.ToString();
        modalidad.Text = tramite.Modalidad.ToString();
        id_tramite.Text = tramite.IdTramite.ToString();

        txtRnombre.Text = tramite.Rnombre;
        txtRapellidom.Text = tramite.Rapellidom;
        txtRapellidop.Text = tramite.Rapellidop;
        txtRgrado.Text = tramite.Rgrado;
        txtRui.Text = tramite.Rui;

        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add("@rfolio", SqlDbType.Int).Value = tramite.Folio;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = cnn;
        cmd.CommandText = "bitaseg.proc_CargarNombretramite";
        DataTable dte = new DataTable();
        SqlDataAdapter de = new SqlDataAdapter(cmd);
        de.Fill(dte);
        grdNombreTramite.DataSource = dte;
        grdNombreTramite.DataBind();

        cnn.Close();

        string[] separador_dias_laborales = { "|" };
        string cadena_rdias_laborales = tramite.RDiasLaborales;
        string[] rdias = cadena_rdias_laborales.Split(separador_dias_laborales, StringSplitOptions.RemoveEmptyEntries);
        string RLunes = rdias[0];
        string RMartes = rdias[1];
        string RMiercoles = rdias[2];
        string RJueves = rdias[3];
        string RViernes = rdias[4];
        string RSabado = rdias[5];
        string RDomingo = rdias[6];

        int startIndex = 2;
        int length = 1;

        chkLunesR.Checked = Convert.ToBoolean(Convert.ToInt16(RLunes.Substring(startIndex, length))); ;
        chkMartesR.Checked = Convert.ToBoolean(Convert.ToInt16(RMartes.Substring(startIndex, length))); ;
        chkMiercolesR.Checked = Convert.ToBoolean(Convert.ToInt16(RMiercoles.Substring(startIndex, length))); ;
        chkJuevesR.Checked = Convert.ToBoolean(Convert.ToInt16(RJueves.Substring(startIndex, length))); ;
        chkViernesR.Checked = Convert.ToBoolean(Convert.ToInt16(RViernes.Substring(startIndex, length))); ;
        chkSabadoR.Checked = Convert.ToBoolean(Convert.ToInt16(RSabado.Substring(startIndex, length))); ;
        chkDomingoR.Checked = Convert.ToBoolean(Convert.ToInt16(RDomingo.Substring(startIndex, length))); ;



        string cadena_estdias_laborales = tramite.EstDiasLaborales;
        string[] estdias = cadena_estdias_laborales.Split(separador_dias_laborales, StringSplitOptions.RemoveEmptyEntries);
        string ESTLunes = estdias[0];
        string ESTMartes = estdias[1];
        string ESTMiercoles = estdias[2];
        string ESTJueves = estdias[3];
        string ESTViernes = estdias[4];
        string ESTSabado = estdias[5];
        string ESTDomingo = estdias[6];



        chkLunesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTLunes.Substring(startIndex, length))); ;
        chkMartesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTMartes.Substring(startIndex, length))); ;
        chkMiercolesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTMiercoles.Substring(startIndex, length))); ;
        chkJuevesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTJueves.Substring(startIndex, length))); ;
        chkViernesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTViernes.Substring(startIndex, length))); ;
        chkSabadoEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTSabado.Substring(startIndex, length))); ;
        chkDomingoEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTDomingo.Substring(startIndex, length))); ;




        string[] separador_dias = { "|" };
        string cadena_dias_1 = tramite.Hest1;
        string cadena_dias_2 = tramite.Hest2;
        string[] dias_est_1 = cadena_dias_1.Split(separador_dias, StringSplitOptions.RemoveEmptyEntries);
        string Lunes_Est_1 = dias_est_1[0];
        string Martes_Est_1 = dias_est_1[1];
        string Miercoles_Est_1 = dias_est_1[2];
        string Jueves_Est_1 = dias_est_1[3];
        string Viernes_Est_1 = dias_est_1[4];
        string Sabado_Est_1 = dias_est_1[5];
        string Domingo_Est_1 = dias_est_1[6];

        string[] dias_est_2 = cadena_dias_2.Split(separador_dias, StringSplitOptions.RemoveEmptyEntries);
        string Lunes_Est_2 = dias_est_2[0];
        string Martes_Est_2 = dias_est_2[1];
        string Miercoles_Est_2 = dias_est_2[2];
        string Jueves_Est_2 = dias_est_2[3];
        string Viernes_Est_2 = dias_est_2[4];
        string Sabado_Est_2 = dias_est_2[5];
        string Domingo_Est_2 = dias_est_2[6];

        int indice_horario_inicio = 2;
        int longitud_inicio = 5;
        int indice_horario_final = 8;
        int longitud_final = 5;
        LunesH1inicio.Value = dias_est_1[0].Substring(indice_horario_inicio, longitud_inicio);
        LunesH1fin.Value = dias_est_1[0].Substring(indice_horario_final, longitud_final);

        MartesH1inicio.Value = dias_est_1[1].Substring(indice_horario_inicio, longitud_inicio);
        MartesH1fin.Value = dias_est_1[1].Substring(indice_horario_final, longitud_final);

        MiercolesH1inicio.Value = dias_est_1[2].Substring(indice_horario_inicio, longitud_inicio);
        MiercolesH1fin.Value = dias_est_1[2].Substring(indice_horario_final, longitud_final);

        JuevesH1inicio.Value = dias_est_1[3].Substring(indice_horario_inicio, longitud_inicio);
        JuevesH1fin.Value = dias_est_1[3].Substring(indice_horario_final, longitud_final);

        ViernesH1inicio.Value = dias_est_1[4].Substring(indice_horario_inicio, longitud_inicio);
        ViernesH1fin.Value = dias_est_1[4].Substring(indice_horario_final, longitud_final);

        SabadoH1inicio.Value = dias_est_1[5].Substring(indice_horario_inicio, longitud_inicio);
        SabadoH1fin.Value = dias_est_1[5].Substring(indice_horario_final, longitud_final);

        DomingoH1inicio.Value = dias_est_1[6].Substring(indice_horario_inicio, longitud_inicio);
        DomingoH1fin.Value = dias_est_1[6].Substring(indice_horario_final, longitud_final);

        LunesH2inicio.Value = dias_est_1[0].Substring(indice_horario_inicio, longitud_inicio);
        LunesH2fin.Value = dias_est_1[0].Substring(indice_horario_final, longitud_final);

        MartesH2inicio.Value = dias_est_1[1].Substring(indice_horario_inicio, longitud_inicio);
        MartesH2fin.Value = dias_est_1[1].Substring(indice_horario_final, longitud_final);

        MiercolesH2inicio.Value = dias_est_1[2].Substring(indice_horario_inicio, longitud_inicio);
        MiercolesH2fin.Value = dias_est_1[2].Substring(indice_horario_final, longitud_final);

        JuevesH2inicio.Value = dias_est_1[3].Substring(indice_horario_inicio, longitud_inicio);
        JuevesH2fin.Value = dias_est_1[3].Substring(indice_horario_final, longitud_final);

        ViernesH2inicio.Value = dias_est_1[4].Substring(indice_horario_inicio, longitud_inicio);
        ViernesH2fin.Value = dias_est_1[4].Substring(indice_horario_final, longitud_final);

        SabadoH2inicio.Value = dias_est_1[5].Substring(indice_horario_inicio, longitud_inicio);
        SabadoH2fin.Value = dias_est_1[5].Substring(indice_horario_final, longitud_final);

        DomingoH2inicio.Value = dias_est_1[6].Substring(indice_horario_inicio, longitud_inicio);
        DomingoH2fin.Value = dias_est_1[6].Substring(indice_horario_final, longitud_final);



        string cadena_diasr_1 = tramite.Hr1;
        string cadena_diasr_2 = tramite.Hr2;
        string[] dias_r_1 = cadena_diasr_1.Split(separador_dias, StringSplitOptions.RemoveEmptyEntries);
        string Lunes_r_1 = dias_r_1[0];
        string Martes_r_1 = dias_r_1[1];
        string Miercoles_r_1 = dias_r_1[2];
        string Jueves_r_1 = dias_r_1[3];
        string Viernes_r_1 = dias_r_1[4];
        string Sabado_r_1 = dias_r_1[5];
        string Domingo_r_1 = dias_r_1[6];

        string[] dias_r_2 = cadena_diasr_2.Split(separador_dias, StringSplitOptions.RemoveEmptyEntries);
        string Lunes_r_2 = dias_r_2[0];
        string Martes_r_2 = dias_r_2[1];
        string Miercoles_r_2 = dias_r_2[2];
        string Jueves_r_2 = dias_r_2[3];
        string Viernes_r_2 = dias_r_2[4];
        string Sabado_r_2 = dias_r_2[5];
        string Domingo_r_2 = dias_r_2[6];

        //int indice_horario_inicio = 2;
        //int longitud_inicio = 5;
        //int indice_horario_final = 8;
        //int longitud_final = 5;
        LunesH1inicioR.Value = dias_r_1[0].Substring(indice_horario_inicio, longitud_inicio);
        LunesH1finR.Value = dias_r_1[0].Substring(indice_horario_final, longitud_final);

        MartesH1inicioR.Value = dias_r_1[1].Substring(indice_horario_inicio, longitud_inicio);
        MartesH1finR.Value = dias_r_1[1].Substring(indice_horario_final, longitud_final);

        MiercolesH1inicioR.Value = dias_r_1[2].Substring(indice_horario_inicio, longitud_inicio);
        MiercolesH1finR.Value = dias_r_1[2].Substring(indice_horario_final, longitud_final);

        JuevesH1inicioR.Value = dias_r_1[3].Substring(indice_horario_inicio, longitud_inicio);
        JuevesH1finR.Value = dias_r_1[3].Substring(indice_horario_final, longitud_final);

        ViernesH1inicioR.Value = dias_r_1[4].Substring(indice_horario_inicio, longitud_inicio);
        ViernesH1finR.Value = dias_r_1[4].Substring(indice_horario_final, longitud_final);

        SabadoH1inicioR.Value = dias_r_1[5].Substring(indice_horario_inicio, longitud_inicio);
        SabadoH1finR.Value = dias_r_1[5].Substring(indice_horario_final, longitud_final);

        DomingoH1inicioR.Value = dias_r_1[6].Substring(indice_horario_inicio, longitud_inicio);
        DomingoH1finR.Value = dias_r_1[6].Substring(indice_horario_final, longitud_final);

        LunesH2inicioR.Value = dias_r_2[0].Substring(indice_horario_inicio, longitud_inicio);
        LunesH2finR.Value = dias_r_2[0].Substring(indice_horario_final, longitud_final);

        MartesH2inicioR.Value = dias_r_2[1].Substring(indice_horario_inicio, longitud_inicio);
        MartesH2finR.Value = dias_r_2[1].Substring(indice_horario_final, longitud_final);

        MiercolesH2inicioR.Value = dias_r_2[2].Substring(indice_horario_inicio, longitud_inicio);
        MiercolesH2finR.Value = dias_r_2[2].Substring(indice_horario_final, longitud_final);

        JuevesH2inicioR.Value = dias_r_2[3].Substring(indice_horario_inicio, longitud_inicio);
        JuevesH2finR.Value = dias_r_2[3].Substring(indice_horario_final, longitud_final);

        ViernesH2inicioR.Value = dias_r_2[4].Substring(indice_horario_inicio, longitud_inicio);
        ViernesH2finR.Value = dias_r_2[4].Substring(indice_horario_final, longitud_final);

        SabadoH2inicioR.Value = dias_r_2[5].Substring(indice_horario_inicio, longitud_inicio);
        SabadoH2finR.Value = dias_r_2[5].Substring(indice_horario_final, longitud_final);

        DomingoH2inicioR.Value = dias_r_2[6].Substring(indice_horario_inicio, longitud_inicio);
        DomingoH2finR.Value = dias_r_2[6].Substring(indice_horario_final, longitud_final);
        //////////////////////////////////////////////////
        if (!IsPostBack)
        {
            categoriareal.Text = categoria.Value;
            this.Form.Attributes.Add("autocomplete", "off");
            //if (categoriareal.Text.ToString() != "3")
            //{
            //    RequiredFieldValidator11.IsValid = true;
            //    RequiredFieldValidator12.IsValid = true;
            //    RequiredFieldValidator13.IsValid = true;
            //    RequiredFieldValidator14.IsValid = true;
            //    RequiredFieldValidator3.IsValid = true;
            //    RequiredFieldValidator11.Enabled = false;
            //    RequiredFieldValidator12.Enabled = false;
            //    RequiredFieldValidator13.Enabled = false;
            //    RequiredFieldValidator14.Enabled = false;
            //    RequiredFieldValidator3.Enabled = false;

            //    txtRnombre.Text = "A";
            //    txtRapellidom.Text = "B";
            //    txtRapellidop.Text = "C";
            //    txtRcedula.Text = "D";
            //    txtRgrado.Text = "E";
            //    txtHorario.Text = "F";
            //}

            //SqlConnection cnn = new SqlConnection();
            //cnn.ConnectionString = "Data Source= PALACIOS; Initial Catalog= gestori; User ID= ra; Password=123454321";
            //cnn.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "Select * from bitaseg.requerimientos ";
            //cmd.Connection = cnn;
            //DataTable dte = new DataTable();
            //SqlDataAdapter de = new SqlDataAdapter(cmd);
            //de.Fill(dte);
            //chbxl1.DataTextField = "requerimiento";
            //chbxl1.DataValueField = "id_requerimiento";
            //chbxl1.DataSource = dte;
            //chbxl1.DataBind();
            //cnn.Close();




        }
        if (IsPostBack)
        {

            categoriareal.Text = categoria.Value;
            if (categoriareal.Text.ToString() != "3")
            {
                RequiredFieldValidator11.IsValid = true;
                RequiredFieldValidator12.IsValid = true;
                RequiredFieldValidator13.IsValid = true;
                RequiredFieldValidator14.IsValid = true;
                RequiredFieldValidator3.IsValid = true;
                RequiredFieldValidator11.Enabled = false;
                RequiredFieldValidator12.Enabled = false;
                RequiredFieldValidator13.Enabled = false;
                RequiredFieldValidator14.Enabled = false;
                RequiredFieldValidator3.Enabled = false;

            }


        }
    }
    protected void grdNombreTramite_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Create an instance of the datarow
            DataRowView rowData = (DataRowView)e.Row.DataItem;
            //use this object to test data to make decisions
            string myColumnId = (rowData["modalidad"].ToString());
            e.Row.Cells[1].Font.Bold = true;
            e.Row.Cells[2].Font.Bold = true;
            e.Row.Cells[0].Font.Bold = true;
            e.Row.Cells[2].ForeColor = Color.Black;
            // Response.Write("<script>alert('Jaja " + myColumnId + "') </script>");

        }



    }

   




}