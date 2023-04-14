using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
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
using System.Xml.Linq;
public partial class admin_usuario_item : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
      
        try {
            if (!Page.IsPostBack) {
                Usuarios user = new Usuarios(new EncryptDecrypt().Decrypt(Request.Params["id"]));
               
                txtUserLogin.Text = user.UserLogin == "0" ? "" : user.UserLogin;
                idPersona.Value = user.IdPersona.ToString();
                lblNombrePersona.Text = String.Format("{0} {1} {2}", user.Nombre, user.Paterno, user.Materno);



                LoadSubjects();

                ddlSubject.SelectedValue = user.NumeroCoordinacion.ToString();
                chkActivo.Checked = user.Activo;
              
                chkMensajes.Checked = user.Mensajes;
               
                //chkNotificaciones.Checked = user.ActivarNotificaciones;
               
                txtIniciales.Text = user.Iniciales;
             
                chkADH_Adm.Checked = user.Administrar;

                //chkADH_Reg.Checked = user.Registro;


                txtIniciales.Text = user.Iniciales;
                chk_uos.Checked = user.UOS;
                chk_dictaminador.Checked = user.DICTAMINADOR;
                chk_dds.Checked = user.DDS;
                chk_dos.Checked = user.DOS;
                chk_deas.Checked = user.DEAS;
                chk_das.Checked = user.DAS;
                chk_correspondencia.Checked = user.CORRESPONDENCIA;
                chk_coordinacion.Checked = user.COORDINACION;
                chk_cis.Checked = user.CIS;
                chk_ueas.Checked = user.UEAS;
                chk_oficom.Checked = user.OFICOM;

                chk_uos_sl.Checked = user.UOS_sl;
                chk_dictaminador_sl.Checked = user.DICTAMINADOR_sl;
                chk_dds_sl.Checked = user.DDS_sl;
                chk_dos_sl.Checked = user.DOS_sl;
                chk_deas_sl.Checked = user.DEAS_sl;
                chk_das_sl.Checked = user.DAS_sl;
                chk_correspondencia_sl.Checked = user.CORRESPONDENCIA_sl;
                chk_coordinacion_sl.Checked = user.COORDINACION_sl;
                chk_cis_sl.Checked = user.CIS_sl;
                chk_ueas_sl.Checked = user.UEAS_sl;
                chk_oficom_sl.Checked = user.OFICOM_sl;

                chk_monitoreo.Checked = user.MONITOREO;

                chk_rechazados.Checked = user.RECHAZADOS;
                chk_entregados.Checked = user.ENTREGADOS;
                chk_finalizados.Checked = user.FINALIZADOS;

                chk_bitacora.Checked = user.BITACORA;
                chk_captura.Checked = user.CAPTURA;
                chk_busqueda.Checked = user.BUSQUEDA;
                chk_solucionador.Checked = user.SOLUCIONAR;
                chk_requisitos.Checked = user.REQUISITOS;

                chk_monitoreo.Checked = user.MONITOREO;
                chk_oficom.Checked = user.OFICOM;
                chk_acver.Checked = user.ACVER;


            }
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message,true); }
    }
    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid) { 
        try
        {
            Usuarios user = new Usuarios(new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()));
            user.UserLogin = txtUserLogin.Text;
            user.IdPersona = Convert.ToInt32(idPersona.Value);
            user.Activo = chkActivo.Checked;
            user.Mensajes = chkMensajes.Checked;
            //user.ActivarNotificaciones = chkNotificaciones.Checked;

            user.Iniciales = txtIniciales.Text;
            //
            user.Administrar = chkADH_Adm.Checked;

                //user.Registro = chkADH_Reg.Checked;
               
            user.NumeroCoordinacion = Convert.ToInt32(ddlSubject.SelectedValue);

            user.UOS = chk_uos.Checked;
            user.DICTAMINADOR = chk_dictaminador.Checked;
            user.DDS = chk_dds.Checked;
            user.DOS = chk_dos.Checked;
            user.DEAS = chk_deas.Checked;
            user.DAS = chk_das.Checked;
            user.COORDINACION = chk_coordinacion.Checked;
            user.CORRESPONDENCIA = chk_correspondencia.Checked;
            user.CIS = chk_cis.Checked;
            user.UEAS = chk_ueas.Checked;

            user.UOS_sl = chk_uos_sl.Checked;
            user.DICTAMINADOR_sl = chk_dictaminador_sl.Checked;
            user.DDS_sl = chk_dds_sl.Checked;
            user.DOS_sl = chk_dos_sl.Checked;
            user.DEAS_sl = chk_deas_sl.Checked;
            user.DAS_sl = chk_das_sl.Checked;
            user.COORDINACION_sl = chk_coordinacion_sl.Checked;
            user.CORRESPONDENCIA_sl = chk_correspondencia_sl.Checked;
            user.CIS_sl = chk_cis_sl.Checked;
            user.UEAS_sl = chk_ueas_sl.Checked;

            user.RECHAZADOS = chk_rechazados.Checked;
            user.ENTREGADOS = chk_entregados.Checked;
            user.FINALIZADOS = chk_finalizados.Checked;


            user.BITACORA = chk_bitacora.Checked;
            user.CAPTURA = chk_captura.Checked;
            user.BUSQUEDA = chk_busqueda.Checked;
            user.SOLUCIONAR = chk_solucionador.Checked;
            user.REQUISITOS = chk_requisitos.Checked;

            user.MONITOREO = chk_monitoreo.Checked;
            user.OFICOM = chk_oficom.Checked;

            user.ACVER = chk_acver.Checked;

            user.UserReg = User.Identity.Name;
            user.RemoteAddr = Request.ServerVariables["REMOTE_ADDR"].ToString();
            user.Sistema = "Bitácora";
            if (user.Grabar())
            {
                Response.Redirect("usuario-lista.aspx");
            }
        }
        catch (Exception ex) { lblMessage.Text = MessageStyles.Danger(ex.Message, true); }

    }
    }
    protected void btnAbrirBuscarUsuario_Click(object sender, EventArgs e)
    {
        modalBuscarUsuario.Show();
    }
    protected void btnBuscarUsuarioCerrar0_Click(object sender, EventArgs e)
    {
        modalBuscarUsuario.Hide();
    }
    protected void btnModalBuscarUsuario_Click(object sender, EventArgs e)
    {
        try
        {
            Personas per = new Personas();
            per.Buscar(txtNombreUsuario.Text, User.Identity.Name, grdUsuarios);
            panelBuscarUsuario.Update();
        }
        catch (Exception ex) { lblMsgBuscarUsuario.Text = MessageStyles.Danger(ex.Message, true); panelBuscarUsuario.Update(); }
    }
    protected void grdUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "SeleccionarUsuario")
            {
                idPersona.Value = e.CommandArgument.ToString().Split('|')[0];
                lblNombrePersona.Text = e.CommandArgument.ToString().Split('|')[1];
                panelAbrirBuscar.Update();
                modalBuscarUsuario.Hide();
            }
        }
        catch (Exception ex) { lblMsgBuscarUsuario.Text = MessageStyles.Danger(ex.Message, true); panelBuscarUsuario.Update(); }
    }


    protected void ddlCoordinaciones_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void LoadSubjects()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);

        DataTable subjects = new DataTable();

        using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
        {

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT id_coordinacion, nombre_coordinacion FROM bitaseg.Coordinaciones", con);
                adapter.Fill(subjects);
                Usuarios user = new Usuarios(new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()));
               
                
                ddlSubject.DataSource = subjects;
                ddlSubject.DataTextField = "nombre_coordinacion";
                ddlSubject.DataValueField = "id_coordinacion";
                ddlSubject.DataBind();

            }
            catch (Exception ex)
            {
                // Handle the error
                lblMessage.Text = MessageStyles.Danger(ex.Message, true);
            }

        }

        // Add the initial item - you can add this even if the options from the
        // db were not successfully loaded
        ddlSubject.Items.Insert(0, new ListItem("Selecione Coordinación", "0"));

    }
}