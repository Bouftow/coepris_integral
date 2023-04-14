<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="lacuse.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        /*.estil {
            overflow-y: scroll;
            height: auto;
            overflow-x: scroll;
        }*/
        @media print {
  @page { margin: 0; }
  body { margin: 2cm; }
}
        .FixedHeader {
            position: absolute;
        }

        .btn {
            padding-top: 5px;
        }

        #content {
            width: 100%;
            text-align: center;
            display: none;
        }

        #show {
            display: none;
        }

        .grid-container {
            display: grid;
            grid-template-columns: 245px 39px;
            /*border: 1px solid rgba(0, 0, 0, 0.8);*/
        }

        .grid-item {
            /*border: 1px solid rgba(0, 0, 0, 0.8);*/
            width: auto;
            align-content: center;
        }

        .myButtonAprobar {
            -moz-box-shadow: 0px 0px 0px 2px #4f574a;
            -webkit-box-shadow: 0px 0px 0px 2px #4f574a;
            box-shadow: 0px 0px 0px 2px #4f574a;
            background-color: #33cc5c;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            border: 1px solid #289933;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 19px;
            padding: 12px 37px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #2f6627;
        }

            .myButtonAprobar:hover {
                background-color: #5cbf2a;
            }

            .myButtonAprobar:active {
                position: relative;
                top: 1px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    



    <div class="card-block card">
            <%--  <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h2>ACUSE</h2>
                </div>

            </div>--%>
      <%--  </div>--%>


        <div id="areaImprimir">
            <div class="">
                <asp:GridView Width="100%"
                    ID="grdNombreTramite"
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
                       

                        <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" />
                        <asp:BoundField HeaderText="Tipo de Trámite" DataField="nombre_tramite" />
                        <%--<asp:BoundField HeaderText="Estado Actual" DataField="Estatus"  />--%>
                        <asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField HeaderText="Modalidad" DataField="modalidad" ItemStyle-Wrap="false" ItemStyle-CssClass="b" ItemStyle-BackColor="#8aff7d"  ItemStyle-ForeColor="White"/>



                    </Columns>

                </asp:GridView>


            </div>
            <div class="container col-sm-12" style="margin-top: 10px; margin-bottom: 10px">
                <div class="row">
                    <div class="col-sm-6">

                        <h3 style="text-align: center">Datos del Solicitante:</h3>


                        <div class="form-group col-sm-12">
                            <b>CURP</b>:<br />
                            <p id="Curp">!</p>
                            <div class="row">
                                <div class="col-sm-6">
                                    <b>Nombre del Solicitante:</b>
                                    <p id="NombreCompleto">!</p>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 ">
                                    <b>Teléfonos de contacto:</b>
                                    <p id="Telefonos">°</p>
                                </div>
                            </div>

                            <b>Correo Electronico:<br />
                            </b>
                            <p id="Correo"></p>


                            <h5 style="text-align: center">Requisitos Entregados:</h5>




                         <table class="table table-bordered">

                            <tr>
                                <th style="padding: 5px; border-right: hidden; border-top: hidden; border-left: hidden;">REQUISITO</th>
                                <th style="padding: 5px; text-align: center; border-right: hidden; border-top: hidden; border-left: hidden">ENTREGADO</th>
                            </tr>
                            <tr runat="server" id="uno">
                                <td>
                                    <label>• Solicitud de Licencia Sanitaria</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkSolLicSan" runat="server" Enabled="false" />

                                </td>
                            
                            </tr>
                            <tr runat="server" id="dosa">
                                <td>
                                    <label>• Alta ante S.A.T.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkaltasat" runat="server" Enabled="false" /></td>
                            </tr>
                            <tr runat="server" id="tres">
                                <td>
                                    <label>• Plano y Memoria Descriptiva</label>
                                </td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPlanoMemoria" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="cuatro">
                                <td>
                                    <label>• Relación de Material y Equipo Existente</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkRelacionMaterialEquipo" runat="server" Enabled="false" /></td>
                                
                            </tr>
                            <tr runat="server" id="cinco">
                                <td>
                                    <label>• Pago</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPago" runat="server" Enabled="false" /></td>

                            </tr>
                            <tr runat="server" id="seis">
                                <td>
                                    <label>• Programa de Actividades</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprogramaact" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="siete">
                                <td>
                                    <label>• Convenio P.G.J.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkfotocopiaconvenio" runat="server" Enabled="false" /></td>
                                
                                    
                            </tr>
                            <tr runat="server" id="ocho">
                                <td>
                                    <label>• Libro de Registro de Cadáveres</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chklibroregistro" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="nueve">
                                <td>
                                    <label>• Descripción de Técnica de Embalsamamiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdescripciontecnicaembal" Enabled="false" runat="server" /></td>
                               
                            </tr>
                            <tr runat="server" id="diez">
                                <td>
                                    <label>• Tarjeta de Control</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chktarjetadecontrol" Enabled="false" runat="server" /></td>
                              
                            </tr>
                            <tr runat="server" id="once">
                                <td>
                                    <label>• Carta Consentimiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcartaconsentimiento" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="doce">
                                <td>
                                    <label>• Acta Constitutiva</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkactaconstitutiva" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="trece">
                                <td>
                                    <label>• Reglamento Interno</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkreglamentointerno" runat="server" Enabled="false" /></td>
                                
                            </tr>
                            <tr runat="server" id="catorce">
                                <td>
                                    <label>• Visto Bueno Protección Civil</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkvistoproteccioncivil" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="quince">
                                <td>
                                    <label>• Relación del Personal que labora</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkrelacionpersonal" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="dieciseis">
                                <td>
                                    <label>• Autorización del Sistema D.I.F.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkautorizaciondif" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="diecisiete">
                                <td>
                                    <label>• Cédula de Autoevaluación</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcedulaautoevaluacion" runat="server" Enabled="false" /></td>
                             
                            </tr>
                            <tr runat="server" id="dieciocho">
                                <td>
                                    <label>• Papel Membretado</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPapelMembretado" runat="server" Enabled="false" /></td>
                                

                            </tr>
                            <tr runat="server" id="diecinueve">
                                <td>
                                    <label>• Autorización S.E.T.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkautorizacionset" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="veinte">
                                <td>
                                    <label>• Uso de Suelo</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkusodesuelo" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="veintiuno">
                                <td>
                                    <label>• Proceso de Limpieza</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprocesolimpieza" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="veintidos">
                                <td>
                                    <label>• Relación de Tipo de Análisis</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkrelaciontipoanalisis" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="veintitres">
                                <td>
                                    <label>• Acta de Verificación</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkactaverificacion" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="veinticuatro">
                                <td>
                                    <label>• Solicitud</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chksolicitud" runat="server" Enabled="false" /></td>
                               
                               
                            </tr>
                            <tr runat="server" id="veinticinco">
                                <td>
                                    <label>• Títutlo</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chktitulo" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="veintiseis">
                                <td>
                                    <label>• Cédula</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcedula" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="veintisiete">
                                <td>
                                    <label>• Diploma</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdiploma" runat="server" Enabled="false" /></td>
                               
                              
                            </tr>
                            <tr runat="server" id="veintiocho">
                                <td>
                                    <label>• Curriculum</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkCurriculum" runat="server" Enabled="false" /></td>
                           
                            </tr>
                            <tr runat="server" id="veintinueve">
                                <td>
                                    <label>• 2 Fotografías</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkfotografias" runat="server" Enabled="false" /></td>
                             
                            </tr>
                            <tr runat="server" id="treinta">
                                <td>
                                    <label>• Pago del Responsable Sanitario</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkpagoresponsable" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="treintayuno">
                                <td>
                                    <label>• Aviso de funcionamiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkavisofunc" runat="server" Enabled="false" /></td>
                              
                            </tr>
                            <tr runat="server" id="treintaydos">
                                <td>
                                    <label>• Documentación del técnico en Atención Médica Prehospitalaria</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdoctecatmedhosp" runat="server" Enabled="false" /></td>
                               
                            </tr>
                            <tr runat="server" id="treintaytres" >
                                <td>
                                <label>• Programa Médico</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprogramamedico" runat="server" Enabled="false" /></td>
                                
                            </tr>

                               <tr runat="server" id="treintaycuatro" >
                                <td>
                                <label>• Características Mecánicas de la Unidad</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcaracteristicasmecanicas" runat="server" Enabled="false" /></td>
                                
                            </tr>

                                <tr runat="server" id="treintaycinco" >
                                <td><label>• Fotografías de la Unidad</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkfotografiasdeunidad" runat="server" Enabled="false" />
                                </td>
                            </tr>
                            <tr runat="server" id="treintayseis" >
                                <td><label>• Licencia Sanitaria Anterior</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chklicenciasanitariaanterior" runat="server" Enabled="false" /></td> 
                                
                            </tr>
                             <tr runat="server" id="treintaysiete" >
                                <td><label>• Autorización de Responsable Anterior</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkautorizacionresponsableanterior" runat="server" Enabled="false" /></td> 
                            </tr>
                             <tr runat="server" id="treintayocho" >
                                <td><label>• Carta de Antecedentes no penales</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkantecedentesnopenales" runat="server" Enabled="false" /></td>
                            </tr>
                             <tr runat="server" id="treintaynueve" >
                                <td><label>• Póliza de seguro ante eventualidades</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkpolizaseguro" runat="server" Enabled="false" /></td>
                            </tr>
                             <tr runat="server" id="cuarenta" >
                                <td><label>• Programación de la alimentación de la semana y documentación profesional del nutriólogo</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkprogramaalimentacion" runat="server" Enabled="false" /></td>
                            </tr>
                              <tr runat="server" id="cuarentayuno" >
                                <td><label>• Título del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chktitulo_mr" runat="server" Enabled="false" /></td>
                            </tr>
                            <tr runat="server" id="cuarentaydos" >
                                <td><label>• Cédula del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcedula_mr" runat="server" Enabled="false" /></td>
                            </tr>
                             <tr runat="server" id="cuarentaytres" >
                                <td><label>• Diploma del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdiploma_mr" runat="server" Enabled="false" /></td>
                            </tr>
                            <tr runat="server" id="cuarentaycuatro" >
                                <td><label>• Curriculum del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcurriculum_mr" runat="server" Enabled="false" /></td>
                            </tr>
                             <tr runat="server" id="cuarentaycinco" >
                                <td><label>• Relación de personal paramédico</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkrelacionpersonal_paramedico" runat="server" Enabled="false" /></td>
                            </tr>
                                 <tr runat="server" id="cuarentayseis" >
                                <td><label>• Documentación para el trámite de laboratorio</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdocumentacion_laboratorio" runat="server" Enabled="false" /></td>
                            </tr>
                               <tr runat="server" id="cuarentaysiete" >
                                <td><label>• Copia de la licencia sanitaria del laboratorio matriz</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcopialicencia_matriz" runat="server" Enabled="false" /></td>
                            </tr>
                              <tr runat="server" id="cuarentayocho" >
                                <td><label>• Copia de la autorización de responsable del laboratorio matriz</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcopiaautorizacion_matriz" runat="server" Enabled="false" /></td>
                            </tr>
                             <tr runat="server" id="cuarentaynueve" >
                                <td><label>• Documentación profesional del técnico en el área</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdocumentacion_tecnico" runat="server" Enabled="false" /></td>
                            </tr>
                            <tr runat="server" id="cincuenta" >
                                <td><label>• Documentación que acredite al responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdocumentacion_responsable" runat="server" Enabled="false" /></td>
                            </tr>
                            <tr runat="server" id="cincuentayuno" >
                                <td><label>• Forma de limpieza y esterilización</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkformalimpieza" runat="server" Enabled="false" /></td>
                            </tr>

                            
                        </table>


                            <b>RUI:</b><br />
                            <p id="Rui"></p>
                            <b>Observaciones:</b><br />
                            <p id="Observaciones"></p>



                        </div>


                    </div>

                    <div class="row col-sm-6">
                        <div class="container">

                            <h3 style="text-align: center">Datos del Establecimiento:</h3>
                            <br />


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <b>RFC:</b>
                                        <br />
                                        <p id="Rfc"></p>
                                    </div>
                                    <br />
                                </div>
                                <b>Nombre del Establecimiento:</b>
                                <p id="Nombreest"></p>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <b>Razón Social:</b>
                                        <br />
                                        <p id="Razonsocial"></p>
                                    </div>
                                    <div class="col-sm-6">
                                        <b>Giro:</b>
                                        <br />
                                        <p id="Giro"></p>
                                    </div>
                                </div>
                                <br />
                                <h5 style="text-align: center">Domicilio del Establecimiento:</h5>

                                <div class="row">
                                    <div class="col-sm-4 ">
                                        <b>Municipio:</b>
                                        <br />
                                        <p id="Municipio"></p>


                                    </div>

                                    <div class="col-sm-4 ">
                                        <b>Localidad:</b>
                                        <br />
                                        <p id="Localidad"></p>


                                    </div>



                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <b>Colonia:</b><br />
                                        <p id="Colonia"></p>

                                    </div>
                                    <div class="col-sm-4">
                                        <b>Calle y Número:</b><br />
                                        <p id="Calle"></p>

                                    </div>

                                    <div class="col-sm-4">
                                        <b>Código Postal</b><br />
                                        <p id="CP"></p>

                                    </div>
                                </div>
                                <br />

                                <h5 style="text-align: center">Información de Contacto:</h5>
                                <br />

                                <div class="row">
                                    <div class="col-sm-8">
                                        <b>Número telefónico del Establecimiento:</b><br />
                                        <p id="Telest"></p>

                                    </div>
                                    <br />
                                    <br />
                                    <div class="col-sm-8">
                                        <b>Correo Electrónico del Establecimiento:</b><br />
                                        <p id="Correoest"></p>

                                    </div>
                                  


                                </div>
                                <br />
                                <br />
                                <br />
                                <%--  <p style="text-align:justify" >Se me ha hecho saber que el tramite iniciado ante la COEPRIS se considera 
                                      INCOMPLETO,  toda vez que la documentación que he presentado no es suficiente 
                                      y/o no reúne los requisitos necesarios. Con base en el artículo 58 de la Ley de Procedimiento 
                                      Administrativo del Estado de Tamaulipas, se ingresa con las reservas pertinentes, en el entendido 
                                      de que es altamente probable que se me solicite de manera oficial la documentación o requisitos 
                                      faltantes para realizar el análisis correspondiente, lo que provocaría demora en la tramitación 
                                      de mi solicitud.
                                      </p>--%>
                    <p style="text-align:center">Nombre y Firma del solicitante: ___________________________________________________</p>


                            </div>
                        </div>




                    </div>

                </div>
            </div>

           
        </div>
        <div style="text-align: center">
            <input style="margin-top: 20px" type="button" class="myButtonAprobar" onclick="printDiv('areaImprimir')" value="Imprimir Acuse" />
        </div>
        <input type="button" name="imprimir" value="Imprimir" onclick="window.print();"/>



        <p style="visibility: hidden">

            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>

            <asp:TextBox ID="txtObservaciones" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtCurp" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtApellidop" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtApellidom" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtTelmov" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtTelfij" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtRui" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtRfc" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtNombreest" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtMunicipio" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtColonia" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtCalle" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtRazonsocial" runat="server"></asp:TextBox>

            <asp:TextBox ID="txtLocalidad" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtGiro" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtCP" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtTelest" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtCorreoest" runat="server"></asp:TextBox>



        </p>



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
    <script>
        var curp = document.getElementById("<%=txtCurp.ClientID%>").value;
        var nombre = document.getElementById("<%=txtNombre.ClientID%>").value;
        var apellidop = document.getElementById("<%=txtApellidop.ClientID%>").value;
        var apellidom = document.getElementById("<%=txtApellidom.ClientID%>").value;
        var telemov = document.getElementById("<%=txtTelmov.ClientID%>").value;
        var telefij = document.getElementById("<%=txtTelfij.ClientID%>").value;
        var correo = document.getElementById("<%=txtCorreo.ClientID%>").value;
        var rui = document.getElementById("<%=txtRui.ClientID%>").value;
        var rfc = document.getElementById("<%=txtRfc.ClientID%>").value;
        var nombreest = document.getElementById("<%=txtNombreest.ClientID%>").value;
        var municipio = document.getElementById("<%=txtMunicipio.ClientID%>").value;
        var colonia = document.getElementById("<%=txtColonia.ClientID%>").value;
        var calle = document.getElementById("<%=txtCalle.ClientID%>").value;
        var razonsocial = document.getElementById("<%=txtRazonsocial.ClientID%>").value;
        var observaciones = document.getElementById("<%=txtObservaciones.ClientID%>").value;
        var localidad = document.getElementById("<%=txtLocalidad.ClientID%>").value;
        var giro = document.getElementById("<%=txtGiro.ClientID%>").value;
        var cp = document.getElementById("<%=txtCP.ClientID%>").value;
        var telest = document.getElementById("<%=txtTelest.ClientID%>").value;
        var correoest = document.getElementById("<%=txtCorreoest.ClientID%>").value;



        document.getElementById("Curp").innerHTML = curp;
        document.getElementById("NombreCompleto").innerHTML = nombre + " " + apellidop + " " + apellidom;
        document.getElementById("Telefonos").innerHTML = "Móvil: " + telemov + "<br> Fijo: " + telefij;
        document.getElementById("Correo").innerHTML = correo;
        document.getElementById("Rui").innerHTML = rui;
        document.getElementById("Rfc").innerHTML = rfc;
        document.getElementById("Nombreest").innerHTML = nombreest;
        document.getElementById("Municipio").innerHTML = municipio;
        document.getElementById("Colonia").innerHTML = colonia;
        document.getElementById("Calle").innerHTML = calle;
        document.getElementById("Razonsocial").innerHTML = razonsocial;
        document.getElementById("Observaciones").innerHTML = observaciones;
        document.getElementById("Localidad").innerHTML = localidad;
        document.getElementById("Giro").innerHTML = giro;
        document.getElementById("CP").innerHTML = cp;
        document.getElementById("Telest").innerHTML = telest;
        document.getElementById("Correoest").innerHTML = correoest;
    </script>


    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>

    <script type="text/javascript">
        function printDiv(nombreDiv) {
            var contenido = document.getElementById(nombreDiv).innerHTML;
            var contenidoOriginal = document.body.innerHTML;

            document.body.innerHTML = contenido;

            window.print();

            document.body.innerHTML = contenidoOriginal;
        }
    </script>



</asp:Content>

