<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Val-Verif.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <div class="card-block card">
        <h1 class="g" style="font-family:3ds; text-align:left">Validación de Verificadores</h1> 
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">


                </div>
            </div>
        </div>

     </div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
     
</asp:Content>

