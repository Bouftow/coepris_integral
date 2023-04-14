<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EditarBitacora.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
     <style>
        table {
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 3px;
        }
        .timepicker{
             width: 100px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">

 
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

   <%-- <input type="text" id="a" runat="server" oninput="tabs()"/>
    
   <input type="button" onclick="ekisde()" />

    <script>  function ekisde() { document.getElementById('<%=a.ClientID %>').value = "#Requisitos" }</script>
       <script>  function tabs() {
               var tabA = document.getElementById('<%=a.ClientID %>').value;
               $('#myTab a[href="' + tabA + '"]').tab('show');
           }
    </script>--%>

    <asp:HiddenField runat="server" id="MueveTabs" />
    <script>
        $(document).ready(function () {
            $('.timepicker').timepicker({
                timeFormat: 'HH:mm ',
                interval: 60,
                minTime: '00:00am',
                maxTime: '11:59pm',
                startTime: '8:00am',
                dynamic: false,
                dropdown: true,
                scrollbar: true

            });
        });
        </script>

    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Editar Captura</h3>
                   
                </div>
                <ul class="nav nav-tabs pull-right" role="tablist" id="myTab">
                    <li class="nav-item"><a class="nav-link active" href="#Solicitante" role="tab" data-toggle="tab">Datos del Propietario</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Establecimiento" role="tab" data-toggle="tab">Datos del Establecimiento</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#ResponsableSanitario" role="tab" data-toggle="tab">Datos del Responsable Sanitario</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Requisitos" role="tab" data-toggle="tab">Requisitos</a> </li>
                </ul>
            </div>
        <%--     
           <asp:Button  runat="server" OnClick="Unnamed_Click" CausesValidation="false"/>--%>
            <div class="card-block">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active fade show" id="Solicitante">

                          <asp:GridView Width="100%"
                        ID="grdNombreTramite"
                        AutoGenerateColumns="false"
                        runat="server" GridLines="None"
                        CssClass="table table-bordered "
                        PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt"
                        OnRowDataBound="grdNombreTramite_RowDataBound"
                        PageSize="7"
                        Style="background: white; text-align: center">

                        <HeaderStyle
                            BackColor="#337ab7"
                            Font-Bold="True"
                            ForeColor="White" />
                        <Columns>

                            <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                            <asp:BoundField HeaderText="Tipo de Trámite" DataField="nombre_tramite" />
                            <asp:BoundField HeaderText="Modalidad" DataField="modalidad" ItemStyle-Wrap="false" ItemStyle-CssClass="b" ItemStyle-BackColor="#8aff7d" ItemStyle-ForeColor="White" />


                        </Columns>

                    </asp:GridView>

                        <div class="col-sm-4" id="fome">
                            Número de Licencia Anterior:
                                    <asp:TextBox ID="txtCertificadoAnterior" class="form-control"
                                        Style="text-transform: uppercase; width: 50%;"
                                        runat="server"
                                        autocomplete="true"></asp:TextBox>
                        </div>





                        <div class="row">
                            <div class="col-sm-12">

                                <h3 style="font-weight: bold">Datos del Propietario:</h3>
                                <div class="form-group col-sm-12">

                                    <label>
                                        CURP:<br />
                                        <asp:TextBox Width="235px" ID="txtCurp" class="form-control b" Style="text-transform: uppercase;"
                                            runat="server" oninput="validarInput(this)" onclick="validarInput(this)"
                                            onkeypress="return curpValida(event)"
                                            MaxLength="18" MinLength="18" autocomplete="true"></asp:TextBox>

                                        <p id="resultado"></p>
                                    <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                            ControlToValidate="txtCurp"
                                            ErrorMessage="Por favor ingrese su curp."
                                            SetFocusOnError="true"
                                            ForeColor="Red">
                                        </asp:RequiredFieldValidator>--%>
                                      <%--   <asp:CustomValidator runat="server" 
                                                ID="CFVCurp" 
                                                ControlToValidate="txtCurp" 
                                                ErrorMessage="Por favor ingrese su curp."
                                                SetFocusOnError="true"
                                                ForeColor="Red" 
                                                ValidateEmptyText="true"
                                                OnServerValidate="Curp_ServerValidate"
                                                clientvalidationfunction="ValidarCURP"></asp:CustomValidator>--%>

                                    </label>
                                    <div class="row">

                                        <div class="col-sm-4 ">
                                            Nombre(s):
                                <asp:TextBox ID="txtNombre" class="form-control css-input"
                                    runat="server" onkeypress="return sololetras(event)"
                                    Style="text-transform: uppercase;"></asp:TextBox>
                                     <%--       <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                                                ControlToValidate="txtNombre"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>--%>
                                      



                                        </div>
                                        <div class="col-sm-4">
                                            Apellido Paterno:
                                 <asp:TextBox ID="txtApellidop" class="form-control css-input"
                                     onkeypress="return sololetras(event)" runat="server"
                                     Style="text-transform: uppercase;"></asp:TextBox>
                                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                                ControlToValidate="txtApellidop"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>--%>
                                              


                                        </div>
                                        
                                        <div class="col-sm-4">
                                            Apellido Materno:
                                 <asp:TextBox ID="txtApellidom" class="form-control css-input"
                                     onkeypress="return sololetras(event)" runat="server"
                                     Style="text-transform: uppercase;"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                ControlToValidate="txtApellidom"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>--%>
                                           

                                        </div>

                                    </div>
                                    <br />  
                                    <div style="width: 100%" class="row">
                                        <div class="col-sm-3">
                                            Telefono Movil:
                              <asp:TextBox Width="120px" ID="txtTelmov" MaxLength="10" MinLength="10" class="form-control css-input" runat="server"
                                  onkeypress="return numbersonly(event)" autocomplete=""></asp:TextBox>
                                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                ControlToValidate="txtTelmov"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>--%>
                                              

                                        </div>

                                        <div class="col-sm-3">
                                            Telefono Fijo:   (Opcional) 
                                <asp:TextBox Width="120px" ID="txtTelfij" SetFocusOnError="true" MaxLength="10" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete=""></asp:TextBox>
                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                                                ControlToValidate="txtTelfij"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>--%>
                                             

                                        </div>

                                    </div>
                                    <br />

                                    <div style="width: 100%" class="row">


                                        <div class="col-sm-5">
                                            <label>
                                                Correo Electronico:<br />
                                                <asp:TextBox ID="txtCorreo" Width="235px" class="form-control b"
                                                    autocomplete="off" onkeyup="validarEmail(this)" onclick="validarEmail(this)"
                                                    runat="server"></asp:TextBox>

                                                <p id="resultadoz"></p>
                                                 

                                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server"
                                                    ControlToValidate=""
                                                    ErrorMessage=""
                                                    SetFocusOnError="true"
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>--%>
                                            </label>




                                        </div>

                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <%-- <h6 style="font-weight: bold; padding-left: 70%">Datos con (*) Opcionales</h6>--%>
                    </div>  
                    <div role="tabpanel" class="tab-pane fade in" id="Establecimiento">



                        <div class="row">
                            <div class="row col-sm-6">
                                <div style="margin-top: 25px">


                                    <h3 style="font-weight: bold">Datos del Establecimiento:</h3>


                                    <div class="form-group">

                                        <div class="row">
                                            <div class="col-sm-8">





                                                <%--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                                                <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRfc" class="form-control" Style="text-transform: uppercase; width:80%"
                                                        runat="server" oninput="validarInput2(this)" onclick="validarInput2(this)"
                                                        onkeypress="return rfcValido2(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true"> </asp:TextBox>
                                                </label>
                                                <p id="resultado2"></p>
                                               


                                               
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                    ControlToValidate=""
                                                    ErrorMessage="Se necesita del RFC."
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>--%>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-11">
                                                Nombre del Establecimiento: 
                                <asp:TextBox TextMode="multiline" Rows="3" ID="txtNombreest" Style="text-transform: uppercase;" class="css-input form-control " runat="server"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                    ControlToValidate="txtNombreest"
                                                    ErrorMessage="Nombre Requerido."
                                                    SetFocusOnError="true"
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>--%>
                                               



                                                Razón Social:<br />
                                                <asp:TextBox TextMode="multiline" rows="3" ID="txtRazonsocial" Style="text-transform: uppercase;" class="form-control css-input" runat="server"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                                    ControlToValidate="txtRazonsocial"
                                                    ErrorMessage="Por favor ingrese la Razón Social."
                                                    SetFocusOnError="true"
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>

                                                <br />
                                               <%-- Giro:
                                                <br />
                                                <asp:TextBox ID="txtGiro" Style="text-transform: uppercase;" class="form-control css-input" runat="server"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                                    ControlToValidate="txtGiro"
                                                    ErrorMessage="Por favor ingrese el Giro."
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>--%>

                                             


                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                    </div>
                                </div>
                            </div>

                            <div class="row col-sm-6">
                                <label>Domicilio:</label>
                                <br />


                                Municipio:<br />

                                <div class="select">
                                    <asp:DropDownList ID="txtMunicipio"
                                        OnSelectedIndexChanged="Selection_Change"
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


                                Localidad:<br />
                                <asp:TextBox ID="txtLocalidad" Style="text-transform: uppercase;" class="form-control css-input" runat="server"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                    ControlToValidate="txtLocalidad"
                                    ErrorMessage="Por favor ingrese la Localidad."
                                    SetFocusOnError="true"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>






                                <div class="row">
                                    <div class="col-sm-9">
                                        Colonia:<br />
                                        <asp:TextBox TextMode="MultiLine" Rows="2" ID="txtColonia" Style="text-transform: uppercase;" class="form-control css-input" runat="server"></asp:TextBox>

                                      <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ControlToValidate="txtColonia"
                                            ErrorMessage="Por favor ingrese la colonia."
                                            ForeColor="Red">
                                        </asp:RequiredFieldValidator>--%>

                                    </div>

                                    <div class="col-sm-3">
                                        C.P.:
                                                <br />
                                        <asp:TextBox ID="txtCP" MaxLength="5" MinLength="5" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete=""></asp:TextBox>
                                      <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                            ControlToValidate="txtCP"
                                            ErrorMessage="Por favor ingrese el Código Postal."
                                            ForeColor="Red">
                                        </asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>

                                <div class="row">
                                     <div class="col-sm-12">
                                        Calle:<br />
                                        <asp:TextBox TextMode="MultiLine" Rows="1" ID="txtCalle" Style="text-transform: uppercase;" class="form-control css-input" runat="server"></asp:TextBox>
                                         </div>
                                    <div class=" col-sm-12">

                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="txtCalle"
                                            ErrorMessage="Por favor ingrese la calle."
                                            ForeColor="Red">
                                        </asp:RequiredFieldValidator>--%>
                                         Número interior/exterior, manzana y lote:<br />
                                          <asp:TextBox ID="txtNumero" TextMode="MultiLine" Rows="2" Style="text-transform: uppercase;"  class="form-control css-input" runat="server"></asp:TextBox>
                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server"
                                            ControlToValidate="txtNumero"
                                            ErrorMessage="Por favor ingrese número."
                                            ForeColor="Red">
                                        </asp:RequiredFieldValidator>--%>
                                        </div>
                                    <div class="col-sm-12">
                                            Referencias:<br />
                                        <asp:TextBox ID="txtReferencias" TextMode="MultiLine" Rows="2" Style="text-transform: uppercase;" class="form-control css-input" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="row">
                                    <label>Información de Contacto:</label>

                                    <br />

                                    <div class="col-sm-8">



                                        <label>
                                            Correo Electrónico del Establecimiento<br />
                                            <asp:TextBox ID="txtCorreoest" Width="235px" class="form-control b"
                                                autocomplete="off" onkeyup="validarEmail2(this)" onclick="validarEmail2(this)"
                                                runat="server"></asp:TextBox>

                                            <p id="resultadoz2"></p>

                                        </label>

                                    </div>

                                    <div class="col-sm-3">
                                        Telefono:
                              <asp:TextBox Width="120px" ID="txtTelest" MaxLength="10" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete=""></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                                                       
                        </div>


                             <label>Horario:</label><br />
                                                
                                            <table>
                                                <tr style="text-align:center">
                                                    <th style="padding: 10px">Días:</th>
                                                    <th style="padding: 10px; border-left:hidden;"></th>
                                                    <th colspan="2" style="text-align:center">Horario 1:</th>
                                                    <th colspan="2" style="text-align:center">Horario 2:</th>
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Lunes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkLunesEst" runat="server" /></td>
                                                    <td><input id="LunesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="LunesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="LunesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="LunesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td> <button id="btnLunes" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Martes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMartesEst" runat="server" /></td>
                                                    <td><input id="MartesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MartesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MartesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MartesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnMartes" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Miércoles:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMiercolesEst" runat="server" /></td>
                                                    <td><input id="MiercolesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MiercolesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MiercolesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MiercolesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td> <button id="btnMiercoles" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Jueves:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkJuevesEst" runat="server" /></td>
                                                    <td><input id="JuevesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="JuevesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="JuevesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="JuevesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnJueves" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>

                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Viernes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkViernesEst" runat="server" /></td>
                                                    <td><input id="ViernesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="ViernesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="ViernesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="ViernesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnViernes" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                 <tr>
                                                    <td style="border-right:hidden  ">Sábado:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkSabadoEst" runat="server" /></td>
                                                    <td><input id="SabadoH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="SabadoH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="SabadoH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="SabadoH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnSabado" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Domingo:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkDomingoEst" runat="server" /></td>
                                                    <td><input id="DomingoH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="DomingoH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="DomingoH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="DomingoH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                </tr>
                                            </table>

                    </div>
                    <div role="tabpanel" class="tab-pane fade in" id="ResponsableSanitario">


                        <div class="row">
                            <div class="col-sm-12">

                                <h3 style="font-weight: bold">Datos del Responsable Sanitario:</h3>
                                <div class="form-group col-sm-12">



                                    <div class="row">

                                        <div class="col-sm-4 ">
                                            Nombre(s):
                                <asp:TextBox ID="txtRnombre" class="form-control css-input"
                                    runat="server" onkeypress="return sololetras(event)"
                                    Style="text-transform: uppercase;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                                ControlToValidate="txtRnombre"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>
                                            
                                        </div>
                                        <div class="col-sm-4">
                                            Apellido Paterno:
                                 <asp:TextBox ID="txtRapellidop" class="form-control css-input"
                                     onkeypress="return sololetras(event)" runat="server"
                                     Style="text-transform: uppercase;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                                ControlToValidate="txtRapellidop"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>

                                        </div>
                                        <div class="col-sm-4">
                                            Apellido Materno:
                                 <asp:TextBox ID="txtRapellidom" class="form-control css-input"
                                     onkeypress="return sololetras(event)" runat="server"
                                     Style="text-transform: uppercase;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                                ControlToValidate="txtRapellidom"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            Grado Académico que Ostenta:
                                              <asp:TextBox ID="txtRgrado" class="form-control css-input" runat="server"
                                                  Style="text-transform: uppercase;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                ControlToValidate="txtRgrado"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>
                                        </div>

                           <%--   <div class="select" style="text-align:center">
                                    <asp:DropDownList Width="15%" ID="DropDownList1"
                                        OnSelectedIndexChanged="Selection_Change"
                                        EnableViewState="true"
                                        runat="server">
                                        <asp:ListItem Selected="True" Value="Profesional">Profesional</asp:ListItem>
                                        <asp:ListItem Value="Provisional">Provisional</asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>
                                        <div class="col-sm-5">
                                             <%--   <a id="Provisional" runat="server" onclick="onclock()">Número de Cédula Profesional</a>--%>
                                         
                                           Número de Cédula Profesional o Provisional
                                              <asp:TextBox ID="txtRcedula" class="form-control css-input" Width="80%"
                                                  runat="server"
                                                  Style="text-transform: uppercase;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                                ControlToValidate="txtRcedula"
                                                ErrorMessage="Campo requerido."
                                                ForeColor="Red">
                                            </asp:RequiredFieldValidator>
                                        </div>


                                    </div>
                                      <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRfcR" class="form-control" Style="text-transform: uppercase;"
                                                        runat="server" oninput="validarInput3(this)" onclick="validarInput3(this)"
                                                        onkeypress="return rfcValido3(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true"> </asp:TextBox>
                                               
                                          <p id="resultado3"></p>
                                             <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                    ControlToValidate="txtRfcR"
                                                    ErrorMessage="Se necesita del RFC."
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>--%>
                                     </label>
                                    <div class="row">


                                        <div class="col-sm-5">
                                          
                             <label>Horario:</label><br />
                                                
                                            <table>
                                                <tr style="text-align:center">
                                                    <th style="padding: 10px">Días:</th>
                                                    <th style="padding: 10px; border-left:hidden;"></th>
                                                    <th colspan="2" style="text-align:center">Horario 1:</th>
                                                    <th colspan="2" style="text-align:center">Horario 2:</th>
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Lunes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkLunesR" runat="server" /></td>
                                                    <td><input id="LunesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="LunesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="LunesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="LunesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td> <button id="btnLunesR" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Martes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMartesR" runat="server" /></td>
                                                    <td><input id="MartesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MartesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MartesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MartesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnMartesR" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Miércoles:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMiercolesR" runat="server" /></td>
                                                    <td><input id="MiercolesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MiercolesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MiercolesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="MiercolesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td> <button id="btnMiercolesR" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Jueves:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkJuevesR" runat="server" /></td>
                                                    <td><input id="JuevesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="JuevesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"/></td>
                                                    <td><input id="JuevesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="JuevesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnJuevesR" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>

                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Viernes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkViernesR" runat="server" /></td>
                                                    <td><input id="ViernesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="ViernesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="ViernesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="ViernesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnViernesR" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                 <tr>
                                                    <td style="border-right:hidden  ">Sábado:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkSabadoR" runat="server" /></td>
                                                    <td><input id="SabadoH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="SabadoH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="SabadoH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="SabadoH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                     <td> <button id="btnSabadoR" causesvalidation="false" onclick="return false;"><i class="fa fa-arrow-down"></i></button></td>
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Domingo:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkDomingoR" runat="server" /></td>
                                                    <td><input id="DomingoH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="DomingoH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="DomingoH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                    <td><input id="DomingoH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade in" id="Requisitos">

                        <div class="container">
                            <br />

                            Folio de Pago:<br />
                            <asp:TextBox ID="txtRui" class="form-control css-input"
                                Style="width: 20%"
                                runat="server" onkeypress="return numbersonly(event)"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                                ControlToValidate="txtRui"
                                ErrorMessage="Campo requerido."
                                SetFocusOnError="true"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                            <br />
                            <label style="font-size: 30px;">Lista de Requisitos</label>

                            <%-- <table>
                                <tr>
                                    <th style="font-size: 18px">Requisito</th>
                                    <th style="font-size: 18px">Cumple</th>
                                </tr>
                                <tr>

                                  

                                    <td>Solicitud de Licencia Sanitaria.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkSolLicSan" runat="server" />
                                       </td>
                                    <td style="border-right:hidden; border-top:hidden; border-bottom:hidden;">
                                      <asp:CustomValidator runat="server" ID="CheckBoxRequired" EnableClientScript="true"
                                        
                                          OnServerValidate="CheckBoxRequired_ServerValidate"
                                            >Debes seleccionar este campo para continuar</asp:CustomValidator>
                                   </td>
                                </tr>

                                <tr>
                                    <td>Título Profesional.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkTituloProf" runat="server" /></td>
                                </tr>

                               
                                <tr>
                                    <td>Cédula Profesional.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkCedulaProf" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Diploma de Especialidad.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkDiplomaEspecial" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Curriculum Vitae.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkCurriculum" runat="server" /></td>
                                </tr>

                                <tr>
                                    <td>Programa Médico.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkProgramaMedico" runat="server" /></td>

                                </tr>
                                <tr>
                                    <td>Relación de material y equipo.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkRelacionMaterialEquipo" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Plano y memoria descriptiva.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkPlanoMemoria" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Alta ante la S.H.C.P.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkAlta" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Papel Membretado.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkPapelMembretado" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Formato de Pago SF-0027.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkPago" runat="server" /></td>
                                      <td style="border-right:hidden; border-top:hidden; border-bottom:hidden;">
                                      <asp:CustomValidator runat="server" ID="CustomValidator1" EnableClientScript="true"
                                            OnServerValidate="CheckBoxRequired_ServerValidate"
                                            ClientValidationFunction="CheckBoxRequired_ClientValidate">Debes seleccionar este campo para continuar</asp:CustomValidator>
                                   </td>
                                </tr>

                                <tr>
                                    <td>Copia de tramite anterior.</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkCopiaTramiteAnterior" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Licencia sanitaria anterior.</td>
                                    <td style="text-align: center">
                                    <asp:CheckBox ID="chkLicenciaSanitariaAnterior" runat="server" /></td>
                                </tr>
                            </table>--%>

                            <table>
                                <tr>
                                    <th>Requisito</th>
                                    <th style="text-align: center">Activo</th>
                                </tr>
                                <tr runat="server" id="uno" style="display: none">
                                    <td>SOLICITUD DE LICENCIA SANITARIA</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chksollicsan" runat="server" />

                                    </td>
                                    <td style="border-right: hidden; border-top: hidden; border-bottom: hidden;">
                                        <%-- <asp:CustomValidator runat="server" ID="CheckBoxRequired" EnableClientScript="true"
                                            OnServerValidate="CheckBoxRequired_ServerValidate">Debes seleccionar este campo para continuar</asp:CustomValidator>--%>
                                    </td>
                                </tr>
                                <tr runat="server" id="dos" style="display: none">
                                    <td>ALTA ANTE la S.H.C.P.</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkaltasat" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="tres" style="display: none">
                                    <td>PLANO Y MEMORIA DESCRIPTIVA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkplanomemoria" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuatro" style="display: none">
                                    <td>RELACION DE MATERIAL Y EQUIPO EXISTENTE</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkrelacionmaterial" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cinco" style="display: none">
                                    <td>PAGO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkpago" runat="server" /></td>
                                    <td style="border-right: hidden; border-top: hidden; border-bottom: hidden;">
                                        <%-- <asp:CustomValidator runat="server" ID="CustomValidator1" EnableClientScript="true"
                                            OnServerValidate="CheckBoxRequired_ServerValidate"
                                            ClientValidationFunction="CheckBoxRequired_ClientValidate">Debes seleccionar este campo para continuar</asp:CustomValidator>--%>
                                    </td>
                                </tr>
                                <tr runat="server" id="seis" style="display: none">
                                    <td>PROGRAMA DE ACTIVIDADES</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkprogramaact" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="siete" style="display: none">
                                    <td>FOTOCOPIA CONVENIO PGJ</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkfotocopiaconvenio" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="ocho" style="display: none">
                                    <td>LIBRO DE REGISTRO DE CADÁVERES</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chklibroregistro" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="nueve" style="display: none">
                                    <td>DESCRIPCION DE TECNICA DE EMBALSAMAMIENTO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdescripciontecnicaembal" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="diez" style="display: none">
                                    <td>TARJETA DE CONTROL</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chktarjetadecontrol" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="once" style="display: none">
                                    <td>CARTA CONSENTIMIENTO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcartaconsentimiento" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="doce" style="display: none">
                                    <td>ACTA CONSTITUTIVA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkactaconstitutiva" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="trece" style="display: none">
                                    <td>REGLAMENTO INTERNO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkreglamentointerno" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="catorce" style="display: none">
                                    <td>VISTO BUENO PROTECCIÓN CIVIL</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkvistoproteccioncivil" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="quince" style="display: none">
                                    <td>RELACION DEL PERSONAL QUE LABORA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkrelacionpersonal" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="dieciseis" style="display: none">
                                    <td>AUTORIZACIÓN DEL SISTEMA DIF</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkautorizaciondif" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="diecisiete" style="display: none">
                                    <td>CÉDULA DE AUTOEVALUACIÓN</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcedulaautoevaluacion" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="dieciocho" style="display: none">
                                    <td>PAPEL MEMBRETADO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkpapelmembretado" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="diecinueve" style="display: none">
                                    <td>AUTORIZACIÓN SET</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkautorizacionset" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veinte" style="display: none">
                                    <td>USO DE SUELO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkusodesuelo" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintiuno" style="display: none">
                                    <td>PROCESO DE LIMPIEZA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkprocesolimpieza" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintidos" style="display: none">
                                    <td>RELACIÓN DE TIPO DE ANÁLISIS</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkrelaciontipoanalisis" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintitres" style="display: none">
                                    <td>ACTA DE VERIFICACIÓN</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkactaverificacion" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veinticuatro" style="display: none">
                                    <td>SOLICITUD</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chksolicitud" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veinticinco" style="display: none">
                                    <td>TÍTULO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chktitulo" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintiseis" style="display: none">
                                    <td>CÉDULA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcedula" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintisiete" style="display: none">
                                    <td>DIPLOMA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdiploma" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintiocho" style="display: none">
                                    <td>CURRICULUM</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcurriculum" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="veintinueve" style="display: none">
                                    <td>2 FOTOGRAFÍAS</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkfotografias" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treinta" style="display: none">
                                    <td>PAGO DEL RESPONSABLE SANITARIO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkpagoresponsable" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintayuno" style="display: none">
                                    <td>AVISO DE FUNCIONAMIENTO</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkavisofunc" runat="server"/></td>
                                </tr>
                                <tr runat="server" id="treintaydos" style="display: none">
                                    <td>DOCUMENTACION DEL TECNICO EN ATENCION MÉDICA PREHOSPITALARIA</></td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdoctecatmedhosp" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintaytres" style="display: none">
                                    <td>PROGRAMA MÉDICO</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkprogramamedico" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintaycuatro" style="display: none">
                                    <td>CARACTERÍSTICAS MECÁNICAS DE LA UNIDAD</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcaracteristicasmecanicas" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintaycinco" style="display: none">
                                    <td>FOTOGRAFÍAS DE LA UNIDAD</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkfotografiasdeunidad" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintayseis" style="display: none">
                                    <td>LICENCIASANITARIAANTERIOR</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chklicenciasanitariaanterior" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintaysiete" style="display: none">
                                    <td>AUTORIZACIÓN DE RESPONSABLE ANTERIOR</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkautorizacionresponsableanterior" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintayocho" style="display: none">
                                    <td>CARTA DE ANTECEDENTES NO PENALES</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkantecedentesnopenales" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="treintaynueve" style="display: none">
                                    <td>POLIZA DE SEGURO ANTE EVENTUALIDADES</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkpolizaseguro" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarenta" style="display: none">
                                    <td>PROGRAMACIÓN DE LA ALIMENTACIÓN DE LA SEMANA Y DOCUMENTACIÓN PROFESIONAL DEL NUTRIÓLOGO</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkprogramaalimentacion" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentayuno" style="display: none">
                                    <td>TÍTULO DE MÉDICO RESPONSABLE</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chktitulo_mr" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentaydos" style="display: none">
                                    <td>CÉDULA DE MÉDICO RESPONSABLE</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcedula_mr" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentaytres" style="display: none">
                                    <td>DIPLOMA DE MÉDICO RESPONSABLE</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdiploma_mr" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentaycuatro" style="display: none">
                                    <td>CURRÍCULUM DE MÉDICO RESPONSABLE</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcurriculum_mr" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentaycinco" style="display: none">
                                    <td>RELACIÓN DE PERSONAL PARAMÉDICO</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkrelacionpersonal_paramedico" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentayseis" style="display: none">
                                    <td>DOCUMENTACIÓN PARA EL TRÁMITE DE LABORATORIO</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdocumentacion_laboratorio" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentaysiete" style="display: none">
                                    <td>COPIA DE LA LICENCIA SANITARIA DEL LABORATORIO MATRIZ</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcopialicencia_matriz" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentayocho" style="display: none">
                                    <td>COPIA DE LA AUTORIZACIÓN DE RESPONSABLE DEL LABORATORIO MATRIZ</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkcopiaautorizacion_matriz" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cuarentaynueve" style="display: none">
                                    <td>DOCUMENTACIÓN PROFESIONAL DEL TÉCNICO EN EL ÁREA</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdocumentacion_tecnico" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cincuenta" style="display: none">
                                    <td>DOCUMENTACIÓN QUE ACREDITE AL RESPONSABLE</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkdocumentacion_responsable" runat="server" /></td>
                                </tr>
                                <tr runat="server" id="cincuentayuno" style="display: none">
                                    <td>FORMA DE LIMPIEZA Y ESTERILIZACIÓN</td>
                                    <td style="text-align: center">
                                        <asp:CheckBox ID="chkformalimpieza" runat="server" /></td>
                                </tr>
                            </table>

                            Observaciones:<br />
                            <asp:TextBox ID="txtObservaciones" class="col-sm-8" runat="server"></asp:TextBox>
                            <br />
                            <br />

                            <div style="text-align: center">
                                <div class="btn-group divs">


                                    <%--OnClick="btnGuardarDatos_Click"--%>
                                    <asp:Button ID="btnGuardarDatos"
                                        OnClientClick="if(!Orolo()) return false;"
                                        
                                        runat="server" class="myButton"
                                        Text="Generar Folio" />
                                    <%-- OnClientClick="if(!Validar()) return false;"--%>
                                  
                                </div>
                            </div>


                        </div>



                    </div>

                </div>

                </div>
            </div>

        </div>

    



    <asp:Literal ID="Lblmsg" runat="server"></asp:Literal>
    <p style="display: none">
        <asp:Label ID="riesgo" runat="server"></asp:Label>
        <asp:Label ID="verificacion" runat="server"></asp:Label>
        <asp:Label ID="modalidad" runat="server"></asp:Label>
        <asp:Label ID="id_tramite" runat="server"></asp:Label>
        <asp:Label ID="categoriareal" runat="server"></asp:Label>
        <asp:TextBox ID="numeroderequisitos" runat="server"></asp:TextBox>
        <asp:HiddenField ID="categoria" runat="server" />

         <asp:HiddenField runat="server" ID="CURPvalido" />
         <asp:HiddenField runat="server" ID="RFCvalido" />
         <asp:HiddenField runat="server" ID="RFC_R_valido" />
         <asp:HiddenField runat="server" ID="HiddenField4" />

    </p>

    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function Orolo() {
            var x = document.getElementById("<%=categoriareal.ClientID%>").innerHTML;
            if (x == "") {
                alert('Favor de elegir un tipo de trámite.')
                $('#myTab a[href="#Solicitante"]').tab('show');
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">  
        $(document).ready(function () {
            SearchText();
        });
        function SearchText() {
            $("#txtCurp").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "lcaptura.aspx/GetCurp",
                        data: "{'curp':'" + document.getElementById('txtCurp').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No coincide ningún Curp");
                        }
                    });
                }
            });
        }
    </script>
    <script type="text/javascript">  

        function SearchTexto() {
            $("#txtRfc").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "lcaptura.aspx/GetRfc",
                        data: "{'rfc':'" + document.getElementById('txtRfc').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No coincide ningún RFC");
                        }
                    });
                }
            });
        }
    </script>
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
        function sololetras(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;
            patron = /[A-Za-z\sñÑáéíóúÁÉÍÓÚÜü]/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }
    </script>
    <script>
        function curpValida(murp) {
            var re = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
                validado = murp.match(re);

            if (!validado)
                return false;


            function digitoVerificador(curp17) {

                var diccionario = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
                    lngSuma = 0.0,
                    lngDigito = 0.0;
                for (var i = 0; i < 17; i++)
                    lngSuma = lngSuma + diccionario.indexOf(curp17.charAt(i)) * (18 - i);
                lngDigito = 10 - lngSuma % 10;
                if (lngDigito == 10) return 0;
                return lngDigito;
            }

            if (validado[2] != digitoVerificador(validado[1]))
                return false;

            return true; //Validado
        }
        function validarInput(input) {
            var murp = input.value.toUpperCase(),
                resultado = document.getElementById("resultado"),
                valido = "No válido";
            document.getElementById("<%=CURPvalido.ClientID%>").value = "0";


            if (curpValida(murp)) {
                valido = "Válido";
                resultado.classList.add("ok");
                document.getElementById("<%=CURPvalido.ClientID%>").value = "1";
            } else {
                resultado.classList.remove("ok");
            }

            resultado.innerText = "CURP: " + murp + "\nFormato: " + valido;
        }

    </script>
    <script>
        function rfcValido2(rfc2, aceptarGenerico2 = true) {
            const re2 = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
            var validado2 = rfc2.match(re2);

            if (!validado2)
                return false;

            const digitoVerificador2 = validado2.pop(),
                rfcSinDigito2 = validado2.slice(1).join(''),
                len2 = rfcSinDigito2.length,

                diccionario2 = "0123456789ABCDEFGHIJKLMN&OPQRSTUVWXYZ Ñ",
                indice2 = len2 + 1;
            var suma2,
                digitoEsperado2;

            if (len2 == 12) suma2 = 0
            else suma2 = 481;

            for (var i2 = 0; i2 < len2; i2++)
                suma2 += diccionario2.indexOf(rfcSinDigito2.charAt(i2)) * (indice2 - i2);
            digitoEsperado2 = 11 - suma2 % 11;
            if (digitoEsperado2 == 11) digitoEsperado2 = 0;
            else if (digitoEsperado2 == 10) digitoEsperado2 = "A";


            if ((digitoVerificador2 != digitoEsperado2)
                && (!aceptarGenerico2 || rfcSinDigito2 + digitoVerificador2 != "XAXX010101000"))
                return false;
            else if (!aceptarGenerico2 && rfcSinDigito2 + digitoVerificador2 == "XEXX010101000")
                return false;
            return rfcSinDigito2 + digitoVerificador2;
        }


        function validarInput2(input2) {
            var rfc2 = input2.value.trim().toUpperCase(),
                resultado2 = document.getElementById("resultado2"),
                valido2;

            var rfcCorrecto2 = rfcValido2(rfc2);

            if (rfcCorrecto2) {
                valido2 = "Válido";
                resultado2.classList.add("ok");
                document.getElementById("<%=RFCvalido.ClientID%>").value = "1";
            } else {
                valido2 = "No válido"
                resultado2.classList.remove("ok");
                document.getElementById("<%=RFCvalido.ClientID%>").value = "0";
            }

            resultado2.innerText = "RFC: " + rfc2
                //+ "\nResultado: " + rfcCorrecto2
                + "\nFormato: " + valido2;
        }


    </script>
    <script>
        function rfcValido3(rfc3, aceptarGenerico3 = true) {
            const re3 = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
            var validado3 = rfc3.match(re3);

            if (!validado3)
                return false;

            const digitoVerificador3 = validado3.pop(),
                rfcSinDigito3 = validado3.slice(1).join(''),
                len3 = rfcSinDigito3.length,

                diccionario3 = "0123456789ABCDEFGHIJKLMN&OPQRSTUVWXYZ Ñ",
                indice3 = len3 + 1;
            var suma3,
                digitoEsperado3;

            if (len3 == 12) suma3 = 0
            else suma3 = 481;

            for (var i3 = 0; i3 < len3; i3++)
                suma3 += diccionario3.indexOf(rfcSinDigito3.charAt(i3)) * (indice3 - i3);
            digitoEsperado3 = 11 - suma3 % 11;
            if (digitoEsperado3 == 11) digitoEsperado3 = 0;
            else if (digitoEsperado3 == 10) digitoEsperado3 = "A";


            if ((digitoVerificador3 != digitoEsperado3)
                && (!aceptarGenerico3 || rfcSinDigito3 + digitoVerificador3 != "XAXX010101000"))
                return false;
            else if (!aceptarGenerico3 && rfcSinDigito3 + digitoVerificador3 == "XEXX010101000")
                return false;
            return rfcSinDigito3 + digitoVerificador3;
        }


        function validarInput3(input3) {
            var rfc3 = input3.value.trim().toUpperCase(),
                resultado3 = document.getElementById("resultado3"),
                valido3;

            var rfcCorrecto3 = rfcValido3(rfc3);

            if (rfcCorrecto3) {
                valido3 = "Válido";
                resultado3.classList.add("ok");
                document.getElementById("<%=RFC_R_valido.ClientID%>").value = "1";
             } else {
                 valido3 = "No válido"
                 resultado3.classList.remove("ok");
                 document.getElementById("<%=RFC_R_valido.ClientID%>").value = "0";
            }

            resultado3.innerText = "RFC: " + rfc3
                //+ "\nResultado: " + rfcCorrecto2
                + "\nFormato: " + valido3;
        }

    </script>    
    <script runat="server">

        void Selection_Change(Object sender, EventArgs e)
        {

            Object selectedItem = txtMunicipio.SelectedItem;
            String str = selectedItem.ToString();

        }
    </script>
 
    <script>
        var c = document.getElementById("<%=categoria.ClientID%>").value;

        switch (c) {
            case "3":
                $("#r").show();
                document.getElementById("<%=categoriareal.ClientID%>").innerText = c;
                break;

            default:
                $("#r").hide();
                document.getElementById("<%=categoriareal.ClientID%>").innerText = c;
                break;
        }

    </script>
    <script>
        function confirmar() {

            if (Page_IsValid) {
                return confirm('Esta seguro de guardar la información?');

            }
            else {


                return false;
            }

        }
    </script>
   <%-- <script>
           $('#btnGuardarDatos').click(function () {
               $('input:invalid').each(function () {
                   // Find the tab-pane that this element is inside, and get the id
                   var $closest = $(this).closest('.tab-pane');
                   var id = $closest.attr('id');

                   // Find the link that corresponds to the pane and have it show
                   $('.nav a[href="#' + id + '"]').tab('show');

                   // Only want to do it once
                   return false;
               });
           });
</script>--%>
<%--    <script>
        function Validar() {
            var a = 0;
            var telfij = document.getElementById("<%=txtTelfij.ClientID%>").value;
            var telmov = document.getElementById("<%=txtTelmov.ClientID%>").value;
            var cp = document.getElementById("<%=txtCP.ClientID%>").value;
            var telest = document.getElementById("<%=txtTelest.ClientID%>").value;
            var curp = document.getElementById("<%=txtCurp.ClientID%>").value;
            var rfc = document.getElementById("<%=txtRfc.ClientID%>").value;


            //if (telfij.length != 10) { return alert('El Teléfono Fijo debe contener 10 Dígitos') } else {
            //if (telmov.length != 10) {
            //    $('#myTab a[href="#Solicitante"]').tab('show');
            //    return alert('El Teléfono Movil debe contener 10 Dígitos')
            //} else {
            if (cp.length != 5) {
                $('#myTab a[href="#Establecimiento"]').tab('show');
                return alert('El Código Postal debe contener 5 Dígitos')
            } else {
                if (cp.length != 5) {
                    $('#myTab a[href="#Establecimiento"]').tab('show');
                    return alert('El Código Postal debe contener 5 Dígitos')
                } else {
                    //if (curp.length != 18) {
                    //    $('#myTab a[href="#Solicitante"]').tab('show');
                    //    return alert('El CURP debe contener 18 Dígitos')
                    //} else {
                        if (!(rfc.length == 14 || rfc.length == 13)) {
                            $('#myTab a[href="#Establecimiento"]').tab('show');
                            return alert('El RFC debe contener 13/14 Dígitos para persona Física/Moral')
                        }

                        else {
                            a = 1;
                        }
                    //}
                }
            }


            if (a == 1) { return true; }


        }

       
        //}

    </script>--%>
    <script>
        function validarEmail(elemento) {

            var texto = document.getElementById(elemento.id).value;
            var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
            resultadoz = document.getElementById("resultadoz");
            if (!regex.test(texto)) {

                resultadoz.classList.remove("ok");
                valido = "No válido";
            } else {

                resultadoz.classList.add("ok");
                valido = "Válido";
            }
            resultadoz.innerText = "E-mail: " + texto + "\nFormato: " + valido;
        }
    </script>
    <script>
        function validarEmail2(elemento) {

            var texto2 = document.getElementById(elemento.id).value;
            var regex2 = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
            resultadoz2 = document.getElementById("resultadoz2");
            if (!regex2.test(texto2)) {

                resultadoz2.classList.remove("ok");
                valido = "No válido";
            } else {

                resultadoz2.classList.add("ok");
                valido = "Válido";
            }
            resultadoz2.innerText = "E-mail: " + texto2 + "\nFormato: " + valido;
        }
    </script>
  <%--  <script>
        function onclock() {
          
            var q = document.getElementById("<%=Provisional.ClientID%>").innerHTML;
            if (q == "Número de Cédula Profesional") {
                document.getElementById("<%=Provisional.ClientID%>").innerHTML = "Número de Cédula Provisional"
            }


              
          
            
            if (q == "Número de Cédula Provisional") {
                document.getElementById("<%=Provisional.ClientID%>").innerHTML = "Número de Cédula Profesional";

        }}
    </script>--%>
  <script>   
      $("button").click(function () {

          switch (this.id) {
              case "btnLunes":
                  document.getElementById("<%=MartesH1inicio.ClientID%>").value = document.getElementById("<%=LunesH1inicio.ClientID%>").value;
                  document.getElementById("<%=MartesH1fin.ClientID%>").value = document.getElementById("<%=LunesH1fin.ClientID%>").value;
                  document.getElementById("<%=MartesH2inicio.ClientID%>").value = document.getElementById("<%=LunesH2inicio.ClientID%>").value;
                  document.getElementById("<%=MartesH2fin.ClientID%>").value = document.getElementById("<%=LunesH2fin.ClientID%>").value;
                  document.getElementById("<%=chkMartesEst.ClientID%>").checked = true;
                  break;
              case "btnMartes":
                  document.getElementById("<%=MiercolesH1inicio.ClientID%>").value = document.getElementById("<%=MartesH1inicio.ClientID%>").value;
                  document.getElementById("<%=MiercolesH1fin.ClientID%>").value = document.getElementById("<%=MartesH1fin.ClientID%>").value;
                  document.getElementById("<%=MiercolesH2inicio.ClientID%>").value = document.getElementById("<%=MartesH2inicio.ClientID%>").value;
                  document.getElementById("<%=MiercolesH2fin.ClientID%>").value = document.getElementById("<%=MartesH2fin.ClientID%>").value;
                  document.getElementById("<%=chkMiercolesEst.ClientID%>").checked = true;
                  break;
              case "btnMiercoles":
                  document.getElementById("<%=JuevesH1inicio.ClientID%>").value = document.getElementById("<%=MiercolesH1inicio.ClientID%>").value;
                  document.getElementById("<%=JuevesH1fin.ClientID%>").value = document.getElementById("<%=MiercolesH1fin.ClientID%>").value;
                  document.getElementById("<%=JuevesH2inicio.ClientID%>").value = document.getElementById("<%=MiercolesH2inicio.ClientID%>").value;
                  document.getElementById("<%=JuevesH2fin.ClientID%>").value = document.getElementById("<%=MiercolesH2fin.ClientID%>").value;
                  document.getElementById("<%=chkJuevesEst.ClientID%>").checked = true;
                  break;
              case "btnJueves":
                  document.getElementById("<%=ViernesH1inicio.ClientID%>").value = document.getElementById("<%=JuevesH1inicio.ClientID%>").value;
                  document.getElementById("<%=ViernesH1fin.ClientID%>").value = document.getElementById("<%=JuevesH1fin.ClientID%>").value;
                  document.getElementById("<%=ViernesH2inicio.ClientID%>").value = document.getElementById("<%=JuevesH2inicio.ClientID%>").value;
                  document.getElementById("<%=ViernesH2fin.ClientID%>").value = document.getElementById("<%=JuevesH2fin.ClientID%>").value;
                  document.getElementById("<%=chkViernesEst.ClientID%>").checked = true;
                  break;
              case "btnViernes":
                  document.getElementById("<%=SabadoH1inicio.ClientID%>").value = document.getElementById("<%=ViernesH1inicio.ClientID%>").value;
                  document.getElementById("<%=SabadoH1fin.ClientID%>").value = document.getElementById("<%=ViernesH1fin.ClientID%>").value;
                  document.getElementById("<%=SabadoH2inicio.ClientID%>").value = document.getElementById("<%=ViernesH2inicio.ClientID%>").value;
                  document.getElementById("<%=SabadoH2fin.ClientID%>").value = document.getElementById("<%=ViernesH2fin.ClientID%>").value;
                  document.getElementById("<%=chkSabadoEst.ClientID%>").checked = true;
                  break;
              case "btnSabado":
                  document.getElementById("<%=DomingoH1inicio.ClientID%>").value = document.getElementById("<%=SabadoH1inicio.ClientID%>").value;
                  document.getElementById("<%=DomingoH1fin.ClientID%>").value = document.getElementById("<%=SabadoH1fin.ClientID%>").value;
                  document.getElementById("<%=DomingoH2inicio.ClientID%>").value = document.getElementById("<%=SabadoH2inicio.ClientID%>").value;
                  document.getElementById("<%=DomingoH2fin.ClientID%>").value = document.getElementById("<%=SabadoH2fin.ClientID%>").value;
                  document.getElementById("<%=chkDomingoEst.ClientID%>").checked = true;
                  break;
              case "btnLunesR":
                  document.getElementById("<%=MartesH1inicioR.ClientID%>").value = document.getElementById("<%=LunesH1inicioR.ClientID%>").value;
                  document.getElementById("<%=MartesH1finR.ClientID%>").value = document.getElementById("<%=LunesH1finR.ClientID%>").value;
                  document.getElementById("<%=MartesH2inicioR.ClientID%>").value = document.getElementById("<%=LunesH2inicioR.ClientID%>").value;
                  document.getElementById("<%=MartesH2finR.ClientID%>").value = document.getElementById("<%=LunesH2finR.ClientID%>").value;
                  document.getElementById("<%=chkMartesR.ClientID%>").checked = true;
                  break;
              case "btnMartesR":
                  document.getElementById("<%=MiercolesH1inicioR.ClientID%>").value = document.getElementById("<%=MartesH1inicioR.ClientID%>").value;
                  document.getElementById("<%=MiercolesH1finR.ClientID%>").value = document.getElementById("<%=MartesH1finR.ClientID%>").value;
                  document.getElementById("<%=MiercolesH2inicioR.ClientID%>").value = document.getElementById("<%=MartesH2inicioR.ClientID%>").value;
                  document.getElementById("<%=MiercolesH2finR.ClientID%>").value = document.getElementById("<%=MartesH2finR.ClientID%>").value;
                  document.getElementById("<%=chkMiercolesR.ClientID%>").checked = true;
                  break;
              case "btnMiercolesR":
                  document.getElementById("<%=JuevesH1inicioR.ClientID%>").value = document.getElementById("<%=MiercolesH1inicioR.ClientID%>").value;
                  document.getElementById("<%=JuevesH1finR.ClientID%>").value = document.getElementById("<%=MiercolesH1finR.ClientID%>").value;
                  document.getElementById("<%=JuevesH2inicioR.ClientID%>").value = document.getElementById("<%=MiercolesH2inicioR.ClientID%>").value;
                  document.getElementById("<%=JuevesH2finR.ClientID%>").value = document.getElementById("<%=MiercolesH2finR.ClientID%>").value;
                  document.getElementById("<%=chkJuevesR.ClientID%>").checked = true;

                  break;
              case "btnJuevesR":
                  document.getElementById("<%=ViernesH1inicioR.ClientID%>").value = document.getElementById("<%=JuevesH1inicioR.ClientID%>").value;
                  document.getElementById("<%=ViernesH1finR.ClientID%>").value = document.getElementById("<%=JuevesH1finR.ClientID%>").value;
                  document.getElementById("<%=ViernesH2inicioR.ClientID%>").value = document.getElementById("<%=JuevesH2inicioR.ClientID%>").value;
                  document.getElementById("<%=ViernesH2finR.ClientID%>").value = document.getElementById("<%=JuevesH2finR.ClientID%>").value;
                  document.getElementById("<%=chkViernesR.ClientID%>").checked = true;
                  break;
              case "btnViernesR":
                  document.getElementById("<%=SabadoH1inicioR.ClientID%>").value = document.getElementById("<%=ViernesH1inicioR.ClientID%>").value;
                  document.getElementById("<%=SabadoH1finR.ClientID%>").value = document.getElementById("<%=ViernesH1finR.ClientID%>").value;
                  document.getElementById("<%=SabadoH2inicioR.ClientID%>").value = document.getElementById("<%=ViernesH2inicioR.ClientID%>").value;
                  document.getElementById("<%=SabadoH2finR.ClientID%>").value = document.getElementById("<%=ViernesH2finR.ClientID%>").value;
                  document.getElementById("<%=chkSabadoR.ClientID%>").checked = true;
                  break;
              case "btnSabadoR":
                  document.getElementById("<%=DomingoH1inicioR.ClientID%>").value = document.getElementById("<%=SabadoH1inicioR.ClientID%>").value;
                  document.getElementById("<%=DomingoH1finR.ClientID%>").value = document.getElementById("<%=SabadoH1finR.ClientID%>").value;
                  document.getElementById("<%=DomingoH2inicioR.ClientID%>").value = document.getElementById("<%=SabadoH2inicioR.ClientID%>").value;
                  document.getElementById("<%=DomingoH2finR.ClientID%>").value = document.getElementById("<%=SabadoH2finR.ClientID%>").value;
                  document.getElementById("<%=chkDomingoR.ClientID%>").checked = true;
                  break;


              default:

          }

          //alert(this.id); // or alert($(this).attr('id'));
      });
  </script>
  <script>
      $(document).ready(function () {
<%--            var LE = ("<%=chkLunesEst.ClientID%>").checked;
            var LR =("<%=chkLunesR.ClientID%>").checked;
            var MAE =("<%=chkMartesEst.ClientID%>").checked;
            var MAR =("<%=chkMartesR.ClientID%>").checked;
            var MIE =("<%=chkMiercolesEst.ClientID%>").checked;
            var MIR =("<%=chkMiercolesR.ClientID%>").checked;
            var JE =("<%=chkJuevesEst.ClientID%>").checked;
            var JR =("<%=chkJuevesR.ClientID%>").checked;
            var VE =("<%=chkViernesEst.ClientID%>").checked;
            var VR =("<%=chkViernesR.ClientID%>")
            var SE =("<%=chkSabadoEst.ClientID%>")
            var SR =("<%=chkSabadoR.ClientID%>")
            var DE =("<%=chkDomingoEst.ClientID%>")
            var DR =("<%=chkDomingoR.ClientID%>")--%>

            $("input").focusout(function (e) {
                var id = e.currentTarget.id;
                var id = id.replace("cphContent_", "");
                console.log(id)

                switch (id) {
                    case "LunesH1inicioR":
                    case "LunesH1finR":
                    case "LunesH2inicioR":
                    case "LunesH2finR":
                        document.getElementById("<%=chkLunesR.ClientID%>").checked = true;
                        break;
                    case "MartesH1inicioR":
                    case "MartesH1finR":
                    case "MartesH2inicioR":
                    case "MartesH2finR":
                        document.getElementById("<%=chkMartesR.ClientID%>").checked = true;
                        break;
                    case "MiercolesH1inicioR":
                    case "MiercolesH1finR":
                    case "MiercolesH2inicioR":
                    case "MiercolesH2finR":
                        document.getElementById("<%=chkMiercolesR.ClientID%>").checked = true;
                        break;
                    case "JuevesH1inicioR":
                    case "JuevesH1finR":
                    case "JuevesH2inicioR":
                    case "JuevesH2finR":
                        document.getElementById("<%=chkJuevesR.ClientID%>").checked = true;
                        break;
                    case "ViernesH1inicioR":
                    case "ViernesH1finR":
                    case "ViernesH2inicioR":
                    case "ViernesH2finR":
                        document.getElementById("<%=chkViernesR.ClientID%>").checked = true;
                        break;
                    case "SabadoH1inicioR":
                    case "SabadoH1finR":
                    case "SabadoH2inicioR":
                    case "SabadoH2finR":
                        document.getElementById("<%=chkSabadoR.ClientID%>").checked = true;
                        break;
                    case "DomingoH1inicioR":
                    case "DomingoH1finR":
                    case "DomingoH2inicioR":
                    case "DomingoH2finR":
                        document.getElementById("<%=chkDomingoR.ClientID%>").checked = true;
                        break;
                    case "LunesH1inicio":
                    case "LunesH1fin":
                    case "LunesH2inicio":
                    case "LunesH2fin":
                        document.getElementById("<%=chkLunesEst.ClientID%>").checked = true;
                        break;
                    case "MartesH1inicio":
                    case "MartesH1fin":
                    case "MartesH2inicio":
                    case "MartesH2fin":
                        document.getElementById("<%=chkMartesEst.ClientID%>").checked = true;
                        break;
                    case "MiercolesH1inicio":
                    case "MiercolesH1fin":
                    case "MiercolesH2inicio":
                    case "MiercolesH2fin":
                        document.getElementById("<%=chkMiercolesEst.ClientID%>").checked = true;
                        break;
                    case "JuevesH1inicio":
                    case "JuevesH1fin":
                    case "JuevesH2inicio":
                    case "JuevesH2fin":
                        document.getElementById("<%=chkJuevesEst.ClientID%>").checked = true;
                        break;
                    case "ViernesH1inicio":
                    case "ViernesH1fin":
                    case "ViernesH2inicio":
                    case "ViernesH2fin":
                        document.getElementById("<%=chkViernesEst.ClientID%>").checked = true;
                        break;
                    case "SabadoH1inicio":
                    case "SabadoH1fin":
                    case "SabadoH2inicio":
                    case "SabadoH2fin":
                        document.getElementById("<%=chkSabadoEst.ClientID%>").checked = true;
                        break;
                    case "DomingoH1inicio":
                    case "DomingoH1fin":
                    case "DomingoH2inicio":
                    case "DomingoH2fin":
                        document.getElementById("<%=chkDomingoEst.ClientID%>").checked = true;
                        break;
                    default:
                }
            })


        });
</script>
  <script>
      function ValidarRFCest(sender, args) {
          var a = args.Value.length;
          if (!(a >= 13 && a <= 14) || (a < 0)) {
              $('#myTab a[href="#Establecimiento"]').tab('show');
              alert(a);
              return args.IsValid = false;

          }
          else
              return args.IsValid = true;
      }
      function ValidarNombreest(sender, args) {
          var a = args.Value.length;
          if (a == 0) {
              $('#myTab a[href="#Establecimiento"]').tab('show');
              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarRazonSocial(sender, args) {
          var a = args.Value.length;
          if (a < 0) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarLocalidad(sender, args) {
          var a = args.Value.length;
          if (a < 0) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarColonia(sender, args) {
          var a = args.Value.length;
          if (a < 0) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarCalle(sender, args) {
          var a = args.Value.length;
          if (a < 0) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarNumero(sender, args) {
          var a = args.Value.length;
          if (a < 0) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarCP(sender, args) {
          var a = args.Value.length;
          if (a < 5) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarTelest(sender, args) {
          var a = args.Value.length;
          if (a < 10) {
              $('#myTab a[href="#Establecimiento"]').tab('show');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }

      function ValidarCURP(sender, args) {
          var a = args.Value.length;
          var cv = document.getElementById("<%=CURPvalido.ClientID%>").value;
          if (cv == "1") {
              if (a < 18) {
                  $('#myTab a[href="#Solicitante"]').tab('show');
                  $('#myTab a[href="#Establecimiento"]').tab('hide');

                  return args.IsValid = false;
              }
              else
                  return args.IsValid = true;
          }
          else
              return args.IsValid = true;
      }
      function ValidarNombreSol(sender, args) {
          var a = args.Value.length;
          if ((a == 0)) {

              $('#myTab a[href="#Solicitante"]').tab('show');
              $('#myTab a[href="#Establecimiento"]').tab('hide');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarApellidop(sender, args) {
          var a = args.Value.length;
          if ((a == 0)) {

              $('#myTab a[href="#Solicitante"]').tab('show');
              $('#myTab a[href="#Establecimiento"]').tab('hide');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarApellidom(sender, args) {
          var a = args.Value.length;
          if ((a == 0)) {

              $('#myTab a[href="#Solicitante"]').tab('show');
              $('#myTab a[href="#Establecimiento"]').tab('hide');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarTelmov(sender, args) {
          var a = args.Value.length;
          if ((a < 10)) {
              $('#myTab a[href="#Solicitante"]').tab('show');
              $('#myTab a[href="#Establecimiento"]').tab('hide');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarTelfij(sender, args) {
          var a = args.Value.length;
          if ((a < 10)) {
              $('#myTab a[href="#Solicitante"]').tab('show');
              $('#myTab a[href="#Establecimiento"]').tab('hide');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }
      function ValidarCorreo(sender, args) {
          var a = args.Value.length;
          if ((a == 0)) {
              $('#myTab a[href="#Solicitante"]').tab('show');
              $('#myTab a[href="#Establecimiento"]').tab('hide');

              return args.IsValid = false;
          }
          else
              return args.IsValid = true;
      }


  </script>
    
</asp:Content>


