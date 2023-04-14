<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="Gsln.aspx.cs" Inherits="_default" %>

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
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">





    <div class="card-block">
        <div class="tab-content">
            <div class="card-block card">
                <div class="card-header card-header-sm bordered">
                    <div class="row header-block">
                        <h4>Reporte Distintivos</h4>
                    </div>
                </div>

                <div class="card" runat="server">
                    <asp:Label ID="LblMsg" runat="server"></asp:Label>
                    <div class="select container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <h4>Ver Información de la Coordinación:</h4>
                            </div>
                            <div class="col-sm-3" style="min-width: 210px;">
                                <asp:DropDownList ID="DropDownList1" runat="server" Style="width: 210px;"
                                    DataSourceID="SqlDataSource1"
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



                    <div class="row">
                        <div class="col-sm-3">
                            <label style="font-size: 20px">Buscar:</label>
                            <asp:CheckBoxList ID="chklist" runat="server">
                                <asp:ListItem Value="0" Selected="true"> Nombre </asp:ListItem>
                                <asp:ListItem Value="1" Selected="true"> Fecha Última entrega </asp:ListItem>
                                <asp:ListItem Value="2" Selected="true"> Vehiculo Oficial</asp:ListItem>
                                <asp:ListItem Value="3" Selected="true"> Puesto </asp:ListItem>
                                <asp:ListItem Value="4" Selected="true"> Actividad </asp:ListItem>
                                <asp:ListItem Value="5" Selected="true"> "Otras" </asp:ListItem>
                                <asp:ListItem Value="6" Selected="true"> Cantidad </asp:ListItem>
                                <asp:ListItem Value="7" Selected="true"> Rendimiento </asp:ListItem>
                                <asp:ListItem Value="8" Selected="true"> Cilindraje </asp:ListItem>
                                <asp:ListItem Value="9" Selected="true"> User_Reg </asp:ListItem>
                                <asp:ListItem Value="10" Selected="true"> Fecha_Reg </asp:ListItem>
                            </asp:CheckBoxList>
                        </div>

                        <div class="col-sm-9">

                            <div class="select col" style="min-width: 245px;">
                                <div class="form-group">
                                    <label>Ordenar por:</label>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="DropDownList2" runat="server" Width="100%">
                                                <asp:ListItem Value="0"> Nombre </asp:ListItem>
                                                <asp:ListItem Value="1"> Fecha de Última entrega </asp:ListItem>
                                                <asp:ListItem Value="2"> Vehiculo Oficial</asp:ListItem>
                                                <asp:ListItem Value="3"> Puesto </asp:ListItem>
                                                <asp:ListItem Value="4"> Actividad </asp:ListItem>
                                                <asp:ListItem Value="5"> "Otras" </asp:ListItem>
                                                <asp:ListItem Value="6"> Cantidad </asp:ListItem>
                                                <asp:ListItem Value="7"> Rendimiento </asp:ListItem>
                                                <asp:ListItem Value="8"> Cilindraje </asp:ListItem>
                                                <asp:ListItem Value="9"> User_Reg </asp:ListItem>
                                                <asp:ListItem Value="10"> Fecha_Reg </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col" style="display: flex; align-items: center;">
                                            <div class="form-check" style="padding-left: 0; display: inline-block;">
                                                <asp:CheckBox runat="server" ID="ascdesc" Text="&nbsp Ascendente" />
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">

                                <label>Buscar por fecha:</label>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <asp:RadioButton ID="Radio1" GroupName="fechas" Checked="true"
                                            Text="De Captura" runat="server" CssClass="derecha" />
                                    </div>
                                    <div class="col">
                                        <asp:RadioButton ID="Radio2" GroupName="fechas" CssClass="izquierda"
                                            Text="De Entrega" runat="server" />
                                    </div>
                                </div>
                            </div>

                            <div class="col">
                                <div class="row">
                                <div class="col form-group" id="Desde" runat="server">
                                    <label>Fecha de inicio:</label>
                                    <asp:TextBox  class="form-control" type="date" AutoComplete="off" ID="Fecha1" runat="server"></asp:TextBox>
                                </div>
                                <div class="col form-group" id="Hasta" runat="server">
                                    <div>
                                         <label>Fecha final:</label>
                                       <asp:TextBox class="form-control" type="date" AutoComplete="off" ID="Fecha2" runat="server"></asp:TextBox>
                                    </div>
                                </div></div>
                            </div>

                        </div>


                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox Width="50%" runat="server" ID="like" placeholder="Introducir nombre o dejar vacío"></asp:TextBox>
                        <asp:Button ID="Buttona" Text="Buscar" runat="server" class="boton-azo" OnClick="Button_Click" />
                    </div>
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

                                <asp:BoundField HeaderText="Nombre" DataField="nombre_completo" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Fecha ultima entrega" DataField="ultima_fecha" ItemStyle-Wrap="false" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField HeaderText="Vechiculo Oficial" DataField="oficial" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Puesto" DataField="puesto" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Actividad" DataField="actividad" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Otra" DataField="especificacion" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Rendimiento" DataField="rendimiento" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Cilindraje" DataField="cilindraje" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="User_Reg" DataField="user_reg" ItemStyle-Wrap="false" />
                                <asp:BoundField HeaderText="Fecha_Reg" DataField="fecha_reg" ItemStyle-Wrap="false" />
                                <%--  <asp:HyperLinkField DataNavigateUrlFields="id_empleado" DataNavigateUrlFormatString="admin.aspx?ID={0}" Text="Ver info" />--%>

                                <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                                <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="ExportToExcel" runat="server" class="dr" Text="Descargar Reporte" OnClick="ExportToExcel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <p style="visibility: hidden">
        <asp:TextBox ID="folioval" runat="server" />
        <asp:HiddenField ID="valor" runat="server" Value="0" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        $("input:checkbox").click(function () {
            var $label = $(this).next('label');

            if ($label.html() == "&nbsp; Ascendente") {
                $("label[for='cphContent_ascdesc']").html("&nbsp; Descendente");
                $("#<%=ascdesc.ClientID%>").val = "1";
            } else {
                $("label[for='cphContent_ascdesc']").html("&nbsp; Ascendente");
                $("#<%=ascdesc.ClientID%>").val = "0";
            }
        });
    </script>
</asp:Content>

