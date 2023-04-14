using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class sistema_Avisos_Captura : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('"++"')</script>");

        try
        {
            if (!Page.IsPostBack)
            {
                limpiar_pantalla2();
                limpiar_pantalla3Representantes();

                if (Convert.ToInt32(Request.Params["id"]) > 0)
                {
                    CargarGrid_ClavesScian();
                    CargarGrid_3Representantes();
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = clsStrings.fnErrorMessage(ex.Message);
        }
    }
        protected void Timer1_Tick(object sender, EventArgs e)
    {
        suma.Text = "";
        UpdatePanel1.Update();

    }


    #region Grid Claves Scian

    protected void btn_modal_agregar2_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid2();
        UpdatePanel4.Update();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#Modal_Clavesscian').modal('hide');", true);
    }

    private void AddNewRowToGrid2()
    {
        try
        {
            int rowIndex = 0;
            int i = 1;

            if (ViewState["CurrentTable2"] != null)
            {
                DataTable dtCurrentTable2 = (DataTable)ViewState["CurrentTable2"];

                if (dtCurrentTable2.Rows.Count > 0)
                {
                    for (i = 1; i <= dtCurrentTable2.Rows.Count; i++)
                    {
                        Label clave_txt3 = (Label)GridClavesscian.Rows[rowIndex].Cells[1].FindControl("lbl_clave3");
                        Label descripcion_txt3 = (Label)GridClavesscian.Rows[rowIndex].Cells[2].FindControl("lbl_descripcion3");
                       

                        //
                        dtCurrentTable2.Rows[i - 1]["Clave_Scian"] = clave_txt3.Text;
                        dtCurrentTable2.Rows[i - 1]["Descripcion_Scian"] = descripcion_txt3.Text;


                        rowIndex++;
                    }
                }
                //

                DataRow dr = dtCurrentTable2.NewRow();
                dr["Clave_Scian"] = txt3Clave.Text;
                dr["Descripcion_Scian"] = txt3Descripcion.Text;
                


                dtCurrentTable2.Rows.Add(dr);
                //
                ViewState["CurrentTable2"] = dtCurrentTable2;
                //
                GridClavesscian.DataSource = dtCurrentTable2;
                GridClavesscian.DataBind();
            }
            else
            {
                mensaje_error("ViewState is null");
            }
        }
        catch (Exception ex)
        {
            mensaje_error("error al agregar al grid: " + ex.Message);
        }
        //Set Previous Data on Postbacks
        // SetPreviousData(1);
    }

    public DataTable EstructuraGrid2()
    {

        DataTable estructura = new DataTable();

        estructura.Columns.Add("Clave_Scian", typeof(string));
        estructura.Columns.Add("Descripcion_Scian", typeof(string));

        return estructura;
    }

    public void limpiar_pantalla2()
    {
        //mensaje_error("limpiar_pantalla2");
        ViewState.Remove("CurrentTable2");
        DataTable dt2 = EstructuraGrid2();

        GridClavesscian.DataSource = dt2;
        GridClavesscian.DataBind();
        ViewState["CurrentTable2"] = dt2;

        UpdatePanel4.Update();
    }

    public void CargarGrid_ClavesScian()
    {

        Avfunc_clavesscian CS = new Avfunc_clavesscian();
        GridClavesscian.DataSource = CS.CargarGrid_ClavesScian(Convert.ToInt32(Request.Params["id"]));
        GridClavesscian.DataBind();
        ViewState["CurrentTable2"] = CS.CargarGrid_ClavesScian(Convert.ToInt32(Request.Params["id"]));

    }

    #endregion

    #region Grid 3Representantes

    protected void btn_modal_agregar3Representantes_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid3Representantes();
        UpdatePanel53Representantes.Update();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#Modal_3Representantes').modal('hide');", true);
    }

    private void AddNewRowToGrid3Representantes()
    {
        try
        {
            int rowIndex = 0;
            int i = 1;

            if (ViewState["CurrentTable3Representantes"] != null)
            {
                DataTable dtCurrentTable3Representantes = (DataTable)ViewState["CurrentTable3Representantes"];

                if (dtCurrentTable3Representantes.Rows.Count > 0)
                {
                    for (i = 1; i <= dtCurrentTable3Representantes.Rows.Count; i++)
                    {


                        Label curp3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[1].FindControl("lbl_curp3Representantes");
                        Label nombre3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[2].FindControl("lbl_nombre3Representantes");
                        Label primerapellido3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[3].FindControl("lbl_primerapellido3Representantes");
                        Label segundoapellido3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[4].FindControl("lbl_segundoapellido3Representantes");
                        Label lada3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[4].FindControl("lbl_lada3Representantes");
                        Label tel3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[5].FindControl("lbl_tel3Representantes");
                        Label ext3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[6].FindControl("lbl_ext3Representantes");
                        Label correo3Representantes = (Label)Grid3Representantes.Rows[rowIndex].Cells[7].FindControl("lbl_correo3Representantes");


                        //
                        dtCurrentTable3Representantes.Rows[i - 1]["curp3Representantes"] = curp3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["nombre3Representantes"] = nombre3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["primerapellido3Representantes"] = primerapellido3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["segundoapellido3Representantes"] = segundoapellido3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["lada3Representantes"] = lada3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["tel3Representantes"] = tel3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["ext3Representantes"] = ext3Representantes.Text;
                        dtCurrentTable3Representantes.Rows[i - 1]["correo3Representantes"] = correo3Representantes.Text;


                        rowIndex++;
                    }
                }
                //

                DataRow dr = dtCurrentTable3Representantes.NewRow();
                dr["curp3Representantes"] = txtCURP3Representantes.Text;
                dr["nombre3Representantes"] = txtNombre3Representantes.Text;
                dr["primerapellido3Representantes"] = txtApellidop3Representantes.Text;
                dr["segundoapellido3Representantes"] = txtApellidom3Representantes.Text;
                dr["lada3Representantes"] = txtLada3Representantes.Text;
                dr["tel3Representantes"] = txtTel3Representantes.Text;
                dr["ext3Representantes"] = txtExt3Representantes.Text;
                dr["correo3Representantes"] = txtCorreo3Representantes.Text;


                dtCurrentTable3Representantes.Rows.Add(dr);
                //
                ViewState["CurrentTable3Representantes"] = dtCurrentTable3Representantes;
                //
                Grid3Representantes.DataSource = dtCurrentTable3Representantes;
                Grid3Representantes.DataBind();
            }
            else
            {
                mensaje_error("ViewState is null");
            }
        }
        catch (Exception ex)
        {
            mensaje_error("error al agregar al grid: " + ex.Message);
        }
        //Set Previous Data on Postbacks
        // SetPreviousData(1);
    }

    public DataTable EstructuraGrid3Representantes()
    {

        DataTable estructura = new DataTable();
        estructura.Columns.Add("curp3Representantes", typeof(string));
        estructura.Columns.Add("nombre3Representantes", typeof(string));
        estructura.Columns.Add("primerapellido3Representantes", typeof(string));
        estructura.Columns.Add("segundoapellido3Representantes", typeof(string));
        estructura.Columns.Add("lada3Representantes", typeof(string));
        estructura.Columns.Add("tel3Representantes", typeof(string));
        estructura.Columns.Add("ext3Representantes", typeof(string));
        estructura.Columns.Add("correo3Representantes", typeof(string));

        return estructura;
    }

    public void limpiar_pantalla3Representantes()
    {
        //mensaje_error("limpiar_pantalla2");
        ViewState.Remove("CurrentTable3Representantes");
        DataTable dt3Representantes = EstructuraGrid3Representantes();

        Grid3Representantes.DataSource = dt3Representantes;
        Grid3Representantes.DataBind();
        ViewState["CurrentTable3Representantes"] = dt3Representantes;

        UpdatePanel53Representantes.Update();
    }

    public void CargarGrid_3Representantes()
    {

        Avfunc_3Representantes CS = new Avfunc_3Representantes();
        Grid3Representantes.DataSource = CS.CargarGrid_3Representantes(Convert.ToInt32(Request.Params["id"]));
        Grid3Representantes.DataBind();
        ViewState["CurrentTable3Representantes"] = CS.CargarGrid_3Representantes(Convert.ToInt32(Request.Params["id"]));

    }

    #endregion

    
    #region Eliminar Renglon grid Claves Scian

    protected void gdvEliminar_Clavesscian(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Eliminar":
                {
                    gdvEliminar_Clavesscian(Convert.ToInt32(e.CommandArgument.ToString()));
                    break;
                }
        }
    }

    public void gdvEliminar_Clavesscian(int NumeroRenglon)
    {
        DataTable dt = (DataTable)ViewState["CurrentTable2"];
        int i = 0;
        if (dt.Rows.Count > 0)
        {
            for (i = 0; i < dt.Rows.Count; i++)
            {
                if (i == NumeroRenglon)
                {
                    dt.Rows[i].Delete();
                }
            }
            ViewState["CurrentTable2"] = dt;
            //
            GridClavesscian.DataSource = dt;
            GridClavesscian.DataBind();

        }
    }

    #endregion

    #region Eliminar Renglon grid 3Representantes

    protected void gdvEliminar_3Representantes(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Eliminar":
                {
                    gdvEliminar_3Representantes(Convert.ToInt32(e.CommandArgument.ToString()));
                    break;
                }
        }
    }

    public void gdvEliminar_3Representantes(int NumeroRenglon)
    {
        DataTable dt = (DataTable)ViewState["CurrentTable3Representantes"];
        int i = 0;
        if (dt.Rows.Count > 0)
        {
            for (i = 0; i < dt.Rows.Count; i++)
            {
                if (i == NumeroRenglon)
                {
                    dt.Rows[i].Delete();
                }
            }
            ViewState["CurrentTable3Representantes"] = dt;
            //
            Grid3Representantes.DataSource = dt;
            Grid3Representantes.DataBind();

        }
    }

    #endregion






    public void mensaje_error(string txt_mensaje)
    {
        ScriptManager.RegisterStartupScript(
                this,
                typeof(Page),
                "Alert",
                "<script>alert('" + txt_mensaje + "');</script>",
                false);
    }



    protected void boton_Click(object sender, EventArgs e)
    {  
        //var grupo1 = "";
    //    if (rb4Aerea2.Checked == true) { grupo1 = rb4Aerea2.Text; }
    //    if (rb4Maritima2.Checked == true) { grupo1 = rb4Maritima2.Text; }
    //    if (rb4Terrestre2.Checked == true) { grupo1 = rb4Terrestre2.Text; }

    //    var grupo2 = "";
    //    if (rb4Alta2.Checked == true) { grupo2 = rb4Alta2.Text; }
    //    if (rb4Baja2.Checked == true) { grupo2 = rb4Baja2.Text; }
    //    if (rb4Modificar2.Checked == true) { grupo2 = rb4Modificar2.Text; }

    //    Response.Write("<script>alert('"+grupo1 + grupo2+"')</script>");
    }
}