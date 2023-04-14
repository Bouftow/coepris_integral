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
            cis.Text = "true";
            

            MostrarDatos();
        }
    }

    void MostrarDatos()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        var numcord = usuarios.NumeroCoordinacion;
        var coord = "";
        if (numcord > 0 && numcord <= 13)
        {
            coord = "numerocoordinacion=" + numcord + " and";
        }

        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "Select * from tramites order by folio";

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona    inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where "+ coord +"  ((Estatus_Bajoalto.id_statos=1 or Estatus_Bajoalto.id_statos=4 or Estatus_Bajoalto.id_statos=32) or (Estatus_Bajoalto.id_statos=1001 or Estatus_Bajoalto.id_statos=1007 or Estatus_Bajoalto.id_statos=21 or (Estatus_Bajoalto.id_statos>=1028 and Estatus_Bajoalto.id_statos<=1030) )) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        grdCIS.DataSource = dt;
        grdCIS.DataBind();
        contadorCIS.InnerText = "Recibidos"+" "+"("+(grdCIS.Rows.Count).ToString() + ")";
        

        cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites   inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos   inner join bitaseg.personas ON tramites.id_persona = personas.id_persona  inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where " + coord + "  (Estatus_Bajoalto.id_statos=28 or Estatus_Bajoalto.id_statos=29 or Estatus_Bajoalto.id_statos=30) or (Estatus_Bajoalto.id_statos>=1024 and Estatus_Bajoalto.id_statos<=1026) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.Connection = cnn;
        DataTable dtcor = new DataTable();
        SqlDataAdapter dacor = new SqlDataAdapter(cmd);
        dacor.Fill(dtcor);
        grdCIScor.DataSource = dtcor;
        grdCIScor.DataBind();
        contadorCIScor.InnerText = "Listos para Notificar/Entregar" + " " + "(" + (grdCIScor.Rows.Count).ToString() + ")";

        cmd.CommandText = "Select distinct IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento,tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,establecimientos.razonsocial from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where " + coord + "  expStatusHistory.id_statos = 1 or (expStatusHistory.id_statos>=29 and expStatusHistory.id_statos<=33) or expStatusHistory.id_statos=1001 or (expStatusHistory.id_statos>=1025 and expStatusHistory.id_statos<=1029) ";
        cmd.Connection = cnn;
        DataTable dth = new DataTable();
        SqlDataAdapter dah = new SqlDataAdapter(cmd);
        dah.Fill(dth);
        grdCISH.DataSource = dth;
        grdCISH.DataBind();

        cnn.Close(); // siempre cerrar conexiones.

    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MostrarDatos();
        UpdatePanel1.Update();
        UpdatePanel2.Update();
        UpdatePanel3.Update();
       
    }
   

}