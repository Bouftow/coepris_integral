using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            
           

        if (!Page.IsPostBack)
        {

            DropDownList1.SelectedValue = "6";
        }
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string mun = "";
        switch (Convert.ToInt32(DropDownList1.SelectedValue))
        {
            case 1:
                mun = "C1_vic.aspx";
                break;
            case 2:
                mun = "C2_tam.aspx";
                break;
            case 3:
                mun = "C3_mat.aspx";
                break;
            case 4:
                mun = "C4_rey.aspx";
                break;
            case 5:
                mun = "C5_nvoldo.aspx";
                break;
            case 6:
                mun = "C6_man.aspx";
                break;
            case 7:
                mun = "C7_sanfer.aspx";
                break;
            case 8:
                mun = "C8_jve.aspx";
                break;
            case 9:
                mun = "C9_malm.aspx";
                break;
            case 10:
                mun = "C10_vher.aspx";
                break;
            case 11:
                mun = "C11_pad.aspx";
                break;
            case 12:
                mun = "C12_alt.aspx";
                break;
            default:
                break;
        }
        Response.Redirect(Page.ResolveClientUrl("~/inf_fune/" + mun));
    }
}