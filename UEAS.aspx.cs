using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Script.Serialization;


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
                
                //txtApellidop.Text = tramite.Apellidop;
                //txtApellidom.Text = tramite.Apellidom;
              
                txtTelfij.Text = tramite.Telfij;
                txtTelmov.Text = tramite.Telmov;
                txtCorreo.Text = tramite.Correo;
                txtRfc.Text = tramite.Rfc;
                txtNombreest.Text = tramite.Nombreest;
                txtMunicipio.Text = tramite.Municipio;
                
                
                txtColonia.Text = tramite.Colonia;
                txtCalle.Text = tramite.Calle;
                txtRazonsocial.Text = tramite.Razonsocial;
                //txtRui.Text = tramite.Rui; if (txtRui.Text == "") { txtRui.Enabled = true; } else { txtRui.Enabled = false; }

                riesgo.Text = tramite.Riesgo.ToString();
                verificacion.Text = tramite.Verificacion.ToString();
                modalidad.Text = tramite.Modalidad.ToString();
                id_tramite.Text = tramite.IdTramite.ToString();
                statos.Text = tramite.Statos.ToString();
                certificado_anterior.Text = tramite.CertificadoAnterior.ToString();
                folio.Text = tramite.Folio.ToString();

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




                string[] separador_dias = {  "|" };
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
                int longitud_inicio =5;
                int indice_horario_final = 8;
                int longitud_final =5;
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


                int a = 0;
                SolLicSan.HRef = tramite.iSOLLICSAN.ToString(); if (SolLicSan.HRef != "") { a++; } else { SolLicSan.Visible = false; }
                Solicitud.HRef = tramite.iSOLICITUD.ToString(); if (Solicitud.HRef != "") { a++; } else { Solicitud.Visible = false; }
                Titulo.HRef = tramite.iTITUTLO.ToString(); if (Titulo.HRef != "") { a++; } else { Titulo.Visible = false; }
                Cedula.HRef = tramite.iCEDULA.ToString(); if (Cedula.HRef != "") { a++; } else { Cedula.Visible = false; }
                Diploma.HRef = tramite.iDIPLOMA.ToString(); if (Diploma.HRef != "") { a++; } else { Diploma.Visible = false; }
                Curriculum.HRef = tramite.iCURRICULUM.ToString(); if (Curriculum.HRef != "") { a++; } else { Curriculum.Visible = false; }
                Fotografias.HRef = tramite.iFOTOGRAFIAS.ToString(); if (Fotografias.HRef != "") { a++; } else { Fotografias.Visible = false; }
                Pagoresponsable.HRef = tramite.iPAGORESPONSABLE.ToString(); if (Pagoresponsable.HRef != "") { a++; } else { Pagoresponsable.Visible = false; }
                Alta.HRef = tramite.iALTASAT.ToString(); if (Alta.HRef != "") { a++; } else { Alta.Visible = false; }
                PlanoMemoria.HRef = tramite.iPLANOMEMORIA.ToString(); if (PlanoMemoria.HRef != "") { a++; } else { PlanoMemoria.Visible = false; }
                RelacionMaterialEquipo.HRef = tramite.iRELACIONMATERIAL.ToString(); if (RelacionMaterialEquipo.HRef != "") { a++; } else { RelacionMaterialEquipo.Visible = false; }
                Pago.HRef = tramite.iPAGO.ToString(); if (Pago.HRef != "") { a++; } else { Pago.Visible = false; }
                ProgramaAct.HRef = tramite.iPROGRAMAACT.ToString(); if (ProgramaAct.HRef != "") { a++; } else { ProgramaAct.Visible = false; }
                Fotocopiaconvenio.HRef = tramite.iFOTOCOPIACONVENIO.ToString(); if (Fotocopiaconvenio.HRef != "") { a++; } else { Fotocopiaconvenio.Visible = false; }
                LibroRegistro.HRef = tramite.iLIBROREGISTRO.ToString(); if (LibroRegistro.HRef != "") { a++; } else { LibroRegistro.Visible = false; }
                DescripcionTecnica.HRef = tramite.iDESCRIPCIONTECNICAEMBAL.ToString(); if (DescripcionTecnica.HRef != "") { a++; } else { DescripcionTecnica.Visible = false; }
                Tarjetadecontrol.HRef = tramite.iTARJETADECONTROL.ToString(); if (Tarjetadecontrol.HRef != "") { a++; } else { Tarjetadecontrol.Visible = false; }
                Cartaconsentimiento.HRef = tramite.iCARTACONSENTIMIENTO.ToString(); if (Cartaconsentimiento.HRef != "") { a++; } else { Cartaconsentimiento.Visible = false; }
                Actaconstitutiva.HRef = tramite.iACTACONSTITUTIVA.ToString(); if (Actaconstitutiva.HRef != "") { a++; } else { Actaconstitutiva.Visible = false; }
                Reglamentointerno.HRef = tramite.iREGLAMENTOINTERNO.ToString(); if (Reglamentointerno.HRef != "") { a++; } else { Reglamentointerno.Visible = false; }
                Vistobueno.HRef = tramite.iVISTOPROTECCIONCIVIL.ToString(); if (Vistobueno.HRef != "") { a++; } else { Vistobueno.Visible = false; }
                Relacionpersonal.HRef = tramite.iRELACIONPERSONAL.ToString(); if (Relacionpersonal.HRef != "") { a++; } else { Relacionpersonal.Visible = false; }
                Autorizaciondif.HRef = tramite.iAUTORIZACIONDIF.ToString(); if (Autorizaciondif.HRef != "") { a++; } else { Autorizaciondif.Visible = false; }
                Cedulaeval.HRef = tramite.iCEDULAAUTOEVALUACION.ToString(); if (Cedulaeval.HRef != "") { a++; } else { Cedulaeval.Visible = false; }
                PapelMembretado.HRef = tramite.iPAPELMEMBRETADO.ToString(); if (PapelMembretado.HRef != "") { a++; } else { PapelMembretado.Visible = false; }
                Autorizacionset.HRef = tramite.iAUTORIZACIONSET.ToString(); if (Autorizacionset.HRef != "") { a++; } else { Autorizacionset.Visible = false; }
                Usodesuelo.HRef = tramite.iUSODESUELO.ToString(); if (Usodesuelo.HRef != "") { a++; } else { Usodesuelo.Visible = false; }
                Procesolimpieza.HRef = tramite.iPROCESOLIMPIEZA.ToString(); if (Procesolimpieza.HRef != "") { a++; } else { Procesolimpieza.Visible = false; }
                Relaciontipo.HRef = tramite.iRELACIONTIPOANALISIS.ToString(); if (Relaciontipo.HRef != "") { a++; } else { Relaciontipo.Visible = false; }
                Actaverificacion.HRef = tramite.iACTAVERIFICACION.ToString(); if (Actaverificacion.HRef != "") { FileActadeVerificacion.Visible = false; a++; } else { Actaverificacion.Visible = false; }

                Avisofunc.HRef = tramite.iAVISOFUNC.ToString(); if (Avisofunc.HRef != "") { a++; } else { Avisofunc.Visible = false; }

                Doctecatmedhosp.HRef = tramite.iDOCTECATMEDHOSP.ToString(); if (Doctecatmedhosp.HRef != "") { a++; } else { Doctecatmedhosp.Visible = false; }
                Programamedico.HRef = tramite.iPROGRAMAMEDICO.ToString(); if (Programamedico.HRef != "") { a++; } else { Programamedico.Visible = false; }
                CaracteristicasMecanicas.HRef = tramite.iCARACTERISTICASMECANICAS.ToString(); if (CaracteristicasMecanicas.HRef != "") { a++; } else { CaracteristicasMecanicas.Visible = false; }
                FotografiasdeUnidad.HRef = tramite.iFOTOGRAFIASDEUNIDAD.ToString(); if (FotografiasdeUnidad.HRef != "") { a++; } else { FotografiasdeUnidad.Visible = false; }
                LicSanAnterior.HRef = tramite.iLICENCIASANITARIAANTERIOR.ToString(); if (LicSanAnterior.HRef != "") { a++; } else { LicSanAnterior.Visible = false; }
                AutorizacionResponsableAnterior.HRef = tramite.iAUTORIZACIONRESPONSABLEANTERIOR.ToString(); if (AutorizacionResponsableAnterior.HRef != "") { a++; } else { AutorizacionResponsableAnterior.Visible = false; }
                AntecedentesNoPenales.HRef = tramite.iANTECEDENTESNOPENALES.ToString(); if (AntecedentesNoPenales.HRef != "") { a++; } else { AntecedentesNoPenales.Visible = false; }
                PolizaSeguro.HRef = tramite.iPOLIZASEGURO.ToString(); if (PolizaSeguro.HRef != "") { a++; } else { PolizaSeguro.Visible = false; }
                ProgramaAlimentacion.HRef = tramite.iPROGRAMAALIMENTACION.ToString(); if (ProgramaAlimentacion.HRef != "") { a++; } else { ProgramaAlimentacion.Visible = false; }
                Titulo_MR.HRef = tramite.iTITULO_MR.ToString(); if (Titulo_MR.HRef != "") { a++; } else { Titulo_MR.Visible = false; }
                Cedula_MR.HRef = tramite.iCEDULA_MR.ToString(); if (Cedula_MR.HRef != "") { a++; } else { Cedula_MR.Visible = false; }
                Diploma_MR.HRef = tramite.iDIPLOMA_MR.ToString(); if (Diploma_MR.HRef != "") { a++; } else { Diploma_MR.Visible = false; }
                Curriculum_MR.HRef = tramite.iCURRICULUM_MR.ToString(); if (Curriculum_MR.HRef != "") { a++; } else { Curriculum_MR.Visible = false; }
                RelacionPersonalParamedico.HRef = tramite.iRELACIONPERSONAL_PARAMEDICO.ToString(); if (RelacionPersonalParamedico.HRef != "") { a++; } else { RelacionPersonalParamedico.Visible = false; }
                Documentacion_Laboratorio.HRef = tramite.iDOCUMENTACION_LABORATORIO.ToString(); if (Documentacion_Laboratorio.HRef != "") { a++; } else { Documentacion_Laboratorio.Visible = false; }
                CopiaLicencia_Matriz.HRef = tramite.iCOPIALICENCIA_MATRIZ.ToString(); if (CopiaLicencia_Matriz.HRef != "") { a++; } else { CopiaLicencia_Matriz.Visible = false; }
                CopiaAutorizacion_Matriz.HRef = tramite.iCOPIAAUTORIZACION_MATRIZ.ToString(); if (CopiaAutorizacion_Matriz.HRef != "") { a++; } else { CopiaAutorizacion_Matriz.Visible = false; }
                Documentacion_Tecnico.HRef = tramite.iDOCUMENTACION_TECNICO.ToString(); if (Documentacion_Tecnico.HRef != "") { a++; } else { Documentacion_Tecnico.Visible = false; }
                Documentacion_Responsable.HRef = tramite.iDOCUMENTACION_RESPONSABLE.ToString(); if (Documentacion_Responsable.HRef != "") { a++; } else { Documentacion_Responsable.Visible = false; }
                FormaLimpieza.HRef = tramite.iFORMALIMPIEZA.ToString(); if (FormaLimpieza.HRef != "") { a++; } else { FormaLimpieza.Visible = false; }
               
            

                //idicdoc = drp["dicdoc"].ToString();
                //idictec = drp["dictec"].ToString();
                //iacta = drp["acta"].ToString();
               

                DictamenDocumental.HRef = tramite.iDIDOC.ToString(); if (DictamenDocumental.HRef != "") { a++; } else { DictamenDocumental.Visible = false; }
                Acuse.HRef = tramite.iACUSEFINAL.ToString(); if (Acuse.HRef != "") { Acuse.InnerText = lblacuse.InnerText.ToString(); }

                int b = 0;
                chkSolLicSan.Checked = tramite.SOLLICSAN; if (chkSolLicSan.Checked == false) { btn_SolLicSan.Visible = false; } else { b++; }
                chksolicitud.Checked = tramite.SOLICITUD; if (chksolicitud.Checked == false) { btn_Solicitud.Visible = false; } else { b++; }
                chktitulo.Checked = tramite.TITUTLO; if (chktitulo.Checked == false) { btn_Titulo.Visible = false; } else { b++; }
                chkcedula.Checked = tramite.CEDULA; if (chkcedula.Checked == false) { btn_Cedula.Visible = false; } else { b++; }
                chkdiploma.Checked = tramite.DIPLOMA; if (chkdiploma.Checked == false) { btn_Diploma.Visible = false; } else { b++; }
                chkCurriculum.Checked = tramite.CURRICULUM; if (chkCurriculum.Checked == false) { btn_Curriculum.Visible = false; } else { b++; }
                chkfotografias.Checked = tramite.FOTOGRAFIAS; if (chkfotografias.Checked == false) { btn_Fotografias.Visible = false; } else { b++; }
                chkpagoresponsable.Checked = tramite.PAGORESPONSABLE; if (chkpagoresponsable.Checked == false) { btn_Pagoresponsable.Visible = false; } else { b++; }
                chkaltasat.Checked = tramite.ALTASAT; if (chkaltasat.Checked == false) { btn_Alta.Visible = false; } else { b++; }
                chkPlanoMemoria.Checked = tramite.PLANOMEMORIA; if (chkPlanoMemoria.Checked == false) { btn_PlanoMemoria.Visible = false; } else { b++; }
                chkRelacionMaterialEquipo.Checked = tramite.RELACIONMATERIAL; if (chkRelacionMaterialEquipo.Checked == false) { btn_RelacionMaterialEquipo.Visible = false; } else { b++; }
                chkPago.Checked = tramite.PAGO; if (chkPago.Checked == false) { btn_Pago.Visible = false; } else { b++; }
                chkprogramaact.Checked = tramite.PROGRAMAACT; if (chkprogramaact.Checked == false) { btn_Programaact.Visible = false; } else { b++; }
                chkfotocopiaconvenio.Checked = tramite.FOTOCOPIACONVENIO; if (chkfotocopiaconvenio.Checked == false) { btn_Fotocopiaconvenio.Visible = false; } else { b++; }
                chklibroregistro.Checked = tramite.LIBROREGISTRO; if (chklibroregistro.Checked == false) { btn_LibroRegistro.Visible = false; } else { b++; }
                chkdescripciontecnicaembal.Checked = tramite.DESCRIPCIONTECNICAEMBAL; if (chkdescripciontecnicaembal.Checked == false) { btn_DescripcionTecnica.Visible = false; } else { b++; }
                chktarjetadecontrol.Checked = tramite.TARJETADECONTROL; if (chktarjetadecontrol.Checked == false) { btn_Tarjetadecontrol.Visible = false; } else { b++; }
                chkcartaconsentimiento.Checked = tramite.CARTACONSENTIMIENTO; if (chkcartaconsentimiento.Checked == false) { btn_CartaConsentimiento.Visible = false; } else { b++; }
                chkactaconstitutiva.Checked = tramite.ACTACONSTITUTIVA; if (chkactaconstitutiva.Checked == false) { btn_ActaConstitutiva.Visible = false; } else { b++; }
                chkreglamentointerno.Checked = tramite.REGLAMENTOINTERNO; if (chkreglamentointerno.Checked == false) { btn_Reglamentointerno.Visible = false; } else { b++; }
                chkvistoproteccioncivil.Checked = tramite.VISTOPROTECCIONCIVIL; if (chkvistoproteccioncivil.Checked == false) { btn_Vistobueno.Visible = false; } else { b++; }
                chkrelacionpersonal.Checked = tramite.RELACIONPERSONAL; if (chkrelacionpersonal.Checked == false) { btn_Relacionpersonal.Visible = false; } else { b++; }
                chkautorizaciondif.Checked = tramite.AUTORIZACIONDIF; if (chkautorizaciondif.Checked == false) { btn_Autorizaciondif.Visible = false; } else { b++; }
                chkcedulaautoevaluacion.Checked = tramite.CEDULAAUTOEVALUACION; if (chkcedulaautoevaluacion.Checked == false) { btn_CedulaAutoeval.Visible = false; } else { b++; }
                chkPapelMembretado.Checked = tramite.PAPELMEMBRETADO; if (chkPapelMembretado.Checked == false) { btn_PapelMembretado.Visible = false; } else { b++; }
                chkautorizacionset.Checked = tramite.AUTORIZACIONSET; if (chkautorizacionset.Checked == false) { btn_Autorizacionset.Visible = false; } else { b++; }
                chkusodesuelo.Checked = tramite.USODESUELO; if (chkusodesuelo.Checked == false) { btn_Usodesuelo.Visible = false; } else { b++; }
                chkprocesolimpieza.Checked = tramite.PROCESOLIMPIEZA; if (chkprocesolimpieza.Checked == false) { btn_ProcesoLimpieza.Visible = false; } else { b++; }
                chkrelaciontipoanalisis.Checked = tramite.RELACIONTIPOANALISIS; if (chkrelaciontipoanalisis.Checked == false) { btn_RelacionTipo.Visible = false; } else { b++; }

                chkavisofunc.Checked = tramite.AVISOFUNC; if (chkavisofunc.Checked == false) { btn_Avisofunc.Visible = false; } else { b++; };
                chkdoctecatmedhosp.Checked = tramite.DOCTECATMEDHOSP; if (chkdoctecatmedhosp.Checked == false) { btn_Doctecatmedhosp.Visible = false; } else { b++; };
                chkprogramamedico.Checked = tramite.PROGRAMAMEDICO; if (chkprogramamedico.Checked == false) { btn_Programamedico.Visible = false; } else { b++; };
                chkcaracteristicasmecanicas.Checked = tramite.CARACTERISTICASMECANICAS; if (chkcaracteristicasmecanicas.Checked == false) { btn_CaracteristicasMecanicas.Visible = false; } else { b++; };
                chkfotografiasdeunidad.Checked = tramite.FOTOGRAFIASDEUNIDAD; if (chkfotografiasdeunidad.Checked == false) { btn_FotografiasdeUnidad.Visible = false; } else { b++; };
                chklicenciasanitariaanterior.Checked = tramite.LICENCIASANITARIAANTERIOR; if (chklicenciasanitariaanterior.Checked == false) { btn_LicSanAnterior.Visible = false; } else { b++; };
                chkautorizacionresponsableanterior.Checked = tramite.AUTORIZACIONRESPONSABLEANTERIOR; if (chkautorizacionresponsableanterior.Checked == false) { btn_AutorizacionResponsableAnterior.Visible = false; } else { b++; };
                chkantecedentesnopenales.Checked = tramite.ANTECEDENTESNOPENALES; if (chkantecedentesnopenales.Checked == false) { btn_AntecedentesNoPenales.Visible = false; } else { b++; };
                chkpolizaseguro.Checked = tramite.POLIZASEGURO; if (chkpolizaseguro.Checked == false) { btn_PolizaSeguro.Visible = false; } else { b++; };
                chkprogramaalimentacion.Checked = tramite.PROGRAMAALIMENTACION; if (chkprogramaalimentacion.Checked == false) { btn_ProgramaAlimentacion.Visible = false; } else { b++; };


                chktitulo_mr.Checked = tramite.TITULO_MR; if (chktitulo_mr.Checked == false) { btn_Titulo_MR.Visible = false; } else { b++; };
                chkcedula_mr.Checked = tramite.CEDULA_MR; if (chkcedula_mr.Checked == false) { btn_Cedula_MR.Visible = false; } else { b++; };
                chkdiploma_mr.Checked = tramite.DIPLOMA_MR; if (chkdiploma_mr.Checked == false) { btn_Diploma_MR.Visible = false; } else { b++; };
                chkcurriculum_mr.Checked = tramite.CURRICULUM_MR; if (chkcurriculum_mr.Checked == false) { btn_Curriculum_MR.Visible = false; } else { b++; };
                chkrelacionpersonal_paramedico.Checked = tramite.RELACIONPERSONAL_PARAMEDICO; if (chkrelacionpersonal_paramedico.Checked == false) { btn_RelacionPersonalParamedico.Visible = false; } else { b++; };
                chkdocumentacion_laboratorio.Checked = tramite.DOCUMENTACION_LABORATORIO; if (chkdocumentacion_laboratorio.Checked == false) { btn_Documentacion_Laboratorio.Visible = false; } else { b++; };
                chkcopialicencia_matriz.Checked = tramite.COPIALICENCIA_MATRIZ; if (chkcopialicencia_matriz.Checked == false) { btn_CopiaLicencia_Matriz.Visible = false; } else { b++; };
                chkcopiaautorizacion_matriz.Checked = tramite.COPIAAUTORIZACION_MATRIZ; if (chkcopiaautorizacion_matriz.Checked == false) { btn_CopiaAutorizacion_Matriz.Visible = false; } else { b++; };
                chkdocumentacion_tecnico.Checked = tramite.DOCUMENTACION_TECNICO; if (chkdocumentacion_tecnico.Checked == false) { btn_Documentacion_Tecnico.Visible = false; } else { b++; };
                chkdocumentacion_responsable.Checked = tramite.DOCUMENTACION_RESPONSABLE; if (chkdocumentacion_responsable.Checked == false) { btn_Documentacion_Responsable.Visible = false; } else { b++; };
                chkformalimpieza.Checked = tramite.FORMALIMPIEZA; if (chkformalimpieza.Checked == false) { btn_FormaLimpieza.Visible = false; } else { b++; };

                chkAcuse.Checked = tramite.ACUSEFINALCUMPLE;
                chkDictamenDocumental.Checked = tramite.DICDOCCUMPLE; if (chkDictamenDocumental.Checked == false) {  } else { b++; }



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
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cnn;
                cmd.CommandText = "bitaseg.proc_CargarNombretramite";
                DataTable dte = new DataTable();
                SqlDataAdapter de = new SqlDataAdapter(cmd);
                de.Fill(dte);
                grdNombreTramite.DataSource = dte;
                grdNombreTramite.DataBind();

                cnn.Close();


                
                switch (statos.Text)
                {
                    case "1":
                    case "4":
                    case "18":
                    case "33":
                    case "34":
                        btnAprobado.Visible = true;
                        btnPrevision.Visible = true;
                        btnRechazado.Visible = true;
                        AcAp.Visible = false;
                        break;
                    case "1001":
                        btnAprobado.Visible = true;
                        btnAprobado.Text = "Enviar a la Coordinación";
                        btnPrevision.Visible = true;
                        btnPrevision.Text = "Prevención";
                        btnRechazado.Visible = false;
                        fileAcuse.Visible = false;
                        AcAp.Visible = false;
                        break;
                    case "1029":

                        btnAprobado.Visible = false;
                        btnPrevision.Visible = false;
                        btnRechazado.Visible = false;
                        fileAcuse.Visible = false;
                        AcAp.Visible = false;
                        break;
                    case "1027":

                        btnAprobado.Visible = false;
                        btnPrevision.Visible = true;
                        btnPrevision.Text = "Subir Acuse";
                        btnRechazado.Visible = false;
                        fin.Visible = false;
                        AcAp.Visible = true;


                        break;
                    case "31":
                        btnAprobado.Visible = false;
                        btnPrevision.Visible = true;
                        btnPrevision.Text = "Subir Acuse";
                        btnRechazado.Visible = false;
                        fin.Visible = false;
                        AcAp.Visible = true;
                        break;
                    default:
                        btnAprobado.Visible = false;
                        btnPrevision.Visible = false;
                        btnRechazado.Visible = false;
                        fileAcuse.Visible = false;
                        AcAp.Visible = false;
                        break;

                }
                if (riesgo.Text == "1")
                {
                    if (statos.Text == "1")
                    {
                        chkVerificacion.Checked = tramite.RequiereVerificacion;
                        if (chkVerificacion.Checked == true) { sino.InnerText = "Sí"; }
                        if (chkVerificacion.Checked == false) { sino.InnerText = "No"; }
                    }
                }
                else {
                    if (riesgo.Text == "2") {
                        switch (statos.Text)
                        {
                            case "1001":
                                //Response.Write("<script>alert('" + a + "+" + b + "')</script>"); 
                                if (a !=b) { btnAprobado.Visible = false; }
                                break;

                            default:
                               
                                break;

                        }

                       
                        
                        verifica.Visible = false; }
                }
               
                //Response.Write("<script>alert('" + a + "')</script>");
                //Response.Write("<script>alert('" + b + "')</script>");
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
            e.Row.Cells[1].Font.Bold = true;
            e.Row.Cells[2].Font.Bold = true;
            e.Row.Cells[0].Font.Bold = true;
            e.Row.Cells[2].ForeColor = Color.Black;
            // Response.Write("<script>alert('Jaja " + myColumnId + "') </script>");

        }



    }
    protected void btnAprobado_Click(object sender, EventArgs e)
    {

        //if (chkDictamenDocumental.Checked == true) { 
        try
        {
            if (statos.Text == "1")
            {
                
                    SqlConnection cna = new SqlConnection();
                    cna.ConnectionString = Principal.CnnStr0;
                    cna.Open();
                    //SqlCommand cmda = new SqlCommand(" Insert Into bitaseg.imgchar (folio) values ('" + folio.Text + "')");
                    SqlCommand cma = new SqlCommand("UPDATE bitaseg.tramites SET requiereverificacion = ('" + chkVerificacion.Checked + "') where folio = ('" + folio.Text + "') ");

                    cma.Connection = cna;
                    cma.ExecuteNonQuery();
                    cna.Close();
                
            }

                string isollicsan = "";
                string isolicitud = "";
                string ititulo = "";
                string icedula = "";
                string idiploma = "";
                string icurriculum = "";
                string ifotografias = "";
                string ipagoresponsable = "";
                string ialtasat = "";
                string iplanomemoria = "";
                string irelacionmaterial = "";
                string ipago = "";
                string iprogramaact = "";
                string ifotocopiaconvenio = "";
                string ilibroregistro = "";
                string idescripciontecnicaembal = "";
                string itarjetadecontrol = "";
                string icartaconsentimiento = "";
                string iactaconstitutiva = "";
                string ireglamentointerno = "";
                string ivistoproteccioncivil = "";
                string irelacionpersonal = "";
                string iautorizaciondif = "";
                string icedulaautoevaluacion = "";
                string ipapelmembretado = "";
                string iautorizacionset = "";
                string iusodesuelo = "";
                string iprocesolimpieza = "";
                string irelaciontipoanalisis = "";
                string iactaverificacion = "";
                string iavisofunc = "";

                string idoctecatmedhosp = "";
                string iprogramamedico = "";
                string icaracteristicasmecanicas = "";
                string ifotografiasdeunidad = "";
                string ilicenciasanitariaanterior = "";
                string iautorizacionresponsableanterior = "";
                string iantecedentesnopenales = "";
                string ipolizaseguro = "";
                string iprogramaalimentacion = "";


                string ititulo_MR = "";
                string icedula_MR = "";
                string idiploma_MR = "";
                string icurriculum_MR = "";
                string irelacionpersonal_paramedico = "";
                string idocumentacion_laboratorio = "";
                string icopialicencia_matriz = "";
                string icopiaautorizacion_matriz = "";
                string idocumentacion_tecnico = "";
                string idocumentacion_responsable = "";
                string iformalimpieza = "";

                string idicdoc = "";
                string idictec = "";
                string iacta = "";
                string iacusefinal = "";
                string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");

                int a = 0;
            if (riesgo.Text == "1")
            {
                if (statos.Text == "1" || statos.Text == "32" || statos.Text == "4" || statos.Text == "33")
                {
                    if (chkVerificacion.Checked) {a = 2;}
                    else { a = 35; }
                }
                if (statos.Text == "18" || statos.Text == "34")
                {

                    a = 19;
                }
            }
            if (riesgo.Text == "2")
            {
                if (statos.Text == "1001" || statos.Text == "1029")
                {

                    a = 1002;
                }

            }

         
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
            {
                //Rui = txtRui.Text.ToUpper(),
                Statos = a,
                iSOLLICSAN = isollicsan,
                iSOLICITUD = isolicitud,
                iTITUTLO = ititulo,
                iCEDULA = icedula,
                iDIPLOMA = idiploma,
                iCURRICULUM = icurriculum,
                iFOTOGRAFIAS = ifotografias,
                iPAGORESPONSABLE = ipagoresponsable,
                iALTASAT = ialtasat,
                iPLANOMEMORIA = iplanomemoria,
                iRELACIONMATERIAL = irelacionmaterial,
                iPAGO = ipago,
                iPROGRAMAACT = iprogramaact,
                iFOTOCOPIACONVENIO = ifotocopiaconvenio,
                iLIBROREGISTRO = ilibroregistro,
                iDESCRIPCIONTECNICAEMBAL = idescripciontecnicaembal,
                iTARJETADECONTROL = itarjetadecontrol,
                iCARTACONSENTIMIENTO = icartaconsentimiento,
                iACTACONSTITUTIVA = iactaconstitutiva,
                iREGLAMENTOINTERNO = ireglamentointerno,
                iVISTOPROTECCIONCIVIL = ivistoproteccioncivil,
                iRELACIONPERSONAL = irelacionpersonal,
                iAUTORIZACIONDIF = iautorizaciondif,
                iCEDULAAUTOEVALUACION = icedulaautoevaluacion,
                iPAPELMEMBRETADO = ipapelmembretado,
                iAUTORIZACIONSET = iautorizacionset,
                iUSODESUELO = iusodesuelo,
                iPROCESOLIMPIEZA = iprocesolimpieza,
                iRELACIONTIPOANALISIS = irelaciontipoanalisis,
                iACTAVERIFICACION = iactaverificacion,
                iAVISOFUNC = iavisofunc,

                iDOCTECATMEDHOSP = idoctecatmedhosp,
                iPROGRAMAMEDICO = iprogramamedico,
                iCARACTERISTICASMECANICAS = icaracteristicasmecanicas,
                iFOTOGRAFIASDEUNIDAD = ifotografiasdeunidad,
                iLICENCIASANITARIAANTERIOR = ilicenciasanitariaanterior,
                iAUTORIZACIONRESPONSABLEANTERIOR = iautorizacionresponsableanterior,
                iANTECEDENTESNOPENALES = iantecedentesnopenales,
                iPOLIZASEGURO = ipolizaseguro,
                iPROGRAMAALIMENTACION = iprogramaalimentacion,


                iTITULO_MR = ititulo_MR,
                iCEDULA_MR = icedula_MR,
                iDIPLOMA_MR = idiploma_MR,
                iCURRICULUM_MR = icurriculum_MR,
                iRELACIONPERSONAL_PARAMEDICO = irelacionpersonal_paramedico,
                iDOCUMENTACION_LABORATORIO = idocumentacion_laboratorio,
                iCOPIALICENCIA_MATRIZ = icopialicencia_matriz,
                iCOPIAAUTORIZACION_MATRIZ = icopiaautorizacion_matriz,
                iDOCUMENTACION_TECNICO = idocumentacion_tecnico,
                iDOCUMENTACION_RESPONSABLE = idocumentacion_responsable,
                iFORMALIMPIEZA = iformalimpieza,

                iDICTEC = idictec,
                iDIDOC = idicdoc,
                iACTA = iacta,
                iACUSEFINAL = iacusefinal,

            };

            if (tramite.Digitalizar())
            { Response.Redirect("lueas.aspx"); }
        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
            //Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
            Response.Write("<script>alert('Favor de verificar que los requisitos estén completos. ') </script>");

        }
        //}
        //else { Response.Write("<script>alert('Favor de subir la evaluación documental')</script>"); }
    }
    protected void btnRechazado_Click(object sender, EventArgs e)
    {
        //if (chkDictamenDocumental.Checked == true)
        //{
            try
            {
                string isollicsan = "";
                string isolicitud = "";
                string ititulo = "";
                string icedula = "";
                string idiploma = "";
                string icurriculum = "";
                string ifotografias = "";
                string ipagoresponsable = "";
                string ialtasat = "";
                string iplanomemoria = "";
                string irelacionmaterial = "";
                string ipago = "";
                string iprogramaact = "";
                string ifotocopiaconvenio = "";
                string ilibroregistro = "";
                string idescripciontecnicaembal = "";
                string itarjetadecontrol = "";
                string icartaconsentimiento = "";
                string iactaconstitutiva = "";
                string ireglamentointerno = "";
                string ivistoproteccioncivil = "";
                string irelacionpersonal = "";
                string iautorizaciondif = "";
                string icedulaautoevaluacion = "";
                string ipapelmembretado = "";
                string iautorizacionset = "";
                string iusodesuelo = "";
                string iprocesolimpieza = "";
                string irelaciontipoanalisis = "";
                string iactaverificacion = "";
                string iavisofunc = "";

                string idoctecatmedhosp = "";
                string iprogramamedico = "";
                string icaracteristicasmecanicas = "";
                string ifotografiasdeunidad = "";
                string ilicenciasanitariaanterior = "";
                string iautorizacionresponsableanterior = "";
                string iantecedentesnopenales = "";
                string ipolizaseguro = "";
                string iprogramaalimentacion = "";


                string ititulo_MR = "";
                string icedula_MR = "";
                string idiploma_MR = "";
                string icurriculum_MR = "";
                string irelacionpersonal_paramedico = "";
                string idocumentacion_laboratorio = "";
                string icopialicencia_matriz = "";
                string icopiaautorizacion_matriz = "";
                string idocumentacion_tecnico = "";
                string idocumentacion_responsable = "";
                string iformalimpieza = "";

                string idicdoc = "";
                string idictec = "";
                string iacta = "";
                string iacusefinal = "";

                int a = 0;
                if (riesgo.Text == "1")
                {
                    if (statos.Text == "1" || statos.Text == "32" || statos.Text == "4" || statos.Text == "33")
                    {

                        a = 3;
                    }
                    if (statos.Text == "18" || statos.Text == "34")
                    {

                        a = 20;
                    }
                }

                if (1 == 1)
                {
                    //if (FileSolLicSan.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "SolLicSan" + folio.Text + System.IO.Path.GetExtension(FileSolLicSan.FileName);
                    //    //FileSolLicSan.SaveAs(Server.MapPath("~/uploads/") + fileName);
                    //    isollicsan = "uploads/" + fileName + "";
                    //    FileSolicitud.SaveAs(Server.MapPath("~/") + isollicsan);
                    //}
                    //if (FileSolicitud.HasFile)
                    //{

                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Solicitud" + folio.Text + System.IO.Path.GetExtension(FileSolicitud.FileName);
                    //    //FileSolicitud.SaveAs(Server.MapPath("~/uploads/") + fileName);
                    //    isolicitud = "uploads/" + fileName + "";
                    //    FileSolicitud.SaveAs(Server.MapPath("~/") + isolicitud);



                    //}
                    //if (FileTitulo.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Titulo" + folio.Text + System.IO.Path.GetExtension(FileTitulo.FileName);
                    //    //FileTitulo.SaveAs(Server.MapPath("~/uploads/") + fileName);
                    //    ititulo = "uploads/" + fileName + "";
                    //    FileTitulo.SaveAs(Server.MapPath("~/") + ititulo);
                    //}
                    //if (FileCedula.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Cedula" + folio.Text + System.IO.Path.GetExtension(FileCedula.FileName);
                    //    icedula = "uploads/" + fileName + "";
                    //    FileCedula.SaveAs(Server.MapPath("~/") + icedula);

                    //}
                    //if (FileDiploma.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Diploma" + folio.Text + System.IO.Path.GetExtension(FileDiploma.FileName);
                    //    idiploma = "uploads/" + fileName + "";
                    //    FileDiploma.SaveAs(Server.MapPath("~/") + idiploma);

                    //}
                    //if (FileCurriculum.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Curriculum" + folio.Text + System.IO.Path.GetExtension(FileCurriculum.FileName);
                    //    icurriculum = "uploads/" + fileName + "";
                    //    FileCurriculum.SaveAs(Server.MapPath("~/") + icurriculum);

                    //}
                    //if (FileFotografias.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Fotografias" + folio.Text + System.IO.Path.GetExtension(FileFotografias.FileName);
                    //    ifotografias = "uploads/" + fileName + "";
                    //    FileFotografias.SaveAs(Server.MapPath("~/") + ifotografias);

                    //}
                    //if (FilePagoresponsable.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "PagoDelResponsable" + folio.Text + System.IO.Path.GetExtension(FilePagoresponsable.FileName);
                    //    ipagoresponsable = "uploads/" + fileName + "";
                    //    FilePagoresponsable.SaveAs(Server.MapPath("~/") + ipagoresponsable);

                    //}
                    //if (FileAlta.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "AltaSAT" + folio.Text + System.IO.Path.GetExtension(FileAlta.FileName);
                    //    ialtasat = "uploads/" + fileName + "";
                    //    FileAlta.SaveAs(Server.MapPath("~/") + ialtasat);

                    //}
                    //if (FilePlanoMemoria.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "PlanoMemoria" + folio.Text + System.IO.Path.GetExtension(FilePlanoMemoria.FileName);
                    //    iplanomemoria = "uploads/" + fileName + "";
                    //    FilePlanoMemoria.SaveAs(Server.MapPath("~/") + iplanomemoria);

                    //}
                    //if (FileRelacionMaterialEquipo.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "RelacionMaterialEquipo" + folio.Text + System.IO.Path.GetExtension(FileRelacionMaterialEquipo.FileName);
                    //    irelacionmaterial = "uploads/" + fileName + "";
                    //    FileRelacionMaterialEquipo.SaveAs(Server.MapPath("~/") + irelacionmaterial);

                    //}
                    //if (FilePago.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "Pago" + folio.Text + System.IO.Path.GetExtension(FilePago.FileName);
                    //    ipago = "uploads/" + fileName + "";
                    //    FilePago.SaveAs(Server.MapPath("~/") + ipago);

                    //}
                    //if (FileProgramaact.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "ProgramadeActividades" + folio.Text + System.IO.Path.GetExtension(FileProgramaact.FileName);
                    //    iprogramaact = "uploads/" + fileName + "";
                    //    FileProgramaact.SaveAs(Server.MapPath("~/") + iprogramaact);

                    //}
                    //if (FileFotocopiaconvenio.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "FotocopiaConvenio" + folio.Text + System.IO.Path.GetExtension(FileFotocopiaconvenio.FileName);
                    //    ifotocopiaconvenio = "uploads/" + fileName + "";
                    //    FileFotocopiaconvenio.SaveAs(Server.MapPath("~/") + ifotocopiaconvenio);

                    //}
                    //if (FileLibroRegistro.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "LibroRegistro" + folio.Text + System.IO.Path.GetExtension(FileLibroRegistro.FileName);
                    //    ilibroregistro = "uploads/" + fileName + "";
                    //    FileLibroRegistro.SaveAs(Server.MapPath("~/") + ilibroregistro);

                    //}
                    //if (FileDescripcionTecnica.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "TecnicaEmbalsamamiento" + folio.Text + System.IO.Path.GetExtension(FileDescripcionTecnica.FileName);
                    //    idescripciontecnicaembal = "uploads/" + fileName + "";
                    //    FileDescripcionTecnica.SaveAs(Server.MapPath("~/") + idescripciontecnicaembal);

                    //}
                    //if (FileTarjetadecontrol.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "TarjetadeControl" + folio.Text + System.IO.Path.GetExtension(FileTarjetadecontrol.FileName);
                    //    itarjetadecontrol = "uploads/" + fileName + "";
                    //    FileTarjetadecontrol.SaveAs(Server.MapPath("~/") + itarjetadecontrol);

                    //}
                    //if (FileCartaConsentimiento.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "CartaConsentimiento" + folio.Text + System.IO.Path.GetExtension(FileCartaConsentimiento.FileName);
                    //    icartaconsentimiento = "uploads/" + fileName + "";
                    //    FileCartaConsentimiento.SaveAs(Server.MapPath("~/") + icartaconsentimiento);

                    //}
                    //if (FileActaConstitutiva.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "ActaConstitutiva" + folio.Text + System.IO.Path.GetExtension(FileActaConstitutiva.FileName);
                    //    iactaconstitutiva = "uploads/" + fileName + "";
                    //    FileActaConstitutiva.SaveAs(Server.MapPath("~/") + iactaconstitutiva);

                    //}
                    //if (FileReglamentointerno.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "ReglamentoInterno" + folio.Text + System.IO.Path.GetExtension(FileReglamentointerno.FileName);
                    //    ireglamentointerno = "uploads/" + fileName + "";
                    //    FileReglamentointerno.SaveAs(Server.MapPath("~/") + ireglamentointerno);

                    //}
                    //if (FileVistobueno.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "ProteccionCivil" + folio.Text + System.IO.Path.GetExtension(FileVistobueno.FileName);
                    //    ivistoproteccioncivil = "uploads/" + fileName + "";
                    //    FileVistobueno.SaveAs(Server.MapPath("~/") + ivistoproteccioncivil);

                    //}
                    //if (FileRelacionpersonal.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "RelacionPersonal" + folio.Text + System.IO.Path.GetExtension(FileRelacionpersonal.FileName);
                    //    irelacionpersonal = "uploads/" + fileName + "";
                    //    FileRelacionpersonal.SaveAs(Server.MapPath("~/") + irelacionpersonal);

                    //}
                    //if (FileAutorizaciondif.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "AutorizaciónDIF" + folio.Text + System.IO.Path.GetExtension(FileAutorizaciondif.FileName);
                    //    iautorizaciondif = "uploads/" + fileName + "";
                    //    FileAutorizaciondif.SaveAs(Server.MapPath("~/") + iautorizaciondif);

                    //}
                    //if (FileCedulaAutoeval.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "CedulaAutoevaluación" + folio.Text + System.IO.Path.GetExtension(FileCedulaAutoeval.FileName);
                    //    icedulaautoevaluacion = "uploads/" + fileName + "";
                    //    FileCedulaAutoeval.SaveAs(Server.MapPath("~/") + icedulaautoevaluacion);

                    //}
                    //if (FilePapelMembretado.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "PapelMembretado" + folio.Text + System.IO.Path.GetExtension(FilePapelMembretado.FileName);
                    //    ipapelmembretado = "uploads/" + fileName + "";
                    //    FilePapelMembretado.SaveAs(Server.MapPath("~/") + ipapelmembretado);

                    //}
                    //if (FileAutorizacionset.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "AutorizaciónSET" + folio.Text + System.IO.Path.GetExtension(FileAutorizacionset.FileName);
                    //    iautorizacionset = "uploads/" + fileName + "";
                    //    FileAutorizacionset.SaveAs(Server.MapPath("~/") + iautorizacionset);

                    //}
                    //if (FileUsodesuelo.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "UsoDeSuelo" + folio.Text + System.IO.Path.GetExtension(FileUsodesuelo.FileName);
                    //    iusodesuelo = "uploads/" + fileName + "";
                    //    FileUsodesuelo.SaveAs(Server.MapPath("~/") + iusodesuelo);

                    //}
                    //if (FileProcesoLimpieza.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "ProcesoLimpieza" + folio.Text + System.IO.Path.GetExtension(FileProcesoLimpieza.FileName);
                    //    iprocesolimpieza = "uploads/" + fileName + "";
                    //    FileProcesoLimpieza.SaveAs(Server.MapPath("~/") + iprocesolimpieza);

                    //}
                    //if (FileRelacionTipo.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "RelaciónTipoAnálisis" + folio.Text + System.IO.Path.GetExtension(FileRelacionTipo.FileName);
                    //    irelaciontipoanalisis = "uploads/" + fileName + "";
                    //    FileRelacionTipo.SaveAs(Server.MapPath("~/") + irelaciontipoanalisis);

                    //}
                    //if (FileActadeVerificacion.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "ActadeVerificación" + folio.Text + System.IO.Path.GetExtension(FileActadeVerificacion.FileName);
                    //    iactaverificacion = "uploads/" + fileName + "";
                    //    FileActadeVerificacion.SaveAs(Server.MapPath("~/") + iactaverificacion);

                    //}
                    //if (FileDictamenDocumental.HasFile)
                    //{
                    //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                    //    string fileName = "DicDocumental" + folio.Text + System.IO.Path.GetExtension(FileDictamenDocumental.FileName);
                    //    idicdoc = "uploads/" + fileName + "";
                    //    FileDictamenDocumental.SaveAs(Server.MapPath("~/") + idicdoc);

                    //}
                }
                Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
                {
                    //Rui = txtRui.Text.ToUpper(),
                    Statos = a,
                    iSOLLICSAN = isollicsan,
                    iSOLICITUD = isolicitud,
                    iTITUTLO = ititulo,
                    iCEDULA = icedula,
                    iDIPLOMA = idiploma,
                    iCURRICULUM = icurriculum,
                    iFOTOGRAFIAS = ifotografias,
                    iPAGORESPONSABLE = ipagoresponsable,
                    iALTASAT = ialtasat,
                    iPLANOMEMORIA = iplanomemoria,
                    iRELACIONMATERIAL = irelacionmaterial,
                    iPAGO = ipago,
                    iPROGRAMAACT = iprogramaact,
                    iFOTOCOPIACONVENIO = ifotocopiaconvenio,
                    iLIBROREGISTRO = ilibroregistro,
                    iDESCRIPCIONTECNICAEMBAL = idescripciontecnicaembal,
                    iTARJETADECONTROL = itarjetadecontrol,
                    iCARTACONSENTIMIENTO = icartaconsentimiento,
                    iACTACONSTITUTIVA = iactaconstitutiva,
                    iREGLAMENTOINTERNO = ireglamentointerno,
                    iVISTOPROTECCIONCIVIL = ivistoproteccioncivil,
                    iRELACIONPERSONAL = irelacionpersonal,
                    iAUTORIZACIONDIF = iautorizaciondif,
                    iCEDULAAUTOEVALUACION = icedulaautoevaluacion,
                    iPAPELMEMBRETADO = ipapelmembretado,
                    iAUTORIZACIONSET = iautorizacionset,
                    iUSODESUELO = iusodesuelo,
                    iPROCESOLIMPIEZA = iprocesolimpieza,
                    iRELACIONTIPOANALISIS = irelaciontipoanalisis,
                    iACTAVERIFICACION = iactaverificacion,

                    iAVISOFUNC = iavisofunc,
                    iDOCTECATMEDHOSP = idoctecatmedhosp,
                    iPROGRAMAMEDICO = iprogramamedico,
                    iCARACTERISTICASMECANICAS = icaracteristicasmecanicas,
                    iFOTOGRAFIASDEUNIDAD = ifotografiasdeunidad,
                    iLICENCIASANITARIAANTERIOR = ilicenciasanitariaanterior,
                    iAUTORIZACIONRESPONSABLEANTERIOR = iautorizacionresponsableanterior,
                    iANTECEDENTESNOPENALES = iantecedentesnopenales,
                    iPOLIZASEGURO = ipolizaseguro,
                    iPROGRAMAALIMENTACION = iprogramaalimentacion,


                    iTITULO_MR = ititulo_MR,
                    iCEDULA_MR = icedula_MR,
                    iDIPLOMA_MR = idiploma_MR,
                    iCURRICULUM_MR = icurriculum_MR,
                    iRELACIONPERSONAL_PARAMEDICO = irelacionpersonal_paramedico,
                    iDOCUMENTACION_LABORATORIO = idocumentacion_laboratorio,
                    iCOPIALICENCIA_MATRIZ = icopialicencia_matriz,
                    iCOPIAAUTORIZACION_MATRIZ = icopiaautorizacion_matriz,
                    iDOCUMENTACION_TECNICO = idocumentacion_tecnico,
                    iDOCUMENTACION_RESPONSABLE = idocumentacion_responsable,
                    iFORMALIMPIEZA = iformalimpieza,

                    iDICTEC = idictec,
                    iDIDOC = idicdoc,
                    iACTA = iacta,
                    iACUSEFINAL = iacusefinal,

                };


                SqlConnection cna = new SqlConnection();
                cna.ConnectionString = Principal.CnnStr0;
                cna.Open();
                //SqlCommand cmda = new SqlCommand(" Insert Into bitaseg.imgchar (folio) values ('" + folio.Text + "')");
                SqlCommand cma = new SqlCommand("UPDATE bitaseg.tramites SET rechazo = (('" + txtrechazo.Text + "'))  where folio = ('" + folio.Text + "') ");

                cma.Connection = cna;
                cma.ExecuteNonQuery();
                cna.Close();


                if (tramite.Digitalizar())
                { Response.Redirect("lueas.aspx"); }
            }
            catch (Exception Ex)
            {
                LblMsg.Text = Ex.Message;
                Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");

            }
           
        //}
        //else { Response.Write("<script>alert('Favor de subir la evaluación documental')</script>"); }
    }
    protected void btnPrevision_Click(object sender, EventArgs e)
    {
        //if (chkDictamenDocumental.Checked == true)
        //{
            try
            {
                //string isollicsan = "";
                //string isolicitud = "";
                //string ititulo = "";
                //string icedula = "";
                //string idiploma = "";
                //string icurriculum = "";
                //string ifotografias = "";
                //string ipagoresponsable = "";
                //string ialtasat = "";
                //string iplanomemoria = "";
                //string irelacionmaterial = "";
                //string ipago = "";
                //string iprogramaact = "";
                //string ifotocopiaconvenio = "";
                //string ilibroregistro = "";
                //string idescripciontecnicaembal = "";
                //string itarjetadecontrol = "";
                //string icartaconsentimiento = "";
                //string iactaconstitutiva = "";
                //string ireglamentointerno = "";
                //string ivistoproteccioncivil = "";
                //string irelacionpersonal = "";
                //string iautorizaciondif = "";
                //string icedulaautoevaluacion = "";
                //string ipapelmembretado = "";
                //string iautorizacionset = "";
                //string iusodesuelo = "";
                //string iprocesolimpieza = "";
                //string irelaciontipoanalisis = "";
                //string iactaverificacion = "";

                //string idicdoc = "";
                //string idictec = "";
                //string iacta = "";
                //string iacusefinal = "";
                int a=0;




                switch (statos.Text)
                {
                    case "31":
                        a = 43;
                        break;
                    case "18":
                    case "34":
                        a = 21;
                        break;
                    case "1":
                    case "4":
                    case "32":
                    case "33":
                        a = 4;
                        break;
                    case "1001":
                    case "1029":
                        a = 1030;
                        break;

                    case "1027":
                        a = 1036;
                        break;
                    default:
                        a = 0;
                        break;
                }





                //if (FileSolLicSan.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "SolLicSan" + folio.Text + System.IO.Path.GetExtension(FileSolLicSan.FileName);
                //    //FileSolLicSan.SaveAs(Server.MapPath("~/uploads/") + fileName);
                //    isollicsan = "uploads/" + fileName + "";
                //    FileSolicitud.SaveAs(Server.MapPath("~/") + isollicsan);
                //}
                //if (FileSolicitud.HasFile)
                //{

                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Solicitud" + folio.Text + System.IO.Path.GetExtension(FileSolicitud.FileName);
                //    //FileSolicitud.SaveAs(Server.MapPath("~/uploads/") + fileName);
                //    isolicitud = "uploads/" + fileName + "";
                //    FileSolicitud.SaveAs(Server.MapPath("~/") + isolicitud);



                //}
                //if (FileTitulo.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Titulo" + folio.Text + System.IO.Path.GetExtension(FileTitulo.FileName);
                //    //FileTitulo.SaveAs(Server.MapPath("~/uploads/") + fileName);
                //    ititulo = "uploads/" + fileName + "";
                //    FileTitulo.SaveAs(Server.MapPath("~/") + ititulo);
                //}
                //if (FileCedula.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Cedula" + folio.Text + System.IO.Path.GetExtension(FileCedula.FileName);
                //    icedula = "uploads/" + fileName + "";
                //    FileCedula.SaveAs(Server.MapPath("~/") + icedula);

                //}
                //if (FileDiploma.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Diploma" + folio.Text + System.IO.Path.GetExtension(FileDiploma.FileName);
                //    idiploma = "uploads/" + fileName + "";
                //    FileDiploma.SaveAs(Server.MapPath("~/") + idiploma);

                //}
                //if (FileCurriculum.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Curriculum" + folio.Text + System.IO.Path.GetExtension(FileCurriculum.FileName);
                //    icurriculum = "uploads/" + fileName + "";
                //    FileCurriculum.SaveAs(Server.MapPath("~/") + icurriculum);

                //}
                //if (FileFotografias.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Fotografias" + folio.Text + System.IO.Path.GetExtension(FileFotografias.FileName);
                //    ifotografias = "uploads/" + fileName + "";
                //    FileFotografias.SaveAs(Server.MapPath("~/") + ifotografias);

                //}
                //if (FilePagoresponsable.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "PagoDelResponsable" + folio.Text + System.IO.Path.GetExtension(FilePagoresponsable.FileName);
                //    ipagoresponsable = "uploads/" + fileName + "";
                //    FilePagoresponsable.SaveAs(Server.MapPath("~/") + ipagoresponsable);

                //}
                //if (FileAlta.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "AltaSAT" + folio.Text + System.IO.Path.GetExtension(FileAlta.FileName);
                //    ialtasat = "uploads/" + fileName + "";
                //    FileAlta.SaveAs(Server.MapPath("~/") + ialtasat);

                //}
                //if (FilePlanoMemoria.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "PlanoMemoria" + folio.Text + System.IO.Path.GetExtension(FilePlanoMemoria.FileName);
                //    iplanomemoria = "uploads/" + fileName + "";
                //    FilePlanoMemoria.SaveAs(Server.MapPath("~/") + iplanomemoria);

                //}
                //if (FileRelacionMaterialEquipo.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "RelacionMaterialEquipo" + folio.Text + System.IO.Path.GetExtension(FileRelacionMaterialEquipo.FileName);
                //    irelacionmaterial = "uploads/" + fileName + "";
                //    FileRelacionMaterialEquipo.SaveAs(Server.MapPath("~/") + irelacionmaterial);

                //}
                //if (FilePago.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "Pago" + folio.Text + System.IO.Path.GetExtension(FilePago.FileName);
                //    ipago = "uploads/" + fileName + "";
                //    FilePago.SaveAs(Server.MapPath("~/") + ipago);

                //}
                //if (FileProgramaact.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "ProgramadeActividades" + folio.Text + System.IO.Path.GetExtension(FileProgramaact.FileName);
                //    iprogramaact = "uploads/" + fileName + "";
                //    FileProgramaact.SaveAs(Server.MapPath("~/") + iprogramaact);

                //}
                //if (FileFotocopiaconvenio.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "FotocopiaConvenio" + folio.Text + System.IO.Path.GetExtension(FileFotocopiaconvenio.FileName);
                //    ifotocopiaconvenio = "uploads/" + fileName + "";
                //    FileFotocopiaconvenio.SaveAs(Server.MapPath("~/") + ifotocopiaconvenio);

                //}
                //if (FileLibroRegistro.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "LibroRegistro" + folio.Text + System.IO.Path.GetExtension(FileLibroRegistro.FileName);
                //    ilibroregistro = "uploads/" + fileName + "";
                //    FileLibroRegistro.SaveAs(Server.MapPath("~/") + ilibroregistro);

                //}
                //if (FileDescripcionTecnica.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "TecnicaEmbalsamamiento" + folio.Text + System.IO.Path.GetExtension(FileDescripcionTecnica.FileName);
                //    idescripciontecnicaembal = "uploads/" + fileName + "";
                //    FileDescripcionTecnica.SaveAs(Server.MapPath("~/") + idescripciontecnicaembal);

                //}
                //if (FileTarjetadecontrol.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "TarjetadeControl" + folio.Text + System.IO.Path.GetExtension(FileTarjetadecontrol.FileName);
                //    itarjetadecontrol = "uploads/" + fileName + "";
                //    FileTarjetadecontrol.SaveAs(Server.MapPath("~/") + itarjetadecontrol);

                //}
                //if (FileCartaConsentimiento.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "CartaConsentimiento" + folio.Text + System.IO.Path.GetExtension(FileCartaConsentimiento.FileName);
                //    icartaconsentimiento = "uploads/" + fileName + "";
                //    FileCartaConsentimiento.SaveAs(Server.MapPath("~/") + icartaconsentimiento);

                //}
                //if (FileActaConstitutiva.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "ActaConstitutiva" + folio.Text + System.IO.Path.GetExtension(FileActaConstitutiva.FileName);
                //    iactaconstitutiva = "uploads/" + fileName + "";
                //    FileActaConstitutiva.SaveAs(Server.MapPath("~/") + iactaconstitutiva);

                //}
                //if (FileReglamentointerno.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "ReglamentoInterno" + folio.Text + System.IO.Path.GetExtension(FileReglamentointerno.FileName);
                //    ireglamentointerno = "uploads/" + fileName + "";
                //    FileReglamentointerno.SaveAs(Server.MapPath("~/") + ireglamentointerno);

                //}
                //if (FileVistobueno.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "ProteccionCivil" + folio.Text + System.IO.Path.GetExtension(FileVistobueno.FileName);
                //    ivistoproteccioncivil = "uploads/" + fileName + "";
                //    FileVistobueno.SaveAs(Server.MapPath("~/") + ivistoproteccioncivil);

                //}
                //if (FileRelacionpersonal.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "RelacionPersonal" + folio.Text + System.IO.Path.GetExtension(FileRelacionpersonal.FileName);
                //    irelacionpersonal = "uploads/" + fileName + "";
                //    FileRelacionpersonal.SaveAs(Server.MapPath("~/") + irelacionpersonal);

                //}
                //if (FileAutorizaciondif.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "AutorizaciónDIF" + folio.Text + System.IO.Path.GetExtension(FileAutorizaciondif.FileName);
                //    iautorizaciondif = "uploads/" + fileName + "";
                //    FileAutorizaciondif.SaveAs(Server.MapPath("~/") + iautorizaciondif);

                //}
                //if (FileCedulaAutoeval.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "CedulaAutoevaluación" + folio.Text + System.IO.Path.GetExtension(FileCedulaAutoeval.FileName);
                //    icedulaautoevaluacion = "uploads/" + fileName + "";
                //    FileCedulaAutoeval.SaveAs(Server.MapPath("~/") + icedulaautoevaluacion);

                //}
                //if (FilePapelMembretado.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "PapelMembretado" + folio.Text + System.IO.Path.GetExtension(FilePapelMembretado.FileName);
                //    ipapelmembretado = "uploads/" + fileName + "";
                //    FilePapelMembretado.SaveAs(Server.MapPath("~/") + ipapelmembretado);

                //}
                //if (FileAutorizacionset.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "AutorizaciónSET" + folio.Text + System.IO.Path.GetExtension(FileAutorizacionset.FileName);
                //    iautorizacionset = "uploads/" + fileName + "";
                //    FileAutorizacionset.SaveAs(Server.MapPath("~/") + iautorizacionset);

                //}
                //if (FileUsodesuelo.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "UsoDeSuelo" + folio.Text + System.IO.Path.GetExtension(FileUsodesuelo.FileName);
                //    iusodesuelo = "uploads/" + fileName + "";
                //    FileUsodesuelo.SaveAs(Server.MapPath("~/") + iusodesuelo);

                //}
                //if (FileProcesoLimpieza.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "ProcesoLimpieza" + folio.Text + System.IO.Path.GetExtension(FileProcesoLimpieza.FileName);
                //    iprocesolimpieza = "uploads/" + fileName + "";
                //    FileProcesoLimpieza.SaveAs(Server.MapPath("~/") + iprocesolimpieza);

                //}
                //if (FileRelacionTipo.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "RelaciónTipoAnálisis" + folio.Text + System.IO.Path.GetExtension(FileRelacionTipo.FileName);
                //    irelaciontipoanalisis = "uploads/" + fileName + "";
                //    FileRelacionTipo.SaveAs(Server.MapPath("~/") + irelaciontipoanalisis);

                //}
                //if (FileActadeVerificacion.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "ActadeVerificación" + folio.Text + System.IO.Path.GetExtension(FileActadeVerificacion.FileName);
                //    iactaverificacion = "uploads/" + fileName + "";
                //    FileActadeVerificacion.SaveAs(Server.MapPath("~/") + iactaverificacion);

                //}
                //if (FileDictamenDocumental.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "DicDocumental" + folio.Text + System.IO.Path.GetExtension(FileDictamenDocumental.FileName);
                //    idicdoc = "uploads/" + fileName + "";
                //    FileDictamenDocumental.SaveAs(Server.MapPath("~/") + idicdoc);

                //}


                //if (fileAcuse.HasFile)
                //{
                //    string Hoy = DateTime.Now.ToString("dd-MM-yyyy H-mm-ss");
                //    string fileName = "AcuseFinal" + folio.Text + System.IO.Path.GetExtension(fileAcuse.FileName);
                //    iacusefinal = "uploads/" + fileName + "";
                //    fileAcuse.SaveAs(Server.MapPath("~/") + iacusefinal);

                //}

                Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
                {
                    //Rui = txtRui.Text.ToUpper(),
                    Statos = a,
                    //iSOLLICSAN = isollicsan,
                    //iSOLICITUD = isolicitud,
                    //iTITUTLO = ititulo,
                    //iCEDULA = icedula,
                    //iDIPLOMA = idiploma,
                    //iCURRICULUM = icurriculum,
                    //iFOTOGRAFIAS = ifotografias,
                    //iPAGORESPONSABLE = ipagoresponsable,
                    //iALTASAT = ialtasat,
                    //iPLANOMEMORIA = iplanomemoria,
                    //iRELACIONMATERIAL = irelacionmaterial,
                    //iPAGO = ipago,
                    //iPROGRAMAACT = iprogramaact,
                    //iFOTOCOPIACONVENIO = ifotocopiaconvenio,
                    //iLIBROREGISTRO = ilibroregistro,
                    //iDESCRIPCIONTECNICAEMBAL = idescripciontecnicaembal,
                    //iTARJETADECONTROL = itarjetadecontrol,
                    //iCARTACONSENTIMIENTO = icartaconsentimiento,
                    //iACTACONSTITUTIVA = iactaconstitutiva,
                    //iREGLAMENTOINTERNO = ireglamentointerno,
                    //iVISTOPROTECCIONCIVIL = ivistoproteccioncivil,
                    //iRELACIONPERSONAL = irelacionpersonal,
                    //iAUTORIZACIONDIF = iautorizaciondif,
                    //iCEDULAAUTOEVALUACION = icedulaautoevaluacion,
                    //iPAPELMEMBRETADO = ipapelmembretado,
                    //iAUTORIZACIONSET = iautorizacionset,
                    //iUSODESUELO = iusodesuelo,
                    //iPROCESOLIMPIEZA = iprocesolimpieza,
                    //iRELACIONTIPOANALISIS = irelaciontipoanalisis,
                    //iACTAVERIFICACION = iactaverificacion,

                    //iDICTEC = idictec,
                    //iDIDOC = idicdoc,
                    //iACTA = iacta,
                    //iACUSEFINAL = iacusefinal,

                };

                if (tramite.Digitalizar())
                { Response.Redirect("lueas.aspx"); }
            }
            catch (Exception Ex)
            {
                LblMsg.Text = Ex.Message;
                Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");

            }
               
        //} 
        //else { Response.Write("<script>alert('Favor de subir la evaluación documental')</script>"); }
    }
        

    [System.Web.Services.WebMethod]
    public static string InitialPreview(int folio)
    {
        Tramites p = new Tramites(folio);

        return new JavaScriptSerializer().Serialize(p.InitialPreview());
    }

}