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
            Usuarios usuarios = new Usuarios();
            usuarios.DatosDeRegistro(User.Identity.Name);
            if (usuarios.UEAS == false)
            {
                Response.Write("<script>alert('No tiene permisos. Contacte al administrador');window.location ='default.aspx';</script>");
            }
            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
            MostrarDatos();
        }
    }

    void MostrarDatos()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        var numcord = usuarios.NumeroCoordinacion;
        //var coord = "";
        //if (numcord > 0 && numcord <= 13)
        //{
        //    coord = "numerocoordinacion=" + numcord + " and";
        //}

        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "Select * from tramites order by folio";

        //cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento,  tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where " + coord + " ( (Estatus_Bajoalto.id_statos=18 or Estatus_Bajoalto.id_statos=1  or Estatus_Bajoalto.id_statos=33 or Estatus_Bajoalto.id_statos=34) or Estatus_Bajoalto.id_statos=1001 or Estatus_Bajoalto.id_statos=1029 ) order by  fecha_act_status desc,riesgo asc, estatus_bajoalto.id_statos asc, folio desc";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "bitaseg.proc_CargarGrids";
        cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = numcord;
        cmd.Parameters.Add("@grid", SqlDbType.VarChar, -1).Value = "lueas";

        cmd.Connection = cnn;
        DataTable dtueas = new DataTable();
        SqlDataAdapter daueas = new SqlDataAdapter(cmd);
        daueas.Fill(dtueas);
        grdUEAS.DataSource = dtueas;
        grdUEAS.DataBind();
        contadorUEAS.InnerText = "Recibidos para Evaluar" + " " + "(" + (grdUEAS.Rows.Count).ToString() + ")";


        cnn.Close();



        //daueas.Fill(dtueas);
        //Repeater1.DataSource = dtueas;
        //Repeater1.DataBind();



        //cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento,  tramites.riesgo AS nriesgo,tramites.folio,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus_bajoalto.statos as estatus_puesto,establecimientos.razonsocial,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on expStatusHistory.id_statos = estatus_bajoalto.id_statos where " + coord + "  ( (expStatusHistory.id_statos >= 2 and expStatusHistory.id_statos<=4) or (expStatusHistory.id_statos >= 19 and expStatusHistory.id_statos<=21) or expStatusHistory.id_statos=1002) order by expStatusHistory.fecha_act_status desc";

        //cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where " + coord + " ( (Estatus_Bajoalto.id_statos=1027 or Estatus_Bajoalto.id_statos=31)) order by riesgo asc, fecha_act_status desc, estatus_bajoalto.id_statos asc, folio desc";



        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = Principal.CnnStr0;
        cn.Open();
        SqlCommand command = new SqlCommand();
        //cmd.CommandText = "Select * from tramites order by folio";

        //cmd.CommandText = "select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento,  tramites.riesgo AS nriesgo, tramites.folio, tramites.fecha_act_status,tramites.fecha_lim, tramites.id_statos, estatus_bajoalto.statos, establecimientos.razonsocial from bitaseg.tramites inner join bitaseg.estatus_bajoalto on tramites.id_statos = estatus_bajoalto.id_statos inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento  where " + coord + " ( (Estatus_Bajoalto.id_statos=18 or Estatus_Bajoalto.id_statos=1  or Estatus_Bajoalto.id_statos=33 or Estatus_Bajoalto.id_statos=34) or Estatus_Bajoalto.id_statos=1001 or Estatus_Bajoalto.id_statos=1029 ) order by  fecha_act_status desc,riesgo asc, estatus_bajoalto.id_statos asc, folio desc";
        command.CommandType = CommandType.StoredProcedure;
        command.CommandText = "bitaseg.proc_CargarGrids";
        command.Parameters.Add("@coordinacion", SqlDbType.Int).Value = numcord;
        command.Parameters.Add("@grid", SqlDbType.VarChar, -1).Value = "lueash";

        command.Connection = cn;
        DataTable dtueash = new DataTable();
        SqlDataAdapter daueash = new SqlDataAdapter(command);
        daueash.Fill(dtueash);
        grdUEASH.DataSource = dtueash;
        grdUEASH.DataBind();
       


        cn.Close(); // siempre cerrar conexiones.

        SqlConnection cn1 = new SqlConnection();
        cn1.ConnectionString = Principal.CnnStr0;
        cn1.Open();
        SqlCommand command1 = new SqlCommand();

        command1.CommandType = CommandType.StoredProcedure;
        command1.CommandText = "bitaseg.proc_CargarGrids";
        command1.Parameters.Add("@coordinacion", SqlDbType.Int).Value = numcord;
        command1.Parameters.Add("@grid", SqlDbType.VarChar, -1).Value = "lueas-cis";

        command1.Connection = cn1;
        DataTable x = new DataTable();
        SqlDataAdapter r = new SqlDataAdapter(command1);
        r.Fill(x);
        grdECUEAS.DataSource = x;
        grdECUEAS.DataBind();
        contadorECUEAS.InnerText = "Recibidos por CIS" + " " + "(" + (grdECUEAS.Rows.Count).ToString() + ")";

        cn1.Close(); // siempre cerrar conexiones.


    }



    protected void Timer1_Tick(object sender, EventArgs e)
    {
        MostrarDatos();
        UpdatePanel1.Update();
        UpdatePanel2.Update();
        UpdatePanel3.Update();

    }

    
}