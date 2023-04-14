﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class _default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
      


        try
        {
            if (!Page.IsPostBack)
            {


                Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]));
                txtCurp.Text = tramite.Curp;
                txtNombre.Text = tramite.Nombre;
                txtApellidop.Text = tramite.Apellidop;
                txtApellidom.Text = tramite.Apellidom;
                txtTelfij.Text = tramite.Telfij;
                txtTelmov.Text = tramite.Telmov;
                txtCorreo.Text = tramite.Correo;
                txtRfc.Text = tramite.Rfc;
                txtNombreest.Text = tramite.Nombreest;
                txtMunicipio.Text = tramite.Municipio;
                txtColonia.Text = tramite.Colonia;
                txtCalle.Text = tramite.Calle;
                txtRazonsocial.Text = tramite.Razonsocial;
                txtRui.Text = tramite.Rui;

                riesgo.Text = tramite.Riesgo.ToString();
                verificacion.Text = tramite.Verificacion.ToString();
                modalidad.Text = tramite.Modalidad.ToString();
                id_tramite.Text = tramite.IdTramite.ToString();
                statos.Text = tramite.Statos.ToString();
                certificado_anterior.Text = tramite.CertificadoAnterior.ToString();



                SqlConnection cnn = new SqlConnection();
                cnn.ConnectionString = Principal.CnnStr0;
                cnn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.Add("@rfolio", SqlDbType.Int).Value = tramite.Folio;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cnn;
                cmd.CommandText = "bitaseg.proc_CargarNombretramite";
                DataTable dte = new DataTable();
                SqlDataAdapter de = new SqlDataAdapter(cmd);
                de.Fill(dte);
                grdNombreTramite.DataSource = dte;
                grdNombreTramite.DataBind();

                cnn.Close();


                if (riesgo.Text == "1")
                {
                    if (statos.Text == "28")
                    {

                        btnAprobado29.Visible = true;
                        btnAprobado30.Visible = false;
                        btnAprobado31.Visible = false;


                    }
                    else
                    {

                        if (statos.Text == "29" || statos.Text == "30")
                        {

                            btnAprobado29.Visible = false;
                            btnAprobado30.Visible = true;
                            btnAprobado31.Visible = true;


                        }

                        else
                        {


                            btnAprobado29.Visible = false;
                            btnAprobado30.Visible = false;
                            btnAprobado31.Visible = false;



                        }
                    }
                }

                else
                {



                    if (riesgo.Text == "2")
                    {

                        if (statos.Text == "1024" || statos.Text == "1025" || statos.Text == "1026")
                        {
                            if (statos.Text == "1024")
                            {

                                btnAprobado29.Visible = true;
                                btnAprobado30.Visible = false;
                                btnAprobado31.Visible = false;

                            }
                            if (statos.Text == "1025" || statos.Text == "1026")
                            {

                                btnAprobado29.Visible = false;
                                btnAprobado30.Visible = true;
                                btnAprobado31.Visible = true;

                            }



                        }
                        else
                        {
                            btnAprobado29.Visible = false;
                            btnAprobado30.Visible = false;
                            btnAprobado31.Visible = false;
                        }


                    }


                    else
                    {

                        btnAprobado29.Visible = false;
                        btnAprobado30.Visible = false;
                        btnAprobado31.Visible = false;


                    }
                }



                int startIndex = 2;
                int length = 1;
                string substring1 = tramite.Requerimientos.Substring(startIndex, length);

                int startIndex2 = 6;
                int length2 = 1;
                string substring2 = tramite.Requerimientos.Substring(startIndex2, length2);

                int startIndex3 = 10;
                int length3 = 1;
                string substring3 = tramite.Requerimientos.Substring(startIndex3, length3);

                int startIndex4 = 14;
                int length4 = 1;
                string substring4 = tramite.Requerimientos.Substring(startIndex4, length4);

                int startIndex5 = 18;
                int length5 = 1;
                string substring5 = tramite.Requerimientos.Substring(startIndex5, length5);

                int startIndex6 = 22;
                int length6 = 1;
                string substring6 = tramite.Requerimientos.Substring(startIndex6, length6);

                int startIndex7 = 26;
                int length7 = 1;
                string substring7 = tramite.Requerimientos.Substring(startIndex7, length7);

                int startIndex8 = 30;
                int length8 = 1;
                string substring8 = tramite.Requerimientos.Substring(startIndex8, length8);

                int startIndex9 = 34;
                int length9 = 1;
                string substring9 = tramite.Requerimientos.Substring(startIndex9, length9);

                int startIndex10 = 39;
                int length10 = 1;
                string substring10 = tramite.Requerimientos.Substring(startIndex10, length10);

                int startIndex11 = 44;
                int length11 = 1;
                string substring11 = tramite.Requerimientos.Substring(startIndex11, length11);

                int startIndex12 = 49;
                int length12 = 1;
                string substring12 = tramite.Requerimientos.Substring(startIndex12, length12);

                int startIndex13 = 54;
                int length13 = 1;
                string substring13 = tramite.Requerimientos.Substring(startIndex13, length13);



                btnAprobado30.Visible = false;
            }
        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
        }
    }


    protected void btnAprobado_Click(object sender, EventArgs e)
    {
        try
        {
            int a = 0;
            if (riesgo.Text == "1")
            {


                if (statos.Text == "30" || statos.Text =="29")
                {

                    a = 31;
                }
            }


            if (riesgo.Text == "2")
            {


                if (statos.Text == "1026" || statos.Text == "1025")
                {

                    a = 1027;
                }
            }





            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
            {


                Curp = txtCurp.Text.ToUpper(),
                Nombre = txtNombre.Text.ToUpper(),
                Apellidop = txtApellidop.Text.ToUpper(),
                Apellidom = txtApellidom.Text.ToUpper(),
                Telfij = txtTelfij.Text.ToUpper(),
                Telmov = txtTelmov.Text.ToUpper(),
                Correo = txtCorreo.Text.ToUpper(),
                Rfc = txtRfc.Text.ToUpper(),
                Nombreest = txtNombreest.Text.ToUpper(),
                Municipio = txtMunicipio.Text.ToUpper(),
                Colonia = txtColonia.Text.ToUpper(),
                Calle = txtCalle.Text.ToUpper(),
                Rui = txtRui.Text.ToUpper(),
                CertificadoAnterior = certificado_anterior.Text.ToUpper(),
                Statos = a,
                Entregado = DateTime.Now.ToString(),

            };




            if (tramite.Staus_tram())
            { Response.Redirect("lcis.aspx"); }
        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
        }
    }
    protected void btnPrevision_Click(object sender, EventArgs e)
    {
        try
        {

            int a = 0;

            if (riesgo.Text == "1")
            {


                if (statos.Text == "28")
                {

                    a = 29;
                }
                if (statos.Text == "29" || statos.Text == "30")
                {

                    a = 30;
                }
            }


            if (riesgo.Text == "2")
            {


                if (statos.Text == "1024")
                {

                    a = 1025;
                }

                if (statos.Text == "1025" || statos.Text == "1026")
                {

                    a = 1026;
                }


            }


            Tramites tramite = new Tramites(Convert.ToInt32(Request.Params["id"]))
            {


                Curp = txtCurp.Text.ToUpper(),
                Nombre = txtNombre.Text.ToUpper(),
                Apellidop = txtApellidop.Text.ToUpper(),
                Apellidom = txtApellidom.Text.ToUpper(),
                Telfij = txtTelfij.Text.ToUpper(),
                Telmov = txtTelmov.Text.ToUpper(),
                Correo = txtCorreo.Text.ToUpper(),
                Rfc = txtRfc.Text.ToUpper(),
                Nombreest = txtNombreest.Text.ToUpper(),
                Municipio = txtMunicipio.Text.ToUpper(),
                Colonia = txtColonia.Text.ToUpper(),
                Calle = txtCalle.Text.ToUpper(),
                Rui = txtRui.Text.ToUpper(),
                CertificadoAnterior = certificado_anterior.Text.ToUpper(),
                Statos = a,

            };




            if (tramite.Staus_tram())
            { Response.Redirect("lcis.aspx"); }
        }
        catch (Exception Ex)
        {
            LblMsg.Text = Ex.Message;
        }
    }


    protected void grdNombreTramite_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Create an instance of the datarow
            DataRowView rowData = (DataRowView)e.Row.DataItem;
            //use this object to test data to make decisions
            string myColumnId = (rowData["modalidad"].ToString());
            e.Row.Cells[1].Font.Bold = true;
            e.Row.Cells[2].Font.Bold = true;
            e.Row.Cells[0].Font.Bold = true;
            e.Row.Cells[2].ForeColor = Color.Black;
            // Response.Write("<script>alert('Jaja " + myColumnId + "') </script>");

        }



    }
}