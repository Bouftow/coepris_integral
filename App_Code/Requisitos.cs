using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Descripción breve de Class1
/// </summary>
public class Requisitos
{
    public Requisitos()
    {
      
    }

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

    //bool avisofunc = false;
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


    

    


    #endregion
    #region Propiedades Requisitos
    public bool SOLLICSAN
    {
        get { return sollicsan; }
        set { sollicsan = value; }
    }
    public bool SOLICITUD
    {
        get { return solicitud; }
        set { solicitud = value; }
    }
    public bool TITUTLO
    {
        get { return titulo; }
        set { titulo = value; }
    }
    public bool CEDULA
    {
        get { return cedula; }
        set { cedula = value; }
    }
    public bool DIPLOMA
    {
        get { return diploma; }
        set { diploma = value; }
    }
    public bool CURRICULUM
    {
        get { return curriculum; }
        set { curriculum = value; }
    }
    public bool FOTOGRAFIAS
    {
        get { return fotografias; }
        set { fotografias = value; }
    }
    public bool PAGORESPONSABLE
    {
        get { return pagoresponsable; }
        set { pagoresponsable = value; }
    }
    public bool ALTASAT
    {
        get { return altasat; }
        set { altasat = value; }
    }
    public bool PLANOMEMORIA
    {
        get { return planomemoria; }
        set { planomemoria = value; }
    }
    public bool RELACIONMATERIAL
    {
        get { return relacionmaterial; }
        set { relacionmaterial = value; }
    }
    public bool PAGO
    {
        get { return pago; }
        set { pago = value; }
    }
    public bool PROGRAMAACT
    {
        get { return programaact; }
        set { programaact = value; }
    }
    public bool FOTOCOPIACONVENIO
    {
        get { return fotocopiaconvenio; }
        set { fotocopiaconvenio = value; }
    }
    public bool LIBROREGISTRO
    {
        get { return libroregistro; }
        set { libroregistro = value; }
    }
    public bool DESCRIPCIONTECNICAEMBAL
    {
        get { return descripciontecnicaembal; }
        set { descripciontecnicaembal = value; }
    }
    public bool TARJETADECONTROL
    {
        get { return tarjetadecontrol; }
        set { tarjetadecontrol = value; }
    }
    public bool CARTACONSENTIMIENTO
    {
        get { return cartaconsentimiento; }
        set { cartaconsentimiento = value; }
    }
    public bool ACTACONSTITUTIVA
    {
        get { return actaconstitutiva; }
        set { actaconstitutiva = value; }
    }
    public bool REGLAMENTOINTERNO
    {
        get { return reglamentointerno; }
        set { reglamentointerno = value; }
    }
    public bool VISTOPROTECCIONCIVIL
    {
        get { return vistoproteccioncivil; }
        set { vistoproteccioncivil = value; }
    }
    public bool RELACIONPERSONAL
    {
        get { return relacionpersonal; }
        set { relacionpersonal = value; }
    }
    public bool AUTORIZACIONDIF
    {
        get { return autorizaciondif; }
        set { autorizaciondif = value; }
    }
    public bool CEDULAAUTOEVALUACION
    {
        get { return cedulaautoevaluacion; }
        set { cedulaautoevaluacion = value; }
    }
    public bool PAPELMEMBRETADO
    {
        get { return papelmembretado; }
        set { papelmembretado = value; }
    }
    public bool AUTORIZACIONSET
    {
        get { return autorizacionset; }
        set { autorizacionset = value; }
    }
    public bool USODESUELO
    {
        get { return usodesuelo; }
        set { usodesuelo = value; }
    }
    public bool PROCESOLIMPIEZA
    {
        get { return procesolimpieza; }
        set { procesolimpieza = value; }
    }
    public bool RELACIONTIPOANALISIS
    {
        get { return relaciontipoanalisis; }
        set { relaciontipoanalisis = value; }
    }
    public bool ACTAVERIFICACION
    {
        get { return actaverificacion; }
        set { actaverificacion = value; }
    }
    public bool AVISOFUNC
    {
        get { return avisofunc; }
        set { avisofunc = value; }
    }
    public bool DOCTECATMEDHOSP
    {
        get { return doctecatmedhosp; }
        set { doctecatmedhosp = value; }
    }
    public bool PROGRAMAMEDICO
    {
        get { return programamedico; }
        set { programamedico = value; }
    }
    public bool CARACTERISTICASMECANICAS
    {
        get { return caracteristicasmecanicas; }
        set { caracteristicasmecanicas = value; }
    }
    public bool FOTOGRAFIASDEUNIDAD
    {
        get { return fotografiasdeunidad; }
        set { fotografiasdeunidad = value; }
    }
    public bool LICENCIASANITARIAANTERIOR
    {
        get { return licenciasanitariaanterior; }
        set { licenciasanitariaanterior = value; }
    }
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


    #endregion
    //#region Nombre de Tramites
    //#region Propiedades Requisitos
    //public string SOLLICSAN_nombre{get { return "SOLICITUD DE LICENCIA SANITARIA"; }}
    //public string SOLICITUD_nombre{get { return "SOLICITUD AUTORIZACION DE RESPONSABLE"; }}
    //public string TITUTLO_nombre{get { return "TITULO PROFESIONAL DEL RESPONSABLE SANITARIO"; }}
    //public string CEDULA_nombre { get { return "CEDULA PROFESIONAL DEL RESPONSABLE SANITARIO"; }}
    //public string DIPLOMA_nombre { get { return "DIPLOMA DE ESPECIALIDAD DEL RESPONSABLE MÉDICO"; }}
    //public string CURRICULUM_nombre {get { return "CURRICULUM VITAE DEL RESPONSABLE SANITARIO"; }}
    //public string FOTOGRAFIAS_nombre {get { return "2 FOTOGRAFIAS TAMAÑO INFANTIL DE FRENTE DEL RESPONSABLE SANITARIO"; }}
    ////public string PAGORESPONSABLE
    ////{
    ////    get { return pagoresponsable; }
    ////    set { pagoresponsable = value; }
    ////}
    //public string ALTASAT_nombre {get { return "ALTA ANTE LA S.H.C.P."; }}
    //public string PLANOMEMORIA_nombre{get { return "PLANO Y MEMORIA DESCRIPTIVA";}}
    //public string RELACIONMATERIAL_nombre {get { return "RELACIÓN DE MATERIAL Y EQUIPO EXISTENTE"; }}
    //public string PAGO_nombre {get { return "FORMATO DE PAGO SF-0027 POR CONCEPTO DEL PAGO DE TRÁMITE DE LA LICENCIA SANITARIA Y RESPONSABLE SANITARIO"; }}
    //public string PROGRAMAACT_nombre {get { return "PROGRAMA MÉDICO Y/O PROGRAMA DIARIO DE ACTIVIDADES"; }}
    //public string FOTOCOPIACONVENIO_nombre {get { return "FOTOCOPIA DEL CONVENIO  ANTE LA PGJE"; }}
    //public string LIBROREGISTRO_nombre {get { return "LIBRO DE REGISTRO DE CADÁVERES PARA AUTORIZAR"; }}
    //public string DESCRIPCIONTECNICAEMBAL_nombre {get { return "DESCRIPCIÓN DE LA TÉCNICA DE EMBALSAMAMIENTO"; }}
    ////public bool TARJETADECONTROL
    ////{
    ////    get { return tarjetadecontrol; }
    ////    set { tarjetadecontrol = value; }
    ////}
    ////public bool CARTACONSENTIMIENTO
    ////{
    ////    get { return cartaconsentimiento; }
    ////    set { cartaconsentimiento = value; }
    ////}
    //public string ACTACONSTITUTIVA_nombre {get { return "ACTA CONSTITUTIVA"; }}
    //public bool REGLAMENTOINTERNO
    //{
    //    get { return reglamentointerno; }
    //    set { reglamentointerno = value; }
    //}
    //public string VISTOPROTECCIONCIVIL_nombre { get { return "VISTO BUENO DE LA DIRECCIÓN DE  PROTECCIÓN CIVIL"; }}
    //public bool RELACIONPERSONAL
    //{
    //    get { return relacionpersonal; }
    //    set { relacionpersonal = value; }
    //}
    //public bool AUTORIZACIONDIF
    //{
    //    get { return autorizaciondif; }
    //    set { autorizaciondif = value; }
    //}
    //public bool CEDULAAUTOEVALUACION
    //{
    //    get { return cedulaautoevaluacion; }
    //    set { cedulaautoevaluacion = value; }
    //}
    //public bool PAPELMEMBRETADO
    //{
    //    get { return papelmembretado; }
    //    set { papelmembretado = value; }
    //}
    //public bool AUTORIZACIONSET
    //{
    //    get { return autorizacionset; }
    //    set { autorizacionset = value; }
    //}
    //public bool USODESUELO
    //{
    //    get { return usodesuelo; }
    //    set { usodesuelo = value; }
    //}
    //public bool PROCESOLIMPIEZA
    //{
    //    get { return procesolimpieza; }
    //    set { procesolimpieza = value; }
    //}
    //public bool RELACIONTIPOANALISIS
    //{
    //    get { return relaciontipoanalisis; }
    //    set { relaciontipoanalisis = value; }
    //}
    //public bool ACTAVERIFICACION
    //{
    //    get { return actaverificacion; }
    //    set { actaverificacion = value; }
    //}
    //public bool AVISOFUNC
    //{
    //    get { return avisofunc; }
    //    set { avisofunc = value; }
    //}
    //public bool DOCTECATMEDHOSP
    //{
    //    get { return doctecatmedhosp; }
    //    set { doctecatmedhosp = value; }
    //}
    //public string PROGRAMAMEDICO_nombre {get { return "PROGRAMA MEDICO Y PROGRAMA DIARIO DE ACTIVIDADES"; }}
    //public bool CARACTERISTICASMECANICAS
    //{
    //    get { return caracteristicasmecanicas; }
    //    set { caracteristicasmecanicas = value; }
    //}
    //public bool FOTOGRAFIASDEUNIDAD
    //{
    //    get { return fotografiasdeunidad; }
    //    set { fotografiasdeunidad = value; }
    //}
    //public string LICENCIASANITARIAANTERIOR_nombre {get { return "LICENCIA SANITARIA ANTERIOR"; }}
    //public string AUTORIZACIONRESPONSABLEANTERIOR_nombre { get { return "AUTORIZACION DE RESPONSABLE ANTERIOR"; }}
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
    //public bool TITULO_MR
    //{
    //    get { return titulo_MR; }
    //    set { titulo_MR = value; }
    //}
    //public bool CEDULA_MR
    //{
    //    get { return cedula_MR; }
    //    set { cedula_MR = value; }
    //}
    //public string DIPLOMA_MR_nombre {get { return "DIPLOMA DE CURSO DEL RESPONSABLE MÉDICO"; }}
    //public string CURRICULUM_MR_nombre {get { return "CURRICULUM VITAE DEL RESPONSABLE MÉDICO"; }}
    //public bool RELACIONPERSONAL_PARAMEDICO
    //{
    //    get { return relacionpersonal_paramedico; }
    //    set { relacionpersonal_paramedico = value; }
    //}
    //public bool DOCUMENTACION_LABORATORIO
    //{
    //    get { return documentacion_laboratorio; }
    //    set { documentacion_laboratorio = value; }
    //}
    //public bool COPIALICENCIA_MATRIZ
    //{
    //    get { return copialicencia_matriz; }
    //    set { copialicencia_matriz = value; }
    //}
    //public bool COPIAAUTORIZACION_MATRIZ
    //{
    //    get { return copiaautorizacion_matriz; }
    //    set { copiaautorizacion_matriz = value; }
    //}
    //public bool DOCUMENTACION_TECNICO
    //{
    //    get { return documentacion_tecnico; }
    //    set { documentacion_tecnico = value; }
    //}
    //public bool DOCUMENTACION_RESPONSABLE
    //{
    //    get { return documentacion_responsable; }
    //    set { documentacion_responsable = value; }
    //}
    //public bool FORMALIMPIEZA
    //{
    //    get { return formalimpieza; }
    //    set { formalimpieza = value; }
    //}


    //#endregion
    //#endregion
    public void Cargar(int id)
    {
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from bitaseg.Lista_Tramites2 where id_tramite = @id_tramite";
            cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id;
            cmd.Connection = cnn;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                sollicsan = (bool)dr["sollicsan"];
                solicitud = (bool)dr["solicitud"];
                titulo = (bool)dr["titulo"];
                cedula = (bool)dr["cedula"];
                diploma = (bool)dr["diploma"];
                curriculum = (bool)dr["curriculum"];
                fotografias = (bool)dr["fotografias"];
                pagoresponsable = (bool)dr["pagoresponsable"];
                altasat = (bool)dr["altasat"];
                planomemoria = (bool)dr["planomemoria"];
                relacionmaterial = (bool)dr["relacionmaterial"];
                pago = (bool)dr["pago"];
                programaact = (bool)dr["programaact"];
                fotocopiaconvenio = (bool)dr["fotocopiaconvenio"];
                libroregistro = (bool)dr["libroregistro"];
                descripciontecnicaembal = (bool)dr["descripciontecnicaembal"];
                tarjetadecontrol = (bool)dr["tarjetadecontrol"];
                cartaconsentimiento = (bool)dr["cartaconsentimiento"];
                actaconstitutiva = (bool)dr["actaconstitutiva"];
                reglamentointerno = (bool)dr["reglamentointerno"];
                vistoproteccioncivil = (bool)dr["vistoproteccioncivil"];
                relacionpersonal = (bool)dr["relacionpersonal"];
                autorizaciondif = (bool)dr["autorizaciondif"];
                cedulaautoevaluacion = (bool)dr["cedulaautoevaluacion"];
                papelmembretado = (bool)dr["papelmembretado"];
                autorizacionset = (bool)dr["autorizacionset"];
                usodesuelo = (bool)dr["usodesuelo"];
                procesolimpieza = (bool)dr["procesolimpieza"];
                relaciontipoanalisis = (bool)dr["relaciontipoanalisis"];

                actaverificacion = (bool)dr["actaverificacion"];
                avisofunc = (bool)dr["avisofunc"];

                doctecatmedhosp = (bool)dr["doctecatmedhosp"];
                programamedico = (bool)dr["programamedico"];
                caracteristicasmecanicas = (bool)dr["caracteristicasmecanicas"];
                fotografiasdeunidad = (bool)dr["fotografiasdeunidad"];
                licenciasanitariaanterior = (bool)dr["licenciasanitariaanterior"];
                autorizacionresponsableanterior = (bool)dr["autorizacionresponsableanterior"];
                antecedentesnopenales = (bool)dr["antecedentesnopenales"];
                polizaseguro = (bool)dr["polizaseguro"];
                programaalimentacion = (bool)dr["programaalimentacion"];

                titulo_MR = (bool)dr["titulo_MR"];
                cedula_MR = (bool)dr["cedula_MR"];
                diploma_MR = (bool)dr["diploma_MR"];
                curriculum_MR = (bool)dr["curriculum_MR"];
                relacionpersonal_paramedico = (bool)dr["relacionpersonal_paramedico"];
                documentacion_laboratorio = (bool)dr["documentacion_laboratorio"];
                copialicencia_matriz = (bool)dr["copialicencia_matriz"];
                copiaautorizacion_matriz = (bool)dr["copiaautorizacion_matriz"];
                documentacion_tecnico = (bool)dr["documentacion_tecnico"];
                documentacion_responsable = (bool)dr["documentacion_responsable"];
                formalimpieza = (bool)dr["formalimpieza"];
            }
            dr.Close();
            cnn.Close();

            
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
    //public void Cargar2(int id)
    //{
    //    try
    //    {
    //        SqlConnection cnn = new SqlConnection();
    //        cnn.ConnectionString = Principal.CnnStr0;
    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.CommandType = CommandType.Text;
    //        cmd.CommandText = "select * from bitaseg.Lista_Tramites where id_tramite = @id_tramite";
    //        cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id;
    //        cmd.Connection = cnn;

    //        SqlDataReader dr = cmd.ExecuteReader();
    //        if (dr.Read())
    //        {

    //            sollicsan = (bool)dr["sollicsan"];
    //            solicitud = (bool)dr["solicitud"];
    //            titulo = (bool)dr["titulo"];
    //            cedula = (bool)dr["cedula"];
    //            diploma = (bool)dr["diploma"];
    //            curriculum = (bool)dr["curriculum"];
    //            fotografias = (bool)dr["fotografias"];
    //            pagoresponsable = (bool)dr["pagoresponsable"];
    //            altasat = (bool)dr["altasat"];
    //            planomemoria = (bool)dr["planomemoria"];
    //            relacionmaterial = (bool)dr["relacionmaterial"];
    //            pago = (bool)dr["pago"];
    //            programaact = (bool)dr["programaact"];
    //            fotocopiaconvenio = (bool)dr["fotocopiaconvenio"];
    //            libroregistro = (bool)dr["libroregistro"];
    //            descripciontecnicaembal = (bool)dr["descripciontecnicaembal"];
    //            tarjetadecontrol = (bool)dr["tarjetadecontrol"];
    //            cartaconsentimiento = (bool)dr["cartaconsentimiento"];
    //            actaconstitutiva = (bool)dr["actaconstitutiva"];
    //            reglamentointerno = (bool)dr["reglamentointerno"];
    //            vistoproteccioncivil = (bool)dr["vistoproteccioncivil"];
    //            relacionpersonal = (bool)dr["relacionpersonal"];
    //            autorizaciondif = (bool)dr["autorizaciondif"];
    //            cedulaautoevaluacion = (bool)dr["cedulaautoevaluacion"];
    //            papelmembretado = (bool)dr["papelmembretado"];
    //            autorizacionset = (bool)dr["autorizacionset"];
    //            usodesuelo = (bool)dr["usodesuelo"];
    //            procesolimpieza = (bool)dr["procesolimpieza"];
    //            relaciontipoanalisis = (bool)dr["relaciontipoanalisis"];
    //            actaverificacion = (bool)dr["actaverificacion"];
    //            avisofunc = (bool)dr["avisofunc"];
    //            doctecatmedhosp = (bool)dr["doctecatmedhosp"];
    //            programamedico = (bool)dr["programamedico"];
    //            caracteristicasmecanicas = (bool)dr["caracteristicasmecanicas"];
    //            fotografiasdeunidad = (bool)dr["fotografiasdeunidad"];
    //            licenciasanitariaanterior = (bool)dr["licenciasanitariaanterior"];
    //            autorizacionresponsableanterior = (bool)dr["autorizacionresponsableanterior"];
    //            antecedentesnopenales = (bool)dr["antecedentesnopenales"];
    //            polizaseguro = (bool)dr["polizaseguro"];
    //            programaalimentacion = (bool)dr["programaalimentacion"];

    //        }
    //        dr.Close();
    //        cnn.Close();


    //    }
    //    catch (Exception Ex)
    //    {
    //        throw Ex;
    //    }

    //}
}