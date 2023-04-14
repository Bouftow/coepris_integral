<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Captura.aspx.cs" Inherits="sistema_Cursos_Captura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">

    <style>
    .select {
    position: relative;
    display: inline-block;
    margin-bottom: 15px;
    width: 100%;
}    .select select {
        font-family: 'Arial';
        display: inline-block;
        width: 100%;
        cursor: pointer;
        padding: 6px 10px;
        outline: 0;
        border: 1px solid #929191;
        border-radius: 10px;
        background: #ffffff;
        color: #7b7b7b;
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
    }
        .select select::-ms-expand {
            display: none;
        }
        .select select:hover,
        .select select:focus {
            color: #000000;
            background: #ebf2f8;
        }
        .select select:disabled {
            opacity: 0.5;
            pointer-events: none;
        }
.select_arrow {
    position: absolute;
    top: 16px;
    right: 16px;
    pointer-events: none;
    border-style: solid;
    border-width: 8px 5px 0px 5px;
    border-color: #000000 transparent transparent transparent;
}
.select select:hover ~ .select_arrow,
.select select:focus ~ .select_arrow {
    border-top-color: #000000;
}
.select select:disabled ~ .select_arrow {
    border-top-color: #cccccc;
}

        .max-wt {
            max-width: 120px;
            min-width: 120px;
        }

        .sinespacio {
            padding: 0px,0px,0px,0px !important;
            margin: 0px,0px,0px,0px !important;
        }

        input[type="radio"] + label {
            display: inline-block;
            max-width: 100%;
            margin-bottom: 5px;
            margin-left: 4px;
            font-weight: normal;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            background: transparent;
            bottom: 0;
            color: transparent;
            cursor: pointer;
            height: auto;
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
            width: auto;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("admin.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-pencil-square-o"></i>&nbsp;Captura. Cursos buenas prácticas
            </h3><a href="default.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <hr />
            
        </div>
    </div>

    <div class="card card-block">

        <h4>Datos del Curso</h4>
        <div class="row">
            <div class="col-sm-4">
                <label>Fecha de curso:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator6" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="Fecha_Curso" CssClass="text-danger" ErrorMessage="Elige una fecha." Text="*"></asp:RequiredFieldValidator></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" type="date" AutoComplete="off" ID="Fecha_Curso" runat="server" ValidationGroup="EnviarDatos"></asp:TextBox>

                </div>



            </div>
            <div class="col-sm-4">
                <label>Fecha de vencimiento:&nbsp;</label>
                <div class="form-group">
                    <asp:TextBox onchange="prro()" disabled="true" class="form-control" type="date" AutoComplete="off" ID="Fecha_Vigencia" runat="server" ValidationGroup="EnviarDatos"></asp:TextBox>
                </div>
            </div>
        </div>
        <script>

            $("#<%= Fecha_Curso.ClientID %>").change(function () {
                //var nuev =
                $("#<%= Fecha_Vigencia.ClientID %>").val($("#<%= Fecha_Curso.ClientID %>").val());
                    //alert(nuev);

                    var from = $("#<%= Fecha_Curso.ClientID %>").val().split("-")
                    var f = new Date(from[0], from[1], from[2])

                    var dia = from[2];
                    var mes = 0;
                    var año = 0;
                    if ((parseInt(from[1], 10) + 6) <= 12) { mes = parseInt(from[1], 10) + 6; año = parseInt(from[0], 10) }
                    else { mes = parseInt(from[1], 10) - 6; año = parseInt(from[0], 10) + 1; }


                    var mes_vigencia = mes.toString();
                    if (mes_vigencia.length == 1) { mes_vigencia = "0" + mes_vigencia }

                    var año_vigencia = año.toString();
                    if (año_vigencia.length == 1) { año_vigencia = "0" + año_vigencia }


                    $("#<%= Fecha_Vigencia.ClientID %>").val(año_vigencia + '-' + mes_vigencia + '-' + from[2]);


                });




        </script>

        <h4 style="margin-top: 10px">Datos del participante</h4>
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
        <div class="row" style="margin-top: 10px">

            <div class="col-sm-2 justify-content-center align-self-center">
                <label>Género</label>
                <asp:RadioButtonList ID="RadioButtonList1" CssClass="sinespacio" runat="server">
                    <asp:ListItem>Masculino</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-sm  justify-content-center align-self-center">
                <div class="form-group">
                    <label>Correo electrónico:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator5" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="retxtCorreo" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Correo electrónico" ID="txtCorreo" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-2 justify-content-center align-self-center" style="min-width: 227px">

                <div class="form-group">
                    <label>Telefono móvil:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator13" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtTel" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="Se requiere el número telefónico." Text="*"></asp:RequiredFieldValidator></label>
                    <asp:TextBox autocomplete="nel" MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" ID="txtTel" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-2 justify-content-center align-self-center" style="min-width: 227px">
                <div class="form-group">
                    <label>Telefono fijo: (Opcional)&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator1" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtTel" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="Se requiere el número telefónico." Text="*"></asp:RequiredFieldValidator></label>
                    <asp:TextBox autocomplete="nel" MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" ID="TextBox1" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                </div>
            </div>

        </div>


        <h4 style="margin-top: 10px">Datos del Establecimiento</h4>
        <div class="row">
            <div class="col-sm-6 justify-content-center align-self-center">
                <label>Nombre del establecimiento:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator7" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="Se requiere el nombre." Text="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="EnviarDatos" ControlToValidate="txtNombre" runat="server" ErrorMessage="El nombre no debe iniciar ni finalizar con espacio" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                <div class="form-group">
                    <asp:TextBox TextMode="MultiLine" Rows="1" placeholder="Nombre del establecimiento" ID="txtEst" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-2 justify-content-center align-self-center" style="min-width: 227px">
                <div class="form-group">
                    <label>Telefono móvil:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator8" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtTel" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="Se requiere el número telefónico." Text="*"></asp:RequiredFieldValidator></label>
                    <asp:TextBox autocomplete="nel" MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" ID="TextBox2" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-2 justify-content-center align-self-center" style="min-width: 227px">
                <div class="form-group">
                    <label>Telefono fijo: (Opcional)&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator9" runat="server" ValidationGroup="EnviarDatos" ControlToValidate="txtTel" SetFocusOnError="true" CssClass="text-danger" ErrorMessage="Se requiere el número telefónico." Text="*"></asp:RequiredFieldValidator></label>
                    <asp:TextBox autocomplete="nel" MaxLength="10" MinLength="10" placeholder="Número a 10 dígitos" ID="TextBox3" onkeypress="return numbersonly(event)" ValidationGroup="EnviarDatos" CssClass="form-control uppercase" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3 select justify-content-center align-self-center" style="min-width: 283px">
                <label>Municipio:&nbsp;</label>
                <asp:DropDownList ID="ddlMunicipio" EnableViewState="true" CssClass="minselect text-center" Width="100%" AutoPostBack="false" runat="server">
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
            <div class="col-sm justify-content-center align-self-center">
                <div class="form-group">
                    <label>Localidad:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator11" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Localidad" ID="TextBox4" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm justify-content-center align-self-center">
                <div class="form-group">
                    <label>C.P.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator10" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Código postal" ID="TextBox5" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>




             <div class="row" >
            <div class="col-sm justify-content-center align-self-center">
                <div class="form-group">
                    <label>Colonia:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator12" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Colonia" ID="TextBox6" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
                  <div class="col-sm justify-content-center align-self-center">
                <div class="form-group">
                    <label>Calle:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator14" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Calle" ID="TextBox7" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
                 
            </div>
        <div class="row" >
            <div class="col-sm justify-content-center align-self-center">
                <div class="form-group">
                    <label>Entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator15" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Entre calle" ID="TextBox8" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
                  <div class="col-sm justify-content-center align-self-center">
                <div class="form-group">
                    <label>y entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator16" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Y entre calle" ID="TextBox9" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
             <div class="col-sm-2 justify-content-center align-self-center">
                <div class="form-group">
                    <label>Num. Int.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator17" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator11" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Número interior" ID="TextBox10" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-2 justify-content-center align-self-center">
                <div class="form-group">
                    <label>Num. Ext.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator18" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator12" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Número exterior" ID="TextBox11" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
                 
            </div>
        <div class="justify-content-center align-self-center">
        <a href="default.aspx" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;Guardar</a>
            </div>



        <%-- <div class="row" style="margin-top: 10px">
            <div class="col-sm  justify-content-center align-self-center">
                <div class="form-group">
                    <label>Calle:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator14" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Correo electrónico" ID="TextBox7" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator15" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Correo electrónico" ID="TextBox8" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Y entre:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator16" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Correo electrónico" ID="TextBox9" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Num. Ext.:&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator17" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator11" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Correo electrónico" ID="TextBox10" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Num. Int.&nbsp;<asp:RequiredFieldValidator EnableClientScript="False" ID="RequiredFieldValidator18" ValidationGroup="EnviarDatos" runat="server" ControlToValidate="txtCorreo" SetFocusOnError="true" ErrorMessage="Se requiere el correo electrónico." CssClass="text-danger" Text="*"> </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator12" ValidationGroup="EnviarDatos" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Correo electrónico no válido" CssClass="text-danger" ValidationExpression="^[^\s]+(\s+[^\s]+)*$" Text="*"></asp:RegularExpressionValidator></label>
                    <asp:TextBox autocomplete="nel" placeholder="Correo electrónico" ID="TextBox11" onkeypress="return correoregex(event)" class="form-control" CssClass="form-control uppercase" ValidationGroup="EnviarDatos" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
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

