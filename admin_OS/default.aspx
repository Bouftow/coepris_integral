<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="admin_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
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
        <a href="persona-lista.aspx">
            <h4><i style="width: 30px;" class="fa fa-male"></i>&nbsp;Personas</h4>
        </a>
        <a href="usuario-lista.aspx">
            <h4><i style="width: 30px;" class="fa fa-users"></i>&nbsp;Usuarios del sistema</h4>
        </a>
        <a href="../Dctmatm/verif-lista.aspx">
            <h4><i style="width: 30px;" class="fa fa-check-square"></i>&nbsp;Validar Verificadores</h4>
        </a>
        <a href="../Inf_Fune/Cat-dec-lista.aspx">
            <h4><i style="width: 30px;" class="fa fa-clipboard"></i>&nbsp;Editar Catalogos de Decesos</h4>
        </a>
         
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

