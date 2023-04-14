using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Services;

public partial class ComedoresEscolares_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod]
    public static List<string> GetCountryNames(string term)
    {
        List<string> listCountryName = new List<string>();
        using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
        {
            SqlCommand cmd = new SqlCommand("bitaseg.spGetCountryName", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameter = new SqlParameter()
            {
                ParameterName = "@term",
                Value = term
            };
            cmd.Parameters.Add(parameter);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                listCountryName.Add(rdr["CountryName"].ToString());
            }
            return listCountryName;
        }
    }
}