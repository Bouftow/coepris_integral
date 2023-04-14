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
          

            eta.Attributes.Add("type", "time");
            FechaActual.Attributes.Add("type", "date");
            FechaOrden.Attributes.Add("type", "date");
            telefono.Attributes.Add("type", "tel");
            Correo.Attributes.Add("type", "email");
            fax.Attributes.Add("type", "tel");
            inicio.Attributes.Add("type", "time");
            fin.Attributes.Add("type", "time");
            tot_empleados.Attributes.Add("type", "number");
            serv_empleados.Attributes.Add("type", "number");
        }
    }


   
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (DropDownList2.SelectedValue == "-1")
        {
            //DropDownList3.Items.Insert(0, new ListItem("Campo Automático...", "-1"));
            //DropDownList4.Items.Insert(0, new ListItem("...", "-1"));


        }
        else
        {
            DropDownList3.SelectedValue = (DropDownList2.SelectedIndex).ToString();
            DropDownList4.SelectedValue = (DropDownList2.SelectedIndex).ToString();
            //DropDownList6.SelectedValue = (DropDownList5.SelectedIndex).ToString();
            //DropDownList7.SelectedValue = (DropDownList5.SelectedIndex).ToString();
            autvisited.Text = visted.Text;
        }
        //Response.Write("<script>alert('" + DropDownList2.SelectedIndex.ToString() + "')</script>");
       
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        
            if (DropDownList2.SelectedValue == "-1")
            {



            }
            else
            {
                autvisited.Text = visted.Text;
                DropDownList3.SelectedValue = (DropDownList2.SelectedIndex).ToString();
                DropDownList4.SelectedValue = (DropDownList2.SelectedIndex).ToString();
            }
        //DropDownList6.SelectedValue = (DropDownList5.SelectedIndex).ToString();
        //DropDownList7.SelectedValue = (DropDownList5.SelectedIndex).ToString();

        SqlConnection cna = new SqlConnection();
        cna.ConnectionString = Principal.CnnStr0;
        cna.Open();
        //SqlCommand cmda = new SqlCommand(" Insert Into bitaseg.imgchar (folio) values ('" + folio.Text + "')");
        SqlCommand cma = new SqlCommand("");

        cma.Connection = cna;
        cma.ExecuteNonQuery();
        cna.Close();
    }



    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("Seleccionar Opcion...", "-1"));
      
        //DropDownList4.SelectedIndex = -1;
        //DropDownList3.SelectedIndex = -1;
    }
    protected void DropDownList3_DataBound(object sender, EventArgs e)
    {
        DropDownList3.Items.Insert(0, new ListItem("Campo Automático...", "-1"));

        //DropDownList4.SelectedIndex = -1;
        //DropDownList3.SelectedIndex = -1;
    }
    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList4.Items.Insert(0, new ListItem("...", "-1"));

        //DropDownList4.SelectedIndex = -1;
        //DropDownList3.SelectedIndex = -1;
    }

}