<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

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
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Comedores.ShowMenu(String.Format("registro.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <div class="card-block card" style="margin-bottom:0px">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered" style="display: unset;">
                <div class="header-block">
                    <h4 style="text-align: center;">CAPACITACIÓN PROGRAMA COMEDORES SEGUROS</h4>
                </div>
            </div>

            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            <asp:Panel ID="panelRegistro" runat="server">
              
                  <%--  <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" ValidationGroup="EnviarDatos" runat="server" />--%>
                    <div class="panel-body">



                         <div class="form-group">
                            <h4 class="text-center">Datos de la institución.</h4>
                        </div>

                        <div class="row">
                            <div class="col-sm-4">
                                <label>Clave del centro de trabajo:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtClave" CssClass="text-danger" ErrorMessage="Se requiere la clave de centro de trabajo." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre del establecimiento" OnTextChanged="txtClave_TextChanged" AutoPostBack="true" ID="txtClave" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-sm-8">
                                <label>Tipo de unidad de consumo escolar</label>
                                <select id="select" class="form-control" runat="server">

                                    <option style="color: gray" value="-1" disabled selected>Selecciona un tipo de unidad de consumo escolar</option>
                                    <option class="black" value="1">Cafetería</option>
                                    <option class="black" value="2">Cooperativa escolar</option>
                                    <option class="black" value="3">Desayunador escolar del DIF</option>
                                    <option class="black" value="4">Otros</option>

                                </select>
                                <script>$(document).ready(function () {
                                        $('#select').css('color', 'gray');
                                        $('#select').change(function () {
                                            var current = $('#select').val();
                                            if (current != '-1') {
                                                $('#select').css('color', 'black');
                                            } else {
                                                $('#select').css('color', 'gray');
                                            }
                                        });
                                    });</script>
                            </div>
                       
                            </div>


                        <div class="row">
                             <div class="col-sm-6">
                                <label>Nombre de la Institución:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtNombreEscuela" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <label>Localidad:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLocalidad" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-sm-3">
                                <label>Tipo:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtTipo" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>




                        <div class="form-group">
                            <h4 class="text-center">Datos del responsable de la unidad de consumo escolar.</h4>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Nombre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator2" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="Se requiere el nombre." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox AutoComplete="off" placeholder="Nombre o nombres" ID="txtNombre" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Primer apellido:<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator3" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtApellidop" CssClass="text-danger" ErrorMessage="Se requiere el primer apellido." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="txtApellidop" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Segundo apellido:<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator4" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtApellidom" CssClass="text-danger" ErrorMessage="Se requiere el segundo apellido." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtApellidom" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Número telefónico:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator13" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtTel" SetFocusOnError="true" ErrorMessage="Se requiere el número telefónico." CssClass="text-danger" Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox MaxLength="10" placeholder="Número a 10 dígitos" ID="txtTel" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Correo electrónico:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator5" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox placeholder="Correo electrónico" ID="txtCorreo" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                         
                    <div class="panel-footer text-center" style="margin: 1vw">
                        <asp:LinkButton OnClick="btnEnviar_Click" ID="btnEnviar" ValidationGroup="EnviarDatos" CssClass="btn btn-primary" runat="server">Continuar a la capacitación&nbsp;<i class="fa fa-send"></i></asp:LinkButton>
                    </div>
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
    <div class="modal fade" id="ModalSolLicSan" tabindex="-1" role="dialog" aria-labelledby="ModalSolLicSanlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="ModalSolLicSanlabel">CAPACITACIÓN PROGRAMA COMEDORES SEGUROS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" ID="lblErrorModal">No has elegido un giro en la sección de inicio o ha ocurrido un error. <br /><br /> <strong>Asegúrate de leer y descargar la herramienta de evaluación proporcionada en la pantalla anterior.</strong> <br /><br /> En caso de que creas que es un error comunícate a los medios de contacto al final de la página a la que serás redirigido para que seas atendido. </asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="container">
                        <div class="col text-center">
                            <button runat="server" id="btn_registro" onserverclick="btn_registro_ServerClick" type="button" class="btn btn-success ">Intentar de nuevo</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">

        <%--Solo Numeros--%>
        <script>
            function numbersonly(e) {
                var unicode = e.charCode ? e.charCode : e.keyCode
                if (unicode != 8 && unicode != 44) {
                    if (unicode < 48 || unicode > 57) //if not a number
                    { return false }  //disable key press    
                }
            }
        </script>
    <%--Solo letras--%>
    <script>
        function sololetras(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;
            patron = /[A-Za-z\sñÑáéíóúÁÉÍÓÚÜü]/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }
    </script>

    <%--Solo letras y @ . - _ --%>
     <script> 
         function correoregex(e) {
             tecla = (document.all) ? e.keyCode : e.which;
             if (tecla == 8) return true;
             patron = /[A-Za-zñÑáéíóúÁÉÍÓÚÜü@._\-0-9+]/;
             te = String.fromCharCode(tecla);
             return patron.test(te);
         }
     </script>
 <script type="text/javascript">  
     var splitted = "";
     $(document).ready(function () {
         $("#<%=txtClave.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "Registro.aspx/GetCountryNames",
                        method: "post",
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify({ 'term': request.term }),
                        dataType: 'json',
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (err) {
                            alert(err);
                        }
                    });
                }
            });
        });
 </script> 
</asp:Content>

