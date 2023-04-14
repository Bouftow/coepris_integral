<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="lsolucionar.aspx.cs" Inherits="_default" %>

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
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Solucionador de Problemas</h3>
                </div>
            </div>
            <div class="input-group" style="width: 20%">

                <asp:TextBox ID="txtTexto"  class="form-control" runat="server" AutoCompleteType= "None" onkeypress="handle(event)" ></asp:TextBox>
                <asp:Button ID="btntexto" runat="server" OnClick="Button1_Click" Text="Buscar" />

            </div>
            <div class="estil"> 

            <asp:GridView ID="grdNombreTramite"
                AutoGenerateColumns="false"
                runat="server" GridLines="None"
                CssClass="table table-bordered"
                PagerStyle-CssClass="pgr"
                AlternatingRowStyle-CssClass="alt"
                PageSize="7"
                Style="background: white;">

                <HeaderStyle
                    BackColor="#337ab7"
                    Font-Bold="True"
                    ForeColor="White" />
                <Columns>


                    <asp:BoundField
                        HeaderText="Tipo de Trámite"
                        DataField="nombre_tramite"
                        ItemStyle-Wrap="false" />

                </Columns>

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


                    <asp:TemplateField>
                        <ItemTemplate>

                            <button type="submit" class="">
                                <%#String.Format("<a class='btn' href= 'SolucionarProblemas.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                            </button>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--<asp:TemplateField>
                        <ItemTemplate>
                            <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                        </ItemTemplate>

                        <HeaderTemplate>Folio</HeaderTemplate>
                    </asp:TemplateField>--%>

                    <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" ItemStyle-Wrap="false" />
                    <asp:BoundField HeaderText="Estado" DataField="statos" ItemStyle-Wrap="false" />
                    <%--<asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />--%>
                    <asp:BoundField HeaderText="Curp del Solicitante" DataField="curp" ItemStyle-Wrap="false" />
                    <asp:BoundField HeaderText="RFC del Establecimiento" DataField="rfc" ItemStyle-Wrap="false" />
                    <asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                    <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />


                </Columns>

            </asp:GridView>
                </div>
            <div class=" input btn-success" style="width: 100%; padding-left: 40%; font-family: Arial; font-weight: 600;">Histórico de Estados Anteriores </div>
            
            <div class="estil"> 
                <asp:GridView ID="grdBusquedaActStatus" AutoGenerateColumns="false" runat="server" GridLines="None"
                CssClass="table table-bordered" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                PageSize="7" Style="background: white;">

                <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                <Columns>



<%--                    <asp:TemplateField>
                        <ItemTemplate>
                            <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                        </ItemTemplate>

                        <HeaderTemplate>Folio</HeaderTemplate>
                    </asp:TemplateField>--%>
                         <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" ItemStyle-Wrap="false" />
                    <asp:BoundField HeaderText="Estado" DataField="statos" ItemStyle-Wrap="false" />
                    <%--<asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />--%>
                    <asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                    <asp:BoundField HeaderText="Curp del Solicitante" DataField="curp" ItemStyle-Wrap="false" />
                    <asp:BoundField HeaderText="RFC del Establecimiento" DataField="rfc" ItemStyle-Wrap="false" />


                </Columns>

            </asp:GridView>

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
    <script>
    function handle(e){
        if(e.keyCode === 13){
            e.preventDefault(); // Ensure it is only this code that rusn

            //alert("Enter was pressed was presses");
            document.getElementById("<%=btntexto.ClientID%>").focus();
            document.getElementById("<%=btntexto.ClientID%>").click();
        }
    }
</script>
</asp:Content>

