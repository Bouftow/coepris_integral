<%@ Page Title="" Language="C#" MasterPageFile="../../main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">

    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <!-- bootstrap 4.x is supported. You can also use the bootstrap css 3.3.x versions -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>--%>

    <link href="../css/fileinput.min.css" rel="stylesheet" />
    <!-- if using RTL (Right-To-Left) orientation, load the RTL CSS file after fileinput.css by uncommenting below -->
    <!-- link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.5/css/fileinput-rtl.min.css" media="all" rel="stylesheet" type="text/css" /-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- piexif.min.js is needed for auto orienting image files OR when restoring exif data in resized images and when you 
    wish to resize images before upload. This must be loaded before fileinput.min.js -->

    <script src="../js/plugins/piexif.min.js"></script>
    <script src="../js/plugins/sortable.min.js"></script>
    <script src="../js/plugins/purify.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- bootstrap.min.js below is needed if you wish to zoom and preview file content in a detail modal
    dialog. bootstrap 4.x is supported. You can also use the bootstrap js 3.3.x versions. -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="../js/fileinput.min.js"></script>
    <script src="../themes/fa/theme.js"></script>
    <script src="../js/locales/LANG.js"></script>

    <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" />
    <ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" runat="server" />
<ajaxToolkit:PasswordStrength runat="server" TargetControlID="txtDOB"></ajaxToolkit:PasswordStrength>
    <div>
        Date of Birth  
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtDOB" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
    </div>
    <script>
        $("#input-id").fileinput();

        // with plugin options
        $("#input-id").fileinput({ 'showUpload': false, 'previewFileType': 'any' });
    </script>
    <!-- FONT AWESOME THEME -->
    <!-- load the JS files in the right order -->
    <script src="../js/fileinput.js"></script>
    <script src="../themes/fa/theme.js"></script>

    <div class="file-loading">
        <input id="input-fa" name="input-fa[]" type="file" multiple="multiple" />
    </div>
    <script>
        $("#input-fa").fileinput({
            theme: "fa",
            uploadUrl: "/file-upload-batch/2"
        });
    </script>
    <%--  <asp:GridView ID="GridView1" runat="server" />
    <asp:Button ID="ExportToExcel" runat="server" Text="Export To Excel" OnClick="ExportToExcel_Click" />--%>

    <%--API AIzaSyBtRrcB6xaisxWCNewmMrhcBKRYWy1WcjA--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>
