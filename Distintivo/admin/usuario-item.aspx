<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="usuario-item.aspx.cs" Inherits="admin_usuario_item" %>

<%@ Import Namespace="Salud.Tamaulipas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style type="text/css">
        input[type=checkbox] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            padding: 10px;
        }

        .test {
            font-size: 5px;
        }
        .mydropdownlist {
          
            font-size: 20px;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("Distintivo_usuario_item.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><%=String.Format("{0}", new EncryptDecrypt().Decrypt(Request.Params["id"].Trim()) == "0"?"<i class='fa fa-plus'></i>&nbsp;NUEVO":"<i class='fa fa-pencil'></i>&nbsp;EDITAR") %>&nbsp;USUARIO</h3>
            <hr />
            <a href="usuario-lista.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <asp:LinkButton ID="btnGrabar" OnClick="btnGrabar_Click" CssClass="btn btn-primary" ValidationGroup="GrabarUsuario" runat="server"><i class="fa fa-save"></i>&nbsp;Grabar</asp:LinkButton>
        </div>
    </div>
    <br />
    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>

    <div class="card card-block">

        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label>Nombre de usuario:</label>
                    <asp:TextBox ID="txtUserLogin" CssClass="form-control boxed" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="panelAbrirBuscar" RenderMode="Inline" UpdateMode="Conditional" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAbrirBuscarUsuario" EventName="Click" />

            </Triggers>
            <ContentTemplate>
                <div class="row">
                    <div class="col-sm-6">
                        <label>Nombre de la persona:</label>
                        <div class="form-group input-group">
                            <asp:HiddenField ID="idPersona" runat="server" Value="0" />
                            <asp:Label ID="lblNombrePersona" CssClass="form-control boxed" runat="server" Text="Nombre responsable"></asp:Label>
                            <span class="input-group-addon">
                                <asp:LinkButton ID="btnAbrirBuscarUsuario" OnClick="btnAbrirBuscarUsuario_Click" runat="server"><i class="fa fa-search"></i></asp:LinkButton>
                            </span>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label>Iniciales:</label>
                            <asp:TextBox ID="txtIniciales" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="panel panel-default">

              <asp:DropDownList ID="ddlSubject" CssClass="mydropdownlist" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
            </asp:DropDownList>
            <br />
            <br />
          <%--  <asp:DropDownList ID="ddlSubject" runat="server" AppendDataBoundItems="true">
                <asp:ListItem Text="Seleccione Coordinacion" Value="0" />
            </asp:DropDownList>--%>

            <div class="panel-heading"><h2>Permisos Administrativos:</h2></div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chkActivo" Text="&nbsp;&nbsp;Activo" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chkMensajes" Text="&nbsp;&nbsp;Mensajes" runat="server" />
                        </div>
                    </div>
<%--                    <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chkNotificaciones" Text="&nbsp;&nbsp;Notificaciones" runat="server" />
                        </div>
                    </div>--%>
                <%--</div>
                <div class="row">--%>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chk_administrar" Text="&nbsp;&nbsp;Administrar Distintivo" runat="server" />
                        </div>
                    </div>
       <%--                  <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chkADH_Rpt" Text="&nbsp;&nbsp;Reportes" runat="server" />
                        </div>
                    </div>--%>
               <%--     <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chkADH_Reg" Text="&nbsp;&nbsp;Registro" runat="server" />
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading"><h2>Distintivo</h2></div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chk_reportes_distintivo" Text="&nbsp;&nbsp;Reportes Distintivo" runat="server" />
                        </div>
                    </div>
                    <%--<div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chk_dictaminador" Text="&nbsp;&nbsp;Dictaminador" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <asp:CheckBox ID="chk_dds" Text="&nbsp;&nbsp;DDS" runat="server" />
                        </div>

                    </div>--%>
                </div>

          

                </div>
           
     
            </div> 
        </div>  


   




    <a href="usuario-lista.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
    <asp:LinkButton ID="LinkButton2" OnClick="btnGrabar_Click" CssClass="btn btn-primary" ValidationGroup="GrabarUsuario" runat="server"><i class="fa fa-save"></i>&nbsp;Grabar</asp:LinkButton>
    <!--Inicia Modal para BuscarUsuario-->
    <asp:UpdatePanel ID="panelBuscarUsuario" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBuscarUsuarioCerrar0" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnModalBuscarUsuario" EventName="Click" />
        </Triggers>
        <ContentTemplate>

            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header ">
                        <asp:LinkButton ID="btnBuscarUsuarioCerrar0" OnClick="btnBuscarUsuarioCerrar0_Click" CssClass="close" runat="server">&times;</asp:LinkButton>
                        <h4 class="modal-title"><i class="fa fa-zoom"></i>&nbsp;Buscar empleado</h4>
                    </div>
                    <div class="modal-body" style="height: 300px; overflow-y: scroll;">
                        <div class="form-inline">
                            <div class="form-group input-group">
                                <asp:TextBox ID="txtNombreUsuario" CssClass="form-control" runat="server"></asp:TextBox>
                                <span class="input-group-addon">
                                    <asp:LinkButton ID="btnModalBuscarUsuario" OnClick="btnModalBuscarUsuario_Click" runat="server"><i class="fa fa-search"></i></asp:LinkButton>
                                </span>
                            </div>
                        </div>
                        <br />
                        <asp:GridView ID="grdUsuarios" OnRowCommand="grdUsuarios_RowCommand" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false" CellSpacing="-1" GridLines="None" runat="server">
                            <Columns>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#String.Format("{0} {1} {2}",Eval("nombre"),Eval("paterno"),Eval("materno")) %>
                                    </ItemTemplate>
                                    <HeaderTemplate>Nombre</HeaderTemplate>
                                    <ItemStyle CssClass="text-left" />
                                    <HeaderStyle CssClass="text-left" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnSelecionarUsuario" CssClass="btn btn-primary" CommandName="SeleccionarUsuario" CommandArgument='<%#String.Format("{0}|{1} {2} {3}",Eval("id_persona"),Eval("nombre"),Eval("paterno"),Eval("materno")) %>' runat="server"><i class="fa fa-plus"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderTemplate><i class="fa fa-plus"></i></HeaderTemplate>
                                    <ItemStyle CssClass="text-center" />
                                    <HeaderStyle CssClass="text-center" />
                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataTemplate>
                                <h1>No hay coincidencias</h1>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <asp:Literal ID="lblMsgBuscarUsuario" runat="server"></asp:Literal>
                    </div>

                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <ajaxToolkit:ModalPopupExtender runat="server"
        ID="modalBuscarUsuario"
        PopupControlID="panelBuscarUsuario"
        TargetControlID="lblModalBuscarUsuario"
        DropShadow="true">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Label ID="lblModalBuscarUsuario" runat="server" Text=""></asp:Label>
    <!-- Termina modal para BuscarUsuario-->

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script type="text/javascript">




</script>
</asp:Content>

