<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="admin_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("admin.default.-1"),this.Page) %>
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
        <a href="persona-lista.aspx" id="personas_bitaseg" runat="server" >
            <h4><i style="width: 30px;" class="fa fa-male"></i>&nbsp;Personas</h4>
        </a>
        <a href="usuario-lista.aspx" id="usuarios_bitaseg" runat="server">
            <h4><i style="width: 30px;"  class="fa fa-users"></i>&nbsp;Usuarios del sistema</h4>
        </a>
        <%-- <a href="../Cntbldd/Gsln/Gsln.aspx" id="reportegas" runat="server">
            <h4><i style="width: 30px;" class="fa fa-car"></i>&nbsp;Reporte Gasolina</h4>
        </a>
        <a href="../Cntbldd/Gsln/GslnCptr.aspx" id="capturagas" runat="server">
            <h4><i style="width: 30px;" class="fa fa-car"></i>&nbsp;Gasolina</h4>
        </a>
         <a href="../Cntbldd/Prvdrs/Prvdrs.aspx" id="reporteproveedores" runat="server">
            <h4><i style="width: 30px;" class="fa fa-sitemap"></i>&nbsp;Reporte Insumos</h4>
        </a>
        <a href="../Cntbldd/Prvdrs/PrvdrsCptr.aspx" id="capturaproveedores" runat="server">
            <h4><i style="width: 30px;" class="fa fa-sitemap"></i>&nbsp;Compras</h4>
        </a>
        <a href="../Cntbldd/Prvdrs/PrvdrsInfo.aspx" id="infoprov" runat="server">
            <h4><i style="width: 30px;" class="fa fa-edit "></i>&nbsp;Información de Proveedores</h4>
        </a>
        <a href="../Cntbldd/Prvdrs/NewPrvdrs.aspx" id="newprov" runat="server">
            <h4><i style="width: 30px;" class="fa fa-edit "></i>&nbsp;Capturar Proveedores solo Admin</h4>
        </a>--%>
        <a runat="server" id="a"></a>
        <a runat="server" id="b"></a>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

