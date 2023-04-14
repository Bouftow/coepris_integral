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

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            ModalidadTramitesDropDownList();
            categoriareal.Text = categoria.Value;

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //string text = texto.Text;

        var rfolio = (this.txtTexto.Text).ToString();
        string coordinacion = "";
        var tipo_tram = "";
        string modalidad = "";
        var fecha = "";

        
        if (ddlTramites.SelectedValue != "") { tipo_tram = "/" + ddlTramites.SelectedValue + "/"; }
        if (ddlCategorias.SelectedValue != "") {  modalidad = "/" + ddlCategorias.SelectedValue + "/"; }
        if (txtfecha.Text != "")
        {
            string value = txtfecha.Text;

            int length = 2;
            int diaindex = 8;
            int mesindex = 5;
            int añoindex = 2;

            string dia = value.Substring(diaindex, length);
            string mes = value.Substring(mesindex, length);
            string año = value.Substring(añoindex, length);
            fecha = año + mes + dia;
        }

        if (DropDownList1.SelectedValue.Length != 2) { coordinacion = DropDownList1.SelectedValue.PadLeft(2, '0'); }
         coordinacion = "/" + coordinacion + "/";

        //Response.Write("<script>alert(' rfolio:" +rfolio + ", coordinacion:"+ coordinacion + ", tipo_tram:"+tipo_tram+", modalidad:"+modalidad+", fecha:"+fecha+"')</script>");
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        //cmd.Parameters.Add("@fecha", SqlDbType.VarChar,6).Value = fecha;
        //cmd.Parameters.Add("@coordinacion", SqlDbType.VarChar,4).Value = coordinacion;
        //cmd.Parameters.Add("@tipo_tramite", SqlDbType.VarChar,7).Value = tipo_tram;
        //cmd.Parameters.Add("@modalidad", SqlDbType.VarChar,4).Value = modalidad;
        cmd.Parameters.Add("@folio", SqlDbType.VarChar,5).Value = rfolio;


        //cmd.CommandText = "Select folio, IIF ( (IsNumeric(estatus_bajoalto.porcentaje)) = 1, Convert(varchar, estatus_bajoalto.porcentaje  + '%' ),estatus_bajoalto.porcentaje) AS porcentaje , IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.fecha_reg,tramites.folio,tramites.fecha_lim ,estatus_bajoalto.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on tramites.id_statos = Estatus_bajoalto.id_statos where folioseguimiento like (@fecha + '%') and folioseguimiento like ('%' + @coordinacion + '%') and folioseguimiento like ('%' + @tipo_tramite + '%') and folioseguimiento like ('%' + @modalidad + '%') and folioseguimiento like ('%' + @folio) order by tramites.id_statos";
        cmd.CommandText = "Select folio, IIF ( (IsNumeric(estatus_bajoalto.porcentaje)) = 1,Convert(varchar, estatus_bajoalto.porcentaje  + '%' ),estatus_bajoalto.porcentaje) AS porcentaje , IIF (tramites.riesgo = 2,'Alto Riesgo','Bajo Riesgo' ) AS riesgo, tramites.folioseguimiento, tramites.fecha_reg,tramites.folio,tramites.fecha_lim,estatus_bajoalto.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc from bitaseg.tramites inner join bitaseg.personas ON tramites.id_persona = personas.id_persona inner join bitaseg.establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join bitaseg.estatus_bajoalto on tramites.id_statos = Estatus_bajoalto.id_statos where folioseguimiento like ('%' + @folio) order by tramites.id_statos";
        cmd.Connection = cnn;
        DataTable dta = new DataTable();
        SqlDataAdapter dat = new SqlDataAdapter(cmd);
        dat.Fill(dta);
        grdBusquedaActual.DataSource = dta;
        grdBusquedaActual.DataBind();

        for (int rows = 0; rows < grdBusquedaActual.Rows.Count; rows++)
        {


            grdBusquedaActual.Rows[rows].Visible = false;
            
        }


        //cmd.CommandText = "Select tramites.folio,expStatusHistory.fecha_act_status,tramites.fecha_reg,tramites.fecha_lim,tramites.id_statos,expStatusHistory.id_statos,estatus.statos,personas.id_persona,personas.curp,establecimientos.id_establecimiento,establecimientos.rfc,expStatusHistory.fecha_act_status from tramites inner join personas ON tramites.id_persona = personas.id_persona inner join establecimientos on tramites.id_establecimiento = establecimientos.id_establecimiento inner join expStatusHistory on tramites.folio = expStatusHistory.folio inner join estatus on expStatusHistory.id_statos = estatus.id_statos where tramites.folio=@rfolio  order by expStatUsHistory.fecha_act_status desc";
        cmd.CommandText = " Select tramites.folio, Lista_Tramites2.nombre_tramite, tramites.folioseguimiento from bitaseg.tramites  inner join bitaseg.Lista_Tramites2 on tramites.id_tramite = Lista_Tramites2.id_tramite where folioseguimiento like ('%' + @folio) order by tramites.id_statos";
        cmd.Connection = cnn;
        DataTable dte = new DataTable();
        SqlDataAdapter de = new SqlDataAdapter(cmd);
        de.Fill(dte);
        grdNombreTramite.DataSource = dte;
        grdNombreTramite.DataBind();

        cnn.Close(); // siempre cerrar conexiones.

    }

    protected void grdNombreTramite_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            //
            // Se obtiene indice de la row seleccionada
            //
            int index = Convert.ToInt32(e.CommandArgument);

            //
            // Obtengo el id de la entidad que se esta editando
            // en este caso de la entidad Person
            //
            int id = Convert.ToInt32(grdNombreTramite.DataKeys[index].Value);
            grdBusquedaActual.Rows[index].Visible = true;

            //Response.Write("<script>alert('"+index+"')</script>");

        }

    }
    //protected void grdNombreTramite_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //
    //    // Se obtiene la fila seleccionada del gridview
    //    //
    //    GridViewRow row = grdNombreTramite.SelectedRow;

    //    //
    //    // Obtengo el id y el nombre  de la entidad que se esta editando
    //    // en este caso de la entidad Person
    //    //
    //    int id = Convert.ToInt32(grdNombreTramite.DataKeys[row.RowIndex].Values["id_tramite"]);

    //    string nombre = Convert.ToString(grdNombreTramite.DataKeys[row.RowIndex].Values["nombre_tramite"]);


    //}

    protected void grdNombreTramite_SelectedIndexChanged(object sender, EventArgs e)
    {
        //
        // Se obtiene la fila seleccionada del gridview
        //
        GridViewRow row = grdNombreTramite.SelectedRow;

        //
        // Obtengo el id de la entidad que se esta editando
        // en este caso de la entidad Person
        //
        int id = Convert.ToInt32(grdNombreTramite.DataKeys[row.RowIndex].Value);
        string nombre = Convert.ToString(grdNombreTramite.DataKeys[row.RowIndex].Values["folio"]);
        //Response.Write("<script>alert('"+nombre+"')</script>");

    }

    private void ModalidadTramitesDropDownList()
    {
        ddlCategorias.DataBind();
        ddlTramites.DataBind();
        ListItem liCategoria = new ListItem("Seleccione un ...", "");
        ddlCategorias.Items.Insert(0, liCategoria);

        ListItem liTramite = new ListItem("Seleccione un Trámite", "");
        ddlTramites.Items.Insert(0, liTramite);


        //ddlTramites.Enabled = false;
    }




}
