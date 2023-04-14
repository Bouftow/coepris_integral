<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Reporte_Memo.aspx.cs" Inherits="Reportes_Reporte_Memo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
        <style>
        .estil {
            overflow-y: scroll;
            height: 500px;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("reporte_memo.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>

    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Unidad de Evaluación y Autorización Sanitaria</h3>
                </div>

            </div>

            <div class="card-block">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active fade show" id="Recibidos">

                        <%--<label>Recibidos para Evaluar</label>--%>
                        <div class="row estil ">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                                </Triggers>
                                <ContentTemplate>
                                    <asp:GridView ID="grdUEAS" 
                                        AutoGenerateColumns="false"
                                        runat="server"
                                        CssClass="table table-bordered" 
                                        PageSize="1">
                                        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Modalidad" DataField="Modalidad" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Nombre del Establecimiento" DataField="Nombre_Establecimiento" ItemStyle-HorizontalAlign="Center"  />
                                            <asp:BoundField HeaderText="Domicilio" DataField="Domicilio_Completo" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Requisitos" DataField="Requisitos" ItemStyle-HorizontalAlign="Justify"  ItemStyle-Wrap="false"/>
                                            
                                               <%--    <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ListBox ID="ListBox1" runat="server" BackColor="#FF99FF" ForeColor="Black" Height="205px" Width="260px"></asp:ListBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>







    <p style="visibility: hidden">
        <asp:TextBox ID="cis" runat="server" />
        <asp:TextBox ID="ueas" runat="server" />
        <asp:TextBox ID="coor" runat="server" />
        <asp:TextBox ID="uos" runat="server" />
        <asp:TextBox ID="dictaminador" runat="server" />
        <asp:TextBox ID="dos" runat="server" />
        <asp:TextBox ID="dds" runat="server" />
        <asp:TextBox ID="deas" runat="server" />
        <asp:TextBox ID="das" runat="server" />
        <asp:TextBox ID="corr" runat="server" />
        <asp:TextBox ID="rech" runat="server" />
        <asp:TextBox ID="entr" runat="server" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>

