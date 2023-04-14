<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="Salud.Tamaulipas" %>
<%

    try
    {
        //Crear directorio
        string path = Server.MapPath(String.Format("~/uploads/{0}/{1}", Request.Params["tipo"], Request.Form["id"]));
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        string fileName = "";
        string fileExt = "";
        JSonFileInput fileInputRes = new JSonFileInput();
        List<string> ip = new List<string>();
        List<InitialPreviewConfig> ipc = new List<InitialPreviewConfig>();
        int id_folio = Convert.ToInt32(Request.Form["id"]);
        //Grabar archivo

        if (Request.Files.Count > 0)
        {
            HttpFileCollection files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {

                HttpPostedFile file = files[i];
                int fileSize = file.ContentLength;
                fileName = string.Format("uploads/{0}/{1}/{2}{3}{4}", Request.Params["tipo"], Request.Form["id"], Request.Params["nombrearchivo"], Request.Form["id"], Path.GetExtension(file.FileName));
                string fname = Server.MapPath("~/" + fileName);
                //Borrar existente
                if (File.Exists(fname))
                {
                    File.Delete(fname);
                }
                file.SaveAs(fname);
                fileExt = Path.GetExtension(file.FileName).ToLower();

                byte[] imgData = File.ReadAllBytes(fname);

                string tipo = "";

                if ((fileExt == ".jpg") || (fileExt == ".gif") || (fileExt == ".png") || (fileExt == ".jpeg"))
                {
                    tipo = "image";
                }
                else if (fileExt == ".pdf") { tipo = "pdf"; }
                else if (fileExt == ".txt") { tipo = "text"; }
                else if ((fileExt == ".doc") || (fileExt == ".docx") || (fileExt == ".xls") || (fileExt == ".xlsx") || (fileExt == ".ppt") || (fileExt == ".pptx")) { tipo = "html"; }
                else { tipo = "html"; }
                if (tipo == "html") { ip.Add(String.Format("{0}<br /> <strong>VISTA PREVIA NO SOPORTADA</strong>", file.FileName)); }
                else { ip.Add(Strings.GetUrl(string.Format("{0}", fileName), this)); }

                //string open_url = String.Format("<a href='../{0}' class='btn btn-secondary btn-sm' target='_blank' alt='Descargar'><i class='fa fa-download'></i></a>", "BitacoraDeSeguimiento/" + fileName);
                //ipc.Add(new InitialPreviewConfig()
                //{
                //    caption = open_url,
                //    size = fileSize,
                //    url = Strings.GetUrl(String.Format("comun/archivo-eliminar.aspx?tipo={0}", Request.Params["tipo"]), this),
                //    key = id_folio,
                //    type = tipo
                //});
            }


            //fileInputRes = new JSonFileInput()
            //{
            //    initialPreview = ip.ToArray(),
            //    append = true,
            //    initialPreviewConfig = ipc.ToArray()
            //};



            var isollicsan = ""; if (Request.Params["nombrearchivo"] == "SolLicSan") { isollicsan = fileName; }
            var isolicitud = ""; if (Request.Params["nombrearchivo"] == "Solicitud") { isolicitud = fileName; }
            var ititulo = ""; if (Request.Params["nombrearchivo"] == "Titulo") { ititulo = fileName; }
            var icedula = ""; if (Request.Params["nombrearchivo"] == "Cedula") { icedula = fileName; }
            var idiploma = ""; if (Request.Params["nombrearchivo"] == "Diploma") { idiploma = fileName; }
            var icurriculum = ""; if (Request.Params["nombrearchivo"] == "Curriculum") { icurriculum = fileName; }
            var ifotografias = ""; if (Request.Params["nombrearchivo"] == "Fotografias") { ifotografias = fileName; }
            var ipagoresponsable = ""; if (Request.Params["nombrearchivo"] == "PagoDelResponsable") { ipagoresponsable = fileName; }
            var ialtasat = ""; if (Request.Params["nombrearchivo"] == "AltaSAT") { ialtasat = fileName; }
            var iplanomemoria = ""; if (Request.Params["nombrearchivo"] == "PlanoMemoria") { iplanomemoria = fileName; }
            var irelacionmaterial = ""; if (Request.Params["nombrearchivo"] == "RelacionMaterialEquipo") { irelacionmaterial = fileName; }
            var ipago = ""; if (Request.Params["nombrearchivo"] == "Pago") { ipago = fileName; }
            var iprogramaact = ""; if (Request.Params["nombrearchivo"] == "ProgramadeActividades") { iprogramaact = fileName; }
            var ifotocopiaconvenio = ""; if (Request.Params["nombrearchivo"] == "FotocopiaConvenio") { ifotocopiaconvenio = fileName; }
            var ilibroregistro = ""; if (Request.Params["nombrearchivo"] == "LibroRegistro") { ilibroregistro = fileName; }
            var idescripciontecnicaembal = ""; if (Request.Params["nombrearchivo"] == "TecnicaEmbalsamamiento") { idescripciontecnicaembal = fileName; }
            var itarjetadecontrol = ""; if (Request.Params["nombrearchivo"] == "TarjetadeControl") { itarjetadecontrol = fileName; }
            var icartaconsentimiento = ""; if (Request.Params["nombrearchivo"] == "CartaConsentimiento") { icartaconsentimiento = fileName; }
            var iactaconstitutiva = ""; if (Request.Params["nombrearchivo"] == "ActaConstitutiva") { iactaconstitutiva = fileName; }
            var ireglamentointerno = ""; if (Request.Params["nombrearchivo"] == "ReglamentoInterno") { ireglamentointerno = fileName; }
            var ivistoproteccioncivil = ""; if (Request.Params["nombrearchivo"] == "ProteccionCivil") { ivistoproteccioncivil = fileName; }
            var irelacionpersonal = ""; if (Request.Params["nombrearchivo"] == "RelacionPersonal") { irelacionpersonal = fileName; }
            var iautorizaciondif = ""; if (Request.Params["nombrearchivo"] == "AutorizaciónDIF") { iautorizaciondif = fileName; }
            var icedulaautoevaluacion = ""; if (Request.Params["nombrearchivo"] == "CedulaAutoevaluación") { icedulaautoevaluacion = fileName; }
            var ipapelmembretado = ""; if (Request.Params["nombrearchivo"] == "PapelMembretado") { ipapelmembretado = fileName; }
            var iautorizacionset = ""; if (Request.Params["nombrearchivo"] == "AutorizaciónSET") { iautorizacionset = fileName; }
            var iusodesuelo = ""; if (Request.Params["nombrearchivo"] == "UsoDeSuelo") { iusodesuelo = fileName; }
            var iprocesolimpieza = ""; if (Request.Params["nombrearchivo"] == "ProcesoLimpieza") { iprocesolimpieza = fileName; }
            var irelaciontipoanalisis = ""; if (Request.Params["nombrearchivo"] == "RelaciónTipoAnálisis") { irelaciontipoanalisis = fileName; }
            var iactaverificacion = ""; if (Request.Params["nombrearchivo"] == "ActadeVerificación") { iactaverificacion = fileName; }
            var iavisodefuncionamiento = ""; if (Request.Params["nombrearchivo"] == "AvisodeFunc") { iavisodefuncionamiento = fileName; }


            var idoctecatmedhosp = ""; if (Request.Params["nombrearchivo"] == "DocTecatmedhosp") { idoctecatmedhosp = fileName; };
            var iprogramamedico = ""; if (Request.Params["nombrearchivo"] == "ProgramaMedico") { iprogramamedico = fileName; }
            var icaracteristicasmecanicas = ""; if (Request.Params["nombrearchivo"] == "CaracteristicasMecanicas") { icaracteristicasmecanicas = fileName; }
            var ifotografiasdeunidad = ""; if (Request.Params["nombrearchivo"] == "FotografiasdeUnidad") { ifotografiasdeunidad = fileName; }
            var ilicenciasanitariaanterior = ""; if (Request.Params["nombrearchivo"] == "LicSanAnterior") { ilicenciasanitariaanterior = fileName; }
            var iautorizacionresponsableanterior =""; if (Request.Params["nombrearchivo"] == "AutorizacionResponsableAnterior") { iautorizacionresponsableanterior = fileName; }
            var iantecedentesnopenales = ""; if (Request.Params["nombrearchivo"] == "AntecedentesNoPenales") { iantecedentesnopenales = fileName; }
            var ipolizaseguro = ""; if (Request.Params["nombrearchivo"] == "PolizaSeguro") { ipolizaseguro = fileName; }
            var iprogramaalimentacion = ""; if (Request.Params["nombrearchivo"] == "ProgramaAlimentacion") { iprogramaalimentacion = fileName; }


            var ititulo_MR = ""; if (Request.Params["nombrearchivo"] == "Titulo_MR") { ititulo_MR = fileName; }
            var icedula_MR = ""; if (Request.Params["nombrearchivo"] == "Cedula_MR") { icedula_MR = fileName; }
            var idiploma_MR = ""; if (Request.Params["nombrearchivo"] == "Diploma_MR") { idiploma_MR = fileName; }
            var icurriculum_MR = ""; if (Request.Params["nombrearchivo"] == "Curriculum_MR") { icurriculum_MR = fileName; }
            var irelacionpersonal_paramedico = ""; if (Request.Params["nombrearchivo"] == "RelacionPersonalParamedico") { irelacionpersonal_paramedico = fileName; }
            var idocumentacion_laboratorio = ""; if (Request.Params["nombrearchivo"] == "Documentacion_Laboratorio") { idocumentacion_laboratorio = fileName; }
            var icopialicencia_matriz = ""; if (Request.Params["nombrearchivo"] == "CopiaLicencia_Matriz") { icopialicencia_matriz = fileName; }
            var icopiaautorizacion_matriz = ""; if (Request.Params["nombrearchivo"] == "CopiaAutorizacion_Matriz") { icopiaautorizacion_matriz = fileName; }
            var idocumentacion_tecnico = ""; if (Request.Params["nombrearchivo"] == "Documentacion_Tecnico") { idocumentacion_tecnico = fileName; }
            var idocumentacion_responsable = ""; if (Request.Params["nombrearchivo"] == "Documentacion_Responsable") { idocumentacion_responsable = fileName; }
            var iformalimpieza = ""; if (Request.Params["nombrearchivo"] == "FormaLimpieza") { iformalimpieza = fileName; }

            var iprevencion = ""; if (Request.Params["nombrearchivo"] == "Prevencion") { iprevencion = fileName; }
            var idictec = ""; if (Request.Params["nombrearchivo"] == "DicTecnico") { idictec = fileName; }
            var idicdoc = ""; if (Request.Params["nombrearchivo"] == "DicDocumental") { idicdoc = fileName; }
            var iacta = ""; if (Request.Params["nombrearchivo"] == "ActaVerifUOS") { iacta = fileName; }
            var iacusefinal = ""; if (Request.Params["nombrearchivo"] == "AcuseFinal") { iacusefinal = fileName; }


            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
            {

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
                iAVISOFUNC=iavisodefuncionamiento,


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


                iPREVENCION = iprevencion,
                iDICTEC = idictec,
                iDIDOC = idicdoc,
                iACTA = iacta,
                iACUSEFINAL = iacusefinal,

            };
            tramite.newFileupload();
        }
        else { Response.Write("{}"); }

        //Para mostrar
        //http://plugins.krajee.com/file-input-ajax-demo/5
        string response = new JavaScriptSerializer().Serialize(fileInputRes);
        string respuesta = "{}";
        // Response.Write(String.Format("{{ }}"));
        Response.Write(String.Format("{0}", respuesta));
    }
    catch (Exception ex) { Response.Write(String.Format("{{ {0} }}", ex.Message)); }

%>