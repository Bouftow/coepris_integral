<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="persona-lista.aspx.cs" Inherits="admin_persona_lista" %>

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
            <h3 class="title"><i class="fa fa-male"></i>&nbsp;PERSONAS</h3>
            <hr />
            <a href="default.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <a class="btn btn-primary" href="persona-item.aspx?id=0"><i class="fa fa-user-plus"></i>&nbsp;Nueva persona</a>
        </div>
    </div>
    <br />
    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
    <div class="row">
        <div class="col-sm-12">

            <asp:UpdatePanel ID="panelLista" UpdateMode="Conditional" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="grdLista" EventName="RowCommand" />
                </Triggers>
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-10">
                            <div class="form-group">
                                <asp:TextBox ID="txtTextoBuscar" placeholder="Nombre a buscar" CssClass="form-control boxed" runat="server"></asp:TextBox>
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
                                        <a name="ancla_<%#Eval("id_persona") %>"></a>
                                        <a href="persona-item.aspx?id=<%#Eval("id_persona") %>" class="btn btn-secondary"><i class="fa fa-pencil"></i></a>
                                    </ItemTemplate>
                                    <HeaderTemplate><i class="fa fa-pencil"></i></HeaderTemplate>
                                    <ItemStyle CssClass="text-center" Width="20" />
                                    <HeaderStyle CssClass="text-center" Width="20" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#String.Format("{0}",Eval("curp")) %>
                                    </ItemTemplate>
                                    <HeaderTemplate>CURP</HeaderTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#String.Format("{0}",Eval("RFC")) %>
                                    </ItemTemplate>
                                    <HeaderTemplate>RFC</HeaderTemplate>
                                </asp:TemplateField>

                                

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#String.Format("{0} {1} {2} {3}", Eval("prefijo"), Eval("nombre"),Eval("paterno"), Eval("materno")) %>
                                    </ItemTemplate>
                                    <HeaderTemplate>Nombre</HeaderTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#String.Format("{0}",Eval("email")) %>
                                    </ItemTemplate>
                                    <HeaderTemplate>E-Mail</HeaderTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataTemplate>
                                <h1>No hay datos</h1>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

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
            if (e.keyCode == 13) { document.getElementById("<%=btnBuscar.ClientID%>").click(); }

        }
    </script>
</asp:Content>

