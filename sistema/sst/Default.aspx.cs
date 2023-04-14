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

        

        if (!IsPostBack)
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
            //Varios.Visible = false;

            string selectedItem = ddl_solicitud.SelectedItem.Value;
            switch (selectedItem)
            {
                case "Ventanilla":
                    Ventanilla.Visible = true;
                    todolodemas.Visible = false;
                    break;
                //case "Acuerdos":
                //    Acuerdos.Visible = true;
                //    break;
                //case "Atencion":
                //    Atencion.Visible = true;
                //    break;
                //case "Particular":
                //    Particular.Visible = true;
                //    break;
                //case "DIF":
                //    DIF.Visible = true;
                //    break;
                //case "SEBIEN":
                //    SEBIEN.Visible = true;
                //    break;
                //case "Presidencia":
                //    Presidencia.Visible = true;
                //    break;
                //case "Gestion":
                //    Gestion.Visible = true;
                //    break;
                //case "Varios":
                //    Varios.Visible = true;
                //    break;
                default:
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
                    break;
            }
        }

        
        
    }

    protected void ddl_solicitud_SelectedIndexChanged(object sender, EventArgs e)
    {

        ListItem itemToDisable = ddl_solicitud.Items.FindByValue("-1");
        itemToDisable.Enabled = false;
        DropDownList ddl = (DropDownList)sender;
        Control namingContainer = ddl.NamingContainer;
        HtmlGenericControl myDiv = (HtmlGenericControl)namingContainer.FindControl(ddl.SelectedValue);

       texto.InnerText=ddl_solicitud.SelectedItem.Text;


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
            //Varios.Visible = false;

            string selectedItem = ddl_solicitud.SelectedItem.Value;

            switch (selectedItem)
            {
                case "SEBIEN":
                case "Presidencia" :
                case "Gestion":
                case "Varios":
                    hacer_insivisible_sac.Visible = false;
                    break;
                default:
                    hacer_insivisible_sac.Visible = true;
                    break;

            }
            switch (selectedItem)
            {
                case "Ventanilla":
                    Ventanilla.Visible = true;
                    break;
                //case "Acuerdos":
                //    Acuerdos.Visible = true;
                //    break;
                //case "Atencion":
                //    Atencion.Visible = true;
                //    break;
                //case "Particular":
                //    Particular.Visible = true;
                //    break;
                //case "DIF":
                //    DIF.Visible = true;
                //    break;
                //case "SEBIEN":
                //    SEBIEN.Visible = true;
                //    break;
                //case "Presidencia":
                //    Presidencia.Visible = true;
                //    break;
                //case "Gestion":
                //    Gestion.Visible = true;
                //    break;
                //case "Varios":
                //    Varios.Visible = true;
                //    break;
                default:
                    Ventanilla.Visible = false;
                    todolodemas.Visible = true;
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
                cmd.CommandText = "select * from sst_atn.solicitudes S inner join sst_atn.personas P on S.id_persona = P.id_persona";
            //cmd.CommandText = "select *, s.fecha_reg as fecha_reg_s, p.fecha_reg as fecha_reg_p from sst_atn.solicitudes S inner join sst_atn.personas P on S.id_persona = P.id_persona";

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



}