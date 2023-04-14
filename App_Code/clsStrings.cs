using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for clsStrings
/// </summary>
public class clsStrings
{
    public clsStrings()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string SafeSqlLikeClauseLiteral(string prmSQLString)
    {
        string s = prmSQLString;
        s = s.Replace("'", "''");
        s = s.Replace("[", "[[]");
        s = s.Replace("%", "[%]");
        //s = s.Replace("_", "[_]");
        return (s);
    }
    public static string fnHTML_ENCODE(string prmSQLString)
    {
        string s = prmSQLString;
        s = s.Replace("'", "''");
        //s = s.Replace("[", "[[]");
        //s = s.Replace("%", "[%]");
        //s = s.Replace("_", "[_]");
        //s = s.Replace("<", "&lt;");
        //s = s.Replace(">", "&gt;");
        return (s);
    }
    public static string fnYesNo(bool prmValue) {
        if (prmValue)
        {
            return ("SI");
        }
        else {
            return ("NO");
        }
    }
    public static string fnYesNo(bool prmValue, bool prmHTMLMODE)
    {
        string _return = "NO";
        if (prmValue)
        {
            _return = "SI";
        }
        else
        {
            _return = "NO";
        }
        if (prmHTMLMODE) {
            switch (prmValue) { 
                case true:
                    _return = "<span style=\"color:Blue;font-weight:bold;\">" + _return + "</span>";
                    break;
                case false:
                    _return = "<span style=\"color:Red;font-weight:bold;\">" + _return + "</span>";
                    break;
            }
        }
        return (_return);

    }
    public static string fnErrorMessage(string prmMessage)
    {
        return ("<span style=\"color:Red;\">" +
                "<img src = \"img/icons16/error.png\" height=\"16\" width=\"16\" alt=\"Error\" />&nbsp;" +
                prmMessage + "</span>");
    }
    public static string fnInfoMessage(string prmMessage)
    {
        return ("<span style=\"color:Blue;\">" +
                "<img src = \"img/icons16/information.png\" height=\"16\" width=\"16\" alt=\"Informaci&oacute;n\" />&nbsp;" +
                prmMessage + "</span>");
    }
    public static string fnNormalMessage(string prmMessage)
    {
        return ("<span style=\"vertical-align:center\">" +
                "<img src = \"img/icons16/information.png\" height=\"16\" width=\"16\" alt=\"Informaci&oacute;n\" />&nbsp;" +
                prmMessage + "</span>");
    }
}
