<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="lbusqueda.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
   
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("busqueda.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Búsqueda</h3>
                </div>
            </div>
            <br />
            <div class="select container-fluid">


                <div class="row">
                    <div class="col-sm-3">
                        Modalidad:
                        <asp:DropDownList ID="ddlCategorias" Width="100%" runat="server" DataSourceID="SqlDataSource2" DataTextField="modalidad" DataValueField="siglas"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select distinct (CASE modalidad WHEN  1 THEN 'NI' WHEN  2 THEN 'RE' WHEN  3 THEN 'BA' WHEN  4 THEN 'MO' ELSE '' END ) as siglas, (CASE modalidad WHEN  1 THEN 'Nuevo Ingreso' WHEN  2 THEN 'Revalidación' WHEN  3 THEN 'Baja' WHEN  4 THEN 'Modificación' ELSE '' END ) as modalidad FROM bitaseg.Lista_Tramites2"></asp:SqlDataSource>
                    </div>


                    <div class="col-sm-9">
                        Tipo de trámite:
                    <asp:DropDownList ID="ddlTramites" Width="100%" runat="server" DataSourceID="SqlDataSource3" DataTextField="nombre_tramite" DataValueField="siglas"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select distinct nombre_tramite, siglas FROM bitaseg.Lista_Tramites2 "></asp:SqlDataSource>
                </div>
                    </div>

            </div>
            <div class="input-group row ">
                <div class="col-sm-3" style="padding-top:6px">
                    <asp:TextBox ID="txtTexto" placeholder="Últimos 5 dígitos" class="form-control" runat="server" onkeypress="handle(event)" autocomplete="off"></asp:TextBox>
                </div>
                <div class="col-sm-3" style="padding-top:6px">
                    <asp:TextBox ID="txtfecha" placeholder="Fecha de Ingreso" class="form-control" runat="server" onkeypress="handle(event)" autocomplete="off"></asp:TextBox>
                </div>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtfecha"
                    Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                <div class="select col-sm-6">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre_coordinacion" DataValueField="id_coordinacion"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select id_coordinacion, nombre_coordinacion FROM bitaseg.Coordinaciones where not id_coordinacion=87"></asp:SqlDataSource>


                </div>
            </div>


       
            <div class="input-group" style="width: 20%">
                <asp:Button ID="btntexto" runat="server" OnClick="Button1_Click" Text="Búsqueda" />
            </div>

            <div class="estil">

                <asp:GridView ID="grdNombreTramite"
                    AutoGenerateColumns="false"
                    runat="server" GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr" OnRowCommand="grdNombreTramite_RowCommand"
                    AlternatingRowStyle-CssClass="alt" OnSelectedIndexChanged="grdNombreTramite_SelectedIndexChanged"
                    PageSize="7" DataKeyNames="folio"
                    Style="background: white;">

                    <HeaderStyle
                        BackColor="#337ab7"
                        Font-Bold="True"
                        ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgSeleccion" runat="server"
                                    CommandName="Select" ImageUrl="~/img/eye.png"
                                    CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField
                            HeaderText="Tipo de Trámite"
                            DataField="nombre_tramite"
                            ItemStyle-Wrap="false" />

                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </div>
            <div class="input btn-success" style="width: 100%; padding-left: 42%; font-family: Arial; font-weight: 600;">Estado Actual del trámite </div>

            <div class="estil">
                <asp:GridView ID="grdBusquedaActual"
                    AutoGenerateColumns="false"
                    runat="server" GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">

                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>



                        <%--           <asp:TemplateField>
                        <ItemTemplate>


                            <button type="submit" class="Editar"
                                onclick='javascript:location.href = ("VerDatos.aspx?id=<%# Eval("folio") %>")'>
                                <a class="btn">Ver Datos</a></button>


                        </ItemTemplate>

                    </asp:TemplateField>


                        --%>
                        <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Estado" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="%" DataField="porcentaje" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Curp del Solicitante" DataField="curp" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="RFC del Establecimiento" DataField="rfc" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>

        </div>
    </div>







    <p style="visibility: hidden">
        <asp:Label ID="riesgo" runat="server"></asp:Label>
        <asp:Label ID="verificacion" runat="server"></asp:Label>
        <asp:Label ID="modalidad" runat="server"></asp:Label>
        <asp:Label ID="id_tramite" runat="server"></asp:Label>
        <asp:Label ID="categoriareal" runat="server"></asp:Label>
        <asp:HiddenField ID="categoria" runat="server" />
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function handle(e) {
            if (e.keyCode === 13) {
                e.preventDefault(); // Ensure it is only this code that rusn

                //alert("Enter was pressed was presses");
                document.getElementById("<%=btntexto.ClientID%>").focus();
            document.getElementById("<%=btntexto.ClientID%>").click();
            }
        }
    </script>
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>

</asp:Content>

