<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Distintivo_admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("distintivo_admin.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-gear"></i>&nbsp;ADMINISTRAR
            </h3>
            <hr />
        </div>
    </div>
    <br />
    <div class="card card-block">
        <a href="usuario-lista.aspx" id="usuarios_bitaseg" runat="server">
            <h4><i style="width: 30px;"  class="fa fa-users"></i>&nbsp;Usuarios del sistema</h4>
        </a>
        
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

