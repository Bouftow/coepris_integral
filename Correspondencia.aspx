<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Correspondencia.aspx.cs" Inherits="_default" %>

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
   


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs"> <h3>Correspondencia</h3>
            <div class="card-header card-header-sm bordered">
               
                <ul class="nav nav-tabs pull-left" role="tablist">
                    <li class="nav-item"><a class="nav-link active" href="#Requisitos" role="tab" data-toggle="tab">Tipo de Trámtie</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#DatosSol" role="tab" data-toggle="tab">Datos del Propietario</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#DatosEst" role="tab" data-toggle="tab">Datos del Establecimiento</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#ResponsableSanitario" role="tab" data-toggle="tab">Datos del Responsable Sanitario</a> </li>


                </ul>
            </div>
        </div>

        <div class="card-block">
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active fade show" id="Requisitos">
                        <asp:GridView ID="grdNombreTramite"
                        AutoGenerateColumns="false"
                        runat="server" GridLines="None"
                        CssClass="table table-bordered"
                        PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt"
                        onrowdatabound="grdNombreTramite_RowDataBound" 
                        PageSize="7"
                        Style="background: white;text-align:center">

                        <HeaderStyle
                            BackColor="#337ab7"
                            Font-Bold="True"
                            ForeColor="White" />
                        <Columns>

                            <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                            <asp:BoundField HeaderText="Tipo de Trámite" DataField="nombre_tramite" />
                            <asp:BoundField HeaderText="Modalidad" DataField="modalidad" ItemStyle-Wrap="false" ItemStyle-CssClass="b" ItemStyle-BackColor="#8aff7d"  ItemStyle-ForeColor="White"/>


                        </Columns>

                    </asp:GridView>
               

                  <%--  <input type="radio" name="tab" value="1" onclick="show1();" onload="show1();" checked="checked"/>
                    Entregar Personalmente
                    <br />
                    <input type="radio" name="tab" value="2" onclick="show2();" />
                    Entregar a la Coordinación--%>
                    
                  <div runat="server" id="statos1021" >
                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True"  onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">

                       <asp:ListItem Text="Entregar Personalmente" Value="1" Selected="True" />
                       <asp:ListItem Text="Enviar a Coordinación" Value="2" />


                   </asp:RadioButtonList>

                    <div id="div2" runat="server">
                        Nombre de la persona:<br />
                        <asp:TextBox ID="txtaquien" Style="text-transform: uppercase;" class="form-control css-input" Width="40%" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="txtaquien"
                            ErrorMessage="Por favor ingrese el nombre de la persona a quien entregó."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </div> 
                    <div id="div1" runat="server">
                    <div class="select">
                        Entregar a la coordinación: <br />
                         <asp:DropDownList  ID="Dropdownlist1" runat="server" Width="20%" ></asp:DropDownList>
                        <br /><br />

                        Número de Guía:<br />
                        <asp:TextBox ID="txtNumerodeguia" Style="text-transform: uppercase;" class="form-control css-input" Width="40%" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtNumerodeguia"
                            ErrorMessage="Por favor ingrese el número de guía."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <br />
                         Número de Oficio de Foliador:
                        <asp:TextBox ID="txtNFoliador" Style="text-transform: uppercase;" class="form-control css-input" Width="40%" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                            ControlToValidate="txtNumerodeguia"
                            ErrorMessage="Por favor ingrese el número de guía."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        

                    </div>
                      </div>


                </div>
                <div role="tabpanel" class="tab-pane fade in" id="DatosSol">


              
                        <div class="row">
                            <div class="col-sm-12">

                                <h3 style="font-weight: bold">Datos del Propietario:</h3>
                                <div class="form-group col-sm-12">

                                    <div class="row">
                                         <div>
                                    <label>
                                        CURP:<br />
                                        <asp:TextBox Width="235px" ID="txtCurp"  class="form-control b" Style="text-transform: uppercase;"
                                            runat="server" oninput="validarInput(this)" onclick="validarInput(this)"
                                            onkeypress="return curpValida(event)"
                                            MaxLength="18" MinLength="18" autocomplete="true" disabled="true"></asp:TextBox>

                                        <p id="resultado"></p>
                               

                                    </label></div>
                                      <div class="offset-sm-1">





                                                <%--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                                                <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRFCprop" class="form-control b" Style="text-transform: uppercase; "
                                                        runat="server" oninput="validarInput4(this)" onclick="validarInput4(this)"
                                                        onkeypress="return rfcValido4(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true" disabled="true"> </asp:TextBox>
                                                     <p id="resultado4"></p>
                                                </label>
                                               
                                            </div>
                                        </div>
                                    <div class="row">

                                        <div class="col-sm-6 ">
                                            Nombre(s):
                                <asp:TextBox ID="txtNombre" TextMode="MultiLine" Rows="1" class="form-control css-input"
                                    runat="server" onkeypress="return sololetras(event)"
                                    Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                   <br />       
                                        </div>
                                    </div>
                                    <div style="width: 100%" class="row">
                                        <div class="col-sm-3">
                                            Telefono Movil:
                              <asp:TextBox Width="120px" ID="txtTelmov" MaxLength="10" MinLength="10" class="form-control css-input" runat="server"
                                  onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>
                                     
                                        </div>

                                        <div class="col-sm-3">
                                            Telefono Fijo:   (Opcional) 
                                <asp:TextBox Width="120px" ID="txtTelfij" SetFocusOnError="true" MaxLength="10" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>
                                       
                                      
                                        </div>
                                    </div>
                                    <br />

                                    <div style="width: 100%" class="row">


                                        <div class="col-sm-5">
                                            <label>
                                                Correo Electronico:<br />
                                                <asp:TextBox ID="txtCorreo" Width="235px" class="form-control b"
                                                    autocomplete="off" onkeyup="validarEmail(this)" onclick="validarEmail(this)"
                                                    runat="server" disabled="true"></asp:TextBox>

                                                <p id="resultadoz"></p>
                                        
                                            </label>
                                            <br />
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    
                    
                    </div>
                <div role="tabpanel" class="tab-pane fade in" id="DatosEst">

                        <div class="row">
                            <div class="row col-sm-6">
                                <div>


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
                                                        MaxLength="14" MinLength="13" autocomplete="true" disabled="true"> </asp:TextBox>
                                                </label>
                                                <p id="resultado2"></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-11">
                                                Nombre del Establecimiento: 
                                <asp:TextBox TextMode="multiline" Rows="3" ID="txtNombreest" Style="text-transform: uppercase;" class="css-input form-control " runat="server" disabled="true"></asp:TextBox>
                                               
                                                <br />
                                                Denominación de giro:<br />
                                                <asp:TextBox TextMode="multiline" rows="3" ID="txtRazonsocial" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>

                                                <br />
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
                                <asp:TextBox ID="txtMunicipio" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                               


                                Localidad:<br />
                                <asp:TextBox ID="txtLocalidad" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                              

                           





                                <div class="row">
                                    <div class="col-sm-9">
                                        Colonia:<br />
                                        <asp:TextBox TextMode="MultiLine" Rows="2" ID="txtColonia" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>


                                    </div>

                                    <div class="col-sm-3">
                                        C.P.:
                                                <br />
                                        <asp:TextBox ID="txtCP" MaxLength="5" MinLength="5" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>
                                 
                                    </div>
                                </div>

                                <div class="row">
                                     <div class="col-sm-12">
                                        Calle:<br />
                                        <asp:TextBox TextMode="MultiLine" Rows="1" ID="txtCalle" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                                         </div>
                                    <div class=" col-sm-12">

                                     
                                         Número interior/exterior, manzana y lote:<br />
                                          <asp:TextBox ID="txtNumero" TextMode="MultiLine" Rows="2" Style="text-transform: uppercase;"  class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                                       
                                        </div>
                                    <div class="col-sm-12">
                                            Referencias:<br />
                                        <asp:TextBox ID="txtReferencias" TextMode="MultiLine" Rows="2" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>

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
                                                runat="server"  disabled="true"></asp:TextBox>

                                            <p id="resultadoz2"></p>

                                        </label>

                                    </div>

                                    <div class="col-sm-3">
                                        Telefono:
                              <asp:TextBox Width="120px" ID="txtTelest" MaxLength="10" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>

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
                                                    <td><input id="LunesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="LunesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="LunesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="LunesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                  
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Martes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMartesEst" runat="server" /></td>
                                                    <td><input id="MartesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MartesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                     
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Miércoles:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMiercolesEst" runat="server" /></td>
                                                    <td><input id="MiercolesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MiercolesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MiercolesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MiercolesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                 
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Jueves:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkJuevesEst" runat="server" /></td>
                                                    <td><input id="JuevesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="JuevesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="JuevesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="JuevesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   

                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Viernes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkViernesEst" runat="server" /></td>
                                                    <td><input id="ViernesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="ViernesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   
                                                </tr>
                                                 <tr>
                                                    <td style="border-right:hidden  ">Sábado:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkSabadoEst" runat="server" /></td>
                                                    <td><input id="SabadoH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="SabadoH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="SabadoH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="SabadoH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                 
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Domingo:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkDomingoEst" runat="server" /></td>
                                                    <td><input id="DomingoH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="DomingoH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled" /></td>
                                                </tr>
                                            </table>

                    </div>
                <div role="tabpanel" class="tab-pane fade in" id="ResponsableSanitario">


                        <div class="row">
                            <div class="col-sm-12">

                                <h3 style="font-weight: bold">Datos del Responsable Sanitario:</h3>
                                <div class="form-group col-sm-12">



                                    <div class="row">

                                        <div class="col-sm-6 ">
                                            Nombre(s):
                                <asp:TextBox ID="txtRnombre" class="form-control css-input"
                                    runat="server" onkeypress="return sololetras(event)"
                                    Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                            
                                            
                                        </div>
                                      
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            Grado Académico que Ostenta:
                                              <asp:TextBox ID="txtRgrado" class="form-control css-input" runat="server"
                                                  Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                          
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
                                                  Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                          
                                        </div>


                                    </div>
                                      <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRfcR" class="form-control" Style="text-transform: uppercase;"
                                                        runat="server" oninput="validarInput3(this)" onclick="validarInput3(this)"
                                                        onkeypress="return rfcValido3(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true" disabled="true"> </asp:TextBox>
                                               
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
                                                    <td><input id="LunesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="LunesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="LunesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="LunesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                 
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Martes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMartesR" runat="server" /></td>
                                                    <td><input id="MartesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled"/></td>
                                                    <td><input id="MartesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Miércoles:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMiercolesR" runat="server" /></td>
                                                    <td><input id="MiercolesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MiercolesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MiercolesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MiercolesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Jueves:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkJuevesR" runat="server" /></td>
                                                    <td><input id="JuevesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="JuevesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled"/></td>
                                                    <td><input id="JuevesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="JuevesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                       

                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Viernes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkViernesR" runat="server" /></td>
                                                    <td><input id="ViernesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   
                                                </tr>
                                                 <tr>
                                                    <td style="border-right:hidden  ">Sábado:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkSabadoR" runat="server" /></td>
                                                    <td><input id="SabadoH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="SabadoH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="SabadoH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="SabadoH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Domingo:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkDomingoR" runat="server" /></td>
                                                    <td><input id="DomingoH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="DomingoH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>


            </div>

        </div>


        <div style="text-align: center">



            <div class="btn-group div1">
                <asp:Button ID="btnAprobado25"
                    OnClick="btnAprobado_Click"
                    runat="server" class="myButton"
                    Text="Marcar como Recibido" />
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
            </div>

            <div class="btn-group div1">
                <asp:Button ID="btnAprobado26"
                    OnClick="btnAprobado_Click"
                    runat="server" class="myButton"
                    Text="Enviar a la Coordinación" />
                <asp:Literal ID="Literal" runat="server"></asp:Literal>
            </div>

            <asp:Literal ID="Literal1" runat="server"></asp:Literal>



            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
            <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5--%>
        </div>


    </div>




    <p style="visibility: hidden">
        <asp:TextBox ID="cis" runat="server" />
        <asp:TextBox ID="ueas" runat="server" />
        <asp:TextBox ID="coor" runat="server" />
        <asp:TextBox ID="uos" runat="server" />
        <asp:TextBox ID="dictaminador" runat="server" />
        <asp:TextBox ID="dos" runat="server" />
        <asp:TextBox ID="dds" runat="server" />
        <asp:TextBox ID="deas" runat="server" />
        <asp:TextBox ID="das" runat="server" />
        <asp:TextBox ID="corr" runat="server" />
        <asp:TextBox ID="rech" runat="server" />
        <asp:TextBox ID="entr" runat="server" />
        <asp:TextBox ID="folio" runat="server"></asp:TextBox>
        <asp:TextBox ID="riesgo" runat="server"></asp:TextBox>
        <asp:TextBox ID="verificacion" runat="server"></asp:TextBox>
        <asp:TextBox ID="modalidad" runat="server"></asp:TextBox>
        <asp:TextBox ID="id_tramite" runat="server"></asp:TextBox>
        <asp:TextBox ID="statos" runat="server"></asp:TextBox>
        <asp:TextBox ID="certificado_anterior" runat="server"></asp:TextBox>


        <asp:TextBox ID="sol" runat="server"></asp:TextBox>
        <asp:TextBox ID="tit" runat="server"></asp:TextBox>
        <asp:TextBox ID="ced" runat="server"></asp:TextBox>
        <asp:TextBox ID="dip" runat="server"></asp:TextBox>
        <asp:TextBox ID="curr" runat="server"></asp:TextBox>
        <asp:TextBox ID="prog" runat="server"></asp:TextBox>
        <asp:TextBox ID="rel" runat="server"></asp:TextBox>
        <asp:TextBox ID="plano" runat="server"></asp:TextBox>
        <asp:TextBox ID="alt" runat="server"></asp:TextBox>
        <asp:TextBox ID="papel" runat="server"></asp:TextBox>
        <asp:TextBox ID="form" runat="server"></asp:TextBox>
        <asp:TextBox ID="cop" runat="server"></asp:TextBox>
        <asp:TextBox ID="lic" runat="server"></asp:TextBox>
        <asp:TextBox ID="dicdoc" runat="server"></asp:TextBox>
        <asp:TextBox ID="dictec" runat="server"></asp:TextBox>
        <asp:TextBox ID="acta" runat="server"></asp:TextBox>
    </p>

    <asp:Literal ID="LblMsg" runat="server"></asp:Literal>
    <asp:Literal ID="LblMensaje" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>


    <script>


        $('#hide').click(function () {
            $('#content').show('blind');
            $('#show').show();
            $('#hide').hide();
        });

        $('#show').click(function () {
            $('#content').hide('blind');
            $('#hide').show();
            $('#show').hide();
        });


    //$('#mydiv').addClass('newclass');
    //$('#mydiv').removeClass('newclass');
    //document.getElementById('your_element_s_id').className = 'cssClass';
    </script>

    <script type="text/javascript">
        function showContent() {
            element = document.getElementById("content");
            check = document.getElementById("check");
            if (check.checked) {
                element.style.display = 'block';
            }
            else {
                element.style.display = 'none';
            }
        }
    </script>


  <%--  <script>
        function show1() {
            document.getElementById('div1').style.display = 'none';
        }
        function show2(){
  document.getElementById('div1').style.display = 'block';
}
    </script>--%>

   
</asp:Content>

