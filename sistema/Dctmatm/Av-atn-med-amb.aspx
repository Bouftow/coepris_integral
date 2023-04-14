<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Av-atn-med-amb.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .estil {
            overflow-y: scroll;
            height: 500px;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
        }

        .wea td{
            border:none;
            padding-bottom:0px;
            padding-top:0px;
        }
        .wea input {
            margin-right:8px;
        }

                

        .button {
            display: inline-block;
            padding: 10px 12px;
            font-size: 15px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #367FA9;
            border: none;
            border-radius: 10px;
            box-shadow: 0 6px #999;
        }

        .button:hover {
            background-color: #295F7F;
        }

        .button:active {
            background-color: #295F7F;
            box-shadow: 0 3px #666;
            transform: translateY(4px);
        }

        .calif{
            display:inline-block;
            padding:1.5px 8px;
            font-size:15px;
            text-align:center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #367FA9;
            border-radius: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
  <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">





    <div class="card-block card">
        <h1 class="g" style="font-family:3ds; text-align:center"><label>COMISIÓN DE OPERACIÓN SANITARIA</label></h1> 
        <h2 class="g" style="text-align:center">ACTA DE VERIFICACIÓN PARA ESTABLECIMIENTOS DE ATENCIÓN MÉDICA AMBULATORIA O CONSULTORIOS MÉDICOS GENERALES Y DE ESPECIALIDAD.</h2>

        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Información</h3>
                </div>
                <ul class="nav nav-tabs pull-right" role="tablist">
                    <li class="nav-item"><a class="nav-link active" href="#Generales" role="tab" data-toggle="tab">Datos Generales</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Admin" role="tab" data-toggle="tab">Inf. Administrativa</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Form" role="tab" data-toggle="tab">Formulario</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#ObsGen" role="tab" data-toggle="tab">Observaciones Generales</a> </li>
                </ul>
            </div>

            <div class="card-block">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active fade show" id="Generales"> <%--Datos Generales--%>
                        <br />
                        <div class="container">
                        <p class="text-justify">
      
                        En <asp:DropDownList class="form-control-sm" ID="DropDownList1" runat="server" AutoPostBack="false" DataTextField="nombre_municipio" DataValueField="id_municipio"  DataSourceID="SqlDataSource1"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="SELECT [id_municipio], [nombre_municipio] FROM [Dctm].[municipios]"></asp:SqlDataSource>
                        siendo las
                        <asp:TextBox style="width:130px" runat="server" AutoPostBack="false" id="eta" class="form-control-sm" name="eta"/>
                        del día
                        <input style="width:150px" runat="server" autopostback="false" id="FechaActual" class="form-control-sm" name="FechaActual"/>
                        , en cumplimiento a la orden de verificación sanitaria número
                        <input style="width:200px" type="text" autopostback="false" runat="server" class="form-control-sm" id="Folio" placeholder="Introducir Folio..."/>
                        de fecha de <input class="form-control-sm" autopostback="false" id="FechaOrden" runat="server" name="FechaOrden"/>, emitida por
                            <asp:DropDownList OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" OnDataBound="DropDownList2_DataBound" AutoPostBack="false" class="form-control-sm" ID="DropDownList2" runat="server" DataTextField="nombre_coordinador" DataValueField="id_coordinador" DataSourceID="SqlDataSource2"></asp:DropDownList>
                             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="SELECT [id_coordinador], [nombre_coordinador], [caracter], [jurisdicción] FROM [Dctm].[coordinador]"></asp:SqlDataSource>

                       en su carácter de 
                             <asp:DropDownList class="form-control-sm" disabled="true"  ID="DropDownList3" OnDataBound="DropDownList3_DataBound" runat="server" DataTextField="caracter" DataValueField="id_coordinador" DataSourceID="SqlDataSource2"></asp:DropDownList>
                             <asp:DropDownList class="form-control-sm" disabled="true" ID="DropDownList4" OnDataBound="DropDownList4_DataBound" runat="server" DataTextField="jurisdicción" DataValueField="id_coordinador" DataSourceID="SqlDataSource2"></asp:DropDownList>
                        
                        , el(los) Verificador(es) <input style="width:250px" runat="server" type="text" class="form-control-sm" id="Verificador" placeholder="Introducir Nombre..."/>
                        adscrito(s) a la Comisión de Operación Sanitaria, quien(es) se identifica(n) con credencial(es) número(s)
                        <input style="width:150px" type="text" runat="server" class="form-control-sm" autopostback="false" id="Credencial" placeholder="Introducir Número..."/>
                        con fotografía, vigente(s) al <input style="width:150px" class="form-control-sm"  type="date" id="FechaVigencia"  value="2019-12-31" disabled="disabled"/>
                        expedida(s) el <input style="width:150px" type="date" class="form-control-sm" name="FechaExpedicion" value="2019-01-01" disabled="disabled"/>
                        por el Dr. Oscar Villa Garza
                       <%-- <asp:DropDownList OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" AutoPostBack="false" class="form-control-sm" ID="DropDownList5" runat="server" DataTextField="nombre_coordinador" DataValueField="id_coordinador" DataSourceID="SqlDataSource3"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="SELECT [id_coordinador], [nombre_coordinador], [caracter], [jurisdicción] FROM [Dctm].[emisor]"></asp:SqlDataSource>--%>

                            , en su carácter de Comisionado Estatal COEPRIS Tam.
                        <%--<asp:DropDownList  class="form-control-sm" disabled="true" ID="DropDownList6" runat="server" DataTextField="caracter" DataValueField="id_coordinador" DataSourceID="SqlDataSource3"></asp:DropDownList>
                        <asp:DropDownList  class="form-control-sm" disabled="true" ID="DropDownList7" runat="server" DataTextField="jurisdicción" DataValueField="id_coordinador" DataSourceID="SqlDataSource3"></asp:DropDownList>--%>
                        
                        
                            
                        que me(nos) acredita(n) como verificador(es) sanitario(s) con fundamento en los Artículos 4 fracción II
                        incisos, 11 fracciones IX, XI y XIV, y 15 fracción IV del Reglamento de la Comisión Federal para la Protección contra Riesgos Sanitarios y 396,
                        399, 400 y 401 fracción I de la Ley General de Salud. Constituido(s) en el establecimiento denominado
                        <input style="width:250px" type="text" runat="server" class="form-control-sm" id="Establecimiento" placeholder="Introducir Nombre..."/> con RFC
                        <input style="width:200px" type="text" runat="server" class="form-control-sm" id="RFC" placeholder="Introducir RFC..."/>, ubicado en la calle de
                        <input style="width:200px" type="text" runat="server" class="form-control-sm" id="Calle" placeholder="Introducir Calle..."/>,
                        número <input style="width:150px" type="text" runat="server" class="form-control-sm" id="Num" placeholder="Introducir Número..."/>,
                        Colonia <input style="width:200px" type="text" runat="server" class="form-control-sm" id="Colonia" placeholder="Introducir Colonia..."/>,
                        Delegación o Municipio <asp:DropDownList class="form-control-sm" ID="DropDownList8" runat="server" DataTextField="nombre_municipio" DataValueField="id_municipio"  DataSourceID="SqlDataSource1"></asp:DropDownList>  
                        , C.P.: <input style="width:120px" runat="server" class="form-control-sm" type="text" maxlength="5" name="CP" placeholder="Código Postal..."/>, correo electrónico
                        <input style="width:220px" runat="server" class="form-control-sm" id="Correo" name="Correo" placeholder="Correo Electrónico..."/>, teléfono
                        <input style="width:110px" id="telefono" runat="server" class="form-control-sm" maxlength="10" name="telefono" placeholder="Teléfono..." />, fax
                        <input style="width:110px" id="fax" runat="server" class="form-control-sm" maxlength="10" name="fax" placeholder="Fax..." />, circunstancias que constaté(mos) visualmente y solicitando la presencia
                        del propietario o representante legal, responsable, encargado u ocupante que atiende la visita, dijo llamarse
                        <asp:TextBox AutoPostBack="false" oninput="myFunction()" class="form-control-sm" ID="visted" runat="server" placeholder="Introducir Nombre..." ></asp:TextBox>    
                            , y se identifica con
                        <select style="width:190px" runat="server" name="IDUSR" class="form-control-sm select">
                          <option value="selected">Elegir Identificación...</option>
                          <option value="1">Credencial de Elector</option>
                          <option value="2">Licencia de Conducir</option>
                          <option value="3">Pasaporte</option>
                          <option value="4">VISA</option>
                        </select>, con domcilio en <input style="width:450px" type="text" runat="server" class="form-control-sm" name="USRdomicilio" placeholder="Introducir Domicilio..." />
                        y manifiesta ser el
                        <select style="width:180px" runat="server" name="CargoUSR" class=" form-control-sm select">
                          <option value="selected">Elegir Opción...</option>
                          <option value="1">Propietario</option>
                          <option value="2">Representante Legal</option>
                          <option value="3">Responsable</option>
                          <option value="4">Encargado</option>
                          <option value="5">Ocupante</option>
                        </select> del establecimiento, quien recibe original de la presente orden, con firma autógrafa en tinta azul, de la
                        autoridad sanitaria que la emite, en términos del artí­culo 399 de La Ley General de Salud, se le exhorta para que corrobore que la(s) fotografí­a(s) que
                        aparece(n) en dicha(s) credencial(es) concuerda(n) con los rasgos fisionómicos del(los) que actúa(n). Acto seguido se le hace saber el derecho que tiene
                        para nombrar a dos testigos de asistencia, y en caso de no hacerlo, éstos serán designados por el(los) propio(s) verificador(es), quedando nombrados como
                        testigos por parte del C. <asp:TextBox runat="server" class="form-control-sm" ID="autvisited" disabled="true" placeholder="Campo Automático..." ></asp:TextBox>, quienes deberán
                        estar presentes durante el desarrollo de la visita, el C. <input style="width:250px" type="text" runat="server" class="form-control-sm" name="Testigo1" placeholder="Introducir Nombre..."/>, quien
                        se identifica con <select style="width:180px" runat="server" name="ID1" class="form-control-sm select">
                          <option value="selected">Elegir Identificación...</option>
                          <option value="1">Credencial de Elector</option>
                          <option value="2">Licencia de Conducir</option>
                          <option value="3">Pasaporte</option>
                          <option value="4">VISA</option>
                        </select>, con domicilio en <input style="width:450px" type="text" runat="server" class="form-control-sm" name="TES1domicilio" placeholder="Introducir Domicilio..." />
                        y el C.<input style="width:250px" runat="server" class="form-control-sm" type="text" name="Testigo2" placeholder="Introducir Nombre..."/> quien se identifica con 
                        <select style="width:180px" name="ID2" runat="server" class="form-control-sm select">
                          <option value="selected">Elegir Identificación...</option>
                          <option value="1">Credencial de Elector</option>
                          <option value="2">Licencia de Conducir</option>
                          <option value="3">Pasaporte</option>
                          <option value="4">VISA</option>
                        </select>,
                        con domicilio en <input style="width:450px" runat="server" class="form-control-sm" type="text" name="TES2domicilio" placeholder="Introducir Domicilio..." />.
                    </p>
                       
                    </div>
                        <br />
                        <div style="text-align:end">
                            <asp:Button class="button" OnClick="Button1_Click" ID="Button1" runat="server" Text="Agregar Datos" />
                        </div>
                        
                    </div>
                   
                    
                    <div role="tabpanel" class="tab-pane fade in" id="Admin"> <%--Administrativa--%>
                        <div>

                            <br />
                            <p class="container text-justify">
                                Nombre del propietario del establecimiento o representante legal:
                                <input type="text" id="Propietario" class="form-control-sm" runat="server" style="width: 250px" placeholder="Ingresar Nombre..." /><br />
                                Nombre, profesión y cargo de la persona que dirige el establecimiento:
                                <input type="text" id="PAC" class="form-control-sm" runat="server" style="width: 250px" placeholder="Ingresar Nombre..." />, 
                                <input type="text" id="Profesion" class="form-control-sm" runat="server" style="width: 150px" placeholder="Profesión..." />,
                                <input type="text" id="Cargo" class="form-control-sm" runat="server" style="width: 100px" placeholder="Cargo..." /><br />
                                Con giro de actividades:
                                <input type="text" id="Giro" class="form-control-sm" runat="server" style="width: 250px" placeholder="Ingresar Giro..." /><br />
                                <br />
                            </p>
                            <p class="container text-justify">
                                        <label>Tipo de Establecimiento:</label>
                                        <br />
                                        <a class="form-check-label" style="padding-left:20px">
                                            <input runat="server" type="radio" class="form-check-input" name="tipo" />
                                            Público
                                        </a>
                                        <br />
                                        <a class="form-check-label" style="padding-left:20px">
                                            <input runat="server" type="radio" class="form-check-input" name="tipo" />
                                            Social
                                        </a>
                                        <br />
                                        <a class="form-check-label" style="padding-left:20px">
                                            <input runat="server" type="radio" class="form-check-input" name="tipo" />
                                            Privado
                                        </a>
                                </p>

                                <p class="container text-justify">
                                    Especificar Institución a la que pertenece:
                                     <select style="width: 250px" id="Institucion" runat="server" class="form-control-sm select">
                                        <option value="selected">Elegir Institución...</option>
                                        <option value="0">Secretaría de Salud</option>
                                        <option value="1">IMSS</option>
                                        <option value="2">ISSSTE</option>
                                        <option value="3">SM</option>
                                        <option value="4">SEDENA</option>
                                        <option value="5">PEMEX</option>
                                        <option value="6">Otro</option>
                                      </select>
                                </p>
                            <br />
                            <div class="container text-justify">
                                <label>Días laborales:</label>
                                <br />
                                <div class="checkbox-inline" style="padding-left:40px">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Lunes" />L
                                    </a>
                                </div>
                                <div class="checkbox-inline">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Martes" />M
                                    </a>
                                </div>
                                <div class="checkbox-inline">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Miercoles" />M
                                    </a>
                                </div>
                                <div class="checkbox-inline">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Jueves" />J
                                    </a>
                                </div>
                                <div class="checkbox-inline">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Viernes" />V
                                    </a>
                                </div>
                                <div class="checkbox-inline">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Sabado" />S
                                    </a>
                                </div>
                                <div class="checkbox-inline">
                                    <a class="form-check-label">
                                        <input runat="server" type="checkbox" class="form-check-input" value="Domingo" />D
                                    </a>
                                </div>
                            </div>
                            <br />
                            <div class="container text-justify">
                                <p>Horario de labores: de
                                    <input runat="server" class="form-control-sm" id="inicio" />
                                    a
                                    <input runat="server" class="form-control-sm" id="fin" />
                                    hrs.</p>
                            </div>
                            <div class="container text-justify">
                                <label>Turnos:</label> 
                                    <div class="form-check-inline" style="padding-left:20px">
                                        <label class="form-check-label">
                                            <input runat="server" type="checkbox" class="form-check-input" value="Mat" /> Matutino
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="padding-left:20px">
                                        <label class="form-check-label" >
                                            <input runat="server" type="checkbox" class="form-check-input" value="Vesp" /> Vespertino
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="padding-left:20px">
                                        <label class="form-check-label">
                                            <input runat="server" type="checkbox" class="form-check-input" value="Noct" /> Nocturno
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="padding-left:20px">
                                        <label class="form-check-label">
                                            <input runat="server" type="checkbox" class="form-check-input" value="FS" /> Fines de Semana
                                        </label>
                                    </div>
                            </div>
                            <div class="container text-justify">
                                <p>Número total de empleados
                                    <input runat="server" class="form-control-sm" style="width:80px" id="tot_empleados" />. Número de empleados en área de servicio
                                    <input runat="server" class="form-control-sm" style="width:80px" id="serv_empleados" /></p>
                            </div>
                        </div>
                        <br />
                        <div style="text-align:end">
                            <asp:Button class="button" OnClick="Button1_Click" ID="Button2" runat="server" Text="Agregar Datos" />
                        </div>
                    </div>

                    <div role="tabpanel" class="tab-pane fade in" id="Form"> <%--Formulario--%>
                        <h4><i>Instrucciones:</i></h4>
                        <p class="text-justify">Se deberán capturar los valores que conforman la columna denominada "Valor", de acuerdo a la calificación que amerite cada inciso según corresponda.</p>
                        <div class=" ontainer center-block; row">
                            <div class="col"><label>CALIFICACIÓN:</label></div>
                            <div class="col"><a class="calif" style="color:#fff; font-weight:600">2</a> <a style="padding-left:10px">Cumple Totalmente</a></div>
                            <div class="col"><a class="calif" style="color:#fff; font-weight:600">1</a> <a style="padding-left:10px">Cumple Parcialmente</a></div>
                            <div class="col"><a class="calif" style="color:#fff; font-weight:600">0</a> <a style="padding-left:10px">No Cumple</a></div>
                            <div class="col"><a class="calif" style="color:#fff; font-weight:600">N/A</a> <a style="padding-left:10px">No Aplica</a></div>
                        </div>
                        <br />

                        <div class="card sameheight-item" data-exclude="xs">
                            <div class="card-header card-header-sm bordered">
                                <div class="header-block">
                                    <h4>Sección</h4>
                                </div>
                                <ul class="nav nav-tabs pull-right" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" href="#A" role="tab" data-toggle="tab">I-V</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="#B" role="tab" data-toggle="tab">VI-X</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="#C" role="tab" data-toggle="tab">XI-XV</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="#D" role="tab" data-toggle="tab">XVI-XX</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="#E" role="tab" data-toggle="tab">XXI-XXVII</a> </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-block">
                            <div class="tab-content">
                                
                                <div role="tabpanel" class="tab-pane active fade in" id="A">
                                    <table class="table table-hover" >
                                        <thead>
                                            <tr>
                                                <th style="text-align:center" class="font-weight-bold">Punto a verificar</th>
                                                <th style="text-align:center; width:20%" class="font-weight-bold">Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold">I. Datos de identificación y autorización del establecimiento.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">1. El consultorio cuenta con aviso de funcionamiento y permiso de responsable.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList1" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">2. Cuenta con registro diario de pacientes.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList2" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">3. Se cuenta con anuncio o rótulo en donde se da a conocer el horario de funcionamiento del establecimiento.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList3" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">II. Documentación del personal de la salud y archivo clí­nico.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">4. La documentación del personal de la salud (médicos, enfermeras, técnicos y auxiliares) se encuentra completa y actualizada.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList4" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">5. Se cuenta con título profesional del médico o documentos correspondientes que lo acrediten como tal, a la vista del público. </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList5" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">6. El personal médico cuenta con recetario médico impreso e incluye enforma completa: Nombre del Médico,
                                                 Institucion que expide el Título, Número de Cédula Profesional, Domicilio del establecimiento,
                                                 Fecha de expedición y en su caso Número de Cédula de especialidad.
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList6" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">7. Se cuenta con expedientes clí­nicos completos, ordenados e incluen identificación, historia clí­nica, notas
                                                 de evolución, nota de interconsulta, en su caso y con carta de consentimiento informado, debidamente requisitado
                                                 y se conservan por un periodo mí­nimo de cinco años. </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList7" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">III. Lavado de manos.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">8. En el establecimiento se cuenta con jabón antiséptico líquido, agua potable y toallas desechables para el lavado de manos. </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList8" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">9. El personal de salud lleva a cabo el lavado de manos antes y después de revisar a cada paciente y/o en cada procedimiento. </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList9" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">IV. Medicamentos e insumos.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">10. Los medicamentos e insumos que se encuentran en el establecimiento: Tienen fecha de caducidad
                                                 vigente, cuentan con registro sanitario emitido por la autoridad sanitaria competente, se almacencn de acuerdo a las indicaciones
                                                 del fabricante, en caso de ser un establecimiento privado, no cuente con medicamentos del Sector Salud Público, cuenta con una pólí­tica
                                                 para el manejo de soluciones epecí­ficamente de uso pediátrico.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList10" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">V. Control y mantenimiento.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">11. Cuenta con comprobante para el control y erradicación de fauna nociva , menor a 365 días naturales.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList11" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">12. Cuenta con registros o bitácoras de limpieza y desinfección de las instalaciones y equipos.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList12" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    <br />
                                    <div style="text-align: end">
                                        <asp:Button class="button" OnClick="Button1_Click" ID="Button3" runat="server" Text="Agregar Datos" />
                                    </div>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="B">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center" class="font-weight-bold">Punto a verificar</th>
                                                <th style="text-align:center; width:20%" class="font-weight-bold">Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">VI. Prestación de los servicios de atención médica.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">13. El consultorio cuenta con:
                                                    <br />
                                                    A) Un área para entrevista y otra para exploración física.
                                                    <br />
                                                    B) Lavabo funcional con jabón y toallas desechables, ubicadas en el área de exploración fí­sica.
                                                     <br />
                                                    C) Botiquín de urgencias que cuente con lo siguiente:
                                                    <dl>
                                                        <dd style="padding-left: 20px;">- Paracetamol, 500 mg.</dd>
                                                        <dd style="padding-left: 20px;">- Lidocaí­na simple, solución inyectable 2%.</dd>
                                                        <dd style="padding-left: 20px;">- Epinefrina, solución inyectable 1mg 1:1000/ml.</dd>
                                                        <dd style="padding-left: 20px;">- Bultihioscina, solución inyectable 20 mg.</dd>
                                                        <dd style="padding-left: 20px;">- Salbutamol, spray.</dd>
                                                        <dd style="padding-left: 20px;">- Diazepan, solución inyectable 10 mg.</dd>
                                                        <dd style="padding-left: 20px;">- Difenidol, solución inyectable 40 mg.</dd>
                                                        <dd style="padding-left: 20px;">- Agua bidestilada, slución inyectable 2 ml.</dd>
                                                        <dd style="padding-left: 20px;">- Glucosa, solucion al 5% ó 10% y/o 50%.</dd>
                                                        <dd style="padding-left: 20px;">- Solución de Hartmann.</dd>
                                                    </dl>
                                                    D) El siguiente mobiliario y equipo:
                                                    <dl>
                                                        <dd style="padding-left: 20px;">- Asiento para el médico.</dd>
                                                        <dd style="padding-left: 20px;">- Asiento para el paciente y acompañante.</dd>
                                                        <dd style="padding-left: 20px;">- Báscula con estadí­metro.</dd>
                                                        <dd style="padding-left: 20px;">- Guarda de medicamentos, materiales o instrumental.</dd>
                                                        <dd style="padding-left: 20px;">- Mesa de exploración con pierneras.</dd>
                                                        <dd style="padding-left: 20px;">- Sistema para guarda de expedientes clínicos.</dd>
                                                        <dd style="padding-left: 20px;">- Esfigmomanómetro mercurial, aneroide o electrónico con brazalete de tamaño que requiera su actividad principal.</dd>
                                                        <dd style="padding-left: 20px;">- Estetoscopio biauricular.</dd>
                                                        <dd style="padding-left: 20px;">- Estuche de diagnástico (oftalmoscopio opcional).</dd>
                                                        <dd style="padding-left: 20px;">- Pinza tipo mosquito.</dd>
                                                        <dd style="padding-left: 20px;">- Porta aguja recto, con ranura central y estrías cruzadas.</dd>
                                                        <dd style="padding-left: 20px;">- Tijera recta.</dd>
                                                        <dd style="padding-left: 20px;">- Termómetro clínico.</dd>
                                                        <dd style="padding-left: 20px;">- Apósitos.</dd>
                                                        <dd style="padding-left: 20px;">- Gasas.</dd>
                                                        <dd style="padding-left: 20px;">- Guantes quirúrgicos estériles.</dd>
                                                        <dd style="padding-left: 20px;">- Material de sutura.</dd>
                                                        <dd style="padding-left: 20px;">- Soluciones antisépticas.</dd>
                                                    </dl>
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList13" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">VII. Agua potable.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">14. Cuenta con sistema de abastecimiento de agua potable y se realiza limpieza y mantenimiento a las
                                                 cisternas por lo menos una vez al año.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList14" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">15. Se realizó determinación de cloro residual en los siguientes puntos (al menos tres puntos
                                                 incluyendo la cisterna o depósito, a la salida de la misma y en otros puntos de la red de distribución interna).<br />
                                                    <br />
                                                    <table class="table">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th style="width: 15%; text-align:center">Muestra</th>
                                                                <th style="text-align:center">Localización del punto de muestreo</th>
                                                                <th style="width: 25%; text-align:center" class="text-center">Resultado</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><div style="text-align:center">1</div></td>
                                                                <td>
                                                                    <div class="form-group"">
                                                                        <input type="text" style="width: 100%" runat="server" class="form-control-sm" placeholder="..." name="loc1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div">
                                                                        <select name="cloro1" runat="server" class="form-control-sm select">
                                                                            <option selected="selected">Resultado</option>
                                                                            <option value="0">Menos de 0.2</option>
                                                                            <option value="0.2">Entre 0.2 y 1.5</option>
                                                                            <option value="1.5">Más de 1.5</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align:center">2</td>
                                                                <td>
                                                                    <div class="form-group">
                                                                        <input type="text" style="width: 100%" runat="server" class="form-control-sm" placeholder="..." name="loc2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                        <select name="cloro2" runat="server" class="form-control-sm select">
                                                                            <option selected="selected">Resultado</option>
                                                                            <option value="0">Menos de 0.2</option>
                                                                            <option value="0.2">Entre 0.2 y 1.5</option>
                                                                            <option value="1.5">Más de 1.5</option>
                                                                        </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align:center">3</td>
                                                                <td>
                                                                    <div class="form-group">
                                                                        <input type="text" style="width: 100%" runat="server" class="form-control-sm" placeholder="..." name="loc3" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                        <select name="cloro3" runat="server" class="form-control-sm select">
                                                                            <option selected="selected">Resultado</option>
                                                                            <option value="0">Menos de 0.2</option>
                                                                            <option value="0.2">Entre 0.2 y 1.5</option>
                                                                            <option value="1.5">Más de 1.5</option>
                                                                        </select>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td>
                                                   <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList15" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">16. Se realiza limpieza y mantenimiento a las cisternas por lo menos una vez al año.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList16" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">VIII. Residuos Peligrosos Biológico Infecciosos (RPBI).</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">17. Se cuenta con contrato con empresa recolectora de
                                                    <abbr title="Residuos Peligrosos Biológico Infecciosos">R.P.B.I.</abbr>
                                                    vigente, así­ como de los manifiestos de recolección o bien se encuentra 
                                                    adherido a un plan de manejo externo.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList17" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">18. En áreas del establecimiento se separan y envasan los residuospeligrososo biológicos infecciosos, de acuerdo
                                                 con sus caracterí­sticas físicas y biológicas infecciosas, sin mezclarse con ningún otro tipo de residuos municipales o peligrosos.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList18" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">IX. Consultorio de medicina preventiva.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">19. El consultodio de medicina preventiva, además de lo señalado en cuanto a infraestructura y equipamento para el
                                                 consultorio de medicina general, deberá contar con un sistema de refrigración con control y registro, que garantice una temperatura
                                                 constante y estable para preservar exclusivamente biológicos. En el caso de un conjunto de consultorios que están interrelacionados
                                                 en una misma unidad médica, será suficiente con un sistema de refrigeración.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList19" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                    </td>
                                            </tr>
                                            <tr>
                                            <td style="text-align:center" class="font-weight-bold text-center">X. Atención de urgencias.</td>
                                            <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">20. Cuenta con al menos el equipo que se menciona a continuación: Aspirador, Equipo de cánculas orofarí­ngeas
                                                varios tamaños para uso pediátrico y adulto, Mangos de laringoscopio varios tamaños para uso pediátrico y adulto.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList20" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <div style="text-align: end">
                                        <asp:Button class="button" OnClick="Button1_Click" ID="Button4" runat="server" Text="Agregar Datos" />
                                    </div>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="C">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center" class="font-weight-bold">Punto a verificar</th>
                                                <th style="text-align:center; width:20%" class="font-weight-bold">Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XI. Atención del parto.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">21. Se atienden partos de urgencia en el consultorio, solo en el caso de que las condiciones geográficas no
                                                 permitanacceso a unidades de mayor capacidad (Describir las actividades y áreas que corresponden a la atención del parto).</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList21" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">22. Cuenta con un sistema de esterilización para los materiales necesarios para llevar el control del
                                                proceso o bien emplean material estéril desechable.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList22" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">23. Cuenta con al menos, el siguiente material:
                                                  <dl>
                                                      <dd style="padding-left: 20px;">- Mesa de expulsión.</dd>
                                                      <dd style="padding-left: 20px;">- Mesa de Mayo o similar.</dd>
                                                      <dd style="padding-left: 20px;">- Mesa de atención de recién nacido.</dd>
                                                      <dd style="padding-left: 20px;">- Cinta para cordón umbilical o pinza para el cordón umbilical.</dd>
                                                      <dd style="padding-left: 20px;">- Equipo de Sutura.</dd>
                                                      <dd style="padding-left: 20px;">- Equipo de reanimación neonatal y de adulto.</dd>
                                                      <dd style="padding-left: 20px;">- Guantes de látex.</dd>
                                                      <dd style="padding-left: 20px;">- Sondas para aspirar al neonato.</dd>
                                                      <dd style="padding-left: 20px;">- Tijera recta y curva.</dd>
                                                      <dd style="padding-left: 20px;">- Ropa estéril para atención del parto (bata de cirujano, secado de manos, dos cubrepiernas tres campos quirúrgicos).</dd>
                                                      <dd style="padding-left: 20px;">- Ropa estéril para atención del recién nacido (frazada, sabanita, campo doble y campo sencillo).</dd>
                                                  </dl>
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList23" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XII. Consultorio de Psicologí­a.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">24. Deberá contar con espacio y mobiliario suficiente y adecuado para la entrevista, así­ como para la intervención
                                                   psicoterapéutica, el mobiliario mínimo incluye:
                                                   <dl>
                                                       <dd style="padding-left: 20px;">- Asiento para el psicólogo.</dd>
                                                       <dd style="padding-left: 20px;">- Asiento para el paciente y su acompañante.</dd>
                                                       <dd style="padding-left: 20px;">- Sistema para guarda de expedientes clí­nicos.</dd>
                                                   </dl>
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList24" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XIII. Consultorio de Acupuntura.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">25. El consultorio de acupuntura, además de lo señalado para el consultorio, deberá contar con lo siguiente:
                                                <dl>
                                                    <dd style="padding-left: 20px;">- Mesa de exploración.</dd>
                                                    <dd style="padding-left: 20px;">- Mesa de Mayo, Pasteur o similar, de altura ajustable.</dd>
                                                    <dd style="padding-left: 20px;">- Agujas de acupuntura.</dd>
                                                    <dd style="padding-left: 20px;">- Caja con tapa para soluciones desinfectantes.</dd>
                                                    <dd style="padding-left: 20px;">- Tubos de ensayo o recipiente portaagujas.</dd>
                                                    <dd style="padding-left: 20px;">- Autoclave o esterilizador de operación manual.</dd>
                                                    <dd style="padding-left: 20px;">- Electroestimulador.</dd>
                                                    <dd style="padding-left: 20px;">- Magnetos.</dd>
                                                    <dd style="padding-left: 20px;">- Martillo de 7 puntas.</dd>
                                                </dl>
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList25" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XIV. Consultorio de Nutriologí­a.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">26. Deberá contar con espacio y mobiliario suficiente y adecuado para la atención del paciente, lo que incluye:
                                                  <dl>
                                                      <dd style="padding-left: 20px;">- Asiento para el nutriólogo.</dd>
                                                      <dd style="padding-left: 20px;">- Asiento para el paciente y el acompañante.</dd>
                                                      <dd style="padding-left: 20px;">- Sistema para guarda de expedientes clínicos.</dd>
                                                      <dd style="padding-left: 20px;">- Báscula clínica con estadí­metro.</dd>
                                                      <dd style="padding-left: 20px;">- Cinta antropométrica de fibra de vidrio.</dd>
                                                  </dl>
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList26" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">Equipamiento/Instrumental de acuerdo a especialidades.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XV. El consultorio de cirugía general y reconstructiva cuenta con el siguiente equipamiento y/o
                                                 instrumental en óptimas condiciones de funcionamiento.</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">27. El consultorio que no está integrado a hospital cuenta con un sistema de esterilización, de preferencia
                                                 autoclave y sistemas químicos de esterilización o el contrato del servicio respectivo.</td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList27" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">
                                                    <dl>
                                                        <dd>28.- Mesa con tarja.</dd>
                                                        <dd style="padding-left: 20px;">- Caja de Doayan.</dd>
                                                        <dd style="padding-left: 20px;">- Charola de Mayo.</dd>
                                                        <dd style="padding-left: 20px;">- Dos recipientes con tapa para soluciones desinfectantes.</dd>
                                                        <dd style="padding-left: 20px;">- Tijera Mayo.</dd>
                                                        <dd style="padding-left: 20px;">- Mango de bisturí.</dd>
                                                        <dd style="padding-left: 20px;">- Pinza de disección con dientes.</dd>
                                                        <dd style="padding-left: 20px;">- Punza de disección sin dientes.</dd>
                                                        <dd style="padding-left: 20px;">- Torundero.</dd>
                                                        <dd style="padding-left: 20px;">- Pinzas de Kelly.</dd>
                                                        <dd style="padding-left: 20px;">- Pinzas mosquito rectas y curvas.</dd>
                                                        <dd style="padding-left: 20px;">- Portaagujas.</dd>
                                                        <dd style="padding-left: 20px;">- Riñón de 250 ml.</dd>
                                                    </dl>
                                                </td>
                                                <td>
                                                    <div style="padding-left:25%" >
                                                        <asp:RadioButtonList CssClass="space; wea" id="RadioButtonList28" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    <br />
                                    <div style="text-align: end">
                                        <asp:Button class="button" OnClick="Button1_Click" ID="Button5" runat="server" Text="Agregar Datos" />
                                    </div>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="D">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center" class="font-weight-bold">Punto a verificar</th>
                                                <th style="text-align:center; width:20%" class="font-weight-bold">Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                    <tr>
                                        <td style="text-align:center" class="font-weight-bold text-center">XVI. El consultorio de dermatologí­a cuenta con el siguiente equipamiento y/o instrumental en
                                        óptimas condiciones de funcionamiento.</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">29. Equipo de fulguración, lámpara con lupa de tres dioptrías.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList29" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">30. Cucharillas (curetas) dérmicas de Piffard o de Douglas o equivalente tecnológico.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList30" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">31. Pinza de depilación, pinza para biopsia, extractor de comedones con lanceta.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList31" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center" class="font-weight-bold text-center">XVII. El consultorio de Gineco-Obstetricia cuenta con el siguiente equipamiento y/o instrumental en
                                        óptimas condiciones de funcionamiento.</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">32. Mesa de exploración con pierneras, mesa de trabajo para preparar laminillas.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList32" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">33. Sistema de estarilización por calor seco o húmedo y para guarda de material estéril (para consultorios
                                        independientes, no ligados a un hospital).</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList33" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">34. Amplificador de latido fetal y de contracciones uterinas o su equivalente tecnológico, aparato para
                                        cauterizar o fulgurador.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList34" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">35. Recipiente hermético para soluciones desinfectantes, riñón de 250 ml, portacubetas rodable, cubeta de acero
                                        inoxidable de 12 litros (bolsa amarilla).</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList35" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">36. Tres espejos vaginales de cada tamaño, histerómetro, tijera de Metzenbaum, torundero.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList36" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">37. Pinza de Pozzi, pinza para biopsia de cérvix uterino, pinza para biopsia de endometrio, pinza uterina,
                                        pinzas para sujetar cuello uterino.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList37" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center" class="font-weight-bold text-center">XVIII. El consultorio de Medicina Física y Rehabilitación cuenta con el siguiente equipamiento en
                                        óptimas condiciones de funcionamiento.</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">38. Cinta métrica, Goniómetro, martillo de reflejos y Plantoscopio.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList38" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center" class="font-weight-bold text-center">XIX. El consultorio de Neumología/Inhaloterapia cuenta con el siguiente equipamiento en
                                        óptimas condiciones de funcionamiento.</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">39. Espirómetro o sustituto tecnológico, sistemas instrumentales de tratamiento (cepillo bronquial, pinza de
                                        biopsia bronquial o su equivalente tecnológico).</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList39" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">40. En caso de ofertar el servicio de inhaloterapia deberá contar con: mesa con tarja, sillón reclinable.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList40" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">41. Vaporizador humedecedor, nebulizador, micronebulizador o su equivalente tecnológico.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList41" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center" class="font-weight-bold text-center">XX. El consultorio de Neurología y Neurocirugí­a cuenta con el siguiente equipamiento e instrumental en
                                        óptimas condiciones de funcionamiento.</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">42. Carta para medir agudeza visual, compás de Weber y contenedor de olores fuertes.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList42" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-justify">43. Dinamómetro de mano, equipo para cirugía menor, tubos de ensayo con agua fría y caliente y martillo de percusión con
                                        aditamentos para la exploración de la sensibilildad cutánea.</td>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList43" runat="server">
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                    <br />
                                    <div style="text-align: end">
                                        <asp:Button class="button" OnClick="Button1_Click" ID="Button6" runat="server" Text="Agregar Datos" />
                                    </div>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="E">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center" class="font-weight-bold">Punto a verificar</th>
                                                <th style="text-align:center; width:20%" class="font-weight-bold">Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXI. El consultorio de Ortopedia y Traumatologí­a cuenta con el siguiente equipamiento en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">44. Mesa de trabajo con doble tarja y trampa de yeso, martillo percursor grande para reflejos, pinza de disección con
                                                dientes y sin dientes, pinza Rochester, plantoscopio y sistema de somatometrí­a.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList44" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">45. Pinza para yeso, sierra de stryker, tijera de botón, tijera de caimán, tijera para retirar puntos y tijera de presión.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList45" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXII. El consultorio de Pediatría cuenta con el siguiente equipamiento en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">46. Báscula para bebés, Esfigmomanómetro con brazalete para infantes y escolares, Infantómetro (puede ser parte de la mesa de
                                                exploración).</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList46" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">47. Refrigerador de 4.5 pies cúbicos (cuando tengan servicio de vacunación).</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList47" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXIII. El consultorio de Proctología cuenta con el siguiente equipamiento en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">48. Mesa especial de exploración proctológica, caja de desinfección de instrumentos, caja de Doayan, todundero.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList48" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">49. Equipo de endoscopí­a y equipo de curaciones, unidad electroquirúrgica.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList49" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXIV. El consultorio de Urología cuenta con el siguiente equipamiento en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">50. Carro de curaciones, caja de instrumentos con tapa, cistouretroscopio mínimo con dos camisas 20 y 22fr.
                                                con sus aditamentos de fuente de poder y cables, recipiente con tapa para soluciones esterilizadoras.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList50" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">51. Mango de bisturí, pinza de disección con y sin dientes, pinza Kelly, pinza Forester recta, porta agujas,
                                                tijera mayo, tijera para retirar puntos, torundero, riñón.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList51" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">52. Densímetropara orina o su equivalente tecnológico, juego de candelillas, juego de dilatadores uretrales
                                                juego de muletillas, sondas de tres vías, sondas uretrales con globo.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList52" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXV. El consultorio de Oftalmología cuenta con el siguiente equipamiento instrumental en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">53. Mesa para instrumentos  oftalmológicos, sillón para paciente, armazón de pruebas, caja de lentes para
                                                pruebas, campí­metro (o sustitución tecnológica correspondiente), exoftalmómetro, foróptero.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList53" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">54. Juego de cartillas a distancia o su equivalente tecnológico, juego de sondas exploradoras para ví­as
                                                lagrimales, keratómetro o eskiascopio.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList54" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">55. Lámpara de hendidura, lensómetro, lupa anasférica de 20 dioptrías, oclusor, perí­metro, prisma para medir
                                                forias, retinoscopio.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList55" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">56. Tonómetro, aguja para cuerpos extraños, agujas para lavado de vías lagrimales, blefaróstato, caja de
                                                Bard Parker con pinza de traslado.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList56" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">57. Dilatador de punto lagrimal, gubia para cuerpos extraños, juego de espejos para eskinoscopio, plano y cóncavo.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList57" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">58. Mango de bisturí­ o su equivalente tecnológico, pinza conjuntiva recta, pinza curva de iris, sin dientes
                                                pinza para fijación, pinza para pestañas.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList58" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">59. Recipiente hermético para desinfectantes(en su caso esterilizador), separadores de desmarres, tijeras para
                                                retirar puntos, tijera de iris.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList59" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXVI. El consultorio de Otorrinolaringología cuenta con el siguiente equipamiento en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">60. Sillón de exploración Otorrinolaringologica, con movimiento circular y posibilidad de variar altura e inclinación.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList60" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">61. Esterilizador.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList61" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">62. Adaptador fenestrado para los aspiradores de oído (Guilford-Wright), Aplicador de Lambury, Aplicador metálico
                                                de punta triangular o estriada tipo Lathbury o Brown, Asa de Billeau, Cánula vanalyea, con punta roma, calibrer 15 ga (1.8mm), Cucharilla
                                                o asa para cerumen, Cuchillo angulado de paracentesis o miringotomía, Jeringa metálica para lavado de oído, Juego de aspiradores de Frazier
                                                No.6-8 y 10. Juego de aspiradores de oí­do No. 16 G, 18 G y 20 G, Juego de espejos larÃ­ngeos Nos. 2-4-6 y 8, Juego de tres diapasones 256,
                                                512 y 1024 tipo Hartman, Lámpara de alcohol, Lámpara frontal o espejo frontal, en este caso es necesario contar con una lámpara con haz
                                                dirigible, Mango universal para espejo laríngeo, Mechero, Microscopio de pedestal o de pared con iluminación halógena con doble lámpara,
                                                ajuste de dioptrí­as en oculares de gran angular de 12.5 con objetivo de 200 mm, Otoscopio con lente de aumento 2x con su juego de conos
                                                óticos, Pera de politzer, Pinza de Hartman copa de 0.6 mm, 13.5 cm de longitud.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList62" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">63. Pinza para biopsia, rinoscopio adulto e infantil, riñón metálico, transiluminador.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList63" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:center" class="font-weight-bold text-center">XXVII. El consultorio de Psicología cuenta con el siguiente equipamiento en óptimas condiciones de funcionamiento.
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">64. Asiento para el médico, asiento para el paciente y acompañante, diván o sillón, escritorio, mueble para
                                                guarda de equipos e insumos.</td>
                                                <td>
                                                    <div style="padding-left: 25%">
                                                        <asp:RadioButtonList CssClass="space; wea" ID="RadioButtonList64" runat="server">
                                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="N/A" Value="NULL"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    <br />
                                    <div style="text-align: end">
                                        <asp:Button class="button" OnClick="Button1_Click" ID="Button7" runat="server" Text="Agregar Datos" />
                                    </div>
                                </div>

                            </div>
                        </div>
                        

                    </div>

                    <div role="tabpanel" class="tab-pane fade in" id="ObsGen"> <%--Observaciones Generales--%>
                        <div>
                        <br />
                        <h4>Deberá describir la ubicación del establecimiento y las áreas
                        </h4>
                        <br />
                            <label>Describir a continuación:</label><br />
                            <textarea class="form-control container" runat="server" rows="7" id="observaciones"></textarea>
                        <br />
                        
                        <!--Medidas de Seguridad-->
                        <div>
                            <table class="container table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="text-sm-center">Medidas de seguridad</th>
                                        <th style="width: 30%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1. Se aplica medida de seguridad.</td>
                                        <td style="text-align:center" class="form-check">
                                            <label class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms1" />SI
                                            </label>
                                            <label style="padding-left:30%" class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms1" />NO
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2. Aseguramiento de productos u objetos.</td>
                                            <td style="text-align:center" class="form-check">
                                            <label class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms2" />SI
                                            </label>
                                            <label style="padding-left:30%" class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms2" />NO
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2.1 Número de folio de sellos de aseguramiento:</td>
                                        <td>
                                            <textarea runat="server" class="form-control" rows="1" id="NumFSA"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3. Suspensión de trabajos o servicios.</td>
                                        <td style="text-align:center" class="form-check">
                                            <label runat="server" class="form-check-label">
                                                <input style="margin-right:8px" type="radio" class="form-check-input" name="ms3" />SI
                                            </label>
                                            <label style="padding-left:30%" class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms3" />NO
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3.1 Número de folio de los sellos de suspención:</td>
                                        <td>
                                            <textarea runat="server" class="form-control" rows="1" id="NumFSS"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4. Reubicación de sellos.</td>
                                        <td style="text-align:center" class="form-check">
                                            <label class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms4" />SI
                                            </label>
                                            <label style="padding-left:30%" class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms4" />NO
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4.1 Número de folio de sello(s) reubicado(s):</td>
                                        <td>
                                            <textarea runat="server" class="form-control" rows="1" id="NumFSR"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5. Se anexa documentación.</td>
                                        <td style="text-align:center" class="form-check">
                                            <label class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms5" />SI
                                            </label>
                                            <label style="padding-left:30%" class="form-check-label">
                                                <input runat="server" style="margin-right:8px" type="radio" class="form-check-input" name="ms5" />NO
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5.1 Número y descripción de anexos:</td>
                                        <td>
                                            <textarea runat="server" class="form-control" rows="1" id="NumA"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div class="container">
                            <p class="text-justify">
                                Leído lo anterior, se hace saber al interesado el derecho que tiene de manifestar lo que a sus intereses convenga en relación con los hechos contenidos
                                en el acta; o bien, por escrito hacer uso de tal derecho dentro del término de cinco días hábiles a partir del dí­a siguiente de la presente diligencia.
                                En uso de la palabra del C. Dr. Oscar Villa Garza hace constar que recibe original de la presente orden, con firma autógrafa en tinta azul, de la
                                autoridad sanitaria que la emite; objeto de la presente acta y que identificó plenamente al(los) verificador(es) para tal efecto, y con relación a los
                                hechos que se asientan en la misma manifiesta lo siguiente:
                            </p>
                        </div>
                        <div class="container form-group">
                            <textarea runat="server" class="container form-control" rows="7" id="txt1"></textarea>
                        </div>
                    </div>
                        <br />
                        <div style="text-align:end">
                            <asp:Button class="button" OnClick="Button1_Click" ID="Button8" runat="server" Text="Agregar Datos" />
                        </div>
                    </div>
            </div>
        </div>
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
    </p>




</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function myFunction() {
            var b = document.getElementById("<%=visted.ClientID%>").value;
            document.getElementById("<%=autvisited.ClientID%>").value = b  }
    </script>
</asp:Content>

