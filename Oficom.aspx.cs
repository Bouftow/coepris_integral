using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class _default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {


                Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
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

                riesgo.Text = tramite.Riesgo.ToString();
                verificacion.Text = tramite.Verificacion.ToString();
                modalidad.Text = tramite.Modalidad.ToString();
                id_tramite.Text = tramite.IdTramite.ToString();
                statos.Text = tramite.Statos.ToString();
                certificado_anterior.Text = tramite.CertificadoAnterior.ToString();

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

                ///////////////////////////////////////////////////////////
                ///
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
                txtRFCprop.Text = tramite.RFC_Prop;

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

                chkLunesR.Checked = Convert.ToBoolean(Convert.ToInt16(RLunes.Substring(startIndex, length))); chkLunesR.Enabled = false;
                chkMartesR.Checked = Convert.ToBoolean(Convert.ToInt16(RMartes.Substring(startIndex, length))); chkMartesR.Enabled = false;
                chkMiercolesR.Checked = Convert.ToBoolean(Convert.ToInt16(RMiercoles.Substring(startIndex, length))); chkMiercolesR.Enabled = false;
                chkJuevesR.Checked = Convert.ToBoolean(Convert.ToInt16(RJueves.Substring(startIndex, length))); chkJuevesR.Enabled = false;
                chkViernesR.Checked = Convert.ToBoolean(Convert.ToInt16(RViernes.Substring(startIndex, length))); chkViernesR.Enabled = false;
                chkSabadoR.Checked = Convert.ToBoolean(Convert.ToInt16(RSabado.Substring(startIndex, length))); chkSabadoR.Enabled = false;
                chkDomingoR.Checked = Convert.ToBoolean(Convert.ToInt16(RDomingo.Substring(startIndex, length))); chkDomingoR.Enabled = false;



                string cadena_estdias_laborales = tramite.EstDiasLaborales;
                string[] estdias = cadena_estdias_laborales.Split(separador_dias_laborales, StringSplitOptions.RemoveEmptyEntries);
                string ESTLunes = estdias[0];
                string ESTMartes = estdias[1];
                string ESTMiercoles = estdias[2];
                string ESTJueves = estdias[3];
                string ESTViernes = estdias[4];
                string ESTSabado = estdias[5];
                string ESTDomingo = estdias[6];



                chkLunesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTLunes.Substring(startIndex, length))); chkLunesEst.Enabled = false;
                chkMartesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTMartes.Substring(startIndex, length))); chkMartesEst.Enabled = false;
                chkMiercolesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTMiercoles.Substring(startIndex, length))); chkMiercolesEst.Enabled = false;
                chkJuevesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTJueves.Substring(startIndex, length))); chkJuevesEst.Enabled = false;
                chkViernesEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTViernes.Substring(startIndex, length))); chkViernesEst.Enabled = false;
                chkSabadoEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTSabado.Substring(startIndex, length))); chkSabadoEst.Enabled = false;
                chkDomingoEst.Checked = Convert.ToBoolean(Convert.ToInt16(ESTDomingo.Substring(startIndex, length))); chkDomingoEst.Enabled = false;




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
                if (riesgo.Text == "1")
                {
                    if (statos.Text == "40") { btnAprobado25.Visible = true; btnAprobado26.Visible = false; }
                    if (statos.Text == "41") { btnAprobado25.Visible = false; btnAprobado26.Visible = true; }

                }

                else
                {
                    if (riesgo.Text == "2")
                    {

                        if (statos.Text == "1031" || statos.Text == "1032")
                        {
                            if (statos.Text == "1031")
                            {
                                btnAprobado25.Visible = true;
                                btnAprobado26.Visible = false;

                            }
                            if (statos.Text == "1032")
                            {
                                btnAprobado25.Visible = false;
                                btnAprobado26.Visible = true;

                            }
                        }
                        else
                        {
                            btnAprobado25.Visible = false;
                            btnAprobado26.Visible = false;
                        }


                    }

                    else
                    {
                        btnAprobado25.Visible = false;
                        btnAprobado26.Visible = false;


                    }



                }




                int startIndex0 = 2;
                int length0 = 1;
                string substring1 = tramite.Requerimientos.Substring(startIndex0, length0);

                int startIndex2 = 6;
                int length2 = 1;
                string substring2 = tramite.Requerimientos.Substring(startIndex2, length2);

                int startIndex3 = 10;
                int length3 = 1;
                string substring3 = tramite.Requerimientos.Substring(startIndex3, length3);

                int startIndex4 = 14;
                int length4 = 1;
                string substring4 = tramite.Requerimientos.Substring(startIndex4, length4);

                int startIndex5 = 18;
                int length5 = 1;
                string substring5 = tramite.Requerimientos.Substring(startIndex5, length5);

                int startIndex6 = 22;
                int length6 = 1;
                string substring6 = tramite.Requerimientos.Substring(startIndex6, length6);

                int startIndex7 = 26;
                int length7 = 1;
                string substring7 = tramite.Requerimientos.Substring(startIndex7, length7);

                int startIndex8 = 30;
                int length8 = 1;
                string substring8 = tramite.Requerimientos.Substring(startIndex8, length8);

                int startIndex9 = 34;
                int length9 = 1;
                string substring9 = tramite.Requerimientos.Substring(startIndex9, length9);

                int startIndex10 = 39;
                int length10 = 1;
                string substring10 = tramite.Requerimientos.Substring(startIndex10, length10);

                int startIndex11 = 44;
                int length11 = 1;
                string substring11 = tramite.Requerimientos.Substring(startIndex11, length11);

                int startIndex12 = 49;
                int length12 = 1;
                string substring12 = tramite.Requerimientos.Substring(startIndex12, length12);

                int startIndex13 = 54;
                int length13 = 1;
                string substring13 = tramite.Requerimientos.Substring(startIndex13, length13);


            }
        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
        }
    }


    protected void btnAprobado_Click(object sender, EventArgs e)
    {
        try
        {
            int a = 0;

            if (riesgo.Text == "1")
            {
                if (statos.Text == "40") { a = 41; }
                if (statos.Text == "41") { a = 24; }
            }

            if (riesgo.Text == "2")
            {

                if (statos.Text == "1031")
                {

                    a = 1032;
                }
                if (statos.Text == "1032")
                {

                    a = 1020;
                }


            }



            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
            {


                Curp = txtCurp.Text.ToUpper(),
                Telfij = txtTelfij.Text.ToUpper(),
                Telmov = txtTelmov.Text.ToUpper(),
                Correo = txtCorreo.Text.ToUpper(),
                Rfc = txtRfc.Text.ToUpper(),
                Nombreest = txtNombreest.Text.ToUpper(),
                Municipio = txtMunicipio.Text.ToUpper(),
                Colonia = txtColonia.Text.ToUpper(),
                Calle = txtCalle.Text.ToUpper(),
                CertificadoAnterior = certificado_anterior.Text.ToUpper(),
                Statos = a,

            };




            if (tramite.Staus_tram())
            { Response.Redirect("loficom.aspx"); }
        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
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