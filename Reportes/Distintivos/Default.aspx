<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Reportes_Distintivos_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("reportes_distintivo.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
       <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-gear"></i>&nbsp;Reportes
            </h3>
            <hr />
        </div>
    </div>
    <br />

    <div class="card card-block">
        <a href="Reporteador.aspx" id="reportedor" runat="server" >
            <h4><i style="width: 30px;" class="fa fa-file-alt"></i>Reporteador</h4>
        </a>
         <a href="Reporte_escuelas.aspx" id="reporte_escuelas" runat="server" >
            <h4><i style="width: 30px;" class="fa fa-file-alt"></i>Reporte Escuelas</h4>
        </a>
         
      <a href="Captura_Escuelas.aspx" id="captura_escuelas" runat="server" >
            <h4><i style="width: 30px;" class="fa fa-pencil"></i>Captura de Escuelas</h4>
        </a>
         <a href="Reporteador_comedor.aspx" id="A1" runat="server" >
            <h4><i style="width: 30px;" class="fa fa-file-alt"></i>Reporte Comedores</h4>
        </a>
    </div>
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

