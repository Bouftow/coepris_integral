<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="Prvdrs.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">


    <style>
        .Ancho {
            width: 20000px;
        }

        select {
            text-align: center;
        }


        .chk label {
            padding-right: 20px;
            display: inline;
        }

        .chk2 label {
            margin-right: 34px;
            display: inline;
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

        .spaced input[type="radio"] {
            margin-right: 5px; /* Or any other value */
        }

        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">

    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <div class="card-block">
        <div class="tab-content">
            <div class="card-block card">
                <div class="card-header card-header-sm bordered">
                    <div class="row header-block">
                        <h4>Reportes de Insumos</h4>
                    </div>
                    <div class="row header-block col-sm-8">
                        <button runat="server" onserverclick="Unnamed_ServerClick" class="newbtn"><i class="fa fa-repeat"></i>Regresar</button>

                    </div>
                </div>

                <div class="card" runat="server">
                    <div class="select container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <h4>Ver Información de la Coordinación:</h4>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="DropDownList1" runat="server"
                                    DataSourceID="SqlDataSource1"
                                    Width="100%"
                                    DataTextField="nombre_coordinacion"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnDataBound="DropDownList1_DataBound"
                                    DataValueField="id_coordinacion">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:dbCnnStr %>"
                                    SelectCommand="SELECT top 13 nombre_coordinacion, id_coordinacion FROM bitaseg.Coordinaciones"></asp:SqlDataSource>
                            </div>
                            <div class="col-sm-2">
                                Número:
                            
                            <p id="NCord" runat="server"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row col-sm-12">
                        <div class="col-sm-3">
                            <label style="font-size: 20px">Buscar:</label>
                            <asp:CheckBoxList ID="chklist" runat="server">
                                <asp:ListItem Value="0" Selected="true"> Proveedor</asp:ListItem>
                                <asp:ListItem Value="1" Selected="true"> Insumos</asp:ListItem>
                                <asp:ListItem Value="2" Selected="true"> Monto</asp:ListItem>
                                <asp:ListItem Value="3" Selected="true"> Fecha de Factura</asp:ListItem>
                                <asp:ListItem Value="4" Selected="true"> Teléfono</asp:ListItem>
                                <asp:ListItem Value="5" Selected="true"> Dirección</asp:ListItem>
                                <asp:ListItem Value="6" Selected="true"> User_Reg</asp:ListItem>
                                <asp:ListItem Value="7" Selected="true"> Fecha_Reg</asp:ListItem>

                            </asp:CheckBoxList>

                            <br />
                        </div>

                        <div class="col-sm-4">
                          
                            <label style="font-size: 20px">Ordenar por:</label><br />
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem Value="0">Proveedor</asp:ListItem>
                                <asp:ListItem Value="1">Insumos</asp:ListItem>
                                <asp:ListItem Value="2">Monto</asp:ListItem>
                                <asp:ListItem Value="3">Fecha de Factura</asp:ListItem>
                                <asp:ListItem Value="4">Dirección</asp:ListItem>
                                <asp:ListItem Value="5">Teléfono</asp:ListItem>
                                <asp:ListItem Value="6">User_Reg</asp:ListItem>
                                <asp:ListItem Value="7">Fecha_Reg</asp:ListItem>
                            </asp:DropDownList>
                          
                          <label style="margin-left: 5px" runat="server" title="Click aquí para cambiar por orden descendente" id="ascdesc" onclick="MyFunction()"><u>Ascendente</u></label>
                            
                            <div  id="Desde" style="margin: 5px" runat="server">

                                <asp:TextBox TextMode="multiline" placeholder="Click aquí para desplegar clendario" autocomplete="off" ToolTip="Día/Mes/Año" CssClass="oro" ID="Fecha1" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="Fecha1" />

                                <%--    <asp:Calendar ID="Calendar1" runat="server"
                                    OnSelectionChanged="Selection_Change">
                                    <SelectedDayStyle BackColor="#b0e5fb"
                                        ForeColor="black"></SelectedDayStyle>
                                </asp:Calendar>--%>
                            </div>
                        </div>


                        <div class="col-sm-5">

                            <label>Buscar por fecha de:</label><br />
                            <asp:RadioButton ID="Radio1" GroupName="fechas" Checked="true"
                                Text="Captura" runat="server" CssClass="derecha" />
                            <asp:RadioButton ID="Radio2" GroupName="fechas" CssClass="izquierda"
                                Text="Factura" runat="server" />



                            <div id="Hasta" style="margin: 5px" runat="server">

                                <asp:TextBox TextMode="multiline" placeholder="Click aquí para desplegar clendario" autocomplete="off" ToolTip="Día/Mes/Año" CssClass="oro" ID="Fecha2" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" PopupButtonID="imgPopup" runat="server" TargetControlID="Fecha2" />

                                <%--  <asp:Calendar ID="Calendar2" runat="server"
                                OnSelectionChanged="Selection_Change2">
                                <SelectedDayStyle BackColor="#b0e5fb"
                                    ForeColor="black"></SelectedDayStyle>
                            </asp:Calendar>--%>
                            </div>
                        </div>
                    </div>

                    <br />
                    <div class="col-sm-8">
                        <asp:TextBox Width="50%" runat="server" ID="like" placeholder="Introducir nombre o dejar vacío"></asp:TextBox>
                        <asp:Button ID="Buttona" Text="Buscar" runat="server" class="boton-azo" OnClick="Button_Click" />
                    </div>
                    <br />
                    <label id="lblmsg" runat="server"></label>

                    <div class="col-sm-12 estil">

                        <asp:GridView ID="grdCancelados"
                            AutoGenerateColumns="false"
                            runat="server"
                            GridLines="None"
                            CssClass="table table-bordered"
                            PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" OnRowDataBound="grdCancelados_RowDataBound"
                            ShowFooter="true"
                            PageSize="7"
                            Style="background: white;">

                            <%--OnRowDataBound="grdCancelados_RowDataBound"--%>

                            <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                            <Columns>

                                <asp:BoundField HeaderText="Proveedor" DataField="nombre_proveedor" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Insumos" DataField="insumos_adquiridos" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Monto" DataField="monto" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Fecha de Factura" DataField="fecha_factura" ItemStyle-Wrap="false" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField HeaderText="Teléfono" DataField="telefono" ItemStyle-Wrap="false" DataFormatString="{0:(###) ###-####}" />
                                <asp:BoundField HeaderText="Dirección" DataField="direccion" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="User_Reg" DataField="user_reg" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Fecha_Reg" DataField="fecha_reg" ItemStyle-Wrap="false" />
                                <asp:HyperLinkField DataNavigateUrlFields="id_proveedor" HeaderText="Información del Proveedor" ItemStyle-Wrap="false" DataNavigateUrlFormatString="PrvdrsInfo.aspx?ID={0}" Text="Ver información" />



                            </Columns>

                        </asp:GridView>



                    </div>
                    <div style="padding-left: 320px">
                    </div>
                    <%-- <asp:Button ID="ExportToExcel" runat="server" class="dr" Text="Descargar Reporte" OnClick="ExportToExcel_Click" />--%>
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
        <asp:TextBox ID="folioval" runat="server" />
        <asp:HiddenField ID="valor" runat="server" Value="0" />
    </p>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function MyFunction() {

            var text = document.getElementById("<%=ascdesc.ClientID%>").innerText;

            if (text == "Ascendente") {
                document.getElementById("<%=ascdesc.ClientID%>").innerHTML = "<u>Descendente</u>";
                document.getElementById("<%=ascdesc.ClientID%>").setAttribute("title", "Click aquí para cambiar por orden descendente");
                document.getElementById("<%=valor.ClientID%>").value = "1";
            } else {
                document.getElementById("<%=ascdesc.ClientID%>").innerHTML = "<u>Ascendente</u>";
                document.getElementById("<%=ascdesc.ClientID%>").setAttribute("title", "Click aquí para cambiar por orden ascendente");
                document.getElementById("<%=valor.ClientID%>").value = "0";
            }
        }
    </script>

</asp:Content>
