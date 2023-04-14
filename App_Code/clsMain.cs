using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for clsMain
/// </summary>
public class clsMain
{
    public clsMain()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    /// <summary>
    /// Regresa la cadena de conexi&oacute;n
    /// </summary>
    public static string CnnStr
    {
        get
        {
            return (ConfigurationManager.
                ConnectionStrings["dbCnnStr"].
                ConnectionString);
        }
    }
    public static string WebConfig(string prmKey) {
        try
        {
            string value = ConfigurationManager.AppSettings[prmKey];
            return (value);
        }
        catch {
            return ("");
        }
    }

}
