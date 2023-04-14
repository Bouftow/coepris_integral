<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="lrechazados.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">

    <link href="css/sitio.css" rel="stylesheet" />
    <style>
        .estil {
            overflow-y: scroll;
            height: 500px;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
        }

        .rbl input[type="radio"] {
            margin-left: 30px;
            margin-right: 1px;
        }


        .oro {
            text-align: center
        }
       
     .hidden
     {
         display:none;
     }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <%--<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>--%>


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Rechazados</h3>


                </div>
            </div>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" CssClass="rbl" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                <asp:ListItem Selected="True" Value="1">Por Fecha de Registro</asp:ListItem>
                <asp:ListItem Value="2">Por Fecha de Rechazo</asp:ListItem>
            </asp:RadioButtonList>



            <div class="container">
                Seleccione rango de fechas del '
                <label runat="server" id="labelxd"></label>
                '
                  
                <div class="row justify-content-around">
                    <div class="col" id="Desde" runat="server">
                        <div style="padding-left: 100px">
                            <asp:TextBox ToolTip="Año/Mes/Día" CssClass="oro" ID="Fecha1" runat="server" Width="100px"></asp:TextBox></div>

                        <asp:Calendar ID="Calendar1" runat="server"
                            OnSelectionChanged="Selection_Change">
                            <SelectedDayStyle BackColor="#b0e5fb"
                                ForeColor="black"></SelectedDayStyle>
                        </asp:Calendar>
                    </div>
                    <div class="col" id="Hasta" runat="server">
                        <div style="padding-left: 100px">
                            <asp:TextBox ToolTip="Año/Mes/Día" CssClass="oro" ID="Fecha2" runat="server" Width="100px"></asp:TextBox></div>
                        <asp:Calendar ID="Calendar2" runat="server"
                            OnSelectionChanged="Selection_Change2">
                            <SelectedDayStyle BackColor="#b0e5fb"
                                ForeColor="black"></SelectedDayStyle>
                        </asp:Calendar>
                    </div>
                </div>

            </div>
            <br />
            <div class="row ">
                <div class="col-2">
                    <label runat="server" id="r1"></label>
                    <asp:Button ID="Buttona" Text="Buscar" runat="server" class="boton-azo" OnClick="Button_Click" />
                    <br />

                    <asp:Button ID="ExportToExcel" runat="server" class="dr" Text="Descargar Reporte" OnClick="ExportToExcel_Click" />
                   <%-- <asp:Button ID="Prueba" runat="server" class="dr" Text="Prueba" OnClick="Prueba_Click" />--%>
                </div>
            </div>
            <div runat="server" id="ocultar" class="card-block estil">
                <%--                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                    </Triggers>--%>
                <%--  <ContentTemplate>--%>

                <%--                <asp:button  runat="server" class="boton-azo" Text="Ver Datos" OnClick="Unnamed_Click"/>--%>


                <asp:GridView ID="grdCancelados"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    OnRowDataBound="grdCancelados_RowDataBound"
                    OnRowCommand="GridView1_RowCommand"
                    Style="background: white;">




                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                       <%-- <asp:TemplateField>
                            <ItemTemplate>


                               

                                <asp:Button ID="Button" Text='<%# Bind("folio") %>' runat="server" class="boton-azo" OnClick="Unnamed_Click" />

                            </ItemTemplate>
                            <HeaderTemplate>Ver Datos</HeaderTemplate>
                        </asp:TemplateField>--%>
                      <%--  <asp:TemplateField  HeaderText="Name" ItemStyle-Width="150">
                            <ItemTemplate >
                                <asp:TextBox  ID="txtName" runat="server" Text='<%# Eval("folio") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  class="boton-azo" Text="Ver Datos" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- <asp:TemplateField>--%>


                        <%--                                    <ItemTemplate>
                                        <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                                    </ItemTemplate>

                                    <HeaderTemplate>Folio</HeaderTemplate>
                                </asp:TemplateField>--%>
                        <asp:BoundField HeaderText="" DataField="folio" ItemStyle-Wrap="false" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"  />
                        <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />--%>
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Motivo Rechazo" DataField="rechazo" ItemStyle-Wrap="false" ItemStyle-BackColor="#ff464a" ItemStyle-ForeColor="White" />
                        <asp:BoundField HeaderText="Fecha de Rechazo" DataField="fecha_rechazo" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                        <%--   <asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />--%>


                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                    </Columns>

                </asp:GridView>

                <%-- </ContentTemplate>--%>
                <%--                </asp:UpdatePanel>--%>
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
        <asp:TextBox ID="folioval" runat="server" />
    </p>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>

