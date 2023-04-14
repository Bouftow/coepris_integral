using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Drawing;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Configuration;
using Salud.Tamaulipas;

public partial class sistema_Avisos_Captura : System.Web.UI.Page
{
    Avfunc_3Representantes avfunc_3R = new Avfunc_3Representantes();
    Avfunc_clavesscian avfunc_claves = new Avfunc_clavesscian();
    protected void Page_Load(object sender, EventArgs e)
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        //Response.Write("<script>alert('"++')</script>");

        try
        {
            if (!Page.IsPostBack)
            {
                Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
                //ExportToExcel.Visible = false;
                BindData(usuarios.NumeroCoordinacion.ToString());
                //ddlCoord.SelectedValue = usuarios.NumeroCoordinacion.ToString();
                //NCord.InnerText = usuarios.NumeroCoordinacion.ToString();

                RadioButtonList1.Items[0].Selected = true;
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

    protected void btn_Grabar_Click(object sender, EventArgs e)
    {
        try
        {
            Usuarios usuarios = new Usuarios();
            usuarios.DatosDeRegistro(User.Identity.Name);
            Avisos aviso = new Avisos();
            aviso.P1homoclave = txt1Homoclave.Text.ToUpper();
            aviso.P1nombre = txt1Nombre.Text.ToUpper();
            aviso.P1modalidad = txt1Modalidad.Text.ToUpper();

            
            if (RadioButtonList1.Items[0].Selected) {
                aviso.TipoPersona = false;
                aviso.P2RFC = txt2RFCF.Text.ToUpper();
                aviso.P2CURP = txt2CURPF.Text.ToUpper();
                aviso.P2Nombre = txt2NombreF.Text.ToUpper();
                aviso.P2primerapellido = txt2ApellidopF.Text.ToUpper();
                aviso.P2segundoapellido = txt2ApellidomF.Text.ToUpper();
                aviso.P2lada = txt2LadaF.Text.ToUpper();
                aviso.P2telefono = txt2TelF.Text.ToUpper();
                aviso.P2extension = txt2ExtF.Text.ToUpper();
                aviso.P2correo = txt2CorreoF.Text.ToUpper();

            } 
            
            
            
            
            else {
                aviso.TipoPersona = true;
                aviso.P2RFCEmpresa = txt2RFCEmpresa.Text.ToUpper();
                aviso.P2razonsocial = txt2RazonM.Text.ToUpper();
                aviso.P2RFC = txt2RFCM.Text.ToUpper();
                aviso.P2CURP = txt2CURPM.Text.ToUpper();
                aviso.P2Nombre = txt2NombreM.Text.ToUpper();
                aviso.P2primerapellido = txt2ApellidopM.Text.ToUpper();
                aviso.P2segundoapellido = txt2ApellidomM.Text.ToUpper();
                aviso.P2lada = txt2LadaM.Text.ToUpper();
                aviso.P2telefono = txt2TelM.Text.ToUpper();
                aviso.P2extension = txt2ExtM.Text.ToUpper();
                aviso.P2correo = txt2CorreoM.Text.ToUpper();
            }


            aviso.P3RFC = txt3RFC.Text.ToUpper();
            aviso.P3RazonSocial = txt3RazonM.Text.ToUpper();

            aviso.P3CP = txt3CP.Text.ToUpper();
            aviso.P3nombrevialidad = txt3Vialidad.Text.ToUpper();
            aviso.P3numext = txt3NumExt.Text.ToUpper();
            aviso.P3numint = txt3NumInt.Text.ToUpper();
            aviso.P3colonia = txt3Asentamiento.Text.ToUpper();
            aviso.P3localidad = txt3Localidad.Text.ToUpper();
            aviso.P3municipio = txt3Municipio.Text.ToUpper();
            aviso.P3estado = txt3Entidad.Text.ToUpper();
            aviso.P3entre1 = txt3Entre1.Text.ToUpper();
            aviso.P3entre2 = txt3Entre2.Text.ToUpper();
            aviso.P3vialidadposterior = txt3Posterior.Text.ToUpper();
            aviso.P3lada = txt3Lada.Text.ToUpper();
            aviso.P3telefono = txt3Tel.Text.ToUpper();
            aviso.P3extension = txt3Ext.Text.ToUpper();

            aviso.RegUser = usuarios.Reguser;
            aviso.NumeroCoordinacion = usuarios.NumeroCoordinacion;

            string[] array = aviso.Grabar_Aviso();
            string id = array[0];
            string folio = array[1];

            
            if (id.Any())
            {
                //Clavesscian
                if (GridClavesscian.Rows.Count > 0)
                {


                    foreach (GridViewRow gvr in GridClavesscian.Rows)   //loop through GridView
                    {
                        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
                        string sqlStatement = string.Empty;

                        sqlStatement = "insert into bitaseg.avfunc3_claves_Scian " +
                        " (FOLIO_REGISTRO, Clave_Scian, Descripcion_Scian)" +
                        " values (@FOLIO_REGISTRO, @Clave_Scian, @Descripcion_Scian)";
                        cnn.Open();
                        SqlCommand cmd = new SqlCommand(sqlStatement, cnn);
                        cmd.Parameters.Add("@FOLIO_REGISTRO", SqlDbType.Int).Value = id;
                        cmd.Parameters.Add("@Clave_Scian", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_clave3")).Text;
                        cmd.Parameters.Add("@Descripcion_Scian", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_descripcion3")).Text;
                       
                        
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();

                        cnn.Close();
                    }
                }



                //Representantes
                if (Grid3Representantes.Rows.Count > 0)
                {
                    foreach (GridViewRow gvr in Grid3Representantes.Rows)   //loop through GridView
                    {
                        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
                        string sqlStatement = string.Empty;

                        sqlStatement = "insert into  bitaseg.avfunc3_3Representantes  " +
                        " (FOLIO_REGISTRO, curp3Representantes, nombre3Representantes, primerapellido3Representantes, segundoapellido3Representantes, lada3Representantes, tel3Representantes, ext3Representantes, correo3Representantes)" +
                        " values (@FOLIO_REGISTRO, @curp3Representantes, @nombre3Representantes, @primerapellido3Representantes, @segundoapellido3Representantes, @lada3Representantes, @tel3Representantes, @ext3Representantes, @correo3Representantes)";
                        cnn.Open();
                        SqlCommand cmd = new SqlCommand(sqlStatement, cnn);
                        cmd.Parameters.Add("@FOLIO_REGISTRO", SqlDbType.Int).Value = id;
                        cmd.Parameters.Add("@curp3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_curp3Representantes")).Text;
                        cmd.Parameters.Add("@nombre3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_nombre3Representantes")).Text;
                        cmd.Parameters.Add("@primerapellido3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_primerapellido3Representantes")).Text;
                        cmd.Parameters.Add("@segundoapellido3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_segundoapellido3Representantes")).Text;
                        cmd.Parameters.Add("@lada3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_lada3Representantes")).Text;
                        cmd.Parameters.Add("@tel3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_tel3Representantes")).Text;
                        cmd.Parameters.Add("@ext3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_ext3Representantes")).Text;
                        cmd.Parameters.Add("@correo3Representantes", SqlDbType.NVarChar, -1).Value = ((Label)gvr.FindControl("lbl_correo3Representantes")).Text;

                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();

                        cnn.Close();
                    }
                }

                Response.Write("<script>alert('Se ha capturado la información correctamente.Folio generado: " + folio +"')</script>");
                Response.Redirect("../Default.aspx");
            }




        }
        catch (Exception ex) { lblMessage.Text = ex.Message; }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex.ToString() == "0") {
            txt2RFCEmpresa.Attributes.Add("disabled", "disabled");
            txt2RazonM.Attributes.Add("disabled", "disabled");
            txt2RFCM.Attributes.Add("disabled", "disabled");
            txt2CURPM.Attributes.Add("disabled", "disabled");
            txt2NombreM.Attributes.Add("disabled", "disabled");
            txt2ApellidopM.Attributes.Add("disabled", "disabled");
            txt2ApellidomM.Attributes.Add("disabled", "disabled");
            txt2LadaM.Attributes.Add("disabled", "disabled");
            txt2TelM.Attributes.Add("disabled", "disabled");
            txt2ExtM.Attributes.Add("disabled", "disabled");
            txt2CorreoM.Attributes.Add("disabled", "disabled");

            

            txt2RFCF.Attributes.Remove("disabled");
            txt2CURPF.Attributes.Remove("disabled");
            txt2NombreF.Attributes.Remove("disabled");
            txt2ApellidopF.Attributes.Remove("disabled");
            txt2ApellidomF.Attributes.Remove("disabled");
            txt2LadaF.Attributes.Remove("disabled");
            txt2TelF.Attributes.Remove("disabled");
            txt2ExtF.Attributes.Remove("disabled");
            txt2CorreoF.Attributes.Remove("disabled");



            //Response.Write("<script>alert('aaaaaaaaaaaaaaa')</script>");
        }
        if (RadioButtonList1.SelectedIndex.ToString() == "1") {
            txt2RFCF.Attributes.Add("disabled", "disabled");
            txt2CURPF.Attributes.Add("disabled", "disabled");
            txt2NombreF.Attributes.Add("disabled", "disabled");
            txt2ApellidopF.Attributes.Add("disabled", "disabled");
            txt2ApellidomF.Attributes.Add("disabled", "disabled");
            txt2LadaF.Attributes.Add("disabled", "disabled");
            txt2TelF.Attributes.Add("disabled", "disabled");
            txt2ExtF.Attributes.Add("disabled", "disabled");
            txt2CorreoF.Attributes.Add("disabled", "disabled");


            txt2RFCEmpresa.Attributes.Remove("disabled");
            txt2RazonM.Attributes.Remove("disabled");
            txt2RFCM.Attributes.Remove("disabled");
            txt2CURPM.Attributes.Remove("disabled");
            txt2NombreM.Attributes.Remove("disabled");
            txt2ApellidopM.Attributes.Remove("disabled");
            txt2ApellidomM.Attributes.Remove("disabled");
            txt2LadaM.Attributes.Remove("disabled");
            txt2TelM.Attributes.Remove("disabled");
            txt2ExtM.Attributes.Remove("disabled");
            txt2CorreoM.Attributes.Remove("disabled");
            //Response.Write("<script>alert('dos')</script>");
        }
    }


    protected void ExportToExcel_Click(object sender, EventArgs e)
    {
        DataTable dataTable = ViewState["dtbl"] as DataTable;


        var dtCAN = dataTable;

        //dtCAN.Columns.RemoveAt(11);
        //dtCAN.Columns.Remove("id_estatus");
        //dtCAN.Columns.Remove("id_distintivo");
        //dtCAN.Columns.Remove("sesion");
        ExcelPackage excel = new ExcelPackage();
        var workSheet = excel.Workbook.Worksheets.Add("Value");
        var totalCols = dtCAN.Columns.Count;
        var totalRows = dtCAN.Rows.Count;

        //workSheet.Column(1).Style.Font.Color.SetColor(Color.Red);



        workSheet.Row(1).Style.Font.Color.SetColor(Color.White);
        workSheet.Row(1).Style.Fill.PatternType = ExcelFillStyle.Solid;
        workSheet.Row(1).Style.Fill.BackgroundColor.SetColor(Color.FromArgb(51, 122, 183));
        workSheet.Row(1).Style.Font.Bold = true;
        workSheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        //workSheet.Cells["A1"].Value = "Folio";
        //workSheet.Cells["B1"].Value = "Fecha de Registro";
        //workSheet.Cells["C1"].Value = "Coordinacion";
        //workSheet.Cells["D1"].Value = "Municipio";
        //workSheet.Cells["E1"].Value = "Localidad";
        //workSheet.Cells["F1"].Value = "Nombre de la institución";
        //workSheet.Cells["G1"].Value = "Clave del Centro de Trabajo";
        //workSheet.Cells["H1"].Value = "Nivel Educativo";
        //workSheet.Cells["I1"].Value = "Dirección de la institución";
        //workSheet.Cells["J1"].Value = "Nombre del responsable";
        //workSheet.Cells["L1"].Value = "Teléfono";
        //workSheet.Cells["L1"].Value = "Correo electrónico";
        //workSheet.Cells["M1"].Value = "Estatus actual";
        for (var col = 1; col <= totalCols; col++)
        {
            workSheet.Cells[1, col].Value = dtCAN.Columns[col - 1].ColumnName;
            //workSheet.Cells["A1:XX5000"].AutoFitColumns();
        }
        for (var row = 1; row <= totalRows; row++)
        {
            for (var col = 0; col < totalCols; col++)
            {
                workSheet.Cells[row + 1, col + 1].Value = dtCAN.Rows[row - 1][col];
                workSheet.Cells["A1:XX5000"].AutoFitColumns();//que se ajuste el tamaño de la celda dependiendo la info
                //LA LINEA QUE SIGUE ES PARA CAMBIAR EL FORMATO DEL ARCHIVO DE EXCEL A "FECHA" EN TODAS LAS FILAS DE LA COLUMNA B. 
                //Y su estructura es >>>> (Fila, Columna) = (2,2) = (2,B)
                //workSheet.Cells[row + 1, 2].Style.Numberformat.Format = "dd/mmmm/yyyy hh:mm";
            }
        }
        //workSheet.Cells["A1"].Value = "Folio";
        //workSheet.Cells["B1"].Value = "Fecha de Registro";
        //workSheet.Cells["C1"].Value = "Coordinacion";
        //workSheet.Cells["D1"].Value = "Municipio";
        //workSheet.Cells["E1"].Value = "Localidad";
        //workSheet.Cells["F1"].Value = "Nombre de la institución";
        //workSheet.Cells["G1"].Value = "Clave del Centro de Trabajo";
        //workSheet.Cells["H1"].Value = "Nivel Educativo";
        //workSheet.Cells["I1"].Value = "Dirección de la institución";
        //workSheet.Cells["J1"].Value = "Nombre del responsable";
        //workSheet.Cells["L1"].Value = "Teléfono";
        //workSheet.Cells["L1"].Value = "Correo electrónico";
        //workSheet.Cells["M1"].Value = "Estatus actual";
        workSheet.Cells["A1:XX5000"].AutoFitColumns();

        using (var memoryStream = new MemoryStream())
        {
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;  filename=Avisos_de_Funcionamiento.xlsx");
            excel.SaveAs(memoryStream);
            memoryStream.WriteTo(Response.OutputStream);
            Response.Flush();
            Response.End();
        }
    }

    public DataTable BindData(string id_coordinacion)
    {
        if (id_coordinacion == "87") { id_coordinacion = "numerocoordinacion"; }
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = Principal.CnnStr0;
        cnn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from gestori_CopiaVieja.bitaseg.AvFunc_Avisos";
        cmd.Connection = cnn;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        //GridView2.DataSource = dt;
        //GridView2.DataBind();
        ViewState["dtbl"] = dt;
        return dt;
    }
}