<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="dals_rel.aspx.cs" Inherits="_default" %>

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

        .timepicker {
            width: 100px;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
   
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">




    <div class="card-block card col-sm-12">

        <asp:GridView
            ID="grdNombreTramite"
            AutoGenerateColumns="false"
            runat="server" GridLines="None"
            CssClass="table table-bordered" Width=""
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


                <asp:BoundField HeaderText="Folio" DataField="folioseguimiento" />
                <asp:BoundField HeaderText="Tipo de Trámite" DataField="nombre_tramite" />
                <%--<asp:BoundField HeaderText="Estado Actual" DataField="Estatus"  />--%>
                <asp:BoundField HeaderText="Fecha de Registro" DataField="fecha_reg" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField HeaderText="Modalidad" DataField="modalidad" ItemStyle-Wrap="false" ItemStyle-CssClass="b" ItemStyle-BackColor="#8aff7d" ItemStyle-ForeColor="White" />



            </Columns>

        </asp:GridView>

        <div class="row">
            <div class="col-sm-6">
                <h3 style="text-align: center">Datos del Propietario:</h3>

                <div class="row">
                    <div class="col-sm-6">
                        <b>CURP</b>:<br />
                        <p runat="server" id="Curp"></p>
                    </div>
                    <div class="col-sm-6">
                        <b>RFC</b>:<br />
                        <p runat="server" id="RFC_prop"></p>
                    </div>
                </div>
                <b>Nombre del Propietario:</b>
                <p runat="server" id="NombreCompleto"></p>

                <b>Teléfonos de contacto:</b>
                <p runat="server" id="TelefonoFij"></p>
                <p runat="server" id="TelefonoMov"></p>


                <b>Correo Electronico:</b>
                <p runat="server" id="Correo"></p>
                 
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
                <tr runat="server" id="treintaytres">
                    <td>
                        <label>• Programa Médico</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkprogramamedico" runat="server" Enabled="false" /></td>

                </tr>

                <tr runat="server" id="treintaycuatro">
                    <td>
                        <label>• Características Mecánicas de la Unidad</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkcaracteristicasmecanicas" runat="server" Enabled="false" /></td>

                </tr>

                <tr runat="server" id="treintaycinco">
                    <td>
                        <label>• Fotografías de la Unidad</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkfotografiasdeunidad" runat="server" Enabled="false" />
                    </td>
                </tr>
                <tr runat="server" id="treintayseis">
                    <td>
                        <label>• Licencia Sanitaria Anterior</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chklicenciasanitariaanterior" runat="server" Enabled="false" /></td>

                </tr>
                <tr runat="server" id="treintaysiete">
                    <td>
                        <label>• Autorización de Responsable Anterior</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkautorizacionresponsableanterior" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="treintayocho">
                    <td>
                        <label>• Carta de Antecedentes no penales</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkantecedentesnopenales" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="treintaynueve">
                    <td>
                        <label>• Póliza de seguro ante eventualidades</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkpolizaseguro" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarenta">
                    <td>
                        <label>• Programación de la alimentación de la semana y documentación profesional del nutriólogo</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkprogramaalimentacion" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentayuno">
                    <td>
                        <label>• Título del médico responsable</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chktitulo_mr" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentaydos">
                    <td>
                        <label>• Cédula del médico responsable</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkcedula_mr" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentaytres">
                    <td>
                        <label>• Diploma del médico responsable</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkdiploma_mr" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentaycuatro">
                    <td>
                        <label>• Curriculum del médico responsable</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkcurriculum_mr" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentaycinco">
                    <td>
                        <label>• Relación de personal paramédico</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkrelacionpersonal_paramedico" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentayseis">
                    <td>
                        <label>• Documentación para el trámite de laboratorio</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkdocumentacion_laboratorio" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentaysiete">
                    <td>
                        <label>• Copia de la licencia sanitaria del laboratorio matriz</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkcopialicencia_matriz" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentayocho">
                    <td>
                        <label>• Copia de la autorización de responsable del laboratorio matriz</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkcopiaautorizacion_matriz" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cuarentaynueve">
                    <td>
                        <label>• Documentación profesional del técnico en el área</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkdocumentacion_tecnico" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cincuenta">
                    <td>
                        <label>• Documentación que acredite al responsable</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkdocumentacion_responsable" runat="server" Enabled="false" /></td>
                </tr>
                <tr runat="server" id="cincuentayuno">
                    <td>
                        <label>• Forma de limpieza y esterilización</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkformalimpieza" runat="server" Enabled="false" /></td>
                </tr>


            </table>

        
            </div>
            <div class="col-sm-6">

                <h3 style="text-align: center">Datos del Establecimiento:</h3>

                    <b>RFC:</b>
                    <p runat="server" id="Rfc"></p>
                    <b>Nombre del Establecimiento:</b>
                    <p runat="server" id="Nombreest"></p>


                    <b>Denominación de Giro</b>
                    <br />
                    <p runat="server" id="giro"></p>


                 
                    <h4 style="text-align: center">Domicilio del Establecimiento:</h4>

                    <div class="row">
                        <div class="col-sm-6">
                            <b>Municipio:</b>
                            <br />
                            <p runat="server" id="Municipio"></p>


                        </div>

                        <div class="col-sm-6">
                            <b>Localidad:</b>
                            <br />
                            <p runat="server" id="Localidad"></p>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <b>Colonia:</b><br />
                            <p runat="server" id="Colonia"></p>

                        </div>


                        <div class="col-sm-6">
                            <b>Código Postal</b><br />
                            <p runat="server" id="CP"></p>

                        </div>
                    </div>
                        <b>Calle y Número:</b><br />
                        <p runat="server" id="Calle"></p>

                      <b>Referencias:</b><br />
                        <p runat="server" id="referencias"></p>
             

                    <h5 style="text-align: center">Información de Contacto:</h5>
                  

                    <div class="row">
                        <div class="col-sm-8">
                            <b>Número telefónico del Establecimiento:</b><br />
                            <p runat="server" id="Telest"></p>

                        </div>
                        <br />
                        <br />
                        <div class="col-sm-8">
                            <b>Correo Electrónico del Establecimiento:</b><br />
                            <p runat="server" id="Correoest"></p>

                        </div>



                    </div>
                    <br />

                     <h3 style="text-align: center">Datos del Responsable Sanitario:</h3>

                    <b>RFC:</b>
                    <p runat="server" id="RFC_resp"></p>
                    <b>Nombre del Responsable:</b>
                    <p runat="server" id="Nombre_resp"></p>
                      <div class="row">
                        <div class="col-sm-6">
                            <b>Grado:</b><br />
                            <p runat="server" id="grado"></p>

                        </div>


                        <div class="col-sm-6">
                            <b>Cédula:</b><br />
                            <p runat="server" id="cedula"></p>

                        </div>
                    </div>


                    <%--  <p style="text-align:justify" >Se me ha hecho saber que el tramite iniciado ante la COEPRIS se considera 
                                      INCOMPLETO,  toda vez que la documentación que he presentado no es suficiente 
                                      y/o no reúne los requisitos necesarios. Con base en el artículo 58 de la Ley de Procedimiento 
                                      Administrativo del Estado de Tamaulipas, se ingresa con las reservas pertinentes, en el entendido 
                                      de que es altamente probable que se me solicite de manera oficial la documentación o requisitos 
                                      faltantes para realizar el análisis correspondiente, lo que provocaría demora en la tramitación 
                                      de mi solicitud.
                                      </p>--%>
              
            </div>
        </div>
       




    </div>
 

    <p style="visibility: hidden">


        <asp:TextBox ID="folio" runat="server"></asp:TextBox>
        <asp:TextBox ID="riesgo" runat="server"></asp:TextBox>
        <asp:TextBox ID="verificacion" runat="server"></asp:TextBox>
        <asp:TextBox ID="modalidad" runat="server"></asp:TextBox>
        <asp:TextBox ID="id_tramite" runat="server"></asp:TextBox>
        <asp:TextBox ID="statos" runat="server"></asp:TextBox>



    </p>

    <asp:Literal ID="LblMsg" runat="server"></asp:Literal>
    <asp:Literal ID="LblMensaje" runat="server"></asp:Literal>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">


    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>

  



</asp:Content>

