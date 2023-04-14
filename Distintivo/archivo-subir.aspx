<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="Salud.Tamaulipas" %>
<%

    try
    {
        //Crear directorio
        string path = Server.MapPath(String.Format("~/uploads/{0}/{1}", Request.Params["tipo"], Request.Params["sesion"]));
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        string fileName = "";
        string fileExt = "";
        JSonFileInput fileInputRes = new JSonFileInput();
        List<string> ip = new List<string>();
        List<InitialPreviewConfig> ipc = new List<InitialPreviewConfig>();
        
        //Grabar archivo

        if (Request.Files.Count > 0)
        {
            HttpFileCollection files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {

                HttpPostedFile file = files[i];
                int fileSize = file.ContentLength;
                fileName = string.Format("uploads/{0}/{1}/{2}{3}{4}", Request.Params["tipo"], Request.Params["sesion"], Request.Params["nombrearchivo"], Request.Params["Archivo"], Path.GetExtension(file.FileName));
                string fname = Server.MapPath("~/" + fileName);
                //Borrar existente
                if (File.Exists(fname))
                {
                    File.Delete(fname);
                }
                file.SaveAs(fname);
                fileExt = Path.GetExtension(file.FileName).ToLower();

                byte[] imgData = File.ReadAllBytes(fname);

                string tipo = "";

                if ((fileExt == ".jpg") || (fileExt == ".gif") || (fileExt == ".png") || (fileExt == ".jpeg"))
                {
                    tipo = "image";
                }
                else if (fileExt == ".pdf") { tipo = "pdf"; }
                else if (fileExt == ".txt") { tipo = "text"; }
                else if ((fileExt == ".doc") || (fileExt == ".docx") || (fileExt == ".xls") || (fileExt == ".xlsx") || (fileExt == ".ppt") || (fileExt == ".pptx")) { tipo = "html"; }
                else { tipo = "html"; }
                if (tipo == "html") { ip.Add(String.Format("{0}<br /> <strong>VISTA PREVIA NO SOPORTADA</strong>", file.FileName)); }
                else { ip.Add(Strings.GetUrl(string.Format("{0}", fileName), this)); }

                //string open_url = String.Format("<a href='../{0}' class='btn btn-secondary btn-sm' target='_blank' alt='Descargar'><i class='fa fa-download'></i></a>", "BitacoraDeSeguimiento/" + fileName);
                //ipc.Add(new InitialPreviewConfig()
                //{
                //    caption = open_url,
                //    size = fileSize,
                //    url = Strings.GetUrl(String.Format("comun/archivo-eliminar.aspx?tipo={0}", Request.Params["tipo"]), this),
                //    key = id_folio,
                //    type = tipo
                //});
            }


            //fileInputRes = new JSonFileInput()
            //{
            //    initialPreview = ip.ToArray(),
            //    append = true,
            //    initialPreviewConfig = ipc.ToArray()
            //};
        }
        else { Response.Write("{}"); }

        //Para mostrar
        //http://plugins.krajee.com/file-input-ajax-demo/5
        string response = new JavaScriptSerializer().Serialize(fileInputRes);
        string respuesta = "{}";
        // Response.Write(String.Format("{{ }}"));
        Response.Write(String.Format("{0}", respuesta));
    }
    catch (Exception ex) { Response.Write(String.Format("{{ {0} }}", ex.Message)); }

%>