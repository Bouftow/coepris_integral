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

            DropDownList1.SelectedValue = "8";
            //eta.Attributes.Add("type", "time");
            //FechaActual.Attributes.Add("type", "date");
            //FechaOrden.Attributes.Add("type", "date");
            //telefono.Attributes.Add("type", "tel");
            //Correo.Attributes.Add("type", "email");
            //fax.Attributes.Add("type", "tel");
            //inicio.Attributes.Add("type", "time");
            //fin.Attributes.Add("type", "time");
            //tot_empleados.Attributes.Add("type", "number");
            //serv_empleados.Attributes.Add("type", "number");
        }
    }



    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    if (DropDownList2.SelectedValue == "-1")
    //    {
    //        //DropDownList3.Items.Insert(0, new ListItem("Campo Automático...", "-1"));
    //        //DropDownList4.Items.Insert(0, new ListItem("...", "-1"));


    //    }
    //    else
    //    {
    //        DropDownList3.SelectedValue = (DropDownList2.SelectedIndex).ToString();
    //        DropDownList4.SelectedValue = (DropDownList2.SelectedIndex).ToString();
    //        //DropDownList6.SelectedValue = (DropDownList5.SelectedIndex).ToString();
    //        //DropDownList7.SelectedValue = (DropDownList5.SelectedIndex).ToString();
    //        autvisited.Text = visited.Text;
    //    }
    //    //Response.Write("<script>alert('" + DropDownList2.SelectedIndex.ToString() + "')</script>");

    //}


    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //    if (DropDownList2.SelectedValue == "-1")
    //    {



    //    }
    //    else {
    //        autvisited.Text = visited.Text;
    //        DropDownList3.SelectedValue = (DropDownList2.SelectedIndex).ToString();
    //        DropDownList4.SelectedValue = (DropDownList2.SelectedIndex).ToString();
    //    }

    //    try
    //    {
    //        SqlConnection cna = new SqlConnection();
    //        cna.ConnectionString = Principal.CnnStr0;
    //        cna.Open();

    //        var hora_ver = eta.Text + ' ' + FechaActual.Value;
    //        var folio = Folio.Value;
    //        var fecha_or = FechaOrden.Value;
    //        var Vis = visited.Text;
    //        var dom_usr = USRdomicilio.Value;
    //        var Tes1 = Testigo1.Value;
    //        var Dom_Tes1 = TES1domicilio.Value;
    //        var Tes2 = Testigo2.Value;
    //        var Dom_Tes2 = TES2domicilio.Value;


    //        SqlCommand cma = new SqlCommand("Insert Into dctm.Actas (Municipio, HoraFecha_ver, Folio_ver, Fecha_emi, Visitado, Identificacion, Domicilio, Cargo, Visitado_t1, Identificacion_t1, Domicilio_t1, Visitado_t2, Identificacion_t2, Domicilio_t2, id_coordinador)" +
    //                    "values(@Municipio, @HoraFecha_ver, @Folio_ver, @Fecha_emi, @Visitado, @Identificacion, @Domicilio, @Cargo, @Visitado_t1, @Identificacion_t1, @Domicilio_t1, @Visitado_t2, @Identificacion_t2, @Domicilio_t2, @id_coordinador) ");

    //        cma.Parameters.Add("@Municipio", SqlDbType.VarChar, 50).Value = DropDownList1.SelectedValue.ToString();
    //        cma.Parameters.Add("@HoraFecha_ver", SqlDbType.DateTime).Value = hora_ver;
    //        cma.Parameters.Add("@Folio_ver", SqlDbType.VarChar, 50).Value = folio;
    //        cma.Parameters.Add("@Fecha_emi", SqlDbType.DateTime).Value = fecha_or;
    //        cma.Parameters.Add("@Visitado", SqlDbType.VarChar, 50).Value = Vis;
    //        cma.Parameters.Add("@Identificacion", SqlDbType.VarChar, 50).Value = IDUSR.SelectedIndex.ToString();
    //        cma.Parameters.Add("@Domicilio", SqlDbType.VarChar, 50).Value = dom_usr;
    //        cma.Parameters.Add("@Cargo", SqlDbType.VarChar, 50).Value = CargoUSR.SelectedIndex.ToString() ;
    //        cma.Parameters.Add("@Visitado_t1", SqlDbType.VarChar, 50).Value = Tes1;
    //        cma.Parameters.Add("@Identificacion_t1", SqlDbType.VarChar, 50).Value = ID1.SelectedIndex.ToString();
    //        cma.Parameters.Add("@Domicilio_t1", SqlDbType.VarChar, 50).Value = Dom_Tes1;
    //        cma.Parameters.Add("@Visitado_t2", SqlDbType.VarChar, 50).Value = Tes2;
    //        cma.Parameters.Add("@Identificacion_t2", SqlDbType.VarChar, 50).Value = ID2.SelectedIndex.ToString();
    //        cma.Parameters.Add("@Domicilio_t2", SqlDbType.VarChar, 50).Value = Dom_Tes2;
    //        cma.Parameters.Add("@id_coordinador", SqlDbType.VarChar, 50).Value = DropDownList2.SelectedValue.ToString();

    //        cma.Connection = cna;
    //        cma.ExecuteNonQuery();
    //        cna.Close();

    //        Response.Write("<script>alert('" + hora_ver +"')</script>");


    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write("<script>alert('" + Ex.Message + "')</script>");
    //    }
    //    //DropDownList6.SelectedValue = (DropDownList5.SelectedIndex).ToString();
    //    //DropDownList7.SelectedValue = (DropDownList5.SelectedIndex).ToString();
    //}



    //protected void DropDownList2_DataBound(object sender, EventArgs e)
    //{
    //    DropDownList2.Items.Insert(0, new ListItem("Seleccionar Opcion...", "-1"));

    //    //DropDownList4.SelectedIndex = -1;
    //    //DropDownList3.SelectedIndex = -1;
    //}
    //protected void DropDownList3_DataBound(object sender, EventArgs e)
    //{
    //    DropDownList3.Items.Insert(0, new ListItem("Campo Automático...", "-1"));

    //    //DropDownList4.SelectedIndex = -1;
    //    //DropDownList3.SelectedIndex = -1;
    //}
    //protected void DropDownList4_DataBound(object sender, EventArgs e)
    //{
    //    DropDownList4.Items.Insert(0, new ListItem("...", "-1"));

    //    //DropDownList4.SelectedIndex = -1;
    //    //DropDownList3.SelectedIndex = -1;
    //}
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string mun = "";
        switch (Convert.ToInt32(DropDownList1.SelectedValue))
        {
            case 1:
                mun = "C1_vic.aspx";
                break;
            case 2:
                mun = "C2_tam.aspx";
                break;
            case 3:
                mun = "C3_mat.aspx";
                break;
            case 4:
                mun = "C4_rey.aspx";
                break;
            case 5:
                mun = "C5_nvoldo.aspx";
                break;
            case 6:
                mun = "C6_man.aspx";
                break;
            case 7:
                mun = "C7_sanfer.aspx";
                break;
            case 8:
                mun = "C8_jve.aspx";
                break;
            case 9:
                mun = "C9_malm.aspx";
                break;
            case 10:
                mun = "C10_vher.aspx";
                break;
            case 11:
                mun = "C11_pad.aspx";
                break;
            case 12:
                mun = "C12_alt.aspx";
                break;
            default:
                break;
        }
        Response.Redirect(Page.ResolveClientUrl("~/inf_fune/" + mun));
    }
}