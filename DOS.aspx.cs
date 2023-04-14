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
                folio.Text = tramite.Folio.ToString();

                //sol.Text = tramite.Sol.ToString();
                //tit.Text = tramite.Tit.ToString();
                //ced.Text = tramite.Ced.ToString();
                //dip.Text = tramite.Dip.ToString();
                //curr.Text = tramite.Curr.ToString();
                //prog.Text = tramite.Prog.ToString();
                //rel.Text = tramite.Rel.ToString();
                //plano.Text = tramite.Plano.ToString();
                //alt.Text = tramite.Alt.ToString();
                //papel.Text = tramite.Papel.ToString();
                //form.Text = tramite.Form.ToString();
                //cop.Text = tramite.Cop.ToString();
                //lic.Text = tramite.Lic.ToString();
                dicdoc.Text = tramite.DicDoc.ToString();
                dictec.Text = tramite.DicTec.ToString();
                acta.Text = tramite.Acta.ToString();

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

                SolLicSan.HRef = tramite.iSOLLICSAN.ToString(); if (SolLicSan.HRef != "") { } else { SolLicSan.Visible = false; }
                Alta.HRef = tramite.iALTASAT.ToString(); if (Alta.HRef != "") { } else { Alta.Visible = false; }
                PlanoMemoria.HRef = tramite.iPLANOMEMORIA.ToString(); if (PlanoMemoria.HRef != "") { } else { PlanoMemoria.Visible = false; }
                RelacionMaterialEquipo.HRef = tramite.iRELACIONMATERIAL.ToString(); if (RelacionMaterialEquipo.HRef != "") { } else { RelacionMaterialEquipo.Visible = false; }
                Pago.HRef = tramite.iPAGO.ToString(); if (Pago.HRef != "") { } else { Pago.Visible = false; }
                ProgramaAct.HRef = tramite.iPROGRAMAACT.ToString(); if (ProgramaAct.HRef != "") { } else { ProgramaAct.Visible = false; }
                Fotocopiaconvenio.HRef = tramite.iFOTOCOPIACONVENIO.ToString(); if (Fotocopiaconvenio.HRef != "") { } else { Fotocopiaconvenio.Visible = false; }
                LibroRegistro.HRef = tramite.iLIBROREGISTRO.ToString(); if (LibroRegistro.HRef != "") { } else { LibroRegistro.Visible = false; }
                DescripcionTecnica.HRef = tramite.iDESCRIPCIONTECNICAEMBAL.ToString(); if (DescripcionTecnica.HRef != "") { } else { DescripcionTecnica.Visible = false; }
                Tarjetadecontrol.HRef = tramite.iTARJETADECONTROL.ToString(); if (Tarjetadecontrol.HRef != "") { } else { Tarjetadecontrol.Visible = false; }
                Cartaconsentimiento.HRef = tramite.iCARTACONSENTIMIENTO.ToString(); if (Cartaconsentimiento.HRef != "") { } else { Cartaconsentimiento.Visible = false; }
                Actaconstitutiva.HRef = tramite.iACTACONSTITUTIVA.ToString(); if (Actaconstitutiva.HRef != "") {; } else { Actaconstitutiva.Visible = false; }
                Reglamentointerno.HRef = tramite.iREGLAMENTOINTERNO.ToString(); if (Reglamentointerno.HRef != "") { } else { Reglamentointerno.Visible = false; }
                Vistobueno.HRef = tramite.iVISTOPROTECCIONCIVIL.ToString(); if (Vistobueno.HRef != "") { } else { Vistobueno.Visible = false; }
                Relacionpersonal.HRef = tramite.iRELACIONPERSONAL.ToString(); if (Relacionpersonal.HRef != "") { } else { Relacionpersonal.Visible = false; }
                Autorizaciondif.HRef = tramite.iAUTORIZACIONDIF.ToString(); if (Autorizaciondif.HRef != "") { } else { Autorizaciondif.Visible = false; }
                Cedulaeval.HRef = tramite.iCEDULAAUTOEVALUACION.ToString(); if (Cedulaeval.HRef != "") { } else { Cedulaeval.Visible = false; }
                PapelMembretado.HRef = tramite.iPAPELMEMBRETADO.ToString(); if (PapelMembretado.HRef != "") { } else { PapelMembretado.Visible = false; }
                Autorizacionset.HRef = tramite.iAUTORIZACIONSET.ToString(); if (Autorizacionset.HRef != "") { } else { Autorizacionset.Visible = false; }
                Usodesuelo.HRef = tramite.iUSODESUELO.ToString(); if (Usodesuelo.HRef != "") { } else { Usodesuelo.Visible = false; }
                Procesolimpieza.HRef = tramite.iPROCESOLIMPIEZA.ToString(); if (Procesolimpieza.HRef != "") {; } else { Procesolimpieza.Visible = false; }
                Relaciontipo.HRef = tramite.iRELACIONTIPOANALISIS.ToString(); if (Relaciontipo.HRef != "") { } else { Relaciontipo.Visible = false; }
                Actaverificacion.HRef = tramite.iACTAVERIFICACION.ToString(); if (Actaverificacion.HRef != "") { } else { Actaverificacion.Visible = false; }

                Solicitud.HRef = tramite.iSOLICITUD.ToString(); if (Solicitud.HRef != "") { } else { Solicitud.Visible = false; }
                Titulo.HRef = tramite.iTITUTLO.ToString(); if (Titulo.HRef != "") { } else { Titulo.Visible = false; }
                Cedula.HRef = tramite.iCEDULA.ToString(); if (Cedula.HRef != "") { } else { Cedula.Visible = false; }
                Diploma.HRef = tramite.iDIPLOMA.ToString(); if (Diploma.HRef != "") { } else { Diploma.Visible = false; }
                Curriculum.HRef = tramite.iCURRICULUM.ToString(); if (Curriculum.HRef != "") { } else { Curriculum.Visible = false; }
                Fotografias.HRef = tramite.iFOTOGRAFIAS.ToString(); if (Fotografias.HRef != "") { } else { Fotografias.Visible = false; }
                Pagoresponsable.HRef = tramite.iPAGORESPONSABLE.ToString(); if (Pagoresponsable.HRef != "") { } else { Pagoresponsable.Visible = false; }


                Avisofunc.HRef = tramite.iAVISOFUNC.ToString(); if (Avisofunc.HRef != "") { } else { Avisofunc.Visible = false; }

                Doctecatmedhosp.HRef = tramite.iDOCTECATMEDHOSP.ToString(); if (Doctecatmedhosp.HRef != "") { } else { Doctecatmedhosp.Visible = false; }
                Programamedico.HRef = tramite.iPROGRAMAMEDICO.ToString(); if (Programamedico.HRef != "") { } else { Programamedico.Visible = false; }
                CaracteristicasMecanicas.HRef = tramite.iCARACTERISTICASMECANICAS.ToString(); if (CaracteristicasMecanicas.HRef != "") { } else { CaracteristicasMecanicas.Visible = false; }
                FotografiasdeUnidad.HRef = tramite.iFOTOGRAFIASDEUNIDAD.ToString(); if (FotografiasdeUnidad.HRef != "") { } else { FotografiasdeUnidad.Visible = false; }
                LicSanAnterior.HRef = tramite.iLICENCIASANITARIAANTERIOR.ToString(); if (LicSanAnterior.HRef != "") { } else { LicSanAnterior.Visible = false; }
                AutorizacionResponsableAnterior.HRef = tramite.iAUTORIZACIONRESPONSABLEANTERIOR.ToString(); if (AutorizacionResponsableAnterior.HRef != "") { } else { AutorizacionResponsableAnterior.Visible = false; }
                AntecedentesNoPenales.HRef = tramite.iANTECEDENTESNOPENALES.ToString(); if (AntecedentesNoPenales.HRef != "") { } else { AntecedentesNoPenales.Visible = false; }
                PolizaSeguro.HRef = tramite.iPOLIZASEGURO.ToString(); if (PolizaSeguro.HRef != "") { } else { PolizaSeguro.Visible = false; }
                ProgramaAlimentacion.HRef = tramite.iPROGRAMAALIMENTACION.ToString(); if (ProgramaAlimentacion.HRef != "") { } else { ProgramaAlimentacion.Visible = false; }
                Titulo_MR.HRef = tramite.iTITULO_MR.ToString(); if (Titulo_MR.HRef != "") { } else { Titulo_MR.Visible = false; }
                Cedula_MR.HRef = tramite.iCEDULA_MR.ToString(); if (Cedula_MR.HRef != "") { } else { Cedula_MR.Visible = false; }
                Diploma_MR.HRef = tramite.iDIPLOMA_MR.ToString(); if (Diploma_MR.HRef != "") { } else { Diploma_MR.Visible = false; }
                Curriculum_MR.HRef = tramite.iCURRICULUM_MR.ToString(); if (Curriculum_MR.HRef != "") { } else { Curriculum_MR.Visible = false; }
                RelacionPersonalParamedico.HRef = tramite.iRELACIONPERSONAL_PARAMEDICO.ToString(); if (RelacionPersonalParamedico.HRef != "") { } else { RelacionPersonalParamedico.Visible = false; }
                Documentacion_Laboratorio.HRef = tramite.iDOCUMENTACION_LABORATORIO.ToString(); if (Documentacion_Laboratorio.HRef != "") { } else { Documentacion_Laboratorio.Visible = false; }
                CopiaLicencia_Matriz.HRef = tramite.iCOPIALICENCIA_MATRIZ.ToString(); if (CopiaLicencia_Matriz.HRef != "") { } else { CopiaLicencia_Matriz.Visible = false; }
                CopiaAutorizacion_Matriz.HRef = tramite.iCOPIAAUTORIZACION_MATRIZ.ToString(); if (CopiaAutorizacion_Matriz.HRef != "") { } else { CopiaAutorizacion_Matriz.Visible = false; }
                Documentacion_Tecnico.HRef = tramite.iDOCUMENTACION_TECNICO.ToString(); if (Documentacion_Tecnico.HRef != "") { } else { Documentacion_Tecnico.Visible = false; }
                Documentacion_Responsable.HRef = tramite.iDOCUMENTACION_RESPONSABLE.ToString(); if (Documentacion_Responsable.HRef != "") { } else { Documentacion_Responsable.Visible = false; }
                FormaLimpieza.HRef = tramite.iFORMALIMPIEZA.ToString(); if (FormaLimpieza.HRef != "") { } else { FormaLimpieza.Visible = false; }

                DictamenDocumental.HRef = tramite.iDIDOC.ToString(); if (DictamenDocumental.HRef != "") { DictamenDocumental.InnerText = lbl31.InnerText.ToString(); } else { DictamenDocumental.Visible = false; }
                Acta1.HRef = tramite.iACTA.ToString();if(Acta1.HRef != "") { Acta1.InnerText = lbl32.InnerText.ToString(); } else { Acta1.Visible = false; }
                DictamenTecnico.HRef = tramite.iDICTEC.ToString();if(DictamenTecnico.HRef != "") { DictamenTecnico.InnerText = lbl33.InnerText.ToString(); } else { DictamenTecnico.Visible = false; }

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

                chkDictamenDocumental.Checked = tramite.DICDOCCUMPLE;
                chkActa.Checked = tramite.ACTACUMPLE;
                chkDicTec.Checked = tramite.DICTECCUMPLE;


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

                if (riesgo.Text == "1")
                {
                    if (statos.Text == "11")
                    {
                        btnAprobado14.Visible = true;
                    }
                    else { btnAprobado14.Visible = false; }
                }

                else
                {

                    if (riesgo.Text == "2")
                    {
                        if (statos.Text == "1005" || statos.Text == "1011" || statos.Text == "1013")
                        {
                            if (statos.Text == "1005")
                            {
                                btnAprobado14.Visible = true;
                                btnAprobado14.Text = "Enviar a la Coordinación";
                            }
                            if (statos.Text == "1011")
                            {
                                btnAprobado14.Visible = true;
                                btnAprobado14.Text = "Enviar a DDS";
                            }
                            if (statos.Text == "1013")
                            {
                                btnAprobado14.Visible = true;
                                btnAprobado14.Text = "Enviar a la DEAS";
                            }
                        }
                        else
                        {

                            btnAprobado14.Visible = false;
                        }


                    }

                    else
                    {

                        btnAprobado14.Visible = false;
                    }
                }



                chkDicTec.Enabled = false;
                chkDicTec.Checked = true;



                //if (riesgo.Text.ToString() == "1" && (statos.Text.ToString() == "15" || statos.Text.ToString() == "16"))
                //{
                //    chkDictamenDocumental.Checked = true;
                //    chkDictamenDocumental.Enabled = true;
                //}
                //else
                //{

                if (riesgo.Text.ToString() == "2" && (statos.Text.ToString() == "1005" || statos.Text.ToString() == "1011" || statos.Text.ToString() == "1013"))
                {
                    chkDictamenDocumental.Checked = true;
                    chkDictamenDocumental.Enabled = false;
                    if (statos.Text.ToString() == "1011" || statos.Text.ToString() == "1013")
                    {
                        chkActa.Checked = true;
                        chkActa.Enabled = false;
                    }
                }
                else
                {
                    chkDictamenDocumental.Checked = false;
                    chkDictamenDocumental.Enabled = false;

                }
                //}



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
                if (statos.Text == "11")
                {

                    a = 14;
                }
            }
            if (riesgo.Text == "2")
            {
                if (statos.Text == "1005")
                    a = 1008;
                if (statos.Text == "1011")
                    a = 1012;
                if (statos.Text == "1013")
                    a = 1016;
            }



            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
            {


                Curp = txtCurp.Text.ToUpper(),
                Nombre = txtNombre.Text.ToUpper(),
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
            { Response.Redirect("ldos.aspx"); }
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