<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Propuesta.aspx.cs" Inherits="sistema_sst_Propuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="Atencion_Ciudadana.css" rel="stylesheet" />
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        // Carga Google Charts y llama a la función updateChart() al cargar
        google.charts.load('current', { 'packages': ['corechart'] });
        //google.charts.setOnLoadCallback(updateChart);

        // Función para dibujar el gráfico con Google Charts
        function drawChart(data) {
            var dataTable = new google.visualization.DataTable();

            // Agregar columnas según los nombres en data.columnas
            for (var i = 0; i < data.columnas.length; i++) {
                if (data.columnas[i] === "cantidad_solicitudes") {
                    dataTable.addColumn('number', data.columnas[i]); // Usar 'number' para la columna de cantidad_solicitudes
                } else {
                    dataTable.addColumn('string', data.columnas[i]);
                }
            }

            // Agregar las filas de datos a la tabla (pasar solo el array de filas)
            dataTable.addRows(data.filas);

            var options = {
                title: 'Gráfico Dinámico',
                width: 300,
                height: 300
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(dataTable, options);
        }



    </script>
    <style>
        .accordion-button:after {
            background-image: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23ffffff'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>") !important;
        }
         .modal-xl {
        max-width: 50%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header" style="background-color:brown;">
                    <h5 class="modal-title" id="exampleModalLabel">Observaciones y Estatus</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                    <label style="display:none">ID de Solicitud:&nbsp</label>
                    <label style="display:none" id="id_solicitud"></label>

                <strong><label class="text-center align-middle text-uppercase" id="ModalLabelConDescripcion"></label></strong>
                    <table style="margin-top:5px" id="historialTable" class="table table-bordered">
                        <thead>
                            <tr class="text-center">
                                <%--<th>ID Historial</th>--%>
                                <th>Observaciones</th>
                                <th>Estatus</th>
                                <th>Fecha</th>
                            </tr>
                            <tr>
                            </tr>
                        </thead>
                        <tbody  id="historialTableBody">
                            <!-- Aquí se mostrarán los datos -->
                        </tbody>
                    </table>
                         </div>
                    <div class="container">
                    <div class="contenedor-de-tabla-modal">
                    <table class="table table-bordered tabla-modal">
                        <thead>
                            <tr>
                                <th>Observaciones</th>
                                <th>Estatus</th>
                                <th>Fecha de Registro</th>
                                
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" class="text-uppercase" id="txtObservaciones1" data-id="1" /></td>
                                <td>
                                    <select id="ddlEstatus1" runat="server" clientidmode="Static" data-id="1">
                                    </select>
                                </td>
                                <td>
                                    <button type="button" class="alert-success btnAgregar" data-id="1">Agregar</button></td>
                            </tr>
                        </tbody>
                    </table>
               </div>
               </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>


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
            <div class="Principal card card-block" runat="server">
                <div class="tab-content" id="myTabContent">

                    <div class="tab-pane fade show active" id="captura" role="tabpanel" aria-labelledby="captura-tab">

                        <div class="accordion" id="accordionPrincipal">
                            <%--//DATOS DE LA SOLICITUD--%>
                            <div class="accordion-item" runat="server" id="acordion_solicitud">
                                <h2 class="accordion-header" id="heading_Solicitud">
                                    <button style="background-color: rgba(113, 19, 19, 0.78); color: white" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_Solicitud" aria-expanded="true" aria-controls="collapseOne">
                                        Datos de la Solicitud
                                    </button>
                                </h2>
                                <div id="collapse_Solicitud" class="accordion-collapse collapse show" aria-labelledby="heading_Solicitud" data-bs-parent="#accordionPrincipal">
                                    <div class="accordion-body">
                                        <asp:DropDownList ID="ddl_origen2" EnableViewState="true" Style="text-overflow: ellipsis" CssClass="form-select text-uppercase" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource_Origen" DataTextField="origen" DataValueField="id_origen" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_origen_SelectedIndexChanged">
                                            <asp:ListItem Value="-1" Selected="True">-- Selecciona un tipo de registro --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDDL_Origen" runat="server" ControlToValidate="ddl_origen2" InitialValue="-1" ErrorMessage="Favor de seleccionar un tipo de registro." ForeColor="Red" Display="Dynamic" />
                                        <asp:SqlDataSource ID="SqlDataSource_Origen" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.origen"></asp:SqlDataSource>

                                        <br />
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_c000">
                                                <label>C000:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="C000" ID="txtC00SAC" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvC00SAC" runat="server" ControlToValidate="txtC00SAC" InitialValue="" ErrorMessage="El c000 es obligatorio." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_numero_oficioSAC">
                                                <label>N° de Oficio:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Número de Oficio" ID="txtnumero_OficioSAC" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvNumero_OficioSAC" runat="server" ControlToValidate="txtnumero_OficioSAC" InitialValue="" ErrorMessage="El Número de oficio es obligatorio." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_SAC">
                                                <label>SAC:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="SAC" ID="txtSAC" CssClass="form-control text-uppercase uppercase" runat="server"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvSAC" runat="server" ControlToValidate="txtSAC" InitialValue="" ErrorMessage="El SAC es obligatorio." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_presidente_republica">
                                                <label>ID:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="ID" TextMode="MultiLine" Rows="1" ID="txtID_presidente_republica" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvPresidente_republica" runat="server" ControlToValidate="txtID_presidente_republica" InitialValue="" ErrorMessage="Presidente de la Rep Obligatorio." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_origen_varios">
                                                <label>Origen Varios:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Captura el Origen" ID="txtOrigen_varios" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvOrigen_varios" runat="server" ControlToValidate="txtOrigen_varios" InitialValue="" ErrorMessage="Origen Varios." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_Municipio_solicitud">
                                                <label>Municipio:&nbsp;</label>
                                                <asp:DropDownList ID="ddl_mun_varios" AutoPostBack="true" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource_Municipios" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvMun_Varios" runat="server" ControlToValidate="ddl_mun_varios" InitialValue="-1" ErrorMessage="Favor de seleccionar un municipio." ForeColor="Red" Display="Dynamic" />
                                                <asp:SqlDataSource ID="SqlDataSource_Municipios" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.municipios"></asp:SqlDataSource>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Tipo de Solicitud</label>
                                                <asp:DropDownList ID="ddl_TipoSol" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource_Solicitudes" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvTipo_Sol" runat="server" ControlToValidate="ddl_TipoSol" InitialValue="-1" ErrorMessage="Favor de seleccionar un tipo de solicitud." ForeColor="Red" Display="Dynamic" />
                                                <asp:SqlDataSource ID="SqlDataSource_Solicitudes" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.tipo_solicitudes"></asp:SqlDataSource>
                                            </div>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <label>Costo:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Monto"
                                                        onkeypress="return solonumerosypunto(event)"
                                                        onkeyup="myFunction()"
                                                        onclick="myFunction()"
                                                        AutoCompleteType="Disabled"
                                                        oninput="myFunction()"
                                                        autocomplete="off" ID="txtCosto" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCosto" runat="server" ControlToValidate="txtCosto" ErrorMessage="Favor de Introducir un Valor en el campo 'Costo'." ForeColor="Red" Display="Dynamic" />
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
                                                    <asp:RequiredFieldValidator ID="rfvSolicitud" runat="server" ControlToValidate="txtSolicitud" ErrorMessage="Favor de Introducir la Solicitud." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center" runat="server" id="div_adscripcion">
                                                <label>Adscripción:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Ingrese la adscripción" ID="txtAdscripcion" CssClass="form-control text-uppercase uppercase" runat="server"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvAdscripcion" runat="server" ControlToValidate="txtAdscripcion" ErrorMessage="Favor de Introducir la adscripción." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--//DATOS DEL PACIENTE--%>
                            <div class="accordion-item" runat="server" id="acordion_paciente">
                                <h2 class="accordion-header" id="heading_Beneficiario">
                                    <button style="background-color: rgba(113, 19, 19, 0.78); color: white" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_Beneficiario" aria-expanded="false" aria-controls="collapseTwo">
                                        Datos del Beneficiario
                                    </button>
                                </h2>
                                <div id="collapse_Beneficiario" class="accordion-collapse collapse" aria-labelledby="heading_Beneficiario" data-bs-parent="#accordionPrincipal">
                                    <div class="accordion-body">
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>CURP del Beneficiario:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox MaxLength="18" oninput="BuscarDatosCURP_PAC(this)" autocomplete="off" placeholder="CURP del beneficiario" ID="txtCurp_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <label runat="server" id="lbl_CURP" class="alert-danger" style="display: none">No se encontró CURP en RENAPO.</label>
                                                    <label runat="server" id="lbl_CURP_ERROR" class="alert-danger" style="display: none">Error al buscar CURP, verifique la captura.</label>
                                                    <asp:RequiredFieldValidator ID="rfvCURP_Beneficiario" runat="server" ControlToValidate="txtCurp_pac" ErrorMessage="Favor de capturar la CURP del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>

                                            </div>
                                            <%--
                                                onchange="BuscarDatosCURP_PAC(this)"
                                                onclick="BuscarDatosCURP_PAC(this)"
                                            --%>

                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Municipio del Beneficiario:&nbsp;</label>
                                                <asp:DropDownList ID="ddl_Mun_pac" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource_Municipios" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvMun_Pac" runat="server" ControlToValidate="ddl_Mun_pac" InitialValue="-1" ErrorMessage="Favor de capturar el municipio del Beneficiario." ForeColor="Red" Display="Dynamic" />

                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Seguridad Social</label>
                                                <asp:DropDownList ID="ddl_seguridad_social_pac" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_Seguridad_Social" DataTextField="seguridad_social" DataValueField="id_seguridad_social" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvSeguridad_Social_Pac" runat="server" ControlToValidate="ddl_seguridad_social_pac" InitialValue="-1" ErrorMessage="Favor de capturar la seguridad social del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Fecha de Nacimiento:&nbsp;</label>
                                                <asp:TextBox CssClass="form-control text-uppercase " runat="server" ID="date_fecha_nac_pac" TextMode="Date"></asp:TextBox>

                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Teléfono del Paciente:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control text-uppercase " MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" onkeypress="return numbersonly(event)" ID="txtTel_pac" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvTel_Pac" runat="server" ControlToValidate="txtTel_pac" ErrorMessage="Favor de capturar el teléfono del beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Nombre:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Nombre o Nombres" ID="txtNombre_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvNombre_pac" runat="server" ControlToValidate="txtNombre_pac" InitialValue="" ErrorMessage="Favor de capturar el nombre del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Primer Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Primer Apellido" ID="txtPrimer_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvPrimer_Apellido_pac" runat="server" ControlToValidate="txtPrimer_pac" InitialValue="" ErrorMessage="Favor de capturar el primer apellido del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Segundo Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtSegun_pac" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvSegundo_apellido" runat="server" ControlToValidate="txtSegun_pac" InitialValue="" ErrorMessage="Favor de capturar el segundo apellido del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Localidad:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtLocalidad_sol" SetFocusOnError="true" ErrorMessage="Se requiere la localidad." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator></label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="txtLocalidad_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLocalidad_pac" runat="server" ControlToValidate="txtLocalidad_pac" InitialValue="" ErrorMessage="Favor de capturar la localidad del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>C.P.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="txtCP_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCodigo_Postal" runat="server" ControlToValidate="txtCP_pac" InitialValue="" ErrorMessage="Favor de capturar el código postal del Beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Colonia:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="txtColonia_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvColonia" runat="server" ControlToValidate="txtColonia_pac" InitialValue="" ErrorMessage="Favor de capturar la colonia del beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Calle:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="txtCalle_pac" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ControlToValidate="txtCalle_pac" InitialValue="" ErrorMessage="Favor de capturar la calle del beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Referencias:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Referencias" ID="txtReferencias_pac" class="form-control" CssClass="form-control text-uppercase  uppercase"  runat="server"></asp:TextBox> <%--ValidationGroup="EnviarDatos"--%>
                                                    <%--<asp:RequiredFieldValidator ID="rfvReferencias" runat="server" ControlToValidate="txtReferencias_pac" InitialValue="" ErrorMessage="Favor de capturar referencias del domicilio del beneficiario." ForeColor="Red" Display="Dynamic" />--%>
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
                                                    <asp:RequiredFieldValidator ID="rfvNum_int_pac" runat="server" ControlToValidate="txtNumInt_pac" InitialValue="" ErrorMessage="Favor de capturar el número interior del domicilio del beneficiario." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Ext.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="txtNumExt_pac" class="form-control" CssClass="form-control text-uppercase  uppercase"  runat="server"></asp:TextBox> <%--ValidationGroup="EnviarDatos"--%>
                                                    <%--<asp:RequiredFieldValidator ID="rfvNum_ext_pac" runat="server" ControlToValidate="txtNumExt_pac" InitialValue="" ErrorMessage="Favor de capturar el número exterior del domicilio del beneficiario." ForeColor="Red" Display="Dynamic" />--%>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="row" style="vertical-align: middle; margin-top: 10px">
                                            <div class="col">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="chkBeneficiario" runat="server" />
                                                    <label class="form-check-label no-select" for="chkBeneficiario" onclick="toggleCheckboxAndAlert()">
                                                        El Beneficiario es la misma persona que solicita.
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <script>
                                            function toggleCheckboxAndAlert() {
                                                var checkbox = document.getElementById('<%= chkBeneficiario.ClientID %>');
                                                if (checkbox.checked) {
                                                    checkbox.checked = false;
                                                } else {
                                                    checkbox.checked = true;
                                                }

                                                // Disparar manualmente el evento change después de cambiar el estado del checkbox
                                                if ("createEvent" in document) {
                                                    var event = document.createEvent("HTMLEvents");
                                                    event.initEvent("change", false, true);
                                                    checkbox.dispatchEvent(event);
                                                } else {
                                                    checkbox.fireEvent("onchange");
                                                }
                                            }

                                        </script>

                                        <script>
                                            $(document).ready(function () {
                                                $("#<%= chkBeneficiario.ClientID %>").change(function () {
                                                    var isChecked = $(this).is(':checked');
                                                    $("#<%= ddl_parentesco.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtCurp_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= ddl_id_municipio_solicitante.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= ddl_seguridad_social_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= date_fecha_nac_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtTel_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtNombre_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtPrimer_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtSegun_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtLocalidad_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtCP_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtColonia_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtCalle_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtReferencias_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtNumInt_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);
                                                    $("#<%= txtNumExt_sol.ClientID %>").toggleClass("deshabilitar-visualmente", isChecked);

                                                    if (isChecked) {
                                                        $("#<%= ddl_parentesco.ClientID %>").val(1);
                                                        $("#<%= txtCurp_sol.ClientID %>").val($("#<%= txtCurp_pac.ClientID %>").val());
                                                        $("#<%= ddl_id_municipio_solicitante.ClientID %>").val($("#<%= ddl_Mun_pac.ClientID %>").val());
                                                        $("#<%= ddl_seguridad_social_sol.ClientID %>").val($("#<%= ddl_seguridad_social_pac.ClientID %>").val());
                                                        $("#<%= date_fecha_nac_sol.ClientID %>").val($("#<%= date_fecha_nac_pac.ClientID %>").val());
                                                        $("#<%= txtTel_sol.ClientID %>").val($("#<%= txtTel_pac.ClientID %>").val());
                                                        $("#<%= txtNombre_sol.ClientID %>").val($("#<%= txtNombre_pac.ClientID %>").val());
                                                        $("#<%= txtPrimer_sol.ClientID %>").val($("#<%= txtPrimer_pac.ClientID %>").val());
                                                        $("#<%= txtSegun_sol.ClientID %>").val($("#<%= txtSegun_pac.ClientID %>").val());
                                                        $("#<%= txtLocalidad_sol.ClientID %>").val($("#<%= txtLocalidad_pac.ClientID %>").val());
                                                        $("#<%= txtCP_sol.ClientID %>").val($("#<%= txtCP_pac.ClientID %>").val());
                                                        $("#<%= txtColonia_sol.ClientID %>").val($("#<%= txtColonia_pac.ClientID %>").val());
                                                        $("#<%= txtCalle_sol.ClientID %>").val($("#<%= txtCalle_pac.ClientID %>").val());
                                                        $("#<%= txtReferencias_sol.ClientID %>").val($("#<%= txtReferencias_pac.ClientID %>").val());
                                                        $("#<%= txtNumInt_sol.ClientID %>").val($("#<%= txtNumInt_pac.ClientID %>").val());
                                                        $("#<%= txtNumExt_sol.ClientID %>").val($("#<%= txtNumExt_pac.ClientID %>").val());
                                                    }
                                                    else {
                                                        $("#<%= ddl_parentesco.ClientID %>").val(-1);
                                                        $("#<%= txtCurp_sol.ClientID %>").val('');
                                                        $("#<%= ddl_id_municipio_solicitante.ClientID %>").val('');
                                                        $("#<%= ddl_seguridad_social_sol.ClientID %>").val('');
                                                        $("#<%= date_fecha_nac_sol.ClientID %>").val('');
                                                        $("#<%= txtTel_sol.ClientID %>").val('');
                                                        $("#<%= txtNombre_sol.ClientID %>").val('');
                                                        $("#<%= txtPrimer_sol.ClientID %>").val('');
                                                        $("#<%= txtSegun_sol.ClientID %>").val('');
                                                        $("#<%= txtLocalidad_sol.ClientID %>").val('');
                                                        $("#<%= txtCP_sol.ClientID %>").val('');
                                                        $("#<%= txtColonia_sol.ClientID %>").val('');
                                                        $("#<%= txtCalle_sol.ClientID %>").val('');
                                                        $("#<%= txtReferencias_sol.ClientID %>").val('');
                                                        $("#<%= txtNumInt_sol.ClientID %>").val('');
                                                        $("#<%= txtNumExt_sol.ClientID %>").val('');
                                                    }
                                                });
                                            });
                                        </script>

                                    </div>
                                </div>
                            </div>
                            <%--//DATOS DEL SOLICITANTE--%>
                            <div class="accordion-item" runat="server" id="acordion_solicitante">
                                <h2 class="accordion-header" id="heading_Solicitante">
                                    <button style="background-color: rgba(113, 19, 19, 0.78); color: white" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_Solicitante" aria-expanded="false" aria-controls="collapseThree">
                                        Datos del Solicitante
                                    </button>
                                </h2>

                                <div id="collapse_Solicitante" class="accordion-collapse collapse" aria-labelledby="heading_Solicitante" data-bs-parent="#accordionPrincipal">
                                    <div class="accordion-body">
                                         <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Parentesco</label>
                                                <asp:DropDownList ID="ddl_parentesco" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_parentesco" DataTextField="nombre_parentesco" DataValueField="id_parentesco" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvParentesco" runat="server" ControlToValidate="ddl_parentesco" InitialValue="-1" ErrorMessage="Favor de seleccionar el parentesco." ForeColor="Red" Display="Dynamic" />
                                                <asp:SqlDataSource ID="SqlDS_parentesco" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from catalogos.cat_parentesco"></asp:SqlDataSource>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>CURP del Solicitante:&nbsp;</label>
                                                <div class="form-group">

                                                    <asp:TextBox MaxLength="18" oninput="BuscarDatosCURP_SOL(this)" autocomplete="off" placeholder="CURP del solicitante" ID="txtCurp_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <label runat="server" id="lbl_CURP_SOL" class="alert-danger" style="display: none">No se encontró CURP en RENAPO.</label>
                                                    <label runat="server" id="lbl_CURP_SOL_ERROR" class="alert-danger" style="display: none">Error al buscar CURP, verifique la captura.</label>
                                                    <asp:RequiredFieldValidator ID="rfvCurp_Sol" runat="server" ControlToValidate="txtCurp_sol" InitialValue="" ErrorMessage="Favor de capturar el CURP del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Municipio del Solicitante:&nbsp;</label>
                                                <asp:DropDownList ID="ddl_id_municipio_solicitante" EnableViewState="true" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource_Municipios2" DataTextField="municipio" DataValueField="id_municipio" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona un municipio --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvMun_Solicitud" runat="server" ControlToValidate="ddl_id_municipio_solicitante" InitialValue="-1" ErrorMessage="Favor de seleccionar el municipio del solicitante." ForeColor="Red" Display="Dynamic" />
                                                <asp:SqlDataSource ID="SqlDataSource_Municipios2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.municipios"></asp:SqlDataSource>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Seguridad Social</label>
                                                <asp:DropDownList ID="ddl_seguridad_social_sol" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDS_Seguridad_Social" DataTextField="seguridad_social" DataValueField="id_seguridad_social" AppendDataBoundItems="True">
                                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvSeguridad_Social_Sol" runat="server" ControlToValidate="ddl_seguridad_social_sol" InitialValue="-1" ErrorMessage="Favor de seleccionar la seguridad social del solicitante." ForeColor="Red" Display="Dynamic" />
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
                                                    <asp:RequiredFieldValidator ID="rfvTel_Sol" runat="server" ControlToValidate="txtTel_sol" InitialValue="" ErrorMessage="Favor de capturar el teléfono del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Nombre:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Nombre o Nombres" ID="txtNombre_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvNombre_Sol" runat="server" ControlToValidate="txtNombre_sol" InitialValue="" ErrorMessage="Favor de capturar el nombre del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Primer Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Primer Apellido" ID="txtPrimer_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvPrimer_Apellido_Sol" runat="server" ControlToValidate="txtPrimer_sol" InitialValue="" ErrorMessage="Favor de capturar el primer apellido del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <label>Segundo Apellido:&nbsp;</label>
                                                <div class="form-group">
                                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtSegun_sol" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvSegundo_Apellido_Sol" runat="server" ControlToValidate="txtSegun_sol" InitialValue="" ErrorMessage="Favor de capturar el segundo apellido del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Localidad:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="txtLocalidad_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLocalidad_Sol" runat="server" ControlToValidate="txtLocalidad_sol" InitialValue="" ErrorMessage="Favor de capturar la localidad del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>C.P.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="txtCP_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCP_Sol" runat="server" ControlToValidate="txtCP_sol" InitialValue="" ErrorMessage="Favor de capturar el código postal del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Colonia:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="txtColonia_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvColonia_Sol" runat="server" ControlToValidate="txtColonia_sol" InitialValue="" ErrorMessage="Favor de capturar la colonia del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Calle:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="txtCalle_sol" class="form-control" CssClass="form-control text-uppercase  uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCalle_Sol" runat="server" ControlToValidate="txtColonia_sol" InitialValue="" ErrorMessage="Favor de capturar la calle del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Referencias:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Referencias" ID="txtReferencias_sol" class="form-control" CssClass="form-control text-uppercase  uppercase"  runat="server"></asp:TextBox> <%--ValidationGroup="EnviarDatos"--%>
                                                    <%--<asp:RequiredFieldValidator ID="rfvReferencias_Sol" runat="server" ControlToValidate="txtReferencias_sol" InitialValue="" ErrorMessage="Favor de capturar las referencias del domicilio del solicitante." ForeColor="Red" Display="Dynamic" />--%>
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
                                                    <asp:RequiredFieldValidator ID="rfvNum_Int_Sol" runat="server" ControlToValidate="txtNumInt_sol" InitialValue="" ErrorMessage="Favor de capturar el número interior del domicilio del solicitante." ForeColor="Red" Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2 justify-content-center align-self-center">
                                                <div class="form-group">
                                                    <label>Num. Ext.:&nbsp;</label>
                                                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="txtNumExt_sol" class="form-control" CssClass="form-control text-uppercase  uppercase"  runat="server"></asp:TextBox> <%--ValidationGroup="EnviarDatos"--%>
                                                    <%--<asp:RequiredFieldValidator ID="rfvNum_Ext_Sol" runat="server" ControlToValidate="txtNumExt_sol" InitialValue="" ErrorMessage="Favor de capturar el número exterior del domicilio del solicitante." ForeColor="Red" Display="Dynamic" />--%>
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


                        <asp:ValidationSummary ID="vsFormulario" runat="server" DisplayMode="BulletList" ForeColor="Red" />


                    </div>
                    <div class="tab-pane fade" id="busqueda" role="tabpanel" aria-labelledby="busqueda-tab">
                      <%--  <h3>Búsqueda</h3>--%>
                        <div class="row">
                            <div class="col" style="margin: 1% 1% 1% 0">
                                <label>Tipo de Registro</label>
                                <asp:DropDownList ID="ddl_origen_busqueda" EnableViewState="true" Style="text-overflow: ellipsis" CssClass="form-select text-uppercase" runat="server"  DataSourceID="SqlDataSource_Origenes2" DataTextField="origen" DataValueField="id_origen" AppendDataBoundItems="True">
                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource_Origenes2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="select * from sst_atn.origen"></asp:SqlDataSource>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Por CURP:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="CURP" ID="txtbusquedaporcurp" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Tipo de Solicitud</label>
                                <asp:DropDownList ID="ddl_busqueda_tipo_solicitud" CssClass="form-select text-uppercase" runat="server" DataSourceID="SqlDataSource_Solicitudes" DataTextField="solicitud" DataValueField="id_tipo_solicitud" AppendDataBoundItems="True">
                                    <asp:ListItem Value="-1" Selected="True">-- Selecciona --</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <%-- <div class="row">
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
                    </div>--%>
                        <div class="row">
                            <div class="col">
                                <label>Por Nombre:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre o Nombres" ID="txtbusquedanombre" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Primer Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="txtbusquedaprimerapellido" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Segundo Apellido:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtbusquedasegundoapellido" CssClass="form-control text-uppercase  uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-4">
                                <label>Fecha Inicial:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text-uppercase" runat="server" ID="fecha_inicial" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Fecha Final:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control text-uppercase" runat="server" ID="fecha_final" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:RadioButtonList ID="radio_tipodebusqueda" runat="server">
                                    <asp:ListItem Text="Buscar por Beneficiario" Value="0" Selected="True" />
                                    <asp:ListItem Text="Buscar por Solicitante" Value="1" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="text-center" style="margin: 10px">
                        
                              <asp:Button ID="btn_busqueda" class="btn btn-secondary-outline bootstrap_4t" runat="server" CausesValidation="false" Text="Buscar" OnClick="btn_busqueda_Click"  />
                    </div>

                        <asp:UpdatePanel ID="upnlGridView" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                            <ContentTemplate>

                                <asp:Button ID="btnUpdateTrigger" runat="server" Style="display: none;" OnClick="btnUpdateTrigger_Click" CausesValidation="False" />

                                <div class="col-sm-12 overflow_4t" runat="server" id="div_gridview">
                                    <asp:GridView ID="grdBusqueda" Font-Size="12px" OnRowDataBound="grdBusqueda_RowDataBound"
                                        AutoGenerateColumns="false"
                                        runat="server"
                                        GridLines="None"
                                        CssClass="table table-bordered text-uppercase" PageSize="5"
                                        Style="background: white;">
                                        <HeaderStyle BackColor="#a52a2a" Font-Bold="True" ForeColor="White" CssClass="text-center text-uppercase" />
                                        <Columns>
                                            <asp:BoundField DataField="ID_Solicitud" HeaderText="ID Solicitud" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Fecha de Registro" HeaderText="Fecha de Registro" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Folio" HeaderText="Folio" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Tipo de Solicitud" HeaderText="Tipo de Solicitud" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Descripción" HeaderText="Descripción" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Costo" HeaderText="Costo" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Estatus" HeaderText="Estatus" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:TemplateField HeaderText="Detalles" ItemStyle-CssClass="align-middle text-center">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="btnModificarObservaciones" Text="Ver Detalles" OnClientClick='<%# "mostrarModal(" + Eval("ID_Solicitud") + "); return false;" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CURP" HeaderText="CURP" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Nombre del Beneficiario" HeaderText="Nombre del Beneficiario" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Seguridad Social" HeaderText="Seguridad Social" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Teléfono" HeaderText="Teléfono" ItemStyle-CssClass="align-middle text-center" />
                                            <asp:BoundField DataField="Municipio" HeaderText="Municipio" ItemStyle-CssClass="align-middle text-center" />
                                            
                                        </Columns>
                                    </asp:GridView>

                                    <%--<asp:Button runat="server" ID="btnModificarObservaciones" Text="Modificar Observaciones" OnClick="btnModificarObservaciones_Click" CommandArgument='<%# Eval("ID_Solicitud") %>' />--%>

                                    <%--<asp:BoundField HeaderText="Nombre" DataField="nombre_completo" ItemStyle-Wrap="false" />--%>
                                    <%--<asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" ItemStyle-Wrap="false" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                    <%--  <asp:HyperLinkField DataNavigateUrlFields="id_empleado" DataNavigateUrlFormatString="admin.aspx?ID={0}" Text="Ver info" />--%>
                                    <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                                    <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                                </div>


                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="tab-pane fade" id="reportes" role="tabpanel" aria-labelledby="reportes-tab">
                        <div class="card card-block" id="Reportes" runat="server">
                            <div class="col" style="margin:5px">
                            <h1>Reportes</h1>
                            <select class="form-select" id="ddlOpciones">
                                <option value="-1">--Selecciona un Reporte--</option>
                                <option value="99">Reporte General</option>
                                <option value="1">Reporte Receptoría/Ventanilla</option>
                                <option value="2">Reporte Acuerdos del C. Gobernador del Estado</option>
                                <option value="3">Reporte Atención Ciudadana del C. Gobernador</option>
                                <option value="4">Reporte Secretaría Particular de Gobierno</option>
                                <option value="5">Reporte Sistema DIF Tamaulipas</option>
                                <option value="6">Reporte SEBIEN</option>
                                <option value="7">Reporte Presidencia de la República</option>
                                <option value="8">Reporte Gestión Parlamentaria</option>
                                <option value="9">Reporte IPSSSET</option>
                                <option value="10">Reporte Varios</option>
                            </select>
                                </div>
                            <div class="row">
                                <div class="col-sm-8 overflow_4t" id="tablaContainer">
                                </div>
                                <div class="col-sm-4">
                                    <div id="chart_div"></div>
                                </div>
                                <button causesvalidation="False" id="exportToExcel" class="btn btn-primary">Exportar a Excel</button>
                            </div>
                           


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
        function exportToExcel() {
            // Obtener la tabla
            var table = document.querySelector("#tablaContainer table");

            // Crear una tabla de Excel en formato HTML
            var htmlTable = '<table>';
            for (var i = 0; i < table.rows.length; i++) {
                htmlTable += '<tr>';
                for (var j = 0; j < table.rows[i].cells.length; j++) {
                    htmlTable += '<td>' + table.rows[i].cells[j].innerHTML + '</td>';
                }
                htmlTable += '</tr>';
            }
            htmlTable += '</table>';

            // Crear un objeto Blob para descargar el archivo Excel
            var blob = new Blob([htmlTable], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8' });

            // Crear un enlace para descargar el archivo
            var a = document.createElement("a");
            a.href = URL.createObjectURL(blob);
            a.download = "Reporte.xlsx";
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        }

        document.querySelector("#exportToExcel").addEventListener("click", exportToExcel);
    </script>
    <%--Modal--%>
    <script>
        function mostrarModal(idSolicitud) {
            // Abre el modal
            $('#exampleModal').modal('show');

            // Coloca el valor de idSolicitud en el label del modal
            $('#id_solicitud').text(idSolicitud);

            //alert(idSolicitud);

            // Realiza una solicitud AJAX para obtener los datos del historial de observaciones
            $.ajax({
                type: 'POST',
                url: 'Metodos.aspx/ObtenerHistorialObservaciones',
                data: JSON.stringify({ idSolicitud: idSolicitud }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json', // Tipo de dato esperado (lista de objetos JSON)

                success: function (data) {

                    // Llena la tabla con los datos recibidos
                    var historialTable = $('#historialTable tbody');
                    historialTable.empty(); // Limpia la tabla antes de llenarla

                    $('#ModalLabelConDescripcion').text(data.d[0].solicitud);

                    // Itera a través de los datos recibidos y agrega filas a la tabla
                    $.each(data.d, function (index, item) {
                        var row = '<tr><td>' + item.observaciones + '</td><td>' + item.estatus + '</td><td>' + item.fecha_reg + '</td></tr>';
                        //var row = '<tr><td>' + item.id_historial_observaciones + '</td><td>' + item.observaciones + '</td><td>' + item.estatus + '</td></tr>';
                        historialTable.append(row);
                    });
                },
                error: function (xhr, textStatus, errorThrown) {
                    // Manejo de errores si es necesario
                }
            });
        }
    </script>

    <%--Reportes--%>
    <script type="text/javascript">
        // Función para cargar la tabla utilizando AJAX
        $('#ddlOpciones').on('change', function cargarTabla() {
            
                // Obtiene el valor seleccionado del select.
                var selectValue = document.getElementById('ddlOpciones').value;

                // Realiza una solicitud AJAX para obtener los datos de la base de datos
                $.ajax({
                    url: 'Metodos.aspx/ObtenerDatos', // Ruta al Web Method
                    type: 'POST',
                    data: JSON.stringify({ opcionSeleccionada: selectValue }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        // Crea el gráfico con Google Charts usando los datos recibidos
                        drawChart(result.d);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error al obtener los datos: ' + error);
                    }
                });
            
            var opcionSeleccionada = $("#ddlOpciones").val();
            // Realizar una llamada AJAX para obtener los datos desde el servidor
            $.ajax({
                type: "POST",
                url: "Metodos.aspx/CargarTablas", // Método en el código detrás para obtener los datos
                data: JSON.stringify({ opcion: opcionSeleccionada }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    // Verifica si el arreglo 'd' está presente y no está vacío
                    if (data.d && data.d.length > 0) {
                        var tablaHTML = "<table class='table text-center'><thead><tr>";
                        // Agregar encabezados de columna desde la primera fila de datos
                        for (var columna in data.d[0]) {
                            tablaHTML += "<th>" + columna + "</th>";
                        }
                        tablaHTML += "</tr></thead><tbody>";
                        // Agregar filas de datos
                        for (var i = 0; i < data.d.length; i++) {
                            tablaHTML += "<tr>";

                            for (var columna in data.d[i]) {
                                tablaHTML += "<td>" + data.d[i][columna] + "</td>";
                            }
                            tablaHTML += "</tr>";
                        }
                        tablaHTML += "</tbody></table>";
                        $("#tablaContainer").html(tablaHTML); // Agrega la tabla al contenedor
                    } else {
                        // En caso de que no haya datos, mostrar un mensaje o realizar alguna acción
                        $("#tablaContainer").html("<p>No hay datos disponibles.</p>");

                        var tablaHTML = "<table class='table table-striped'><thead><tr><th>Error</th></tr></thead><tbody><tr><th>No se encontraron Datos</th></tr></tbody></table>";
                        $("#tablaContainer").html(tablaHTML); // Agrega la tabla al contenedor

                        
                        
                    }
                },

                error: function (error) {
                    alert("Error al cargar los datos.");
                }
            });
        });
    </script>

  
    <script>

        function BuscarDatosCURP_SOL() {

            if ($("#<%=txtCurp_sol.ClientID%>").val().length < 18) { $("#<%= lbl_CURP_SOL.ClientID %>").hide(); $("#<%= lbl_CURP_SOL_ERROR.ClientID %>").hide(); }
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
                    url: "Metodos.aspx/BuscarCURPlinea",
                    data: "{curp : '" + String(curp) + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (datos) {
                        console.log(curp);
                        datos = JSON.parse(datos.d);
                        if (datos.Result == "1") {
                            $("#<%= lbl_CURP_SOL_ERROR.ClientID %>").hide();
                             if (datos.Data.nombres.length > 0) {
                                 $("#<%=txtNombre_sol.ClientID%>").val(datos.Data.nombres);
                                 $("#<%=txtPrimer_sol.ClientID%>").val(datos.Data.apellido1);
                                 $("#<%=txtSegun_sol.ClientID%>").val(datos.Data.apellido2);

                                 var formattedDate = moment(datos.Data.fechNac, "DD/MM/YYYY").format("YYYY-MM-DD");
                                 $("#<%=date_fecha_nac_sol.ClientID%>").val(formattedDate);

                                 if (datos.Data.sexo == "M") {
                                     var id_parentesco = $("#<%=ddl_parentesco.ClientID%>").val();
                                      switch (id_parentesco) {
                                          case '2':
                                          case '4':
                                          case '6':
                                          case '8':
                                          case '11':
                                              alert("Favor de Verificar el Parentesco");
                                              $("#<%= ddl_parentesco.ClientID %>").val("-1");
                                            ValidatorValidate(document.getElementById("<%=rfvParentesco.ClientID%>"));;
                                            document.getElementById("<%= rfvParentesco.ClientID %>").errorMessage = "Favor de elegir el parentesco correcto.";
                                            break;
                                        default:
                                    }
                                }
                                else if (datos.Data.sexo == "H") {
                                    var id_parentesco = $("#<%=ddl_parentesco.ClientID%>").val();
                                    switch (id_parentesco) {
                                        case '3':
                                        case '5':
                                        case '7':
                                        case '9':
                                        case '10':
                                            alert("Favor de Verificar el Parentesco");
                                            $("#<%= ddl_parentesco.ClientID %>").val("-1");
                                            ValidatorValidate(document.getElementById("<%=rfvParentesco.ClientID%>"));;
                                              document.getElementById("<%= rfvParentesco.ClientID %>").errorMessage = "Favor de elegir el parentesco correcto.";
                                              break;
                                          default:
                                      }
                                  }

                                <%--if (datos.Data.numEntidadReg == "28") {
                                    $("#<%=ddl_Mun_sol.ClientID%>").prop("disabled", false);
                                                    $("#<%=ddl_Mun_sol.ClientID%>").val((parseInt(datos.Data.cveMunicipioReg, 10)).toString());
                                }--%>
                             }
                         } if (datos.Result == "0") {
                            <%--  var mensaje = document.getElementById('<%= RequiredFieldValidator2.ErrorMessage %>').innerHTML;
                              alert(mensaje)--%>
                             $("#<%= lbl_CURP_SOL.ClientID %>").show();


                         }
                     }, error: function (jqXHR, textStatus, errorThrown) {
                         $("#<%= lbl_CURP_SOL_ERROR.ClientID %>").show();
                     }

                 });
            }
        }
        function BuscarDatosCURP_PAC() {
            if ($("#<%=txtCurp_pac.ClientID%>").val().length < 18) { $("#<%= lbl_CURP.ClientID %>").hide(); $("#<%= lbl_CURP_ERROR.ClientID %>").hide(); }
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
                    url: "Metodos.aspx/BuscarCURPlinea",
                    data: "{curp : '" + String(curp) + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (datos) {
                        console.log(curp);
                        datos = JSON.parse(datos.d);
                        if (datos.Result == "1") {
                            $("#<%= lbl_CURP_ERROR.ClientID %>").hide();
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
                        if (datos.Result == "0") {
                            <%--  var mensaje = document.getElementById('<%= RequiredFieldValidator2.ErrorMessage %>').innerHTML;
                              alert(mensaje)--%>
                            $("#<%= lbl_CURP.ClientID %>").show();
                        }
                    }, error: function (jqXHR, textStatus, errorThrown) {
                        $("#<%= lbl_CURP_ERROR.ClientID %>").show();
                    }
                });
            }
        }
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }
        function xxx(s) {
            var rgx = /^[0-9]*\.?[0-9]*$/;
            return s.match(rgx);
        }
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

            // Verificar si es un postback y si el control específico ha cambiado
            if (!<%= Page.IsPostBack.ToString().ToLower() %> ) {
                var fechaInicio = new Date(1980, 0, 1).toISOString().split("T")[0];
                $('#<%= date_fecha_nac_sol.ClientID %>').val(fechaInicio);
                $('#<%= date_fecha_nac_pac.ClientID %>').val(fechaInicio);
            }

          
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
        $("#<%=ddl_parentesco.ClientID %>").change(function () {
            var texto = $("#<%=txtCurp_sol.ClientID %>").val();
            var sexo = texto.charAt(10);

            if (sexo == "M") {
                var id_parentesco = $("#<%=ddl_parentesco.ClientID%>").val();
                switch (id_parentesco) {
                    case '2':
                    case '4':
                    case '6':
                    case '8':
                    case '11':
                        alert("Favor de Verificar el Parentesco");
                        $("#<%= ddl_parentesco.ClientID %>").val("-1");
                        ValidatorValidate(document.getElementById("<%=rfvParentesco.ClientID%>"));;
                        document.getElementById("<%= rfvParentesco.ClientID %>").errorMessage = "Favor de elegir el parentesco correcto.";
                        break;
                    default:
                }
            }
            else if (sexo == "H") {
                var id_parentesco = $("#<%=ddl_parentesco.ClientID%>").val();
                switch (id_parentesco) {
                    case '3':
                    case '5':
                    case '7':
                    case '9':
                    case '10':
                        alert("Favor de Verificar el Parentesco");
                        $("#<%= ddl_parentesco.ClientID %>").val("-1");
                        ValidatorValidate(document.getElementById("<%=rfvParentesco.ClientID%>"));;
                        document.getElementById("<%= rfvParentesco.ClientID %>").errorMessage = "Favor de elegir el parentesco correcto.";
                        break;
                    default:
                }
            }
        });
            $(document).ready(function () {
                var rowCount = 1;
                // Manejador de eventos para el botón "Agregar"
                $('.btnAgregar').click(function () {
                    var id_solicitud = $('#id_solicitud').text();  // Obtén el ID de la fila
                    //alert(id_solicitud);

                    // Obtener los valores del texto y el selector de estatus
                    var observaciones = $('#txtObservaciones1').val().toUpperCase();
                    var estatusValue = $('#ddlEstatus1').val();
                    var estatusText = $('#ddlEstatus1 option:selected').text(); // Obtener el texto seleccionado

                    var fechaHoraActual = new Date();

                  
                    var año = fechaHoraActual.getFullYear();
                    var mes = (fechaHoraActual.getMonth() + 1).toString().padStart(2, '0');
                    var dia = fechaHoraActual.getDate().toString().padStart(2, '0');
                    var horas = fechaHoraActual.getHours().toString().padStart(2, '0');
                    var minutos = fechaHoraActual.getMinutes().toString().padStart(2, '0');
                    var segundos = fechaHoraActual.getSeconds().toString().padStart(2, '0');

                 
                    var fecha_reg = `${año}-${mes}-${dia} ${horas}:${minutos}:${segundos}`;

                   


                    // Validar que se haya ingresado una observación
                    if (observaciones.trim() === '') {
                        alert('Debes ingresar una observación.');
                        return;
                    }
                    // Crear un objeto con los datos que se enviarán al servidor
                    var data = {
                        id: parseInt(id_solicitud),
                        observaciones: observaciones,
                        id_estatus: estatusValue
                    };
                    // Realiza una solicitud AJAX para guardar los datos en el servidor
                    $.ajax({
                        type: 'POST',
                        url: 'Metodos.aspx/GuardarDatos', // Reemplaza 'TuPagina.aspx' con la ruta correcta
                        data: JSON.stringify(data),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            // Maneja la respuesta del servidor si es necesario
                            if (response.d === 'OK') {
                                // Si la respuesta es 'OK', se guardó correctamente, puedes realizar acciones adicionales aquí
                                //alert('Datos guardados correctamente.');
                            } else {
                                alert('Error al guardar los datos. Contacte al equipo de desarrollo');
                            }
                        }, error: function (xhr, textStatus, errorThrown) {
                            // Manejo de errores si es necesario
                            alert('Error en la solicitud AJAX.');
                        }
                    });
                    // Crear una nueva fila con los valores
                    var newRow = '<tr>' +
                        '<td>' + observaciones + '</td>' +
                        '<td>' + estatusText + '</td>' +
                        '<td>' + fecha_reg + '</td>' +
                        '</tr>';
                    // Agregar la nueva fila a la tabla de historial
                    $('#historialTable tbody').append(newRow);
                    // Limpiar los campos de entrada
                    $('#txtObservaciones1').val('');
                    rowCount++;
                });
                // Selecciona el modal por su identificador
                var modal = $('#exampleModal');
                // Escucha el evento de cierre del modal
                modal.on('hidden.bs.modal', function () {
                    $('#<%= btnUpdateTrigger.ClientID %>').click();
                });

            });
    </script>
   



    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>



</asp:Content>

