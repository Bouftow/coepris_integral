<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="sistema_sst_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="Atencion_Ciudadana.css" rel="stylesheet" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


    <script type="text/javascript">

        // Load the Visualization API and the corechart package.
        google.charts.load('current', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows([
                ['Acuerdos del C. Gobernador del Estado', 17],
                ['Atención Ciudadana del C. Gobernador CAC', 124],
                ['Secretaría Particular de Gobierno', 3],
                ['Sistema DIF Tamaulipas', 20],
                ['SEBIEN', 12],
                ['Presidencia de la República', 30],
                ['Gestión Parlamentaria', 12],
                ['Receptoría/Ventanilla', 75]
            ]);

            // Set chart options
            var options = {
                title: 'Porcentaje de origen de peticiones',
                //legend: { position: 'center', maxLines: 1 },
                'width': 400,
                'height': 300

            };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <script>$("#titulo_pagina").text("Secretaría de Salud de Tamaulipas");</script>
    <div class="card-block card">
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Módulo de Atención Ciudadana</h3>
                </div>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="captura-tab" data-toggle="tab" href="#captura" role="tab" aria-controls="captura" aria-selected="true">Captura</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="busqueda-tab" data-toggle="tab" href="#busqueda" role="tab" aria-controls="busqueda" aria-selected="false">Busqueda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="reportes-tab" data-toggle="tab" href="#reportes" role="tab" aria-controls="reportes" aria-selected="false">Reportes</a>
                    </li>
                </ul>

            </div>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="captura" role="tabpanel" aria-labelledby="captura-tab">
                    <div class="col" style="margin: 1% 1% 1% 0">
                        <label>Tipo de Registro</label>

                        <asp:DropDownList runat="server" ID="ddl_solicitud" Style="max-width: 350px; text-overflow: ellipsis" class="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddl_solicitud_SelectedIndexChanged">
                            <asp:ListItem Value="-1">-- Selecciona un tipo de registro --</asp:ListItem>
                            <asp:ListItem Value="Ventanilla">Receptoría/Ventanilla</asp:ListItem>
                            <asp:ListItem Value="Acuerdos">Acuerdos del C. Gobernador del Estado</asp:ListItem>
                            <asp:ListItem Value="Atencion">Atención Ciudadana del C. Gobernador CAC</asp:ListItem>
                            <asp:ListItem Value="Particular">Secretaría Particular de Gobierno</asp:ListItem>
                            <asp:ListItem Value="DIF">Sistema DIF Tamaulipas</asp:ListItem>
                            <asp:ListItem Value="SEBIEN">SEBIEN</asp:ListItem>
                            <asp:ListItem Value="Presidencia">Presidencia de la República</asp:ListItem>
                            <asp:ListItem Value="Gestion">Gestión Parlamentaria</asp:ListItem>
                            <asp:ListItem Value="Varios">Varios</asp:ListItem>

                        </asp:DropDownList>

                    </div>

                    <div class="Principal card card-block" id="Ventanilla" runat="server">

                        <h3 class="text-center">Datos del Solicitante</h3>
                        <div class="row">
                            <div class="col">
                                <label>CURP del Solicitante:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="CURP del solicitante" ID="txtNombre" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Teléfono del Solicitante:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Teléfono del Solicitante" ID="TextBox1" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Nombre:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox2" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Primer Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="TextBox3" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Segundo Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="TextBox4" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Tipo de Solicitud</label>
                                <asp:DropDownList CssClass="form-select" runat="server" DataSourceID="SqlDataSource2" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.tipo_solicitudes"></asp:SqlDataSource>

                            </div>
                            <div class="col">
                                <label>Municipio:&nbsp;</label>
                                <asp:DropDownList CssClass="form-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.municipios"></asp:SqlDataSource>
                            </div>
                            <%--<div class="col-sm-3">
                                    <label>Zona</label>
                                    <select style="text-overflow: ellipsis" id="zona" class="form-select" aria-label="zona">
                                        <option style="color: #808080" value="-1">-- Selecciona --</option>
                                        <option>Centro</option>
                                        <option>Sur</option>
                                        <option>Norte</option>
                                      
                                    </select>
                                </div>--%>
                            <%-- <div class="col-sm-3">
                                    <label>Tipo de Zona</label>
                                    <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem>Urbano&nbsp&nbsp&nbsp</asp:ListItem>
                                        <asp:ListItem>Rural</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>--%>
                        </div>
                        <div class="row">

                            <div class="col">
                                <label>Solicitud:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Ingrese la Solicitud" TextMode="MultiLine" ID="TextBox6" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Localidad:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator11" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtLocalidad" SetFocusOnError="true" ErrorMessage="Se requiere la localidad." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="txtLocalidad" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>C.P.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator10" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCP" SetFocusOnError="true" ErrorMessage="Se requiere el Código Postal." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="txtCP" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Colonia:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator12" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtColonia" SetFocusOnError="true" ErrorMessage="Se requiere la colonia." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="txtColonia" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Calle:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator14" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCalle" SetFocusOnError="true" ErrorMessage="Se requiere la calle." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="txtCalle" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator15" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Entre calle" ID="txtEntre" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>y entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator16" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre2" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Y entre calle" ID="txtEntre2" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-2 justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Num. Int.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator17" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtNumInt" SetFocusOnError="true" ErrorMessage="Se requiere el número interior." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Número interior" ID="txtNumInt" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-2 justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Num. Ext.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator18" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtNumExt" SetFocusOnError="true" ErrorMessage="Se requiere el número exterior." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="txtNumExt" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <h3 class="text-center">Datos del Paciente</h3>
                        <div class="row">
                            <div class="col">
                                <label>CURP del Paciente:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="CURP del Paciente" ID="TextBox5" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Nombre:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox7" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Primer Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="TextBox8" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Segundo Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="TextBox9" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="Principal card card-block" id="todolodemas" runat="server">
                        <h3 id="texto" runat="server"></h3>
                        <div class="row">
                            <div class="col-sm-2">
                                <label>C000:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="C000" ID="txtC00SAC" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>N° de Oficio:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Número de Oficio" ID="txtnumero_OficioSAC" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">

                                <label>Municipio:&nbsp;</label>
                                <select style="text-overflow: ellipsis" id="ddlmunicipioSAC" class="form-select" aria-label="municipio">
                                    <option value="Victoria">Victoria</option>
                                    <option value="Abasolo">Abasolo</option>
                                    <option value="Aldama">Aldama</option>
                                    <option value="Altamira">Altamira</option>
                                    <option value="Antiguo Morelos">Antiguo Morelos</option>
                                    <option value="Burgos">Burgos</option>
                                    <option value="Bustamante">Bustamante</option>
                                    <option value="Camargo">Camargo</option>
                                    <option value="Casas">Casas</option>
                                    <option value="Ciudad Madero">Ciudad Madero</option>
                                    <option value="Cruillas">Cruillas</option>
                                    <option value="El Mante">El Mante</option>
                                    <option value="Gómez Farías">Gómez Farías</option>
                                    <option value="González">González</option>
                                    <option value="Güémez">Güémez</option>
                                    <option value="Guerrero">Guerrero</option>
                                    <option value="Gustavo Díaz Ordaz">Gustavo Díaz Ordaz</option>
                                    <option value="Hidalgo">Hidalgo</option>
                                    <option value="Jaumave">Jaumave</option>
                                    <option value="Jiménez">Jiménez</option>
                                    <option value="Llera">Llera</option>
                                    <option value="Mainero">Mainero</option>
                                    <option value="Matamoros">Matamoros</option>
                                    <option value="Méndez">Méndez</option>
                                    <option value="Mier">Mier</option>
                                    <option value="Miguel Alemán">Miguel Alemán</option>
                                    <option value="Miquihuana">Miquihuana</option>
                                    <option value="Nuevo Laredo">Nuevo Laredo</option>
                                    <option value="Nuevo Morelos">Nuevo Morelos</option>
                                    <option value="Ocampo">Ocampo</option>
                                    <option value="Padilla">Padilla</option>
                                    <option value="Palmillas">Palmillas</option>
                                    <option value="Reynosa">Reynosa</option>
                                    <option value="Río Bravo">Río Bravo</option>
                                    <option value="San Carlos">San Carlos</option>
                                    <option value="San Fernando">San Fernando</option>
                                    <option value="San Nicolás">San Nicolás</option>
                                    <option value="Soto la Marina">Soto la Marina</option>
                                    <option value="Tampico">Tampico</option>
                                    <option value="Tula">Tula</option>
                                    <option value="Valle Hermoso">Valle Hermoso</option>
                                    <option value="Villagrán">Villagrán</option>
                                    <option value="Xicoténcatl">Xicoténcatl</option>

                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col" id="hacer_insivisible_sac" runat="server">
                                <label>SAC:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="SAC" ID="txtSAC" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Descripción:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Descripción" TextMode="MultiLine" Rows="1" ID="txtDescripcionSAC" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <br />
                        <h3>Beneficiario</h3>

                        <div class="row">

                            <div class="col-sm-6">
                                <label>CURP&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="CURP" ID="TextBox10" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Nombre:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox12" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Primer Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="TextBox13" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Segundo Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="TextBox14" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                    </div>
                    <%-- <div class="Principal card card-block" id="Acuerdos" runat="server"></div>
                    <div class="Principal card card-block" id="Atencion" runat="server"></div>
                    <div class="Principal card card-block" id="Particular" runat="server"></div>
                    <div class="Principal card card-block" id="DIF" runat="server"></div>--%>
                    <%--Lo mismo pero sin SAC--%>
                    <%--  <div class="Principal card card-block" id="SEBIEN" runat="server"></div> 
                    <div class="Principal card card-block" id="Presidencia" runat="server"></div>
                    <div class="Principal card card-block" id="Gestion" runat="server"></div>
                    <div class="Principal card card-block" id="Varios" runat="server"></div>--%>
                </div>
                <div class="tab-pane fade" id="busqueda" role="tabpanel" aria-labelledby="busqueda-tab">

                    <h3>Búsqueda</h3>
                    <div class="row">

                       
                       <div class="col" style="margin: 1% 1% 1% 0">
                        <label>Tipo de Registro</label>

                        <asp:DropDownList runat="server" ID="ddl_busqueda_tipoderegistro" Style="max-width: 350px; text-overflow: ellipsis" class="form-select">
                            <asp:ListItem Value="-1">-- Selecciona un tipo de registro --</asp:ListItem>
                            <asp:ListItem Value="Ventanilla">Receptoría/Ventanilla</asp:ListItem>
                            <asp:ListItem Value="Acuerdos">Acuerdos del C. Gobernador del Estado</asp:ListItem>
                            <asp:ListItem Value="Atencion">Atención Ciudadana del C. Gobernador CAC</asp:ListItem>
                            <asp:ListItem Value="Particular">Secretaría Particular de Gobierno</asp:ListItem>
                            <asp:ListItem Value="DIF">Sistema DIF Tamaulipas</asp:ListItem>
                            <asp:ListItem Value="SEBIEN">SEBIEN</asp:ListItem>
                            <asp:ListItem Value="Presidencia">Presidencia de la República</asp:ListItem>
                            <asp:ListItem Value="Gestion">Gestión Parlamentaria</asp:ListItem>
                            <asp:ListItem Value="Varios">Varios</asp:ListItem>

                        </asp:DropDownList>

                    </div>

                    </div>
                    <div class="row">

                        <div class="col">
                            <label>Por CURP:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="CURP" ID="TextBox11" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Tipo de Solicitud</label>
                            <asp:DropDownList CssClass="form-select" runat="server" DataSourceID="SqlDataSource2" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.tipo_solicitudes"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label>Por c000:&nbsp;</label>

                            <div class="form-group">
                                <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox18" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Por N° de Oficio:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Primer Apellido" ID="TextBox19" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Por SAC:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Segundo Apellido" ID="TextBox20" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>Por Nombre:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox15" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Primer Apellido:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Primer Apellido" ID="TextBox16" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Segundo Apellido:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Segundo Apellido" ID="TextBox17" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="text-center" style="margin: 10px">
                        <button type="button" class="btn btn-secondary-outline bootstrap_4t" runat="server" onserverclick="Button_Click">Buscar</button>
                    </div>
                    	
<hr />

                          <div class="col-sm-12 overflow_4t">
                        <asp:GridView ID="grdCancelados"
                            AutoGenerateColumns="true"
                            runat="server"
                            GridLines="None"
                            CssClass="table table-bordered Grid_4t" 
                            PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" 
                            ShowFooter="true"
                            PageSize="7" 
                            
                            Style="background: white;">

                            <%--OnRowDataBound="grdCancelados_RowDataBound"--%>

                            <HeaderStyle BackColor="#a52a2a" Font-Bold="True" ForeColor="White" />
                            <Columns>

                                <%--<asp:BoundField HeaderText="Nombre" DataField="nombre_completo" ItemStyle-Wrap="false" />--%>
                                <asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg1" ItemStyle-Wrap="false" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                                <%--  <asp:HyperLinkField DataNavigateUrlFields="id_empleado" DataNavigateUrlFormatString="admin.aspx?ID={0}" Text="Ver info" />--%>

                                <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                                <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                            </Columns>
                        </asp:GridView>
                    </div>


                </div>
                <div class="tab-pane fade" id="reportes" role="tabpanel" aria-labelledby="reportes-tab">
                    <div class="card card-block" id="Reportes" runat="server">
                        <select style="text-overflow: ellipsis" id="selectreporte" class="form-select" aria-label="zona">
                            <option style="color: #808080" value="-1">-- Selecciona --</option>
                            <option>Gestión de origen de peticiones y porcentaje </option>
                            <option>Acuerdos del C. Gobernador del Estado</option>
                            <option>Atención Ciudadana del C. Gobernador CAC</option>
                            <option>Secretaría Particular de Gobierno</option>
                            <option>Sistema DIF Tamaulipas</option>
                            <option>SEBIEN</option>
                            <option>Presidencia de la República</option>
                            <option>Gestión Parlamentaria</option>
                            <option>Receptoría/Ventanilla</option>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col">
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr class="table-warning">
                                        <th scope="col">ORIGEN</th>
                                        <th scope="col">ATENDIDO</th>
                                        <th scope="col">PROCESO</th>
                                        <th scope="col">TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Acuerdos del C. Gobernador del Estado</th>
                                        <td>7</td>
                                        <td>10</td>
                                        <td>17</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Atención Ciudadana del C. Gobernador CAC</th>
                                        <td>119</td>
                                        <td>5</td>
                                        <td>124</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Secretaría Particular de Gobierno</th>
                                        <td>3</td>
                                        <td>0</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Sistema DIF Tamaulipas</th>
                                        <td>20</td>
                                        <td>0</td>
                                        <td>20</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">SEBIEN</th>
                                        <td>27</td>
                                        <td>3</td>
                                        <td>30</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Presidencia de la República</th>
                                        <td>27</td>
                                        <td>3</td>
                                        <td>30</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gestión Parlamentaria</th>
                                        <td>10</td>
                                        <td>2</td>
                                        <td>12</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Receptoría/Ventanilla</th>
                                        <td>66</td>
                                        <td>9</td>
                                        <td>75</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td>252</td>
                                        <td>29</td>
                                        <td>281</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <div id="chart_div"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>

