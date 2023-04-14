<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">

    <%=Usuarios.ElegirSubSistema(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%--  <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>--%>
</asp:Content>

<%--<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    W
    <div class="row">
            <div class="col-sm-4">
                <div class="card sameheight-item stats" data-exclude="xs">
                    <div class="card-block">
                        <div class="title-block">
                            <h4 class="title">Acceso Rápido</h4>
                        </div>
                        <div class="row row-sm stats-container">
                            <a href="registro/seleccionar-unidad.aspx">
                                <h4><i class="fa fa-pencil"></i>&nbsp;Registrar Actividad</h4>
                            </a>
                            <a href="#">
                                <h4><i class="fa fa-list"></i>&nbsp;Ver Registro</h4>
                            </a>
                            <a href="mensajes">
                                <h4><i class="fa fa-envelope"></i>&nbsp;Ver mis Mensajes</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="card sameheight-item" data-exclude="xs">
                    <div class="card-header card-header-sm bordered">
                        <div class="header-block">
                            <h3 class="title">Datos Gráficos</h3>
                        </div>
                        <ul class="nav nav-tabs pull-right" role="tablist">
                            <li class="nav-item"><a class="nav-link active" href="#visits" role="tab" data-toggle="tab">Líneas</a> </li>
                            <li class="nav-item"><a class="nav-link" href="#downloads" role="tab" data-toggle="tab">Pastel</a> </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active fade in" id="visits">
                                <p class="title-description">Últimos 15 días </p>
                                <div id="line-chart"></div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="downloads">
                                <p class="title-description">Últimos 15 días </p>
                                <div id="pie-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>

                
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="msg" class="pull-right"></div>
            </div>
        </div>
    <br />
    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
   <%-- <script type="text/javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>--%>
    <%--    <div class="row">
        <asp:LinkButton ID="btnGrabar" CssClass="btn btn-primary"  runat="server"><i class="fa fa-floppy-o"></i>&nbsp;Grabar</asp:LinkButton>
    </div>
    <br />--%>
    <%--<div class="card-block card">--%>
    <%--                                                                                 <div style="text-align:center">
                                                                                        <img src="img/Coepris.png" />
                                                                                        </div>--%>
    <%--</div>--%>
    <br />


    <div class="row">
        <div class="col" style="margin-bottom:10px">
            <a runat="server" id="bs" href="lcaptura.aspx" class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-calendar-check">&nbsp</i>Bitácora de Seguimiento</a></div>

        <div class="col" style="margin-bottom:10px">
            <a runat="server" id="sima" href="https://sst.tamaulipas.gob.mx/coepris/sistema/sicam/" class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-droplet">&nbsp</i>SIMA</a><br />
        </div>
       
        <div class="col" style="margin-bottom:10px">
            <a runat="server" id="gestor" href="https://sst.tamaulipas.gob.mx/coepris/sistema/"  class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-folder-tree">&nbsp</i>Sistema Gestor</a></div>

      <%--   <div class="col" style="margin-bottom:10px">
            <a runat="server" id="avisos" href="sistema/avisos/default.aspx"  class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-file-signature">&nbsp</i>Av. de Funcionamiento</a></div>--%>

         <div class="col" style="margin-bottom:10px">
            <a runat="server" id="Distintivos" href="Distintivo/"  class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-sheet-plastic">&nbsp</i>Distintivos</a></div>

         <div class="col" style="margin-bottom:10px">
            <a runat="server" id="comedores" href="ComedoresEscolares/"  class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-utensils">&nbsp</i>Comedores Escolares</a></div>

         <div class="col" style="margin-bottom:10px">
            <a runat="server" id="a1" href="#/"  class="btn_4t" style="width: 100%; min-width: 325px; text-align: justify">&nbsp<i class="fa-solid fa-circle">&nbsp</i>Deshabilitado</a></div>


    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>

