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
        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo," +
            " tramites.riesgo AS nriesgo, " +
            "tramites.folio, " +
            "tramites.folioseguimiento,"+
            "tramites.fecha_act_status," +
            "tramites.fecha_lim, tramites.id_statos," +
            " estatus_bajoalto.statos," +
            " establecimientos.razonsocial " +
            "from bitaseg.tramites   " +
            "inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   " +
            "inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    " +
            "inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  " +
            "where (Estatus_Bajoalto.id_statos=1031 or Estatus_Bajoalto.id_statos=1032) or (Estatus_Bajoalto.id_statos=40 or Estatus_Bajoalto.id_statos=41) " +
            "order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtCORR = new DataTable();
        SqlDataAdapter daCORR = new SqlDataAdapter(cmd);
        daCORR.Fill(dtCORR);
        grdCORR.DataSource = dtCORR;
        grdCORR.DataBind();
        contadorCORR.InnerText = "Recibidos" + " " + "(" + (grdCORR.Rows.Count).ToString() + ")";

        cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo," +
            " tramites.riesgo AS nriesgo," +
            "tramites.folio," +
            "tramites.folioseguimiento,"+
            "tramites.fecha_reg," +
            "tramites.fecha_lim," +
            "tramites.id_statos," +
            "expStatusHistory.id_statos," +
            "estatus_bajoalto.statos as estatus_puesto," +
            "establecimientos.razonsocial," +
            "expStatusHistory.fecha_act_status " +
            "from bitaseg.tramites " +
            "inner join bitaseg.personas ON tramites.id_persona = personas.id_persona " +
            "inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio " +
            "inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento " +
            "inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos " +
            "where (expStatusHistory.id_statos>=1031 and expStatusHistory.id_statos<=1032) " +
            "order by expStatusHistory.fecha_act_status desc";
        cmd.Connection = cnn;
        DataTable dtCORRH = new DataTable();
        SqlDataAdapter daCORRH = new SqlDataAdapter(cmd);
        daCORRH.Fill(dtCORRH);
        grdCORRH.DataSource = dtCORRH;
        grdCORRH.DataBind();

        cnn.Close(); // siempre cerrar conexiones.

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MostrarDatos();
        UpdatePanel1.Update();
    }
}