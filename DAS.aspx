<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="DAS.aspx.cs" Inherits="_default" %>

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
  
  <div class="modal fade" id="ModalPrevencion" tabindex="-1" role="dialog" aria-labelledby="ModalPrevencionlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus" >
                    <h5 class="modal-title" id="ModalPrevencionlabel">Prevención</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FilePrevencion" name="FilePrevencion[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upPrevencion" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs"><h3>Departamento de Autorizaciones y Licencias Sanitarias</h3>
            <div class="card-header card-header-sm bordered">
               
                <ul class="nav nav-tabs pull-left" role="tablist">
                    <li class="nav-item"><a class="nav-link active" href="#Requisitos" role="tab" data-toggle="tab">Requisitos</a> </li>
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
                   <table class="table table-bordered">

                            <tr>
                                <th style="padding: 5px; border-right: hidden; border-top: hidden; border-left: hidden; width:350px">REQUISITO</th>
                                <th style="padding: 5px; text-align: center; border-right: hidden; border-top: hidden; border-left: hidden">ENTREGADO</th>
                            </tr>
                            <tr runat="server" id="uno">
                                <td>
                                    <label>• Solicitud de Licencia Sanitaria</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkSolLicSan" runat="server" Enabled="false" />

                                </td>

                                <td><a runat="server" id="SolLicSan" data-fancybox="group" class="lightbox">

                                    <div style="display: inline; font-size: initial; width: 10%; padding-top: 8px; padding-left: 5px">Ver Información</div>
                                </a>
                                </td>
                              
                                <td style="border-right: hidden; border-top: hidden; border-bottom: hidden;"></td>

                            </tr>
                            <tr runat="server" id="dosa">
                                <td>
                                    <label>• Alta ante S.A.T.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkaltasat" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="Alta" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                </a>

                                </td>
                            </tr>
                            <tr runat="server" id="tres">
                                <td>
                                    <label>• Plano y Memoria Descriptiva</label>
                                </td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPlanoMemoria" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="PlanoMemoria" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                </a>
                                </td>
                            </tr>
                            <tr runat="server" id="cuatro">
                                <td>
                                    <label>• Relación de Material y Equipo Existente</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkRelacionMaterialEquipo" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="RelacionMaterialEquipo" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                </a>
                                </td>
                                
                            </tr>
                            <tr runat="server" id="cinco">
                                <td>
                                    <label>• Pago</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPago" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Pago" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>

                            </tr>
                            <tr runat="server" id="seis">
                                <td>
                                    <label>• Programa de Actividades</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprogramaact" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="ProgramaAct" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                
                            </tr>
                            <tr runat="server" id="siete">
                                <td>
                                    <label>• Convenio P.G.J.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkfotocopiaconvenio" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Fotocopiaconvenio" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                            </tr>
                            <tr runat="server" id="ocho">
                                <td>
                                    <label>• Libro de Registro de Cadáveres</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chklibroregistro" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="LibroRegistro" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                            </tr>
                            <tr runat="server" id="nueve">
                                <td>
                                    <label>• Descripción de Técnica de Embalsamamiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdescripciontecnicaembal" Enabled="false" runat="server" /></td>
                                <td>
                                    <a runat="server" id="DescripcionTecnica" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                            </tr>
                            <tr runat="server" id="diez">
                                <td>
                                    <label>• Tarjeta de Control</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chktarjetadecontrol" Enabled="false" runat="server" /></td>
                                <td>
                                    <a runat="server" id="Tarjetadecontrol" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                            </tr>
                            <tr runat="server" id="once">
                                <td>
                                    <label>• Carta Consentimiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcartaconsentimiento" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Cartaconsentimiento" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="doce">
                                <td>
                                    <label>• Acta Constitutiva</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkactaconstitutiva" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Actaconstitutiva" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="trece">
                                <td>
                                    <label>• Reglamento Interno</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkreglamentointerno" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Reglamentointerno" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="catorce">
                                <td>
                                    <label>• Visto Bueno Protección Civil</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkvistoproteccioncivil" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="Vistobueno" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td></tr>
                            <tr runat="server" id="quince">
                                <td>
                                    <label>• Relación del Personal que labora</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkrelacionpersonal" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Relacionpersonal" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="dieciseis">
                                <td>
                                    <label>• Autorización del Sistema D.I.F.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkautorizaciondif" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Autorizaciondif" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td>
                            </tr>
                            <tr runat="server" id="diecisiete">
                                <td>
                                    <label>• Cédula de Autoevaluación</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcedulaautoevaluacion" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Cedulaeval" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="dieciocho">
                                <td>
                                    <label>• Papel Membretado</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPapelMembretado" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="PapelMembretado" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>

                            </tr>
                            <tr runat="server" id="diecinueve">
                                <td>
                                    <label>• Autorización S.E.T.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkautorizacionset" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Autorizacionset" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veinte">
                                <td>
                                    <label>• Uso de Suelo</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkusodesuelo" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Usodesuelo" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veintiuno">
                                <td>
                                    <label>• Proceso de Limpieza</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprocesolimpieza" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Procesolimpieza" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veintidos">
                                <td>
                                    <label>• Relación de Tipo de Análisis</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkrelaciontipoanalisis" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Relaciontipo" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veintitres">
                                <td>
                                    <label>• Acta de Verificación</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkactaverificacion" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Actaverificacion" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                  
                                </td>
                            </tr>
                            <tr runat="server" id="veinticuatro">
                                <td>
                                    <label>• Solicitud</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chksolicitud" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Solicitud" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                    <%--<asp:FileUpload ID="FileSolicitud" runat="server" CssClass="fileUpload" Style="padding: 4px 4px" />--%>
                                </td>
                            </tr>
                            <tr runat="server" id="veinticinco">
                                <td>
                                    <label>• Títutlo</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chktitulo" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Titulo" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veintiseis">
                                <td>
                                    <label>• Cédula</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcedula" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Cedula" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veintisiete">
                                <td>
                                    <label>• Diploma</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdiploma" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Diploma" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                            </tr>
                            <tr runat="server" id="veintiocho">
                                <td>
                                    <label>• Curriculum</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkCurriculum" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Curriculum" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="veintinueve">
                                <td>
                                    <label>• 2 Fotografías</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkfotografias" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Fotografias" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="treinta">
                                <td>
                                    <label>• Pago del Responsable Sanitario</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkpagoresponsable" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Pagoresponsable" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="treintayuno">
                                <td>
                                    <label>• Aviso de funcionamiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkavisofunc" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Avisofunc" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="treintaydos">
                                <td>
                                    <label>• Documentación del técnico en Atención Médica Prehospitalaria</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdoctecatmedhosp" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Doctecatmedhosp" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                            </tr>
                            <tr runat="server" id="treintaytres" >
                                <td>
                                <label>• Programa Médico</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprogramamedico" runat="server" Enabled="false" /></td>
                                 <td>
                                    <a runat="server" id="Programamedico" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                            </tr>
                           <tr runat="server" id="treintaycuatro">
                               <td>
                                   <label>• Características Mecánicas de la Unidad</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkcaracteristicasmecanicas" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="CaracteristicasMecanicas" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a>

                               </td>
                           </tr>

                           <tr runat="server" id="treintaycinco">
                               <td>
                                   <label>• Fotografías de la Unidad</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkfotografiasdeunidad" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="FotografiasdeUnidad" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="treintayseis">
                               <td>
                                   <label>• Licencia Sanitaria Anterior</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chklicenciasanitariaanterior" runat="server" Enabled="false" /></td>
                                <td>
                                   <a runat="server" id="LicSanAnterior" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="treintaysiete">
                               <td>
                                   <label>• Autorización de Responsable Anterior</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkautorizacionresponsableanterior" runat="server" Enabled="false" /></td>
                                <td>
                                   <a runat="server" id="AutorizacionResponsableAnterior" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="treintayocho">
                               <td>
                                   <label>• Carta de Antecedentes no penales</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkantecedentesnopenales" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="AntecedentesNoPenales" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="treintaynueve">
                               <td>
                                   <label>• Póliza de seguro ante eventualidades</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkpolizaseguro" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="PolizaSeguro" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarenta">
                               <td>
                                   <label>• Programación de la alimentación de la semana y documentación profesional del nutriólogo</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkprogramaalimentacion" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="ProgramaAlimentacion" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentayuno">
                               <td>
                                   <label>• Título del médico responsable</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chktitulo_mr" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Titulo_MR" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentaydos">
                               <td>
                                   <label>• Cédula del médico responsable</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkcedula_mr" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Cedula_MR" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentaytres">
                               <td>
                                   <label>• Diploma del médico responsable</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkdiploma_mr" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Diploma_MR" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentaycuatro">
                               <td>
                                   <label>• Curriculum del médico responsable</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkcurriculum_mr" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Curriculum_MR" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentaycinco">
                               <td>
                                   <label>• Relación de personal paramédico</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkrelacionpersonal_paramedico" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="RelacionPersonalParamedico" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentayseis">
                               <td>
                                   <label>• Documentación para el trámite de laboratorio</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkdocumentacion_laboratorio" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Documentacion_Laboratorio" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentaysiete">
                               <td>
                                   <label>• Copia de la licencia sanitaria del laboratorio matriz</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkcopialicencia_matriz" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="CopiaLicencia_Matriz" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentayocho">
                               <td>
                                   <label>• Copia de la autorización de responsable del laboratorio matriz</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkcopiaautorizacion_matriz" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="CopiaAutorizacion_Matriz" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cuarentaynueve">
                               <td>
                                   <label>• Documentación profesional del técnico en el área</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkdocumentacion_tecnico" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Documentacion_Tecnico" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cincuenta">
                               <td>
                                   <label>• Documentación que acredite al responsable</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkdocumentacion_responsable" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="Documentacion_Responsable" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                           <tr runat="server" id="cincuentayuno">
                               <td>
                                   <label>• Forma de limpieza y esterilización</label></td>
                               <td style="text-align: center">
                                   <asp:CheckBox ID="chkformalimpieza" runat="server" Enabled="false" /></td>
                               <td>
                                   <a runat="server" id="FormaLimpieza" data-fancybox="group" class="lightbox">
                                       <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                   </a></td>
                           </tr>
                          <tr runat="server" id="dictamenjj">
                                <td><a>• </a>
                                    <label>Evaluación Documental.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkDictamenDocumental" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="DictamenDocumental" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <%--  <td style="text-align:center" runat="server" id="boton_dicdoc">
                                    <button runat="server" id="btn_DictamenDocumental" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDictamenDocumental">
                                        Seleccionar archivo.
                                    </button>
                                </td>--%>
                            </tr>
                           <tr runat="server" id="prv"  >
                                <td>
                                    <label>• Prevención</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPrevencion" runat="server" Enabled="false" />

                                </td>

                                <td>
                                <a runat="server" id="Prevencion" data-fancybox="group" class="lightbox">
                                    <div style="display: inline; font-size: initial; width: 10%; padding-top: 8px; padding-left: 5px">Ver Información</div>
                                </a>
                                    
                                </td>
                                <td style="text-align:center" runat="server" id="desaparecer">
                                    <!-- Button trigger modal -->
                                    <button runat="server" id="btn_Prevencion" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalPrevencion">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                                <td style="border-right: hidden; border-top: hidden; border-bottom: hidden;"></td>

                            </tr>

                       </table>
               

                    <br />

                    <div id="sdivacta" runat="server">
                        <h2 style="text-align: center">Acta de Verificación.</h2>
                        <div id="gridacta" class="grid-container">
                            <div class="grid-item">
                                <div class="input-group">
                                    <a>• </a>
                                    <label runat="server" id="lbl32">Acta de Verificación.</label>
                                </div>
                            </div>
                            <div class="grid-item" style="text-align: center">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <asp:CheckBox ClientIDMode="Static" ID="chkActa" runat="server" Enabled="false" />
                                    </div>
                                </div>
                            </div>
                            <div class="grid-item">
                                <a id="Acta1" data-fancybox="group" class="lightbox" runat="server">
                                    <div style="font-size: initial; width: 10%; padding-top: 8px; padding-left: 5px">Acta</div>
                                </a>
                            </div>
                        </div>
                    </div>


                    <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                    <h2 id="sdict" style="text-align: center" runat="server">Dictamen Técnico.</h2>
                    <div id="grid2" runat="server" class="grid-container">

                        <div class="grid-item">
                            <div class="input-group">


                                <a>• </a>
                                <label runat="server" id="lbl33">Dictamen Técnico.</label>
                            </div>
                        </div>
                        <div class="grid-item" style="text-align: center">
                            <div class="input-group-prepend">
                                <div class="input-group-text">

                                    <asp:CheckBox ID="chkDicTec" runat="server" Enabled="false" />
                                </div>
                            </div>

                        </div>
                        <div class="grid-item mDiv">
                            <div class="input-group-prepend mDiv">
                                <div class="input-group-text">
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                    Validar
                                </div>

                            </div>
                        </div>
                        <div class="grid-item mDiv">
                            <asp:TextBox ID="TextBox1" class="form-control mDiv"
                                runat="server"
                                placeholder="Observaciones"
                                autocomplete="off"> </asp:TextBox>
                        </div>
                        <div class="grid-item">
                            <a id="DictamenTecnico" data-fancybox="group" class="lightbox" runat="server">
                                <div style="font-size: initial; width: 10%; padding-top: 8px; padding-left: 5px">DictamenTécnico</div>
                            </a>


                        </div>


                    </div>

                    <div class="container" id="foliolic" runat="server">
            <br />
            <br />
            <div class="row">
                <div id="Foliolicencia" class="row col-sm-12">
                    <div class="col-sm-3">
                        Grado Académico:
                        <asp:TextBox ID="TextBox2" class="form-control css-input" runat="server" Style="text-transform: uppercase;"></asp:TextBox>
                    </div>

                    <div class="col-sm-3">
                        Folio de la Licencia:
            <asp:TextBox ID="txtFoliolicencia" class="form-control css-input" Autocomplete="Disabled" runat="server" Style="text-transform: uppercase;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtFoliolicencia"
                            ErrorMessage="Campo requerido."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                         
                    <div class="col-sm-2">
                        Clave:
                        <asp:TextBox ID="txtClave_dals" class="form-control css-input" runat="server" Style="text-transform: uppercase;"></asp:TextBox>
                    </div>
                    <%--<div class="col-sm-3">
                        Fecha de Expedicion:
                        <asp:TextBox  placeholder="mm/dd/yyyy" ID="txtFecha_Expedicion" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" Style="text-transform: uppercase;"></asp:TextBox>
                    </div>--%>

                </div>

                           

                            <div class=" col-sm-3">
                                 Fecha de Expedición:
                                <asp:TextBox ToolTip="Año/Mes/Día" Autocomplete="Disabled" class="form-control" ID="txtFecha_Expedicion" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtFecha_Expedicion"
                                    Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                            </div>

                           <%-- <asp:Calendar ID="Calendar1" runat="server"
                                OnSelectionChanged="Selection_Change">
                                <SelectedDayStyle BackColor="#b0e5fb"
                                    ForeColor="black"></SelectedDayStyle>
                            </asp:Calendar>--%>
                       





                
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
<div class="col-sm-3 offset-sm-4" style="padding-left: 40%; padding-top: 15px">
                    <asp:Button ID="btn"
                        OnClick="btnPrevision_Click"
                        runat="server" class="myButton"
                        Text="Imprimir"
                        disabled="true" />

                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                </div>

        <br />

    
        <div style="text-align: center">
            <asp:Button ID="btnPrevision"
                OnClick="btnPrevision_Click"
                runat="server" class="myButton"
                Text="Regresar a UEAS" />
            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
       

       
            <asp:Button ID="btnAprobado"
                OnClick="btnAprobado_Click"
                runat="server" class="myButtonAprobar"
                Text="Aprobar" />
            <asp:Literal ID="Literal2" runat="server"></asp:Literal>

      
            <asp:Button ID="btnRechazado"
                OnClick="btnRechazado_Click"
                runat="server" class="myButtonRechazar"
                Text="Rechazar"
                OnClientClick="return GetUserValue();" />
            <asp:Literal ID="Literal3" runat="server"></asp:Literal>
        </div>


       <%-- <div id="btnimpr" class="btn-group div1" runat="server">
            <asp:Button ID="btnImprimir"
                OnClick="btnPrevision_Click"
                runat="server" class="myButton"
                Text="Enviar a la DEAS" />
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>--%>





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

        <asp:TextBox ID="rechazo" runat="server" />
        <asp:TextBox ID="id_responsable" runat="server" />
    </p>

    <asp:Literal ID="LblMsg" runat="server"></asp:Literal>
    <asp:Literal ID="LblMensaje" runat="server"></asp:Literal>
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



        function curpValida(curp) {
            var re = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
                validado = curp.match(re);

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
            var curp = input.value.toUpperCase(),
                resultado = document.getElementById("resultado"),
                valido = "No válido";

            if (curpValida(curp)) {
                valido = "Válido";
                resultado.classList.add("ok");
            } else {
                resultado.classList.remove("ok");
            }

            resultado.innerText = "CURP: " + curp + "\nFormato: " + valido;
        }

    </script>
    <%--0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000--%>
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
            } else {
                valido2 = "No válido"
                resultado2.classList.remove("ok");
            }

            resultado2.innerText = "RFC: " + rfc2
                //+ "\nResultado: " + rfcCorrecto2
                + "\nFormato: " + valido2;
        }


    </script>
    <script type="text/javascript">

        var sol = document.getElementById("<%=sol.ClientID%>").value;
        var dicdoc = document.getElementById("<%=dicdoc.ClientID%>").value;
        var tit = document.getElementById("<%=tit.ClientID%>").value;
        var ced = document.getElementById("<%=ced.ClientID%>").value;
        var dip = document.getElementById("<%=dip.ClientID%>").value;
        var curr = document.getElementById("<%=curr.ClientID%>").value;
        var prog = document.getElementById("<%=prog.ClientID%>").value;
        var rel = document.getElementById("<%=rel.ClientID%>").value;
        var plano = document.getElementById("<%=plano.ClientID%>").value;
        var alt = document.getElementById("<%=alt.ClientID%>").value;
        var papel = document.getElementById("<%=papel.ClientID%>").value;
        var form = document.getElementById("<%=form.ClientID%>").value;
        var cop = document.getElementById("<%=cop.ClientID%>").value;
        var lic = document.getElementById("<%=lic.ClientID%>").value;

        var riesgo = document.getElementById("<%=riesgo.ClientID%>").value;
        var statos = document.getElementById("<%=statos.ClientID%>").value;


        if (sol == "1010") {
            $('#sdiv').addClass('z');
            $('#sdiv').removeClass('y');
        }
        else {

            $('#sdiv').addClass('y');
            $('#sdiv').removeClass('z');
        }


    </script>
    <script>

        var riesgo = document.getElementById("<%=riesgo.ClientID%>").value;
        var statos = document.getElementById("<%=statos.ClientID%>").value;
        if ((riesgo == '2' && (statos == '1003'))) {
            $('#1').addClass('z');
            $('#2').addClass('z');
            $('#3').addClass('z');
            $('#4').addClass('z');
            $('#5').addClass('z');


        }




    </script>
    <script>
        function GetUserValue() {
            var person = prompt("Porfavor Ingrese motivo de rechazo:", "Información Apócrifa");
            if (person != null && person != "") {
                document.getElementById("<%=rechazo.ClientID%>").value = person;
                return true;
            }
            else
                return false;
        }
    </script>
    <script>
        function check() {
            document.getElementById("chkDictamenDocumental").checked = true;
        }
    </script>
<script type="text/javascript">
    var map;
    var creator;
    //var polygonArray;
    var id_folio = <%=Request.Params["id"]%>;

    $(document).ready(function () {
        $(window).on('load', function () {
            var varIP = [];
            var varIPC = [];

            $("#FilePrevencion").fileinput({

                theme: "fas",
                browseClass: "btn btn-primary",
                browseLabel: "Buscar.",
                fileType: "any",
                language: "es",
                uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Prevencion", // server upload action
                uploadAsync: false,
                showClose: false,
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
            }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "das.aspx?id=" + id_folio + ""; });
        });
        $("#btn_upPrevencion").click(function () { $("#FilePrevencion").fileinput("upload"); });
    });

    </script>
     <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>

</asp:Content>

