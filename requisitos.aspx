<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="requisitos.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
            text-align: left;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Relación Requisitos/Trámite</h3>
                </div>
            </div>


            <div class="select container-fluid">


                <div class="row">
                    <div class="col-sm-4" style="padding-top: 5px; width: 40%">
                        <asp:DropDownList ID="ddlCategorias" AutoPostBack="true"
                            runat="server"
                            DataTextField="nombre_modalidad"
                            DataValueField="id_modalidad"
                            OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                    </div>

                    <div class="col-sm-4" style="padding-top: 10px">

                        <asp:TextBox ID="txtRiesgo" class="form-control css-input"
                            runat="server"
                            disabled="true"
                            Style="text-transform: uppercase; text-align: center"></asp:TextBox>
                    </div>

                </div>

                <asp:DropDownList ID="ddlTramites" runat="server"
                    DataTextField="nombre_tramite"
                    DataValueField="id_tramite"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlTramites_SelectedIndexChanged"
                    Width="100%">
                </asp:DropDownList>

            </div>
            <div runat="server" id="lic">
                <label>LICENCIA SANITARIA</label>
                <table style="width: 50%">
                    <tr>
                        <th>Requisito</th>
                        <th style="text-align: center">Activo</th>
                    </tr>
                     <tr>
                        <td>AVISO DE FUNCIONAMIENTO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkavisofunc" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>SOLICITUD DE LICENCIA SANITARIA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chksollicsan" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>ALTA ANTE S.H.C.P.</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkaltasat" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PLANO Y MEMORIA DESCRIPTIVA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkplanomemoria" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>RELACION DE MATERIAL Y EQUIPO EXISTENTE</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkrelacionmaterial" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PAGO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkpago" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PROGRAMA DE ACTIVIDADES</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkprogramaact" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>FOTOCOPIA CONVENIO PGJ</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkfotocopiaconvenio" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>LIBRO DE REGISTRO DE CADÁVERES</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chklibroregistro" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>DESCRIPCION DE TECNICA DE EMBALSAMAMIENTO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkdescripciontecnicaembal" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>TARJETA DE CONTROL</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chktarjetadecontrol" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>CARTA CONSENTIMIENTO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkcartaconsentimiento" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>ACTA CONSTITUTIVA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkactaconstitutiva" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>REGLAMENTO INTERNO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkreglamentointerno" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>VISTO BUENO PROTECCIÓN CIVIL</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkvistoproteccioncivil" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>RELACION DEL PERSONAL QUE LABORA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkrelacionpersonal" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>AUTORIZACIÓN DEL SISTEMA DIF</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkautorizaciondif" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>CÉDULA DE AUTOEVALUACIÓN</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkcedulaautoevaluacion" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PAPEL MEMBRETADO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkpapelmembretado" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>AUTORIZACIÓN SET</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkautorizacionset" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>USO DE SUELO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkusodesuelo" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PROCESO DE LIMPIEZA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkprocesolimpieza" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>RELACIÓN DE TIPO DE ANÁLISIS</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkrelaciontipoanalisis" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>ACTA DE VERIFICACIÓN</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkactaverificacion" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>DOCUMENTACION DEL TECNICO EN ATENCION MÉDICA PREHOSPITALARIA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkdoctecatmedhosp" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PROGRAMA MÉDICO</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkprogramamedico" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>CARACTERÍSTICAS MECÁNICAS DE LA UNIDAD</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkcaracteristicasmecanicas" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>FOTOGRAFÍAS DE LA UNIDAD</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkfotografiasdeunidad" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>LICENCIA SANITARIA ANTERIOR</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chklicenciasanitariaanterior" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                      <tr>
                        <td>CARTA DE ANTECEDENTES NO PENALES</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkantecedentesnopenales" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>POLIZA DE SEGURO ANTE EVENTUALIDADES</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkpolizaseguro" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PROGRAMACIÓN DE LA ALIMENTACIÓN DE LA SEMANA Y DOCUMENTACIÓN PROFESIONAL DEL NUTRIÓLOGO</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkprogramaalimentacion" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                </table>
            </div>
            <div runat="server" id="aut">
                <label>AUTORIZACIÓN DE RESPONSABLE</label>
                <table style="width: 50%">
                    <tr>
                        <th>Requisito</th>
                        <th style="text-align: center">Activo</th>
                    </tr>
                    <tr>
                        <td>SOLICITUD</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chksolicitud" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>TÍTULO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chktitulo" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>CÉDULA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkcedula" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>DIPLOMA</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkdiploma" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>CURRICULUM</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkcurriculum" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>2 FOTOGRAFÍAS</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkfotografias" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                    <tr>
                        <td>PAGO DEL RESPONSABLE SANITARIO</></td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkpagoresponsable" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                   <tr>
                        <td>AUTORIZACIÓN DE RESPONSABLE ANTERIOR</td>
                        <td style="text-align: center">
                            <asp:CheckBox ID="chkautorizacionresponsableanterior" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" /></td>
                    </tr>
                  

                </table>
            </div>
        </div>
        <div style="text-align: center">

            <asp:Button class="myButton" ID="btntexto" runat="server" OnClick="btntexto_Click" Text="Modificar" />


            <asp:Literal ID="Lblmsg" runat="server"></asp:Literal>
        </div>
    </div>


    <p style="visibility: hidden">
        <asp:TextBox placeholder="sollicsan" ID="sollicsan" runat="server" />
        <asp:TextBox placeholder="solicitud" ID="solicitud" runat="server" />
        <asp:TextBox placeholder="titulo" ID="titulo" runat="server" />
        <asp:TextBox placeholder="cedula" ID="cedula" runat="server" />
        <asp:TextBox placeholder="diploma" ID="diploma" runat="server" />
        <asp:TextBox placeholder="curriculum" ID="curriculum" runat="server" />
        <asp:TextBox placeholder="fotografias" ID="fotografias" runat="server" />
        <asp:TextBox placeholder="pagoresponsable" ID="pagoresponsable" runat="server" />
        <asp:TextBox placeholder="altasat" ID="altasat" runat="server" />
        <asp:TextBox placeholder="planomemoria" ID="planomemoria" runat="server" />
        <asp:TextBox placeholder="relacionmaterial" ID="relacionmaterial" runat="server" />
        <asp:TextBox placeholder="pago" ID="pago" runat="server" />
        <asp:TextBox placeholder="programaact" ID="programaact" runat="server" />
        <asp:TextBox placeholder="fotocopiaconvenio" ID="fotocopiaconvenio" runat="server" />
        <asp:TextBox placeholder="libroregistro" ID="libroregistro" runat="server" />
        <asp:TextBox placeholder="descripciontecnicaembal" ID="descripciontecnicaembal" runat="server" />
        <asp:TextBox placeholder="tarjetadecontrol" ID="tarjetadecontrol" runat="server" />
        <asp:TextBox placeholder="cartaconsentimiento" ID="cartaconsentimiento" runat="server" />
        <asp:TextBox placeholder="actaconstitutiva" ID="actaconstitutiva" runat="server" />
        <asp:TextBox placeholder="reglamentointerno" ID="reglamentointerno" runat="server" />
        <asp:TextBox placeholder="vistoproteccioncivil" ID="vistoproteccioncivil" runat="server" />
        <asp:TextBox placeholder="relacionpersonal" ID="relacionpersonal" runat="server" />
        <asp:TextBox placeholder="autorizaciondif" ID="autorizaciondif" runat="server" />
        <asp:TextBox placeholder="cedulaautoevaluacion" ID="cedulaautoevaluacion" runat="server" />
        <asp:TextBox placeholder="papelmembretado" ID="papelmembretado" runat="server" />
        <asp:TextBox placeholder="autorizacionset" ID="autorizacionset" runat="server" />
        <asp:TextBox placeholder="usodesuelo" ID="usodesuelo" runat="server" />
        <asp:TextBox placeholder="procesolimpieza" ID="procesolimpieza" runat="server" />
        <asp:TextBox placeholder="relaciontipoanalisis" ID="relaciontipoanalisis" runat="server" />
        <asp:TextBox placeholder="actaverificacion" ID="actaverificacion" runat="server" />

        <asp:TextBox placeholder="" ID="avisofunc" runat="server" />
        <asp:TextBox placeholder="" ID="doctecatmedhosp" runat="server" />
        <asp:TextBox placeholder="" ID="programamedico" runat="server" />
        <asp:TextBox placeholder="" ID="caracteristicasmecanicas" runat="server" />
        <asp:TextBox placeholder="" ID="fotografiasdeunidad" runat="server" />
        <asp:TextBox placeholder="" ID="licenciasanitariaanterior" runat="server" />
        <asp:TextBox placeholder="" ID="autorizacionresponsableanterior" runat="server" />
        <asp:TextBox placeholder="" ID="antecedentesnopenales" runat="server" />
        <asp:TextBox placeholder="" ID="polizaseguro" runat="server" />
        <asp:TextBox placeholder="" ID="programaalimentacion" runat="server" />


        <asp:Label ID="riesgo" runat="server"></asp:Label>
        <asp:Label ID="verificacion" runat="server"></asp:Label>
        <asp:Label ID="modalidad" runat="server"></asp:Label>
        <asp:Label ID="id_tramite" runat="server"></asp:Label>
        <asp:Label ID="categoriareal" runat="server"></asp:Label>
        <asp:HiddenField ID="categoria" runat="server" />

    </p>
    <label id="lblmsg"></label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>

