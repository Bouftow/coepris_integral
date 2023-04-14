using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class ListaSolicitudes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
           // cis.Text = tramite.CIS.ToString();
            cis.Text = "true";
           // ueas.Text = tramite.UEAS.ToString();
            ueas.Text = "true";
            //coor.Text = tramite.COOR.ToString();
            coor.Text = "true";
            //uos.Text = tramite.UOS.ToString();
            uos.Text = "true";
            //dictaminador.Text = tramite.DICTAMINADOR.ToString();
            dictaminador.Text = "true";
            //dos.Text = tramite.DOS.ToString();
            dos.Text = "true";
            //dds.Text = tramite.DDS.ToString();
            dds.Text = "true";
            //deas.Text = tramite.DEAS.ToString();
            deas.Text = "true";
            //das.Text = tramite.DAS.ToString();
            das.Text = "true";
            //corr.Text = tramite.CORR.ToString();
            corr.Text = "true";
            //rech.Text = tramite.RECH.ToString();
            rech.Text = "true";
            //entr.Text = tramite.ENTR.ToString();
            entr.Text = "true";
            MostrarDatos();
        }
    }

    void MostrarDatos()
    {
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "Select * from tramites order by folio";

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=1 or Estatus_Bajoalto.id_statos=4 or Estatus_Bajoalto.id_statos=32) or (Estatus_Bajoalto.id_statos=1001 or Estatus_Bajoalto.id_statos=1007 or Estatus_Bajoalto.id_statos=21 or Estatus_Bajoalto.id_statos=1028 or Estatus_Bajoalto.id_statos=1029 ) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        grdCIS.DataSource = dt;
        grdCIS.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona  inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=28 or Estatus_Bajoalto.id_statos=29 or Estatus_Bajoalto.id_statos=30) or (Estatus_Bajoalto.id_statos>=1024 and Estatus_Bajoalto.id_statos<=1026) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtcor = new DataTable();
        SqlDataAdapter dacor = new SqlDataAdapter(cmd);
        dacor.Fill(dtcor);
        grdCIScor.DataSource = dtcor;
        grdCIScor.DataBind();

        cmd.CommandText = "Select top 10 IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where expStatusHistory.id_statos = 1 or (expStatusHistory.id_statos>=29 and expStatusHistory.id_statos<=33) or expStatusHistory.id_statos=1001 or (expStatusHistory.id_statos>=1025 and expStatusHistory.id_statos<=1029) order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dth = new DataTable();
        SqlDataAdapter dah = new SqlDataAdapter(cmd);
        dah.Fill(dth);
        grdCISH.DataSource = dth;
        grdCISH.DataBind();


        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=18 or Estatus_Bajoalto.id_statos=1  or Estatus_Bajoalto.id_statos=33 or Estatus_Bajoalto.id_statos=34) or Estatus_Bajoalto.id_statos=1001 or Estatus_Bajoalto.id_statos=1029 order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtueas = new DataTable();
        SqlDataAdapter daueas = new SqlDataAdapter(cmd);
        daueas.Fill(dtueas);
        grdUEAS.DataSource = dtueas;
        grdUEAS.DataBind();


        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos >= 2 and expStatusHistory.id_statos<=4) or (expStatusHistory.id_statos >= 19 and expStatusHistory.id_statos<=21) or expStatusHistory.id_statos=1002 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtueash = new DataTable();
        SqlDataAdapter daueash = new SqlDataAdapter(cmd);
        daueash.Fill(dtueash);
        grdUEASH.DataSource = dtueash;
        grdUEASH.DataBind();
        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=26 or  Estatus_Bajoalto.id_statos=27 or Estatus_Bajoalto.id_statos=2 or Estatus_Bajoalto.id_statos=1002 or Estatus_Bajoalto.id_statos=7 or Estatus_Bajoalto.id_statos=1008 or Estatus_Bajoalto.id_statos=1010 or Estatus_Bajoalto.id_statos=1022 or Estatus_Bajoalto.id_statos=1023) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtCOOR = new DataTable();
        SqlDataAdapter daCOOR = new SqlDataAdapter(cmd);
        daCOOR.Fill(dtCOOR);
        grdCOOR.DataSource = dtCOOR;
        grdCOOR.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos=10 or expStatusHistory.id_statos=5 or expStatusHistory.id_statos=27 or expStatusHistory.id_statos =28) or expStatusHistory.id_statos=1003 or expStatusHistory.id_statos=1009 or expStatusHistory.id_statos=1011 or expStatusHistory.id_statos=1023 or expStatusHistory.id_statos=1024 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtCOORH = new DataTable();
        SqlDataAdapter daCOORH = new SqlDataAdapter(cmd);
        daCOORH.Fill(dtCOORH);
        grdCOORH.DataSource = dtCOORH;
        grdCOORH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=5)  or Estatus_Bajoalto.id_statos=9 or Estatus_Bajoalto.id_statos=13 or (Estatus_Bajoalto.id_statos=1009 or Estatus_Bajoalto.id_statos=1015) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtUOS = new DataTable();
        SqlDataAdapter daUOS = new SqlDataAdapter(cmd);
        daUOS.Fill(dtUOS);
        grdUOS.DataSource = dtUOS;
        grdUOS.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos=6) or expStatusHistory.id_statos=1010 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtUOSH = new DataTable();
        SqlDataAdapter daUOSH = new SqlDataAdapter(cmd);
        daUOSH.Fill(dtUOSH);
        grdUOSH.DataSource = dtUOSH;
        grdUOSH.DataBind();


        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=6) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDictamen = new DataTable();
        SqlDataAdapter daDictamen = new SqlDataAdapter(cmd);
        daDictamen.Fill(dtDictamen);
        grdDictamen.DataSource = dtDictamen;
        grdDictamen.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos>=7 and expStatusHistory.id_statos<=9) order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDictamenH = new DataTable();
        SqlDataAdapter daDictamenH = new SqlDataAdapter(cmd);
        daDictamenH.Fill(dtDictamenH);
        grdDictamenH.DataSource = dtDictamenH;
        grdDictamenH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=10) or Estatus_Bajoalto.id_statos=1012 order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDDS = new DataTable();
        SqlDataAdapter daDDS = new SqlDataAdapter(cmd);
        daDDS.Fill(dtDDS);
        grdDDS.DataSource = dtDDS;
        grdDDS.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos>=11 and expStatusHistory.id_statos<=13) or (expStatusHistory.id_statos>=1013 and expStatusHistory.id_statos<=1015 ) order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDDSH = new DataTable();
        SqlDataAdapter daDDSH = new SqlDataAdapter(cmd);
        daDDSH.Fill(dtDDSH);
        grdDDSH.DataSource = dtDDSH;
        grdDDSH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=11) or (Estatus_Bajoalto.id_statos=1005 or Estatus_Bajoalto.id_statos=1011 or Estatus_Bajoalto.id_statos=1013) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDOS = new DataTable();
        SqlDataAdapter daDOS = new SqlDataAdapter(cmd);
        daDOS.Fill(dtDOS);
        grdDOS.DataSource = dtDOS;
        grdDOS.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos=14 ) or expStatusHistory.id_statos=1008 or expStatusHistory.id_statos=1012 or expStatusHistory.id_statos=1016 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDOSH = new DataTable();
        SqlDataAdapter daDOSH = new SqlDataAdapter(cmd);
        daDOSH.Fill(dtDOSH);
        grdDOSH.DataSource = dtDOSH;
        grdDOSH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=14 or Estatus_Bajoalto.id_statos=22 or Estatus_Bajoalto.id_statos=23) or (Estatus_Bajoalto.id_statos=1003 or Estatus_Bajoalto.id_statos=1016 or Estatus_Bajoalto.id_statos=1018 or Estatus_Bajoalto.id_statos=1019  ) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDEAS = new DataTable();
        SqlDataAdapter daDEAS = new SqlDataAdapter(cmd);
        daDEAS.Fill(dtDEAS);
        grdDEAS.DataSource = dtDEAS;
        grdDEAS.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos=15 or expStatusHistory.id_statos=23 or expStatusHistory.id_statos=24) or expStatusHistory.id_statos=1004 or expStatusHistory.id_statos=1017 or expStatusHistory.id_statos=1019 or expStatusHistory.id_statos=1020 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDEASH = new DataTable();
        SqlDataAdapter daDEASH = new SqlDataAdapter(cmd);
        daDEASH.Fill(dtDEASH);
        grdDEASH.DataSource = dtDEASH;
        grdDEASH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=15 or Estatus_Bajoalto.id_statos=16 or Estatus_Bajoalto.id_statos=19) or (Estatus_Bajoalto.id_statos=1004 or Estatus_Bajoalto.id_statos=1017) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDAS = new DataTable();
        SqlDataAdapter daDAS = new SqlDataAdapter(cmd);
        daDAS.Fill(dtDAS);
        grdDAS.DataSource = dtDAS;
        grdDAS.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos>=16 and expStatusHistory.id_statos<=18 or expStatusHistory.id_statos=22) or (expStatusHistory.id_statos>=1005 and expStatusHistory.id_statos<=1007) or expStatusHistory.id_statos=1018 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDASH = new DataTable();
        SqlDataAdapter daDASH = new SqlDataAdapter(cmd);
        daDASH.Fill(dtDASH);
        grdDASH.DataSource = dtDASH;
        grdDASH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=24 or Estatus_Bajoalto.id_statos=25) or (Estatus_Bajoalto.id_statos=1020 or Estatus_Bajoalto.id_statos=1021) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtCORR = new DataTable();
        SqlDataAdapter daCORR = new SqlDataAdapter(cmd);
        daCORR.Fill(dtCORR);
        grdCORR.DataSource = dtCORR;
        grdCORR.DataBind();

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos=25 or expStatusHistory.id_statos=26) or (expStatusHistory.id_statos>=1021 and expStatusHistory.id_statos<=1022) order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtCORRH = new DataTable();
        SqlDataAdapter daCORRH = new SqlDataAdapter(cmd);
        daCORRH.Fill(dtCORRH);
        grdCORRH.DataSource = dtCORRH;
        grdCORRH.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where Estatus_Bajoalto.id_statos=3 or Estatus_Bajoalto.id_statos=8 or Estatus_Bajoalto.id_statos=12 or Estatus_Bajoalto.id_statos=17 or Estatus_Bajoalto.id_statos=20 or (Estatus_Bajoalto.id_statos=1006 or Estatus_Bajoalto.id_statos=1014) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtCAN = new DataTable();
        SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
        daCAN.Fill(dtCAN);
        grdCancelados.DataSource = dtCAN;
        grdCancelados.DataBind();

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where Estatus_Bajoalto.id_statos=31 or ( Estatus_Bajoalto.id_statos=1027) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtCANa = new DataTable();
        SqlDataAdapter daCANa = new SqlDataAdapter(cmd);
        daCANa.Fill(dtCANa);
        grdEntregados.DataSource = dtCANa;
        grdEntregados.DataBind();


        cnn.Close(); // siempre cerrar conexiones.

    }


}