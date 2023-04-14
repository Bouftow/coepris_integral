<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="sistema_reportes_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
       <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("reportes.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-print"></i>&nbsp;REPORTES</h3>
            <hr />
        </div>
    </div>
    <div class='row'>
                 <%--<%= String.Format("{0}", mostrar_reporte() ) %>--%>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='avisos' class='btn btn-primary btn-lg btn-block' style="text-align:center;"><i class='fa fa-file-text'></i>&nbsp;Captura de Avisos de Funcionamiento</a>
            </div>
        </div>
        <%--<div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-certificados-coordinacion.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;N&uacute;mero de Certificados por Coordinaci&oacute;n</a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='coordinacion-usuarios-total-tramites.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;N&uacute;mero de certificados por usuario</a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-Financieros.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Financieros</a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-tiempos.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Tiempos</a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-tiempos2.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Tiempos Empresas</a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-sol-coord-lab.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Solicitudes por Coord y Laboratorio </a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-Certificados-Cancelados.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Certificados Cancelados </a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt_Certificados_Reciclados.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Certificados Reutilizados </a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='certificados-vencidos.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Certificados Vencidos</a>
            </div>
        </div>
        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-Folios-UySU.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Reporte de Certificados Disponibles</a>
            </div>
        </div>
         <div class='col-sm-6'>
            <div class='form-group'>
                <a href='rpt-BusquedaFolio.aspx' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Busqueda de Folios</a>
            </div>
        </div>

        <div class='col-sm-6'>
            <div class='form-group'>
                <a href='https://coepristam.saludtamaulipas.net/Reportes/Gestor/' class='btn btn-primary btn-lg btn-block' style="text-align:left;"><i class='fa fa-file-text'></i>&nbsp;Servicios de Control de Plagas Urbanas <sup class="text-warning">Nuevo!</sup></a>
            </div>
        </div>--%>

    </div>
    <br />
    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

