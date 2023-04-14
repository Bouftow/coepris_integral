using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Configuration;


public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);

        NombreDeCoordinacion.InnerText = "COORDINACIÓN NÚMERO " + usuarios.NumeroCoordinacion+ " : " + usuarios.NombreCoordinacion;
        //Response.Write("<script>alert('"+ usuarios.NombreCoordinacion +"') </script>");
    }
    protected void Selection_Change(Object sender, EventArgs e)
    {

        Fecha1.Text = "";
        foreach (DateTime day in Calendar1.SelectedDates)
        {
            Fecha1.Text = day.Date.ToString("yyyy-MM-dd");

        }
      
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString() == "87")
        {
            //NCord.InnerText = "Administrador";
        }
        else
        {
            //NCord.InnerText = DropDownList1.SelectedValue.ToString();
        }
    }



    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, new ListItem("Selecciona a una Persona", "-1"));
    }
}

