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


public partial class Pruebas_Default2 : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["Image"] = null;
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        Session["Image"] = FileUpload1.PostedFile;
        Stream fs = FileUpload1.PostedFile.InputStream;
        BinaryReader br = new BinaryReader(fs);
        byte[] bytes = br.ReadBytes((Int32)fs.Length);
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        Image1.ImageUrl = "data:image/png;base64," + base64String;
        Panel1.Visible = true;
    }
    protected void Save(object sender, EventArgs e)
    {
        HttpPostedFile postedFile = (HttpPostedFile)Session["Image"];
        postedFile.SaveAs(Server.MapPath("~/Uploads/") + Path.GetFileName(postedFile.FileName));
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void Cancel(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}