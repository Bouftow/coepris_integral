using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public class Tramites
{
    public Tramites()
    {

    }
    public Tramites(int prmFolio)
    {
        try
        {
            folio = prmFolio;
            MostrarDatos();
            MostrarIMG();
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }

    bool requiereverificacion = false;
    public bool RequiereVerificacion
    {
        get { return requiereverificacion; }
        set { requiereverificacion = value; }
    }


    #region Variables
    int numerocoordinacion = 0;
    string reguser = "";

    int folio = 0;
    int statos = 0;
    string requerimientos = "";
    int id_tramite = 0;
    int categoria = 0;
    int riesgo = 0;
    int modalidad = 0;
    int verificacion = 0;
    int foliolicencia = 0;

    static TimeSpan dias = new TimeSpan(60, 0, 0, 0);
    static DateTime hoy = DateTime.Now;
    DateTime fecha_lim = hoy + dias;
    //Boolean cumple;
    DateTime fecha_reg = DateTime.Now;
    int id_persona = 0;
    string rui = "";
    string certificado_anterior = "";
    string observaciones = "";
    string obdos = "";
    string obdeas = "";
    string rechazo = "";

    //PERSONAS
    string curp = "";
    string nombre = "";
    string apellidop = "";
    string apellidom = "";
    string telfij = "";
    string telmov = "";
    string correo = "";
    string rfc_prop = "";
    string user_login = "";
    DateTime fecha_reg_per = DateTime.Now;


    //ESTABLECIMIENTO
    int id_establecimiento = 0;
    string rfc = "";
    string razonsocial = "";
    string nombreest = "";
    string giro = "";
    string municipio = "";
    string localidad = "";
    string colonia = "";
    string calle = "";
    string referencias = "";
    string numero = "";  
    string cp = "";
    string correoest = "";
    string telest = "";
    string est_dias_laborales = "";
    string hest1 = "00:00-00:00|2=00:00-00:00|3=00:00-00:00|4=00:00-00:00|5=00:00-00:00|6=00:00-00:00|7=00:00-00:00";
    string hest2 = "00:00-00:00|2=00:00-00:00|3=00:00-00:00|4=00:00-00:00|5=00:00-00:00|6=00:00-00:00|7=00:00-00:00";


    DateTime fecha_reg_est = DateTime.Now;
    DateTime fecha_act_status = DateTime.Now;

    //RESPONSABLE SANITARIO
    int id_responsable = 0;
    string rnombre = "";
    string rapellidop = "";
    string rapellidom = "";
    string rgrado = "";
    string rcedula = "";
    string horario  = "";

    string r_dias_laborales = "";
    string hr1 = "";
    string hr2 = "";
    string rfc_r = "";

    DateTime fecha_reg_resp = DateTime.Now;


    //CORRESPONDENCIA
    string quienrecibio = "";
    string numerodeguia = "";
    string entregado = "";


    #endregion
    #region Variables IMG Req
    string sol = "";
    string tit = "";
    string ced = "";
    string dip = "";
    string curr = "";
    string prog = "";
    string rel = "";
    string plano = "";
    string alt = "";
    string papel = "";
    string form = "";
    string cop = "";
    string lic = "";
    string dicdoc = "";
    string dictec = "";
    string acta = "";
    #endregion
    #region Variables Usuarios
    int id_usuario = 0;
    bool cis = false;
    bool ueas = false;
    bool coor = false;
    bool uos = false;
    bool dictaminador = false;
    bool dos = false;
    bool dds = false;
    bool deas = false;
    bool das = false;
    bool corr = false;
    bool rech = false;
    bool entr = false;
    #endregion
    #region Variables Requisitos
    bool sollicsan = false;
    bool solicitud = false;
    bool titulo = false;
    bool cedula = false;
    bool diploma = false;
    bool curriculum = false;
    bool fotografias = false;
    bool pagoresponsable = false;
    bool altasat = false;
    bool planomemoria = false;
    bool relacionmaterial = false;
    bool pago = false;
    bool programaact = false;
    bool fotocopiaconvenio = false;
    bool libroregistro = false;
    bool descripciontecnicaembal = false;
    bool tarjetadecontrol = false;
    bool cartaconsentimiento = false;
    bool actaconstitutiva = false;
    bool reglamentointerno = false;
    bool vistoproteccioncivil = false;
    bool relacionpersonal = false;
    bool autorizaciondif = false;
    bool cedulaautoevaluacion = false;
    bool papelmembretado = false;
    bool autorizacionset = false;
    bool usodesuelo = false;
    bool procesolimpieza = false;
    bool relaciontipoanalisis = false;
    bool actaverificacion = false;

    bool avisofunc = false;

    bool doctecatmedhosp = false;
    bool programamedico = false;
    bool caracteristicasmecanicas = false;
    bool fotografiasdeunidad = false;
    bool licenciasanitariaanterior = false;
    bool autorizacionresponsableanterior = false;

    bool antecedentesnopenales = false;
    bool polizaseguro = false;
    bool programaalimentacion = false;

    bool titulo_MR = false;
    bool cedula_MR = false;
    bool diploma_MR = false;
    bool curriculum_MR = false;
    bool relacionpersonal_paramedico = false;
    bool documentacion_laboratorio = false;
    bool copialicencia_matriz = false;
    bool copiaautorizacion_matriz = false;
    bool documentacion_tecnico = false;
    bool documentacion_responsable = false;
    bool formalimpieza = false;


    bool prevencion = false;
    bool dicdoccumple = false;
    bool dicteccumple = false;
    bool actacumple = false;
    bool acusefinalcumple = false;
    #endregion
    #region Variables requisitos imagen
    // Requisitos para Imagen
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


    string iprevencion = "";
    string idicdoc = "";
    string idictec = "";
    string iacta = "";
    string iacusefinal = "";
    #endregion
    #region Propiedades

    //USUARIO
  
    public string Reguser { get { return reguser; } set { reguser = value; } }

    //Personas
    public int Idpersona { get { return id_persona; } set { id_persona = value; } }
 
    public string Curp { get { return curp; } set { curp = value; } }
    public string RFC_Prop { get { return rfc_prop; } set { rfc_prop = value; } }
    public string Nombre { get { return nombre; } set { nombre = value; } }
    public string Apellidop { get { return apellidop; } set { apellidop = value; } }
    public string Apellidom { get { return apellidom; } set { apellidom = value; } }
    public string Telfij { get { return telfij; } set { telfij = value; } }
    public string Telmov { get { return telmov; } set { telmov = value; } }
    public string Correo { get { return correo; } set { correo = value; } }
    public DateTime FechaRegPer { get { return fecha_reg_per; } set { fecha_reg_per = value; } }
  

    //ESTABLECIMIENTO
    public int Idestablecimiento { get { return id_establecimiento; } set { id_establecimiento = value; } }
    public string Rfc { get { return rfc; } set { rfc = value; } }
    public string Razonsocial { get { return razonsocial; } set { razonsocial = value; } }
    public string Nombreest { get { return nombreest; } set { nombreest = value; } }
    public string Municipio { get { return municipio; } set { municipio = value; } }
    public string Colonia { get { return colonia; } set { colonia = value; } }
    public string Calle { get { return calle; } set { calle = value; } }
    public string Referencias { get { return referencias; } set { referencias = value; } }
    public string Numero { get { return numero; } set { numero = value; } }
    public DateTime FechaRegEst { get { return fecha_reg_est; } set { fecha_reg_est = value; } }
    public string Telest { get { return telest; } set { telest = value; } }
    public string Correoest { get { return correoest; } set { correoest = value; } }
    public string Giro { get { return giro; } set { giro = value; } }
    public string CP { get { return cp; } set { cp = value; } }
    public string Localidad { get { return localidad; } set { localidad = value; } }
    public string EstDiasLaborales { get { return est_dias_laborales; } set { est_dias_laborales = value; } }
    public string Hest1 { get { return hest1; } set { hest1 = value; } }
    public string Hest2 { get { return hest2; } set { hest2 = value; } }

    //RESPONSABLE SANITARIO
    public int Idresponsable { get { return id_responsable; } set { id_responsable = value; } }
    public string Rnombre { get { return rnombre; } set { rnombre = value; } }
    public string Rapellidop { get { return rapellidop; } set { rapellidop = value; } }
    public string Rapellidom { get { return rapellidom; } set { rapellidom = value; } }
    public string Rgrado { get { return rgrado; } set { rgrado = value; } }
    public string Rcedula { get { return rcedula; } set { rcedula = value; } }
    public string Horario { get { return horario; } set { horario = value; } }
    public string RDiasLaborales { get { return r_dias_laborales; } set { r_dias_laborales = value; } }
    public string Hr1 { get { return hr1; } set { hr1 = value; } }
    public string Hr2 { get { return hr2; } set { hr2 = value; } }
    public string Rfc_R { get { return rfc_r; } set { rfc_r = value; } }

    public DateTime FechaRegResp { get { return fecha_reg_resp; } set { fecha_reg_resp = value; } }


    //TRAMITE
    public int Folio { get { return folio; } set { folio = value; } }
    public int IdTramite { get { return id_tramite; } set { id_tramite = value; } }
    public int Categoria { get { return categoria; } set { categoria = value; } }
    public int Riesgo { get { return riesgo; } set { riesgo = value; } }
    public int Verificacion { get { return verificacion; } set { verificacion = value; } }
    public int Modalidad { get { return modalidad; } set { modalidad = value; } }
    public int Statos { get { return statos; } set { statos = value; } }
    public string Requerimientos { get { return requerimientos; } set { requerimientos = value; } }
    public DateTime FechaReg { get { return fecha_reg; } set { fecha_reg = value; } }
    public DateTime FechaLim { get { return fecha_lim; } set { fecha_lim = value; } }
    public DateTime FechaActStatus { get { return fecha_act_status; } set { fecha_act_status = value; } }
    public string Rui { get { return rui; } set { rui = value; } }
    public string CertificadoAnterior { get { return certificado_anterior; } set { certificado_anterior = value; } }
    public string Observaciones { get { return observaciones; } set { observaciones = value; } }
    public string OBDOS { get { return obdos; } set { obdos = value; } }
    public string OBDEAS { get { return obdeas; } set { obdeas = value; } }
    public int NumeroCoordinacion { get { return numerocoordinacion; } set { numerocoordinacion = value; } }
    public string Rechazo { get { return rechazo; } set { rechazo = value; } }
   
    public int Foliolicencia { get { return foliolicencia; } set { foliolicencia = value; } }


    //CORRESPONDENCIA
    public string Numerodeguia { get { return numerodeguia; } set { numerodeguia = value; } }
    public string Quienrecibio { get { return quienrecibio; } set { quienrecibio = value; } }
    public string Entregado { get { return entregado; } set { entregado = value; } }
       
    #endregion
    #region Propiedades Requisitos
    public bool SOLLICSAN { get { return sollicsan; } set { sollicsan = value; } }
    public bool SOLICITUD { get { return solicitud; } set { solicitud = value; } }
    public bool TITUTLO { get { return titulo; } set { titulo = value; } }
    public bool CEDULA { get { return cedula; } set { cedula = value; } }
    public bool DIPLOMA { get { return diploma; } set { diploma = value; } }
    public bool CURRICULUM { get { return curriculum; } set { curriculum = value; } }
    public bool FOTOGRAFIAS { get { return fotografias; } set { fotografias = value; } }
    public bool PAGORESPONSABLE { get { return pagoresponsable; } set { pagoresponsable = value; } }
    public bool ALTASAT { get { return altasat; } set { altasat = value; } }
    public bool PLANOMEMORIA { get { return planomemoria; } set { planomemoria = value; } }
    public bool RELACIONMATERIAL { get { return relacionmaterial; } set { relacionmaterial = value; } }
    public bool PAGO { get { return pago; } set { pago = value; } }
    public bool PROGRAMAACT { get { return programaact; } set { programaact = value; } }
    public bool FOTOCOPIACONVENIO { get { return fotocopiaconvenio; } set { fotocopiaconvenio = value; } }
    public bool LIBROREGISTRO { get { return libroregistro; } set { libroregistro = value; } }
    public bool DESCRIPCIONTECNICAEMBAL { get { return descripciontecnicaembal; } set { descripciontecnicaembal = value; } }
    public bool TARJETADECONTROL { get { return tarjetadecontrol; } set { tarjetadecontrol = value; } }
    public bool CARTACONSENTIMIENTO { get { return cartaconsentimiento; } set { cartaconsentimiento = value; } }
    public bool ACTACONSTITUTIVA { get { return actaconstitutiva; } set { actaconstitutiva = value; } }
    public bool REGLAMENTOINTERNO { get { return reglamentointerno; } set { reglamentointerno = value; } }
    public bool VISTOPROTECCIONCIVIL { get { return vistoproteccioncivil; } set { vistoproteccioncivil = value; } }
    public bool RELACIONPERSONAL { get { return relacionpersonal; } set { relacionpersonal = value; } }
    public bool AUTORIZACIONDIF { get { return autorizaciondif; } set { autorizaciondif = value; } }
    public bool CEDULAAUTOEVALUACION { get { return cedulaautoevaluacion; } set { cedulaautoevaluacion = value; } }
    public bool PAPELMEMBRETADO { get { return papelmembretado; } set { papelmembretado = value; } }
    public bool AUTORIZACIONSET { get { return autorizacionset; } set { autorizacionset = value; } }
    public bool USODESUELO { get { return usodesuelo; } set { usodesuelo = value; } }
    public bool PROCESOLIMPIEZA { get { return procesolimpieza; } set { procesolimpieza = value; } }
    public bool RELACIONTIPOANALISIS { get { return relaciontipoanalisis; } set { relaciontipoanalisis = value; } }
    public bool ACTAVERIFICACION { get { return relaciontipoanalisis; } set { actaverificacion = value; } }
    public bool AVISOFUNC { get { return avisofunc; } set { avisofunc = value; } }
    public bool DOCTECATMEDHOSP { get { return doctecatmedhosp; }  set { doctecatmedhosp = value; } }
    public bool PROGRAMAMEDICO { get {return programamedico; }  set { programamedico = value; }    }
    public bool CARACTERISTICASMECANICAS{ get { return caracteristicasmecanicas; } set { caracteristicasmecanicas = value; }}
    public bool FOTOGRAFIASDEUNIDAD {get { return fotografiasdeunidad; }set { fotografiasdeunidad = value; } }
    public bool LICENCIASANITARIAANTERIOR { get { return licenciasanitariaanterior; } set { licenciasanitariaanterior = value; } }
    public bool AUTORIZACIONRESPONSABLEANTERIOR
    {
        get { return autorizacionresponsableanterior; }
        set { autorizacionresponsableanterior = value; }
    }
    public bool ANTECEDENTESNOPENALES
    {
        get { return antecedentesnopenales; }
        set { antecedentesnopenales = value; }
    }
    public bool POLIZASEGURO
    {
        get { return polizaseguro; }
        set { polizaseguro = value; }
    }
    public bool PROGRAMAALIMENTACION
    {
        get { return programaalimentacion; }
        set { programaalimentacion = value; }
    }
    public bool TITULO_MR
    {
        get { return titulo_MR; }
        set { titulo_MR = value; }
    }

    public bool CEDULA_MR
    {
        get { return cedula_MR; }
        set { cedula_MR = value; }
    }
    public bool DIPLOMA_MR
    {
        get { return diploma_MR; }
        set { diploma_MR = value; }
    }
    public bool CURRICULUM_MR
    {
        get { return curriculum_MR; }
        set { curriculum_MR = value; }
    }
    public bool RELACIONPERSONAL_PARAMEDICO
    {
        get { return relacionpersonal_paramedico; }
        set { relacionpersonal_paramedico = value; }
    }
    public bool DOCUMENTACION_LABORATORIO
    {
        get { return documentacion_laboratorio; }
        set { documentacion_laboratorio = value; }
    }
    public bool COPIALICENCIA_MATRIZ
    {
        get { return copialicencia_matriz; }
        set { copialicencia_matriz = value; }
    }
    public bool COPIAAUTORIZACION_MATRIZ
    {
        get { return copiaautorizacion_matriz; }
        set { copiaautorizacion_matriz = value; }
    }
    public bool DOCUMENTACION_TECNICO
    {
        get { return documentacion_tecnico; }
        set { documentacion_tecnico = value; }
    }
    public bool DOCUMENTACION_RESPONSABLE
    {
        get { return documentacion_responsable; }
        set { documentacion_responsable = value; }
    }
    public bool FORMALIMPIEZA
    {
        get { return formalimpieza; }
        set { formalimpieza = value; }
    }
    //public bool DOCTECATMEDHOSP
    //{
    //    get { return doctecatmedhosp; }
    //    set { doctecatmedhosp = value; }
    //}
    //public bool PROGRAMAMEDICO
    //{
    //    get { return programamedico; }
    //    set { programamedico = value; }
    //}
    //  public bool CARACTERISTICASMECANICAS
    //{
    //    get { return caracteristicasmecanicas; }
    //    set { caracteristicasmecanicas = value; }
    //}
    //public bool FOTOGRAFIASDEUNIDAD
    //{
    //    get { return fotografiasdeunidad; }
    //    set { fotografiasdeunidad = value; }
    //}
    //public bool LICENCIASANITARIAANTERIOR
    //{
    //    get { return licenciasanitariaanterior; }
    //    set { licenciasanitariaanterior = value; }
    //}
    //public bool AUTORIZACIONRESPONSABLEANTERIOR
    //{
    //    get { return autorizacionresponsableanterior; }
    //    set { autorizacionresponsableanterior = value; }
    //}
    //public bool ANTECEDENTESNOPENALES
    //{
    //    get { return antecedentesnopenales; }
    //    set { antecedentesnopenales = value; }
    //}
    //public bool POLIZASEGURO
    //{
    //    get { return polizaseguro; }
    //    set { polizaseguro = value; }
    //}
    //public bool PROGRAMAALIMENTACION
    //{
    //    get { return programaalimentacion; }
    //    set { programaalimentacion = value; }
    //}

    public bool PREVENCION { get { return prevencion; } set { prevencion = value; } }
    public bool DICDOCCUMPLE { get { return dicdoccumple; } set { dicdoccumple = value; } }
    public bool DICTECCUMPLE { get { return dicteccumple; } set { dicteccumple = value; } }
    public bool ACTACUMPLE { get { return actacumple; } set { actacumple = value; } }
    public bool ACUSEFINALCUMPLE { get { return acusefinalcumple; } set { acusefinalcumple = value; } }

    #endregion
    #region Propiedades IMG Req
    public string Sol
    {
        get { return sol; }

        set { sol = value; }

    }
    public string Tit
    {
        get { return tit; }

        set { tit = value; }

    }
    public string Ced
    {
        get { return ced; }

        set { ced = value; }

    }
    public string Dip
    {
        get { return dip; }

        set { dip = value; }

    }
    public string Curr
    {
        get { return curr; }

        set { curr = value; }

    }
    public string Prog
    {
        get { return prog; }

        set { prog = value; }

    }
    public string Rel
    {
        get { return rel; }

        set { rel = value; }

    }
    public string Plano
    {
        get { return plano; }

        set { plano = value; }

    }
    public string Alt
    {
        get { return alt; }

        set
        {
            alt
= value;
        }

    }
    public string Papel
    {
        get { return papel; }

        set { papel = value; }

    }
    public string Form
    {
        get { return form; }

        set { form = value; }

    }
    public string Cop
    {
        get { return cop; }

        set { cop = value; }

    }
    public string Lic
    {
        get { return lic; }

        set { lic = value; }

    }
    public string DicTec
    {
        get { return dictec; }

        set { dictec = value; }

    }
    public string DicDoc
    {
        get { return dicdoc; }

        set { dicdoc = value; }

    }
    public string Acta
    {
        get { return acta; }

        set { acta = value; }

    }
    #endregion
    #region Propiedades Usuarios

    public bool CIS { get { return cis; } set { cis = value; } }
    public bool UEAS { get { return ueas; } set { ueas = value; } }
    public bool COOR { get { return coor; } set { coor = value; } }
    public bool UOS { get { return uos; } set { uos = value; } }
    public bool DICTAMINADOR { get { return dictaminador; } set { dictaminador = value; } }
    public bool DDS { get { return dds; } set { dds = value; } }
    public bool DOS { get { return dos; } set { dos = value; } }
    public bool DEAS { get { return deas; } set { deas = value; } }
    public bool DAS { get { return das; } set { das = value; } }
    public bool CORR { get { return corr; } set { corr = value; } }
    public bool RECH { get { return rech; } set { rech = value; } }
    public bool ENTR { get { return entr; } set { entr = value; } }


    #endregion
    #region Propiedades Requisitos IMAGEN
    public string iSOLLICSAN { get { return isollicsan; } set { isollicsan = value; } }
    public string iSOLICITUD { get { return isolicitud; } set { isolicitud = value; } }
    public string iTITUTLO { get { return ititulo; } set { ititulo = value; } }
    public string iCEDULA { get { return icedula; } set { icedula = value; } }
    public string iDIPLOMA { get { return idiploma; } set { idiploma = value; } }
    public string iCURRICULUM { get { return icurriculum; } set { icurriculum = value; } }
    public string iFOTOGRAFIAS { get { return ifotografias; } set { ifotografias = value; } }
    public string iPAGORESPONSABLE { get { return ipagoresponsable; } set { ipagoresponsable = value; } }
    public string iALTASAT { get { return ialtasat; } set { ialtasat = value; } }
    public string iPLANOMEMORIA { get { return iplanomemoria; } set { iplanomemoria = value; } }
    public string iRELACIONMATERIAL { get { return irelacionmaterial; } set { irelacionmaterial = value; } }
    public string iPAGO { get { return ipago; } set { ipago = value; } }
    public string iPROGRAMAACT { get { return iprogramaact; } set { iprogramaact = value; } }
    public string iFOTOCOPIACONVENIO { get { return ifotocopiaconvenio; } set { ifotocopiaconvenio = value; } }
    public string iLIBROREGISTRO { get { return ilibroregistro; } set { ilibroregistro = value; } }
    public string iDESCRIPCIONTECNICAEMBAL { get { return idescripciontecnicaembal; } set { idescripciontecnicaembal = value; } }
    public string iTARJETADECONTROL { get { return itarjetadecontrol; } set { itarjetadecontrol = value; } }
    public string iCARTACONSENTIMIENTO { get { return icartaconsentimiento; } set { icartaconsentimiento = value; } }
    public string iACTACONSTITUTIVA { get { return iactaconstitutiva; } set { iactaconstitutiva = value; } }
    public string iREGLAMENTOINTERNO { get { return ireglamentointerno; } set { ireglamentointerno = value; } }
    public string iVISTOPROTECCIONCIVIL { get { return ivistoproteccioncivil; } set { ivistoproteccioncivil = value; } }
    public string iRELACIONPERSONAL { get { return irelacionpersonal; } set { irelacionpersonal = value; } }
    public string iAUTORIZACIONDIF { get { return iautorizaciondif; } set { iautorizaciondif = value; } }
    public string iCEDULAAUTOEVALUACION { get { return icedulaautoevaluacion; } set { icedulaautoevaluacion = value; } }
    public string iPAPELMEMBRETADO { get { return ipapelmembretado; } set { ipapelmembretado = value; } }
    public string iAUTORIZACIONSET { get { return iautorizacionset; } set { iautorizacionset = value; } }
    public string iUSODESUELO { get { return iusodesuelo; } set { iusodesuelo = value; } }
    public string iPROCESOLIMPIEZA { get { return iprocesolimpieza; } set { iprocesolimpieza = value; } }
    public string iRELACIONTIPOANALISIS { get { return irelaciontipoanalisis; } set { irelaciontipoanalisis = value; } }

    public string iACTAVERIFICACION { get { return irelaciontipoanalisis; } set { iactaverificacion = value; } }
    public string iAVISOFUNC { get { return iavisofunc; } set { iavisofunc = value; } }
    public string iDOCTECATMEDHOSP { get { return idoctecatmedhosp; } set { idoctecatmedhosp = value; } }
    public string iPROGRAMAMEDICO
    {
        get { return iprogramamedico; }
        set { iprogramamedico = value; }
    }
    public string iCARACTERISTICASMECANICAS
    {
        get { return icaracteristicasmecanicas; }
        set { icaracteristicasmecanicas = value; }
    }
    public string iFOTOGRAFIASDEUNIDAD
    {
        get { return ifotografiasdeunidad; }
        set { ifotografiasdeunidad = value; }
    }
    public string iLICENCIASANITARIAANTERIOR
    {
        get { return ilicenciasanitariaanterior; }
        set { ilicenciasanitariaanterior = value; }
    }
    public string iAUTORIZACIONRESPONSABLEANTERIOR
    {
        get { return iautorizacionresponsableanterior; }
        set { iautorizacionresponsableanterior = value; }
    }
    public string iANTECEDENTESNOPENALES
    {
        get { return iantecedentesnopenales; }
        set { iantecedentesnopenales = value; }
    }
    public string iPOLIZASEGURO
    {
        get { return ipolizaseguro; }
        set { ipolizaseguro = value; }
    }
    public string iPROGRAMAALIMENTACION
    {
        get { return iprogramaalimentacion; }
        set { iprogramaalimentacion = value; }
    }

    public string iTITULO_MR
    {
        get { return ititulo_MR; }
        set { ititulo_MR = value; }
    }

    public string iCEDULA_MR
    {
        get { return icedula_MR; }
        set { icedula_MR = value; }
    }
    public string iDIPLOMA_MR
    {
        get { return idiploma_MR; }
        set { idiploma_MR = value; }
    }
    public string iCURRICULUM_MR
    {
        get { return icurriculum_MR; }
        set { icurriculum_MR = value; }
    }
    public string iRELACIONPERSONAL_PARAMEDICO
    {
        get { return irelacionpersonal_paramedico; }
        set { irelacionpersonal_paramedico = value; }
    }
    public string iDOCUMENTACION_LABORATORIO
    {
        get { return idocumentacion_laboratorio; }
        set { idocumentacion_laboratorio = value; }
    }
    public string iCOPIALICENCIA_MATRIZ
    {
        get { return icopialicencia_matriz; }
        set { icopialicencia_matriz = value; }
    }
    public string iCOPIAAUTORIZACION_MATRIZ
    {
        get { return icopiaautorizacion_matriz; }
        set { icopiaautorizacion_matriz = value; }
    }
    public string iDOCUMENTACION_TECNICO
    {
        get { return idocumentacion_tecnico; }
        set { idocumentacion_tecnico = value; }
    }
    public string iDOCUMENTACION_RESPONSABLE
    {
        get { return idocumentacion_responsable; }
        set { idocumentacion_responsable = value; }
    }
    public string iFORMALIMPIEZA
    {
        get { return iformalimpieza; }
        set { iformalimpieza = value; }
    }

    public string iPREVENCION { get { return iprevencion; } set { iprevencion = value; } }
    public string iDIDOC { get { return idicdoc; } set { idicdoc = value; } }
    public string iDICTEC { get { return idictec; } set { idictec = value; } }
    public string iACTA { get { return iacta; } set { iacta = value; } }
    public string iACUSEFINAL { get { return iacusefinal; } set { iacusefinal = value; } }


    #endregion

    #region Métodos

    private void MostrarDatos()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bitaseg.tramites where folio=@folio";
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Connection = cnn;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                requerimientos = dr["requerimientos"].ToString();
               
            }
            dr.Close();
            cnn.Close();
                       

            SqlConnection cnnp = new SqlConnection();
            cnnp.ConnectionString = Principal.CnnStr0;
            cnnp.Open();
            SqlCommand cmdp = new SqlCommand();
            cmdp.CommandType = CommandType.Text;
            cmdp.CommandText = "Select * from bitaseg.tramites " +
                "inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos " +
                "inner join bitaseg.personas ON tramites.id_persona = personas.id_persona " +
                "inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento " +
                "inner join bitaseg.ResponsablesSanitarios on tramites.id_responsable = ResponsablesSanitarios.id_responsable " +
                "where folio=@folio";
            cmdp.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmdp.Connection = cnnp;

            SqlDataReader drp = cmdp.ExecuteReader();
            if (drp.Read())
            {
                //SOLICITANTE
                curp = drp["curp"].ToString();
                nombre = drp["nombre"].ToString();
                telfij = drp["telfij"].ToString();
                telmov = drp["telmov"].ToString();
                correo = drp["correo"].ToString();
                apellidop = drp["apellidop"].ToString();
                apellidom = drp["apellidom"].ToString();
                rfc_prop = drp["rfc_prop"].ToString();
                
                //ESTABLECIMIENTO
                rfc = drp["rfc"].ToString();
                razonsocial = drp["razonsocial"].ToString();
                municipio = drp["municipio"].ToString();
                colonia = drp["colonia"].ToString();
                nombreest = drp["nombreest"].ToString();
                calle = drp["calle"].ToString();
                referencias = drp["referencias"].ToString();
                rui = drp["rui"].ToString();
                observaciones = drp["observaciones"].ToString();
                giro = drp["giro"].ToString();
                numero = drp["numero"].ToString();
                localidad = drp["localidad"].ToString();
                cp = drp["cp"].ToString();
                correoest = drp["correoest"].ToString();
                telest = drp["telest"].ToString();
                est_dias_laborales = drp["est_dias_laborales"].ToString();
                hest1 = drp["hest1"].ToString();
                hest2 = drp["hest2"].ToString();

                //responsable sanitario
                rnombre = drp["rnombre"].ToString();
                rapellidop = drp["rapellidop"].ToString();
                rapellidom = drp["rapellidom"].ToString();
                rgrado = drp["rgrado"].ToString();
                rcedula = drp["rcedula"].ToString();
                //horario = drp["horario"].ToString();
                r_dias_laborales = drp["r_dias_laborales"].ToString();
                hr1 = drp["hr1"].ToString();
                hr2 = drp["hr2"].ToString();
                rfc_r = drp["rfcr"].ToString();
              
                //Tramite
                id_establecimiento = Convert.ToInt32(drp["id_establecimiento"]);
                id_persona = Convert.ToInt32(drp["id_persona"]);
                id_responsable = Convert.ToInt32(drp["id_responsable"]);
                

                certificado_anterior = drp["certificado_anterior"].ToString();
                rechazo = drp["rechazo"].ToString();
                id_tramite = Convert.ToInt32(drp["id_tramite"]);
                categoria= Convert.ToInt32(drp["categoria"]);
                riesgo = Convert.ToInt32(drp["riesgo"]);
                verificacion = Convert.ToInt32(drp["verificacion"]);
                modalidad = Convert.ToInt32(drp["modalidad"]);
                statos = Convert.ToInt32(drp["id_statos"]);

                numerodeguia = drp["numerodeguia"].ToString();
                quienrecibio = drp["quienrecibio"].ToString();
                rechazo = drp["rechazo"].ToString();
                entregado = drp["entregado"].ToString();
                foliolicencia = Convert.ToInt32(drp["foliolicencia"]);

                observaciones = drp["observaciones"].ToString();
                obdos = drp["obdos"].ToString();
                obdeas = drp["obdeas"].ToString();

                //Requisitos 
                sollicsan = (bool)drp["sollicsan"];
                solicitud = (bool)drp["solicitud"];
                titulo = (bool)drp["titulo"];
                cedula = (bool)drp["cedula"];
                diploma = (bool)drp["diploma"];
                curriculum = (bool)drp["curriculum"];
                fotografias = (bool)drp["fotografias"];
                pagoresponsable = (bool)drp["pagoresponsable"];
                altasat = (bool)drp["altasat"];
                planomemoria = (bool)drp["planomemoria"];
                relacionmaterial = (bool)drp["relacionmaterial"];
                pago = (bool)drp["pago"];
                programaact = (bool)drp["programaact"];
                fotocopiaconvenio = (bool)drp["fotocopiaconvenio"];
                libroregistro = (bool)drp["libroregistro"];
                descripciontecnicaembal = (bool)drp["descripciontecnicaembal"];
                tarjetadecontrol = (bool)drp["tarjetadecontrol"];
                cartaconsentimiento = (bool)drp["cartaconsentimiento"];
                actaconstitutiva = (bool)drp["actaconstitutiva"];
                reglamentointerno = (bool)drp["reglamentointerno"];
                vistoproteccioncivil = (bool)drp["vistoproteccioncivil"];
                relacionpersonal = (bool)drp["relacionpersonal"];
                autorizaciondif = (bool)drp["autorizaciondif"];
                cedulaautoevaluacion = (bool)drp["cedulaautoevaluacion"];
                papelmembretado = (bool)drp["papelmembretado"];
                autorizacionset = (bool)drp["autorizacionset"];
                usodesuelo = (bool)drp["usodesuelo"];
                procesolimpieza = (bool)drp["procesolimpieza"];
                relaciontipoanalisis = (bool)drp["relaciontipoanalisis"];
                actaverificacion = (bool)drp["actaverificacion"];

                avisofunc = (bool)drp["avisofunc"];

                doctecatmedhosp = (bool)drp["doctecatmedhosp"];
                programamedico = (bool)drp["programamedico"];
                caracteristicasmecanicas = (bool)drp["caracteristicasmecanicas"];
                fotografiasdeunidad = (bool)drp["fotografiasdeunidad"];
                licenciasanitariaanterior = (bool)drp["licenciasanitariaanterior"];
                autorizacionresponsableanterior = (bool)drp["autorizacionresponsableanterior"];
                antecedentesnopenales = (bool)drp["antecedentesnopenales"];
                polizaseguro = (bool)drp["polizaseguro"];
                programaalimentacion = (bool)drp["programaalimentacion"];

                titulo_MR = (bool)drp["titulo_MR"];
                cedula_MR = (bool)drp["cedula_MR"];
                diploma_MR = (bool)drp["diploma_MR"];
                curriculum_MR = (bool)drp["curriculum_MR"];
                relacionpersonal_paramedico = (bool)drp["relacionpersonal_paramedico"];
                documentacion_laboratorio = (bool)drp["documentacion_laboratorio"];
                copialicencia_matriz = (bool)drp["copialicencia_matriz"];
                copiaautorizacion_matriz = (bool)drp["copiaautorizacion_matriz"];
                documentacion_tecnico = (bool)drp["documentacion_tecnico"];
                documentacion_responsable = (bool)drp["documentacion_responsable"];
                formalimpieza = (bool)drp["formalimpieza"];

                prevencion = (bool)drp["prevencion"];
                dicdoccumple = (bool)drp["dicdoc"];
                dicteccumple = (bool)drp["dictec"];
                actacumple = (bool)drp["acta"];
                acusefinalcumple = (bool)drp["acusefinal"];

                ////////////////////////////////////////77
                ///////////////////////////////////
                //////////////////////////////
                requiereverificacion = (bool)drp["requiereverificacion"];

                ///////////////////////////7
                //////////////////////////////
                ////////////////////////////
            }
            drp.Close();
            cnnp.Close();
            

            SqlConnection cnnm = new SqlConnection();
            cnnm.ConnectionString = Principal.CnnStr0;
            cnnm.Open();
            SqlCommand cmdm = new SqlCommand();
            cmdm.CommandType = CommandType.Text;
            cmdm.CommandText = "select cis,ueas,coordinacion as coor,uos,dictaminador, dds, dos, deas, das, correspondencia as corr, rechazados as rech, entregados as entr from bitaseg.usuarios where id_usuario=@id_usuario";
            cmdm.Parameters.Add("@id_usuario", SqlDbType.Int).Value = 2;
            cmdm.Connection = cnnm;

            SqlDataReader drm = cmdm.ExecuteReader();
            if (drm.Read())
            {

                cis = (bool)drm["cis"];
                ueas = (bool)drm["ueas"];
                coor = (bool)drm["coor"];
                uos = (bool)drm["uos"];
                dictaminador = (bool)drm["dictaminador"];
                dds = (bool)drm["dds"];
                dos = (bool)drm["dos"];
                deas = (bool)drm["deas"];
                das = (bool)drm["das"];
                corr = (bool)drm["corr"];
                rech = (bool)drm["rech"];
                entr = (bool)drm["entr"];


            }
            drm.Close();
            cnnm.Close();
            

            //SqlConnection cnnpa = new SqlConnection();
            //cnnpa.ConnectionString = Principal.CnnStr0;
            //cnnpa.Open();
            //SqlCommand cmdpa = new SqlCommand();
            //cmdpa.CommandType = CommandType.Text;
            //cmdpa.CommandText = " select * from bitaseg.imgchar where folio=@folio";
            //cmdpa.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            //cmdpa.Connection = cnnpa;

            //SqlDataReader drpa = cmdpa.ExecuteReader();
            //if (drpa.Read())
            //{

            //    sol  = drpa["sol"].ToString();
            //    tit = drpa["tit"].ToString();
            //    ced = drpa["ced"].ToString();
            //    dip = drpa["dip"].ToString();
            //    curr = drpa["curr"].ToString();
            //    prog = drpa["prog"].ToString();
            //    rel = drpa["rel"].ToString();
            //    plano = drpa["plano"].ToString();
            //    alt = drpa["alt"].ToString();
            //    papel = drpa["papel"].ToString();
            //    form = drpa["form"].ToString();
            //    cop = drpa["cop"].ToString();
            //    lic = drpa["lic"].ToString();
            //    dicdoc = drpa["dicdoc"].ToString();
            //    dictec = drpa["dictec"].ToString();
            //    acta = drpa["acta"].ToString();

            //                }
            //drpa.Close();
            //cnnpa.Close();

            

        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
    public bool Grabar_tram()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_tramiteGuardar";

            cmd.Parameters.Add("@reguser", SqlDbType.VarChar,20).Value = reguser;
            cmd.Parameters.Add("@numerocoordinacion", SqlDbType.Int).Value = numerocoordinacion;

            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Parameters.Add("@id_statos", SqlDbType.Int).Value = statos;
            cmd.Parameters.Add("@requerimientos", SqlDbType.NVarChar, -1).Value = requerimientos;//requerimientos en cadena de texto
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
            cmd.Parameters.Add("@fecha_lim", SqlDbType.DateTime).Value = fecha_lim;
            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@id_establecimiento", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@id_responsable", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@curp", SqlDbType.NVarChar, 18).Value = curp;
            cmd.Parameters.Add("@rfc_prop", SqlDbType.NVarChar, -1).Value = rfc_prop;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
            cmd.Parameters.Add("@apellidop", SqlDbType.NVarChar, 50).Value = apellidop;
            cmd.Parameters.Add("@apellidom", SqlDbType.NVarChar, 50).Value = apellidom;
            cmd.Parameters.Add("@telfij", SqlDbType.NVarChar, 50).Value = telfij;
            cmd.Parameters.Add("@telmov", SqlDbType.NVarChar, 50).Value = telmov;
            cmd.Parameters.Add("@correo", SqlDbType.NVarChar, 50).Value = correo;
            cmd.Parameters.Add("@fecha_reg_per", SqlDbType.DateTime).Value = fecha_reg_per;
            cmd.Parameters.Add("@fecha_act_status", SqlDbType.DateTime).Value = fecha_act_status;
            cmd.Parameters.Add("@rfc", SqlDbType.NVarChar, 50).Value = rfc;
            cmd.Parameters.Add("@razonsocial", SqlDbType.NVarChar, -1).Value = razonsocial;
            cmd.Parameters.Add("@nombreest", SqlDbType.NVarChar, -1).Value = nombreest;
            cmd.Parameters.Add("@municipio", SqlDbType.NVarChar, -1).Value = municipio;
            cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, -1).Value = colonia;
            cmd.Parameters.Add("@calle", SqlDbType.NVarChar, -1).Value = calle;
            cmd.Parameters.Add("@fecha_reg_est", SqlDbType.DateTime).Value = fecha_reg_est;
            cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id_tramite;
            cmd.Parameters.Add("@riesgo", SqlDbType.Int).Value = riesgo;
            cmd.Parameters.Add("@verificacion", SqlDbType.Int).Value = verificacion;
            cmd.Parameters.Add("@modalidad", SqlDbType.Int).Value = modalidad;
            cmd.Parameters.Add("@categoria", SqlDbType.Int).Value = categoria;
            cmd.Parameters.Add("@rui", SqlDbType.NVarChar).Value = rui;
            cmd.Parameters.Add("@certificado_anterior", SqlDbType.NVarChar, 50).Value = certificado_anterior;
            cmd.Parameters.Add("@observaciones", SqlDbType.NVarChar, -1).Value = observaciones;
            cmd.Parameters.Add("@numero", SqlDbType.NVarChar, -1).Value = numero;

            cmd.Parameters.Add("@localidad", SqlDbType.NVarChar, 50).Value = localidad;
            cmd.Parameters.Add("@cp", SqlDbType.NVarChar, 50).Value = cp;
            cmd.Parameters.Add("@correoest", SqlDbType.NVarChar, 50).Value = correoest;
            cmd.Parameters.Add("@telest", SqlDbType.NVarChar, 50).Value = telest;
            //cmd.Parameters.Add("@giro", SqlDbType.NVarChar, 50).Value = giro;
            cmd.Parameters.Add("@referencias", SqlDbType.NVarChar, -1).Value = referencias;

            cmd.Parameters.Add("@est_dias_laborales", SqlDbType.NVarChar).Value = est_dias_laborales;
            cmd.Parameters.Add("@hest1", SqlDbType.NVarChar).Value = hest1;
            cmd.Parameters.Add("@hest2", SqlDbType.NVarChar).Value = hest2;

            cmd.Parameters.Add("@rnombre", SqlDbType.NVarChar, 50).Value = rnombre;
            cmd.Parameters.Add("@rapellidom", SqlDbType.NVarChar, 50).Value = rapellidom;
            cmd.Parameters.Add("@rapellidop", SqlDbType.NVarChar, 50).Value = rapellidop;
            cmd.Parameters.Add("@rgrado", SqlDbType.NVarChar, 50).Value = rgrado;
            cmd.Parameters.Add("@rcedula", SqlDbType.NVarChar, 50).Value = rcedula;
            //cmd.Parameters.Add("@horario", SqlDbType.NVarChar, 50).Value = horario;
            cmd.Parameters.Add("@fecha_reg_resp", SqlDbType.DateTime).Value = fecha_reg_resp;

            cmd.Parameters.Add("@r_dias_laborales", SqlDbType.NVarChar).Value = r_dias_laborales;
            cmd.Parameters.Add("@hr1", SqlDbType.NVarChar).Value = hr1;
            cmd.Parameters.Add("@hr2", SqlDbType.NVarChar).Value = hr2;
            cmd.Parameters.Add("@rfcr", SqlDbType.NVarChar).Value = rfc_r;


            cmd.Parameters.Add("@sollicsan", SqlDbType.Bit).Value = sollicsan;
            cmd.Parameters.Add("@solicitud", SqlDbType.Bit).Value = solicitud;
            cmd.Parameters.Add("@titulo", SqlDbType.Bit).Value = titulo;
            cmd.Parameters.Add("@cedula", SqlDbType.Bit).Value = cedula;
            cmd.Parameters.Add("@diploma", SqlDbType.Bit).Value = diploma;
            cmd.Parameters.Add("@curriculum", SqlDbType.Bit).Value = curriculum;
            cmd.Parameters.Add("@fotografias", SqlDbType.Bit).Value = fotografias;
            cmd.Parameters.Add("@pagoresponsable", SqlDbType.Bit).Value = pagoresponsable;
            cmd.Parameters.Add("@altasat", SqlDbType.Bit).Value = altasat;
            cmd.Parameters.Add("@planomemoria", SqlDbType.Bit).Value = planomemoria;
            cmd.Parameters.Add("@relacionmaterial", SqlDbType.Bit).Value = relacionmaterial;
            cmd.Parameters.Add("@pago", SqlDbType.Bit).Value = pago;
            cmd.Parameters.Add("@programaact", SqlDbType.Bit).Value = programaact;
            cmd.Parameters.Add("@fotocopiaconvenio", SqlDbType.Bit).Value = fotocopiaconvenio;
            cmd.Parameters.Add("@libroregistro", SqlDbType.Bit).Value = libroregistro;
            cmd.Parameters.Add("@descripciontecnicaembal", SqlDbType.Bit).Value = descripciontecnicaembal;
            cmd.Parameters.Add("@tarjetadecontrol", SqlDbType.Bit).Value = tarjetadecontrol;
            cmd.Parameters.Add("@cartaconsentimiento", SqlDbType.Bit).Value = cartaconsentimiento;
            cmd.Parameters.Add("@actaconstitutiva", SqlDbType.Bit).Value = actaconstitutiva;
            cmd.Parameters.Add("@reglamentointerno", SqlDbType.Bit).Value = reglamentointerno;
            cmd.Parameters.Add("@vistoproteccioncivil", SqlDbType.Bit).Value = vistoproteccioncivil;
            cmd.Parameters.Add("@relacionpersonal", SqlDbType.Bit).Value = relacionpersonal;
            cmd.Parameters.Add("@autorizaciondif", SqlDbType.Bit).Value = autorizaciondif;
            cmd.Parameters.Add("@cedulaautoevaluacion", SqlDbType.Bit).Value = cedulaautoevaluacion;
            cmd.Parameters.Add("@papelmembretado", SqlDbType.Bit).Value = papelmembretado;
            cmd.Parameters.Add("@autorizacionset", SqlDbType.Bit).Value = autorizacionset;
            cmd.Parameters.Add("@usodesuelo", SqlDbType.Bit).Value = usodesuelo;
            cmd.Parameters.Add("@procesolimpieza", SqlDbType.Bit).Value = procesolimpieza;
            cmd.Parameters.Add("@relaciontipoanalisis", SqlDbType.Bit).Value = relaciontipoanalisis;
            cmd.Parameters.Add("@actaverificacion", SqlDbType.Bit).Value = actaverificacion;
            cmd.Parameters.Add("@avisofunc", SqlDbType.Bit).Value = avisofunc;

            cmd.Parameters.Add("@doctecatmedhosp", SqlDbType.Bit).Value = doctecatmedhosp;
            cmd.Parameters.Add("@programamedico", SqlDbType.Bit).Value = programamedico;
            cmd.Parameters.Add("@caracteristicasmecanicas", SqlDbType.Bit).Value = caracteristicasmecanicas;
            cmd.Parameters.Add("@fotografiasdeunidad", SqlDbType.Bit).Value = fotografiasdeunidad;
            cmd.Parameters.Add("@licenciasanitariaanterior", SqlDbType.Bit).Value = licenciasanitariaanterior;
            cmd.Parameters.Add("@autorizacionresponsableanterior", SqlDbType.Bit).Value = autorizacionresponsableanterior;
            cmd.Parameters.Add("@antecedentesnopenales", SqlDbType.Bit).Value = antecedentesnopenales;
            cmd.Parameters.Add("@polizaseguro", SqlDbType.Bit).Value = polizaseguro;
            cmd.Parameters.Add("@programaalimentacion", SqlDbType.Bit).Value = programaalimentacion;


            cmd.Parameters.Add("@titulo_MR", SqlDbType.Bit).Value = titulo_MR;
            cmd.Parameters.Add("@cedula_MR", SqlDbType.Bit).Value = cedula_MR;
            cmd.Parameters.Add("@diploma_MR", SqlDbType.Bit).Value = diploma_MR;
            cmd.Parameters.Add("@curriculum_MR", SqlDbType.Bit).Value = curriculum_MR;
            cmd.Parameters.Add("@relacionpersonal_paramedico", SqlDbType.Bit).Value = relacionpersonal_paramedico;
            cmd.Parameters.Add("@documentacion_laboratorio", SqlDbType.Bit).Value = documentacion_laboratorio;
            cmd.Parameters.Add("@copialicencia_matriz", SqlDbType.Bit).Value = copialicencia_matriz;
            cmd.Parameters.Add("@copiaautorizacion_matriz", SqlDbType.Bit).Value = copiaautorizacion_matriz;
            cmd.Parameters.Add("@documentacion_tecnico", SqlDbType.Bit).Value = documentacion_tecnico;
            cmd.Parameters.Add("@documentacion_responsable", SqlDbType.Bit).Value = documentacion_responsable;
            cmd.Parameters.Add("@formalimpieza", SqlDbType.Bit).Value = formalimpieza;


            cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    public bool Staus_tram()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_tramiteStatus1";

            //
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Parameters.Add("@id_statos", SqlDbType.Int).Value = statos;
            cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id_tramite;
            cmd.Parameters.Add("@rui", SqlDbType.NVarChar,50).Value = rui;



            cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    public bool GuardarSinStaus_tram()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_tramiteGuardarSinStatus";

            //
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Parameters.Add("@id_statos", SqlDbType.Int).Value = statos;
            cmd.Parameters.Add("@requerimientos", SqlDbType.NVarChar, -1).Value = requerimientos;//requerientos en cadena de texto
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = fecha_reg;
            cmd.Parameters.Add("@fecha_lim", SqlDbType.DateTime).Value = fecha_lim;
            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@id_establecimiento", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@curp", SqlDbType.NVarChar, 18).Value = curp;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
            cmd.Parameters.Add("@apellidop", SqlDbType.NVarChar, 50).Value = apellidop;
            cmd.Parameters.Add("@apellidom", SqlDbType.NVarChar, 50).Value = apellidom;
            cmd.Parameters.Add("@telfij", SqlDbType.NVarChar, 50).Value = telfij;
            cmd.Parameters.Add("@telmov", SqlDbType.NVarChar, 50).Value = telmov;
            cmd.Parameters.Add("@correo", SqlDbType.NVarChar, 50).Value = correo;
            cmd.Parameters.Add("@fecha_reg_per", SqlDbType.DateTime).Value = fecha_reg_per;
            cmd.Parameters.Add("@fecha_act_status", SqlDbType.DateTime).Value = fecha_act_status;
            cmd.Parameters.Add("@rfc", SqlDbType.NVarChar, 50).Value = rfc;
            cmd.Parameters.Add("@razonsocial", SqlDbType.NVarChar, 50).Value = razonsocial;
            cmd.Parameters.Add("@nombreest", SqlDbType.NVarChar, 50).Value = nombreest;
            cmd.Parameters.Add("@municipio", SqlDbType.NVarChar, 50).Value = municipio;
            cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, 50).Value = colonia;
            cmd.Parameters.Add("@calle", SqlDbType.NVarChar, 50).Value = calle;
            cmd.Parameters.Add("@fecha_reg_est", SqlDbType.DateTime).Value = fecha_reg_est;
            cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id_tramite;
            cmd.Parameters.Add("@riesgo", SqlDbType.Int).Value = riesgo;
            cmd.Parameters.Add("@verificacion", SqlDbType.Int).Value = verificacion;
            cmd.Parameters.Add("@modalidad", SqlDbType.Int).Value = modalidad;
            cmd.Parameters.Add("@rui", SqlDbType.NVarChar).Value = rui;
            cmd.Parameters.Add("@certificado_anterior", SqlDbType.NVarChar).Value = certificado_anterior;


            cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    public bool StausConRui_tram()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_tramiteStatusEditar";

            cmd.Parameters.Add("@id_persona", SqlDbType.Int).Value = id_persona;
            cmd.Parameters.Add("@id_establecimiento", SqlDbType.Int).Value = id_establecimiento;
            cmd.Parameters.Add("@id_responsable", SqlDbType.Int).Value = id_responsable;

            cmd.Parameters.Add("@sollicsan", SqlDbType.Bit).Value = sollicsan;
            cmd.Parameters.Add("@solicitud", SqlDbType.Bit).Value = solicitud;
            cmd.Parameters.Add("@titulo", SqlDbType.Bit).Value = titulo;
            cmd.Parameters.Add("@cedula", SqlDbType.Bit).Value = cedula;
            cmd.Parameters.Add("@diploma", SqlDbType.Bit).Value = diploma;
            cmd.Parameters.Add("@curriculum", SqlDbType.Bit).Value = curriculum;
            cmd.Parameters.Add("@fotografias", SqlDbType.Bit).Value = fotografias;
            cmd.Parameters.Add("@pagoresponsable", SqlDbType.Bit).Value = pagoresponsable;
            cmd.Parameters.Add("@altasat", SqlDbType.Bit).Value = altasat;
            cmd.Parameters.Add("@planomemoria", SqlDbType.Bit).Value = planomemoria;
            cmd.Parameters.Add("@relacionmaterial", SqlDbType.Bit).Value = relacionmaterial;
            cmd.Parameters.Add("@pago", SqlDbType.Bit).Value = pago;
            cmd.Parameters.Add("@programaact", SqlDbType.Bit).Value = programaact;
            cmd.Parameters.Add("@fotocopiaconvenio", SqlDbType.Bit).Value = fotocopiaconvenio;
            cmd.Parameters.Add("@libroregistro", SqlDbType.Bit).Value = libroregistro;
            cmd.Parameters.Add("@descripciontecnicaembal", SqlDbType.Bit).Value = descripciontecnicaembal;
            cmd.Parameters.Add("@tarjetadecontrol", SqlDbType.Bit).Value = tarjetadecontrol;
            cmd.Parameters.Add("@cartaconsentimiento", SqlDbType.Bit).Value = cartaconsentimiento;
            cmd.Parameters.Add("@actaconstitutiva", SqlDbType.Bit).Value = actaconstitutiva;
            cmd.Parameters.Add("@reglamentointerno", SqlDbType.Bit).Value = reglamentointerno;
            cmd.Parameters.Add("@vistoproteccioncivil", SqlDbType.Bit).Value = vistoproteccioncivil;
            cmd.Parameters.Add("@relacionpersonal", SqlDbType.Bit).Value = relacionpersonal;
            cmd.Parameters.Add("@autorizaciondif", SqlDbType.Bit).Value = autorizaciondif;
            cmd.Parameters.Add("@cedulaautoevaluacion", SqlDbType.Bit).Value = cedulaautoevaluacion;
            cmd.Parameters.Add("@papelmembretado", SqlDbType.Bit).Value = papelmembretado;
            cmd.Parameters.Add("@autorizacionset", SqlDbType.Bit).Value = autorizacionset;
            cmd.Parameters.Add("@usodesuelo", SqlDbType.Bit).Value = usodesuelo;
            cmd.Parameters.Add("@procesolimpieza", SqlDbType.Bit).Value = procesolimpieza;
            cmd.Parameters.Add("@relaciontipoanalisis", SqlDbType.Bit).Value = relaciontipoanalisis;
            cmd.Parameters.Add("@actaverificacion", SqlDbType.Bit).Value = actaverificacion;

            cmd.Parameters.Add("@observaciones", SqlDbType.NVarChar, -1).Value = observaciones;
            cmd.Parameters.Add("@rui", SqlDbType.NVarChar).Value = rui;

            cmd.Parameters.Add("@id_statos", SqlDbType.Int).Value = statos;
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;

            cmd.Parameters.Add("@curp", SqlDbType.NVarChar, 18).Value = curp;
            cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
            cmd.Parameters.Add("@apellidop", SqlDbType.NVarChar, 50).Value = apellidop;
            cmd.Parameters.Add("@apellidom", SqlDbType.NVarChar, 50).Value = apellidom;
            cmd.Parameters.Add("@telfij", SqlDbType.NVarChar, 50).Value = telfij;
            cmd.Parameters.Add("@telmov", SqlDbType.NVarChar, 50).Value = telmov;
            cmd.Parameters.Add("@correo", SqlDbType.NVarChar, 50).Value = correo;

            cmd.Parameters.Add("@rfc", SqlDbType.NVarChar, 50).Value = rfc;
            cmd.Parameters.Add("@razonsocial", SqlDbType.NVarChar, 50).Value = razonsocial;
            cmd.Parameters.Add("@nombreest", SqlDbType.NVarChar, 50).Value = nombreest;
            cmd.Parameters.Add("@municipio", SqlDbType.NVarChar, 50).Value = municipio;
            cmd.Parameters.Add("@colonia", SqlDbType.NVarChar, 50).Value = colonia;
            cmd.Parameters.Add("@calle", SqlDbType.NVarChar, 50).Value = calle;
            cmd.Parameters.Add("@localidad", SqlDbType.NVarChar, 50).Value = localidad;
            cmd.Parameters.Add("@cp", SqlDbType.NVarChar, 50).Value = cp;
            cmd.Parameters.Add("@correoest", SqlDbType.NVarChar, 50).Value = correoest;
            cmd.Parameters.Add("@telest", SqlDbType.NVarChar, 50).Value = telest;
            cmd.Parameters.Add("@giro", SqlDbType.NVarChar, 50).Value = giro;

            cmd.Parameters.Add("@rnombre", SqlDbType.NVarChar, 50).Value = rnombre;
            cmd.Parameters.Add("@rapellidom", SqlDbType.NVarChar, 50).Value = rapellidom;
            cmd.Parameters.Add("@rapellidop", SqlDbType.NVarChar, 50).Value = rapellidop;
            cmd.Parameters.Add("@rgrado", SqlDbType.NVarChar, 50).Value = rgrado;
            cmd.Parameters.Add("@rcedula", SqlDbType.NVarChar, 50).Value = rcedula;
            cmd.Parameters.Add("@horario", SqlDbType.NVarChar, 50).Value = horario;


            cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    private void MostrarIMG()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bitaseg.imgreq where folio=@folio";
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Connection = cnn;


            SqlDataReader drp = cmd.ExecuteReader();
            if (drp.Read())
            {
                isollicsan = drp["sollicsan"].ToString(); 
                isolicitud = drp["solicitud"].ToString();
                ititulo = drp["titulo"].ToString();
                icedula = drp["cedula"].ToString();
                idiploma = drp["diploma"].ToString();
                icurriculum = drp["curriculum"].ToString();
                ifotografias = drp["fotografias"].ToString();
                ipagoresponsable = drp["pagoresponsable"].ToString();
                ialtasat = drp["altasat"].ToString();
                iplanomemoria = drp["planomemoria"].ToString();
                irelacionmaterial = drp["relacionmaterial"].ToString();
                ipago = drp["pago"].ToString();
                iprogramaact = drp["programaact"].ToString();
                ifotocopiaconvenio = drp["fotocopiaconvenio"].ToString();
                ilibroregistro = drp["libroregistro"].ToString();
                idescripciontecnicaembal = drp["descripciontecnicaembal"].ToString();
                itarjetadecontrol = drp["tarjetadecontrol"].ToString();
                icartaconsentimiento = drp["cartaconsentimiento"].ToString();
                iactaconstitutiva = drp["actaconstitutiva"].ToString();
                ireglamentointerno = drp["reglamentointerno"].ToString();
                ivistoproteccioncivil = drp["vistoproteccioncivil"].ToString();
                irelacionpersonal = drp["relacionpersonal"].ToString();
                iautorizaciondif = drp["autorizaciondif"].ToString();
                icedulaautoevaluacion = drp["cedulaautoevaluacion"].ToString();
                ipapelmembretado = drp["papelmembretado"].ToString();
                iautorizacionset = drp["autorizacionset"].ToString();
                iusodesuelo = drp["usodesuelo"].ToString();
                iprocesolimpieza = drp["procesolimpieza"].ToString();
                irelaciontipoanalisis = drp["relaciontipoanalisis"].ToString();
                iactaverificacion = drp["actaverificacion"].ToString();
                iavisofunc = drp["avisofunc"].ToString();

                idoctecatmedhosp = drp["doctecatmedhosp"].ToString();
                iprogramamedico = drp["programamedico"].ToString();
                icaracteristicasmecanicas = drp["caracteristicasmecanicas"].ToString();
                ifotografiasdeunidad = drp["fotografiasdeunidad"].ToString();
                ilicenciasanitariaanterior = drp["licenciasanitariaanterior"].ToString();
                iautorizacionresponsableanterior = drp["autorizacionresponsableanterior"].ToString();
                iantecedentesnopenales = drp["antecedentesnopenales"].ToString();
                ipolizaseguro= drp["polizaseguro"].ToString();
                iprogramaalimentacion = drp["programaalimentacion"].ToString();


                ititulo_MR = drp["titulo_MR"].ToString();
                icedula_MR = drp["cedula_MR"].ToString();
                idiploma_MR = drp["diploma_MR"].ToString();
                icurriculum_MR = drp["curriculum_MR"].ToString();
                irelacionpersonal_paramedico = drp["relacionpersonal_paramedico"].ToString();
                idocumentacion_laboratorio = drp["documentacion_laboratorio"].ToString();
                icopialicencia_matriz = drp["copialicencia_matriz"].ToString();
                icopiaautorizacion_matriz = drp["copiaautorizacion_matriz"].ToString();
                idocumentacion_tecnico = drp["documentacion_tecnico"].ToString();
                idocumentacion_responsable = drp["documentacion_responsable"].ToString();
                iformalimpieza = drp["formalimpieza"].ToString();

                iprevencion = drp["prevencion"].ToString();
                idicdoc = drp["dicdoc"].ToString();
                idictec = drp["dictec"].ToString();
                iacta = drp["acta"].ToString();
                iacusefinal = drp["acusefinal"].ToString();

            }
            drp.Close();
            cnn.Close();
            



        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
    //PENDIENTE
    public bool Digitalizar()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_reqimgSave";

            //

            cmd.Parameters.Add("@id_statos", SqlDbType.Int).Value = statos;
            cmd.Parameters.Add("@rui", SqlDbType.NVarChar,50).Value = rui;
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Parameters.Add("@sollicsan", SqlDbType.NVarChar, -1).Value = isollicsan;
            cmd.Parameters.Add("@solicitud", SqlDbType.NVarChar, -1).Value = isolicitud;
            cmd.Parameters.Add("@titulo", SqlDbType.NVarChar, -1).Value = ititulo;
            cmd.Parameters.Add("@cedula", SqlDbType.NVarChar, -1).Value = icedula;
            cmd.Parameters.Add("@diploma", SqlDbType.NVarChar, -1).Value = idiploma;
            cmd.Parameters.Add("@curriculum", SqlDbType.NVarChar, -1).Value = icurriculum;
            cmd.Parameters.Add("@fotografias", SqlDbType.NVarChar, -1).Value = ifotografias;
            cmd.Parameters.Add("@pagoresponsable", SqlDbType.NVarChar, -1).Value = ipagoresponsable;
            cmd.Parameters.Add("@altasat", SqlDbType.NVarChar, -1).Value = ialtasat;
            cmd.Parameters.Add("@planomemoria", SqlDbType.NVarChar, -1).Value = iplanomemoria;
            cmd.Parameters.Add("@relacionmaterial", SqlDbType.NVarChar, -1).Value = irelacionmaterial;
            cmd.Parameters.Add("@pago", SqlDbType.NVarChar, -1).Value = ipago;
            cmd.Parameters.Add("@programaact", SqlDbType.NVarChar, -1).Value = iprogramaact;
            cmd.Parameters.Add("@fotocopiaconvenio", SqlDbType.NVarChar, -1).Value = ifotocopiaconvenio;
            cmd.Parameters.Add("@libroregistro", SqlDbType.NVarChar, -1).Value = ilibroregistro;
            cmd.Parameters.Add("@descripciontecnicaembal", SqlDbType.NVarChar, -1).Value = idescripciontecnicaembal;
            cmd.Parameters.Add("@tarjetadecontrol", SqlDbType.NVarChar, -1).Value = itarjetadecontrol;
            cmd.Parameters.Add("@cartaconsentimiento", SqlDbType.NVarChar, -1).Value = icartaconsentimiento;
            cmd.Parameters.Add("@actaconstitutiva", SqlDbType.NVarChar, -1).Value = iactaconstitutiva;
            cmd.Parameters.Add("@reglamentointerno", SqlDbType.NVarChar, -1).Value = ireglamentointerno;
            cmd.Parameters.Add("@vistoproteccioncivil", SqlDbType.NVarChar, -1).Value = ivistoproteccioncivil;
            cmd.Parameters.Add("@relacionpersonal", SqlDbType.NVarChar, -1).Value = irelacionpersonal;
            cmd.Parameters.Add("@autorizaciondif", SqlDbType.NVarChar, -1).Value = iautorizaciondif;
            cmd.Parameters.Add("@cedulaautoevaluacion", SqlDbType.NVarChar, -1).Value = icedulaautoevaluacion;
            cmd.Parameters.Add("@papelmembretado", SqlDbType.NVarChar, -1).Value = ipapelmembretado;
            cmd.Parameters.Add("@autorizacionset", SqlDbType.NVarChar, -1).Value = iautorizacionset;
            cmd.Parameters.Add("@usodesuelo", SqlDbType.NVarChar, -1).Value = iusodesuelo; 
            cmd.Parameters.Add("@procesolimpieza", SqlDbType.NVarChar, -1).Value = iprocesolimpieza; 
            cmd.Parameters.Add("@relaciontipoanalisis", SqlDbType.NVarChar, -1).Value = irelaciontipoanalisis; 
            cmd.Parameters.Add("@actaverificacion", SqlDbType.NVarChar, -1).Value = iactaverificacion; 
            cmd.Parameters.Add("@avisofunc", SqlDbType.NVarChar, -1).Value = iavisofunc;

            cmd.Parameters.Add("@doctecatmedhosp", SqlDbType.NVarChar, -1).Value = idoctecatmedhosp;
            cmd.Parameters.Add("@programamedico", SqlDbType.NVarChar, -1).Value = iprogramamedico;
            cmd.Parameters.Add("@caracteristicasmecanicas", SqlDbType.NVarChar, -1).Value = icaracteristicasmecanicas;
            cmd.Parameters.Add("@fotografiasdeunidad", SqlDbType.NVarChar, -1).Value = ifotografiasdeunidad;
            cmd.Parameters.Add("@licenciasanitariaanterior", SqlDbType.NVarChar, -1).Value = ilicenciasanitariaanterior;
            cmd.Parameters.Add("@autorizacionresponsableanterior", SqlDbType.NVarChar, -1).Value = iautorizacionresponsableanterior;
            cmd.Parameters.Add("@antecedentesnopenales", SqlDbType.NVarChar, -1).Value = iantecedentesnopenales;
            cmd.Parameters.Add("@polizaseguro", SqlDbType.NVarChar, -1).Value = ipolizaseguro;
            cmd.Parameters.Add("@programaalimentacion", SqlDbType.NVarChar, -1).Value = iprogramaalimentacion;


            cmd.Parameters.Add("@titulo_MR", SqlDbType.NVarChar, -1).Value = ititulo_MR;
            cmd.Parameters.Add("@cedula_MR", SqlDbType.NVarChar, -1).Value = icedula_MR;
            cmd.Parameters.Add("@diploma_MR", SqlDbType.NVarChar, -1).Value = idiploma_MR;
            cmd.Parameters.Add("@curriculum_MR", SqlDbType.NVarChar, -1).Value = icurriculum_MR;
            cmd.Parameters.Add("@relacionpersonal_paramedico", SqlDbType.NVarChar, -1).Value = irelacionpersonal_paramedico;
            cmd.Parameters.Add("@documentacion_laboratorio", SqlDbType.NVarChar, -1).Value = idocumentacion_laboratorio;
            cmd.Parameters.Add("@copialicencia_matriz", SqlDbType.NVarChar, -1).Value = icopialicencia_matriz;
            cmd.Parameters.Add("@copiaautorizacion_matriz", SqlDbType.NVarChar, -1).Value = icopiaautorizacion_matriz;
            cmd.Parameters.Add("@documentacion_tecnico", SqlDbType.NVarChar, -1).Value = idocumentacion_tecnico;
            cmd.Parameters.Add("@documentacion_responsable", SqlDbType.NVarChar, -1).Value = idocumentacion_responsable;
            cmd.Parameters.Add("@formalimpieza", SqlDbType.NVarChar, -1).Value = iformalimpieza;


            cmd.Parameters.Add("@prevencion", SqlDbType.NVarChar, -1).Value = iprevencion; 
            cmd.Parameters.Add("@dicdoc", SqlDbType.NVarChar, -1).Value = idicdoc; 
            cmd.Parameters.Add("@dictec", SqlDbType.NVarChar, -1).Value = idictec; 
            cmd.Parameters.Add("@acta", SqlDbType.NVarChar, -1).Value = iacta; 
            cmd.Parameters.Add("@acusefinal", SqlDbType.NVarChar, -1).Value = iacusefinal; 

            cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    public bool newFileupload()
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;
            cmd.CommandText = "bitaseg.proc_newFileupload";

            //
            cmd.Parameters.Add("@folio", SqlDbType.Int).Value = folio;
            cmd.Parameters.Add("@sollicsan", SqlDbType.NVarChar, -1).Value = isollicsan;
            cmd.Parameters.Add("@solicitud", SqlDbType.NVarChar, -1).Value = isolicitud;
            cmd.Parameters.Add("@titulo", SqlDbType.NVarChar, -1).Value = ititulo;
            cmd.Parameters.Add("@cedula", SqlDbType.NVarChar, -1).Value = icedula;
            cmd.Parameters.Add("@diploma", SqlDbType.NVarChar, -1).Value = idiploma;
            cmd.Parameters.Add("@curriculum", SqlDbType.NVarChar, -1).Value = icurriculum;
            cmd.Parameters.Add("@fotografias", SqlDbType.NVarChar, -1).Value = ifotografias;
            cmd.Parameters.Add("@pagoresponsable", SqlDbType.NVarChar, -1).Value = ipagoresponsable;
            cmd.Parameters.Add("@altasat", SqlDbType.NVarChar, -1).Value = ialtasat;
            cmd.Parameters.Add("@planomemoria", SqlDbType.NVarChar, -1).Value = iplanomemoria;
            cmd.Parameters.Add("@relacionmaterial", SqlDbType.NVarChar, -1).Value = irelacionmaterial;
            cmd.Parameters.Add("@pago", SqlDbType.NVarChar, -1).Value = ipago;
            cmd.Parameters.Add("@programaact", SqlDbType.NVarChar, -1).Value = iprogramaact;
            cmd.Parameters.Add("@fotocopiaconvenio", SqlDbType.NVarChar, -1).Value = ifotocopiaconvenio;
            cmd.Parameters.Add("@libroregistro", SqlDbType.NVarChar, -1).Value = ilibroregistro;
            cmd.Parameters.Add("@descripciontecnicaembal", SqlDbType.NVarChar, -1).Value = idescripciontecnicaembal;
            cmd.Parameters.Add("@tarjetadecontrol", SqlDbType.NVarChar, -1).Value = itarjetadecontrol;
            cmd.Parameters.Add("@cartaconsentimiento", SqlDbType.NVarChar, -1).Value = icartaconsentimiento;
            cmd.Parameters.Add("@actaconstitutiva", SqlDbType.NVarChar, -1).Value = iactaconstitutiva;
            cmd.Parameters.Add("@reglamentointerno", SqlDbType.NVarChar, -1).Value = ireglamentointerno;
            cmd.Parameters.Add("@vistoproteccioncivil", SqlDbType.NVarChar, -1).Value = ivistoproteccioncivil;
            cmd.Parameters.Add("@relacionpersonal", SqlDbType.NVarChar, -1).Value = irelacionpersonal;
            cmd.Parameters.Add("@autorizaciondif", SqlDbType.NVarChar, -1).Value = iautorizaciondif;
            cmd.Parameters.Add("@cedulaautoevaluacion", SqlDbType.NVarChar, -1).Value = icedulaautoevaluacion;
            cmd.Parameters.Add("@papelmembretado", SqlDbType.NVarChar, -1).Value = ipapelmembretado;
            cmd.Parameters.Add("@autorizacionset", SqlDbType.NVarChar, -1).Value = iautorizacionset;
            cmd.Parameters.Add("@usodesuelo", SqlDbType.NVarChar, -1).Value = iusodesuelo;
            cmd.Parameters.Add("@procesolimpieza", SqlDbType.NVarChar, -1).Value = iprocesolimpieza;
            cmd.Parameters.Add("@relaciontipoanalisis", SqlDbType.NVarChar, -1).Value = irelaciontipoanalisis;
            cmd.Parameters.Add("@actaverificacion", SqlDbType.NVarChar, -1).Value = iactaverificacion;
            cmd.Parameters.Add("@avisofunc", SqlDbType.NVarChar, -1).Value = iavisofunc;

            cmd.Parameters.Add("@doctecatmedhosp", SqlDbType.NVarChar, -1).Value = idoctecatmedhosp;
            cmd.Parameters.Add("@programamedico", SqlDbType.NVarChar, -1).Value = iprogramamedico;
            cmd.Parameters.Add("@caracteristicasmecanicas", SqlDbType.NVarChar, -1).Value = icaracteristicasmecanicas;
            cmd.Parameters.Add("@fotografiasdeunidad", SqlDbType.NVarChar, -1).Value = ifotografiasdeunidad;
            cmd.Parameters.Add("@licenciasanitariaanterior", SqlDbType.NVarChar, -1).Value = ilicenciasanitariaanterior;
            cmd.Parameters.Add("@autorizacionresponsableanterior", SqlDbType.NVarChar, -1).Value = iautorizacionresponsableanterior;
            cmd.Parameters.Add("@antecedentesnopenales", SqlDbType.NVarChar, -1).Value = iantecedentesnopenales;
            cmd.Parameters.Add("@polizaseguro", SqlDbType.NVarChar, -1).Value = ipolizaseguro;
            cmd.Parameters.Add("@programaalimentacion", SqlDbType.NVarChar, -1).Value = iprogramaalimentacion;
            cmd.Parameters.Add("@titulo_MR", SqlDbType.NVarChar, -1).Value = ititulo_MR;
            cmd.Parameters.Add("@cedula_MR", SqlDbType.NVarChar, -1).Value = icedula_MR;
            cmd.Parameters.Add("@diploma_MR", SqlDbType.NVarChar, -1).Value = idiploma_MR;
            cmd.Parameters.Add("@curriculum_MR", SqlDbType.NVarChar, -1).Value = icurriculum_MR;
            cmd.Parameters.Add("@relacionpersonal_paramedico", SqlDbType.NVarChar, -1).Value = irelacionpersonal_paramedico;
            cmd.Parameters.Add("@documentacion_laboratorio", SqlDbType.NVarChar, -1).Value = idocumentacion_laboratorio;
            cmd.Parameters.Add("@copialicencia_matriz", SqlDbType.NVarChar, -1).Value = icopialicencia_matriz;
            cmd.Parameters.Add("@copiaautorizacion_matriz", SqlDbType.NVarChar, -1).Value = icopiaautorizacion_matriz;
            cmd.Parameters.Add("@documentacion_tecnico", SqlDbType.NVarChar, -1).Value = idocumentacion_tecnico;
            cmd.Parameters.Add("@documentacion_responsable", SqlDbType.NVarChar, -1).Value = idocumentacion_responsable;
            cmd.Parameters.Add("@formalimpieza", SqlDbType.NVarChar, -1).Value = iformalimpieza;

            cmd.Parameters.Add("@prevencion", SqlDbType.NVarChar, -1).Value = iprevencion;
            cmd.Parameters.Add("@dicdoc", SqlDbType.NVarChar, -1).Value = idicdoc;
            cmd.Parameters.Add("@dictec", SqlDbType.NVarChar, -1).Value = idictec;
            cmd.Parameters.Add("@acta", SqlDbType.NVarChar, -1).Value = iacta;
            cmd.Parameters.Add("@acusefinal", SqlDbType.NVarChar, -1).Value = iacusefinal;

            cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (Exception Ex)
        {

            throw Ex;
        }
    }
    #endregion
    #region SUBIR ARCHIVOS
    public struct InitialPreviewStruct
    {
        public bool Disabled;
        public List<string> InitialPreview;
        public List<IPC> InitialPreviewConfig;

    }
    public struct IPC
    {
        //public string caption;
        public string url;
        public string key;
        public string type;
        public string nombre_archivo;
        public string nombre_original;
    }
    public InitialPreviewStruct InitialPreview()
    {

        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_RefAArchivoLista";
            cmd.Parameters.Add("@id_RefA", SqlDbType.Int).Value = folio;
            SqlDataReader dr = cmd.ExecuteReader();
            //Contenedor principal
            InitialPreviewStruct result = new InitialPreviewStruct();
            //Initial previw
            List<string> ip = new List<string>();
            List<IPC> ipc = new List<IPC>();
            while (dr.Read())
            {
                string tipo = "";
                switch (dr["extension"].ToString())
                {
                    case ".pdf":
                        tipo = "pdf";
                        break;
                    default:
                        tipo = "image";
                        break;
                }
                ip.Add(String.Format("{0}/{1}", Principal.WebConfig("SITE_URL"), dr["nombre_archivo"]));
                ipc.Add(new IPC()
                {
                    //caption = String.Format("<a href='{0}/{1}' class='btn btn-secondary btn-sm' target='_blank' alt='Descargar'><i class='fa fa-download'></i></a>", Principal.WebConfig("SITE_URL"), dr["nombre_archivo"]),
                    //url = String.Format("{0}/comun/archivo-eliminar.aspx?tipo=plano", Principal.WebConfig("SITE_URL")),
                    key = dr["id_archivo"].ToString(),
                    type = tipo,
                    nombre_archivo = String.Format("{0}", dr["nombre_archivo"]),
                    nombre_original = String.Format("{0}", dr["nombre_original"])
                });
            }
            dr.Close();
            result.InitialPreview = ip;
            result.InitialPreviewConfig = ipc;
            return result;
        }
        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }
    public int Archivo(int folio, ArchivoSpec archivo)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        int id_plano_archivo = 0;
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_ReferenciaArchivo";
            cmd.Parameters.Add("@id_RefA", SqlDbType.Int).Value = folio;
            cmd.Parameters.Add("@mime_type", SqlDbType.NVarChar, 50).Value = archivo.MimeType;
            cmd.Parameters.Add("@nombre_archivo", SqlDbType.NVarChar, 250).Value = archivo.NombreArchivo;
            cmd.Parameters.Add("@nombre_original", SqlDbType.NVarChar, 250).Value = archivo.NombreOriginal;
            cmd.Parameters.Add("@extension", SqlDbType.NVarChar, 10).Value = archivo.Extension;
            cmd.Parameters.Add("@md5", SqlDbType.NVarChar, 50).Value = archivo.MD5;
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = archivo.UserLogin;
            cmd.Parameters.Add("@session_id", SqlDbType.NVarChar, 50).Value = archivo.SessionId;
            cmd.Parameters.Add("@fecha_reg", SqlDbType.DateTime).Value = archivo.FechaReg;
            cmd.Parameters.Add("@file_size", SqlDbType.BigInt).Value = archivo.FileSize;

            id_plano_archivo = Convert.ToInt32(cmd.ExecuteScalar());
            return id_plano_archivo;


        }

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }
    #endregion
}
public class ArchivoSpec
{
    public string MimeType { get; set; }
    public string NombreArchivo { get; set; }
    public string NombreOriginal { get; set; }
    public string Extension { get; set; }
    public string MD5 { get; set; }
    public string UserLogin { get; set; }
    public string SessionId { get; set; }
    public DateTime FechaReg { get; set; }
    public double FileSize { get; set; }
    public string Titulo { get; set; }
}
//public class Personas
//{
//    public Personas()
//    {

//    }
//    public Personas(int prmIdpersona)
//    {

//        try
//        {
//            id_persona = prmIdpersona;
//            MostrarDatos();
//        }
//        catch (Exception Ex)
//        {

//            throw Ex;
//        }

//    }

//}
//public class Establecimientos
//{
//    public Establecimientos()
//    {

//    }
//    public Establecimientos(int prmIdestablecimiento)
//    {

//        try
//        {
//            id_establecimiento = prmIdestablecimiento;
//            MostrarDatos();
//        }
//        catch (Exception Ex)
//        {

//            throw Ex;
//        }

//    }



//}