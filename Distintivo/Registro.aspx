<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Distintivo_Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../css/CustomInput.css" rel="stylesheet" />
    <link href="../css/sitio.css" rel="stylesheet" />
    <style>
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
      
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Distintivos.ShowMenu(String.Format("Registro.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">

               
            <div class="card text-center" style="display: unset;">
                <div class="header-block">
                    <h3><strong> PROGRAMA ESTABLECIMIENTO SEGURO</strong></h3>
               
                </div>
            </div>
           
          
             
            <div class="text-center" style="text-transform:uppercase"><a id="Inicio"></a><h2><asp:Label ID="carga" runat="server"></asp:Label></h2></div>
            <%--<button type="button" onclick="ke()">Cliqueame</button>--%>   

            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            <asp:Panel ID="panelRegistro" runat="server">
                <div class="panel panel-primary">
                      <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" ValidationGroup="EnviarDatos" runat="server" />
                    <div class="panel-body">
                        <div class="form-group">
                            <h4 class="text-center">Datos del responsable de implementación de medidas sanitarias</h4>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Nombre:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator2" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="Se requiere el nombre." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" runat="server" ErrorMessage="El nombre no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre o nombres" ID="txtNombre" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Primer apellido:<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator3" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtApellidop" CssClass="text-danger" ErrorMessage="Se requiere el primer apellido." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="EnviarDatos" ControlToValidate="txtApellidop" runat="server" ErrorMessage="El primer apellido no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Primer Apellido" ID="txtApellidop" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label>Segundo apellido:<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator4" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtApellidom" CssClass="text-danger" ErrorMessage="Se requiere el segundo apellido." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="EnviarDatos" ControlToValidate="txtApellidom" runat="server" ErrorMessage="El segundo apellido no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Segundo Apellido" ID="txtApellidom" onkeypress="return sololetras(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Número telefónico:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator13" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtTel" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="Se requiere el número telefónico." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" ID="txtTel" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Correo electrónico:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator5" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="retxtCorreo" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                    <asp:TextBox placeholder="Correo electrónico" ID="txtCorreo" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <h4 class="text-center">Datos del establecimiento</h4>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Nombre del establecimiento:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator1" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre_est" CssClass="text-danger" ErrorMessage="Se requiere el nombre del establecimiento." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="EnviarDatos" SetFocusOnError="true" ControlToValidate="txtNombre_est" runat="server" ErrorMessage="El nombre del establecimiento no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Nombre del establecimiento" ID="txtNombre_est" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                         <div class="row">
                            <div class="col-sm-6">
                                <label>Razón Social:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator9" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtRazonSocial" CssClass="text-danger" ErrorMessage="Se requiere la razón social." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationGroup="EnviarDatos" SetFocusOnError="true" ControlToValidate="txtRazonSocial" runat="server" ErrorMessage="La razón social no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Razón social" ID="txtRazonSocial" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>Calle:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator6" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtCalle" CssClass="text-danger" ErrorMessage="Se requiere la calle." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="EnviarDatos" ControlToValidate="txtCalle" runat="server" ErrorMessage="La calle no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Calle" ID="txtCalle" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Número exterior:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator7" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNum_ext" CssClass="text-danger" ErrorMessage="Se requiere el número exterior." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="EnviarDatos" ControlToValidate="txtNum_ext" runat="server" ErrorMessage="El número exterior no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
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
                                <label>Colonia/Fraccionamiento:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator8" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtColonia" CssClass="text-danger" ErrorMessage="Se requiere la colonia." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationGroup="EnviarDatos" ControlToValidate="txtColonia" runat="server" ErrorMessage="La colonia no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Colonia/Fraccionamiento" ID="txtColonia" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col">
                                <label>Entre calles:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator12" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtEntreCalles" CssClass="text-danger" ErrorMessage="Se requieren las entre calles." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationGroup="EnviarDatos" ControlToValidate="txtEntrecalles" runat="server" ErrorMessage="Las entrecalles no deben iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
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


                                <asp:DropDownList ID="ddlMunicipio" EnableViewState="true" CssClass="minselect text-center" Width="100%" OnSelectedIndexChanged="ddlMunicipio_SelectedIndexChanged" OnInit="ddlMunicipio_Load" runat="server">
                                    <asp:ListItem Value="Victoria"> Victoria</asp:ListItem>
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
                                    <asp:ListItem Value="Villagrán">Villagrán</asp:ListItem>
                                    <asp:ListItem Value="Xicoténcatl">Xicoténcatl</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col">
                                <label>Código Postal:&nbsp;<asp:RequiredFieldValidator enableclientscript="False" ID="RequiredFieldValidator11" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtCP" CssClass="text-danger" ErrorMessage="Se requiere el código postal(5 dígitos)." Text="*"></asp:RequiredFieldValidator></label>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Código postal" MaxLength="5" MinLength="5" ID="txtCP" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="form-group estil">
                            <strong>Horario de apertura establecimiento:</strong>

                            <asp:Table runat="server" ID="horario" Font-Size="X-Large">
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Lunes<input type="checkbox" runat="server" id="chkLunes" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraLunesAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraLunesCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Martes<input type="checkbox" runat="server" id="chkMartes" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraMartesAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraMartesCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Miércoles<input type="checkbox" runat="server" id="chkMiercoles" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraMiercolesAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraMiercolesCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Jueves<input type="checkbox" runat="server" id="chkJueves" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraJuevesAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraJuevesCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Viernes<input type="checkbox" runat="server" id="chkViernes" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraViernesAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraViernesCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Sábado<input type="checkbox" runat="server" id="chkSabado" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraSabadoAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraSabadoCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <div class="control-group">
                                            <label class="control control-checkbox">
                                                Domingo<input type="checkbox" runat="server" id="chkDomingo" />
                                                <div class="control_indicator"></div>
                                            </label>
                                        </div>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraDomingoAbre" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                        <asp:TextBox runat="server" ID="txtHoraDomingoCierra" type="time" class="form-control-sm" />
                                    </asp:TableHeaderCell>

                                </asp:TableRow>
                            </asp:Table>
                        </div>

                        <label>Medio por el que se enteró:&nbsp;</label>
                        <div class="col-sm-6 select ">
                         
                        
                                <asp:DropDownList ID="ddlMedio_Conocido" EnableViewState="true" CssClass="minselect text-center" Width="100%" runat="server" OnInit="ddlMedio_Conocido_Load" onchange="Otro()" OnSelectedIndexChanged="ddlMedio_Conocido_SelectedIndexChanged">
                                    <asp:ListItem Value="1">Por el Facebook de Coepris</asp:ListItem>
                                    <asp:ListItem Value="2">Por una publicación de un conocido</asp:ListItem>
                                    <asp:ListItem Value="3">Por la Cámara a la que pertenezco</asp:ListItem>
                                    <asp:ListItem Value="4">Por la publicación del acuerdo</asp:ListItem>
                                    <asp:ListItem Value="5">Por invitación de un asesor de Coepris</asp:ListItem>
                                    <asp:ListItem Value="6">Por una notificación (dictamen) que recibí</asp:ListItem>
                                    <asp:ListItem Value="7">Por las pantallas del CIS en Coepris</asp:ListItem>
                                    <asp:ListItem Value="8">Otro</asp:ListItem>
                                </asp:DropDownList>

                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    var valor = $(<%=ddlMedio_Conocido.ClientID%>).val();
                                    if (valor != 8) {
                                        $(<%=txtmedio_conocido.ClientID%>).hide();
                                    } else {
                                        $(<%=txtmedio_conocido.ClientID%>).show();
                                    }
                                });

                                function Otro() {
                                    //var texto = $("#<%=ddlMedio_Conocido.ClientID%> option:selected").text();
                                    var valor = $(<%=ddlMedio_Conocido.ClientID%>).val();
                                    if (valor == 8) {
                                        $(<%=txtmedio_conocido.ClientID%>).show();

                                    }
                                    else {
                                        $(<%=txtmedio_conocido.ClientID%>).hide();
                                    }
                                } 
                            </script>
                        </div>
                        <asp:TextBox runat="server" ID="txtmedio_conocido" CssClass="form-control" placeholder="Medio por el cual se enteró del sistema"></asp:TextBox>
                    </div>
                    <div class="panel-footer text-center" style="margin: 1vw">
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
                    <h5 class="modal-title" id="ModalSolLicSanlabel">Registro de establecimientos seguros</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" ID="lblErrorModal">No has elegido un Giro en la sección de inicio o ha ocurrido un error. Asegúrate de seleccionar un giro y presionar el botón de registro</asp:Label>
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
                    <h5 class="modal-title" id="ModalOnErrorlabel">Registro de establecimientos seguros</h5>
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
                                <h3 class="text-center">Datos del establecimiento</h3>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>Nombre del establecimiento:&nbsp;</label>
                                    <div class="form-group">
                                        <asp:TextBox Enabled="false" ID="lblNombre_est" CssClass="form-control uppercase" runat="server"></asp:TextBox>
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
                            <div class="form-group estil text-center">
                                <strong>Horario de apertura establecimiento:</strong>

                                <asp:Table runat="server" ID="Table1" Font-Size="X-Large">
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Lunes<input type="checkbox" runat="server" id="chkLunes_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraLunesAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraLunesCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Martes<input type="checkbox" runat="server" id="chkMartes_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraMartesAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraMartesCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Miércoles<input type="checkbox" runat="server" id="chkMiercoles_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraMiercolesAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraMiercolesCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Jueves<input type="checkbox" runat="server" id="chkJueves_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraJuevesAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraJuevesCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Viernes<input type="checkbox" runat="server" id="chkViernes_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraViernesAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraViernesCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Sábado<input type="checkbox" runat="server" id="chkSabado_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraSabadoAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraSabadoCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <div class="control-group">
                                                <label class="control control-checkbox">
                                                    Domingo<input type="checkbox" runat="server" id="chkDomingo_Check" />
                                                    <div class="control_indicator"></div>
                                                </label>
                                            </div>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraDomingoAbre_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>&nbsp a&nbsp</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                            <asp:TextBox runat="server" ID="txtHoraDomingoCierra_Check" type="time" class="form-control-sm" />
                                        </asp:TableHeaderCell>

                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                   
                </div>
                <div class="modal-footer">
                    <div class="container container-fluid">
                        <div class="col text-center">
                            <button href="#" data-toggle="modal" data-target="#ModalOnError" data-backdrop="static" data-keyboard="false"  ValidationGroup="EnviarDatos" runat="server" onserverclick="btnEnviar_Click" id="Button1" type="button" class="btn btn-success ml-auto ">Acepto que los datos son verídicos.</button>
                            <button type="button" class="btn btn-danger mr-auto" data-dismiss="modal">Modificar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
             $("#<%=lblColonia.ClientID%>").val($("#<%=txtColonia.ClientID%>").val());
             $("#<%=lblCalle.ClientID%>").val($("#<%=txtCalle.ClientID%>").val());
             $("#<%=lblNum_ext.ClientID%>").val($("#<%=txtNum_ext.ClientID%>").val());
             $("#<%=lblNum_int.ClientID%>").val($("#<%=txtNum_int.ClientID%>").val());
             $("#<%=lblEntreCalles.ClientID%>").val($("#<%=txtEntreCalles.ClientID%>").val());
             $("#<%=lblLocalidad.ClientID%>").val($("#<%=txtLocalidad.ClientID%>").val());
             $("#<%=lblMunicipio.ClientID%>").val($("#<%=ddlMunicipio.ClientID%>").val());
             $("#<%=lblCP.ClientID%>").val($("#<%=txtCP.ClientID%>").val());

             if ($('#<%=chkLunes.ClientID%>').prop('checked')) { $("#<%=chkLunes_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkLunes_Check.ClientID%>").prop('checked', false); }
             if ($('#<%=chkMartes.ClientID%>').prop('checked')) { $("#<%=chkMartes_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkMartes_Check.ClientID%>").prop('checked', false); }
             if ($('#<%=chkMiercoles.ClientID%>').prop('checked')) { $("#<%=chkMiercoles_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkMiercoles_Check.ClientID%>").prop('checked', false); }
             if ($('#<%=chkJueves.ClientID%>').prop('checked')) { $("#<%=chkJueves_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkJueves_Check.ClientID%>").prop('checked', false); }
             if ($('#<%=chkViernes.ClientID%>').prop('checked')) { $("#<%=chkViernes_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkViernes_Check.ClientID%>").prop('checked', false); }
             if ($('#<%=chkSabado.ClientID%>').prop('checked')) { $("#<%=chkSabado_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkSabado_Check.ClientID%>").prop('checked', false); }
             if ($('#<%=chkDomingo.ClientID%>').prop('checked')) { $("#<%=chkDomingo_Check.ClientID%>").prop('checked', true); } else { $("#<%=chkDomingo_Check.ClientID%>").prop('checked', false); }


             $("#<%=txtHoraLunesAbre_Check.ClientID%>").val($("#<%=txtHoraLunesAbre.ClientID%>").val());
             $("#<%=txtHoraMartesAbre_Check.ClientID%>").val($("#<%=txtHoraMartesAbre.ClientID%>").val());
             $("#<%=txtHoraMiercolesAbre_Check.ClientID%>").val($("#<%=txtHoraMiercolesAbre.ClientID%>").val());
             $("#<%=txtHoraJuevesAbre_Check.ClientID%>").val($("#<%=txtHoraJuevesAbre.ClientID%>").val());
             $("#<%=txtHoraViernesAbre_Check.ClientID%>").val($("#<%=txtHoraViernesAbre.ClientID%>").val());
             $("#<%=txtHoraSabadoAbre_Check.ClientID%>").val($("#<%=txtHoraSabadoAbre.ClientID%>").val());
             $("#<%=txtHoraDomingoAbre_Check.ClientID%>").val($("#<%=txtHoraDomingoAbre.ClientID%>").val());

             $("#<%=txtHoraLunesCierra_Check.ClientID%>").val($("#<%=txtHoraLunesCierra.ClientID%>").val());
             $("#<%=txtHoraMartesCierra_Check.ClientID%>").val($("#<%=txtHoraMartesCierra.ClientID%>").val());
             $("#<%=txtHoraMiercolesCierra_Check.ClientID%>").val($("#<%=txtHoraMiercolesCierra.ClientID%>").val());
             $("#<%=txtHoraJuevesCierra_Check.ClientID%>").val($("#<%=txtHoraJuevesCierra.ClientID%>").val());
             $("#<%=txtHoraViernesCierra_Check.ClientID%>").val($("#<%=txtHoraViernesCierra.ClientID%>").val());
             $("#<%=txtHoraSabadoCierra_Check.ClientID%>").val($("#<%=txtHoraSabadoCierra.ClientID%>").val());
             $("#<%=txtHoraDomingoCierra_Check.ClientID%>").val($("#<%=txtHoraDomingoCierra.ClientID%>").val());

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
        $('#ModalSolLicSan').on('hide.bs.modal', function (e) { window.location.replace("default.aspx");})
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


</asp:Content>

