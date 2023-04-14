using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using QRCoder;
public partial class sistema_GeneradordeQr_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
        // Generate QR code with logo
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        QRCodeData qrCodeData = qrGenerator.CreateQrCode("", QRCodeGenerator.ECCLevel.Q);
        QRCode qrCode = new QRCode(qrCodeData);

        // Create bitmap from QR code
        Bitmap qrCodeImage = qrCode.GetGraphic(40);

        // Load logo image
        Bitmap logoImage = new Bitmap(Server.MapPath("COEPRIS_fein.PNG"));

        // Calculate logo size and position 
        int logoSizeWidth = 500;
        int logoSizeHeight = 150;
        //int logoSize = qrCodeImage.Width / 5;
        int logoX = (qrCodeImage.Width - logoSizeWidth) / 2;
        int logoY = (qrCodeImage.Height - logoSizeHeight) / 2;

        // Add logo to QR code
        Graphics graphics = Graphics.FromImage(qrCodeImage);
        graphics.DrawImage(logoImage, logoX, logoY, logoSizeWidth, logoSizeHeight);

        // Save QR code with logo as PNG file
        using (MemoryStream memoryStream = new MemoryStream())
        {
            qrCodeImage.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
            byte[] qrCodeBytes = memoryStream.ToArray();
            File.WriteAllBytes(Server.MapPath("../../uploads/qr_code.png"), qrCodeBytes);
        }
    }
}


