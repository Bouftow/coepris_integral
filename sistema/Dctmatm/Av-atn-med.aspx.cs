﻿using System;
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


   
}