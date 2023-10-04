using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class sistema_sst_Default : System.Web.UI.Page
{
   
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

            Ventanilla.Visible = false;
            todolodemas.Visible = false;
            //Acuerdos.Visible = false;
            //Atencion.Visible = false;
            //Particular.Visible = false;
            //DIF.Visible = false;
            //SEBIEN.Visible = false;
            //Presidencia.Visible = false;
            //Gestion.Visible = false;
            //Varios.Visible = false;

            string selectedItem = ddl_origen2.SelectedItem.Value;
            switch (selectedItem)
            {
                case "1":
                    Ventanilla.Visible = true;
                    todolodemas.Visible = false;
                    presidente_republica.Visible = false;
                    break;
                case "7":
                    Ventanilla.Visible = false;
                    todolodemas.Visible = true;
                    presidente_republica.Visible = true;
                    break;

                default:
                    Ventanilla.Visible = false;
                    todolodemas.Visible = false;
                    presidente_republica.Visible = false;
                    //Acuerdos.Visible = false;
                    //Atencion.Visible = false;
                    //Particular.Visible = false;
                    //DIF.Visible = false;
                    //SEBIEN.Visible = false;
                    //Presidencia.Visible = false;
                    //Gestion.Visible = false;
                    //Varios.Visible = false;
                    break;
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

        ListItem itemToDisable = ddl_origen2.Items.FindByValue("-1");
        itemToDisable.Enabled = false;
        DropDownList ddl = (DropDownList)sender;
        Control namingContainer = ddl.NamingContainer;
        HtmlGenericControl myDiv = (HtmlGenericControl)namingContainer.FindControl(ddl.SelectedValue);

       texto.InnerText=ddl_origen2.SelectedItem.Text;


        try
        {
            Ventanilla.Visible = false;
            todolodemas.Visible = false;
            //Acuerdos.Visible = false;
            //Atencion.Visible = false;
            //Particular.Visible = false;
            //DIF.Visible = false;
            //SEBIEN.Visible = false;
            //Presidencia.Visible = false;
            //Gestion.Visible = false;
            //IPSSSET.Visible = false;
            //Varios.Visible = false;

            string selectedItem = ddl_origen2.SelectedItem.Value;

            switch (selectedItem)
            {
                case "6":
                case "7":
                case "8":
                case "9":
                case "10":
                    hacer_insivisible_sac.Visible = false;
                    break;
                default:
                    hacer_insivisible_sac.Visible = true;
                    break;

            }
            switch (selectedItem)
            {
                case "1":
                    Ventanilla.Visible = true;
                    break;
                case "7":
                    Ventanilla.Visible = false;
                    todolodemas.Visible = true;
                    presidente_republica.Visible = true;
                    desaparecer_origen_varios.Visible = false;
                    break;
                case "10":
                    Ventanilla.Visible = false;
                    todolodemas.Visible = true;
                    desaparecer_origen_varios.Visible = true;
                    presidente_republica.Visible = false;
                    break;
                default:
                    Ventanilla.Visible = false;
                    todolodemas.Visible = true;
                    presidente_republica.Visible = false;
                    desaparecer_origen_varios.Visible = false;
                    //Acuerdos.Visible = false;
                    //Atencion.Visible = false;
                    //Particular.Visible = false;
                    //DIF.Visible = false;
                    //SEBIEN.Visible = false;
                    //Presidencia.Visible = false;
                    //Gestion.Visible = false;
                    //Varios.Visible = false;
                    break;
            }

            if (myDiv != null)
            {
                myDiv.Visible = true;
            }
            else
            {
                //lblError.Text = "El FindControl regresa un valor Null";
            }


          
            //Response.Write("<script>alert('"+ myDiv.InnerText+"')</script>");
        }
        catch (Exception ex)
        {
            // Handle the exception
            lblError.Text = "Ha ocurrido un error: " + ex.Message;
        }
    }

    protected void Button_Click(object sender, EventArgs e)
    {
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
            cmd.Parameters.Add("@nombre_buscar", SqlDbType.NVarChar, 50).Value = "";
            cmd.Parameters.Add("@user_login", SqlDbType.NVarChar, 50).Value = "";

         
            //        //    SqlDataReader dr = cmd.ExecuteReader();

            cmd.Connection = cnn;

                DataTable dtCAN = new DataTable();
                SqlDataAdapter daCAN = new SqlDataAdapter(cmd);
                daCAN.Fill(dtCAN);
                grdCancelados.DataSource = dtCAN;
             
              
                grdCancelados.DataSource = dtCAN;
                //dtCAN.Rows.OfType<DataRow>().ToList().ForEach(f => f.SetField("monto", String.Concat("$", f["monto"])));
                grdCancelados.ShowFooter = false;
              

                grdCancelados.DataBind();
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


            string selectedItem = ddl_origen2.SelectedItem.Value;
            switch (selectedItem)
            {
                case "1":
                    //Datos de la solicitud
                    solicitud.IDOrigen = Convert.ToInt32(ddl_origen2.SelectedValue);
                    solicitud.IDTipoSolicitud = Convert.ToInt32(ddl_TipoSol.SelectedValue);
                    solicitud.Solicitud = txtSolicitud.Text;
                    solicitud.Costo = Convert.ToDecimal(hdn_costo.Value);
                    

                    solicitud.IDMunicipio_Solicitud = Convert.ToInt32(ddl_id_municipio_solicitud.SelectedValue);

                    solicitud.IDParentesco = Convert.ToInt32(ddl_parentesco.SelectedValue);
                    //Datos del Solicitante
                    solicitud.CURP_Sol = txtCurp_sol.Text;
                    solicitud.IDSeguridadSocial_Sol = Convert.ToInt32(ddl_seguridad_social_sol.SelectedValue);
                    solicitud.FechaNac_Sol = Convert.ToDateTime(date_fecha_nac_sol.Text);

                    solicitud.Telefono_Sol = txtTel_sol.Text;
                    solicitud.Nombre_Sol = txtNombre_sol.Text;
                    solicitud.PrimerApellido_Sol = txtPrimer_sol.Text;
                    solicitud.SegundoApellido_Sol = txtSegun_sol.Text;
                    solicitud.IDmunicipio_Sol = Convert.ToInt32(ddl_Mun_sol.SelectedValue);

                    solicitud.Localidad_Sol = txtLocalidad_sol.Text;
                    solicitud.CP_Sol = txtCP_sol.Text;
                    solicitud.Colonia_Sol = txtColonia_sol.Text;
                    solicitud.Calle_Sol = txtCalle_sol.Text;
                    solicitud.Referencias_Sol = txtReferencias_sol.Text;
                    //solicitud.Entre1_Sol = txtEntre_sol.Text;
                    //solicitud.Entre2_Sol = txtEntre2_sol.Text;
                    solicitud.NumInt_Sol = txtNumInt_sol.Text;
                    solicitud.NumExt_Sol = txtNumExt_sol.Text;

                    //Datos del Paciente
                    solicitud.CURP_Pac = txtCurp_pac.Text;
                    solicitud.IDSeguridadSocial_Pac = Convert.ToInt32(ddl_seguridad_social_pac.SelectedValue);
                    solicitud.FechaNac_Pac = Convert.ToDateTime(date_fecha_nac_pac.Text);

                    solicitud.Telefono_Pac = txtTel_pac.Text;
                    solicitud.Nombre_Pac = txtNombre_pac.Text;
                    solicitud.PrimerApellido_Pac = txtPrimer_pac.Text;
                    solicitud.SegundoApellido_Pac = txtSegun_pac.Text;
                    solicitud.IDmunicipio_Pac = Convert.ToInt32(ddl_Mun_pac.SelectedValue);

                    solicitud.Localidad_Pac = txtLocalidad_pac.Text;
                    solicitud.CP_Pac = txtCP_pac.Text;
                    solicitud.Colonia_Pac = txtColonia_pac.Text;
                    solicitud.Calle_Pac = txtCalle_pac.Text;
                    solicitud.Referencias_Pac = txtReferencias_pac.Text;
                    //solicitud.Entre1_Pac = txtEntre_pac.Text;
                    //solicitud.Entre2_Pac = txtEntre2_pac.Text;
                    solicitud.NumInt_Pac = txtNumInt_pac.Text;
                    solicitud.NumExt_Pac = txtNumExt_pac.Text;


                    break;
                //case "Acuerdos":
                //    break;
                //case "Atencion":
                //    break;
                //case "Particular":
                //    break;
                //case "DIF":
                //    break;
                //case "SEBIEN":
                //    break;
                //case "Presidencia":
                //    break;
                //case "Gestion":
                //    break;
                //case "IPSSSET":
                //    break;
                //case "Varios":
                //    break;
                default:
                    solicitud.C000 = txtC00SAC.Text;
                    solicitud.NOficio = txtnumero_OficioSAC.Text;
                    solicitud.IDmunicipio_Sol = Convert.ToInt32(ddl_mun_varios.SelectedValue);
                    solicitud.SAC = txtSAC.Text;
                    solicitud.ID_PRESIDENTE_REPUBLICA = txtID_presidente_republica.Text;

                    //solicitud.CURP_Extra = txtCurp_Extra.Text;
                    //solicitud.Nombre_Extra = txtNombre_Extra.Text;
                    //solicitud.PrimerApellido_Extra = txtPrimerApellido_Extra.Text;
                    //solicitud.SegundoApellido_Extra = txtSegundoApellido_Extra.Text;


                    break;
            }        //1	Receptoría/Ventanilla
                     //2	Acuerdos del C.Gobernador del Estado
                     //3	Atención Ciudadana del C.Gobernador CAC
                     //4	Secretaría Particular de Gobierno
                     //5	Sistema DIF Tamaulipas
                     //6	SEBIEN
                     //7	Presidencia de la República
                     //8	Gestión Parlamentaria
                     //9	IPSSSET
                     //10 Varios

            switch (selectedItem)
            {
                case "1":
                    solicitud.IDOrigen = 1;
                    break;
                case "2":
                    solicitud.IDOrigen = 2;
                    break;
                case "3":
                    solicitud.IDOrigen = 3;
                    break;
                case "4":
                    solicitud.IDOrigen = 4;
                    break;
                case "5":
                    solicitud.IDOrigen = 5;
                    break;
                case "6":
                    solicitud.IDOrigen = 6;
                    break;
                case "7":
                    solicitud.IDOrigen = 7;
                    break;
                case "8":
                    solicitud.IDOrigen = 8;
                    break;
                case "9":
                    solicitud.IDOrigen = 9;
                    break;
                case "10":
                    solicitud.IDOrigen = 100;
                    break;
                default:
                    solicitud.IDOrigen = 0;
                    break;
            }

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

    protected void ddl_origen_reportes_SelectedIndexChanged(object sender, EventArgs e){}
    protected void ddl_origen_busqueda_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    static ConsultaCURP.ws service = new ConsultaCURP.ws();

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
}
