using Salud.Tamaulipas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Ecrypt_Decrypt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void encriptar_Click(object sender, EventArgs e)
    {
        EncryptDecrypt cripto = new EncryptDecrypt();

           


        var encrypt = cripto.Encrypt(txt.Text.ToString());
        encrypt = encrypt.Replace("!", "%21").Replace("#", "%23").Replace("$", "%24").Replace("%", "%25").Replace("&", "%26").Replace("'", "%27").Replace("(", "%28").Replace(")", "%29").Replace("*", "%2A").Replace("+", "%2B").Replace(",", "%2C").Replace("/", "%2F").Replace(":", "%3A").Replace(";", "%3B").Replace("=", "%3D").Replace("?", "%3F").Replace("@", "%40").Replace("[", "%5B").Replace("]", "%5D");
        lbl.Text = encrypt;

    }

    protected void desencriptar_Click(object sender, EventArgs e)
    {
        EncryptDecrypt decrypt = new EncryptDecrypt();

        var texto_decript = txt.Text.ToString();
        
        texto_decript = texto_decript.Replace("%21", "!").Replace("%23", "#").Replace("%24", "$").Replace("%25", "%").Replace("%26", "&").Replace("%27", "'").Replace("%28", "(").Replace("%29", ")").Replace("%2A", "*").Replace("%2B", "+").Replace("%2C", ",").Replace("%2F", "/").Replace("%3A", ":").Replace("%3B", ";").Replace("%3D", "=").Replace("%3F", "?").Replace("%40", "@").Replace("%5B", "[").Replace("%5D", "]");
        var decript = decrypt.Decrypt(texto_decript);
        lbl.Text = decript;
    }
}