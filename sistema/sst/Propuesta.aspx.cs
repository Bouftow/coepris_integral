using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class sistema_sst_Propuesta : System.Web.UI.Page
{
    static ConsultaCURP.ws service = new ConsultaCURP.ws();
    protected void Page_Load(object sender, EventArgs e)
    {

        //1	Receptoría/Ventanilla
        //2	Acuerdos del C.Gobernador del Estado
        //3	Atención Ciudadana del C.Gobernador CAC
        //4	Secretaría Particular de Gobierno
        //5	Sistema DIF Tamaulipas
        //6	SEBIEN
        //7	Presidencia de la República
        //8	Gestión Parlamentaria
        //9	IPSSSET
        //10 Varios
     
        if (!IsPostBack)
        {

            HttpCookie cookie = Request.Cookies["tabActivo"];

            if (cookie != null)
            {
                // Borra la cookie estableciendo su fecha de expiración en el pasado
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            div_c000.Visible = false;
            div_numero_oficioSAC.Visible = false;
            //div_Municipio_solicitud.Visible = false;
            div_presidente_republica.Visible = false;
            div_SAC.Visible = false;
            div_origen_varios.Visible = false;
            div_adscripcion.Visible = false;
            div_gridview.Visible = false;

            fecha_inicial.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DateTime fechaHoy = DateTime.Now;
            DateTime ultimoDiaDelMes = new DateTime(fechaHoy.Year, fechaHoy.Month, DateTime.DaysInMonth(fechaHoy.Year, fechaHoy.Month));
            fecha_final.Text = ultimoDiaDelMes.ToString("yyyy-MM-dd");


            // Establecer la cadena de conexión a tu base de datos SQL Server
            using (SqlConnection connection = new SqlConnection(Principal.CnnStr0))
            {
                connection.Open();

                string sql = "SELECT id_estatus, estatus FROM sst_atn.estatus";
                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader reader = command.ExecuteReader();

                ddlEstatus1.Items.Insert(0, new ListItem("-Selecciona-", "-1"));
                ddlEstatus1.SelectedIndex = 0;

                while (reader.Read())
                {
                    ListItem listItem = new ListItem(reader["estatus"].ToString(), reader["id_estatus"].ToString());
                    ddlEstatus1.Items.Add(listItem);
                }

                reader.Close();
            }
        }
    }
    protected void ddl_origen_SelectedIndexChanged(object sender, EventArgs e)
    {
        //1	Receptoría/Ventanilla
        //2	Acuerdos del C.Gobernador del Estado
        //3	Atención Ciudadana del C.Gobernador CAC
        //4	Secretaría Particular de Gobierno
        //5	Sistema DIF Tamaulipas
        //6	SEBIEN
        //7	Presidencia de la República
        //8	Gestión Parlamentaria
        //9	IPSSSET
        //10 Varios
        switch (ddl_origen2.SelectedValue)
        {
            case "1":
                div_c000.Visible = false;
                div_numero_oficioSAC.Visible = false;
                //div_Municipio_solicitud.Visible = false;
                div_presidente_republica.Visible = false;
                div_SAC.Visible = false;
                div_origen_varios.Visible = false;
                break;
            case "2":
            case "3":
            case "4":
            case "5":
                div_c000.Visible = true;
                div_numero_oficioSAC.Visible = true;
                //div_Municipio_solicitud.Visible = false;
                div_presidente_republica.Visible = false;
                div_SAC.Visible = true;
                div_origen_varios.Visible = false;
                div_adscripcion.Visible = false;
                break;
            case "6":
            case "8":
                div_c000.Visible = true;
                div_numero_oficioSAC.Visible = true;
                //div_Municipio_solicitud.Visible = false;
                div_presidente_republica.Visible = false;
                div_SAC.Visible = false;
                div_origen_varios.Visible = false;
                div_adscripcion.Visible = false;
                break;
            case "7":
                div_c000.Visible = true;
                div_numero_oficioSAC.Visible = true;
                //div_Municipio_solicitud.Visible = false;
                div_presidente_republica.Visible = true;
                div_SAC.Visible = false;
                div_origen_varios.Visible = false;
                div_adscripcion.Visible = false;
                break;
            case "9":
                div_c000.Visible = true;
                div_numero_oficioSAC.Visible = true;
                //div_Municipio_solicitud.Visible = false;
                div_presidente_republica.Visible = false;
                div_SAC.Visible = false;
                div_origen_varios.Visible = false;
                div_adscripcion.Visible = true;
                break;
            default:
                div_c000.Visible = false;
                div_numero_oficioSAC.Visible = false;
                //div_Municipio_solicitud.Visible = false;
                div_presidente_republica.Visible = false;
                div_SAC.Visible = false;
                div_origen_varios.Visible = false;
                div_adscripcion.Visible = false;
                break;

        }

    }
    protected void btnObservaciones_Click(object sender, EventArgs e)
    {
        Button btnObservaciones = (Button)sender; // Obtener el botón que se hizo clic
        GridViewRow row = (GridViewRow)btnObservaciones.NamingContainer; // Obtener la fila de la celda del botón
        TextBox txtObservaciones2 = (TextBox)row.FindControl("txtObservaciones2"); // Obtener el TextBox de observaciones

        // Mostrar el TextBox de observaciones
        txtObservaciones2.Visible = true;
    }
    protected void Button_Click(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('"+ Convert.ToDateTime(date_fecha_nac_sol.Text)+ Convert.ToDateTime(date_fecha_nac_pac.Text) + "')</script>");

        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Connection = cnn;
            //cmd.CommandText = "bitaseg.proc_RptGsln";
            //cmd.Parameters.Add("@fecha1", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha1.Text);
            //cmd.Parameters.Add("@fecha2", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha2.Text);
            //var coord = DropDownList1.SelectedValue;
            //if (DropDownList1.SelectedValue == "-1") { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value =0; }
            //else { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = DropDownList1.SelectedValue; }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "sst_atn.buscador";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@origen", SqlDbType.Int).Value = Convert.ToInt32(ddl_origen_busqueda.SelectedValue);
            //        //    SqlDataReader dr = cmd.ExecuteReader();
            cmd.Connection = cnn;

            DataTable dtCAN = new DataTable();
            SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
            daCAN.Fill(dtCAN);
            grdBusqueda.DataSource = dtCAN;
            grdBusqueda.DataSource = dtCAN;
            //dtCAN.Rows.OfType<DataRow>().ToList().ForEach(f => f.SetField("monto", String.Concat("$", f["monto"])));
            grdBusqueda.ShowFooter = false;
            grdBusqueda.DataBind();
            cnn.Close(); // siempre cerrar conexiones.
        }

        catch (Exception Ex)
        {


            lblError.Text = Ex.Message;
        }

    }

    protected void Guardar_Solicitud_ServerClick(object sender, EventArgs e)
    {

        try
        {
            Atencion_ciudadana solicitud = new Atencion_ciudadana();
            solicitud.IDOrigen = Convert.ToInt32(ddl_origen2.SelectedValue);
            solicitud.IDTipoSolicitud = Convert.ToInt32(ddl_TipoSol.SelectedValue);
            solicitud.Solicitud = txtSolicitud.Text.ToUpper();
            solicitud.Costo = Convert.ToDecimal(hdn_costo.Value);


            solicitud.IDMunicipio_Solicitud = Convert.ToInt32(ddl_mun_varios.SelectedValue);

            solicitud.IDParentesco = Convert.ToInt32(ddl_parentesco.SelectedValue);
            //Datos del Solicitante
            solicitud.CURP_Sol = txtCurp_sol.Text.ToUpper();
            solicitud.IDSeguridadSocial_Sol = Convert.ToInt32(ddl_seguridad_social_sol.SelectedValue);
            solicitud.FechaNac_Sol = Convert.ToDateTime(date_fecha_nac_sol.Text);

            solicitud.Telefono_Sol = txtTel_sol.Text.ToUpper();
            solicitud.Nombre_Sol = txtNombre_sol.Text.ToUpper();
            solicitud.PrimerApellido_Sol = txtPrimer_sol.Text.ToUpper();
            solicitud.SegundoApellido_Sol = txtSegun_sol.Text.ToUpper();
            solicitud.IDmunicipio_Sol = Convert.ToInt32(ddl_id_municipio_solicitante.SelectedValue);

            solicitud.Localidad_Sol = txtLocalidad_sol.Text.ToUpper();
            solicitud.CP_Sol = txtCP_sol.Text.ToUpper();
            solicitud.Colonia_Sol = txtColonia_sol.Text.ToUpper();
            solicitud.Calle_Sol = txtCalle_sol.Text.ToUpper();
            solicitud.Referencias_Sol = txtReferencias_sol.Text.ToUpper();
            //solicitud.Entre1_Sol = txtEntre_sol.Text;
            //solicitud.Entre2_Sol = txtEntre2_sol.Text;
            solicitud.NumInt_Sol = txtNumInt_sol.Text.ToUpper();
            solicitud.NumExt_Sol = txtNumExt_sol.Text.ToUpper();

            //Datos del Paciente
            solicitud.CURP_Pac = txtCurp_pac.Text.ToUpper();
            solicitud.IDSeguridadSocial_Pac = Convert.ToInt32(ddl_seguridad_social_pac.SelectedValue);
            solicitud.FechaNac_Pac = Convert.ToDateTime(date_fecha_nac_pac.Text);

            solicitud.Telefono_Pac = txtTel_pac.Text.ToUpper();
            solicitud.Nombre_Pac = txtNombre_pac.Text.ToUpper();
            solicitud.PrimerApellido_Pac = txtPrimer_pac.Text.ToUpper();
            solicitud.SegundoApellido_Pac = txtSegun_pac.Text.ToUpper();
            solicitud.IDmunicipio_Pac = Convert.ToInt32(ddl_Mun_pac.SelectedValue);

            solicitud.Localidad_Pac = txtLocalidad_pac.Text.ToUpper();
            solicitud.CP_Pac = txtCP_pac.Text.ToUpper();
            solicitud.Colonia_Pac = txtColonia_pac.Text.ToUpper();
            solicitud.Calle_Pac = txtCalle_pac.Text.ToUpper();
            solicitud.Referencias_Pac = txtReferencias_pac.Text.ToUpper();
            //solicitud.Entre1_Pac = txtEntre_pac.Text;
            //solicitud.Entre2_Pac = txtEntre2_pac.Text;
            solicitud.NumInt_Pac = txtNumInt_pac.Text.ToUpper();
            solicitud.NumExt_Pac = txtNumExt_pac.Text.ToUpper();

            solicitud.C000 = txtC00SAC.Text.ToUpper();
            solicitud.NOficio = txtnumero_OficioSAC.Text.ToUpper();
            solicitud.IDmunicipio_Sol = Convert.ToInt32(ddl_mun_varios.SelectedValue);
            solicitud.SAC = txtSAC.Text.ToUpper();
            solicitud.ID_PRESIDENTE_REPUBLICA = txtID_presidente_republica.Text.ToUpper();

            solicitud.Adscripcion = txtAdscripcion.Text.ToUpper();
            //var id_encrypt = cripto.Encrypt(distintivo.Grabar_Distintivo());
            //id_encrypt = id_encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");
            //Response.Redirect("gracias.aspx?id=" + id_encrypt);
            solicitud.Grabar_Solicitud();
            Response.Write("<script>alert('Grabado')</script>");
        }
        catch (Exception Ex)
        {
            ////lblError.Text = Ex.Message;
            ///
            lblError.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);
            //Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
        }




    }


    [System.Web.Services.WebMethod]
    public static string BuscarCURPlinea(string curp)
    {
        try
        {
            service.Url = Principal.WebConfig("ConsultaCURP.ws");//Establecer la URL del Web Service         
            string mensaje = service.BuscarCURP(curp, Principal.WebConfig("UsKeyAPI"), Principal.WebConfig("PassKeyAPI"));
            //    string mensaje = "";
            return mensaje;
        }
        catch (Exception ex) { return ex.Message; }
    }

    protected void grdBusqueda_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //Index del Row
            e.Row.Cells[5].Text = "$" + e.Row.Cells[5].Text; //Index del Row
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Visible = false; ///index
        }
    }

    //protected void btnModificarObservaciones_Click(object sender, EventArgs e)
    //{
    //    Button btnModificarObservaciones = (Button)sender; // Obtener el botón que se hizo clic
    //    string idSolicitud = btnModificarObservaciones.CommandArgument; // Obtener el ID de la solicitud

    //    // Redirige a una página o abre un formulario de edición de observaciones
    //    Response.Redirect("ModificarObservaciones.aspx?id=" + idSolicitud);

    //}


    protected void btnUpdateTrigger_Click(object sender, EventArgs e)
    {
        // Realiza tu lógica aquí si es necesario

        // Actualiza el UpdatePanel
        
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Connection = cnn;
            //cmd.CommandText = "bitaseg.proc_RptGsln";
            //cmd.Parameters.Add("@fecha1", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha1.Text);
            //cmd.Parameters.Add("@fecha2", SqlDbType.DateTime).Value = Convert.ToDateTime(Fecha2.Text);
            //var coord = DropDownList1.SelectedValue;
            //if (DropDownList1.SelectedValue == "-1") { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value =0; }
            //else { cmd.Parameters.Add("@coordinacion", SqlDbType.Int).Value = DropDownList1.SelectedValue; }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "sst_atn.buscador";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@origen", SqlDbType.Int).Value = Convert.ToInt32(ddl_origen_busqueda.SelectedValue);


            //        //    SqlDataReader dr = cmd.ExecuteReader();

            cmd.Connection = cnn;

            DataTable dtCAN = new DataTable();
            SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
            daCAN.Fill(dtCAN);
            grdBusqueda.DataSource = dtCAN;


            grdBusqueda.DataSource = dtCAN;
            //dtCAN.Rows.OfType<DataRow>().ToList().ForEach(f => f.SetField("monto", String.Concat("$", f["monto"])));
            grdBusqueda.ShowFooter = false;


            grdBusqueda.DataBind();
            cnn.Close(); // siempre cerrar conexiones.



        }

        catch (Exception Ex)
        {


            lblError.Text = Ex.Message;
        }

        upnlGridView.Update();
    }

    protected void btn_busqueda_Click(object sender, EventArgs e)
    {
        div_gridview.Visible = true;
        try
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = Principal.CnnStr0;
            cnn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "sst_atn.buscador";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@origen", SqlDbType.Int).Value = Convert.ToInt32(ddl_origen_busqueda.SelectedValue);
            cmd.Parameters.Add("@fecha_inicio", SqlDbType.DateTime).Value = Convert.ToDateTime(fecha_inicial.Text);
            cmd.Parameters.Add("@fecha_final", SqlDbType.DateTime).Value = Convert.ToDateTime(fecha_final.Text);
            cmd.Connection = cnn;

            DataTable dtCAN = new DataTable();
            SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
            daCAN.Fill(dtCAN);
            grdBusqueda.DataSource = dtCAN;
            grdBusqueda.DataSource = dtCAN;
            grdBusqueda.ShowFooter = false;
            grdBusqueda.DataBind();
            cnn.Close();
        }

        catch (Exception Ex)
        {


            lblError.Text = Ex.Message;
        }
    }
}