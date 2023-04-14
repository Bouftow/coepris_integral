<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Verificacion.aspx.cs" Inherits="Verificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../css/CustomInput.css" rel="stylesheet" />
    <link href="../css/sitio.css" rel="stylesheet" />
    <style>
        .uppercase {
            text-transform: uppercase;
        }

        ::-webkit-input-placeholder { /* WebKit browsers */
            text-transform: none;
        }

        :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            text-transform: none;
        }

        ::-moz-placeholder { /* Mozilla Firefox 19+ */
            text-transform: none;
        }

        :-ms-input-placeholder { /* Internet Explorer 10+ */
            text-transform: none;
        }

        ::placeholder { /* Recent browsers */
            text-transform: none;
        }

        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }

        @font-face {
            font-family: 'Novecentowide-Bold';
            font-size: 1000px;
            src: url('../fonts/Novecentowide-Bold.otf') format('opentype');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'HelveticaNeueLTStd-Bd';
            src: url('../font/HelveticaNeueLTStd-Bd.otf') format('opentype');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'HelveticaNeueLTStd-Lt';
            src: url('../fonts/HelveticaNeueLTStd-Lt.otf') format('opentype');
            font-weight: normal;
            font-style: normal;
        }

        .black {
            color: black
        }
    </style>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
<%--    <%=Comedores.ShowMenu(String.Format("verificacion.default.-1"),this.Page) %>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <div class="card-block card" style="margin-bottom: 0px">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered" style="display: unset;">
                <div class="header-block">
                    <h4 style="text-align: center;">VERIFICACIÓN DE INFORMACIÓN PROGRAMA COMEDORES SEGUROS</h4>
                </div>
            </div>
            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            <asp:Panel ID="panelRegistro" runat="server">
                <div class="panel-body">
                    <div class="form-group">
                        <h4 class="text-center">Datos de la institución.</h4>
                    </div>


                   
                    <div class="col-sm-12 text-center"><asp:Label ID="lblControl" runat="server"></asp:Label></div>
                    <div class="col"><asp:Label ID="lblClave" runat="server"></asp:Label></div><br />
                    <div class="col"><asp:Label ID="lblNombre" runat="server"></asp:Label></div>
                    <div class="col"><asp:Label ID="lblUnidadConsumo" runat="server"></asp:Label></div><br />
                    
                    <div class="col"><asp:Label ID="lblTurno" runat="server"></asp:Label></div>
                    <div class="col"><asp:Label ID="lblTIpo" runat="server"></asp:Label></div>
                    <div class="col"><asp:Label ID="lblAmbito" runat="server"></asp:Label></div><br />

                    
                    <div class="col"><asp:Label ID="lblCoordinacion" runat="server"></asp:Label></div> <br />

                    <div class="col"><asp:Label ID="lblMunicipio" runat="server" ></asp:Label></div>
                    <div class="col"><asp:Label ID="lblCP" runat="server"></asp:Label></div> 
                    <div class="col"><asp:Label ID="lblLocalidad" runat="server"></asp:Label></div> 
                   
                    <div class="col"><asp:Label ID="lblColonia" runat="server"></asp:Label></div> 
                    <div class="col"><asp:Label ID="lblVialidad" runat="server" ></asp:Label></div>
                    <div class="col"><asp:Label ID="lblNumExt" runat="server"></asp:Label></div><br />

                    


                    <div class="form-group">
                        <h4 class="text-center">Datos del responsable de la unidad de consumo escolar.</h4>
                    </div>
                    <div class="col"><asp:Label runat="server" ID="lblNombreCompleto"></asp:Label></div>
                    <div class="col"><asp:Label ID="lblTel" runat="server"></asp:Label></div>
                    <div class="col"><asp:Label ID="lblCorreo" runat="server"></asp:Label></div>
                   
                   
                    
                  



                </div>
            </asp:Panel>

            <div class="col-sm-12">
            </div>
        </div>
    </div>
    <div class="jumbotron bg-azul-tam text-center">
        <div class="row">
            <div class="offset-sm-3 col-sm-6">
                <span style="font-size: 8pt;">
                    <strong>COMISIÓN ESTATAL PARA LA PROTECCIÓN CONTRA RIESGOS SANITARIOS</strong><br />
                    Calle 8 entre Berriozabal y Anaya #1020 Planta Baja,<br />
                    Zona Centro 87000, Cd. Victoria Tamaulipas<br />
                    800 720 3774</span>
            </div>
        </div>
    </div>
    <div class="modal fade" data-keyboard="false" data-backdrop="static" id="ModalSolLicSan" tabindex="-1" role="dialog" aria-labelledby="ModalSolLicSanlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="ModalSolLicSanlabel">VERIFICACIÓN DE INFORMACIÓN DEL PROGRAMA COMEDORES ESCOLARES</h5>
                </div>
                <div class="modal-body text-center">
                    <asp:Label runat="server" ID="lblErrorModal">El QR proporcionado no es legítimo.</br> En caso de que crea que es un error, intente escanearlo nuevamente.</asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="container">
                        <div class="col text-center">
                            <button runat="server" id="btn_registro" type="button" class="btn btn-danger">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>

