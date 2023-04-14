using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
using System.Linq;
using System.Xml.Linq;
public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (categoria.Value)
        {

            case "1":
                //aut.Visible = true;
                //lic.Visible = false;

                aut.Visible = true;
                lic.Visible = true;
                break;
            case "3":
                //aut.Visible = false;
                //lic.Visible = true;
                aut.Visible = true;
                lic.Visible = true;
                break;
            case "5":
                aut.Visible = true;
                lic.Visible = true;
                break;

            default:
                aut.Visible = false;
                lic.Visible = false;
                break;

        }
        if (riesgo.Text == "1")
        {
            txtRiesgo.Text = "Bajo Riesgo";
        }
        else { txtRiesgo.Text = "Alto Riesgo"; }
        if (!Page.IsPostBack)
        {
  
            CategoriasTramitesDropDownList();
            categoriareal.Text = categoria.Value;

        }
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        SqlConnection cnn = new SqlConnection();
    //        cnn.ConnectionString = Principal.CnnStr0;
    //        cnn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.CommandText = "UPDATE bitaseg.Lista_Tramites2" +
    //            //"SET" +
    //            //"sollicsan = ('" + chksollicsan.Checked.ToString() + "')," +
    //            //"solicitud =('" + solicitud.Text + "')," +
    //            //"titulo = ('" + titulo.Text + "')," +
    //            //"cedula = ('" + cedula.Text + "')," +
    //            //"diploma = ('" + diploma.Text + "')," +
    //            //"curriculum = ('" + curriculum.Text + "')," +
    //            //"fotografias =('" + fotografias.Text + "')," +
    //            //"pagoresponsable= ('" + pagoresponsable.Text + "')," +
    //            //"altasat= ('" + altasat.Text + "')," +
    //            //"planomemoria = ('" + planomemoria.Text + "')," +
    //            //"relacionmaterial = ('" + relacionmaterial.Text + "')," +
    //            //"pago = ('" + pago.Text + "')," +
    //            //"programaact = ('" + programaact.Text + "')," +
    //            //"fotocopiaconvenio = ('" + fotocopiaconvenio.Text + "')," +
    //            //"libroregistro = ('" + libroregistro.Text + "')," +
    //            //"descripciontecnicaembal = ('" + descripciontecnicaembal.Text + "')," +
    //            //"tarjetadecontrol = ('" + tarjetadecontrol.Text + "')," +
    //            //"cartaconsentimiento = ('" + cartaconsentimiento.Text + "')," +
    //            //"actaconstitutiva = ('" + actaconstitutiva.Text + "')," +
    //            //"reglamentointerno = ('" + reglamentointerno.Text + "')," +
    //            //"vistoproteccioncivil = ('" + vistoproteccioncivil.Text + "')," +
    //            //"relacionpersonal = ('" + relacionpersonal.Text + "')," +
    //            //"autorizaciondif = ('" + autorizaciondif.Text + "')," +
    //            //"cedulaautoevaluacion = ('" + cedulaautoevaluacion.Text + "')," +
    //            //"papelmembretado = ('" + papelmembretado.Text + "')," +
    //            //"autorizacionset =('" + autorizacionset.Text + "')," +
    //            //"usodesuelo = ('" + usodesuelo.Text + "')," +
    //            //"procesolimpieza = ('" + procesolimpieza.Text + "')," +
    //            //"relaciontipoanalisis = ('" + relaciontipoanalisis.Text + "')," +
    //            //"actaverificacion = ('" + actaverificacion.Text + "')," +
    //            //"where id_tramite =('" + id_tramite.Text + "')";

    //        cnn.Close(); // siempre cerrar conexiones.




    //        Response.Write("<script>alert('Datos modificados Correctamente');</script>");



    //    }

    //    catch (Exception Ex)
    //    {
    //        ////Lblmsg.Text = Ex.Message;
    //        ///
    //        Lblmsg.Text = Ex.Message;
    //        Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
    //    }

    //}


    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (chksollicsan.Checked == true){sollicsan.Text = "1";} else { sollicsan.Text = "0"; }
        if (chksolicitud.Checked == true){solicitud.Text = "1";} else { solicitud.Text = "0"; }
        if (chktitulo.Checked == true) { titulo.Text = "1"; } else { titulo.Text = "0"; }
        if (chkcedula.Checked == true) { cedula.Text = "1"; } else { cedula.Text = "0"; }
        if (chkdiploma.Checked == true) { diploma.Text = "1"; } else { diploma.Text = "0"; }
        if (chkcurriculum.Checked == true) { curriculum.Text = "1"; } else { curriculum.Text = "0"; }
        if (chkfotografias.Checked == true) { fotografias.Text = "1"; } else { fotografias.Text = "0"; }
        if (chkpagoresponsable.Checked == true) { pagoresponsable.Text = "1"; } else { pagoresponsable.Text = "0"; }

        if (chkaltasat.Checked == true){altasat.Text = "1";} else { altasat.Text = "0"; }
        if (chkplanomemoria.Checked == true){planomemoria.Text = "1";} else { planomemoria.Text = "0"; }
        if (chkrelacionmaterial.Checked == true){relacionmaterial.Text = "1";} else { relacionmaterial.Text = "0"; }
        if (chkpago.Checked == true){pago.Text = "1";} else { pago.Text = "0"; }
        if (chkprogramaact.Checked == true){programaact.Text = "1";} else { programaact.Text = "0"; }
        if (chkfotocopiaconvenio.Checked == true){fotocopiaconvenio.Text = "1";} else { fotocopiaconvenio.Text = "0"; }
        if (chklibroregistro.Checked == true){libroregistro.Text = "1";} else { libroregistro.Text = "0"; }
        if (chkdescripciontecnicaembal.Checked == true){descripciontecnicaembal.Text = "1";} else { descripciontecnicaembal.Text = "0"; }
        if (chktarjetadecontrol.Checked == true){tarjetadecontrol.Text = "1";} else { tarjetadecontrol.Text = "0"; }
        if (chkcartaconsentimiento.Checked == true){cartaconsentimiento.Text = "1";} else { cartaconsentimiento.Text = "0"; }
        if (chkactaconstitutiva.Checked == true){actaconstitutiva.Text = "1";} else { actaconstitutiva.Text = "0"; }
        if (chkreglamentointerno.Checked == true){reglamentointerno.Text = "1";} else { reglamentointerno.Text = "0"; }
        if (chkvistoproteccioncivil.Checked == true){vistoproteccioncivil.Text = "1";} else { vistoproteccioncivil.Text = "0"; }
        if (chkrelacionpersonal.Checked == true){relacionpersonal.Text = "1";} else { relacionpersonal.Text = "0"; }
        if (chkautorizaciondif.Checked == true){autorizaciondif.Text = "1";} else { autorizaciondif.Text = "0"; }
        if (chkcedulaautoevaluacion.Checked == true){cedulaautoevaluacion.Text = "1";} else { cedulaautoevaluacion.Text = "0"; }
        if (chkpapelmembretado.Checked == true){papelmembretado.Text = "1";} else { papelmembretado.Text = "0"; }
        if (chkautorizacionset.Checked == true){autorizacionset.Text = "1";} else { autorizacionset.Text = "0"; }
        if (chkusodesuelo.Checked == true){usodesuelo.Text = "1";} else { usodesuelo.Text = "0"; }
        if (chkprocesolimpieza.Checked == true){procesolimpieza.Text = "1";} else { procesolimpieza.Text = "0"; }
        if (chkrelaciontipoanalisis.Checked == true){relaciontipoanalisis.Text = "1";} else { relaciontipoanalisis.Text = "0"; }
        if (chkactaverificacion.Checked == true){actaverificacion.Text = "1";} else { actaverificacion.Text = "0"; }

        if (chkavisofunc.Checked == true) { avisofunc.Text = "1"; } else { avisofunc.Text = "0"; }
        if (chkdoctecatmedhosp.Checked == true) { doctecatmedhosp.Text = "1"; } else { doctecatmedhosp.Text = "0"; }
        if (chkprogramamedico.Checked == true) { programamedico.Text = "1"; } else { programamedico.Text = "0"; }
        if (chkcaracteristicasmecanicas.Checked == true) { caracteristicasmecanicas.Text = "1"; } else { caracteristicasmecanicas.Text = "0"; }
        if (chkfotografiasdeunidad.Checked == true) { fotografiasdeunidad.Text = "1"; } else { fotografiasdeunidad.Text = "0"; }
        if (chklicenciasanitariaanterior.Checked == true) { licenciasanitariaanterior.Text = "1"; } else { licenciasanitariaanterior.Text = "0"; }
        if (chkautorizacionresponsableanterior.Checked == true) { autorizacionresponsableanterior.Text = "1"; } else { autorizacionresponsableanterior.Text = "0"; }
        if (chkantecedentesnopenales.Checked == true) { antecedentesnopenales.Text = "1"; } else { antecedentesnopenales.Text = "0"; }
        if (chkpolizaseguro.Checked == true) { polizaseguro.Text = "1"; } else { polizaseguro.Text = "0"; }
        if (chkprogramaalimentacion.Checked == true) { programaalimentacion.Text = "1"; } else { programaalimentacion.Text = "0"; }
    }
    private DataSet GetData(string SPName, SqlParameter SPParameter)

    {
        string CS = ConfigurationManager.ConnectionStrings["dbCnnStr"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        SqlDataAdapter da = new SqlDataAdapter(SPName, con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        if (SPParameter != null)
        {
            da.SelectCommand.Parameters.Add(SPParameter);
        }


        DataSet DS = new DataSet();
        da.Fill(DS);
        return DS;

    }
    private void CategoriasTramitesDropDownList()
    {
        ddlCategorias.DataSource = GetData("bitaseg.spGetModalidad_Lista_tramites", null);
        ddlCategorias.DataBind();

        ListItem liCategoria = new ListItem("Seleccione un ...", "-1");
        ddlCategorias.Items.Insert(0, liCategoria);

        ListItem liTramite = new ListItem("Seleccione un Trámite", "-1");
        ddlTramites.Items.Insert(0, liTramite);


        ddlTramites.Enabled = false;
    }
    protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
    {
        categoria.Value = "0";
        lic.Visible = false;
        aut.Visible = false;
        if (ddlCategorias.SelectedValue == "-1")
        {

            ddlTramites.SelectedIndex = 0;
            ddlTramites.Enabled = false;

        }
        else
        {

            ddlTramites.Enabled = true;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@id_categoria";
            parameter.Value = ddlCategorias.SelectedValue;

            ddlTramites.DataSource = GetData("bitaseg.spGetTramitePorCategoria", parameter);
            ddlTramites.DataBind();


            ListItem liTramites = new ListItem("Selecciona un Trámite", "-1");
            ddlTramites.Items.Insert(0, liTramites);


        }
    }
    protected void ddlTramites_SelectedIndexChanged(object sender, EventArgs e)
    {

       chksollicsan.Checked = false;
       chkaltasat.Checked = false; 
       chkplanomemoria.Checked = false; 
       chkrelacionmaterial.Checked = false; 
       chkpago.Checked = false; 
       chkprogramaact.Checked = false; 
       chkfotocopiaconvenio.Checked = false; 
       chklibroregistro.Checked = false; 
       chkdescripciontecnicaembal.Checked = false; 
       chktarjetadecontrol.Checked = false; 
       chkcartaconsentimiento.Checked = false; 
       chkactaconstitutiva.Checked = false; 
       chkreglamentointerno.Checked = false; 
       chkvistoproteccioncivil.Checked = false; 
       chkrelacionpersonal.Checked = false; 
       chkautorizaciondif.Checked = false; 
       chkcedulaautoevaluacion.Checked = false; 
       chkpapelmembretado.Checked = false; 
       chkautorizacionset.Checked = false; 
       chkusodesuelo.Checked = false; 
       chkprocesolimpieza.Checked = false; 
       chkrelaciontipoanalisis.Checked = false; 
       chkactaverificacion.Checked = false; 
       chksolicitud.Checked = false; 
       chktitulo.Checked = false; 
       chkcedula.Checked = false; 
       chkdiploma.Checked = false; 
       chkcurriculum.Checked = false; 
       chkfotografias.Checked = false; 
       chkpagoresponsable.Checked = false;

       chkavisofunc.Checked = false;
       chkdoctecatmedhosp.Checked = false;
       chkprogramamedico.Checked = false;
       chkcaracteristicasmecanicas.Checked = false;
       chkfotografiasdeunidad.Checked = false;
       chklicenciasanitariaanterior.Checked = false;
       chkautorizacionresponsableanterior.Checked = false;
       chkantecedentesnopenales.Checked = false;
       chkpolizaseguro.Checked = false;
       chkprogramaalimentacion.Checked = false;


        string[] separators = { ",", ".", "!", "?", ";", ":", "|" };
        string cadena = ddlTramites.SelectedValue.ToString();
        string[] split = cadena.Split(separators, StringSplitOptions.RemoveEmptyEntries);
        string p1 = split[0];
        string p2 = split[1];
        string p3 = split[2];
        string p4 = split[3];
        string p5 = split[4];
        int a = Int32.Parse(p1);
        int b = Int32.Parse(p2);
        int c = Int32.Parse(p3);
        int d = Int32.Parse(p4);
        int f = Int32.Parse(p5);

        riesgo.Text = p1.ToString();
        verificacion.Text = p2.ToString();
        modalidad.Text = p3.ToString();
        categoria.Value = p4.ToString();
        id_tramite.Text = p5.ToString();

       

        if (a == 1)
        {
            txtRiesgo.Text = "Bajo Riesgo";
        }
        else { txtRiesgo.Text = "Alto Riesgo"; }
        Requisitos rq = new Requisitos();
        rq.Cargar(Convert.ToInt32(id_tramite.Text));
        if (rq.SOLLICSAN == true) { chksollicsan.Checked= true; }
        if (rq.ALTASAT == true) { chkaltasat.Checked = true; }
        if (rq.PLANOMEMORIA == true) { chkplanomemoria.Checked = true; }
        if (rq.RELACIONMATERIAL == true) { chkrelacionmaterial.Checked = true; }
        if (rq.PAGO == true) { chkpago.Checked = true; }
        if (rq.PROGRAMAACT == true) { chkprogramaact.Checked = true; }
        if (rq.FOTOCOPIACONVENIO == true) { chkfotocopiaconvenio.Checked = true; }
        if (rq.LIBROREGISTRO == true) { chklibroregistro.Checked = true; }
        if (rq.DESCRIPCIONTECNICAEMBAL == true) {chkdescripciontecnicaembal.Checked=true; }
        if (rq.TARJETADECONTROL == true) { chktarjetadecontrol.Checked = true; }
        if (rq.CARTACONSENTIMIENTO == true) { chkcartaconsentimiento.Checked = true; }
        if (rq.ACTACONSTITUTIVA == true) { chkactaconstitutiva.Checked = true; }
        if (rq.REGLAMENTOINTERNO == true) { chkreglamentointerno.Checked = true; }
        if (rq.VISTOPROTECCIONCIVIL == true) { chkvistoproteccioncivil.Checked = true; }
        if (rq.RELACIONPERSONAL == true) { chkrelacionpersonal.Checked = true; }
        if (rq.AUTORIZACIONDIF == true) {chkautorizaciondif.Checked = true; }
        if (rq.CEDULAAUTOEVALUACION == true) { chkcedulaautoevaluacion.Checked = true; }
        if (rq.PAPELMEMBRETADO == true) { chkpapelmembretado.Checked = true; }
        if (rq.AUTORIZACIONSET == true) {chkautorizacionset.Checked = true; }
        if (rq.USODESUELO == true) { chkusodesuelo.Checked = true; }
        if (rq.PROCESOLIMPIEZA == true) { chkprocesolimpieza.Checked = true; }
        if (rq.RELACIONTIPOANALISIS == true) { chkrelaciontipoanalisis.Checked = true; }
        if (rq.ACTAVERIFICACION == true) { chkactaverificacion.Checked = true; }
        if (rq.SOLICITUD == true) { chksolicitud.Checked = true; }
        if (rq.TITUTLO == true) { chktitulo.Checked = true; }
        if (rq.CEDULA == true) { chkcedula.Checked = true; }
        if (rq.DIPLOMA == true) { chkdiploma.Checked = true; }
        if (rq.CURRICULUM == true) { chkcurriculum.Checked = true; }
        if (rq.FOTOGRAFIAS == true) { chkfotografias.Checked = true; }
        if (rq.PAGORESPONSABLE == true) { chkpagoresponsable.Checked = true; }

        if (rq.AVISOFUNC == true) { chkavisofunc.Checked = true; }
        if (rq.DOCTECATMEDHOSP == true) { chkdoctecatmedhosp.Checked = true; }
        if (rq.PROGRAMAMEDICO == true) { chkprogramamedico.Checked = true; }
        if (rq.CARACTERISTICASMECANICAS == true) { chkcaracteristicasmecanicas.Checked = true; }
        if (rq.FOTOGRAFIASDEUNIDAD == true) { chkfotografiasdeunidad.Checked = true; }
        if (rq.LICENCIASANITARIAANTERIOR == true) { chklicenciasanitariaanterior.Checked = true; }
        if (rq.AUTORIZACIONRESPONSABLEANTERIOR == true) { chkautorizacionresponsableanterior.Checked = true; }
        if (rq.ANTECEDENTESNOPENALES == true) { chkantecedentesnopenales.Checked = true; }
        if (rq.POLIZASEGURO == true) { chkpolizaseguro.Checked = true; }
        if (rq.PROGRAMAALIMENTACION == true) { chkprogramaalimentacion.Checked = true; }




        switch (categoria.Value)
        {

            case "0":
               

                break;
          default:
                aut.Visible = true;
                lic.Visible = true;
                break;

        }

    }
    protected void btntexto_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection cna = new SqlConnection();
            cna.ConnectionString = Principal.CnnStr0;
            cna.Open();
            //SqlCommand cmda = new SqlCommand(" Insert Into bitaseg.imgchar (folio) values ('" + folio.Text + "')");
            SqlCommand cma = new SqlCommand("UPDATE bitaseg.Lista_Tramites2" +
            " SET " +
            "sollicsan = ('" + chksollicsan.Checked.ToString() + "')," +
            "solicitud =('" + chksolicitud.Checked.ToString() + "')," +
            "titulo = ('" + chktitulo.Checked.ToString() + "')," +
            "cedula = ('" + chkcedula.Checked.ToString() + "')," +
            "diploma = ('" + chkdiploma.Checked.ToString() + "')," +
            "curriculum = ('" + chkcurriculum.Checked.ToString() + "')," +
            "fotografias =('" + chkfotografias.Checked.ToString() + "')," +
            "pagoresponsable= ('" + chkpagoresponsable.Checked.ToString() + "')," +
            "altasat= ('" + chkaltasat.Checked.ToString() + "')," +
            "planomemoria = ('" + chkplanomemoria.Checked.ToString() + "')," +
            "relacionmaterial = ('" + chkrelacionmaterial.Checked.ToString() + "')," +
            "pago = ('" + chkpago.Checked.ToString() + "')," +
            "programaact = ('" + chkprogramaact.Checked.ToString() + "')," +
            "fotocopiaconvenio = ('" + chkfotocopiaconvenio.Checked.ToString() + "')," +
            "libroregistro = ('" + chklibroregistro.Checked.ToString() + "')," +
            "descripciontecnicaembal = ('" + chkdescripciontecnicaembal.Checked.ToString() + "')," +
            "tarjetadecontrol = ('" + chktarjetadecontrol.Checked.ToString() + "')," +
            "cartaconsentimiento = ('" + chkcartaconsentimiento.Checked.ToString() + "')," +
            "actaconstitutiva = ('" + chkactaconstitutiva.Checked.ToString() + "')," +
            "reglamentointerno = ('" + chkreglamentointerno.Checked.ToString() + "')," +
            "vistoproteccioncivil = ('" + chkvistoproteccioncivil.Checked.ToString() + "')," +
            "relacionpersonal = ('" + chkrelacionpersonal.Checked.ToString() + "')," +
            "autorizaciondif = ('" + chkautorizaciondif.Checked.ToString() + "')," +
            "cedulaautoevaluacion = ('" + chkcedulaautoevaluacion.Checked.ToString() + "')," +
            "papelmembretado = ('" + chkpapelmembretado.Checked.ToString() + "')," +
            "autorizacionset =('" + chkautorizacionset.Checked.ToString() + "')," +
            "usodesuelo = ('" + chkusodesuelo.Checked.ToString() + "')," +
            "procesolimpieza = ('" + chkprocesolimpieza.Checked.ToString() + "')," +
            "relaciontipoanalisis = ('" + chkrelaciontipoanalisis.Checked.ToString() + "')," +
            "actaverificacion = ('" + chkactaverificacion.Checked.ToString() + "')," +

            "avisofunc = ('" + chkavisofunc.Checked.ToString() + "')," +
            "doctecatmedhosp = ('" + chkdoctecatmedhosp.Checked.ToString() + "')," +
            "programamedico = ('" + chkprogramamedico.Checked.ToString() + "')," +
            "caracteristicasmecanicas = ('" + chkcaracteristicasmecanicas.Checked.ToString() + "')," +
            "fotografiasdeunidad = ('" + chkfotografiasdeunidad.Checked.ToString() + "')," +
            "licenciasanitariaanterior = ('" + chklicenciasanitariaanterior.Checked.ToString() + "')," +
            "autorizacionresponsableanterior = ('" + chkautorizacionresponsableanterior.Checked.ToString() + "')," +
            "antecedentesnopenales = ('" + chkantecedentesnopenales.Checked.ToString() + "')," +
            "polizaseguro = ('" + chkpolizaseguro.Checked.ToString() + "')," +
            "programaalimentacion = ('" + chkprogramaalimentacion.Checked.ToString() + "')" +   

            "where id_tramite = ('" + id_tramite.Text + "')");

            cma.Connection = cna;
            cma.ExecuteNonQuery();
            cna.Close();

            Response.Write("<script>alert('Datos modificados Correctamente');</script>");
        }
        catch (Exception Ex)
        {
            Lblmsg.Text = Ex.Message;
            Response.Write("<script>alert('Favor de verificar la información capturada " + Ex.Message + "') </script>");
            
        }
    }
}
