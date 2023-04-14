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
            //deas.Text = "true";
            ////das.Text = tramite.DAS.ToString();
            das.Text = "true";
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

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where (Estatus_Bajoalto.id_statos=15 or Estatus_Bajoalto.id_statos=16 or Estatus_Bajoalto.id_statos=19) or (Estatus_Bajoalto.id_statos=1004 or Estatus_Bajoalto.id_statos=1017) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtDAS = new DataTable();
        SqlDataAdapter daDAS = new SqlDataAdapter(cmd);
        daDAS.Fill(dtDAS);
        grdDAS.DataSource = dtDAS;
        grdDAS.DataBind();
        contadorDAS.InnerText = "Recibidos" + " " + "(" + (grdDAS.Rows.Count).ToString() + ")";

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where (expStatusHistory.id_statos>=16 and expStatusHistory.id_statos<=18 or expStatusHistory.id_statos=22) or (expStatusHistory.id_statos>=1005 and expStatusHistory.id_statos<=1007) or expStatusHistory.id_statos=1018 order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtDASH = new DataTable();
        SqlDataAdapter daDASH = new SqlDataAdapter(cmd);
        daDASH.Fill(dtDASH);
        grdDASH.DataSource = dtDASH;
        grdDASH.DataBind(); 

        cnn.Close(); // siempre cerrar conexiones.

    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MostrarDatos();
        UpdatePanel1.Update();
        UpdatePanel2.Update();

    }
}