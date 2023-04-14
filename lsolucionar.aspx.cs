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
                txtTexto.Text = tramite.Folio.ToString();
                cis.Text = "true";
                int rfolio = Convert.ToInt32(this.txtTexto.Text);

                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
                SqlCommand cmd = new SqlCommand();
                //cmd.CommandText = "Select * from tramites order by folio";

                cmd.Parameters.Add("@rfolio", SqlDbType.VarChar,-1).Value = rfolio;
                //cmd.CommandText = "Select tramites.folio,expStatusHistory.fecha_act_status,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from tramites inner join personas ON tramites.id_persona = personas.id_persona inner join establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join expStatusHistory on tramites.folio = expStatusHistory.folio inner join estatus on expStatusHistory.id_statos = estatus.id_statos where tramites.folio=@rfolio  order by expStatUsHistory.fecha_act_status desc";
                cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo,tramites.folioseguimiento, tramites.folio,tramites.fecha_reg,tramites.fecha_lim,expStatusHistory.id_statos,Estatus_BajoAlto.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.Estatus_BajoAlto on expStatusHistory.id_statos = Estatus_BajoAlto.id_statos where tramites.folioseguimiento like '%'+ @rfolio +'%'  order by expStatusHistory.fecha_act_status desc";
                cmd.Connection = cnn;
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                grdBusquedaActStatus.DataSource = dt;
                grdBusquedaActStatus.DataBind();

                cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo,tramites.folioseguimiento, tramites.fecha_reg,tramites.folio,tramites.fecha_lim ,estatus_bajoalto.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on tramites.id_statos = Estatus_bajoalto.id_statos where tramites.folioseguimiento like '%'+ @rfolio +'%'  order by tramites.id_statos";
                cmd.Connection = cnn;
                DataTable dta = new DataTable();
                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                dat.Fill(dta);
                grdBusquedaActual.DataSource = dta;
                grdBusquedaActual.DataBind();


                //cmd.CommandText = "Select tramites.folio,expStatusHistory.fecha_act_status,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from tramites inner join personas ON tramites.id_persona = personas.id_persona inner join establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join expStatusHistory on tramites.folio = expStatusHistory.folio inner join estatus on expStatusHistory.id_statos = estatus.id_statos where tramites.folio=@rfolio  order by expStatUsHistory.fecha_act_status desc";
                cmd.CommandText = "Select Lista_Tramites2.nombre_tramite from bitaseg.tramites  inner join bitaseg.Lista_Tramites2 on tramites.id_tramite = Lista_Tramites2.id_tramite where tramites.folioseguimiento like '%'+ @rfolio +'%'  ";
                cmd.Connection = cnn;
                DataTable dte = new DataTable();
                SqlDataAdapter de = new SqlDataAdapter(cmd);
                de.Fill(dte);
                grdNombreTramite.DataSource = dte;
                grdNombreTramite.DataBind();

                cnn.Close(); // siempre cerrar conexiones.

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {



            //string text = texto.Text;

            int rfolio = Convert.ToInt32(this.txtTexto.Text);

            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
            SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "Select * from tramites order by folio";

            cmd.Parameters.Add("@rfolio", SqlDbType.VarChar,-1).Value = rfolio;
            //cmd.CommandText = "Select tramites.folio,expStatusHistory.fecha_act_status,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from tramites inner join personas ON tramites.id_persona = personas.id_persona inner join establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join expStatusHistory on tramites.folio = expStatusHistory.folio inner join estatus on expStatusHistory.id_statos = estatus.id_statos where tramites.folio=@rfolio  order by expStatUsHistory.fecha_act_status desc";
            cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo,tramites.folioseguimiento, tramites.folioseguimiento, tramites.folio,tramites.fecha_reg,tramites.fecha_lim,expStatusHistory.id_statos,Estatus_BajoAlto.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.expStatusHistory on tramites.folio = expStatusHistory.folio inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.Estatus_BajoAlto on expStatusHistory.id_statos = Estatus_BajoAlto.id_statos where tramites.folioseguimiento like '%'+ @rfolio +'%' order by expStatusHistory.fecha_act_status desc";
            cmd.Connection = cnn;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            grdBusquedaActStatus.DataSource = dt;
            grdBusquedaActStatus.DataBind();

            cmd.CommandText = "Select IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo,tramites.folioseguimiento, tramites.folioseguimiento, tramites.fecha_reg,tramites.folio,tramites.fecha_lim ,estatus_bajoalto.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on tramites.id_statos = Estatus_bajoalto.id_statos where tramites.folioseguimiento like '%'+ @rfolio +'%'  order by tramites.id_statos";
            cmd.Connection = cnn;
            DataTable dta = new DataTable();
            SqlDataAdapter dat = new SqlDataAdapter(cmd);
            dat.Fill(dta);
            grdBusquedaActual.DataSource = dta;
            grdBusquedaActual.DataBind();


            //cmd.CommandText = "Select tramites.folio,expStatusHistory.fecha_act_status,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from tramites inner join personas ON tramites.id_persona = personas.id_persona inner join establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join expStatusHistory on tramites.folio = expStatusHistory.folio inner join estatus on expStatusHistory.id_statos = estatus.id_statos where tramites.folio=@rfolio  order by expStatUsHistory.fecha_act_status desc";
            cmd.CommandText = "Select  Lista_Tramites2.nombre_tramite from bitaseg.tramites  inner join bitaseg.Lista_Tramites2 on tramites.id_tramite = Lista_Tramites2.id_tramite where tramites.folioseguimiento like '%'+ @rfolio +'%'  ";
            cmd.Connection = cnn;
            DataTable dte = new DataTable();
            SqlDataAdapter de = new SqlDataAdapter(cmd);
            de.Fill(dte);
            grdNombreTramite.DataSource = dte;
            grdNombreTramite.DataBind();

            cnn.Close(); // siempre cerrar conexiones.

        }


    }
