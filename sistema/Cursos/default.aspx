<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="admin_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("admin.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-medkit"></i>&nbsp;Cursos buenas prácticas
            </h3>
            <hr />
        </div>
    </div>

    <div class="card card-block">
        <a href="Captura.aspx" id="personas_bitaseg" runat="server" >
            <h4><i style="width: 30px;" class="fa fa-pencil-square-o"></i>&nbsp;Captura</h4>
        </a>
        <a href="Descarga.aspx" id="usuarios_bitaseg" runat="server">
            <h4><i style="width: 30px;"  class="fa fa-download"></i>&nbsp;Descarga</h4>
        </a>
       
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

