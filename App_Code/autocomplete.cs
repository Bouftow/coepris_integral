using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for autocomplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class autocomplete : System.Web.Services.WebService {

    public autocomplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] ListaDeUsuarios(string prmprefixText)
    {
        string varSQL = "SELECT USER_LOGIN FROM USERS WHERE ACTIVO=1 AND USER_LOGIN <>'" + User.Identity.Name + "' AND NOMBRE LIKE '"+ prmprefixText +"%'";
        DataSet dsUsers = new DataSet();
        SqlConnection cnn = new SqlConnection(clsMain.CnnStr);
        cnn.Open();
        SqlDataAdapter da = new SqlDataAdapter(varSQL,cnn);
        da.Fill(dsUsers);
        string[] cntName = new string[dsUsers.Tables[0].Rows.Count];
        int i = 0;
        try
        {
            foreach (DataRow dr in dsUsers.Tables[0].Rows)
            {
                cntName.SetValue(dr["USER_LOGIN"].ToString(), i);
            }
        }
        catch { }
        finally {
            cnn.Close();
        }
        return cntName;
    }
    
}
