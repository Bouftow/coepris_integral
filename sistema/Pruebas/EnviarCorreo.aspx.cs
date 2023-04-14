using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sistema_Pruebas_EnviarCorreo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            //string userPassword = String.Format("{0:mmHHss}", DateTime.Now);
            //Registro reg = new Registro(txtCodigoVerificacion.Text);//trae toda la info
            //throw new Exception("AQui");

            EMail correo = new EMail();

            /*
             string mensaje = String.Format(@"Muchas gracias por haber llenado el Pre-registro a la Plataforma de Reapertura de Establecimientos.<br/>
                 Instrucciones:<br/>
                 1.- Ingresar a la videoconferencia, mediante la liga:<br/><strong> {0}</strong><br/>
                 Día: <strong>{1}</strong><br/>
                 Hora: <strong>{2}</strong><br/><br/>
                 En la videoconferencia, recibirá una plática del protocolo de reapertura según el giro del establecimiento.<br/><br/>
                 IMPORTANTE: <br/> La asistencia a la videconferencia es uno de los requisitos obligatorios para poder abrir el establecimiento.<br/><br/>

                 2.- Una vez terminada la videconferencia, los giros de establecimientos autorizados para abrir, podrán ingresar a la siguiente plataforma utilizando los datos proporcionados: <br/><strong> {3}</strong><br/>
                 <strong>Usuario: </strong>{4}<br/>
                 <strong>Contraseña: </strong>{5}<br/><br/>

                 3.- Dentro de la plataforma , podrán descargar la Constancia de Reapertura de Establecimientos.<br/><br/>
                 <strong style='font-size:20px'>¡Gracias!</strong><br/>
                 Mayor información al <strong>{6}</strong> <br/>", String.Format("<a href='{0}' target='_blank'>{0}</a>", conferencias.Url),
                 conferencias.Fecha,
                 conferencias.Inicio,
                 String.Format("<a href='{0}' target='_blank'>{0}</a>", Principal.WebConfig("SITE_URL")),
                 reg.Email,
                 userPassword,
                 Principal.WebConfig("TEL_COEPRIS")
                 );
              */

            string mensaje = String.Format(@"Muchas gracias por haber llenado el pre-registro a la Plataforma de Reapertura de Establecimientos.<br/>
                        Instrucciones:<br/>
                       
                        1.- Ingrese a la siguiente plataforma utilizando los datos proporcionados: <br/>
                        <strong><a href='{0}' target='_blank'>{0}</a></strong><br/><br/>
                        <strong>Usuario: </strong>{1}<br/>
                        <strong>Contraseña: </strong>{2}<br/><br/>

                        2.- Dentro de la plataforma, podrá generar y descargar su(s) Constancia(s) de Reapertura de Establecimientos.<br/><br/>
                        <strong style='font-size:20px'>¡Gracias!</strong><br/>
                        Mayor información al <strong>{3}</strong> <br/>",
                Principal.WebConfig("SITE_URL"),
                "pacopalaciosx@gmail.com",
                "userPassword",
                Principal.WebConfig("TEL_COEPRIS")
                );


            if (correo.EnviarEmail("pacopalaciosx@gmail.com", "COEPRIS - Gracias por confirmar su registro.", mensaje, ""))
            {

                lblMessage.Text = "<br />" + MessageStyles.Success(String.Format("{1}Acabamos de enviarle un correo electrónico a: <strong>{0}</strong> con toda esta información.<br />No olvide revisar su correo no deseado.", "pacopalaciosx@gmail.com", mensaje), false);
            }

        }
        catch (Exception ex)
        {
            lblMessage.Text = "<br />" + MessageStyles.Danger(
                string.Format("<p>{0}<br/>Para mas información, comuníquese al teléfono: <strong>{1}</strong></p>",
                ex.Message,
                Principal.WebConfig("TEL_COEPRIS")), false);
        }
    }
}