<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="usuario-unidad-salud.aspx.cs" Inherits="admin_usuario_unidad_salud" %>
<%@ Import Namespace="Salud.Tamaulipas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
    <style type="text/css">
        input[type=checkbox]
        {
          /* Double-sized Checkboxes */
          -ms-transform: scale(2); /* IE */
          -moz-transform: scale(2); /* FF */
          -webkit-transform: scale(2); /* Safari and Chrome */
          -o-transform: scale(2); /* Opera */
          padding: 10px;
        }
         input[type=radio] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            padding: 10px;
        }
        .test {
            font-size:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class='fa fa-sitemap'></i>&nbsp;UNIDADES DE SALUD DEL USUARIO: <%=String.Format("{0}", new EncryptDecrypt().Decrypt(Request.Params["id"].Trim())) %></h3>
            <hr />
            <a href="usuario-lista.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <asp:LinkButton ID="btnGrabar" OnClick="btnGrabar_Click"  CssClass="btn btn-primary" ValidationGroup="GrabarUsuario" runat="server"><i class="fa fa-save"></i>&nbsp;Grabar</asp:LinkButton>
        </div>
    </div>
    <br />
    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
    <div class="card card-block">
        <asp:GridView ID="grdCoordinaciones" OnRowDataBound="grdCoordinaciones_RowDataBound"  Width="100%" AutoGenerateColumns="false" DataKeyNames="id_unidad_salud" CssClass="table table-hover" CellSpacing="-1" GridLines="None" runat="server">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate><%# Eval("clues") %></ItemTemplate>
                    <HeaderTemplate>#</HeaderTemplate>
                    <ItemStyle CssClass="text-center" Width="30" />
                    <HeaderStyle CssClass="text-center" Width="30" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate><%#Eval("nombre_unidad")%></ItemTemplate>
                    <HeaderTemplate>Unidad de Salud</HeaderTemplate>
                    <ItemStyle CssClass="text-left" />
                    <HeaderStyle CssClass="text-center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSucursalActivar" Checked='<%#Eval("activar") %>' runat="server" />
                    </ItemTemplate>
                    <HeaderTemplate>Activar</HeaderTemplate>
                    <ItemStyle CssClass="text-center" />
                    <HeaderStyle CssClass="text-center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:RadioButton ID="optSucursalEstablecer" Enabled='<%#Eval("activar") %>' Checked='<%#Eval("establecer") %>' GroupName="Seleccionar" onclick="RadioCheck(this);" runat="server" />
                    </ItemTemplate>
                    <HeaderTemplate>Establecer</HeaderTemplate>
                    <ItemStyle CssClass="text-center" />
                    <HeaderStyle CssClass="text-center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            if (!args.get_isPartialLoad()) { $addHandler(document, "keydown", onKeyDown); }
        }

        function onKeyDown(e) {
            if (e && e.keyCode == Sys.UI.Key.esc) {
               
            }
        }

        function RadioCheck(rb) {
            var gv = document.getElementById("<%=grdCoordinaciones.ClientID%>");
            var rbs = gv.getElementsByTagName("input");

            for (var i = 0; i < rbs.length; i++) {
                if (rbs[i].type == "radio") {
                    if (rbs[i].checked && rbs[i] != rb) {
                        rbs[i].checked = false;
                        break;
                    }
                }
            }
        }

        function EnableOption(chk,opt) {
            var objChk = document.getElementById(chk);
            var objOpt = document.getElementById(opt);
            objOpt.disabled = !objChk.checked;
            objOpt.checked = objChk.cheked;
        }
    </script>
</asp:Content>

