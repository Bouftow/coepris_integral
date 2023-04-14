using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security;
using System.Text;
using System.Web;
using System.Web.Mail;
/// <summary>
/// Descripción breve de EMail
/// </summary>
public class EMail
{
    public EMail()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public bool EnviarEmail(string destinatarios, string asunto, string mensaje, string conf)
    {

        try
        {
            //Configuración del Mensaje
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.IsBodyHtml = true;
            mail.From = new MailAddress(Principal.WebConfig(String.Format("EMAIL_USER{0}", conf)), Principal.WebConfig(String.Format("EMAIL_NAME{0}", conf)), Encoding.UTF8);
            //Aquí ponemos el asunto del correo
            mail.Subject = asunto == "" ? "NO RESPONDER" : asunto;
            //Aquí ponemos el mensaje que incluirá el correo
            mail.Body = mensaje;
            //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
            string[] to = destinatarios.Split(',');
            foreach (string item in to)
            {
                mail.To.Add(new MailAddress(item));
            }

            SmtpClient smtpClient = new SmtpClient(Principal.WebConfig(String.Format("EMAIL_HOST{0}", conf)), Convert.ToInt32(Principal.WebConfig(String.Format("EMAIL_PORT{0}", conf))));
            smtpClient.UseDefaultCredentials = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = Convert.ToBoolean(Principal.WebConfig(String.Format("EMAIL_SSL{0}", conf)));

            SecureString testString = new SecureString();
            // Assign the character array to the secure string.
            foreach (char ch in Principal.WebConfig(String.Format("EMAIL_PASSWORD{0}", conf)).ToCharArray())
                testString.AppendChar(ch);

            smtpClient.Credentials = new NetworkCredential(Principal.WebConfig(String.Format("EMAIL_USER{0}", conf)), testString);

            smtpClient.Send(mail);
            return true;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}