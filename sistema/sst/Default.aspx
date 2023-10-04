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
                ['Atención Ciudadana del C. Gobernador', 124],
                ['Secretaría Particular de Gobierno', 3],
                ['Sistema DIF Tamaulipas', 20],
                ['SEBIEN', 12],
                ['Presidencia de la República', 30],
                ['Gestión Parlamentaria', 12],
                ['IPSSSET', 130],
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
    <style>
        .accordion-button:after {
            background-image: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23ffffff'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>") !important;
        }
    </style>
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


                        <asp:DropDownList ID="ddl_origen2" EnableViewState="true" Style="text-overflow: ellipsis" CssClass="form-select text-uppercase" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource10" DataTextField="origen" DataValueField="id_origen" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_origen_SelectedIndexChanged">
                            <asp:ListItem Value="-1" Selected="True">-- Selecciona un tipo de registro --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.origen"></asp:SqlDataSource>




                        <%--  <asp:DropDownList runat="server" ID="ddl_origen" Style="max-width: 350px; text-overflow: ellipsis" class="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddl_origen_SelectedIndexChanged">
                            <asp:ListItem Value="-1">-- Selecciona un tipo de registro --</asp:ListItem>
                            <asp:ListItem Value="Ventanilla">Receptoría/Ventanilla</asp:ListItem>
                            <asp:ListItem Value="Acuerdos">Acuerdos del C. Gobernador del Estado</asp:ListItem>
                            <asp:ListItem Value="Atencion">Atención Ciudadana del C. Gobernador </asp:ListItem>
                            <asp:ListItem Value="Particular">Secretaría Particular de Gobierno</asp:ListItem>
                            <asp:ListItem Value="DIF">Sistema DIF Tamaulipas</asp:ListItem>
                            <asp:ListItem Value="SEBIEN">SEBIEN</asp:ListItem>
                            <asp:ListItem Value="Presidencia">Presidencia de la República</asp:ListItem>
                            <asp:ListItem Value="Gestion">Gestión Parlamentaria</asp:ListItem>
                            <asp:ListItem Value="IPSSSET">IPSSSET</asp:ListItem>
                            <asp:ListItem Value="Varios">Varios</asp:ListItem>

                        </asp:DropDownList>--%>
                    </div>

                    <div class="Principal card card-block" id="Ventanilla" runat="server">
                        <div class="accordion" id="accordionExample">
                            <%--//DATOS DEL PACIENTE--%>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button style="background-color: rgba(113, 19, 19, 0.78); color: white" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        Datos del Paciente
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Parentesco</label>
                                                <asp:DropDownList ID="ddl_parentesco" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_parentesco" DataTextField="nombre_parentesco" DataValueField="id_parentesco" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDS_parentesco" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from catalogos.cat_parentesco"></asp:SqlDataSource>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>CURP del Paciente:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="CURP del solicitante" ID="txtCurp_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Municipio del Paciente:&nbsp;</label>
                                                <asp:DropDownList ID="ddl_Mun_pac" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource1" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Seguridad Social</label>
                                                <asp:DropDownList ID="ddl_seguridad_social_pac" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_Seguridad_Social" DataTextField="seguridad_social" DataValueField="id_seguridad_social" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from catalogos.cat_seguridad_social"></asp:SqlDataSource>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Fecha de Nacimiento:&nbsp;</label>
                                                <asp:TextBox CssClass="form-control text-uppercase " runat="server" ID="date_fecha_nac_pac" TextMode="Date"></asp:TextBox>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Teléfono del Paciente:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control text-uppercase " MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" onkeypress="return numbersonly(event)" ID="txtTel_pac" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Nombre:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Nombre o Nombres" ID="txtNombre_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Primer Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Primer Apellido" ID="txtPrimer_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Segundo Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtSegun_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Localidad:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtLocalidad_sol" SetFocusOnError="true" ErrorMessage="Se requiere la localidad." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="txtLocalidad_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>C.P.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="txtCP_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Colonia:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="txtColonia_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Calle:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="txtCalle_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Referencias:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Referencias" ID="txtReferencias_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator15" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Entre calle" ID="txtEntre"  class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>y entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator16" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre2" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Y entre calle" ID="txtEntre2"  class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>--%>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Int.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número interior" ID="txtNumInt_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Ext.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="txtNumExt_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%--//DATOS DEL SOLICITANTE--%>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button style="background-color: rgba(113, 19, 19, 0.78); color: white" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                        Datos del Solicitante
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>CURP del Solicitante:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="CURP del solicitante" ID="txtCurp_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Municipio de la Solicitud:&nbsp;</label>
                                                <asp:DropDownList ID="ddl_id_municipio_solicitud" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource1" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.municipios"></asp:SqlDataSource>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Seguridad Social</label>
                                                <asp:DropDownList ID="ddl_seguridad_social_sol" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_Seguridad_Social" DataTextField="seguridad_social" DataValueField="id_seguridad_social" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDS_Seguridad_Social" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from catalogos.cat_seguridad_social"></asp:SqlDataSource>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Fecha de Nacimiento:&nbsp;</label>
                                                <asp:TextBox CssClass="form-control text-uppercase" runat="server" ID="date_fecha_nac_sol" TextMode="Date"></asp:TextBox>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Teléfono del Solicitante:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control text-uppercase " MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" onkeypress="return numbersonly(event)" ID="txtTel_sol" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Nombre:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Nombre o Nombres" ID="txtNombre_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Primer Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Primer Apellido" ID="txtPrimer_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Segundo Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtSegun_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Tipo de Solicitud</label>
                                                <asp:DropDownList ID="ddl_TipoSol" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource2" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.tipo_solicitudes"></asp:SqlDataSource>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Municipio del Solicitante:&nbsp;</label>
                                                <asp:DropDownList ID="ddl_Mun_sol" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource1" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.municipios"></asp:SqlDataSource>
                                            </div>

                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Costo:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Monto"
                                                        onkeypress="return solonumerosypunto(event)"
                                                        onkeyup="myFunction()"
                                                        onclick="myFunction()"
                                                        AutoCompleteType="Disabled"
                                                        oninput="myFunction()"
                                                        autocomplete="off" ID="txtCosto" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>



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

                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Solicitud:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Ingrese la Solicitud" TextMode="MultiLine" ID="txtSolicitud" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Localidad:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="txtLocalidad_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>C.P.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="txtCP_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Colonia:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="txtColonia_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Calle:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="txtCalle_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Referencias:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Referencias" ID="txtReferencias_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator15" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Entre calle" ID="txtEntre"  class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>y entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator16" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre2" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Y entre calle" ID="txtEntre2"  class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>--%>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Int.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número interior" ID="txtNumInt_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Ext.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="txtNumExt_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center" style="margin-top: 20px">
                            <button type="button" class="btn btn-secondary-outline bootstrap_4t" runat="server" id="Guardar_Solicitud" onserverclick="Guardar_Solicitud_ServerClick">Enviar</button>
                        </div>
                    </div>
                    <div class="Principal card card-block" id="todolodemas" runat="server">
                        <h3 id="texto" runat="server"></h3>
                        <div class="row">
                            <div class="col-sm-2 justify-content-center align-self-center">
                                <label>C000:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="C000" ID="txtC00SAC" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <label>N° de Oficio:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Número de Oficio" ID="txtnumero_OficioSAC" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-sm justify-content-center align-self-center">
                                <label>Municipio:&nbsp;</label>
                                <asp:DropDownList ID="ddl_mun_varios" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource1" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.municipios"></asp:SqlDataSource>
                            </div>
                              

                        </div>
                        <div class="row">
                            <div class="col-sm justify-content-center align-self-center" id="hacer_insivisible_sac" runat="server">
                                <label>SAC:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="SAC" ID="txtSAC" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center" runat="server" id="presidente_republica">
                                <label>ID:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="ID" TextMode="MultiLine" Rows="1" ID="txtID_presidente_republica" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                      <div class="row" runat="server" id="desaparecer_origen_varios">
                        <div class="col-sm justify-content-center align-self-center">
                            <label>Origen Varios:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Captura el Origen" ID="txtOrigen_varios" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                      
                    </div>
                           <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Tipo de Solicitud</label>
                                                <asp:DropDownList ID="DropDownList1" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource2" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.tipo_solicitudes"></asp:SqlDataSource>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Costo:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Monto"
                                                        onkeypress="return solonumerosypunto(event)"
                                                        onkeyup="myFunction()"
                                                        onclick="myFunction()"
                                                        AutoCompleteType="Disabled"
                                                        oninput="myFunction()"
                                                        autocomplete="off" ID="TextBox1" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>

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

                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Solicitud:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Ingrese la Solicitud" TextMode="MultiLine" ID="TextBox2" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                        <br />
                        <h3>Beneficiario</h3>

                      <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Parentesco</label>
                                                <asp:DropDownList ID="DropDownList2" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_parentesco" DataTextField="nombre_parentesco" DataValueField="id_parentesco" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from catalogos.cat_parentesco"></asp:SqlDataSource>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>CURP del Paciente:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="CURP del solicitante" ID="TextBox3" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Municipio del Paciente:&nbsp;</label>
                                                <asp:DropDownList ID="DropDownList3" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource1" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Seguridad Social</label>
                                                <asp:DropDownList ID="DropDownList4" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_Seguridad_Social" DataTextField="seguridad_social" DataValueField="id_seguridad_social" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from catalogos.cat_seguridad_social"></asp:SqlDataSource>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Fecha de Nacimiento:&nbsp;</label>
                                                <asp:TextBox CssClass="form-control text-uppercase " runat="server" ID="TextBox4" TextMode="Date"></asp:TextBox>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Teléfono del Paciente:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control text-uppercase " MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" onkeypress="return numbersonly(event)" ID="TextBox5" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Nombre:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox6" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Primer Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Primer Apellido" ID="TextBox7" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Segundo Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Segundo Apellido" ID="TextBox8" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Localidad:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator2" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtLocalidad_sol" SetFocusOnError="true" ErrorMessage="Se requiere la localidad." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="TextBox9" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>C.P.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="TextBox10" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Colonia:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="TextBox12" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Calle:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="TextBox13" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Referencias:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Referencias" ID="TextBox14" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>Entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator15" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Entre calle" ID="txtEntre"  class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm justify-content-center align-self-center">
                                <div class="form-group">
                                    <label>y entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator16" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtEntre2" SetFocusOnError="true" ErrorMessage="Se requieren las entre calles." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                    <asp:TextBox autocomplete="nel" placeholder="Y entre calle" ID="txtEntre2"  class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>--%>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Int.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número interior" ID="TextBox21" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Ext.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="TextBox22" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                        <div class="text-center" style="margin-top: 20px">
                            <button type="button" class="btn btn-secondary-outline bootstrap_4t" runat="server" id="btn_Grabar2" onserverclick="Guardar_Solicitud_ServerClick">Buscar</button>
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

                            <asp:DropDownList ID="ddl_origen_busqueda" EnableViewState="true" Style="max-width: 350px; text-overflow: ellipsis" CssClass="form-select text-uppercase" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="origen" DataValueField="id_origen" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_origen_busqueda_SelectedIndexChanged">
                                <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                            </asp:DropDownList>


                        </div>

                    </div>
                    <div class="row">

                        <div class="col">
                            <label>Por CURP:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="CURP" ID="TextBox11" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Tipo de Solicitud</label>
                            <asp:DropDownList CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource2" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.tipo_solicitudes"></asp:SqlDataSource>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col">
                            <label>Por c000:&nbsp;</label>

                            <div class="form-group">
                                <asp:TextBox placeholder="POR C000" ID="TextBox18" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Por N° de Oficio:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="POR N° DE OFICIO" ID="TextBox19" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Por SAC:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="POR SAC" ID="TextBox20" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>Por Nombre:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Nombre o Nombres" ID="TextBox15" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Primer Apellido:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Primer Apellido" ID="TextBox16" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <label>Segundo Apellido:&nbsp;</label>
                            <div class="form-group">
                                <asp:TextBox placeholder="Segundo Apellido" ID="TextBox17" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
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
                                <%--<asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" ItemStyle-Wrap="false" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <%--  <asp:HyperLinkField DataNavigateUrlFields="id_empleado" DataNavigateUrlFormatString="admin.aspx?ID={0}" Text="Ver info" />--%>

                                <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                                <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                            </Columns>
                        </asp:GridView>
                    </div>


                </div>
                <div class="tab-pane fade" id="reportes" role="tabpanel" aria-labelledby="reportes-tab">
                    <div class="card card-block" id="Reportes" runat="server">



                        <asp:DropDownList ID="ddl_origen_reportes" EnableViewState="true" Style="max-width: 350px; text-overflow: ellipsis" CssClass="form-select text-uppercase" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="origen" DataValueField="id_origen" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_origen_reportes_SelectedIndexChanged">
                            <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.origen"></asp:SqlDataSource>



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
                                        <th scope="row">Atención Ciudadana del C. Gobernador</th>
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
                                        <th scope="row">IPSSSET</th>
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
    <asp:HiddenField ID="hdn_id_mun" runat="server" />
    <asp:HiddenField ID="hdn_costo" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }
    </script>

    <script>

        function xxx(s) {
            var rgx = /^[0-9]*\.?[0-9]*$/;
            return s.match(rgx);
        }


    </script>
    <script>
        function solonumerosypunto(event) {
            // Obtener el código ASCII del carácter ingresado
            var charCode = event.which ? event.which : event.keyCode;
            // Convertirlo a su representación en string
            var charStr = String.fromCharCode(charCode);

            // Validar si el carácter ingresado es un número o un punto decimal
            if (!(/[0-9.]/.test(charStr))) {
                // Si no es un número ni un punto, evitar que se agregue al cuadro de texto
                event.preventDefault();
            }

            var textBox = document.getElementById("<%=txtCosto.ClientID%>");

            // Verificar si el carácter ingresado es un punto decimal
            if (charStr === ".") {
                // Validar si ya hay un punto en el cuadro de texto
                if (textBox.value.indexOf(".") !== -1) {
                    event.preventDefault();
                }
            }

            // Verificar si ya hay dos dígitos después del punto decimal
            if (textBox.value.indexOf(".") !== -1) {
                var decimalIndex = textBox.value.indexOf(".");
                var decimalDigits = textBox.value.substring(decimalIndex + 1);

                if (decimalDigits.length >= 2) {
                    event.preventDefault();
                }
            }
        }

    </script>
    <%--<script runat="server">

        void Selection_Change(Object sender, EventArgs e)
        {

            Object selectedItem = ddl_Mun.SelectedValue;
            String str = selectedItem.ToString();
            hdn_id_mun.Value = str;
        }

        void Selection_Change2(Object sender, EventArgs e)
        {

            Object selectedItem = ddl_mun_varios.SelectedValue;
            String str = selectedItem.ToString();
            hdn_id_mun.Value = str;
            //Response.Write(str  + "<br>");

        }
    </script>--%>


    <script>
        function myFunction() {
            var x = document.getElementById("<%=txtCosto.ClientID%>").value;

             var cadena = x,

                 separador = "$", // un espacio en blanco
                 arregloDeSubCadenas = cadena.replace(separador, "");


             document.getElementById("<%=txtCosto.ClientID%>").value = '$' + arregloDeSubCadenas;


             var y = document.getElementById("<%=txtCosto.ClientID%>").value;
             var b = y.substring(1);

             $("#<%=hdn_costo.ClientID%>").val(b);

        }

    </script>
    <script>
        $(document).ready(function () {
            var fechaInicio = new Date(1980, 0, 1).toISOString().split("T")[0];
            $('#<%= date_fecha_nac_sol.ClientID %>').val(fechaInicio);
             $('#<%= date_fecha_nac_pac.ClientID %>').val(fechaInicio);
         });
    </script>

    <script> 

        // Asegúrate de incluir la biblioteca js-cookie en tu página

        // Función para guardar el tab activo en una cookie
        function guardarTabActivo(tabId) {
            Cookies.set('tabActivo', tabId);
        }


        const tabLinks = document.querySelectorAll('[data-toggle="tab"]');

        // Agrega un evento 'click' a cada elemento de pestaña
        tabLinks.forEach(function (tabLink) {
            tabLink.addEventListener('click', function (event) {
                const tabId = this.getAttribute('href'); // Obtén el href del tab-pane activo
                guardarTabActivo(tabId);
            });
        });
        // Restaura el tab activo después del postback
        window.addEventListener('DOMContentLoaded', function () {
            const tabActivo = Cookies.get('tabActivo');
            if (tabActivo) {
                const tabLink = document.querySelector(`a[href="${tabActivo}"]`);
                if (tabLink) {
                    $(tabLink).tab('show');
                }
            }

        });


    </script>



    <script>
        //
        $("#<%=txtCurp_sol.ClientID%>").keydown(function () {
            BuscarDatosCURP_SOL();
        });
        //

        function BuscarDatosCURP_SOL() {

            if ($("#<%=txtCurp_sol.ClientID%>").val().length == 18) {
                    //
                    $("#<%=txtNombre_sol.ClientID%>").val("");
                $("#<%=txtPrimer_sol.ClientID%>").val("");
                $("#<%=txtSegun_sol.ClientID%>").val("");

                $("#<%=txtCalle_sol.ClientID%>").val("");
                $("#<%=txtNumExt_sol.ClientID%>").val("");
                $("#<%=txtNumInt_sol.ClientID%>").val("");

                $("#<%=txtColonia_sol.ClientID%>").val("");
                $("#<%=txtCP_sol.ClientID%>").val("");
                $("#<%=txtTel_sol.ClientID%>").val("");


                //   $("#< %=ddl_entidad_federativa.ClientID%>").val("28");

                var curp = $("#<%=txtCurp_sol.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/BuscarCURPlinea",
                    data: "{curp : '" + String(curp) + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (datos) {
                        console.log(curp);
                        datos = JSON.parse(datos.d);
                        if (datos.Result == "1") {
                            if (datos.Data.nombres.length > 0) {
                                $("#<%=txtNombre_sol.ClientID%>").val(datos.Data.nombres);
                                $("#<%=txtPrimer_sol.ClientID%>").val(datos.Data.apellido1);
                                $("#<%=txtSegun_sol.ClientID%>").val(datos.Data.apellido2);

                                var formattedDate = moment(datos.Data.fechNac, "DD/MM/YYYY").format("YYYY-MM-DD");
                                $("#<%=date_fecha_nac_sol.ClientID%>").val(formattedDate);


                                <%--if (datos.Data.numEntidadReg == "28") {
                                    $("#<%=ddl_Mun_sol.ClientID%>").prop("disabled", false);
                                                    $("#<%=ddl_Mun_sol.ClientID%>").val((parseInt(datos.Data.cveMunicipioReg, 10)).toString());
                                }--%>
                            }
                        }
                    }
                });
            }
        }
    </script>

    <script>
        //
        $("#<%=txtCurp_pac.ClientID%>").keydown(function () {
            BuscarDatosCURP_PAC();
        });
        //

        function BuscarDatosCURP_PAC() {

            if ($("#<%=txtCurp_pac.ClientID%>").val().length == 18) {
                  //
                  $("#<%=txtNombre_pac.ClientID%>").val("");
                  $("#<%=txtPrimer_pac.ClientID%>").val("");
                  $("#<%=txtSegun_pac.ClientID%>").val("");

                  $("#<%=txtCalle_pac.ClientID%>").val("");
                  $("#<%=txtNumExt_pac.ClientID%>").val("");
                  $("#<%=txtNumInt_pac.ClientID%>").val("");

                  $("#<%=txtColonia_pac.ClientID%>").val("");
                  $("#<%=txtCP_pac.ClientID%>").val("");
                  $("#<%=txtTel_pac.ClientID%>").val("");


                  //   $("#< %=ddl_entidad_federativa.ClientID%>").val("28");

                  var curp = $("#<%=txtCurp_pac.ClientID%>").val();
                  $.ajax({
                      type: "POST",
                      url: "Default.aspx/BuscarCURPlinea",
                      data: "{curp : '" + String(curp) + "'}",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (datos) {
                          console.log(curp);
                          datos = JSON.parse(datos.d);
                          if (datos.Result == "1") {
                              if (datos.Data.nombres.length > 0) {
                                  $("#<%=txtNombre_pac.ClientID%>").val(datos.Data.nombres);
                                $("#<%=txtPrimer_pac.ClientID%>").val(datos.Data.apellido1);
                                $("#<%=txtSegun_pac.ClientID%>").val(datos.Data.apellido2);

                                var formattedDate = moment(datos.Data.fechNac, "DD/MM/YYYY").format("YYYY-MM-DD");
                                $("#<%=date_fecha_nac_pac.ClientID%>").val(formattedDate);


                                <%--if (datos.Data.numEntidadReg == "28") {
                                    $("#<%=ddl_Mun_sol.ClientID%>").prop("disabled", false);
                                                    $("#<%=ddl_Mun_sol.ClientID%>").val((parseInt(datos.Data.cveMunicipioReg, 10)).toString());
                                }--%>
                            }
                        }
                    }
                });
            }
        }
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>



</asp:Content>

