using Salud.Tamaulipas;
using System;
using System.IO;
using System.Web;
using System.Linq;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;
using System.Text;
using System.Web.UI;
using iText.IO.Image;
using iText.IO.Font;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.Layout.Borders;
using iText.Kernel.Colors;
using System.Data.SqlClient;
using iText.Forms.Fields;
using iText.Forms;
public partial class Gracias : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-10);
        if (!Page.IsPostBack)
        {
            try
            {
                EncryptDecrypt cripto = new EncryptDecrypt();
                //I82X5exjK422E8H+qZdAJg==
                var id_decrypt = cripto.Decrypt(Request.Params["id"].ToString());
                Distintivos distintivos = new Distintivos(Convert.ToInt32(id_decrypt));

                if (distintivos.Descargado == false)
                {
                    LblMsg.Text = "<br />" + MessageStyles.Success("Se ha descargado el archivo satisfactoriamente, por favor verifica tu carpeta de descargas.", false);

                    SqlConnection cna = new SqlConnection();
                    cna.ConnectionString = Principal.CnnStr0;
                    cna.Open();
                    SqlCommand cma = new SqlCommand("UPDATE bitaseg.Distintivos_Registros SET descargado = 1  where id_distintivo = ('" + id_decrypt + "') ");
                    cma.Connection = cna;
                    cma.ExecuteNonQuery();
                    cna.Close();

                    StringBuilder strScript = new StringBuilder();
                    strScript.Append("var getUrlParameter = function getUrlParameter(sParam) {var sPageURL = window.location.search.substring(1),sURLVariables = sPageURL.split('&'),sParameterName,i;for (i = 0; i < sURLVariables.length; i++){sParameterName = sURLVariables[i].split('=');if (sParameterName[0] === sParam){return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);}}return false;}; var id_g = getUrlParameter('id_g'); if (id_g == 14){$('#Modal_Registrar_Otro').modal(\"show\");}$('#btnPDF').click();");
                    ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
                }

            }
            catch (Exception Ex)
            {

                LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);
                StringBuilder strScript2 = new StringBuilder();
                strScript2.Append("$('#ModalSolLicSan').modal(\"show\")");
                ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);
            }


        }
    }
    protected void btn_registro_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
       
    }
    protected void btn_registro_escuelas_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Registro_Escuelas.aspx?id=14");

    }
    protected void btnPDF_ServerClick(object sender, EventArgs e)
    {
        try
        {
            EncryptDecrypt cripto = new EncryptDecrypt();
            //I82X5exjK422E8H+qZdAJg==
            var id_decrypt = cripto.Decrypt(Request.Params["id"].ToString());
            var id_encrypt = cripto.Encrypt(id_decrypt);
            id_encrypt = id_encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");

            //StringBuilder strScript = new StringBuilder();
            //strScript.Append("window.location.href = ('Imprimir.aspx?id=" + id_encrypt+"');");
            //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
            //if (ValorGenerar.Value == "1") { GenerarPDF((Page)HttpContext.Current.Handler); }

            GenerarPDF(((Page)HttpContext.Current.Handler));
            //Response.Redirect("Imprimir.aspx?id=" + id_encrypt);
            //Response.Write("<script>alert('Imprimir.aspx?id=" + Request.Params["id"] + "') </script>");
        }
        catch (Exception Ex)
        {
            LblMsg.Text = "<br />" + MessageStyles.Danger(Ex.Message, false);
            StringBuilder strScript = new StringBuilder();
            strScript.Append("$('#ModalSolLicSan').modal(\"show\")");
            ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript.ToString(), true);
        }



    }

    void GenerarPDF(Page page)
    {
        try
        {
            String rutaFuente = page.Server.MapPath("../fonts/");
            String fuente1 = "HelveticaNeueLTStd-Bd.ttf";
            String fuente2 = "HelveticaNeueLTStd-Lt.ttf";
            FontProgram fontProgram = FontProgramFactory.CreateFont(rutaFuente + fuente1);
            FontProgram fontProgram2 = FontProgramFactory.CreateFont(rutaFuente + fuente2);

            PdfFont HelveticaNeueLTstd_Bd = PdfFontFactory.CreateFont(fontProgram, PdfEncodings.WINANSI, true);
            PdfFont HelveticaNeueLTstd_Lt = PdfFontFactory.CreateFont(fontProgram2, PdfEncodings.WINANSI, true);

            EncryptDecrypt cripto = new EncryptDecrypt();
            //I82X5exjK422E8H+qZdAJg==
            var id_decrypt = cripto.Decrypt(Request.Params["id"].ToString());
            Distintivos distintivos = new Distintivos(Convert.ToInt32(id_decrypt));


            //string[] separador_dias = { "|" };
            //string cadena_dias = distintivos.Dias_laborales;
            //string[] dias = cadena_dias.Split(separador_dias, StringSplitOptions.RemoveEmptyEntries);
            //string RLunes = dias[0];
            //string RMartes = dias[1];
            //string RMiercoles = dias[2];
            //string RJueves = dias[3];
            //string RViernes = dias[4];
            //string RSabado = dias[5];
            //string RDomingo = dias[6];

            //int startIndex = 2;
            //int length = 1;

            //chkLunesR.Checked = Convert.ToBoolean(Convert.ToInt16(RLunes.Substring(startIndex, length))); chkLunesR.Enabled = false;
            //chkMartesR.Checked = Convert.ToBoolean(Convert.ToInt16(RMartes.Substring(startIndex, length))); chkMartesR.Enabled = false;
            //chkMiercolesR.Checked = Convert.ToBoolean(Convert.ToInt16(RMiercoles.Substring(startIndex, length))); chkMiercolesR.Enabled = false;
            //chkJuevesR.Checked = Convert.ToBoolean(Convert.ToInt16(RJueves.Substring(startIndex, length))); chkJuevesR.Enabled = false;
            //chkViernesR.Checked = Convert.ToBoolean(Convert.ToInt16(RViernes.Substring(startIndex, length))); chkViernesR.Enabled = false;
            //chkSabadoR.Checked = Convert.ToBoolean(Convert.ToInt16(RSabado.Substring(startIndex, length))); chkSabadoR.Enabled = false;
            //chkDomingoR.Checked = Convert.ToBoolean(Convert.ToInt16(RDomingo.Substring(startIndex, length))); chkDomingoR.Enabled = false;



            string nombrecompleto = distintivos.Nombre + " " + distintivos.Apellidop + " " + distintivos.Apellidom;
            string imageFilePathHead = page.Server.MapPath("../img/test2.png");
            string imagechkOff = page.Server.MapPath("../img/chkOff.png");
            Image imgHead = new Image(ImageDataFactory.Create(imageFilePathHead));
            Image chkOff = new Image(ImageDataFactory.Create(imageFilePathHead));
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Folio" + id_decrypt + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            var stream = new MemoryStream();
            var writer = new PdfWriter(stream);
            var pdf = new PdfDocument(writer);
            var document = new Document(pdf, new PageSize(612, 792));
            document.SetMargins(0, 0, 0, 0);


            Table tabla_cabecera = new Table(UnitValue.CreatePercentArray(1000)).UseAllAvailableWidth().SetFixedLayout();
            tabla_cabecera.SetWidth(pdf.GetDefaultPageSize().GetWidth());

            //PRIMER FILA
            Cell folio = new Cell(1, 55).Add(new Paragraph("Folio: ").SetTextAlignment(TextAlignment.LEFT).SetFontSize(12).SetFontColor(ColorConstants.RED));
            tabla_cabecera.AddCell(folio);
            Cell numero_folio = new Cell(1, 445).Add(new Paragraph(distintivos.Folio.ToString()).SetTextAlignment(TextAlignment.LEFT).SetFontSize(12).SetBold());
            tabla_cabecera.AddCell(numero_folio);
            Cell tg = new Cell(1, 431).Add(new Paragraph("TRÁMITE GRATUITO")).SetTextAlignment(TextAlignment.RIGHT).SetFontSize(12);
            tabla_cabecera.AddCell(tg);

            imgHead.SetMarginLeft(20).SetMarginRight(20).SetMarginTop(20);
            tabla_cabecera.SetMarginLeft(20).SetFontColor(ColorConstants.RED);

            folio.SetBorder(Border.NO_BORDER);
            numero_folio.SetBorder(Border.NO_BORDER);
            tg.SetBorder(Border.NO_BORDER);

            Paragraph header = new Paragraph("Comisión Estatal Para la Protección contra Riesgos Sanitarios").SetTextAlignment(TextAlignment.CENTER).SetFontSize(15);


            Paragraph comprobante1;

            if (distintivos.IDgiro != 13) { comprobante1 = new Paragraph("Comprobante de registro de solicitud de                                                DISTINTIVO ESTABLECIMIENTO SEGURO").SetTextAlignment(TextAlignment.CENTER).SetFontSize(20); }
            else { comprobante1 = new Paragraph("Comprobante de registro de solicitud de                                               DISTINTIVO ESCUELA SEGURA").SetTextAlignment(TextAlignment.CENTER).SetFontSize(20); }



            Paragraph comprobante2 = new Paragraph(" ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(20);
            Paragraph casifooter = new Paragraph("CUALQUIER DUDA ACERCA DE ESTE TRÁMITE FAVOR DE ACUDIR A NUESTROS CENTROS INTEGRALES DE SERVICIOS(CIS) O COMUNICARTE A NUESTRAS LINEAS DE CONTACTO.").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12);
            Paragraph wp_contacto = new Paragraph("Whatsapp: 834 268 7089").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12);
            Paragraph tel_contacto = new Paragraph("Teléfono fijo: 800 720 3774").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12);
            Paragraph correo_contacto = new Paragraph("Correo electrónico: contacto.coepris@tam.gob.mx").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12);
            Paragraph vacio = new Paragraph("");


            //Paragraph url = new Paragraph(imageFilePathHead).SetTextAlignment(TextAlignment.CENTER).SetFontSize(20);
            tabla_cabecera.SetFont(HelveticaNeueLTstd_Lt);
            folio.SetFont(HelveticaNeueLTstd_Lt);
            header.SetFont(HelveticaNeueLTstd_Bd);
            comprobante1.SetFont(HelveticaNeueLTstd_Lt);
            comprobante2.SetFont(HelveticaNeueLTstd_Lt);

            casifooter.SetFont(HelveticaNeueLTstd_Lt).SetMarginLeft(20).SetMarginRight(20);
            wp_contacto.SetFont(HelveticaNeueLTstd_Lt);
            tel_contacto.SetFont(HelveticaNeueLTstd_Lt);
            correo_contacto.SetFont(HelveticaNeueLTstd_Lt);


            header.SetMargins(0, 50, 0, 50);
            Table table = new Table(UnitValue.CreatePercentArray(1000)).UseAllAvailableWidth().SetFixedLayout();
            table.SetWidth(pdf.GetDefaultPageSize().GetWidth()).SetMarginLeft(20);


            //PRIMER FILA
            Cell lblnombre;
            if (distintivos.IDgiro != 13)
            { lblnombre = new Cell(1, 366).Add(new Paragraph("Datos del propietario:").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd)); }
            else { lblnombre = new Cell(1, 366).Add(new Paragraph("Datos del responsable de implementación de protocolos COVID:").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd)); }
            table.AddCell(lblnombre);


            Cell lblestablecimiento;
            if (distintivos.IDgiro != 13)
            { lblestablecimiento = new Cell(1, 566).Add(new Paragraph("Datos del Establecimiento:").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd)); }
            else { lblestablecimiento = new Cell(1, 566).Add(new Paragraph("Datos de la institución educativa:").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd)); }
            table.AddCell(lblestablecimiento);






            Cell relleno1 = new Cell(1, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno1);
            //SEGUNDA FILA
            Cell nombre = new Cell(2, 366).Add(new Paragraph(nombrecompleto));
            table.AddCell(nombre);
            Cell lblnombreestablecimiento = new Cell(2, 95).Add(new Paragraph("Nombre:"));
            table.AddCell(lblnombreestablecimiento);
            Cell nombreestablecimiento = new Cell(2, 471).Add(new Paragraph(distintivos.Nombreest));
            table.AddCell(nombreestablecimiento);

            Cell relleno2 = new Cell(2, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno2);
            //TERCER FILA
            Cell tel = new Cell(3, 120).Add(new Paragraph(distintivos.Tel.ToString()));
            table.AddCell(tel);
            Cell correo = new Cell(3, 246).Add(new Paragraph(distintivos.Correo.ToString()));
            table.AddCell(correo);
            Cell municipio = new Cell(3, 566).Add(new Paragraph("Municipio: " + distintivos.Municipio.ToString()));
            table.AddCell(municipio);

            Cell relleno3 = new Cell(3, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno3);
            //CUARTA FILA
            Cell vacio400_row4 = new Cell(4, 366).Add(new Paragraph(""));
            table.AddCell(vacio400_row4);
            Cell localidad = new Cell(4, 566).Add(new Paragraph("Localidad: " + distintivos.Localidad.ToString()));
            table.AddCell(localidad);

            Cell relleno4 = new Cell(4, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno4);
            //QUINTA FILA
            Cell vacio400 = new Cell(5, 366).Add(new Paragraph(""));
            table.AddCell(vacio400);
            Cell colonia = new Cell(5, 452).Add(new Paragraph("Colonia: " + distintivos.Colonia));
            table.AddCell(colonia);
            Cell cp = new Cell(5, 114).Add(new Paragraph("C.P. " + distintivos.Cp));
            table.AddCell(cp);

            Cell relleno5 = new Cell(5, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno5);
            //SEXTA FILA
            Cell vacio400_row6 = new Cell(6, 366).Add(new Paragraph(""));
            table.AddCell(vacio400_row6);
            Cell calle = new Cell(6, 338).Add(new Paragraph("Calle: " + distintivos.Calle));
            table.AddCell(calle);
            Cell numext = new Cell(6, 114).Add(new Paragraph("Num.Ext.: " + distintivos.Numext));
            table.AddCell(numext);
            Cell numint = new Cell(6, 114).Add(new Paragraph("Num.Int.:     " + distintivos.Numint));
            table.AddCell(numint);

            Cell relleno6 = new Cell(6, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno6);
            //SÉPTIMA FILA
            Cell vacio400_row7 = new Cell(7, 366).Add(new Paragraph(""));
            table.AddCell(vacio400_row7);
            Cell lblentrecalles = new Cell(7, 95).Add(new Paragraph("Entrecalles:").SetFontSize(10));
            table.AddCell(lblentrecalles);
            Cell entrecalles = new Cell(7, 471).Add(new Paragraph(distintivos.Entrecalles));
            table.AddCell(entrecalles);
            Cell relleno7 = new Cell(7, 68).Add(new Paragraph("").SetFontSize(12).SetFont(HelveticaNeueLTstd_Bd));
            table.AddCell(relleno7);

            vacio400.SetBorder(Border.NO_BORDER);
            vacio400_row4.SetBorder(Border.NO_BORDER);
            vacio400_row6.SetBorder(Border.NO_BORDER);
            vacio400_row7.SetBorder(Border.NO_BORDER);
            relleno1.SetBorder(Border.NO_BORDER);
            relleno2.SetBorder(Border.NO_BORDER);
            relleno3.SetBorder(Border.NO_BORDER);
            relleno4.SetBorder(Border.NO_BORDER);
            relleno5.SetBorder(Border.NO_BORDER);
            relleno6.SetBorder(Border.NO_BORDER);
            relleno7.SetBorder(Border.NO_BORDER);







            //Table tabla_horarios = new Table(UnitValue.CreatePercentArray(100)).UseAllAvailableWidth().SetFixedLayout();
            //tabla_horarios.SetWidth(pdf.GetDefaultPageSize().GetWidth());

            ////PRIMER FILA
            //Cell Lunes = new Cell(1, 100).Add(new Paragraph(" Lunes: ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Lunes); 


            //Cell Martes = new Cell(2, 100).Add(new Paragraph(" Martes ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Martes);
            //Cell Miercoles = new Cell(3, 100).Add(new Paragraph(" Miercoles ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Miercoles);
            //Cell Jueves = new Cell(4, 100).Add(new Paragraph(" Jueves ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Jueves);
            //Cell Viernes = new Cell(5, 100).Add(new Paragraph(" Viernes ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Viernes);
            //Cell Sabado = new Cell(6, 100).Add(new Paragraph(" Sabado ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Sabado);
            //Cell Domingo = new Cell(7, 100).Add(new Paragraph(" Domingo ").SetTextAlignment(TextAlignment.CENTER).SetFontSize(12).SetFontColor(ColorConstants.RED));
            //tabla_horarios.AddCell(Domingo); 
            //Cell Domingoz = new Cell(8, 100);
            //// There's no image autoscaling by default in iText7
            //if (distintivos.Descargado == false) { Domingoz.Add(imgHead.SetAutoScale(true)); }

            //tabla_horarios.AddCell(Domingoz);
            //tabla_horarios.SetHorizontalAlignment(HorizontalAlignment.CENTER);


            //Cell numero_folio = new Cell(1, 445).Add(new Paragraph(id_decrypt).SetTextAlignment(TextAlignment.LEFT).SetFontSize(12).SetBold());
            //tabla_cabecera.AddCell(numero_folio);
            //Cell tg = new Cell(1, 431).Add(new Paragraph("TRÁMITE GRATUITO")).SetTextAlignment(TextAlignment.RIGHT).SetFontSize(12);
            //tabla_cabecera.AddCell(tg);




            imgHead.SetMarginLeft(20).SetMarginRight(20).SetMarginTop(20);
            tabla_cabecera.SetMarginLeft(20).SetFontColor(ColorConstants.RED);

            folio.SetBorder(Border.NO_BORDER);
            numero_folio.SetBorder(Border.NO_BORDER);
            tg.SetBorder(Border.NO_BORDER);

            document.Add(imgHead);
            document.Add(tabla_cabecera);
            document.Add(header);
            document.Add(comprobante1);
            document.Add(comprobante2);

            document.Add(table);
            document.Add(vacio);
            //document.Add(tabla_horarios);
            document.Add(casifooter);
            document.Add(wp_contacto);
            document.Add(tel_contacto);
            document.Add(correo_contacto);
            
            document.Close();
            Response.BinaryWrite(stream.ToArray());
            Response.End();


        }
        catch (Exception Ex)
        {
            Response.Write("<script>alert('" + Ex.Message + "')</script>");
        }

        //StringBuilder strScript2 = new StringBuilder();
        //strScript2.Append("$(function(){" +
        //    "var w = 770;" +
        //    " var h = 600;" +
        //    " var l = (screen.availWidth - w) / 2;" +
        //    " var t = (screen.availHeight - h) / 2;" +
        //    "popPage = '.popup';" +
        //    "$(popPage).on('click', function(event){" +
        //    "window.open(this.href, 'window', 'width= ' + w + ',height=' + h + ',left=' + l + ',top=' + t + ', scrollbars = yes, location = no, toolbar = no, menubar = no, status = no');" +
        //    "return false;" +
        //    "});" +
        //    "});");


        //ScriptManager.RegisterStartupScript(Page, "default".GetType(), "Script", strScript2.ToString(), true);

    }


}