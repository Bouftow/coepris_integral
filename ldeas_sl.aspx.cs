using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
            // cis.Text = tramite.CIS.ToString();
            //cis.Text = "true";
            //// ueas.Text = tramite.UEAS.ToString();
            //ueas.Text = "true";
            ////coor.Text = tramite.COOR.ToString();
            //coor.Text = "true";
            //uos.Text = tramite.UOS.ToString();
            //uos.Text = "true";
            ////dictaminador.Text = tramite.DICTAMINADOR.ToString();
            //dictaminador.Text = "true";
            ////dos.Text = tramite.DOS.ToString();
            //dos.Text = "true";
            ////dds.Text = tramite.DDS.ToString();
            //dds.Text = "true";
            ////deas.Text = tramite.DEAS.ToString();
            deas.Text = "true";
            ////das.Text = tramite.DAS.ToString();
            //das.Text = "true";
            ////corr.Text = tramite.CORR.ToString();
            //corr.Text = "true";
            ////rech.Text = tramite.RECH.ToString();
            //rech.Text = "true";
            ////entr.Text = tramite.ENTR.ToString();
            //entr.Text = "true";
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

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento,tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=22 or Estatus_Bajoalto.id_statos=14 or Estatus_Bajoalto.id_statos=23) or (Estatus_Bajoalto.id_statos=1003 or Estatus_Bajoalto.id_statos=1016 or Estatus_Bajoalto.id_statos=1018 or Estatus_Bajoalto.id_statos=1019  ) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDEAS = new DataTable();
        SqlDataAdapter daDEAS = new SqlDataAdapter(cmd);
        daDEAS.Fill(dtDEAS);
        grdDEAS.DataSource = dtDEAS;
        grdDEAS.DataBind();
        contadorDEAS.InnerText = "Recibidos" + " " + "(" + (grdDEAS.Rows.Count).ToString() + ")";

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos=15 or expStatusHistory.id_statos=23 or expStatusHistory.id_statos=24) or expStatusHistory.id_statos=1004 or expStatusHistory.id_statos=1017 or expStatusHistory.id_statos=1019 or expStatusHistory.id_statos=1020 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDEASH = new DataTable();
        SqlDataAdapter daDEASH = new SqlDataAdapter(cmd);
        daDEASH.Fill(dtDEASH);
        grdDEASH.DataSource = dtDEASH;
        grdDEASH.DataBind();

        cnn.Close(); // siempre cerrar conexiones.

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MostrarDatos();
        UpdatePanel1.Update();

    }
}