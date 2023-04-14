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
public partial class Captura_Fumigacion : System.Web.UI.Page
{ Usuarios usuarios = new Usuarios();

    //usuarios.DatosDeRegistro(User.Identity.Name);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            riesgo.Text = Request.Params["r"];
            verificacion.Text = Request.Params["v"];
            modalidad.Text = Request.Params["m"];
            categoria.Value = Request.Params["c"];
            id_tramite.Text = Request.Params["t"];



            ModalidadTramitesDropDownList();

            ddlCategorias.SelectedValue = modalidad.Text;
            categoriareal.Text = categoria.Value;


            this.Form.Attributes.Add("autocomplete", "off");
        }
        if (IsPostBack)
        {


            categoriareal.Text = categoria.Value;
            if (categoriareal.Text.ToString() != "3")
            {
                RequiredFieldValidator11.IsValid = true;
                RequiredFieldValidator12.IsValid = true;
                RequiredFieldValidator13.IsValid = true;
                //RequiredFieldValidator14.IsValid = true;
                //RequiredFieldValidator3.IsValid = true;
                RequiredFieldValidator11.Enabled = false;
                RequiredFieldValidator12.Enabled = false;
                RequiredFieldValidator13.Enabled = false;
                //RequiredFieldValidator14.Enabled = false;
                //RequiredFieldValidator3.Enabled = false;

                //txtRnombre.Text = "A";
                //txtRapellidom.Text = "B";
                //txtRapellidop.Text = "C";
                //txtRcedula.Text = "D";
                //txtRgrado.Text = "E";
                //txtHorario.Text = "F";
            }


        }
    }


    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> BuscarCURP(string prefixText, int count)
    {
        using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Top 5 * from bitaseg.personas where curp like '%'+ @SearchCurp + '%'";
                cmd.Parameters.AddWithValue("@SearchCurp", prefixText);
                cmd.Connection = con;
                con.Open();

                List<string> CURP = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        CURP.Add(sdr["curp"].ToString());

                        //CURP.Add(sdr["nombre_completo"].ToString());
                    }
                }
                con.Close();
                return CURP;
            }
        }
    }
    //[WebMethod]
    //public static List<string> GetCurp(string curp)
    //{
    //    List<string> curpResult = new List<string>();
    //    using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "select Top 5 curp from bitaseg.personas";
    //            cmd.Connection = con;
    //            con.Open();
    //            cmd.Parameters.AddWithValue("@Searchcurp", curp);
    //            SqlDataReader dr = cmd.ExecuteReader();
    //            while (dr.Read())
    //            {
    //                curpResult.Add(dr["curp"].ToString());
    //            }


    //            con.Close();
    //            return curpResult;
    //        }
    //    }

    //}

    //[WebMethod]
    //public static List<string> GetRfc(string rfc)
    //{
    //    List<string> rfcResult = new List<string>();
    //    using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "select Top 5 rfc from bitaseg.establecimientos ";
    //            cmd.Connection = con;
    //            con.Open();
    //            //cmd.Parameters.AddWithValue("@Searchrfc", rfc);
    //            SqlDataReader dr = cmd.ExecuteReader();
    //            while (dr.Read())
    //            {
    //                rfcResult.Add(dr["rfc"].ToString());

    //            }


    //            con.Close();
    //            return rfcResult;
    //        }
    //    }



    //}

    protected void Application_Error(object sender, EventArgs e)
    {
        if (IsMaxRequestExceededException(this.Server.GetLastError()))
        {
            this.Server.ClearError();
            this.Server.Transfer("~/ErrorMaxRequestExceeded.html");
        }
    }

    const int TimedOutExceptionCode = -2147467259;

    private static bool IsMaxRequestExceededException(Exception e)
    {
        // unhandled errors = caught at global.ascx level
        // http exception = caught at page level

        Exception main;
        var unhandled = e as HttpUnhandledException;

        if (unhandled != null && unhandled.ErrorCode == TimedOutExceptionCode)
        {
            main = unhandled.InnerException;
        }
        else
        {
            main = e;
        }


        var http = main as HttpException;

        if (http != null && http.ErrorCode == TimedOutExceptionCode)
        {
            // hack: no real method of identifying if the error is max request exceeded as 
            // it is treated as a timeout exception
            if (http.StackTrace.Contains("GetEntireRawContent"))
            {
                // MAX REQUEST HAS BEEN EXCEEDED
                return true;
            }
        }

        return false;
    }

    private DataSet GetData(string SPName, SqlParameter SPParameter)

    {
        string CS = ConfigurationManager.ConnectionStrings["dbCnnStr"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        SqlDataAdapter da = new SqlDataAdapter(SPName, con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        if (SPParameter != null)
        {
            da.SelectCommand.Parameters.Add(SPParameter);
        }


        DataSet DS = new DataSet();
        da.Fill(DS);
        return DS;

    }



    private void ModalidadTramitesDropDownList()
    {
        riesgo.Text = Request.Params["r"];
        verificacion.Text = Request.Params["v"];
        modalidad.Text = Request.Params["m"];
        categoria.Value = Request.Params["c"];
        id_tramite.Text = Request.Params["t"];


        ddlCategorias.DataSource = GetData("bitaseg.spGetModalidad_Lista_tramites", null);
        ddlCategorias.DataBind();

        //ListItem liCategoria = new ListItem("Seleccione una modalidad", "-1");
        //ddlCategorias.Items.Insert(0, liCategoria);

        ListItem liTramite = new ListItem("Seleccione un Trámite", "-1");
        ddlTramites.Items.Insert(0, liTramite);


        ddlCategorias.SelectedValue = categoria.Value;

        SqlParameter parameter = new SqlParameter();
        parameter.ParameterName = "@modalidad";
        parameter.Value = modalidad.Text;
        ddlTramites.DataSource = GetData("bitaseg.spGetTramitePorCategoria", parameter);
        ddlTramites.DataBind();

        ddlTramites.SelectedValue = riesgo.Text + "|" + verificacion.Text + "|" + modalidad.Text + "|" + categoria.Value + "|" + id_tramite.Text;
        //ListItem liTramite = new ListItem("Seleccione una Coordinacion", "-1");
        //dropdo.Items.Insert(0, liTramite);

        Requisitos rq = new Requisitos();
        rq.Cargar(Convert.ToInt32(id_tramite.Text));
        int x = 0;
        if (rq.SOLLICSAN == true) { /*uno_nombre.InnerText = rq.SOLLICSAN_nombre;*/ uno.Style.Clear(); x++; }
        if (rq.ALTASAT == true) { dos.Style.Clear(); x++; }
        if (rq.PLANOMEMORIA == true) { tres.Style.Clear(); x++; }
        if (rq.RELACIONMATERIAL == true) { cuatro.Style.Clear(); x++; }
        if (rq.PAGO == true) { cinco.Style.Clear(); x++; }
        if (rq.PROGRAMAACT == true) { seis.Style.Clear(); x++; }
        if (rq.FOTOCOPIACONVENIO == true) { siete.Style.Clear(); x++; }
        if (rq.LIBROREGISTRO == true) { ocho.Style.Clear(); x++; }
        if (rq.DESCRIPCIONTECNICAEMBAL == true) { nueve.Style.Clear(); x++; }
        if (rq.TARJETADECONTROL == true) { diez.Style.Clear(); x++; }
        if (rq.CARTACONSENTIMIENTO == true) { once.Style.Clear(); x++; }
        if (rq.ACTACONSTITUTIVA == true) { doce.Style.Clear(); x++; }
        if (rq.REGLAMENTOINTERNO == true) { trece.Style.Clear(); x++; }
        if (rq.VISTOPROTECCIONCIVIL == true) { catorce.Style.Clear(); x++; }
        if (rq.RELACIONPERSONAL == true) { quince.Style.Clear(); x++; }
        if (rq.AUTORIZACIONDIF == true) { dieciseis.Style.Clear(); x++; }
        if (rq.CEDULAAUTOEVALUACION == true) { diecisiete.Style.Clear(); x++; }
        if (rq.PAPELMEMBRETADO == true) { dieciocho.Style.Clear(); x++; }
        if (rq.AUTORIZACIONSET == true) { diecinueve.Style.Clear(); x++; }
        if (rq.USODESUELO == true) { veinte.Style.Clear(); x++; }
        if (rq.PROCESOLIMPIEZA == true) { veintiuno.Style.Clear(); x++; }
        if (rq.RELACIONTIPOANALISIS == true) { veintidos.Style.Clear(); x++; }
        if (rq.ACTAVERIFICACION == true) { veintitres.Style.Clear(); x++; }
        if (rq.SOLICITUD == true) { veinticuatro.Style.Clear(); x++; }
        if (rq.TITUTLO == true) { veinticinco.Style.Clear(); x++; }
        if (rq.CEDULA == true) { veintiseis.Style.Clear(); x++; }
        if (rq.DIPLOMA == true) { veintisiete.Style.Clear(); x++; }
        if (rq.CURRICULUM == true) { veintiocho.Style.Clear(); x++; }
        if (rq.FOTOGRAFIAS == true) { veintinueve.Style.Clear(); x++; }
        if (rq.PAGORESPONSABLE == true) { treinta.Style.Clear(); x++; }
        if (rq.AVISOFUNC == true) { treintayuno.Style.Clear(); x++; }
        if (rq.DOCTECATMEDHOSP == true) { treintaydos.Style.Clear(); x++; }
        if (rq.PROGRAMAMEDICO == true) { treintaytres.Style.Clear(); x++; }
        if (rq.CARACTERISTICASMECANICAS == true) { treintaycuatro.Style.Clear(); x++; }
        if (rq.FOTOGRAFIASDEUNIDAD == true) { treintaycinco.Style.Clear(); x++; }
        if (rq.LICENCIASANITARIAANTERIOR == true) { treintayseis.Style.Clear(); x++; }
        if (rq.AUTORIZACIONRESPONSABLEANTERIOR == true) { treintaysiete.Style.Clear(); x++; }


        if (rq.ANTECEDENTESNOPENALES == true) { treintayocho.Style.Clear(); x++; }
        if (rq.POLIZASEGURO == true) { treintaynueve.Style.Clear(); x++; }
        if (rq.PROGRAMAALIMENTACION == true) { cuarenta.Style.Clear(); x++; }

        if (rq.TITULO_MR == true) { cuarentayuno.Style.Clear(); x++; }
        if (rq.CEDULA_MR == true) { cuarentaydos.Style.Clear(); x++; }
        if (rq.DIPLOMA_MR == true) { cuarentaytres.Style.Clear(); x++; }
        if (rq.CURRICULUM_MR == true) { cuarentaycuatro.Style.Clear(); x++; }
        if (rq.RELACIONPERSONAL_PARAMEDICO == true) { cuarentaycinco.Style.Clear(); x++; }

        if (rq.DOCUMENTACION_LABORATORIO == true) { cuarentayseis.Style.Clear(); x++; }
        if (rq.COPIALICENCIA_MATRIZ == true) { cuarentaysiete.Style.Clear(); x++; }
        if (rq.COPIAAUTORIZACION_MATRIZ == true) { cuarentayocho.Style.Clear(); x++; }
        if (rq.DOCUMENTACION_TECNICO == true) { cuarentaynueve.Style.Clear(); x++; }
        if (rq.DOCUMENTACION_RESPONSABLE == true) { cincuenta.Style.Clear(); x++; }
        if (rq.FORMALIMPIEZA == true) { cincuentayuno.Style.Clear(); x++; }

        numeroderequisitos.Text = x.ToString();

    }

    protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("lcaptura.aspx?m=" + ddlCategorias.SelectedValue);
    }
    protected void ddlTramites_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("lcaptura.aspx?t=" + ddlTramites.SelectedValue+"&m="+ddlCategorias.SelectedValue);
    }
    protected void btnGuardarDatos_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {


            //const string Format = "1:{0}|2:{1}|3:{2}|4:{3}|5:{4}|6:{5}|7:{6}";
            //string g = string.Format(Format,
            //   chkLunesEst.Checked ? 1 : 0,
            //   chkMartesEst.Checked ? 1 : 0,
            //   chkMiercolesEst.Checked ? 1 : 0,
            //   chkJuevesEst.Checked ? 1 : 0,
            //   chkViernesEst.Checked ? 1 : 0,
            //   chkSabadoEst.Checked ? 1 : 0,
            //   chkDomingoEst.Checked ? 1 : 0);

            //    if (chkLunesEst.Checked == false){ LunesH1inicio.Value = "00:00"; LunesH1fin.Value = "00:00";LunesH2inicio.Value = "00:00";LunesH2fin.Value = "00:00";  }

            //    if (LunesH1inicio.Value == null || LunesH1inicio.Value == "") { LunesH1inicio.Value = "00:00"; }
            //    if (LunesH1fin.Value == null || LunesH1fin.Value == "") { LunesH1fin.Value = "00:00"; }
            //    if (LunesH2inicio.Value == null || LunesH2inicio.Value == "") { LunesH2inicio.Value = "00:00"; }
            //    if (LunesH2fin.Value == null || LunesH2fin.Value == "") { LunesH2fin.Value = "00:00"; }

            //    if (chkMartesEst.Checked == false){ MartesH1inicio.Value = "00:00"; MartesH1fin.Value = "00:00";MartesH2inicio.Value = "00:00";MartesH2fin.Value = "00:00"; }

            //    if (MartesH1inicio.Value == null || MartesH1inicio.Value == "") { MartesH1inicio.Value = "00:00"; }
            //    if (MartesH1fin.Value == null || MartesH1fin.Value == "") { MartesH1fin.Value = "00:00"; }
            //    if (MartesH2inicio.Value == null || MartesH2inicio.Value == "") { MartesH2inicio.Value = "00:00"; }
            //    if (MartesH2fin.Value == null || MartesH2fin.Value == "") { MartesH2fin.Value = "00:00"; }

            //    if (chkMiercolesEst.Checked == false){MiercolesH1inicio.Value = "00:00";MiercolesH1fin.Value = "00:00";MiercolesH2inicio.Value = "00:00"; MiercolesH2fin.Value = "00:00"; }

            //    if (MiercolesH1inicio.Value == null || MiercolesH1inicio.Value == "") { MiercolesH1inicio.Value = "00:00"; }
            //    if (MiercolesH1fin.Value == null || MiercolesH1fin.Value == "") { MiercolesH1fin.Value = "00:00"; }
            //    if (MiercolesH2inicio.Value == null || MiercolesH2inicio.Value == "") { MiercolesH2inicio.Value = "00:00"; }
            //    if (MiercolesH2fin.Value == null || MiercolesH2fin.Value == "") { MiercolesH2fin.Value = "00:00"; }

            //    if (chkJuevesEst.Checked == false){ JuevesH1inicio.Value = "00:00"; JuevesH1fin.Value = "00:00"; JuevesH2inicio.Value = "00:00"; JuevesH2fin.Value = "00:00"; }

            //    if (JuevesH1inicio.Value == null || JuevesH1inicio.Value == "") { JuevesH1inicio.Value = "00:00"; }
            //    if (JuevesH1fin.Value == null || JuevesH1fin.Value == "") { JuevesH1fin.Value = "00:00"; }
            //    if (JuevesH2inicio.Value == null || JuevesH2inicio.Value == "") { JuevesH2inicio.Value = "00:00"; }
            //    if (JuevesH2fin.Value == null || JuevesH2fin.Value == "") { JuevesH2fin.Value = "00:00"; }

            //    if (chkViernesEst.Checked == false){ViernesH1inicio.Value = "00:00"; ViernesH1fin.Value = "00:00";ViernesH2inicio.Value = "00:00"; ViernesH2fin.Value = "00:00";}

            //    if (ViernesH1inicio.Value == null || ViernesH1inicio.Value == "") { ViernesH1inicio.Value = "00:00"; }
            //    if (ViernesH1fin.Value == null || ViernesH1fin.Value == "") { ViernesH1fin.Value = "00:00"; }
            //    if (ViernesH2inicio.Value == null || ViernesH2inicio.Value == "") { ViernesH2inicio.Value = "00:00"; }
            //    if (ViernesH2fin.Value == null || ViernesH2fin.Value == "") { ViernesH2fin.Value = "00:00"; }

            //    if (chkSabadoEst.Checked == false){SabadoH1inicio.Value = "00:00";SabadoH1fin.Value = "00:00";  SabadoH2inicio.Value = "00:00"; SabadoH2fin.Value = "00:00";}

            //    if (SabadoH1inicio.Value == null || SabadoH1inicio.Value == "") { SabadoH1inicio.Value = "00:00"; }
            //    if (SabadoH1fin.Value == null || SabadoH1fin.Value == "") { SabadoH1fin.Value = "00:00"; }
            //    if (SabadoH2inicio.Value == null || SabadoH2inicio.Value == "") { SabadoH2inicio.Value = "00:00"; }
            //    if (SabadoH2fin.Value == null || SabadoH2fin.Value == "") { SabadoH2fin.Value = "00:00"; }

            //    if (chkDomingoEst.Checked == false){DomingoH1inicio.Value = "00:00"; DomingoH1fin.Value = "00:00";DomingoH2inicio.Value = "00:00";DomingoH2fin.Value = "00:00";}

            //    if (DomingoH1inicio.Value == null || DomingoH1inicio.Value == "") { DomingoH1inicio.Value = "00:00"; }
            //    if (DomingoH1fin.Value == null || DomingoH1fin.Value == "") { DomingoH1fin.Value = "00:00"; }
            //    if (DomingoH2inicio.Value == null || DomingoH2inicio.Value == "") { DomingoH2inicio.Value = "00:00"; }
            //    if (DomingoH2fin.Value == null || DomingoH2fin.Value == "") { DomingoH2fin.Value = "00:00"; }



            //const string H1 = "1={0}-{1}|2={2}-{3}|3={4}-{5}|4={6}-{7}|5={8}-{9}|6={10}-{11}|7={12}-{13}";
            //string horario1 = string.Format(H1,
            //   LunesH1inicio.Value.ToString(),
            //   LunesH1fin.Value.ToString(),
            //   MartesH1inicio.Value.ToString(),
            //   MartesH1fin.Value.ToString(),
            //   MiercolesH1inicio.Value.ToString(),
            //   MiercolesH1fin.Value.ToString(),
            //   JuevesH1inicio.Value.ToString(),
            //   JuevesH1fin.Value.ToString(),
            //   ViernesH1inicio.Value.ToString(),
            //   ViernesH1fin.Value.ToString(),
            //   SabadoH1inicio.Value.ToString(),
            //   SabadoH1fin.Value.ToString(),
            //   DomingoH1inicio.Value.ToString(),
            //   DomingoH1fin.Value.ToString());

            //const string H2 = "1={0}-{1}|2={2}-{3}|3={4}-{5}|4={6}-{7}|5={8}-{9}|6={10}-{11}|7={12}-{13}";
            //string horario2 = string.Format(H2,
            //   LunesH2inicio.Value.ToString(),
            //   LunesH2fin.Value.ToString(),
            //   MartesH2inicio.Value.ToString(),
            //   MartesH2fin.Value.ToString(),
            //   MiercolesH2inicio.Value.ToString(),
            //   MiercolesH2fin.Value.ToString(),
            //   JuevesH2inicio.Value.ToString(),
            //   JuevesH2fin.Value.ToString(),
            //   ViernesH2inicio.Value.ToString(),
            //   ViernesH2fin.Value.ToString(),
            //   SabadoH2inicio.Value.ToString(),
            //   SabadoH2fin.Value.ToString(),
            //   DomingoH2inicio.Value.ToString(),
            //   DomingoH2fin.Value.ToString());





            //const string FormatR = "1:{0}|2:{1}|3:{2}|4:{3}|5:{4}|6:{5}|7:{6}";
            //string gR = string.Format(FormatR,
            //   chkLunesR.Checked ? 1 : 0,
            //   chkMartesR.Checked ? 1 : 0,
            //   chkMiercolesR.Checked ? 1 : 0,
            //   chkJuevesR.Checked ? 1 : 0,
            //   chkViernesR.Checked ? 1 : 0,
            //   chkSabadoR.Checked ? 1 : 0,
            //   chkDomingoR.Checked ? 1 : 0);

            //if (chkLunesR.Checked == false){ LunesH1inicioR.Value = "00:00";LunesH1finR.Value = "00:00"; LunesH2inicioR.Value = "00:00";LunesH2finR.Value = "00:00";}
            //    if (LunesH1inicioR.Value == null || LunesH1inicioR.Value == "") { LunesH1inicioR.Value = "00:00"; }
            //    if (LunesH1finR.Value == null || LunesH1finR.Value == "") { LunesH1finR.Value = "00:00"; }
            //    if (LunesH2inicioR.Value == null || LunesH2inicioR.Value == "") { LunesH2inicioR.Value = "00:00"; }
            //    if (LunesH2finR.Value == null || LunesH2finR.Value == "") { LunesH2finR.Value = "00:00"; }

            //if (chkMartesR.Checked == false) {MartesH1inicioR.Value = "00:00"; MartesH1finR.Value = "00:00";MartesH2inicioR.Value = "00:00";MartesH2finR.Value = "00:00"; }

            //    if (MartesH1inicioR.Value == null || MartesH1inicioR.Value == "") { MartesH1inicioR.Value = "00:00"; }
            //    if (MartesH1finR.Value == null || MartesH1finR.Value == "") { MartesH1finR.Value = "00:00"; }
            //    if (MartesH2inicioR.Value == null || MartesH2inicioR.Value == "") { MartesH2inicioR.Value = "00:00"; }
            //    if (MartesH2finR.Value == null || MartesH2finR.Value == "") { MartesH2finR.Value = "00:00"; }

            //if (chkMiercolesR.Checked == false) {  MiercolesH1inicioR.Value = "00:00";MiercolesH1finR.Value = "00:00";MiercolesH2inicioR.Value = "00:00"; MiercolesH2finR.Value = "00:00"; }

            //    if (MiercolesH1inicioR.Value == null || MiercolesH1inicioR.Value == "") { MiercolesH1inicioR.Value = "00:00"; }
            //    if (MiercolesH1finR.Value == null || MiercolesH1finR.Value == "") { MiercolesH1finR.Value = "00:00"; }
            //    if (MiercolesH2inicioR.Value == null || MiercolesH2inicioR.Value == "") { MiercolesH2inicioR.Value = "00:00"; }
            //    if (MiercolesH2finR.Value == null || MiercolesH2finR.Value == "") { MiercolesH2finR.Value = "00:00"; }

            //if (chkJuevesR.Checked == false) { JuevesH1inicioR.Value = "00:00";  JuevesH1finR.Value = "00:00";JuevesH2inicioR.Value = "00:00"; JuevesH2finR.Value = "00:00";}

            //    if (JuevesH1inicioR.Value == null || JuevesH1inicioR.Value == "") { JuevesH1inicioR.Value = "00:00"; }
            //    if (JuevesH1finR.Value == null || JuevesH1finR.Value == "") { JuevesH1finR.Value = "00:00"; }
            //    if (JuevesH2inicioR.Value == null || JuevesH2inicioR.Value == "") { JuevesH2inicioR.Value = "00:00"; }
            //    if (JuevesH2finR.Value == null || JuevesH2finR.Value == "") { JuevesH2finR.Value = "00:00"; }

            //if (chkViernesR.Checked == false) { ViernesH1inicioR.Value = "00:00"; ViernesH1finR.Value = "00:00"; ViernesH2inicioR.Value = "00:00";ViernesH2finR.Value = "00:00";   }

            //    if (ViernesH1inicioR.Value == null || ViernesH1inicioR.Value == "") { ViernesH1inicioR.Value = "00:00"; }
            //    if (ViernesH1finR.Value == null || ViernesH1finR.Value == "") { ViernesH1finR.Value = "00:00"; }
            //    if (ViernesH2inicioR.Value == null || ViernesH2inicioR.Value == "") { ViernesH2inicioR.Value = "00:00"; }
            //    if (ViernesH2finR.Value == null || ViernesH2finR.Value == "") { ViernesH2finR.Value = "00:00"; }

            //if (chkSabadoR.Checked == false) { SabadoH1inicioR.Value = "00:00";SabadoH1finR.Value = "00:00";SabadoH2inicioR.Value = "00:00"; SabadoH2finR.Value = "00:00";}

            //    if (SabadoH1inicioR.Value == null || SabadoH1inicioR.Value == "") { SabadoH1inicioR.Value = "00:00"; }
            //    if (SabadoH1finR.Value == null || SabadoH1finR.Value == "") { SabadoH1finR.Value = "00:00"; }
            //    if (SabadoH2inicioR.Value == null || SabadoH2inicioR.Value == "") { SabadoH2inicioR.Value = "00:00"; }
            //    if (SabadoH2finR.Value == null || SabadoH2finR.Value == "") { SabadoH2finR.Value = "00:00"; }

            //if (chkDomingoR.Checked == false) {DomingoH1inicioR.Value = "00:00";DomingoH1finR.Value = "00:00"; DomingoH2inicioR.Value = "00:00";DomingoH2finR.Value = "00:00";  }

            //    if (DomingoH1inicioR.Value == null || DomingoH1inicioR.Value == "") { DomingoH1inicioR.Value = "00:00"; }
            //    if (DomingoH1finR.Value == null || DomingoH1finR.Value == "") { DomingoH1finR.Value = "00:00"; }
            //    if (DomingoH2inicioR.Value == null || DomingoH2inicioR.Value == "") { DomingoH2inicioR.Value = "00:00"; }
            //    if (DomingoH2finR.Value == null || DomingoH2finR.Value == "") { DomingoH2finR.Value = "00:00"; }



            //const string H1R = "1={0}-{1}|2={2}-{3}|3={4}-{5}|4={6}-{7}|5={8}-{9}|6={10}-{11}|7={12}-{13}";
            //string horario1R = string.Format(H1R,
            //   LunesH1inicioR.Value.ToString(),
            //   LunesH1finR.Value.ToString(),
            //   MartesH1inicioR.Value.ToString(),
            //   MartesH1finR.Value.ToString(),
            //   MiercolesH1inicioR.Value.ToString(),
            //   MiercolesH1finR.Value.ToString(),
            //   JuevesH1inicioR.Value.ToString(),
            //   JuevesH1finR.Value.ToString(),
            //   ViernesH1inicioR.Value.ToString(),
            //   ViernesH1finR.Value.ToString(),
            //   SabadoH1inicioR.Value.ToString(),
            //   SabadoH1finR.Value.ToString(),
            //   DomingoH1inicioR.Value.ToString(),
            //   DomingoH1finR.Value.ToString());

            //const string H2R = "1={0}-{1}|2={2}-{3}|3={4}-{5}|4={6}-{7}|5={8}-{9}|6={10}-{11}|7={12}-{13}";
            //string horario2R = string.Format(H2R,
            //   LunesH2inicioR.Value.ToString(),
            //   LunesH2finR.Value.ToString(),
            //   MartesH2inicioR.Value.ToString(),
            //   MartesH2finR.Value.ToString(),
            //   MiercolesH2inicioR.Value.ToString(),
            //   MiercolesH2finR.Value.ToString(),
            //   JuevesH2inicioR.Value.ToString(),
            //   JuevesH2finR.Value.ToString(),
            //   ViernesH2inicioR.Value.ToString(),
            //   ViernesH2finR.Value.ToString(),
            //   SabadoH2inicioR.Value.ToString(),
            //   SabadoH2finR.Value.ToString(),
            //   DomingoH2inicioR.Value.ToString(),
            //   DomingoH2finR.Value.ToString());

            if (categoriareal.Text.ToString() != "3")
            {
                txtRnombre.Text = "A";
                txtRapellidom.Text = "B";
                txtRapellidop.Text = "C";
                //txtRcedula.Text = "D";
                //txtRgrado.Text = "E";
                //txtHorario.Text = "F";
            }

            //if (RequiredFieldValidator13.IsValid == true)
            //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Favor de ingresar apeñ');", true);

            int z = 0;
            if (chksollicsan.Checked == true) { z++; }
            if (chksolicitud.Checked == true) { z++; }
            if (chktitulo.Checked == true) { z++; }
            if (chkcedula.Checked == true) { z++; }
            if (chkdiploma.Checked == true) { z++; }
            if (chkcurriculum.Checked == true) { z++; }
            if (chkfotografias.Checked == true) { z++; }
            if (chkpagoresponsable.Checked == true) { z++; }
            if (chkaltasat.Checked == true) { z++; }
            if (chkplanomemoria.Checked == true) { z++; }
            if (chkrelacionmaterial.Checked == true) { z++; }
            if (chkpago.Checked == true) { z++; }
            if (chkprogramaact.Checked == true) { z++; }
            if (chkfotocopiaconvenio.Checked == true) { z++; }
            if (chklibroregistro.Checked == true) { z++; }
            if (chkdescripciontecnicaembal.Checked == true) { z++; }
            if (chktarjetadecontrol.Checked == true) { z++; }
            if (chkcartaconsentimiento.Checked == true) { z++; }
            if (chkactaconstitutiva.Checked == true) { z++; }
            if (chkreglamentointerno.Checked == true) { z++; }
            if (chkvistoproteccioncivil.Checked == true) { z++; }
            if (chkrelacionpersonal.Checked == true) { z++; }
            if (chkautorizaciondif.Checked == true) { z++; }
            if (chkcedulaautoevaluacion.Checked == true) { z++; }
            if (chkpapelmembretado.Checked == true) { z++; }
            if (chkautorizacionset.Checked == true) { z++; }
            if (chkusodesuelo.Checked == true) { z++; }
            if (chkprocesolimpieza.Checked == true) { z++; }
            if (chkrelaciontipoanalisis.Checked == true) { z++; }
            if (chkactaverificacion.Checked == true) { z++; }
            if (chkavisofunc.Checked == true) { z++; }
            if (chkdoctecatmedhosp.Checked == true) { z++; }
            if (chkprogramamedico.Checked == true) { z++; }
            if (chkcaracteristicasmecanicas.Checked == true) { z++; }
            if (chkfotografiasdeunidad.Checked == true) { z++; }
            if (chklicenciasanitariaanterior.Checked == true) { z++; }
            if (chkautorizacionresponsableanterior.Checked == true) { z++; }
            if (chkantecedentesnopenales.Checked == true) { z++; }
            if (chkpolizaseguro.Checked == true) { z++; }
            if (chkprogramaalimentacion.Checked == true) { z++; }
            if (chktitulo_mr.Checked == true) { z++; }
            if (chkcedula_mr.Checked == true) { z++; }
            if (chkdiploma_mr.Checked == true) { z++; }
            if (chkcurriculum_mr.Checked == true) { z++; }
            if (chkrelacionpersonal_paramedico.Checked == true) { z++; }
            if (chkdocumentacion_laboratorio.Checked == true) { z++; }
            if (chkcopialicencia_matriz.Checked == true) { z++; }
            if (chkcopiaautorizacion_matriz.Checked == true) { z++; }
            if (chkdocumentacion_tecnico.Checked == true) { z++; }
            if (chkdocumentacion_responsable.Checked == true) { z++; }
            if (chkformalimpieza.Checked == true) { z++; }

            int req = Convert.ToInt32(numeroderequisitos.Text);


            //if (z == req)
            //{
            if (Page.IsValid)
            {

                try
                {
                    int a = 0;

                    //if (riesgo.Text == "1")
                    //{

                    //    a = 1;
                    //}
                    //if (riesgo.Text == "2")
                    //{

                        //a = 1001;
                    //}

                    a = 2001;
                    Usuarios usuarios = new Usuarios();
                    usuarios.DatosDeRegistro(User.Identity.Name);

                    Tramites tramite = new Tramites();
                    //PERSONA
                    //tramite.Curp = txtCurp.Text.ToUpper();
                    //tramite.Nombre = txtNombre.Text.ToUpper();
                    //tramite.Apellidop = txtApellidop.Text.ToUpper();
                    //tramite.Apellidom = txtApellidom.Text.ToUpper();
                    //tramite.Telfij = txtTelfij.Text.ToUpper();
                    //tramite.Telmov = txtTelmov.Text.ToUpper();
                    //tramite.RFC_Prop = txtRFCprop.Text.ToUpper();

                    //ESTABLECIMIENTO
                    //tramite.Correo = txtCorreo.Text;
                    tramite.Rfc = txtRfc.Text.ToUpper();
                    //tramite.Razonsocial = txtRazonsocial.Text.ToUpper();
                    tramite.Nombreest = txtNombreest.Text.ToUpper();
                    tramite.Municipio = txtMunicipio.Text.ToUpper();
                    tramite.Colonia = txtColonia.Text.ToUpper();
                    tramite.Localidad = txtLocalidad.Text.ToUpper();
                    tramite.Referencias = txtReferencias.Text.ToUpper();
                    //tramite.Giro = txtGiro.Text.ToUpper();
                    tramite.Numero = txtNumero.Text.ToUpper();
                    tramite.CP = txtCP.Text.ToUpper();
                    tramite.Telest = txtTelest.Text.ToUpper();
                    tramite.Correoest = txtCorreoest.Text;
                    tramite.Calle = txtCalle.Text.ToUpper();


                    //TRAMITE
                    tramite.Rui = txtRui.Text.ToUpper();
                    tramite.CertificadoAnterior = txtCertificadoAnterior.Text.ToUpper();
                    tramite.Statos = a;
                    tramite.Observaciones = txtObservaciones.Text.ToString();
                    //tramite.IdTramite = Int32.Parse(ddlTramites.SelectedValue.ToString());




                    tramite.Rnombre = txtRnombre.Text.ToUpper();
                    tramite.Rapellidom = txtRapellidom.Text.ToUpper();
                    tramite.Rapellidop = txtRapellidop.Text.ToUpper();
                    //tramite.Rcedula = txtRcedula.Text.ToUpper();
                    //tramite.Rgrado = txtRgrado.Text.ToUpper();
                    tramite.Horario = "0";

                    //REQUISITOS
                    tramite.SOLLICSAN = Convert.ToBoolean(chksollicsan.Checked);
                    tramite.SOLICITUD = Convert.ToBoolean(chksolicitud.Checked);
                    tramite.TITUTLO = Convert.ToBoolean(chktitulo.Checked);
                    tramite.CEDULA = Convert.ToBoolean(chkcedula.Checked);
                    tramite.DIPLOMA = Convert.ToBoolean(chkdiploma.Checked);
                    tramite.CURRICULUM = Convert.ToBoolean(chkcurriculum.Checked);
                    tramite.FOTOGRAFIAS = Convert.ToBoolean(chkfotografias.Checked);
                    tramite.PAGORESPONSABLE = Convert.ToBoolean(chkpagoresponsable.Checked);
                    tramite.ALTASAT = Convert.ToBoolean(chkaltasat.Checked);
                    tramite.PLANOMEMORIA = Convert.ToBoolean(chkplanomemoria.Checked);
                    tramite.RELACIONMATERIAL = Convert.ToBoolean(chkrelacionmaterial.Checked);
                    tramite.PAGO = Convert.ToBoolean(chkpago.Checked);
                    tramite.PROGRAMAACT = Convert.ToBoolean(chkprogramaact.Checked);
                    tramite.FOTOCOPIACONVENIO = Convert.ToBoolean(chkfotocopiaconvenio.Checked);
                    tramite.LIBROREGISTRO = Convert.ToBoolean(chklibroregistro.Checked);
                    tramite.DESCRIPCIONTECNICAEMBAL = Convert.ToBoolean(chkdescripciontecnicaembal.Checked);
                    tramite.TARJETADECONTROL = Convert.ToBoolean(chktarjetadecontrol.Checked);
                    tramite.CARTACONSENTIMIENTO = Convert.ToBoolean(chkcartaconsentimiento.Checked);
                    tramite.ACTACONSTITUTIVA = Convert.ToBoolean(chkactaconstitutiva.Checked);
                    tramite.REGLAMENTOINTERNO = Convert.ToBoolean(chkreglamentointerno.Checked);
                    tramite.VISTOPROTECCIONCIVIL = Convert.ToBoolean(chkvistoproteccioncivil.Checked);
                    tramite.RELACIONPERSONAL = Convert.ToBoolean(chkrelacionpersonal.Checked);
                    tramite.AUTORIZACIONDIF = Convert.ToBoolean(chkautorizaciondif.Checked);
                    tramite.CEDULAAUTOEVALUACION = Convert.ToBoolean(chkcedulaautoevaluacion.Checked);
                    tramite.PAPELMEMBRETADO = Convert.ToBoolean(chkpapelmembretado.Checked);
                    tramite.AUTORIZACIONSET = Convert.ToBoolean(chkautorizacionset.Checked);
                    tramite.USODESUELO = Convert.ToBoolean(chkusodesuelo.Checked);
                    tramite.PROCESOLIMPIEZA = Convert.ToBoolean(chkprocesolimpieza.Checked);
                    tramite.RELACIONTIPOANALISIS = Convert.ToBoolean(chkrelaciontipoanalisis.Checked);
                    tramite.ACTAVERIFICACION = Convert.ToBoolean(chkactaverificacion.Checked);
                    tramite.AVISOFUNC = Convert.ToBoolean(chkavisofunc.Checked);

                    tramite.DOCTECATMEDHOSP = Convert.ToBoolean(chkdoctecatmedhosp.Checked);
                    tramite.PROGRAMAMEDICO = Convert.ToBoolean(chkprogramamedico.Checked);
                    tramite.CARACTERISTICASMECANICAS = Convert.ToBoolean(chkcaracteristicasmecanicas.Checked);
                    tramite.FOTOGRAFIASDEUNIDAD = Convert.ToBoolean(chkfotografiasdeunidad.Checked);
                    tramite.LICENCIASANITARIAANTERIOR = Convert.ToBoolean(chklicenciasanitariaanterior.Checked);
                    tramite.AUTORIZACIONRESPONSABLEANTERIOR = Convert.ToBoolean(chkautorizacionresponsableanterior.Checked);

                    tramite.ANTECEDENTESNOPENALES = Convert.ToBoolean(chkantecedentesnopenales.Checked);
                    tramite.POLIZASEGURO = Convert.ToBoolean(chkpolizaseguro.Checked);
                    tramite.PROGRAMAALIMENTACION = Convert.ToBoolean(chkprogramaalimentacion.Checked);

                    tramite.TITULO_MR = Convert.ToBoolean(chktitulo_mr.Checked);
                    tramite.CEDULA_MR = Convert.ToBoolean(chkcedula_mr.Checked);
                    tramite.DIPLOMA_MR = Convert.ToBoolean(chkdiploma_mr.Checked);
                    tramite.CURRICULUM_MR = Convert.ToBoolean(chkcurriculum_mr.Checked);
                    tramite.RELACIONPERSONAL_PARAMEDICO = Convert.ToBoolean(chkrelacionpersonal_paramedico.Checked);

                    tramite.DOCUMENTACION_LABORATORIO = Convert.ToBoolean(chkdocumentacion_laboratorio.Checked);
                    tramite.COPIALICENCIA_MATRIZ = Convert.ToBoolean(chkcopialicencia_matriz.Checked);
                    tramite.COPIAAUTORIZACION_MATRIZ = Convert.ToBoolean(chkcopiaautorizacion_matriz.Checked);
                    tramite.DOCUMENTACION_TECNICO = Convert.ToBoolean(chkdocumentacion_tecnico.Checked);
                    tramite.DOCUMENTACION_RESPONSABLE = Convert.ToBoolean(chkdocumentacion_responsable.Checked);
                    tramite.FORMALIMPIEZA = Convert.ToBoolean(chkformalimpieza.Checked);


                    tramite.Reguser = usuarios.Reguser;
                    tramite.NumeroCoordinacion = usuarios.NumeroCoordinacion;

                    //g = g.Replace(" ", "");
                    //gR = gR.Replace(" ", "");
                    //horario1 = horario1.Replace(" ", "");
                    //horario2 = horario2.Replace(" ", "");
                    //horario1R = horario1R.Replace(" ", "");
                    //horario2R = horario2R.Replace(" ", "");


                    //tramite.EstDiasLaborales = g;
                    //tramite.Hest1 = horario1;
                    //tramite.Hest2 = horario2;
                    //tramite.RDiasLaborales = gR;
                    //tramite.Hr1 = horario1R;
                    //tramite.Hr2 = horario2R;
                    tramite.Rfc_R = txtRfcR.Text.ToUpper();




                    string[] separators = { ",", ".", "!", "?", ";", ":", "|" };
                    string cadena = ddlTramites.SelectedValue.ToString();
                    string[] split = cadena.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                    string p1 = split[0];
                    string p2 = split[1];
                    string p3 = split[2];
                    string p4 = split[3];
                    string p5 = split[4];
                    tramite.Riesgo = Int32.Parse(p1);
                    tramite.Verificacion = Int32.Parse(p2);
                    tramite.Modalidad = Int32.Parse(p3);
                    int r = Int32.Parse(p4);
                    tramite.Categoria = r;
                    tramite.IdTramite = Int32.Parse(p5);

                    //const string Format = "1:{0}|2:{1}|3:{2}|4:{3}|5:{4}|6:{5}|7:{6}|8:{7}|9:{8}|10:{9}|11:{10}|12:{11}|13:{12}";
                    //tramite.Requerimientos = string.Format(Format,
                    //   chkSolLicSan.Checked ? 1 : 0,
                    //   chkTituloProf.Checked ? 1 : 0,
                    //   chkCedulaProf.Checked ? 1 : 0,
                    //   chkDiplomaEspecial.Checked ? 1 : 0,
                    //   chkCurriculum.Checked ? 1 : 0,
                    //   chkProgramaMedico.Checked ? 1 : 0,
                    //   chkRelacionMaterialEquipo.Checked ? 1 : 0,
                    //   chkPlanoMemoria.Checked ? 1 : 0,
                    //   chkAlta.Checked ? 1 : 0,
                    //   chkPapelMembretado.Checked ? 1 : 0,
                    //   chkPago.Checked ? 1 : 0,
                    //   chkCopiaTramiteAnterior.Checked ? 1 : 0,
                    //   chkLicenciaSanitariaAnterior.Checked ? 1 : 0);//;//Poner aqui los re en una cadena de texto



                    const string Formato =
                        "1:{0}|2:{1}|3:{2}|4:{3}|5:{4}|6:{5}|7:{6}|8:{7}|9:{8}|10:{9}|" +
                        "11:{10}|12:{11}|13:{12}|14:{13}|15:{14}|16:{15}|17:{16}|18:{17}|19:{18}|20:{19}|" +
                        "21:{20}|22:{21}|23:{22}|24:{23}|25:{24}|26:{25}|27:{26}|28:{27}|29:{28}|30:{29}|";
                    tramite.Requerimientos = string.Format(Formato,


                    chksolicitud.Checked ? 1 : 0,
                    chktitulo.Checked ? 1 : 0,
                    chkcedula.Checked ? 1 : 0,
                    chkdiploma.Checked ? 1 : 0,
                    chkcurriculum.Checked ? 1 : 0,
                    chkfotografias.Checked ? 1 : 0,
                    chkpagoresponsable.Checked ? 1 : 0,
                    chksollicsan.Checked ? 1 : 0,
                    chkaltasat.Checked ? 1 : 0,
                    chkplanomemoria.Checked ? 1 : 0,
                    chkrelacionmaterial.Checked ? 1 : 0,
                    chkpago.Checked ? 1 : 0,
                    chkprogramaact.Checked ? 1 : 0,
                    chkfotocopiaconvenio.Checked ? 1 : 0,
                    chklibroregistro.Checked ? 1 : 0,
                    chkdescripciontecnicaembal.Checked ? 1 : 0,
                    chktarjetadecontrol.Checked ? 1 : 0,
                    chkcartaconsentimiento.Checked ? 1 : 0,
                    chkactaconstitutiva.Checked ? 1 : 0,
                    chkreglamentointerno.Checked ? 1 : 0,
                    chkvistoproteccioncivil.Checked ? 1 : 0,
                    chkrelacionpersonal.Checked ? 1 : 0,
                    chkautorizaciondif.Checked ? 1 : 0,
                    chkcedulaautoevaluacion.Checked ? 1 : 0,
                    chkpapelmembretado.Checked ? 1 : 0,
                    chkautorizacionset.Checked ? 1 : 0,
                    chkusodesuelo.Checked ? 1 : 0,
                    chkprocesolimpieza.Checked ? 1 : 0,
                    chkrelaciontipoanalisis.Checked ? 1 : 0,
                    chkavisofunc.Checked ? 1 : 0,
                    chkactaverificacion.Checked ? 1 : 0);



                    if (tramite.Grabar_tram())
                    {

                        Response.Write("<script>alert('El folio se generó Correctamente');window.location ='default.aspx';</script>");

                        // Response.Redirect("default.aspx");
                    }

                }

                catch (Exception Ex)
                {
                    ////Lblmsg.Text = Ex.Message;
                    ///
                    Lblmsg.Text = Ex.Message;
                    Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
                }
            }
            else
            {

                //if (categoriareal.Text.ToString() == "3")
                //{

                //    if (chksolicitud.Checked == false)
                //    {
                //        Response.Write("<script>alert('Solicitud Obligatoria')</script>");
                //    }
                //    if (chkpagoresponsable.Checked == false)
                //    {
                //        Response.Write("<script>alert('Pago Obligatorio')</script>");
                //    }
                //}
                //else
                //{
                //    if (categoriareal.Text.ToString() == "1")
                //    {
                //        if (chksolicitud.Checked == false )
                //        {
                //            Response.Write("<script>alert('Solicitud Obligatoria')</script>");
                //        }
                //        if (chkpagoresponsable.Checked == false)
                //        {
                //            Response.Write("<script>alert('Pago de Responsable Obligatorio')</script>");
                //        }

                //    }
                //    else
                //    {
                //        Response.Write("<script>alert('Favor de verificar la información capturada')</script>");
                //    }
                //}
            }
            //}

            //else
            //{
            //    Response.Write("<script>alert('Favor de verificar los requisitos completos.') </script>");

            //    string[] separators = { ",", ".", "!", "?", ";", ":", "|" };
            //    string cadena = ddlTramites.SelectedValue.ToString();
            //    string[] split = cadena.Split(separators, StringSplitOptions.RemoveEmptyEntries);
            //    string p1 = split[0];
            //    string p2 = split[1];
            //    string p3 = split[2];
            //    string p4 = split[3];
            //    string p5 = split[4];
            //    int a = Int32.Parse(p1);
            //    int b = Int32.Parse(p2);
            //    int c = Int32.Parse(p3);
            //    int d = Int32.Parse(p4);
            //    int f = Int32.Parse(p5);

            //    riesgo.Text = p1.ToString();
            //    verificacion.Text = p2.ToString();
            //    modalidad.Text = p3.ToString();
            //    categoria.Value = p4.ToString();
            //    id_tramite.Text = p5.ToString();



            //    Requisitos rq = new Requisitos();
            //    rq.Cargar(Convert.ToInt32(id_tramite.Text));
            //    int x = 0;
            //    if (rq.SOLLICSAN == true) { uno.Style.Clear(); x++; }
            //    if (rq.ALTASAT == true) { dos.Style.Clear(); x++; }
            //    if (rq.PLANOMEMORIA == true) { tres.Style.Clear(); x++; }
            //    if (rq.RELACIONMATERIAL == true) { cuatro.Style.Clear(); x++; }
            //    if (rq.PAGO == true) { cinco.Style.Clear(); x++; }
            //    if (rq.PROGRAMAACT == true) { seis.Style.Clear(); x++; }
            //    if (rq.FOTOCOPIACONVENIO == true) { siete.Style.Clear(); x++; }
            //    if (rq.LIBROREGISTRO == true) { ocho.Style.Clear(); x++; }
            //    if (rq.DESCRIPCIONTECNICAEMBAL == true) { nueve.Style.Clear(); x++; }
            //    if (rq.TARJETADECONTROL == true) { diez.Style.Clear(); x++; }
            //    if (rq.CARTACONSENTIMIENTO == true) { once.Style.Clear(); x++; }
            //    if (rq.ACTACONSTITUTIVA == true) { doce.Style.Clear(); x++; }
            //    if (rq.REGLAMENTOINTERNO == true) { trece.Style.Clear(); x++; }
            //    if (rq.VISTOPROTECCIONCIVIL == true) { catorce.Style.Clear(); x++; }
            //    if (rq.RELACIONPERSONAL == true) { quince.Style.Clear(); x++; }
            //    if (rq.AUTORIZACIONDIF == true) { dieciseis.Style.Clear(); x++; }
            //    if (rq.CEDULAAUTOEVALUACION == true) { diecisiete.Style.Clear(); x++; }
            //    if (rq.PAPELMEMBRETADO == true) { dieciocho.Style.Clear(); x++; }
            //    if (rq.AUTORIZACIONSET == true) { diecinueve.Style.Clear(); x++; }
            //    if (rq.USODESUELO == true) { veinte.Style.Clear(); x++; }
            //    if (rq.PROCESOLIMPIEZA == true) { veintiuno.Style.Clear(); x++; }
            //    if (rq.RELACIONTIPOANALISIS == true) { veintidos.Style.Clear(); x++; }
            //    if (rq.ACTAVERIFICACION == true) { veintitres.Style.Clear(); x++; }
            //    if (rq.SOLICITUD == true) { veinticuatro.Style.Clear(); x++; }
            //    if (rq.TITUTLO == true) { veinticinco.Style.Clear(); x++; }
            //    if (rq.CEDULA == true) { veintiseis.Style.Clear(); x++; }
            //    if (rq.DIPLOMA == true) { veintisiete.Style.Clear(); x++; }
            //    if (rq.CURRICULUM == true) { veintiocho.Style.Clear(); x++; }
            //    if (rq.FOTOGRAFIAS == true) { veintinueve.Style.Clear(); x++; }
            //    if (rq.PAGORESPONSABLE == true) { treinta.Style.Clear(); x++; }
            //    if (rq.AVISOFUNC == true) { treintayuno.Style.Clear(); x++; }
            //    if (rq.DOCTECATMEDHOSP == true) { treintaydos.Style.Clear(); x++; }
            //    if (rq.PROGRAMAMEDICO == true) { treintaytres.Style.Clear(); x++; }
            //    if (rq.CARACTERISTICASMECANICAS == true) { treintaycuatro.Style.Clear(); x++; }
            //    if (rq.FOTOGRAFIASDEUNIDAD == true) { treintaycinco.Style.Clear(); x++; }
            //    if (rq.LICENCIASANITARIAANTERIOR == true) { treintayseis.Style.Clear(); x++; }
            //    if (rq.AUTORIZACIONRESPONSABLEANTERIOR == true) { treintaysiete.Style.Clear(); x++; }


            //    if (rq.ANTECEDENTESNOPENALES == true) { treintayocho.Style.Clear(); x++; }
            //    if (rq.POLIZASEGURO == true) { treintaynueve.Style.Clear(); x++; }
            //    if (rq.PROGRAMAALIMENTACION == true) { cuarenta.Style.Clear(); x++; }

            //    if (rq.TITULO_MR == true) { cuarentayuno.Style.Clear(); x++; }
            //    if (rq.CEDULA_MR == true) { cuarentaydos.Style.Clear(); x++; }
            //    if (rq.DIPLOMA_MR == true) { cuarentaytres.Style.Clear(); x++; }
            //    if (rq.CURRICULUM_MR == true) { cuarentaycuatro.Style.Clear(); x++; }
            //    if (rq.RELACIONPERSONAL_PARAMEDICO == true) { cuarentaycinco.Style.Clear(); x++; }

            //    if (rq.DOCUMENTACION_LABORATORIO == true) { cuarentayseis.Style.Clear(); x++; }
            //    if (rq.COPIALICENCIA_MATRIZ == true) { cuarentaysiete.Style.Clear(); x++; }
            //    if (rq.COPIAAUTORIZACION_MATRIZ == true) { cuarentayocho.Style.Clear(); x++; }
            //    if (rq.DOCUMENTACION_TECNICO == true) { cuarentaynueve.Style.Clear(); x++; }
            //    if (rq.DOCUMENTACION_RESPONSABLE == true) { cincuenta.Style.Clear(); x++; }
            //    if (rq.FORMALIMPIEZA == true) { cincuentayuno.Style.Clear(); x++; }


            //    numeroderequisitos.Text = x.ToString();
            //}
        }

    }

    //protected void Curp_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (CURPvalido.Value == "1")
    //    {
    //        if (args.Value.Length < 18)
    //        {
    //            args.IsValid = false;
    //        }
    //        else
    //        {
    //            args.IsValid = true;
    //        }
    //    }
    //    else { args.IsValid = false; }
    //}

    #region Validar en Servidor Propietario
    protected void Nombre_ServerValidate(object source, ServerValidateEventArgs args)
    {

        string[] separators = { ",", ".", "!", "?", ";", ":", "|" };
        string cadena = ddlTramites.SelectedValue.ToString();
        string[] split = cadena.Split(separators, StringSplitOptions.RemoveEmptyEntries);
        string p1 = split[0];
        string p2 = split[1];
        string p3 = split[2];
        string p4 = split[3];
        string p5 = split[4];
        int a = Int32.Parse(p1);
        int b = Int32.Parse(p2);
        int c = Int32.Parse(p3);
        int d = Int32.Parse(p4);
        int f = Int32.Parse(p5);

        riesgo.Text = p1.ToString();
        verificacion.Text = p2.ToString();
        modalidad.Text = p3.ToString();
        categoria.Value = p4.ToString();
        id_tramite.Text = p5.ToString();

        //if (a == 1)
        //{
        //    txtRiesgo.Text = "Bajo Riesgo";
        //}
        //else { txtRiesgo.Text = "Alto Riesgo"; }




        Requisitos rq = new Requisitos();
        rq.Cargar(Convert.ToInt32(id_tramite.Text));
        int x = 0;
        if (rq.SOLLICSAN == true) { uno.Style.Clear(); x++; }
        if (rq.ALTASAT == true) { dos.Style.Clear(); x++; }
        if (rq.PLANOMEMORIA == true) { tres.Style.Clear(); x++; }
        if (rq.RELACIONMATERIAL == true) { cuatro.Style.Clear(); x++; }
        if (rq.PAGO == true) { cinco.Style.Clear(); x++; }
        if (rq.PROGRAMAACT == true) { seis.Style.Clear(); x++; }
        if (rq.FOTOCOPIACONVENIO == true) { siete.Style.Clear(); x++; }
        if (rq.LIBROREGISTRO == true) { ocho.Style.Clear(); x++; }
        if (rq.DESCRIPCIONTECNICAEMBAL == true) { nueve.Style.Clear(); x++; }
        if (rq.TARJETADECONTROL == true) { diez.Style.Clear(); x++; }
        if (rq.CARTACONSENTIMIENTO == true) { once.Style.Clear(); x++; }
        if (rq.ACTACONSTITUTIVA == true) { doce.Style.Clear(); x++; }
        if (rq.REGLAMENTOINTERNO == true) { trece.Style.Clear(); x++; }
        if (rq.VISTOPROTECCIONCIVIL == true) { catorce.Style.Clear(); x++; }
        if (rq.RELACIONPERSONAL == true) { quince.Style.Clear(); x++; }
        if (rq.AUTORIZACIONDIF == true) { dieciseis.Style.Clear(); x++; }
        if (rq.CEDULAAUTOEVALUACION == true) { diecisiete.Style.Clear(); x++; }
        if (rq.PAPELMEMBRETADO == true) { dieciocho.Style.Clear(); x++; }
        if (rq.AUTORIZACIONSET == true) { diecinueve.Style.Clear(); x++; }
        if (rq.USODESUELO == true) { veinte.Style.Clear(); x++; }
        if (rq.PROCESOLIMPIEZA == true) { veintiuno.Style.Clear(); x++; }
        if (rq.RELACIONTIPOANALISIS == true) { veintidos.Style.Clear(); x++; }
        if (rq.ACTAVERIFICACION == true) { veintitres.Style.Clear(); x++; }
        if (rq.SOLICITUD == true) { veinticuatro.Style.Clear(); x++; }
        if (rq.TITUTLO == true) { veinticinco.Style.Clear(); x++; }
        if (rq.CEDULA == true) { veintiseis.Style.Clear(); x++; }
        if (rq.DIPLOMA == true) { veintisiete.Style.Clear(); x++; }
        if (rq.CURRICULUM == true) { veintiocho.Style.Clear(); x++; }
        if (rq.FOTOGRAFIAS == true) { veintinueve.Style.Clear(); x++; }
        if (rq.PAGORESPONSABLE == true) { treinta.Style.Clear(); x++; }
        if (rq.AVISOFUNC == true) { treintayuno.Style.Clear(); x++; }
        ////////////AÚN NO IMPLEMENTADOS
        if (rq.DOCTECATMEDHOSP == true) { treintaydos.Style.Clear(); x++; }
        if (rq.PROGRAMAMEDICO == true) { treintaytres.Style.Clear(); x++; }
        if (rq.CARACTERISTICASMECANICAS == true) { treintaycuatro.Style.Clear(); x++; }
        if (rq.FOTOGRAFIASDEUNIDAD == true) { treintaycinco.Style.Clear(); x++; }
        if (rq.LICENCIASANITARIAANTERIOR == true) { treintayseis.Style.Clear(); x++; }
        if (rq.AUTORIZACIONRESPONSABLEANTERIOR == true) { treintaysiete.Style.Clear(); x++; }

        if (rq.ANTECEDENTESNOPENALES == true) { treintayocho.Style.Clear(); x++; }
        if (rq.POLIZASEGURO == true) { treintaynueve.Style.Clear(); x++; }
        if (rq.PROGRAMAALIMENTACION == true) { cuarenta.Style.Clear(); x++; }

        if (rq.TITULO_MR == true) { cuarentayuno.Style.Clear(); x++; }
        if (rq.CEDULA_MR == true) { cuarentaydos.Style.Clear(); x++; }
        if (rq.DIPLOMA_MR == true) { cuarentaytres.Style.Clear(); x++; }
        if (rq.CURRICULUM_MR == true) { cuarentaycuatro.Style.Clear(); x++; }
        if (rq.RELACIONPERSONAL_PARAMEDICO == true) { cuarentaycinco.Style.Clear(); x++; }

        if (rq.DOCUMENTACION_LABORATORIO == true) { cuarentayseis.Style.Clear(); x++; }
        if (rq.COPIALICENCIA_MATRIZ == true) { cuarentaysiete.Style.Clear(); x++; }
        if (rq.COPIAAUTORIZACION_MATRIZ == true) { cuarentayocho.Style.Clear(); x++; }
        if (rq.DOCUMENTACION_TECNICO == true) { cuarentaynueve.Style.Clear(); x++; }
        if (rq.DOCUMENTACION_RESPONSABLE == true) { cincuenta.Style.Clear(); x++; }
        if (rq.FORMALIMPIEZA == true) { cincuentayuno.Style.Clear(); x++; }


        numeroderequisitos.Text = x.ToString();
        if (args.Value.Length <= 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void Apellidop_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    protected void Apellidom_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    protected void Telmov_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length < 10)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    protected void Telfij_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length < 10)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    protected void Correo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    #endregion

    #region Validar en Servidor Establecimiento
    protected void RFCest_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!(args.Value.Length >= 12 && args.Value.Length <= 14) || (args.Value.Length < 0))
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void Nombreest_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    protected void Razonsocial_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 0)
        {
            args.IsValid = false;
            //Response.Write("<script>alert('"+(Convert.ToInt32(args.Value.Length.ToString())+10) +"')</script>");
        }
        else
        {
            args.IsValid = true;
        }
    }
    #endregion
}
