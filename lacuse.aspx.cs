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
                txtNombre.Text = tramite.Nombre;
                txtApellidop.Text = tramite.Apellidop;
                txtApellidom.Text = tramite.Apellidom;
                txtTelfij.Text = tramite.Telfij;
                txtTelmov.Text = tramite.Telmov;
                txtCorreo.Text = tramite.Correo;
                txtRfc.Text = tramite.Rfc;
                txtNombreest.Text = tramite.Nombreest;
                txtMunicipio.Text = tramite.Municipio;
                txtColonia.Text = tramite.Colonia;
                txtCalle.Text = tramite.Calle;
                txtRazonsocial.Text = tramite.Razonsocial;
                txtRui.Text = tramite.Rui;
                txtObservaciones.Text = tramite.Observaciones;

                txtLocalidad.Text = tramite.Localidad;
                txtGiro.Text = tramite.Giro;
                txtCP.Text = tramite.CP;
                txtTelest.Text = tramite.Telest;
                txtCorreoest.Text = tramite.Correoest;

                riesgo.Text = tramite.Riesgo.ToString();
                verificacion.Text = tramite.Verificacion.ToString();
                modalidad.Text = tramite.Modalidad.ToString();
                id_tramite.Text = tramite.IdTramite.ToString();
                statos.Text = tramite.Statos.ToString();
                certificado_anterior.Text = tramite.CertificadoAnterior.ToString();









                chkSolLicSan.Checked = tramite.SOLLICSAN;
                chksolicitud.Checked = tramite.SOLICITUD;
                chktitulo.Checked = tramite.TITUTLO;
                chkcedula.Checked = tramite.CEDULA;
                chkdiploma.Checked = tramite.DIPLOMA;
                chkCurriculum.Checked = tramite.CURRICULUM;
                chkfotografias.Checked = tramite.FOTOGRAFIAS;
                chkpagoresponsable.Checked = tramite.PAGORESPONSABLE;
                chkaltasat.Checked = tramite.ALTASAT;
                chkPlanoMemoria.Checked = tramite.PLANOMEMORIA;
                chkRelacionMaterialEquipo.Checked = tramite.RELACIONMATERIAL;
                chkPago.Checked = tramite.PAGO;
                chkprogramaact.Checked = tramite.PROGRAMAACT;
                chkfotocopiaconvenio.Checked = tramite.FOTOCOPIACONVENIO;
                chklibroregistro.Checked = tramite.LIBROREGISTRO;
                chkdescripciontecnicaembal.Checked = tramite.DESCRIPCIONTECNICAEMBAL;
                chktarjetadecontrol.Checked = tramite.TARJETADECONTROL;
                chkcartaconsentimiento.Checked = tramite.CARTACONSENTIMIENTO;
                chkactaconstitutiva.Checked = tramite.ACTACONSTITUTIVA;
                chkreglamentointerno.Checked = tramite.REGLAMENTOINTERNO;
                chkvistoproteccioncivil.Checked = tramite.VISTOPROTECCIONCIVIL;
                chkrelacionpersonal.Checked = tramite.RELACIONPERSONAL;
                chkautorizaciondif.Checked = tramite.AUTORIZACIONDIF;
                chkcedulaautoevaluacion.Checked = tramite.CEDULAAUTOEVALUACION;
                chkPapelMembretado.Checked = tramite.PAPELMEMBRETADO;
                chkautorizacionset.Checked = tramite.AUTORIZACIONSET;
                chkusodesuelo.Checked = tramite.USODESUELO;
                chkprocesolimpieza.Checked = tramite.PROCESOLIMPIEZA;
                chkrelaciontipoanalisis.Checked = tramite.RELACIONTIPOANALISIS;
                chkactaverificacion.Checked = tramite.ACTAVERIFICACION;

                chkavisofunc.Checked = tramite.AVISOFUNC;
                chkdoctecatmedhosp.Checked = tramite.DOCTECATMEDHOSP;
                chkprogramamedico.Checked = tramite.PROGRAMAMEDICO;
                chkcaracteristicasmecanicas.Checked = tramite.CARACTERISTICASMECANICAS;
                chkfotografiasdeunidad.Checked = tramite.FOTOGRAFIASDEUNIDAD;
                chklicenciasanitariaanterior.Checked = tramite.LICENCIASANITARIAANTERIOR;
                chkautorizacionresponsableanterior.Checked = tramite.AUTORIZACIONRESPONSABLEANTERIOR;
                chkantecedentesnopenales.Checked = tramite.ANTECEDENTESNOPENALES;
                chkpolizaseguro.Checked = tramite.POLIZASEGURO;
                chkprogramaalimentacion.Checked = tramite.PROGRAMAALIMENTACION;


                chktitulo_mr.Checked = tramite.TITULO_MR;
                chkcedula_mr.Checked = tramite.CEDULA_MR;
                chkdiploma_mr.Checked = tramite.DIPLOMA_MR;
                chkcurriculum_mr.Checked = tramite.CURRICULUM_MR;
                chkrelacionpersonal_paramedico.Checked = tramite.RELACIONPERSONAL_PARAMEDICO;
                chkdocumentacion_laboratorio.Checked = tramite.DOCUMENTACION_LABORATORIO;
                chkcopialicencia_matriz.Checked = tramite.COPIALICENCIA_MATRIZ;
                chkcopiaautorizacion_matriz.Checked = tramite.COPIAAUTORIZACION_MATRIZ;
                chkdocumentacion_tecnico.Checked = tramite.DOCUMENTACION_TECNICO;
                chkdocumentacion_responsable.Checked = tramite.DOCUMENTACION_RESPONSABLE;
                chkformalimpieza.Checked = tramite.FORMALIMPIEZA;

                Requisitos rq = new Requisitos();
                rq.Cargar(Convert.ToInt32(id_tramite.Text));
                if (rq.SOLLICSAN == true) { uno.Visible = true; } else { uno.Visible = false; }
                if (rq.ALTASAT == true) { dosa.Visible = true; } else { dosa.Visible = false; }
                if (rq.PLANOMEMORIA == true) { tres.Visible = true; } else { tres.Visible = false; }
                if (rq.RELACIONMATERIAL == true) { cuatro.Visible = true; } else { cuatro.Visible = false; }
                if (rq.PAGO == true) { cinco.Visible = true; } else { cinco.Visible = false; }
                if (rq.PROGRAMAACT == true) { seis.Visible = true; } else { seis.Visible = false; }
                if (rq.FOTOCOPIACONVENIO == true) { siete.Visible = true; } else { siete.Visible = false; }
                if (rq.LIBROREGISTRO == true) { ocho.Visible = true; } else { ocho.Visible = false; }
                if (rq.DESCRIPCIONTECNICAEMBAL == true) { nueve.Visible = true; } else { nueve.Visible = false; }
                if (rq.TARJETADECONTROL == true) { diez.Visible = true; } else { diez.Visible = false; }
                if (rq.CARTACONSENTIMIENTO == true) { once.Visible = true; } else { once.Visible = false; }
                if (rq.ACTACONSTITUTIVA == true) { doce.Visible = true; } else { doce.Visible = false; }
                if (rq.REGLAMENTOINTERNO == true) { trece.Visible = true; } else { trece.Visible = false; }
                if (rq.VISTOPROTECCIONCIVIL == true) { catorce.Visible = true; } else { catorce.Visible = false; }
                if (rq.RELACIONPERSONAL == true) { quince.Visible = true; } else { quince.Visible = false; }
                if (rq.AUTORIZACIONDIF == true) { dieciseis.Visible = true; } else { dieciseis.Visible = false; }
                if (rq.CEDULAAUTOEVALUACION == true) { diecisiete.Visible = true; } else { diecisiete.Visible = false; }
                if (rq.PAPELMEMBRETADO == true) { dieciocho.Visible = true; } else { dieciocho.Visible = false; }
                if (rq.AUTORIZACIONSET == true) { diecinueve.Visible = true; } else { diecinueve.Visible = false; }
                if (rq.USODESUELO == true) { veinte.Visible = true; } else { veinte.Visible = false; }
                if (rq.PROCESOLIMPIEZA == true) { veintiuno.Visible = true; } else { veintiuno.Visible = false; }
                if (rq.RELACIONTIPOANALISIS == true) { veintidos.Visible = true; } else { veintidos.Visible = false; }
                if (rq.ACTAVERIFICACION == true) { veintitres.Visible = true; } else { veintitres.Visible = false; }
                if (rq.SOLICITUD == true) { veinticuatro.Visible = true; } else { veinticuatro.Visible = false; }
                if (rq.TITUTLO == true) { veinticinco.Visible = true; } else { veinticinco.Visible = false; }
                if (rq.CEDULA == true) { veintiseis.Visible = true; } else { veintiseis.Visible = false; }
                if (rq.DIPLOMA == true) { veintisiete.Visible = true; } else { veintisiete.Visible = false; }
                if (rq.CURRICULUM == true) { veintiocho.Visible = true; } else { veintiocho.Visible = false; }
                if (rq.FOTOGRAFIAS == true) { veintinueve.Visible = true; } else { veintinueve.Visible = false; }
                if (rq.PAGORESPONSABLE == true) { treinta.Visible = true; } else { treinta.Visible = false; }
                if (rq.AVISOFUNC == true) { treintayuno.Visible = true; } else { treintayuno.Visible = false; }

                if (rq.DOCTECATMEDHOSP == true) { treintaydos.Visible = true; } else { treintaydos.Visible = false; }
                if (rq.PROGRAMAMEDICO == true) { treintaytres.Visible = true; } else { treintaytres.Visible = false; }
                if (rq.CARACTERISTICASMECANICAS == true) { treintaycuatro.Visible = true; } else { treintaycuatro.Visible = false; }
                if (rq.FOTOGRAFIASDEUNIDAD == true) { treintaycinco.Visible = true; } else { treintaycinco.Visible = false; }
                if (rq.LICENCIASANITARIAANTERIOR == true) { treintayseis.Visible = true; } else { treintayseis.Visible = false; }
                if (rq.AUTORIZACIONRESPONSABLEANTERIOR == true) { treintaysiete.Visible = true; } else { treintaysiete.Visible = false; }


                if (rq.ANTECEDENTESNOPENALES == true) { treintayocho.Visible = true; } else { treintayocho.Visible = false; }
                if (rq.POLIZASEGURO == true) { treintaynueve.Visible = true; } else { treintaynueve.Visible = false; }
                if (rq.PROGRAMAALIMENTACION == true) { cuarenta.Visible = true; } else { cuarenta.Visible = false; }

                if (rq.TITULO_MR == true) { cuarentayuno.Visible = true; } else { cuarentayuno.Visible = false; }
                if (rq.CEDULA_MR == true) { cuarentaydos.Visible = true; } else { cuarentaydos.Visible = false; }
                if (rq.DIPLOMA_MR == true) { cuarentaytres.Visible = true; } else { cuarentaytres.Visible = false; }
                if (rq.CURRICULUM_MR == true) { cuarentaycuatro.Visible = true; } else { cuarentaycuatro.Visible = false; }
                if (rq.RELACIONPERSONAL_PARAMEDICO == true) { cuarentaycinco.Visible = true; } else { cuarentaycinco.Visible = false; }

                if (rq.DOCUMENTACION_LABORATORIO == true) { cuarentayseis.Visible = true; } else { cuarentayseis.Visible = false; }
                if (rq.COPIALICENCIA_MATRIZ == true) { cuarentaysiete.Visible = true; } else { cuarentaysiete.Visible = false; }
                if (rq.COPIAAUTORIZACION_MATRIZ == true) { cuarentayocho.Visible = true; } else { cuarentayocho.Visible = false; }
                if (rq.DOCUMENTACION_TECNICO == true) { cuarentaynueve.Visible = true; } else { cuarentaynueve.Visible = false; }
                if (rq.DOCUMENTACION_RESPONSABLE == true) { cincuenta.Visible = true; } else { cincuenta.Visible = false; }
                if (rq.FORMALIMPIEZA == true) { cincuentayuno.Visible = true; } else { cincuentayuno.Visible = false; }

                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = Principal.CnnStr0;
                cnn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.Add("@rfolio", SqlDbType.Int).Value = tramite.Folio;
                cmd.CommandText = "SELECT folioseguimiento, statos,nombre_tramite, fecha_reg, " +
                    "CASE WHEN bitaseg.tramites.id_statos=1001 THEN 'EN ESPERA DE SER EVALUADO' " +
                    "WHEN bitaseg.tramites.id_statos=4 THEN 'PREVENCIÓN' " +
                    "WHEN bitaseg.tramites.id_statos=21 THEN 'PREVENCIÓN' " +
                    "WHEN bitaseg.tramites.id_statos=32 THEN 'PREVENCIÓN' " +
                    "WHEN bitaseg.tramites.id_statos=1007 THEN 'PREVENCIÓN' " +
                    "WHEN bitaseg.tramites.id_statos=1030 THEN 'PREVENCIÓN' " +
                    "WHEN bitaseg.tramites.id_statos=1028 THEN 'PREVENCIÓN' " +
                    "ELSE 'NO SE DEBE IMPRIMIR EL ACUSE' END AS estatus, CASE WHEN tramites.modalidad = 1 THEN 'Nuevo Ingreso' WHEN tramites.modalidad = 2 THEN 'Renovación' WHEN tramites.modalidad = 3 THEN 'Baja'" +
                        "WHEN tramites.modalidad = 4 THEN 'Modificacion'" +
                        "ELSE 'Error'" +
                   "END AS modalidad FROM  bitaseg.tramites " +
                    "inner join bitaseg.Lista_Tramites2 on tramites.id_tramite = Lista_Tramites2.id_tramite " +
                    "inner join bitaseg.Estatus_BajoAlto on tramites.id_statos = Estatus_BajoAlto.id_statos " +
                    "where folio = @rfolio";
                cmd.Connection = cnn;

                DataTable dte = new DataTable();
                SqlDataAdapter de = new SqlDataAdapter(cmd);
                de.Fill(dte);
                grdNombreTramite.DataSource = dte;
                grdNombreTramite.DataBind();

                cnn.Close();
                

            

               

            }
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
            e.Row.Cells[3].Font.Bold = true;
            e.Row.Cells[2].Font.Bold = true;
            e.Row.Cells[1].Font.Bold = true;
            e.Row.Cells[0].Font.Bold = true;
            e.Row.Cells[3].ForeColor = Color.Black;
            // Response.Write("<script>alert('Jaja " + myColumnId + "') </script>");

        }



    }

}