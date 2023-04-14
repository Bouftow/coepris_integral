using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Descripción breve de Class1
/// </summary>
public class RequisitosDos
{
    public RequisitosDos()
    {
    }

    #region Variables Requisitos
    bool r1 = false;
    bool r2 = false;
    bool r3 = false;
    bool r4 = false;
    bool r5 = false;
    bool r6 = false;
    bool r7 = false;
    bool r8 = false;
    bool r9 = false;
    bool r10 = false;
    bool r11 = false;
    bool r12 = false;
    bool r13 = false;
    bool r14 = false;
    bool r15 = false;
    bool r16 = false;
    bool r17 = false;
    bool r18 = false;
    bool r19 = false;
    bool r20 = false;
    bool r21 = false;
    bool r22 = false;
    bool r23 = false;
    bool r24 = false;
    bool r25 = false;
    bool r26 = false;
    bool r27 = false;
    bool r28 = false;
    bool r29 = false;
    bool r30 = false;
    bool r31 = false;
    bool r32 = false;
    bool r33 = false;
    bool r34 = false;
    bool r35 = false;
    bool r36 = false;
    bool r37 = false;
    bool r38 = false;
    bool r39 = false;
    bool r40 = false;
    bool r41 = false;
    bool r42 = false;
    bool r43 = false;
    bool r44 = false;
    bool r45 = false;
    bool r46 = false;
    bool r47 = false;
    bool r48 = false;
    bool r49 = false;
    bool r50 = false;
    bool r51 = false;
    bool r52 = false;
    bool r53 = false;
    bool r54 = false;
    bool r55 = false;
    bool r56 = false;
    bool r57 = false;
    bool r58 = false;
    bool r59 = false;
    bool r60 = false;
    bool r61 = false;
    bool r62 = false;
    bool r63 = false;
    bool r64 = false;
    bool r65 = false;
    bool r66 = false;
    bool r67 = false;
    bool r68 = false;
    bool r69 = false;
    bool r70 = false;
    bool r71 = false;
    bool r72 = false;
    bool r73 = false;
    bool r74 = false;
    bool r75 = false;
    bool r76 = false;
    bool r77 = false;
    bool r78 = false;
    bool r79 = false;
    bool r80 = false;
    bool r81 = false;
    bool r82 = false;
    bool r83 = false;





    #endregion
    #region Propiedades
    public bool R1 { get { return r1; } set { r1 = value; } }
    public bool R2 { get { return r2; } set { r2 = value; } }
    public bool R3 { get { return r3; } set { r3 = value; } }
    public bool R4 { get { return r4; } set { r4 = value; } }
    public bool R5 { get { return r5; } set { r5 = value; } }
    public bool R6 { get { return r6; } set { r6 = value; } }
    public bool R7 { get { return r7; } set { r7 = value; } }
    public bool R8 { get { return r8; } set { r8 = value; } }
    public bool R9 { get { return r9; } set { r9 = value; } }
    public bool R10 { get { return r10; } set { r10 = value; } }
    public bool R11 { get { return r11; } set { r11 = value; } }
    public bool R12 { get { return r12; } set { r12 = value; } }
    public bool R13 { get { return r13; } set { r13 = value; } }
    public bool R14 { get { return r14; } set { r14 = value; } }
    public bool R15 { get { return r15; } set { r15 = value; } }
    public bool R16 { get { return r16; } set { r16 = value; } }
    public bool R17 { get { return r17; } set { r17 = value; } }
    public bool R18 { get { return r18; } set { r18 = value; } }
    public bool R19 { get { return r19; } set { r19 = value; } }
    public bool R20 { get { return r20; } set { r20 = value; } }
    public bool R21 { get { return r21; } set { r21 = value; } }
    public bool R22 { get { return r22; } set { r22 = value; } }
    public bool R23 { get { return r23; } set { r23 = value; } }
    public bool R24 { get { return r24; } set { r24 = value; } }
    public bool R25 { get { return r25; } set { r25 = value; } }
    public bool R26 { get { return r26; } set { r26 = value; } }
    public bool R27 { get { return r27; } set { r27 = value; } }
    public bool R28 { get { return r28; } set { r28 = value; } }
    public bool R29 { get { return r29; } set { r29 = value; } }
    public bool R30 { get { return r30; } set { r30 = value; } }
    public bool R31 { get { return r31; } set { r31 = value; } }
    public bool R32 { get { return r32; } set { r32 = value; } }
    public bool R33 { get { return r33; } set { r33 = value; } }
    public bool R34 { get { return r34; } set { r34 = value; } }
    public bool R35 { get { return r35; } set { r35 = value; } }
    public bool R36 { get { return r36; } set { r36 = value; } }
    public bool R37 { get { return r37; } set { r37 = value; } }
    public bool R38 { get { return r38; } set { r38 = value; } }
    public bool R39 { get { return r39; } set { r39 = value; } }
    public bool R40 { get { return r40; } set { r40 = value; } }
    public bool R41 { get { return r41; } set { r41 = value; } }
    public bool R42 { get { return r42; } set { r42 = value; } }
    public bool R43 { get { return r43; } set { r43 = value; } }
    public bool R44 { get { return r44; } set { r44 = value; } }
    public bool R45 { get { return r45; } set { r45 = value; } }
    public bool R46 { get { return r46; } set { r46 = value; } }
    public bool R47 { get { return r47; } set { r47 = value; } }
    public bool R48 { get { return r48; } set { r48 = value; } }
    public bool R49 { get { return r49; } set { r49 = value; } }
    public bool R50 { get { return r50; } set { r50 = value; } }
    public bool R51 { get { return r51; } set { r51 = value; } }
    public bool R52 { get { return r52; } set { r52 = value; } }
    public bool R53 { get { return r53; } set { r53 = value; } }
    public bool R54 { get { return r54; } set { r54 = value; } }
    public bool R55 { get { return r55; } set { r55 = value; } }
    public bool R56 { get { return r56; } set { r56 = value; } }
    public bool R57 { get { return r57; } set { r57 = value; } }
    public bool R58 { get { return r58; } set { r58 = value; } }
    public bool R59 { get { return r59; } set { r59 = value; } }
    public bool R60 { get { return r60; } set { r60 = value; } }
    public bool R61 { get { return r61; } set { r61 = value; } }
    public bool R62 { get { return r62; } set { r62 = value; } }
    public bool R63 { get { return r63; } set { r63 = value; } }
    public bool R64 { get { return r64; } set { r64 = value; } }
    public bool R65 { get { return r65; } set { r65 = value; } }
    public bool R66 { get { return r66; } set { r66 = value; } }
    public bool R67 { get { return r67; } set { r67 = value; } }
    public bool R68 { get { return r68; } set { r68 = value; } }
    public bool R69 { get { return r69; } set { r69 = value; } }
    public bool R70 { get { return r70; } set { r70 = value; } }
    public bool R71 { get { return r71; } set { r71 = value; } }
    public bool R72 { get { return r72; } set { r72 = value; } }
    public bool R73 { get { return r73; } set { r73 = value; } }
    public bool R74 { get { return r74; } set { r74 = value; } }
    public bool R75 { get { return r75; } set { r75 = value; } }
    public bool R76 { get { return r76; } set { r76 = value; } }
    public bool R77 { get { return r77; } set { r77 = value; } }
    public bool R78 { get { return r78; } set { r78 = value; } }
    public bool R79 { get { return r79; } set { r79 = value; } }
    public bool R80 { get { return r80; } set { r80 = value; } }
    public bool R81 { get { return r81; } set { r81 = value; } }
    public bool R82 { get { return r82; } set { r82 = value; } }
    public bool R83 { get { return r83; } set { r83 = value; } }
    public string R1_nombre { get { return "SOLICITUD DE LICENCIA SANITARIA"; } }
    public string R2_nombre { get { return "SOLICITUD DE AUTORIZACIÓN DE RESPONSABLE"; } }
    public string R3_nombre { get { return "TÍTULO PROFESIONAL DEL RESPONSABLE SANITARIO"; } }
    public string R4_nombre { get { return "CÉDULA PROFESIONAL DEL RESPONSABLE SANITARIO"; } }
    public string R5_nombre { get { return "2 FOTOGRAFÍAS TAMAÑO INFANTIL DEL RESPONSABLE SANITARIO"; } }
    public string R6_nombre { get { return "ALTA ANTE LA S.H.C.P."; } }
    public string R7_nombre { get { return "PLANO Y MEMORIA DESCRIPTIVA"; } }
    public string R8_nombre { get { return "RELACIÓN DE MATERIAL Y EQUIPO EXISTENTE"; } }
    public string R9_nombre { get { return "PROGRAMA MÉDICO Y PROGRAMA DIARIO DE ACTIVIDADES"; } }
    public string R10_nombre { get { return "VISTO BUENO DE LA DIRECCIÓN DE  PROTECCIÓN CIVIL"; } }
    public string R11_nombre { get { return "PERMISO DE USO DE SUELO POR PARTE DE LA PRESIDENCIA MUNICIPAL"; } }
    public string R12_nombre { get { return "AUTORIZACIÓN POR PARTE DE LA SEP"; } }
    public string R13_nombre { get { return "PAPEL MEMBRETADO UTILIZADO"; } }
    public string R14_nombre { get { return "ACTA CONSTITUTIVA"; } }
    public string R15_nombre { get { return "CARTA DE NO ANTECEDENTES PENALES DEL PROPIETARIO, RESPONSABLE Y DIRECTIVOS"; } }
    public string R16_nombre { get { return "PÓLIZA DE SEGURO ANTE EVENTUALIDADES"; } }
    public string R17_nombre { get { return "REGLAMENTO INTERNO, MANUALES Y DOCUMENTACIÓN QUE ACREDITE LA APTITUD Y CAPACITACIÓN DE LAS PERSONAS QUE PRESTARÁN SERVICIOS"; } }
    public string R18_nombre { get { return "PROGRAMACIÓN DE LA ALIMENTACIÓN DE LA SEMANA Y DOCUMENTACIÓN PROFESIONAL DEL NUTRIÓLOGO"; } }
    public string R19_nombre { get { return "FORMATO DE PAGO SF-0027 POR CONCEPTO DEL PAGO DE TRÁMITE DE LICENCIA SANITARIA Y DE AUTORIZACION DE RESPONSABLE"; } }
    public string R20_nombre { get { return "LICENCIA SANITARIA ANTERIOR"; } }
    public string R21_nombre { get { return "AUTORIZACIÓN DE RESPONSABLE ANTERIOR"; } }
    public string R22_nombre { get { return "TÍTULO PROFESIONAL DEL RESPONSABLE MÉDICO"; } }
    public string R23_nombre { get { return "CÉDULA PROFESIONAL DEL RESPONSABLE MÉDICO"; } }
    public string R24_nombre { get { return "DIPLOMA DE ESPECIALIDAD (EN SU CASO), DEL RESPONSABLE MÉDICO"; } }
    public string R25_nombre { get { return "CURRICULUM VITAE DEL RESPONSABLE MÉDICO"; } }
    public string R26_nombre { get { return "PROGRAMA MÉDICO"; } }
    public string R27_nombre { get { return "RELACIÓN DE MATERIAL Y EQUIPO"; } }
    public string R28_nombre { get { return "PLANO Y MEMORIA DESCRIPTIVA (CROQUIS)"; } }
    public string R29_nombre { get { return "PAPEL MEMBRETADO"; } }
    public string R30_nombre { get { return "FORMATO DE PAGO SF-0027 POR CONCEPTO DEL PAGO DE TRÁMITE DE LA LICENCIA SANITARIA"; } }
    public string R31_nombre { get { return "AVISO DE FUNCIONAMIENTO"; } }
    public string R32_nombre { get { return "AUTORIZACIÓN DEL SISTEMA DIF"; } }
    public string R33_nombre { get { return "TÍTULO PROFESIONAL"; } }
    public string R34_nombre { get { return "DIPLOMA DE ESPECIALIDAD  "; } }
    public string R35_nombre { get { return "CÉDULA PROFESIONAL"; } }
    public string R36_nombre { get { return "CURRICULUM VITAE"; } }
    public string R37_nombre { get { return "2 FOTOGRAFÍAS"; } }
    public string R38_nombre { get { return "PLANO Y MEMORIA DESCRIPTIVA VALIDADO POR INGENIERÍA SANITARIA EN EL ESTADO."; } }
    public string R39_nombre { get { return "PROGRAMA MEDICO QUE INCLUYA LOS TIPOS DE INTERVENCIÓN QUIRÚRGICA REALIZADOS EN LA UNIDAD"; } }
    public string R40_nombre { get { return "DOCUMENTACIÓN PARA EL TRAMITE DE LABORATORIO O EN SU DEFECTO, ACUERDO NOTARIADO DE PRESTACIÓN DE SERVICIOS DE LABORATORIO, GABINETE DE RAYOS X Y DIETOLOGÍA"; } }
    public string R41_nombre { get { return "RELACIÓN DE PERSONAL MEDICO CON DOCUMENTACIÓN PROFESIONAL O COPIA DE LA LICENCIA SANITARIA DE CADA UNO, POR TURNOS"; } }
    public string R42_nombre { get { return "RELACIÓN DE PERSONAL PARAMÉDICO: ENFERMERÍA, LABORATORIO Y GABINETE, POR TURNOS"; } }
    public string R43_nombre { get { return "REGLAMENTO INTERNO"; } }
    public string R44_nombre { get { return "TÍTULO PROFESIONAL DE MÉDICO O LICENCIATURA EN TERAPIA FÍSICA Y REHABILITACIÓN"; } }
    public string R45_nombre { get { return "CÉDULA PROFESIONAL DE MÉDICO O LICENCIATURA EN TERAPIA FÍSICA Y REHABILITACIÓN."; } }
    public string R46_nombre { get { return "DIPLOMA DE ESPECIALIDAD (EN SU CASO)"; } }
    public string R47_nombre { get { return "PROGRAMA MÉDICO Y/O PROGRAMA DE ACTIVIDADES"; } }
    public string R48_nombre { get { return "RELACIÓN DE PERSONAL QUE LABORA EN EL ESTABLECIMIENTO"; } }
    public string R49_nombre { get { return "PAPEL MEMBRETADO TAMAÑO CARTA, CON LOS DATOS PROFESIONALES (NO RECETA)."; } }
    public string R50_nombre { get { return "RELACIÓN DE PERSONAL MÉDICO Y PARAMÉDICO CON DOCUMENTACIÓN PROFESIONAL DE C/U."; } }
    public string R51_nombre { get { return "DIPLOMA DE CURSO DEL RESPONSABLE MÉDICO"; } }
    public string R52_nombre { get { return "PROGRAMA DE ACTIVIDADES"; } }
    public string R53_nombre { get { return "CEDULA DE AUTOEVALUACION NOM-028-SSA2-1999"; } }
    public string R54_nombre { get { return "RELACIÓN DE PERSONAL MÉDICO Y PARAMÉDICO CON DOCUMENTACIÓN PROFESIONAL CADA UNO"; } }
    public string R55_nombre { get { return "2 FOTOGRAFIAS TAMAÑO INFANTIL DE FRENTE DEL RESPONSABLE SANITARIO"; } }
    public string R56_nombre { get { return "DIPLOMA DE ESPECIALIZACIÓN"; } }
    public string R57_nombre { get { return "RELACIÓN DE ANÁLISIS"; } }
    public string R58_nombre { get { return "RELACIÓN DE PERSONAL CON DOCUMENTACIÓN PROFESIONAL DE CADA UNO"; } }
    public string R59_nombre { get { return "COPIA DE LA LICENCIA SANITARIA DEL LABORATORIO MATRIZ"; } }
    public string R60_nombre { get { return "COPIA DE LA AUTORIZACIÓN DE RESPONSABLE DEL LABORATORIO MATRIZ"; } }
    public string R61_nombre { get { return "SOLICITUD AUTORIZACIÓN DE AUXILIAR DE RESPONSABLE"; } }
    public string R62_nombre { get { return "TÍTULO PROFESIONAL, CÉDULA PROFESIONAL O DOCUMENTACIÓN PROFESIONAL DEL AUXILIAR DE RESPONSABLE (QUÍMICO O TÉCNICO)"; } }
    public string R63_nombre { get { return "2 FOTOGRAFÍAS TAMAÑO INFANTIL DE FRENTE DEL AUXILIAR DE RESPONSABLE SANITARIO"; } }
    public string R64_nombre { get { return "ORIGINAL DE AUTORIZACIÓN DE AUXILIAR DE RESPONSABLE ANTERIOR"; } }
    public string R65_nombre { get { return "TITULO PROFESIONAL, CERTIFICADO DEL RESPONSABLE SANITARIO"; } }
    public string R66_nombre { get { return "CEDULA PROFESIONAL DEL RESPONSABLE SANITARIO, EN SU CASO"; } }
    public string R67_nombre { get { return "DIPLOMA DE ESPECIALIZACIÓN, EN SU CASO"; } }
    public string R68_nombre { get { return "DOCUMENTACIÓN PROFESIONAL DEL TÉCNICO DE ATENCIÓN MÉDICA PREHOSPITALARIA"; } }
    public string R69_nombre { get { return "CARACTERÍSTICAS MECÁNICAS DE LA UNIDAD"; } }
    public string R70_nombre { get { return "FOTOGRAFÍAS DE LA UNIDAD"; } }
    public string R71_nombre { get { return "DESCRIPCIÓN DE LA TÉCNICA DE EMBALSAMAMIENTO"; } }
    public string R72_nombre { get { return "FOTOCOPIA DEL CONVENIO  ANTE LA PGJE"; } }
    public string R73_nombre { get { return "LIBRO DE REGISTRO DE CADÁVERES PARA AUTORIZAR."; } }
    public string R74_nombre { get { return "ACTA CONSTITUTIVA DE LA UNIVERSIDAD"; } }
    public string R75_nombre { get { return "TÍTULO PROFESIONAL DEL RESPONSABLE SANITARIO CATEGORÍA I: MÉDICO GENERAL O ESPECIALISTA."; } }
    public string R76_nombre { get { return "TÍTULO PROFESIONAL DEL RESPONSABLE SANITARIO CATEROGÍA Ii: ESPECIALISTA EN DERMATOLOGÍA"; } }
    public string R77_nombre { get { return "TÍTULO PROFESIONAL DEL RESPONSABLE SANITARIO CATEGORÍA III: ESPECIALISTA EN ENDOCRINOLOGÍA"; } }
    public string R78_nombre { get { return "CÉDULA PROFESIONAL DEL RESPONSABLE SANITARIO (CONFORME A LO ANTERIOR)"; } }
    public string R79_nombre { get { return "DIPLOMA DE ESPECIALIZACIÓN DEL RESPONSABLE SANITARIO (CONFORME A LO ANTERIOR), EN SU CASO"; } }
    public string R80_nombre { get { return "DOCUMENTACIÓN QUE ACREDITE AL RESPONSABLE"; } }
    public string R81_nombre { get { return "FORMA DE LIMPIEZA Y ESTERILIZACIÓN"; } }
    public string R82_nombre { get { return "DIPLOMA DE ESPECIALIZACIÓN DEL RESPONSABLE SANITARIO"; } }
    public string R83_nombre { get { return "RELACIÓN DE PERSONAL DE ENFERMERÍA"; } }


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
            cmd.CommandText = "select * from bitaseg.Lista_Tramites where id_tramite = @id_tramite";
            cmd.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id;
            cmd.Connection = cnn;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                r1 = (bool)dr["r1"];
                r2 = (bool)dr["r2"];
                r3 = (bool)dr["r3"];
                r4 = (bool)dr["r4"];
                r5 = (bool)dr["r5"];
                r6 = (bool)dr["r6"];
                r7 = (bool)dr["r7"];
                r8 = (bool)dr["r8"];
                r9 = (bool)dr["r9"];
                r10 = (bool)dr["r10"];
                r11 = (bool)dr["r11"];
                r12 = (bool)dr["r12"];
                r13 = (bool)dr["r13"];
                r14 = (bool)dr["r14"];
                r15 = (bool)dr["r15"];
                r16 = (bool)dr["r16"];
                r17 = (bool)dr["r17"];
                r18 = (bool)dr["r18"];
                r19 = (bool)dr["r19"];
                r20 = (bool)dr["r20"];
                r21 = (bool)dr["r21"];
                r22 = (bool)dr["r22"];
                r23 = (bool)dr["r23"];
                r24 = (bool)dr["r24"];
                r25 = (bool)dr["r25"];
                r26 = (bool)dr["r26"];
                r27 = (bool)dr["r27"];
                r28 = (bool)dr["r28"];
                r29 = (bool)dr["r29"];
                r30 = (bool)dr["r30"];
                r31 = (bool)dr["r31"];
                r32 = (bool)dr["r32"];
                r33 = (bool)dr["r33"];
                r34 = (bool)dr["r34"];
                r35 = (bool)dr["r35"];
                r36 = (bool)dr["r36"];
                r37 = (bool)dr["r37"];
                r38 = (bool)dr["r38"];
                r39 = (bool)dr["r39"];
                r40 = (bool)dr["r40"];
                r41 = (bool)dr["r41"];
                r42 = (bool)dr["r42"];
                r43 = (bool)dr["r43"];
                r44 = (bool)dr["r44"];
                r45 = (bool)dr["r45"];
                r46 = (bool)dr["r46"];
                r47 = (bool)dr["r47"];
                r48 = (bool)dr["r48"];
                r49 = (bool)dr["r49"];
                r50 = (bool)dr["r50"];
                r51 = (bool)dr["r51"];
                r52 = (bool)dr["r52"];
                r53 = (bool)dr["r53"];
                r54 = (bool)dr["r54"];
                r55 = (bool)dr["r55"];
                r56 = (bool)dr["r56"];
                r57 = (bool)dr["r57"];
                r58 = (bool)dr["r58"];
                r59 = (bool)dr["r59"];
                r60 = (bool)dr["r60"];
                r61 = (bool)dr["r61"];
                r62 = (bool)dr["r62"];
                r63 = (bool)dr["r63"];
                r64 = (bool)dr["r64"];
                r65 = (bool)dr["r65"];
                r66 = (bool)dr["r66"];
                r67 = (bool)dr["r67"];
                r68 = (bool)dr["r68"];
                r69 = (bool)dr["r69"];
                r70 = (bool)dr["r70"];
                r71 = (bool)dr["r71"];
                r72 = (bool)dr["r72"];
                r73 = (bool)dr["r73"];
                r74 = (bool)dr["r74"];
                r75 = (bool)dr["r75"];
                r76 = (bool)dr["r76"];
                r77 = (bool)dr["r77"];
                r78 = (bool)dr["r78"];
                r79 = (bool)dr["r79"];
                r80 = (bool)dr["r80"];
                r81 = (bool)dr["r81"];
                r81 = (bool)dr["r82"];
                r81 = (bool)dr["r83"];


            }
            dr.Close();
            cnn.Close();



            
        }
        catch (Exception Ex)
        {

            throw Ex;
        }

    }
   
}