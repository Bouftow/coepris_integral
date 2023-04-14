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


        try
        {
            if (!Page.IsPostBack)
            {
                Usuarios user = new Usuarios(new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()));

                txtUserLogin.Text = user.UserLogin == "0" ? "" : user.UserLogin;
                idPersona.Value = user.IdPersona.ToString();
                lblNombrePersona.Text = String.Format("{0} {1} {2}", user.Nombre, user.Paterno, user.Materno);

                //Usuarios usuarios = new Usuarios();
                //usuarios.DatosDeRegistro(User.Identity.Name);

                LoadSubjects();

                ddlSubject.SelectedValue = user.NumeroCoordinacion.ToString();
                chkActivo.Checked = user.Activo;

                chkMensajes.Checked = user.Mensajes;

                //chkNotificaciones.Checked = user.ActivarNotificaciones;

                txtIniciales.Text = user.Iniciales;

                chk_administrar.Checked = user.Administrar_Distintivo;

                //chkADH_Reg.Checked = user.Registro;


                txtIniciales.Text = user.Iniciales;
                chk_reportes_distintivo.Checked = user.Reportes_Distintivo;
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = MessageStyles.Danger(ex.Message, true);
        }
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
                user.Administrar_Distintivo = chk_administrar.Checked;

                //user.Registro = chkADH_Reg.Checked;

                user.NumeroCoordinacion = Convert.ToInt32(ddlSubject.SelectedValue);

                user.Reportes_Distintivo = chk_reportes_distintivo.Checked;

                user.UserReg = User.Identity.Name;
                user.RemoteAddr = Request.ServerVariables["REMOTE_ADDR"].ToString();
                user.Sistema = "Distintivo";
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