<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="NewPrvdrs.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../../js/jquery-1.11.3.min.js"></script>
    <script src="../../js/jquery-ui-1.12.1.js"></script>
    <script src="../../js/jquery-ui.min-1.12.1.js"></script>


    <script src="../../js/plugins/sortable.js" type="text/javascript"></script>
    <script src="../../js/fileinput.js" type="text/javascript"></script>
    <script src="../../js/locales/fr.js" type="text/javascript"></script>
    <script src="../../js/locales/es.js" type="text/javascript"></script>
    <script src="../../themes/fas/theme.js" type="text/javascript"></script>

    <script src="../../themes/explorer-fas/theme.js" type="text/javascript"></script>
    <link href="../../js/jquery-ui.css" rel="stylesheet" />


    <link href="../../themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css" />
    <%--<link href="css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.css" />
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">--%>
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">--%>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <link href="../../css/sitio.css" rel="stylesheet" />

    <style>
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


        .oro {
            text-align: center
        }

        .spaced input[type="radio"] {
            margin-right: 5px; /* Or any other value */
        }

        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">

   <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="card-block">
        <div class="tab-content">
            <div class="card-block card">
                <div class="card-header card-header-sm bordered">
                    <div class="header-block">

                        <h2 id="NombreDeCoordinacion" runat="server"></h2>

                    </div>
                </div>

                <div class="card" runat="server">
                    <div class="select container-fluid">
                        <br />


                        <div class="container">
                            Coordinación:<br />
                            <asp:DropDownList ID="DropDownList1" runat="server"
                                Width="40%"
                                DataTextField="nombre_coordinacion"
                                AutoPostBack="True"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                DataValueField="id_coordinacion">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RQDropDownList1" Text="Selecione una Coordinación" InitialValue="-1" ControlToValidate="DropDownList1" runat="server" />
                            <br />
                            <br />


                            <div>
                                <label>Información de Proveedor</label><br />

                                <div class="row col-sm-7">
                                    Nombre de Proveedor:<br />
                                    <asp:TextBox ID="txtNombreProv" class="form-control css-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqprov" runat="server"
                                        ControlToValidate="txtNombreProv"
                                        ErrorMessage="Ingrese nombre."
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div style="margin-left: 10px" class="row col-sm-3">
                                    Teléfono:<br />
                                    <asp:TextBox ID="txtTelefono"  onkeypress="return numbersonly(event)" oninput="return numbersonly(event)" class="form-control css-input" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>



                        <label>Dirección del Proveedor</label><br />

                        <div class="col-sm-12">
                            <div class="row col-sm-5">
                          <div class="select" style="width:200%;margin-right:50px; padding-right:50px;padding-top:15px">
                                    <asp:DropDownList ID="ddlMunicipio"
                                        EnableViewState="true"
                                        runat="server">
                                        <asp:ListItem Selected="True" Value="Victoria"> Victoria</asp:ListItem>
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

                            </div>
                             <div class="row col-sm-3">
                                 Código Postal:
                        <asp:TextBox ID="txtCp"  onkeypress="return numbersonly(event)" oninput="return numbersonly(event)" class="form-control css-input" runat="server"></asp:TextBox>
                            </div>
                            </div>
                        
                        <br />
                        <div class="col-sm-12">
                        <div class="row col-sm-4">
                            Colonia:<br />
                            <asp:TextBox ID="txtColonia" class="form-control css-input" runat="server"></asp:TextBox>
                        </div>
                        <div style="margin-left:10px" class="row col-sm-4">
                            Calle:<br />
                            <asp:TextBox ID="txtCalle" class="form-control css-input" runat="server"></asp:TextBox>
                              </div>
                              <div  style="margin-left:10px" class="row col-sm-4">
                            Referencias:<br />
                            <asp:TextBox ID="txtReferencias" class="form-control css-input" runat="server"></asp:TextBox>
                        </div>
                        </div>
                    </div>
            </div>





            <br />
        </div>
        <div style="text-align: center">
            <asp:Button ID="Buttona" Text="Guardar" runat="server" class="boton-azo" OnClick="Button_Click" />
        </div>
    </div>

    </div>

    <label id="lblmsg" runat="server"></label>
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
</asp:Content>
