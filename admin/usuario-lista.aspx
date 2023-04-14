<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="usuario-lista.aspx.cs" Inherits="admin_usuario_lista" %>
<%@ Import Namespace="Salud.Tamaulipas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-users"></i>&nbsp;USUARIOS DEL SISTEMA</h3>
            <hr />
            <a href="default.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <a class="btn btn-primary" href="usuario-item.aspx?id=<%=Server.UrlEncode("ti0i8u6Oh+l2RKo9llO2UQ==") %>"><i class="fa fa-plus"></i>&nbsp;Nuevo usuario</a>
        </div>
    </div>



    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>

    <br />
    <asp:UpdatePanel ID="panelLista" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="grdLista" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
        </Triggers>
        <ContentTemplate>

            <div class="row">
                <div class="col-sm-10">
                    <div class="form-group">
                        <asp:TextBox ID="txtTextoBuscar" placeholder="Login, nombre..." CssClass="form-control boxed" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="col-sm-2">
                    <asp:LinkButton ID="btnBuscar" OnClick="btnBuscar_Click" CssClass="btn btn-primary btn-block" runat="server">Buscar&nbsp;<i class="fa fa-search"></i></asp:LinkButton>
                </div>

            </div>

            <div class="card items">
                <asp:GridView ID="grdLista" HeaderStyle-CssClass="thead-inverse" CssClass="table table-hover " AutoGenerateColumns="false" CellSpacing="-1" GridLines="None" runat="server">
                    <Columns>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <%#String.Format("{0}",Eval("user_login").ToString()=="admin"?"":String.Format("<a href=\"usuario-item.aspx?id={0}\" class='btn btn-secondary btn-sm'><i class='fa fa-pencil'></i></a>",Server.UrlEncode(new EncryptDecrypt().Encrypt(Eval("user_login").ToString())))) %>
                            </ItemTemplate>
                            <HeaderTemplate><i class="fa fa-pencil"></i></HeaderTemplate>
                            <ItemStyle CssClass="text-center" Width="20" />
                            <HeaderStyle CssClass="text-center" Width="20" />
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="#" class="btn btn-secondary btn-sm abrir-modal-pwd <%#String.Format("{0}",Eval("user_login").ToString()=="admin"?"hidden":"") %>" data-toggle="modal" data-id="<%#Eval("user_login") %>" data-target="#modal-pwd"><i class="fa fa-key"></i></a>
                            </ItemTemplate>
                            <HeaderTemplate><i class="fa fa-key"></i></HeaderTemplate>
                            <HeaderStyle CssClass="text-center" Width="20" />
                            <ItemStyle CssClass="text-center" Width="20" />
                        </asp:TemplateField>

                     <%--   <asp:TemplateField>
                            <ItemTemplate>
                                <%#String.Format("{0}",Eval("user_login").ToString()=="admin"?"":String.Format("<a href=\"usuario-unidad-salud.aspx?id={0}\" class='btn btn-secondary btn-sm'><i class='fa fa-sitemap'></i></a>",Server.UrlEncode(new EncryptDecrypt().Encrypt(Eval("user_login").ToString())))) %>
                            </ItemTemplate>
                            <HeaderTemplate><i class="fa fa-sitemap"></i></HeaderTemplate>
                            <ItemStyle CssClass="text-center" Width="20" />
                            <HeaderStyle CssClass="text-center" Width="20" />
                        </asp:TemplateField>--%>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <%#String.Format("{0}",Eval("user_login")) %>
                            </ItemTemplate>
                            <HeaderTemplate>Login</HeaderTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                            <%#String.Format("<strong>{0}</strong>", Eval("user_login").ToString()=="admin"?"******":String.Format("{0}{1}",Eval("nombre_usuario"),Eval("iniciales").ToString()!=""?String.Format("&nbsp;<small style='color:blue;'>({0})</small>",Eval("iniciales")):"")) %><br />
                            <%--<%#String.Format("{0}",Eval("nombre_coordinacion").ToString()!=""?String.Format("<br /><small>COORD:&nbsp;{0}</small>",Eval("nombre_coordinacion")):String.Format("<br /><small>COORD:&nbsp;<span style='color:red;'>NO ESPECIFICADO</span></small>")) %>--%>
                         <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}{1}{2}{3}</p></blockquote>",
                            String.Format("{0}",Convert.ToBoolean(Eval("activo"))?"<kbd style='background-color:green; color:white;'>Activo</kbd>":"<kbd style='background-color:red; color:white;'>Desactivado</kbd>"),
                            String.Format("{0}",Convert.ToBoolean(Eval("administrar"))?" <kbd style='background-color:blue; color:white;'>Administrar Usuarios</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("solucionar"))?" <kbd style='background-color:cyan; color:black;'>Solucionador</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("requisitos"))?" <kbd style='background-color:gray; color:white;'>Requisitos</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("monitoreo"))?" <kbd style='background-color:cyan; color:black;'>Monitoreo</kbd>":"")
                            )%>
                               
                           <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}{1}{2}</p></blockquote>",
                            String.Format("{0}",Convert.ToBoolean(Eval("bitacora"))?" <kbd>Admin</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("captura"))?" <kbd>Capturar</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("busqueda"))?" <kbd>Busqueda</kbd>":"")
                            )%>
                             
                                 <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}{1}{2}</p></blockquote>",
                            String.Format("{0}",Convert.ToBoolean(Eval("entregados"))?"<kbd style='background-color:#B233FF; color:white;'>Entregados</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("rechazados"))?" <kbd style='background-color:red; color:white;'>Rechazados</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("finalizados"))?" <kbd style='background-color:green; color:white;'>Finalizados</kbd>":"")
                            )%>
                                                                                             
                                <%--<%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}{1}{2}{3}{4}{5}{6}{7}</p></blockquote>",String.Format("{0}",Convert.ToBoolean(Eval("activo"))?"<kbd style='background-color:green; color:white;'>Activado</kbd>":"<kbd style='background-color:red; color:white;'>Desactivado</kbd>"),String.Format("{0}",Convert.ToBoolean(Eval("administrar"))?" <kbd style='background-color:blue; color:white;'>Administrar</kbd>":""),String.Format("{0}",Convert.ToBoolean(Eval("reportes"))?" <kbd>Reportes</kbd>":""),String.Format("{0}",Convert.ToBoolean(Eval("registro"))?" <kbd>Registro</kbd>":""),String.Format("{0}",Convert.ToBoolean(Eval("banco_sangre"))?" <kbd>Banco de Sangre</kbd>":""),String.Format("{0}",Convert.ToBoolean(Eval("hemodialisis"))?" <kbd>Hemodiálisis</kbd>":""),String.Format("{0}",Convert.ToBoolean(Eval("mensajes"))?" <kbd>Mensajería</kbd>":"")) %>--%>


                            <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}</p></blockquote>",
                            String.Format("{0}",Convert.ToBoolean(Eval("cis"))?"<kbd>CIS</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("uos"))?" <kbd>UOS</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("dictaminador"))?" <kbd>Dictaminador</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("dds"))?" <kbd>DDS</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("dos"))?" <kbd>DOS</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("deas"))?" <kbd>DEAS</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("das"))?" <kbd>DAS</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("coordinacion"))?" <kbd>Coordinacion</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("correspondencia"))?" <kbd>Correspondencia</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("ueas"))?" <kbd>UEAS</kbd>":"")                           
                            )%>
                             <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}</p></blockquote>",
                         String.Format("{0}",Convert.ToBoolean(Eval("oficom"))?" <kbd>Oficina del Comisionado</kbd>":"")                             
                            )%>

                                   <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}</p></blockquote>",
                            String.Format("{0}",Convert.ToBoolean(Eval("cis_sl"))?"<kbd>CIS*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("uos_sl"))?" <kbd>UOS*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("dictaminador_sl"))?" <kbd>Dictaminador*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("dds_sl"))?" <kbd>DDS*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("dos_sl"))?" <kbd>DOS*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("deas_sl"))?" <kbd>DEAS*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("das_sl"))?" <kbd>DAS*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("coordinacion_sl"))?" <kbd>Coordinacion*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("correspondencia_sl"))?" <kbd>Correspondencia*</kbd>":""),
                            String.Format("{0}",Convert.ToBoolean(Eval("ueas_sl"))?" <kbd>UEAS*</kbd>":"")                           
                            )%>
                        
                         <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}</p></blockquote>",
                         String.Format("{0}",Convert.ToBoolean(Eval("oficom_sl"))?" <kbd>Oficina del Comisionado*</kbd>":"")                             
                            )%>

                                 <%#String.Format("<blockquote><p style='font-size:10pt; line-height: 180%;'>{0}</p></blockquote>",
                         String.Format("{0}",Convert.ToBoolean(Eval("acver"))?" <kbd>Actas de Verificación</kbd>":"")                             
                            )%>
                            </ItemTemplate>
                            <HeaderTemplate>Información General</HeaderTemplate>
                            <HeaderStyle CssClass="text-left" />
                            <ItemStyle CssClass="text-left" />
                        </asp:TemplateField>

                    </Columns>
                    <EmptyDataTemplate>
                        <h3>No se encontraron registros</h3>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade" id="modal-pwd">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title"><span id="modalTitle"></span></h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="valUserLogin" id="valUserLogin" />
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Contraseña nueva:</label>
                                <input type="password" name="txtNewUserPassword" class="form-control" id="txtNewUserPassword" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Repetir contraseña nueva:</label>
                                <input type="password" name="txtReNewUserPassword" class="form-control" id="txtReNewUserPassword" value="" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" onclick="SetPwd();" class="btn btn-primary">Guardar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            if (!args.get_isPartialLoad()) { $addHandler(document, "keydown", onKeyDown); }
        }
        function onKeyDown(e) {
            if (e && e.keyCode == Sys.UI.Key.esc) {
                $('#modal-pwd').modal('hide');
            }
            if (e.keyCode == 13) { document.getElementById("<%=btnBuscar.ClientID%>").click(); }

        }
        $(document).on("click", ".abrir-modal-pwd", function () {
            var userLogin = $(this).data('id');
            $(".modal-body #valUserLogin").val(userLogin);
            $(".modal-header #modalTitle").html("<i class='fa fa-key'></i>&nbsp;Cambiar contraseña de: " + userLogin);
            $('.modal-body #txtNewUserPassword').val("");
            $('.modal-body #txtReNewUserPassword').val("");
        });

        function SetPwd() {
            var userPwd = $('.modal-body #txtNewUserPassword').val();
            var newUserPwd = $('.modal-body #txtReNewUserPassword').val();
            if (userPwd == '') {
                alert('Debe indicar una contraseña');
                return;
            }
            if (userPwd.localeCompare(newUserPwd)==-1) {
                alert('Error al repetir contraseña');
                return;
            }
            $.ajax({
                type: "POST",
                url: "usuario-lista.aspx/SetPwd",
                data: "{userLogin: '" + $('.modal-body #valUserLogin').val() + "', userPwd: '" + $('.modal-body #txtNewUserPassword').val() + "'}",
                contentType:
                "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    alert('Contraseña actualizada satisfactoriamente');
                    if (msg.d == 'ok') { $('#modal-pwd').modal('hide');  }
                }
            });

        }
    </script>


</asp:Content>

