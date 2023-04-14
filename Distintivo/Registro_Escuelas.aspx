<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Registro_Escuelas.aspx.cs" Inherits="Distintivo_Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../css/CustomInput.css" rel="stylesheet" />
    <link href="../css/sitio.css" rel="stylesheet" />
    <style>
    .borde-rojo { border-color:red}
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

        .text-red {
            font-family: Novecentowide-Bold;
            color: red !important;
            margin: 15px;
            padding: 15px;
            text-align: center;
            /*border:solid;
           border-color:#367fa9;*/
        }
        input[type="radio"] {
            margin-right: 5px !important;
        }

            input[type="radio"] + label {
                font-weight: normal;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Distintivos.ShowMenu(String.Format("Registro.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <script type="text/javascript" language="javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        //DisableBackButton();
        //window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>

     <div class="modal fade" id="ModalAlta" tabindex="-1" role="dialog" aria-labelledby="ModalAltalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAltalabel">Evidencias</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAlta" name="FileAlta[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAlta" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered" style="display: unset;">
                <div class="header-block">
                    <h4 style="text-align: center;">REGISTRO PROGRAMA ESCUELA SEGURA</h4>
                </div>
            </div>
            <div style="display: none; text-transform: uppercase" class="text-center">
                <a id="Inicio"></a>
                <h2>
                    <asp:Label ID="carga" runat="server"></asp:Label></h2>
            </div>
            <%--<button type="button" onclick="ke()">Cliqueame</button>--%>
            <asp:Label CssClass="text-red text-justify" runat="server" ID="requiere">FAVOR DE REGISTRARSE SOLAMENTE EN CASO DE CONTAR CON LA EVIDENCIA DOCUMENTAL SOLICITADA EN LA HERRAMIENTA DE EVALAUCIÓN</asp:Label>
            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            <asp:Label runat="server" ID="LblMsgFile"></asp:Label>

            <asp:Panel ID="panelRegistro" runat="server">
                <div class="panel panel-primary">
                    <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" ValidationGroup="EnviarDatos" runat="server" />
                    <div class="panel-body">
                        <div class="form-group">
                            <h4 class="text-center">Datos del responsable de implementación de medidas sanitarias</h4>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Nombre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator2" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="Se requiere el nombre." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" runat="server" ErrorMessage="El nombre no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre o nombres" ID="txtNombre" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Primer apellido:<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator3" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtApellidop" CssClass="text-danger" ErrorMessage="Se requiere el primer apellido." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="EnviarDatos" ControlToValidate="txtApellidop" runat="server" ErrorMessage="El primer apellido no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="txtApellidop" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Segundo apellido:<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator4" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtApellidom" CssClass="text-danger" ErrorMessage="Se requiere el segundo apellido." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="EnviarDatos" ControlToValidate="txtApellidom" runat="server" ErrorMessage="El segundo apellido no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtApellidom" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Número telefónico:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator13" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre_est" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="Se requiere el número telefónico." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" ID="txtTel" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Correo electrónico:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator5" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="retxtCorreo" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                    <asp:TextBox placeholder="Correo electrónico" ID="txtCorreo" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <h4 class="text-center">Datos de la institución educativa</h4>
                        </div>
                        <div id="Publicas" runat="server">
                                <label>Nivel educativo:</label>
                        <div class="row" style="margin-bottom: 1vw">
                               <div class="col-sm-2" style="min-width:156px"><asp:RadioButton ID="RadioButton1" runat="server" Text="Media Superior" GroupName="Nivel" />  </div>
                               <div class="col-sm-2" style="min-width:156px"><asp:RadioButton ID="RadioButton2" runat="server" Text="Superior" GroupName="Nivel" /> </div>
                                   
                        </div>
                        </div>
                            <div id="Privadas" runat="server">
                               

                               <asp:HiddenField id="hdn_select" runat="server"/>
                                <select  id="select_nivel" class="form-control borde-rojo" style="width:30%;margin-bottom:10px">
                                  
                                        <option value="-1">Selecciona un nivel educativo</option>
                                        <option>Preescolar</option>
                                        <option>Primaria</option>
                                        <option>Secundaria</option>
                                    <script>if (!($("#<%=hdn_select.ClientID%>").val() == "" || $("#<%=hdn_select.ClientID%>").val() == null)) { $("#select_nivel").val($("#<%=hdn_select.ClientID%>").val()); $("#select_nivel").removeAttr("border-color"); $("#select_nivel").removeClass("borde-rojo") } </script>
                                </select>
                                <script> $(function () {
                                        $('#select_nivel').on('change', function () {
                                            //alert(this.value);
                                            $("#<%=hdn_select.ClientID%>").val($('#select_nivel').val());
                                            ////alert($("#<%=hdn_select.ClientID%>").val());
                                            $("#select_nivel").find("option[value='-1']").remove(); 
                                            $("#select_nivel").removeAttr("border-color");
                                            $("#select_nivel").removeClass("borde-rojo")

                                        })
                                    }); </script>

                            </div>

                        <div class="row">
                            <div class="col-sm-8">
                                <label>Nombre de la institución educativa:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre_est" CssClass="text-danger" ErrorMessage="Se requiere el nombre de la institución educativa." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="EnviarDatos" SetFocusOnError="true" ControlToValidate="txtNombre_est" runat="server" ErrorMessage="El nombre de la institución educativa no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox TextMode="MultiLine" Rows="1" onkeydown="resize(this)" placeholder="Nombre de la instutución educativa" ID="txtNombre_est" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>

                                <script>
                                    function resize(x) {
                                        var limite = 40;
                                        var largo = x.value.length;
                                        var filas_actuales = x.rows;
                                        var largoporcolumna = limite * filas_actuales;
                                        if (largo > largoporcolumna) {
                                            x.rows++;
                                            $("#<%=lblNombre_est.ClientID%>").attr("Rows", x.rows);
                                        }
                                    }
                                </script>
                            </div>
                            <%-- </div>
                         <div class="row">--%>


                            <div class="col-sm-4">
                                <label>Clave del centro de trabajo(CCT):&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator9" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtRazonSocial" CssClass="text-danger" ErrorMessage="Se requiere la clave del centro de trabajo." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationGroup="EnviarDatos" SetFocusOnError="true" ControlToValidate="txtRazonSocial" runat="server" ErrorMessage="La razón social no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Clave del centro de trabajo(CCT)" ID="txtRazonSocial" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col-6">
                                <label>Calle:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator6" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtCalle" CssClass="text-danger" ErrorMessage="Se requiere la calle." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="EnviarDatos" ControlToValidate="txtCalle" runat="server" ErrorMessage="La calle no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Calle" ID="txtCalle" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Número exterior:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator7" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNum_ext" CssClass="text-danger" ErrorMessage="Se requiere el número exterior." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="EnviarDatos" ControlToValidate="txtNum_ext" runat="server" ErrorMessage="El número exterior no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Número exterior" ID="txtNum_ext" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Número interior:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Número interior" ID="txtNum_int" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Colonia/Fraccionamiento:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator8" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtColonia" CssClass="text-danger" ErrorMessage="Se requiere la colonia." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationGroup="EnviarDatos" ControlToValidate="txtColonia" runat="server" ErrorMessage="La colonia no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Colonia/Fraccionamiento" ID="txtColonia" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Entre calles:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator12" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtEntreCalles" CssClass="text-danger" ErrorMessage="Se requieren las entre calles." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationGroup="EnviarDatos" ControlToValidate="txtEntrecalles" runat="server" ErrorMessage="Las entrecalles no deben iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Entre calles" ID="txtEntreCalles" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Localidad:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Localidad" ID="txtLocalidad" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col select">
                                <label>Municipio:&nbsp;</label>
                                <asp:DropDownList ID="ddlMunicipio" EnableViewState="true" CssClass="minselect text-center" Width="100%"  runat="server">
                                    <asp:ListItem Value="-1">Selecciona un municipio</asp:ListItem>
                                    <asp:ListItem Value="Abasolo">Abasolo</asp:ListItem>
                                    <asp:ListItem Value="Aldama">Aldama</asp:ListItem>
                                    <asp:ListItem Value="Altamira">Altamira</asp:ListItem>
                                    <asp:ListItem Value="Antiguo Morelos">Antiguo Morelos</asp:ListItem>
                                    <asp:ListItem Value="Burgos">Burgos</asp:ListItem>
                                    <asp:ListItem Value="Bustamante">Bustamante</asp:ListItem>
                                    <asp:ListItem Value="Camargo">Camargo</asp:ListItem>
                                    <asp:ListItem Value="Casas">Casas</asp:ListItem>
                                    <asp:ListItem Value="Ciudad Madero">Ciudad Madero</asp:ListItem>
                                    <asp:ListItem Value="Cruillas">Cruillas</asp:ListItem>
                                    <asp:ListItem Value="El Mante">El Mante</asp:ListItem>
                                    <asp:ListItem Value="Gómez Farías">Gómez Farías</asp:ListItem>
                                    <asp:ListItem Value="González">González</asp:ListItem>
                                    <asp:ListItem Value="Güémez">Güémez</asp:ListItem>
                                    <asp:ListItem Value="Guerrero">Guerrero</asp:ListItem>
                                    <asp:ListItem Value="Gustavo Díaz Ordaz">Gustavo Díaz Ordaz</asp:ListItem>
                                    <asp:ListItem Value="Hidalgo">Hidalgo</asp:ListItem>
                                    <asp:ListItem Value="Jaumave">Jaumave</asp:ListItem>
                                    <asp:ListItem Value="Jiménez">Jiménez</asp:ListItem>
                                    <asp:ListItem Value="Llera">Llera</asp:ListItem>
                                    <asp:ListItem Value="Mainero">Mainero</asp:ListItem>
                                    <asp:ListItem Value="Matamoros">Matamoros</asp:ListItem>
                                    <asp:ListItem Value="Méndez">Méndez</asp:ListItem>
                                    <asp:ListItem Value="Mier">Mier</asp:ListItem>
                                    <asp:ListItem Value="Miguel Alemán">Miguel Alemán</asp:ListItem>
                                    <asp:ListItem Value="Miquihuana">Miquihuana</asp:ListItem>
                                    <asp:ListItem Value="Nuevo Laredo">Nuevo Laredo</asp:ListItem>
                                    <asp:ListItem Value="Nuevo Morelos">Nuevo Morelos</asp:ListItem>
                                    <asp:ListItem Value="Ocampo">Ocampo</asp:ListItem>
                                    <asp:ListItem Value="Padilla">Padilla</asp:ListItem>
                                    <asp:ListItem Value="Palmillas">Palmillas</asp:ListItem>
                                    <asp:ListItem Value="Reynosa">Reynosa</asp:ListItem>
                                    <asp:ListItem Value="Río Bravo">Río Bravo</asp:ListItem>
                                    <asp:ListItem Value="San Carlos">San Carlos</asp:ListItem>
                                    <asp:ListItem Value="San Fernando">San Fernando</asp:ListItem>
                                    <asp:ListItem Value="San Nicolás">San Nicolás</asp:ListItem>
                                    <asp:ListItem Value="Soto la Marina">Soto la Marina</asp:ListItem>
                                    <asp:ListItem Value="Tampico">Tampico</asp:ListItem>
                                    <asp:ListItem Value="Tula">Tula</asp:ListItem>
                                    <asp:ListItem Value="Valle Hermoso">Valle Hermoso</asp:ListItem>
                                    <asp:ListItem Value="Victoria"> Victoria</asp:ListItem>
                                    <asp:ListItem Value="Villagrán">Villagrán</asp:ListItem>
                                    <asp:ListItem Value="Xicoténcatl">Xicoténcatl</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <label>Código Postal:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator11" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtCP" CssClass="text-danger" ErrorMessage="Se requiere el código postal(5 dígitos)." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Código postal" MaxLength="5" MinLength="5" ID="txtCP" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                   
                    <div style="text-align:center;margin:2vw">
                       
                           
                        <button id="botonverde" formnovalidate="formnovalidate" class="btn btn-success"  runat="server">
                            <a style="color: white" runat="server" id="Evidencia" data-fancybox="group" class="lightbox">Clic aquí para visualizar la evidencia cargada</a>
                        </button>
                              
                        <button runat="server" id="btn_Alta" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAlta">
                            Clic aquí para cargar la evidencia documental solicitada.</button>
                    </div>


                    <div class="panel-footer text-center" style="margin-top: 2vw; margin-bottom: 3vw">
                        <asp:LinkButton ID="btnEnviar" ValidationGroup="EnviarDatos" href="#" data-toggle="modal" data-target="#ModalInfoSave" data-backdrop="static" data-keyboard="false" CssClass="btn btn-primary" runat="server">Enviar datos del registro&nbsp;<i class="fa fa-send"></i></asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>

            <div class="col-sm-12">
                <div class="jumbotron bg-azul-tam text-center">
                    <div class="row">
                        <div class="offset-sm-3 col-sm-6">
                            <span style="font-size: 8pt;">
                                <strong>COMISIÓN ESTATAL PARA LA PROTECCIÓN</strong><br />
                                <strong>CONTRA RIESGOS SANITARIOS</strong><br />
                                Calle 8 entre Berriozabal y Anaya #1020 Planta Baja,<br />
                                Zona Centro 87000, Cd. Victoria Tamaulipas<br />
                                800 720 3774</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalSolLicSan" tabindex="-1" role="dialog" aria-labelledby="ModalSolLicSanlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="ModalSolLicSanlabel">Registro de escuela segura</h5>
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
                            <button runat="server" id="btn_registro" onserverclick="btn_registro_ServerClick" type="button" class="btn btn-success ">Regresar a inicio</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalOnError" tabindex="-1" role="dialog" aria-labelledby="ModalOnErrorlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="ModalOnErrorlabel">Registro de escuela segura</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" ID="Label1">Favor de verificar los campos de captura</asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="container">
                        <div class="col text-center">
                            <button type="button" id="totop" class="btn btn-danger mr-auto" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalInfoSave" tabindex="-1" role="dialog" aria-labelledby="ModalInfoSavelabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="ModalInfoSavelabel">¿Está seguro que enviará esta información?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <div class="form-group">
                            <h3 class="text-center">Datos del responsable de implementación de medidas sanitarias</h3>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Nombre:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblNombre" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Primer apellido:</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblApellidop" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Segundo apellido:</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblApellidom" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Número telefónico:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblTel" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Correo electrónico:&nbsp;</label>
                                    <asp:TextBox Enabled="false" ID="lblCorreo" class="form-control" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <h3 class="text-center">Datos de la institución educativa</h3>
                        </div>

                         <div class="row" style="margin-bottom: 1vw">
                              <div class="col">
                                  <label>Nivel educativo:&nbsp;</label>
                                <asp:Label ID="Nivel_Radio" CssClass="uppercase" runat="server" Text=""></asp:Label>

                        </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8">
                                <label>Nombre de la institución educativa:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox TextMode="MultiLine" Rows="1" Enabled="false" ID="lblNombre_est" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Clave del centro de trabajo(CCT):&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblrazonsocial_est" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>Calle:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblCalle" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Número exterior:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblNum_ext" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Número interior:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblNum_int" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Colonia/Fraccionamiento:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblColonia" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Entre calles:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblEntreCalles" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Localidad:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblLocalidad" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Municipio:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblMunicipio" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Código Postal:&nbsp;</label>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" ID="lblCP" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="container container-fluid">
                        <div class="col text-center">
                            <button href="#" data-toggle="modal" data-target="#ModalOnError" data-backdrop="static" data-keyboard="false" validationgroup="EnviarDatos" runat="server" onserverclick="btnEnviar_Click" id="Button1" type="button" class="btn btn-success ml-auto ">Acepto que los datos son verídicos.</button>
                            <button type="button" class="btn btn-danger mr-auto" data-dismiss="modal">Modificar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="sessionid" runat="server"/>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script type="text/javascript">
        $("#menu_registro").show();
    </script>
    

    <script type="text/javascript">

        $(<%=btnEnviar.ClientID%>).click(function () {

            $("#<%=lblNombre.ClientID%>").val($("#<%=txtNombre.ClientID%>").val());
            $("#<%=lblApellidop.ClientID%>").val($("#<%=txtApellidop.ClientID%>").val());
            $("#<%=lblApellidom.ClientID%>").val($("#<%=txtApellidom.ClientID%>").val());
            $("#<%=lblTel.ClientID%>").val($("#<%=txtTel.ClientID%>").val());
            $("#<%=lblCorreo.ClientID%>").val($("#<%=txtCorreo.ClientID%>").val());
            $("#<%=lblNombre_est.ClientID%>").val($("#<%=txtNombre_est.ClientID%>").val());
            $("#<%=lblrazonsocial_est.ClientID%>").val($("#<%=txtRazonSocial.ClientID%>").val());
            $("#<%=lblColonia.ClientID%>").val($("#<%=txtColonia.ClientID%>").val());
            $("#<%=lblCalle.ClientID%>").val($("#<%=txtCalle.ClientID%>").val());
            $("#<%=lblNum_ext.ClientID%>").val($("#<%=txtNum_ext.ClientID%>").val());
            $("#<%=lblNum_int.ClientID%>").val($("#<%=txtNum_int.ClientID%>").val());
            $("#<%=lblEntreCalles.ClientID%>").val($("#<%=txtEntreCalles.ClientID%>").val());
            $("#<%=lblLocalidad.ClientID%>").val($("#<%=txtLocalidad.ClientID%>").val());
            $("#<%=lblMunicipio.ClientID%>").val($("#<%=ddlMunicipio.ClientID%>").val());
            $("#<%=lblCP.ClientID%>").val($("#<%=txtCP.ClientID%>").val());

            if ($("#<%=RadioButton1.ClientID%>").is(':checked')) { $("#<%=Nivel_Radio.ClientID%>").text("Media Superior");  }
            if ($("#<%=RadioButton2.ClientID%>").is(':checked')) { $("#<%=Nivel_Radio.ClientID%>").text("Superior"); alert(x);  }


        });

        $(<%=Button1.ClientID%>).click(function () {
            $('#ModalInfoSave').modal("hide");

        });



    </script>
    <script>
        $('#ModalOnError').on('hidden.bs.modal', function () {
            $("#Inicio").attr("tabindex", -1).focus();
        })
    </script>



    <script>
        $('#ModalSolLicSan').on('hide.bs.modal', function (e) { window.location.replace("default.aspx"); })
    </script>

    <%--Solo Numeros--%>
    <script>
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
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
        //sessionid
        var sesion = $("#<%=sessionid.ClientID%>").val();

        var id_folio = <%=Request.Params["id"]%>;
        Sys.Application.add_load(function () {
            $(window).on('load', function () {
                var varIP = [];
                var varIPC = [];
                $("#FileAlta").fileinput({
                    //allowedFileTypes: ['pdf'],
                    allowedFileExtensions: ['pdf'],
                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "archivo-subir.aspx?archivo=Evidencias&tipo=Distintivo&sesion="+sesion, // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); __doPostBack(); });
            });
            $("#btn_upAlta").click(function () { $("#FileAlta").fileinput("upload"); });
        });
    </script>
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
 
</asp:Content>

