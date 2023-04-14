<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="loficom_sl.aspx.cs" Inherits="_default" %>

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
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>

    <div class="card-block ">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Oficina del Comisionado</h3>
                </div>
                <ul class="nav nav-tabs pull-right" role="tablist">
                    <li class="nav-item"><a class="nav-link active" href="#Recibidos" role="tab" data-toggle="tab"><span runat="server" id="contadorCORR"></span></a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Evaluados" role="tab" data-toggle="tab">Entregados</a> </li>

                </ul>
            </div>

            <div class="card-block  card">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active fade in" id="Recibidos">

                        <label>Recibidos</label>
                        <div class="row estil ">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                                </Triggers>
                                <ContentTemplate>

                                    <asp:GridView ID="grdCORR"
                                        AutoGenerateColumns="false"
                                        runat="server"
                                        GridLines="None"
                                        CssClass="table table-bordered"
                                        PagerStyle-CssClass="pgr"
                                        AlternatingRowStyle-CssClass="alt"
                                        PageSize="7"
                                        Style="background: white;">
                                        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                             <asp:TemplateField >
                                                <ItemTemplate>


                                                      <button type="submit" class="Editar"
                                                        onclick='javascript:location.href = ("VerDatos.aspx?id=<%# Eval("folio") %>")'>
                                                        <a class="btn">Ver Datos</a></button>



                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                                        </Columns>
                                    </asp:GridView>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                    </div>
                    <div role="tabpanel" class="tab-pane fade in" id="Evaluados">
                        <label>Entregados</label>

                        <div class="row estil">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                                </Triggers>
                                <ContentTemplate>


                                    <asp:GridView ID="grdCORRH"
                                        AutoGenerateColumns="false"
                                        runat="server"
                                        GridLines="None"
                                        CssClass="table table-bordered"
                                        PagerStyle-CssClass="pgr"
                                        AlternatingRowStyle-CssClass="alt"
                                        PageSize="7"
                                        Style="background: white;">


                                        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                              <asp:TemplateField >
                                                <ItemTemplate>


                                                      <button type="submit" class="Editar"
                                                        onclick='javascript:location.href = ("VerDatos.aspx?id=<%# Eval("folio") %>")'>
                                                        <a class="btn">Ver Datos</a></button>



                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                                            <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                                            <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />


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

