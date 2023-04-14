<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Captura_Escuelas.aspx.cs" Inherits="Reportes_Comedores_Captura_Escuelas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("reportes_distintivo.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <div class="card-block card helvetica">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered" style="display: unset;" id="SH" runat="server">
                <h4>Captura de escuelas</h4>
            </div>
            <asp:Label runat="server" ID="LblMsg" CssClass="alert alert-danger" Visible="false"></asp:Label>
            <div class="card-block">
               
                <div class="row">

                    <div class="col-sm-3" style="min-width: 220px">
                        <label>Clave CT:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_ClaveCCT" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtClaveCCT" CssClass="text-danger" ErrorMessage="Se requiere la Clave de Centro de Trabajo." Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox placeholder="ClaveCT" ID="txtClaveCCT" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col">
                        <label>Nombre de la institución:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_Nombre" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="Se requiere el Nombre de la Institución" Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox placeholder="Nombre de la Escuela" ID="txtNombre" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col select container-fluid">
                            <label>Municipio:&nbsp<a id="A1" runat="server"></a></label>
                            <asp:DropDownList ID="ddlMunicipio"
                                EnableViewState="true" Width="100%"
                                runat="server">
                                <asp:ListItem Selected="True" Value="-1">Selecciona un municipio</asp:ListItem>
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
                        <label>Localidad:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_Localidad" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtLocalidad" CssClass="text-danger" ErrorMessage="Se requiere localidad." Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox placeholder="Localidad" ID="txtLocalidad"  ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-sm-3">
                        <label>Código Postal:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_CP" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCP" CssClass="text-danger" ErrorMessage="Se requiere el código postal." Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox onkeypress="return numbersonly(event)" placeholder="Código Postal" ID="txtCP"  ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col">
                        <label>Colonia:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_txtColonia" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtColonia" CssClass="text-danger" ErrorMessage="Se requiere Colonia." Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox placeholder="Colonia" ID="txtColonia"  ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col">
                        <label>Vialidad:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_txtVialidad" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtVialidad" CssClass="text-danger" ErrorMessage="Se requiere la Calle." Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox placeholder="Vialidad" ID="txtVialidad"  ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>
                       <div class="col-sm-2">
                        <label>Número:<asp:RequiredFieldValidator EnableClientScript="False" ID="RFV_txtNumext" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtNumext" CssClass="text-danger" ErrorMessage="Se requiere el número exterior." Text="*"></asp:RequiredFieldValidator></label>
                        <div class="form-group">
                            <asp:TextBox onkeypress="return numbersonly(event)" placeholder="Número Exterior" ID="txtNumext"  ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label>Turno:</label>
                        <select id="ddlturno" class="form-control" runat="server">
                                    <option style="color: gray" value="-1" disabled selected>Selecciona un tipo de unidad de consumo escolar</option>
                                    <option class="black" value="CONTINUO">CONTINUO</option>
                                    <option class="black" value="DISCONTINUO">DISCONTINUO</option>
                                    <option class="black" value="MATUTINO">MATUTINO</option>
                                    <option class="black" value="VESPERTNO">VESPERTNO</option>
                                    <option class="black" value="NOCTURNO">NOCTURNO</option>
                                </select>
                    </div>
                    <div class="col">
                        <label>Nivel Educativo:</label>
                         <select id="ddltipo" class="form-control" runat="server">
                                    <option style="color: gray" value="-1" disabled selected>Selecciona un tipo de unidad de consumo escolar</option>
                                    <option class="black" value="PREESCOLAR">PREESCOLAR</option>
                                    <option class="black" value="CAM">CAM</option>
                                    <option class="black" value="SECUNDARIA GENERAL">SECUNDARIA GENERAL</option>
                                    <option class="black" value="TELESECUNDARIA">TELESECUNDARIA</option>
                                    <option class="black" value="LACTANTE Y MATERNAL">LACTANTE Y MATERNAL</option>
                                    <option class="black" value="SECUNDARIA TÉCNICA">SECUNDARIA TÉCNICA</option>
                                    <option class="black" value="PRIMARIA">PRIMARIA</option>
                                    <option class="black" value="CONAFE">CONAFE</option>
                                    <option class="black" value="USAER">USAER</option>
                                    <option class="black" value="MEDIASUPERIOR">MEDIASUPERIOR</option>
                                    <option class="black" value="SUPERIOR">SUPERIOR</option>
                                </select>
                    </div>
                    <div class="col">
                        <label>Tipo de Escuela:</label>
                        <select id="ddlcontrol" class="form-control" runat="server">
                                    <option style="color: gray" value="-1" disabled selected>Selecciona un tipo de control</option>
                                    <option class="black" value="PÚBLICO">PÚBLICO</option>
                                    <option class="black" value="PRIVADO">PRIVADO</option>
                                </select>
                    </div>
                    <div class="col">
                        <label>Ámbito:</label>
                       <select id="ddlambito" class="form-control" runat="server">
                                    <option style="color: gray" value="-1" disabled selected>Selecciona un ámbito</option>
                                    <option class="black" value="RURAL">RURAL</option>
                                    <option class="black" value="URBANO">URBANO</option>

                                </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center"> <asp:Button runat="server" CssClass="btn btn-primary" Text="Guardar" ValidationGroup="EnviarDatos" ID="btn_Guardar" OnClick="btn_Guardar_Click" /></div>
         
    </div>
  



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
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
   
</asp:Content>

