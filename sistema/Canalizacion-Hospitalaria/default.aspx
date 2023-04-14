<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="sistema_reportes_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-hospital-user"></i>&nbsp;Registro de Hospitales de la Coordinación <strong><asp:Label  ID="Coordinacion" runat="server"></asp:Label> </strong></h3>
            <hr />
        </div>
    </div>
    <div class='row'>
                 <%--<%= String.Format("{0}", mostrar_reporte() ) %>--%>
      <%--  <div class='col-sm-6'>
            <div class='form-group'>
                <a href='https://goo.gl/maps/8zBQgdyr8orUxYPY7' class='btn btn-primary btn-lg btn-block' style="text-align:center;"><i class='fa fa-hospital'></i>&nbsp;Hospital Regional de Alta Especialidad</a>
            </div>
        </div>--%>
      
    </div>
    <br />
    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&libraries=marker&v=beta" defer></script>
</asp:Content>

