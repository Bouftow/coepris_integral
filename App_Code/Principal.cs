using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web;
using System.Configuration;
using System.Net;
using System.Web.UI.WebControls;

public class Principal
{
	public Principal()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public static string CnnStr0
    {
        get
        {
            return (ConfigurationManager.ConnectionStrings["dbCnnStr"].ConnectionString);
        }
    }
    

    public static string CnnStrMySql01
    {
        get
        {
            return (ConfigurationManager.ConnectionStrings["dbMySql01"].ConnectionString);
        }
    }

    public static string CrearOleDbConnection(string fileName, string password) {
        return String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Jet OLEDB:Database Password={1}", fileName, password);
    }

    public static string GetUrl(string file, Page page)
    {
        string end = (page.Request.ApplicationPath.EndsWith("/")) ? "" : "/";
        string path = page.Request.ApplicationPath + end;
        return string.Format("http://{0}{1}{2}", page.Request.Url.Authority, path, file);
    }

    public static string WebConfig(string prmKey)
    {
        try
        {
            string value = ConfigurationManager.AppSettings[prmKey];
            return (value);
        }
        catch
        {
            return ("");
        }
    }

    public static void LLenarComboIVA(DropDownList cbo)
    {
        try
        {
            cbo.Items.Clear();
            cbo.Items.Add(new ListItem("SELECCIONE", ""));
            string[] values = ConfigurationManager.AppSettings["IVA"].Split(',');
            foreach (string i in values) {
                cbo.Items.Add(new ListItem(String.Format("{0:P}",Convert.ToDouble(i)), i));
            }
        }
        catch
        {
            cbo.Items.Clear();
            ListItem li = new ListItem("ERROR AL CARGAR OPCIONES","");
            cbo.Items.Add(li);
        }
    }

    public static void LLenarComboIEPS(DropDownList cbo)
    {
        try
        {
            cbo.Items.Clear();
            cbo.Items.Add(new ListItem("SELECCIONE", ""));
            string[] values = ConfigurationManager.AppSettings["IEPS"].Split(',');
            foreach (string i in values)
            {
                cbo.Items.Add(new ListItem(i, i));
            }
        }
        catch
        {
            cbo.Items.Clear();
            ListItem li = new ListItem("ERROR AL CARGAR OPCIONES", "");
            cbo.Items.Add(li);
        }
    }

    public static bool RemoteFileExists(string url)
    {
        try
        {
            //Creating the HttpWebRequest
            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            //Setting the Request method HEAD, you can also use GET too.
            request.Method = "HEAD";
            //Getting the Web Response.
            HttpWebResponse response = request.GetResponse() as HttpWebResponse;
            //Returns TRUE if the Status code == 200
            return (response.StatusCode == HttpStatusCode.OK);
        }
        catch
        {
            //Any exception will returns false.
            return false;
        }
    }

    public static string GenerateFileName(string pExtension)
    {
        string ret = String.Format("{0}{1}{2}{3}{4}{5}{6}.{7}",
            DateTime.Now.Year,
            DateTime.Now.Month,
            DateTime.Now.Day,
            DateTime.Now.Hour,
            DateTime.Now.Minute,
            DateTime.Now.Second,
            DateTime.Now.Millisecond,
            String.Format(pExtension == "" ? "" : pExtension));
        return ret;
    }

   

}