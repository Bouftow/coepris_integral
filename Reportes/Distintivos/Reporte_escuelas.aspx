<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Reporte_escuelas.aspx.cs" Inherits="Reportes_Distintivos_Reporte_escuelas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .Ancho {
            width: 20000px !important;
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
            max-height: 500px;
            overflow-y: scroll;
            overflow-x: scroll;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("reportes_distintivo.default.-1"),this.Page) %>
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

                      <asp:UpdatePanel ID="up1" runat="server">
                            <ContentTemplate>
                    <div class="row">
                        <div class="col select container-fluid" style="min-width: 220px">
                            <label style="margin-bottom: 0px">Número de coordinación:&nbsp<a id="NCord" runat="server"></a></label>
                            <asp:DropDownList ID="ddlCoord" runat="server" Style="width: 100%; padding: 5px 5px"
                                DataSourceID="SqlDataSource1"
                                DataTextField="nombre_coordinacion"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCoord_SelectedIndexChanged" OnDataBound="ddlCoord_DataBound" 
                                DataValueField="id_coordinacion">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbCnnStr %>"
                                SelectCommand="SELECT top 13 nombre_coordinacion, id_coordinacion FROM bitaseg.Coordinaciones"></asp:SqlDataSource>
                        </div>
                        <div class="col-sm-6">
                            <%--<div class="row">
                                <div class="col form-group" id="Desde" runat="server">
                                    <label>Fecha de inicio:</label>
                                    <asp:TextBox class="form-control" type="date" AutoComplete="off" ID="Fecha1" runat="server"></asp:TextBox>
                                </div>
                                <div class="col form-group" id="Hasta" runat="server">
                                    <div>
                                        <label>Fecha final:</label>
                                        <asp:TextBox class="form-control" type="date" AutoComplete="off" ID="Fecha2" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                   <%-- <div class="row">
                        <div class="col-sm-3" style="min-width: 262px">
                            <label style="font-size: 20px">Buscar:</label>
                            <asp:RadioButtonList ID="rbL1" runat="server">
                                <asp:ListItem Value="0" Selected="true">&nbsp No Visitados </asp:ListItem>
                                <asp:ListItem Value="1">&nbsp Visitados </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CheckBoxList ID="chkL" runat="server">
                                <asp:ListItem Value="2">&nbsp Visitados con distintivo</asp:ListItem>
                                <asp:ListItem Value="3">&nbsp Visitados sin distintivo</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                        <div class="col">

                            <div class="col">
                                <label>Buscar por fecha de:</label>
                                <div class="row">
                                    <div class="col-sm-3 form-group">
                                        <asp:RadioButton ID="Radio1" GroupName="fechas" Checked="true"
                                            Text="&nbsp Captura" runat="server" CssClass="derecha" />
                                    </div>
                                    <div class="col-sm-3 form-group">
                                        <asp:RadioButton ID="Radio2" GroupName="fechas" CssClass="izquierda"
                                            Text="&nbsp Visita" runat="server" />
                                    </div>
                                    <div class="col-sm-3 form-group">
                                        <asp:RadioButton ID="RadioButton1" GroupName="fechas" CssClass="izquierda"
                                            Text="&nbsp Distintivo" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox Width="50%" runat="server" ID="like" placeholder="Introducir nombre o dejar vacío"></asp:TextBox>
                        <asp:Button ID="Buttona" Text="Buscar" runat="server" class="boton-azo" OnClick="Button_Click" />
                    </div>--%>
                  <%--  <div class="col-sm-12 estil">
                        <asp:GridView ID="grdCancelados"
                            AutoGenerateColumns="false"
                            runat="server"
                            GridLines="None"
                            CssClass="table table-bordered"
                            PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" 
                            PageSize="7" 
                            AllowSorting="true" 
                            OnSorting="grdCancelados_Sorting"
                            Style="background: white;">
                            <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField SortExpression="giro" HeaderText="Giro" DataField="giro" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="coordinacion" HeaderText="Coordinación" DataField="coordinacion" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="municipio" HeaderText="Municipio" DataField="municipio" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="Localidad" HeaderText="Localidad" DataField="Localidad" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="nombreest" HeaderText="Nombre del establecimiento" DataField="nombreest" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="direccion" HeaderText="Dirección" DataField="direccion" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="dias_laborales" HeaderText="Días laborales" DataField="dias_laborales" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="nombre_responsable" HeaderText="Nombre del responsable" DataField="nombre_responsable" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="tel" HeaderText="Teléfono" DataField="tel" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="correo" HeaderText="Correo Electrónico" DataField="correo" ItemStyle-Wrap="false" ItemStyle-CssClass="text-uppercase" />
                                <asp:BoundField SortExpression="fecha_reg" HeaderText="Fecha_Reg" DataField="fecha_reg" ItemStyle-Wrap="false" />
                            </Columns>
                        </asp:GridView>
                    </div>--%>
                    
                    <div class="col-sm-12 estil">
                      
                        <asp:HiddenField id="sort" runat="server"></asp:HiddenField>
                                <asp:GridView ID="GridView2"
                                    Width="100%"
                                    AutoGenerateColumns="false"
                                    Font-Size="13px"
                                    runat="server"
                                    GridLines="None"
                                    CssClass="table table-bordered"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    
                                    AllowSorting="true"
                                    OnSorting="GridView2_Sorting"
                                    Style="background: white;">

                                   <%-- OnRowDataBound="GridView2_RowDataBound"
                                    --%>

                                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                       <%-- <asp:TemplateField>
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                           
                                        <asp:TemplateField HeaderText="Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="id_estatus" runat="server" Text='<%#Eval("id_estatus") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Folio" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="id_distintivo" runat="server" Text='<%#Eval("folio") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                      
                                        <asp:TemplateField SortExpression="coordinacion" HeaderText="Coordinación" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="coordinacion" runat="server" Text='<%#Eval("coordinacion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField SortExpression="municipio" HeaderText="Municipio" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="municipio" runat="server" Text='<%#Eval("municipio") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="Localidad" HeaderText="Localidad" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="Localidad" runat="server" Text='<%#Eval("Localidad") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="nombreest"  HeaderText="Nombre de la Institución" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombreest" runat="server" Text='<%#Eval("nombre_escuela") %>'></asp:Label>
                                            </ItemTemplate>     
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="razon_social" HeaderText="Clave del centro de trabajo" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombreest" runat="server" Text='<%#Eval("razon_social") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="nivel_educativo" HeaderText="Nivel Educativo" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombreest" runat="server" Text='<%#Eval("nivel_educativo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="direccion" runat="server" Text='<%#Eval("direccion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                     

                                     <%--   <asp:TemplateField SortExpression="dias_laborales" HeaderText="Días laborales" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="dias_laborales" runat="server" Text='<%#Eval("dias_laborales") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField> --%>

                                     <%--   <asp:TemplateField SortExpression="dias_laborales" HeaderText="Días laborales" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="dias_laborales" runat="server" Text='<%#Eval("dias_laborales2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>



                                        <asp:TemplateField SortExpression="nombre_responsable" HeaderText="Nombre del responsable" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombre_responsable" runat="server" Text='<%#Eval("nombre_responsable") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="tel" HeaderText="Teléfono" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="tel" runat="server" Text='<%#Eval("tel") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="correo" HeaderText="Correo Electrónico" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="correo" runat="server" Text='<%#Eval("correo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Archivo" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:LinkButton ForeColor="White" runat="server"  target="_blank" Text="Ver Archivo" id="direccion" href='<%# Page.ResolveUrl("../../uploads/Distintivo/") + Eval("sesion") + "/Evidencias.pdf"%> ' CssClass="boton-azo"></asp:LinkButton>                                           
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="fecha_reg" HeaderText="Fecha de registro" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="fecha_reg" runat="server" Text='<%#Eval("fecha_reg") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                           
                    </div>


                                 <div class="col-sm-12 estil">
                                   <asp:GridView ID="GridView3" Visible="false"
                                    Width="100%"
                                    AutoGenerateColumns="false"
                                    Font-Size="13px"
                                    runat="server"
                                    GridLines="None"
                                    CssClass="table table-bordered"
                                    PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt"
                                    
                                    AllowSorting="true"
                                    Style="background: white;">

                                   <%-- OnRowDataBound="GridView2_RowDataBound"
                                    --%>

                                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                       <%-- <asp:TemplateField>
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                           
                                        <asp:TemplateField HeaderText="Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="id_estatus" runat="server" Text='<%#Eval("id_estatus") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Folio" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="id_distintivo" runat="server" Text='<%#Eval("folio") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                      
                                        <asp:TemplateField SortExpression="coordinacion" HeaderText="Coordinación" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="coordinacion" runat="server" Text='<%#Eval("coordinacion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField SortExpression="municipio" HeaderText="Municipio" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="municipio" runat="server" Text='<%#Eval("municipio") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="Localidad" HeaderText="Localidad" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="Localidad" runat="server" Text='<%#Eval("Localidad") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="nombreest"  HeaderText="Nombre de la Institución" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombreest" runat="server" Text='<%#Eval("nombre_escuela") %>'></asp:Label>
                                            </ItemTemplate>     
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="razon_social" HeaderText="Clave del centro de trabajo" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombreest" runat="server" Text='<%#Eval("razon_social") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="nivel_educativo" HeaderText="Nivel Educativo" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombreest" runat="server" Text='<%#Eval("nivel_educativo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="colonia" runat="server" Text='<%#Eval("colonia") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="cp" runat="server" Text='<%#Eval("cp") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="calle" runat="server" Text='<%#Eval("calle") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="numext" runat="server" Text='<%#Eval("numext") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="entrecalles" runat="server" Text='<%#Eval("entrecalles") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField SortExpression="direccion" HeaderText="Dirección" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="entrecalles" runat="server" Text='<%#Eval("entrecalles") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                     

                                     <%--   <asp:TemplateField SortExpression="dias_laborales" HeaderText="Días laborales" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="dias_laborales" runat="server" Text='<%#Eval("dias_laborales") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField> --%>

                                     <%--   <asp:TemplateField SortExpression="dias_laborales" HeaderText="Días laborales" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="dias_laborales" runat="server" Text='<%#Eval("dias_laborales2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>



                                        <asp:TemplateField SortExpression="nombre_responsable" HeaderText="Nombre del responsable" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="nombre_responsable" runat="server" Text='<%#Eval("nombre_responsable") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="tel" HeaderText="Teléfono" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="tel" runat="server" Text='<%#Eval("tel") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="correo" HeaderText="Correo Electrónico" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="correo" runat="server" Text='<%#Eval("correo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Archivo" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:LinkButton ForeColor="White" runat="server"  target="_blank" Text="Ver Archivo" id="direccion" href='<%# Page.ResolveUrl("../../uploads/Distintivo/") + Eval("sesion") + "/Evidencias.pdf"%> ' CssClass="boton-azo"></asp:LinkButton>                                           
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="fecha_reg" HeaderText="Fecha de registro" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="fecha_reg" runat="server" Text='<%#Eval("fecha_reg") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                           
                    </div>



                                 </ContentTemplate>
                        </asp:UpdatePanel>
                    <div class="text-center">
                        <asp:Button ID="ExportToExcel" runat="server" class="dr" Text="Descargar Reporte" OnClick="ExportToExcel_Click" />
                        <asp:Button ID="ExportToExcelMSYS" runat="server" class="dr" Text="Descargar Reporte Solo Media Superior y Superior" OnClick="ExportToExcel_ClickMSYS" />
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
    <%-- <script>
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
    </script>--%>

   <%-- <script>

        if ($('#cphContent_rbL1_0').is(':checked')) {
            //alert('check');
            $('#cphContent_chkL_0').prop("disabled", true);
            $('#cphContent_chkL_1').prop("disabled", true);
        }



        $('#<%=rbL1.ClientID%>').change(function () {

            var rbL1 = $('#<%=rbL1.ClientID%>').find('input[type=radio]:checked').val();
            if (rbL1 == "1") {
                //alert('picaste1');
                $('#cphContent_chkL_0').prop("disabled", false);
                $('#cphContent_chkL_1').prop("disabled", false);
            } else {

                $("#cphContent_chkL_0").prop("checked", false);
                $("#cphContent_chkL_1").prop("checked", false);
                $('#cphContent_chkL_0').prop("disabled", true);
                $('#cphContent_chkL_1').prop("disabled", true);

            }

        });;
    </script>--%>
</asp:Content>
