<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default-old.aspx.cs" Inherits="sistema_Avisos_Captura" %>

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

        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }

        .FixedHeader {
            position: absolute;
        }

        .timepicker {
            width: 100px;
        }

        .lnkbtnVW {
            /*link button viewport, tamaño que depende de la pantalla*/
            font-size: 1.2vw;
        }

        label {
            display: inline-block;
            margin-bottom: .1rem;
        }

        .form-group {
            margin-bottom: .1rem;
        }

        input[type="radio"] + label {
            font-weight: normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
        </Triggers>
        <ContentTemplate>
            <asp:TextBox runat="server" ID="suma" Visible="false"></asp:TextBox>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>

    <div class="card-block card">
        <div id="carddivoffset" class="card sameheight-item text-center" data-exclude="xs">
            <h2>Captura de:</h2>
            <h4>Aviso de Funcionamiento, de Responsable Sanitario y de Modificación o Baja</h4>
        </div>
        <div class="card-block">
            <div>
                <button id="btn1" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                    1. Homoclave, nombre y modalidad del trámite
                </button>
                <div class="collapse show" id="collapse1" style="border: dashed; border-color: cadetblue">
                    <div class="card card-body">
                        <div class="row">


                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Homoclave:</label>
                                    <asp:TextBox runat="server" ID="txt1Homoclave" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-sm-8 offset-sm-1">
                                <div class="form-group">
                                    <label>Nombre:</label>
                                    <asp:TextBox runat="server" ID="txt1Nombre" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Modalidad:</label>
                                    <asp:TextBox runat="server" ID="txt1Modalidad" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-center">
                            <button class="boton-azo" onclick='return false;' id="seguir1">Siguiente</button>
                        </div>




                    </div>
                </div>
            </div>
            <div>
                <button id="btn2" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                    2. Datos del propietario
                </button>
                <div class="collapse" id="collapse2" style="border: dashed; border-color: cadetblue">
                    <div class="card card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="text-center">
                                    <label class="alert-dark" style="width: 100%">Persona física</label>
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="txt2RFCF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP (opcional):</label>
                                    <asp:TextBox runat="server" ID="txt2CURPF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="txt2NombreF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <asp:TextBox runat="server" ID="txt2ApellidopF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <asp:TextBox runat="server" ID="txt2ApellidomF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="txt2Lada" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="txt2TelF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="txt2ExtF" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="txt2CorreoF" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="text-center">
                                    <label style="width: 100%" class="alert-dark">Persona moral</label>
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="txt2RFCEmpresa" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Denominación o razón social:</label>
                                    <asp:TextBox runat="server" ID="txt2RazonM" class="form-control"></asp:TextBox>
                                </div>
                                <div style="text-align: center">
                                    <label style="width: 100%" class="alert-dark">Representante legal o apoderado que solicita el trámite</label>
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="txt2RFCM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP (opcional):</label>
                                    <asp:TextBox runat="server" ID="txt2CURPM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="txt2NombreM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <asp:TextBox runat="server" ID="txt2ApellidopM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <asp:TextBox runat="server" ID="txt2ApellidomM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="txt2LadaM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="txt2TelM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="txt2ExtM" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="txt2CorreoM" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div style="text-align: center">
                            <label class="alert-dark" style="width: 100%">Domicilio fiscal del propietario</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Código postal:</label>
                                    <asp:TextBox runat="server" ID="txt2CP_Prop" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Tipo y nombre de vialidad:</label>
                                    <asp:TextBox TextMode="MultiLine" placeholder="(Por ejemplo: Avenida, boulevard, calle, carretera, camino, privada, terracería entre otros)" runat="server" ID="txt2Vialidad_Prop" class="form-control"></asp:TextBox>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Número exterior:</label>
                                            <asp:TextBox runat="server" ID="txt2NumExt_Prop" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label>Número interior:</label>
                                            <asp:TextBox runat="server" ID="txt2NumInt_Prop" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Tipo y nombre de la colonia o asentamiento humano:</label>
                                    <asp:TextBox TextMode="MultiLine" Rows="3" placeholder="(Tipo de asentamiento humano por ejemplo: Condominio, hacienda, rancho, fraccionamiento entre otros.)" runat="server" ID="txt2Asentamiento_Prop" class="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="col-sm-6">

                                <div class="form-group">
                                    <label>Localidad:</label>
                                    <asp:TextBox runat="server" ID="txt2Localidad_Prop" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Municipio o alcaldía:</label>
                                    <asp:TextBox runat="server" ID="txt2Municipio_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Entidad Federativa:</label>
                                    <asp:TextBox runat="server" ID="txt2Entidad_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Entre vialidad (tipo y nombre):</label>
                                    <asp:TextBox runat="server" ID="txt2Entre1_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Y vialidad (tipo y nombre):</label>
                                    <asp:TextBox runat="server" ID="txt2Entre2_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Vialidad posterior (tipo y nombre):</label>
                                    <asp:TextBox runat="server" ID="txt2Posterior_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="txt2Lada_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="txt2Tel_Prop" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="txt2Ext_Prop" class="form-control"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button class="boton-azo" onclick='return false;' id="seguir2">Siguiente</button>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <button id="btn3" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                    3.  Datos del establecimiento
                </button>
                <div class="collapse" id="collapse3" style="border: dashed; border-color: cadetblue">

                    <div class="card card-body">
                        <div class="alert-dark form-group" style="text-align: center; font-weight: bold; font-size: 13px"><a style="text-align: center; margin: 5%">Indique la clave y descripción del giro que corresponda al establecimiento de acuerdo al Sistema de Clasificación  Industrial de América del Norte:</a></div>


                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="txt3RFC" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-8 offset-sm-1">
                                <div class="form-group">
                                    <label>Denominación o razón social:</label>
                                    <asp:TextBox runat="server" ID="txt3RazonM" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <%-- Claves Scian GRID--%>

                        <div class="form-group estil">

                            <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="limpiar_modal2()" Text="Click aquí para agregar Clave SCIAN. Agregar tantas claves SCIAN como sea necesario." CssClass="btn btn-success btn-block lnkbtnVW" data-toggle="modal" data-target="#Modal_Clavesscian" />
                            <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" RenderMode="Inline" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="GridClavesscian" HeaderStyle-CssClass="thead-inverse" runat="server" AutoGenerateColumns="False"
                                        CssClass="table table-bordered bs-table" OnRowCommand="gdvEliminar_Clavesscian">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="5%" HeaderText="No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_registro2" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Clave SCIAN">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_clave3" runat="server" Text='<%# Eval("Clave_Scian").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción del SCIAN">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_descripcion3" runat="server" Text='<%# Eval("Descripcion_Scian").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:LinkButton CssClass="btn btn-danger" CommandName="Eliminar" ID="lnkEliminar" runat="server" CommandArgument='<%#string.Format("{0}", Container.DataItemIndex) %>'><i class="fa fa-trash" ></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>


                        <label class="alert-dark text-center">Horario de operaciones</label>
                        <div class="form-group estil text-center">

                            <asp:Table ID="Table1" runat="server">
                                <asp:TableHeaderRow
                                    runat="server"
                                    Font-Bold="true">
                                </asp:TableHeaderRow>
                                <asp:TableRow ID="TableRow1" runat="server">
                                    <asp:TableCell>
                                        D<br />
                                        <asp:CheckBox runat="server" ID="chk3D1" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        L<br />
                                        <asp:CheckBox runat="server" ID="chk3L1" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="chk3M1" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="chk3Mi1" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        J<br />
                                        <asp:CheckBox runat="server" ID="chk3J1" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        V<br />
                                        <asp:CheckBox runat="server" ID="chk3V1" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        S<br />
                                        <asp:CheckBox runat="server" ID="chk3S1" />
                                    </asp:TableCell>
                                    <asp:TableCell>de</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="txt3Hora1inicio" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>a</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="txt3Hora1fin" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow2" runat="server">
                                    <asp:TableCell>
                                        D<br />
                                        <asp:CheckBox runat="server" ID="chk3D2" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        L<br />
                                        <asp:CheckBox runat="server" ID="chk3L2" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="chk3M2" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="chk3Mi2" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        J<br />
                                        <asp:CheckBox runat="server" ID="chk3J2" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        V<br />
                                        <asp:CheckBox runat="server" ID="chk3V2" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        S<br />
                                        <asp:CheckBox runat="server" ID="chk3S2" />
                                    </asp:TableCell>
                                    <asp:TableCell>de</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="txt3Hora2inicio" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>a</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="txt3Hora2fin" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>

                        </div>
                        <div class="form-group">
                            <label>Fecha de inicio de operaciones:</label>
                            <asp:TextBox runat="server" type="date" ID="txt3FechaInicio" class="form-control col-sm-3"></asp:TextBox>
                        </div>


                        <label class="alert-dark text-center">Domicilio del establecimiento</label>

                        <div class="row">
                            <div class="col">

                                <div class="form-group">
                                    <label>Código postal:</label>
                                    <asp:TextBox runat="server" ID="txt3CP" class="form-control col-sm-6"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Tipo y nombre de vialidad:</label>
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txt3Vialidad" class="form-control"></asp:TextBox>
                                </div>
                                <div class="row">
                                    <div class="col form-group">
                                        <label>Número exterior:</label>
                                        <asp:TextBox runat="server" ID="txt3NumInt" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col form-group">
                                        <label>Número interior:</label>
                                        <asp:TextBox runat="server" ID="txt3NumExt" class="form-control"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label>Tipo y nombre de la colonia o asentamiento humano:</label>
                                    <asp:TextBox TextMode="MultiLine" Rows="3" placeholder="(Tipo de asentamiento humano por ejemplo: Condominio, hacienda, rancho, fraccionamiento entre otros.)" runat="server" ID="txt3Asentamiento" class="form-control"></asp:TextBox>
                                </div>

                            </div>


                            <div class="col">

                                <div class="form-group">
                                    <label>Localidad:</label>
                                    <asp:TextBox runat="server" ID="txt3Localidad" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Municipio o alcaldía:</label>
                                    <asp:TextBox runat="server" ID="txt3Municipio" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Entidad Federativa:</label>
                                    <asp:TextBox runat="server" ID="txt3Entidad" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Entre vialidad (tipo y nombre):</label>
                                    <asp:TextBox runat="server" ID="txt3Entre1" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Y vialidad (tipo y nombre):</label>
                                    <asp:TextBox runat="server" ID="txt3Entre2" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Vialidad posterior (tipo y nombre):</label>
                                    <asp:TextBox runat="server" ID="txt3Posterior" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="txt3Lada" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="txtTel" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="txtExt" class="form-control"></asp:TextBox>
                                </div>


                            </div>
                        </div>

                        <label class="alert-dark text-center">Representante(s) legal(es) y persona(s) autorizada(s)</label>


                        <%-- 3Representantes GRID--%>
                        <div class="form-group estil">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="limpiar_modal3Representantes()" Text="Click aquí para agregar representante(s) legal(es) y/o persona(s) autorizada(s). Agregar tantos como sea necesario." CssClass="btn btn-success btn-block lnkbtnVW" data-toggle="modal" data-target="#Modal_3Representantes" />

                            <asp:UpdatePanel ID="UpdatePanel53Representantes" UpdateMode="Conditional" RenderMode="Inline" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="Grid3Representantes" HeaderStyle-CssClass="thead-inverse" runat="server" AutoGenerateColumns="False"
                                        CssClass="table table-bordered bs-table" OnRowCommand="gdvEliminar_3Representantes">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="5%" HeaderText="No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_registro2" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CURP">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_curp3Representantes" runat="server" Text='<%# Eval("curp3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nombre(s)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_nombre3Representantes" runat="server" Text='<%# Eval("nombre3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Primer Apellido">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_primerapellido3Representantes" runat="server" Text='<%# Eval("primerapellido3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Segundo Apellido">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_segundoapellido3Representantes" runat="server" Text='<%# Eval("segundoapellido3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lada">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_lada3Representantes" runat="server" Text='<%# Eval("lada3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Teléfono">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_tel3Representantes" runat="server" Text='<%# Eval("tel3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Extensión">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_ext3Representantes" runat="server" Text='<%# Eval("ext3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Correo electrónico">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_correo3Representantes" runat="server" Text='<%# Eval("correo3Representantes").ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:LinkButton CssClass="btn btn-danger" CommandName="Eliminar" ID="lnkEliminar" runat="server" CommandArgument='<%#string.Format("{0}", Container.DataItemIndex) %>'><i class="fa fa-trash" ></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <div class="form-group text-center">
                            <button class="boton-azo" onclick='return false;' id="seguir3">Siguiente</button>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <button id="btn4" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                    4. Datos de la ambulancia
                </button>
                <div class="collapse" id="collapse4" style="border: dashed; border-color: cadetblue">
                    <div class="card card-body">

                        <p style="color: #4F5F6F; font-size: 16px">
                            Seleccione el tipo de unidad móvil.<br />
                            En caso de alta o baja  de la ambulancia utilice la primera tabla.<br />
                            En caso de modificar los datos de la ambulancia utilice la primera tabla para anotar los datos  actuales y la segunda tabla para los datos ya modificados.<br />
                        </p>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="text-center">
                                    <label class="alert-dark" style="width: 100%">Primera Tabla</label>
                                </div>

                                <asp:Table ID="Table3" Width="100%" runat="server">

                                    <asp:TableRow ID="TableRow3" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Aérea" runat="server" ID="rb4Aerea1" GroupName="grupo1" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Marítima" runat="server" ID="rb4Maritima1" GroupName="grupo1" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Terrestre" runat="server" ID="rb4Terrestre1" GroupName="grupo1" />
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow6" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Alta" runat="server" ID="rb4Alta1" GroupName="grupo2" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Baja" runat="server" ID="rb4Baja1" GroupName="grupo2" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="A modificar" runat="server" ID="rb4Modificar1" GroupName="grupo2" />
                                        </asp:TableCell>

                                    </asp:TableRow>


                                    <asp:TableHeaderRow ID="TableRow4" Font-Size="12px" runat="server">
                                        <asp:TableHeaderCell>
                                        <asp:Label Text="Características" runat="server" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                        <asp:Label Text="Ambulancia de cuidados intensivos" runat="server" />
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                        <asp:Label Text="Ambulancia de urgencias" runat="server"/>
                                        </asp:TableHeaderCell>
                                        <asp:TableHeaderCell>
                                        <asp:Label Text="Ambulancia de traslados" runat="server"/>
                                        </asp:TableHeaderCell>

                                    </asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow8" runat="server">
                                        <asp:TableCell ID="TableHeaderCell5" runat="server">Marca</asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell9" runat="server">
                                            <asp:TextBox ID="txt4MarcaACI1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell10" runat="server">
                                            <asp:TextBox ID="txt4MarcaAU1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell11" runat="server">
                                            <asp:TextBox ID="txt4MarcaAT1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow9" runat="server">
                                        <asp:TableCell ID="TableHeaderCell6" runat="server">Modelo</asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell12" runat="server">
                                            <asp:TextBox ID="txt4ModeloACI1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell13" runat="server">
                                            <asp:TextBox ID="txt4ModeloAU1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell14" runat="server">
                                            <asp:TextBox ID="txt4ModeloAT1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow10" runat="server">
                                        <asp:TableCell ID="TableHeaderCell7" runat="server">Número de placas</asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell15" runat="server">
                                            <asp:TextBox ID="txt4PlacasACI1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell16" runat="server">
                                            <asp:TextBox ID="txt4PlacasAU1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell17" runat="server">
                                            <asp:TextBox ID="txt4PlacasAT1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow11" runat="server">
                                        <asp:TableCell ID="TableHeaderCell8" runat="server">Número de motor</asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell18" runat="server">
                                            <asp:TextBox ID="txt4MotorACI1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell19" runat="server">
                                            <asp:TextBox ID="txt4MotorAU1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableHeaderCell20" runat="server">
                                            <asp:TextBox ID="txt4MotorAT1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>

                                    </asp:TableRow>
                                </asp:Table>


                            </div>
                            <div class="col-sm-6">
                                <div class="text-center">
                                    <label class="alert-dark" style="width: 100%">Segunda Tabla</label>
                                </div>

                                <asp:Table ID="Table2" Width="100%" runat="server">
                                    <asp:TableHeaderRow
                                        runat="server"
                                        Font-Bold="true">
                                    </asp:TableHeaderRow>

                                    <asp:TableRow ID="TableRow7" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Aérea" runat="server" ID="rb4Aerea2" GroupName="grupo3" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Marítima" runat="server" ID="rb4Maritima2" GroupName="grupo3" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Terrestre" runat="server" ID="rb4Terrestre2" GroupName="grupo3" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow5" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Alta" runat="server" ID="rb4Alta2" GroupName="grupo4" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Baja" runat="server" ID="rb4Baja2" GroupName="grupo4" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="A modificar" runat="server" ID="rb4Modificar2" GroupName="grupo4" />
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow12" Font-Size="12px" Font-Bold="true" runat="server">
                                        <asp:TableCell>
                                        <asp:Label Text="Características" runat="server"/>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <asp:Label Text="Ambulancia de cuidados intensivos" runat="server" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <asp:Label Text="Ambulancia de urgencias" runat="server"/>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                        <asp:Label Text="Ambulancia de traslados" runat="server"/>
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow13" runat="server">
                                        <asp:TableCell ID="TableCell1" runat="server">Marca</asp:TableCell>
                                        <asp:TableCell ID="TableCell2" runat="server">
                                            <asp:TextBox ID="txt4MarcaACI2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell3" runat="server">
                                            <asp:TextBox ID="txt4MarcaAU2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell4" runat="server">
                                            <asp:TextBox ID="txt4MarcaAT2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow14" runat="server">
                                        <asp:TableCell ID="TableCell5" runat="server">Modelo</asp:TableCell>
                                        <asp:TableCell ID="TableCell6" runat="server">
                                            <asp:TextBox ID="txt4ModeloACI2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell7" runat="server">
                                            <asp:TextBox ID="txt4ModeloAU2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell8" runat="server">
                                            <asp:TextBox ID="txt4ModeloAT2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow15" runat="server">
                                        <asp:TableCell ID="TableCell9" runat="server">Número de placas</asp:TableCell>
                                        <asp:TableCell ID="TableCell10" runat="server">
                                            <asp:TextBox ID="txt4PlacasACI2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell11" runat="server">
                                            <asp:TextBox ID="txt4PlacasAU2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell12" runat="server">
                                            <asp:TextBox ID="txt4PlacasAT2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow16" runat="server">
                                        <asp:TableCell ID="TableCell13" runat="server">Número de motor</asp:TableCell>
                                        <asp:TableCell ID="TableCell14" runat="server">
                                            <asp:TextBox ID="txt4MotorACI2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell15" runat="server">
                                            <asp:TextBox ID="txt4MotorAU2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell ID="TableCell16" runat="server">
                                            <asp:TextBox ID="txt4MotorAT2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>

                                    </asp:TableRow>
                                </asp:Table>


                            </div>

                        </div>
                        <div class="form-group text-center">
                            <button class="boton-azo" onclick='return false;' id="seguir4">Siguiente</button>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <button id="btn5" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                    5. Datos del responsable sanitario (excepto para productos y servicios)
                </button>
                <div class="collapse" id="collapse5" style="border: dashed; border-color: cadetblue">
                    <div class="card card-body">
                        <p style="color: #4F5F6F; font-size: 16px">
                            En caso de alta o baja del responsable sanitario utilice la primera columna.<br />
                            En caso de modificar los datos del responsable sanitario utilice la primera columna para anotar  los datos  actuales y la segunda columna para los datos ya modificados<br />
                        </p>

                        <div class="row">
                            <div class="col-sm-6">
                                <label class="alert-dark" style="width: 100%; text-align: center">Primer columna</label>
                                <asp:Table ID="Table4" Width="100%" runat="server">
                                    <asp:TableHeaderRow
                                        runat="server"
                                        Font-Bold="true">
                                    </asp:TableHeaderRow>

                                    <asp:TableRow ID="TableRow17" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Alta" runat="server" ID="rb5Alta1" GroupName="grupo5" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Baja" runat="server" ID="rb5Baja1" GroupName="grupo5" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="A modificar" runat="server" ID="rb5Modificar1" GroupName="grupo5" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="txt5RFC" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP: (ocpional):</label>
                                    <asp:TextBox runat="server" ID="txt5CURP" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="txt5Nombre" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido::</label>
                                    <asp:TextBox runat="server" ID="TextBox1" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido::</label>
                                    <asp:TextBox runat="server" ID="TextBox2" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="TextBox3" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="TextBox4" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="TextBox5" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="TextBox6" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Con título profesional de:</label>
                                    <asp:TextBox runat="server" ID="TextBox7" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Título profesional expedido por:</label>
                                    <asp:TextBox runat="server" ID="TextBox8" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Número de cédula profesional:</label>
                                    <asp:TextBox runat="server" ID="TextBox9" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Con especialidad de:</label>
                                    <asp:TextBox runat="server" ID="TextBox10" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Título de especialidad expedido por:</label>
                                    <asp:TextBox runat="server" ID="TextBox11" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Número de cédula de la especialidad:</label>
                                    <asp:TextBox runat="server" ID="TextBox12" class="form-control"></asp:TextBox>
                                </div>
                                <label class="alert-dark" style="width: 100%; text-align: center">Horario de operaciones</label>

                                <asp:Table ID="Table5" CssClass="text-center estil form-group" Width="100%" runat="server">
                                    <asp:TableHeaderRow
                                        runat="server"
                                        Font-Bold="true">
                                    </asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow18" runat="server">
                                        <asp:TableCell>
                                            D<br />
                                            <asp:CheckBox runat="server" ID="CheckBox1" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            L<br />
                                            <asp:CheckBox runat="server" ID="CheckBox2" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox3" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox4" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            J<br />
                                            <asp:CheckBox runat="server" ID="CheckBox5" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            V<br />
                                            <asp:CheckBox runat="server" ID="CheckBox6" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            S<br />
                                            <asp:CheckBox runat="server" ID="CheckBox7" />
                                        </asp:TableCell>
                                        <asp:TableCell>de</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox13" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                        <asp:TableCell>a</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox14" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow19" runat="server">
                                        <asp:TableCell>
                                            D<br />
                                            <asp:CheckBox runat="server" ID="CheckBox8" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            L<br />
                                            <asp:CheckBox runat="server" ID="CheckBox9" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox10" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox11" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            J<br />
                                            <asp:CheckBox runat="server" ID="CheckBox12" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            V<br />
                                            <asp:CheckBox runat="server" ID="CheckBox13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            S<br />
                                            <asp:CheckBox runat="server" ID="CheckBox14" />
                                        </asp:TableCell>
                                        <asp:TableCell>de</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox15" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                        <asp:TableCell>a</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox16" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>

                            </div>
                            <div class="col-sm-6">
                                <label class="alert-dark" style="width: 100%; text-align: center">Segunda columna</label>
                                <asp:Table ID="Table6" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server" Font-Bold="true"></asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow20" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Ya modificado" runat="server" ID="RadioButton1" GroupName="grupo6" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox17" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP: (ocpional):</label>
                                    <asp:TextBox runat="server" ID="TextBox18" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="TextBox19" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido::</label>
                                    <asp:TextBox runat="server" ID="TextBox20" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido::</label>
                                    <asp:TextBox runat="server" ID="TextBox21" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="TextBox22" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="TextBox23" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="TextBox24" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="TextBox25" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Con título profesional de:</label>
                                    <asp:TextBox runat="server" ID="TextBox26" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Título profesional expedido por:</label>
                                    <asp:TextBox runat="server" ID="TextBox27" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Número de cédula profesional:</label>
                                    <asp:TextBox runat="server" ID="TextBox28" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Con especialidad de:</label>
                                    <asp:TextBox runat="server" ID="TextBox29" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Título de especialidad expedido por:</label>
                                    <asp:TextBox runat="server" ID="TextBox30" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Número de cédula de la especialidad:</label>
                                    <asp:TextBox runat="server" ID="TextBox31" class="form-control"></asp:TextBox>
                                </div>
                                <label class="alert-dark" style="width: 100%; text-align: center">Horario de operaciones</label>

                                <asp:Table ID="Table7" CssClass="text-center estil form-group" Width="100%" runat="server">
                                    <asp:TableHeaderRow
                                        runat="server"
                                        Font-Bold="true">
                                    </asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow21" runat="server">
                                        <asp:TableCell>
                                            D<br />
                                            <asp:CheckBox runat="server" ID="CheckBox15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            L<br />
                                            <asp:CheckBox runat="server" ID="CheckBox16" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox17" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox18" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            J<br />
                                            <asp:CheckBox runat="server" ID="CheckBox19" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            V<br />
                                            <asp:CheckBox runat="server" ID="CheckBox20" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            S<br />
                                            <asp:CheckBox runat="server" ID="CheckBox21" />
                                        </asp:TableCell>
                                        <asp:TableCell>de</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox32" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                        <asp:TableCell>a</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox33" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow22" runat="server">
                                        <asp:TableCell>
                                            D<br />
                                            <asp:CheckBox runat="server" ID="CheckBox22" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            L<br />
                                            <asp:CheckBox runat="server" ID="CheckBox23" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox24" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            M<br />
                                            <asp:CheckBox runat="server" ID="CheckBox25" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            J<br />
                                            <asp:CheckBox runat="server" ID="CheckBox26" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            V<br />
                                            <asp:CheckBox runat="server" ID="CheckBox27" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            S<br />
                                            <asp:CheckBox runat="server" ID="CheckBox28" />
                                        </asp:TableCell>
                                        <asp:TableCell>de</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox34" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                        <asp:TableCell>a</asp:TableCell>
                                        <asp:TableCell CssClass="text-center">
                                            <asp:TextBox runat="server" ID="TextBox35" type="time" class="form-control-sm" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button class="boton-azo" onclick='return false;' id="seguir5">Siguiente</button>
                        </div>
                    </div>
                </div>

            </div>
            <div>
                <button id="btn6" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                    6. Datos del producto o servicio nuevo o a modificar
                </button>
                <div class="collapse" id="collapse6" style="border: dashed; border-color: cadetblue">
                    <div class="card card-body">
                        <p style="color: #4F5F6F; font-size: 16px">
                            En caso de alta o baja de productos utilice ambas columnas (un producto por columna).<br />
                            En caso de modificar los datos de productos la primera columna para anotar los datos actuales y la segunda columna para los datos ya modificados.<br />
                        </p>
                        <div class="row">

                            <div class="col">
                                <label class="alert-dark" style="width: 100%; text-align: center">Producto o Servicio</label>
                                <label>1) Solo llenar este apartado en caso de producto: </label>

                                <asp:Table ID="Table8" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow23" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Nuevo" runat="server" ID="RadioButton2" GroupName="grupo6" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="A modificar" runat="server" ID="RadioButton3" GroupName="grupo6" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Baja" runat="server" ID="RadioButton4" GroupName="grupo6" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>

                                <label>2) Anote la categoría del producto o servicio conforme a la tabla “B”: </label>
                                <div class="form-group">
                                    Categoría:
                                    <asp:TextBox runat="server" ID="TextBox36" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    Grupo:
                                    <asp:TextBox runat="server" ID="TextBox37" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    Subgrupo:
                                    <asp:TextBox runat="server" ID="TextBox38" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>3) Denominación genérica y específica del producto o servicio:</label>
                                    <asp:TextBox runat="server" ID="TextBox43" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>4) Marca comercial del producto:</label>
                                    <asp:TextBox runat="server" ID="TextBox44" class="form-control"></asp:TextBox>
                                </div>
                                <label>5) Si maquila este producto, seleccione y escriba los datos de la empresa a la cual maquila:</label>
                                <div class="form-group text-center">
                                    <asp:RadioButton Width="100%" BackColor="#D6D8D9" Text="Persona física" runat="server" ID="RadioButton8" GroupName="grupo8" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox57" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP (opcional):</label>
                                    <asp:TextBox runat="server" ID="TextBox58" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="TextBox59" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox60" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox61" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="TextBox62" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="TextBox63" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="TextBox64" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="TextBox65" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-center">
                                    <asp:RadioButton Text="Persona moral" Width="100%" BackColor="#D6D8D9" runat="server" ID="RadioButton10" GroupName="grupo8" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox66" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Denominación o razón social:</label>
                                    <asp:TextBox runat="server" ID="TextBox67" class="form-control"></asp:TextBox>
                                </div>
                                <label>6) Si este producto es maquilado, seleccione y escriba los datos de la empresa maquiladora:</label>
                                <div class="form-group text-center">
                                    <asp:RadioButton Text="Persona física" Width="100%" BackColor="#D6D8D9" runat="server" ID="RadioButton12" GroupName="grupo10" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox68" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP (opcional):</label>
                                    <asp:TextBox runat="server" ID="TextBox69" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="TextBox70" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox71" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox72" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="TextBox73" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="TextBox74" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="TextBox75" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="TextBox76" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-center">
                                    <asp:RadioButton Text="Persona moral" Width="100%" BackColor="#D6D8D9" runat="server" ID="RadioButton13" GroupName="grupo10" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox77" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Denominación o razón social:</label>
                                    <asp:TextBox runat="server" ID="TextBox78" class="form-control"></asp:TextBox>
                                </div>
                                <label>7) Indique si el producto es nacional o importado:</label>
                                <asp:Table ID="Table10" CssClass="text-center" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow25" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Nacional" runat="server" ID="RadioButton16" GroupName="grupo11" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Importado" runat="server" ID="RadioButton17" GroupName="grupo11" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <label>8) Proceso: (marque cada uno de los procesos que se relacionen con su producto conforme a la tabla “A”)</label>
                                <asp:Table ID="Table11" CssClass="text-center" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow26" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="1" runat="server" ID="RadioButton14" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="2" runat="server" ID="RadioButton15" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="3" runat="server" ID="RadioButton22" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="4" runat="server" ID="RadioButton23" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="5" runat="server" ID="RadioButton24" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="6" runat="server" ID="RadioButton18" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="7" runat="server" ID="RadioButton19" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="8" runat="server" ID="RadioButton25" GroupName="grupo13" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow28" runat="server">

                                        <asp:TableCell>
                                            <asp:RadioButton Text="9" runat="server" ID="RadioButton26" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="10" runat="server" ID="RadioButton27" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="11" runat="server" ID="RadioButton20" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="12" runat="server" ID="RadioButton21" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="13" runat="server" ID="RadioButton28" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="14" runat="server" ID="RadioButton29" GroupName="grupo13" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="15" runat="server" ID="RadioButton30" GroupName="grupo13" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="col">
                                <label class="alert-dark" style="width: 100%; text-align: center">Producto o Servicio</label>
                                <label>1) Solo llenar este apartado en caso de producto: </label>
                                <asp:Table ID="Table9" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>

                                    <asp:TableRow ID="TableRow24" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Font-Bold="false" CssClass="nobold" Text="Nuevo" runat="server" ID="RadioButton5" GroupName="grupo7" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton CssClass="nobold" Text="Ya modificado" runat="server" ID="RadioButton6" GroupName="grupo7" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton CssClass="nobold" Text="Baja" runat="server" ID="RadioButton7" GroupName="grupo7" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <label>2) Anote la categoría del producto o servicio conforme a la tabla “B”: </label>
                                <div class="form-group">
                                    Categoría:
                                    <asp:TextBox runat="server" ID="TextBox39" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    Grupo:
                                    <asp:TextBox runat="server" ID="TextBox40" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    Subgrupo:
                                    <asp:TextBox runat="server" ID="TextBox41" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>3) Denominación genérica y específica del producto o servicio:</label>
                                    <asp:TextBox runat="server" ID="TextBox42" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>4) Marca comercial del producto:</label>
                                    <asp:TextBox runat="server" ID="TextBox45" class="form-control"></asp:TextBox>
                                </div>
                                <label>5) Si maquila este producto, seleccione y escriba los datos de la empresa a la cual maquila:</label>
                                <div class="form-group text-center">
                                    <asp:RadioButton Width="100%" BackColor="#D6D8D9" Text="Persona física" runat="server" ID="RadioButton11" GroupName="grupo9" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox46" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP (opcional):</label>
                                    <asp:TextBox runat="server" ID="TextBox47" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="TextBox48" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox49" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox50" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="TextBox51" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="TextBox52" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="TextBox53" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="TextBox54" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-center">
                                    <asp:RadioButton Text="Persona moral" Width="100%" BackColor="#D6D8D9" runat="server" ID="RadioButton9" GroupName="grupo9" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox55" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Denominación o razón social:</label>
                                    <asp:TextBox runat="server" ID="TextBox56" class="form-control"></asp:TextBox>
                                </div>
                                <label>6) Si este producto es maquilado, seleccione y escriba los datos de la empresa maquiladora:</label>
                                <div class="form-group text-center">
                                    <asp:RadioButton Text="Persona física" Width="100%" BackColor="#D6D8D9" runat="server" ID="RadioButton31" GroupName="grupo12" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox79" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>CURP (opcional):</label>
                                    <asp:TextBox runat="server" ID="TextBox80" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nombre(s):</label>
                                    <asp:TextBox runat="server" ID="TextBox81" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Primer apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox82" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Segundo apellido:</label>
                                    <asp:TextBox runat="server" ID="TextBox83" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Lada:</label>
                                    <asp:TextBox runat="server" ID="TextBox84" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Teléfono:</label>
                                    <asp:TextBox runat="server" ID="TextBox85" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Extensión:</label>
                                    <asp:TextBox runat="server" ID="TextBox86" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico:</label>
                                    <asp:TextBox runat="server" ID="TextBox87" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group text-center">
                                    <asp:RadioButton Text="Persona moral" Width="100%" BackColor="#D6D8D9" runat="server" ID="RadioButton32" GroupName="grupo12" />
                                </div>
                                <div class="form-group">
                                    <label>RFC:</label>
                                    <asp:TextBox runat="server" ID="TextBox88" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Denominación o razón social:</label>
                                    <asp:TextBox runat="server" ID="TextBox89" class="form-control"></asp:TextBox>
                                </div>
                                <label>7) Indique si el producto es nacional o importado:</label>
                                <asp:Table ID="Table12" CssClass="text-center" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow27" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Nacional" runat="server" ID="RadioButton33" GroupName="grupo14" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="Importado" runat="server" ID="RadioButton34" GroupName="grupo14" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <label>8) Proceso: (marque cada uno de los procesos que se relacionen con su producto conforme a la tabla “A”)</label>
                                <asp:Table ID="Table13" CssClass="text-center" Width="100%" runat="server">
                                    <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>
                                    <asp:TableRow ID="TableRow29" runat="server">
                                        <asp:TableCell>
                                            <asp:RadioButton Text="1" runat="server" ID="RadioButton35" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="2" runat="server" ID="RadioButton36" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="3" runat="server" ID="RadioButton37" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="4" runat="server" ID="RadioButton38" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="5" runat="server" ID="RadioButton39" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="6" runat="server" ID="RadioButton40" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="7" runat="server" ID="RadioButton41" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="8" runat="server" ID="RadioButton42" GroupName="grupo15" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow30" runat="server">

                                        <asp:TableCell>
                                            <asp:RadioButton Text="9" runat="server" ID="RadioButton43" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="10" runat="server" ID="RadioButton44" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="11" runat="server" ID="RadioButton45" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="12" runat="server" ID="RadioButton46" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="13" runat="server" ID="RadioButton47" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="14" runat="server" ID="RadioButton48" GroupName="grupo15" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButton Text="15" runat="server" ID="RadioButton49" GroupName="grupo15" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>

                        <label class="alert-dark" style="width: 100%; text-align: center">Tabla “A” Proceso</label>
                        <asp:Table ID="Table14" Width="100%" runat="server">
                            <asp:TableHeaderRow runat="server"></asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow31" runat="server">
                                <asp:TableCell>
                                            <asp:Label Text="1. Obtención" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="5. Conservación" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="9. Manipulación" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="13. Almacenamiento a temperatura ambiente" runat="server"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow32" runat="server">
                                <asp:TableCell>
                                            <asp:Label Text="2. Elaboración" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="6. Mezclado" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="10. Transporte a temperatura ambiente" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="14. Almacenamiento a temperatura de refrigeración y/o congelación " runat="server"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow33" runat="server">
                                <asp:TableCell>
                                            <asp:Label Text="3. Fabricación" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="7. Acondicionamiento" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="11. Transporte a temperatura de refrigeración" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="15. Expendio o suministro al público" runat="server"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow34" runat="server">
                                <asp:TableCell>
                                            <asp:Label Text="4. Preparación" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="8. Envasado" runat="server"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                            <asp:Label Text="12. Distribución " runat="server"></asp:Label>
                                </asp:TableCell>

                            </asp:TableRow>
                        </asp:Table>
                        <div class="form-group text-center">
                            <button class="boton-azo" onclick='return false;' id="seguir6">Siguiente</button>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <button id="btn7" style="width: 100%; text-align: left" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
                    7. Modificación o actualización de datos para establecimientos
                </button>
                <div class="collapse" id="collapse7" style="border: dashed; border-color: cadetblue">
                    <div class="card card-body">
                        <p style="color: #4F5F6F; font-size: 16px">
                            Seleccione la(s) modificación(es) o actualización(es) que desee realizar.<br />
                            En la tabla “Dice” colocar los datos completos actuales.<br />
                            En la tabla “Debe decir” colocar los datos completos ya modificados.
                        </p>
                        <asp:Table ID="Table15" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow35" runat="server">

                                <asp:TableCell CssClass="text-center" RowSpan="13">
                                         
                                               <asp:CheckBox Text="&nbsp Datos del Propietario" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona física</asp:Label>
                                </asp:TableCell>
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona física</asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow36" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow37" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow38" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow39" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow40" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow41" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow42" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow43" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow44" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow45" runat="server">
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona moral</asp:Label>
                                </asp:TableCell>
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona moral</asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow46" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow47" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Denominación o razón social" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Denominación o razón social" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <br />
                        <asp:Table ID="Table16" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow48" runat="server">

                                <asp:TableCell CssClass="text-center" RowSpan="13">
                                         
                                               <asp:CheckBox Text="&nbsp Domicilio del propietario (domicilio fiscal)" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Código postal" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell>
                                           <div class="form-group">
                                          <asp:TextBox PlaceHolder="Código postal" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow50" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de vialidad (Por ejemplo: Avenida, boulevard, calle, carretera, camino, privada, terracería entre otros)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                       <div class="form-group">
                                            <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de vialidad (Por ejemplo: Avenida, boulevard, calle, carretera, camino, privada, terracería entre otros)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow49" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group row">
                                            <div class="col"><asp:TextBox PlaceHolder="Número exterior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                            <div class="col"><asp:TextBox PlaceHolder="Número interior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                         
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell>
                                           <div class="form-group row">
                                          <div class="col"><asp:TextBox PlaceHolder="Número exterior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                            <div class="col"><asp:TextBox PlaceHolder="Número interior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                           </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow51" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de la colonia o asentamiento humano (Tipo de asentamiento humano por ejemplo: Condominio, hacienda, rancho, fraccionamiento entre otros.)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                       <div class="form-group">
                                            <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de la colonia o asentamiento humano (Tipo de asentamiento humano por ejemplo: Condominio, hacienda, rancho, fraccionamiento entre otros.)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow52" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Localidad" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Localidad" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow53" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Municipio o alcaldía" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Municipio o alcaldía" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow54" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entidad Federativa" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entidad Federativa" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow55" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entre vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entre vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow56" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Y vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Y vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow57" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Vialidad posterior (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Vialidad posterior (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow58" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow59" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow60" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                        </asp:Table>
                        <br />
                        <asp:Table ID="Table17" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow61" runat="server">

                                <asp:TableCell CssClass="text-center" RowSpan="14">
                                         
                                               <asp:CheckBox Text="&nbsp Datos del establecimiento" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona física</asp:Label>
                                </asp:TableCell>
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona física</asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow62" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow63" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow64" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow65" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow66" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow67" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Denominación o razón social (de ser el caso)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Denominación o razón social (de ser el caso)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow74" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow68" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow69" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow70" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow71" runat="server">
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona moral</asp:Label>
                                </asp:TableCell>
                                <asp:TableCell BackColor="#D6D8D9" CssClass="text-center">
                                           <asp:Label  runat="server">Persona moral</asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow72" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="RFC" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow73" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Denominación o razón social" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Denominación o razón social" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <br />
                        <asp:Table ID="Table18" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow75" runat="server">

                                <asp:TableCell CssClass="text-center" RowSpan="13">
                                         
                                               <asp:CheckBox Text="&nbsp Domicilio del establecimiento" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Código postal" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell>
                                           <div class="form-group">
                                          <asp:TextBox PlaceHolder="Código postal" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow76" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de vialidad (Por ejemplo: Avenida, boulevard, calle, carretera, camino, privada, terracería entre otros)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                       <div class="form-group">
                                            <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de vialidad (Por ejemplo: Avenida, boulevard, calle, carretera, camino, privada, terracería entre otros)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow77" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group row">
                                            <div class="col"><asp:TextBox PlaceHolder="Número exterior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                            <div class="col"><asp:TextBox PlaceHolder="Número interior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                         
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell>
                                           <div class="form-group row">
                                          <div class="col"><asp:TextBox PlaceHolder="Número exterior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                            <div class="col"><asp:TextBox PlaceHolder="Número interior" runat="server" CssClass="form-control" ></asp:TextBox></div>
                                           </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow78" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de la colonia o asentamiento humano (Tipo de asentamiento humano por ejemplo: Condominio, hacienda, rancho, fraccionamiento entre otros.)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                       <div class="form-group">
                                            <asp:TextBox TextMode="MultiLine" Rows="2" PlaceHolder="Tipo y nombre de la colonia o asentamiento humano (Tipo de asentamiento humano por ejemplo: Condominio, hacienda, rancho, fraccionamiento entre otros.)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow79" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Localidad" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Localidad" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow80" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Municipio o alcaldía" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Municipio o alcaldía" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow81" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entidad Federativa" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entidad Federativa" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow82" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entre vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Entre vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow83" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Y vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Y vialidad (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow84" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Vialidad posterior (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Vialidad posterior (tipo y nombre)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow85" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow86" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow87" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                        </asp:Table>
                        <br />
                        <div class="form-group estil text-center">
                            <asp:Table ID="Table19" BorderColor="#666666" Width="100%" runat="server">
                                <asp:TableHeaderRow
                                    runat="server"
                                    Font-Bold="true">
                                </asp:TableHeaderRow>
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell ColumnSpan="11" Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell ColumnSpan="11" Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                    </asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow ID="TableRow88" runat="server">
                                    <asp:TableCell CssClass="text-center" RowSpan="13">
                                         
                                               <asp:CheckBox Text="&nbsp Horario del establecimiento" runat="server" />
                                             
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        D<br />
                                        <asp:CheckBox runat="server" ID="CheckBox29" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        L<br />
                                        <asp:CheckBox runat="server" ID="CheckBox30" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox31" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox32" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        J<br />
                                        <asp:CheckBox runat="server" ID="CheckBox33" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        V<br />
                                        <asp:CheckBox runat="server" ID="CheckBox34" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        S<br />
                                        <asp:CheckBox runat="server" ID="CheckBox35" />
                                    </asp:TableCell>
                                    <asp:TableCell>de</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox90" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>a</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox91" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        D<br />
                                        <asp:CheckBox runat="server" ID="CheckBox43" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        L<br />
                                        <asp:CheckBox runat="server" ID="CheckBox44" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox45" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox46" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        J<br />
                                        <asp:CheckBox runat="server" ID="CheckBox47" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        V<br />
                                        <asp:CheckBox runat="server" ID="CheckBox48" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        S<br />
                                        <asp:CheckBox runat="server" ID="CheckBox49" />
                                    </asp:TableCell>
                                    <asp:TableCell>de</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox94" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>a</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox95" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow89" runat="server">
                                    <asp:TableCell>
                                        D<br />
                                        <asp:CheckBox runat="server" ID="CheckBox36" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        L<br />
                                        <asp:CheckBox runat="server" ID="CheckBox37" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox38" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox39" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        J<br />
                                        <asp:CheckBox runat="server" ID="CheckBox40" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        V<br />
                                        <asp:CheckBox runat="server" ID="CheckBox41" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        S<br />
                                        <asp:CheckBox runat="server" ID="CheckBox42" />
                                    </asp:TableCell>
                                    <asp:TableCell>de</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox92" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>a</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox93" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        D<br />
                                        <asp:CheckBox runat="server" ID="CheckBox50" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        L<br />
                                        <asp:CheckBox runat="server" ID="CheckBox51" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox52" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        M<br />
                                        <asp:CheckBox runat="server" ID="CheckBox53" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        J<br />
                                        <asp:CheckBox runat="server" ID="CheckBox54" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        V<br />
                                        <asp:CheckBox runat="server" ID="CheckBox55" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        S<br />
                                        <asp:CheckBox runat="server" ID="CheckBox56" />
                                    </asp:TableCell>
                                    <asp:TableCell>de</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox96" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                    <asp:TableCell>a</asp:TableCell>
                                    <asp:TableCell CssClass="text-center">
                                        <asp:TextBox runat="server" ID="TextBox97" type="time" class="form-control-sm" />
                                    </asp:TableCell>
                                </asp:TableRow>






                            </asp:Table>
                        </div>
                        <br />
                        <asp:Table ID="Table23" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow107" runat="server">
                                <asp:TableCell CssClass="text-center" RowSpan="8">
                                         
                                               <asp:CheckBox Text="&nbsp Clave SCIAN y su descripción" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                      
                                       <asp:TextBox TextMode="MultiLine" runat="server" type="date" CssClass="form-control"></asp:TextBox> 
                                          
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                       
                                          <asp:TextBox TextMode="MultiLine" runat="server" type="date" CssClass="form-control"></asp:TextBox> 
                                            
                                </asp:TableCell>
                            </asp:TableRow>

                        </asp:Table>
                        <br />
                        <asp:Table ID="Table20" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow92" runat="server">
                                <asp:TableCell CssClass="text-center" RowSpan="8">
                                         
                                               <asp:CheckBox Text="&nbsp Representante legal" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow93" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow94" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow95" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow96" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow97" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow98" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow99" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <br />
                        <asp:Table ID="Table21" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                     <asp:TableCell>Tipo de modificación</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Dice</asp:TableCell>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="40%" CssClass="text-center">
                                     <asp:TableCell>Debe decir</asp:TableCell>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow90" runat="server">
                                <asp:TableCell CssClass="text-center" RowSpan="8">
                                         
                                               <asp:CheckBox Text="&nbsp Representante autorizada" runat="server" />
                                             
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="CURP(opcional)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="TableRow91" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Nombre(s)" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow100" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Primer apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow101" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Segundo apellido" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow102" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Lada" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow103" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Teléfono" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow104" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Extensión" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow105" runat="server">
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                        <div class="form-group">
                                          <asp:TextBox PlaceHolder="Correo electrónico" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <br />
                        <asp:Table ID="Table22" BorderColor="#666666" Width="100%" runat="server">
                            <asp:TableHeaderRow
                                runat="server"
                                Font-Bold="true">
                            </asp:TableHeaderRow>
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell CssClass="text-center">
                                    <asp:RadioButton Text="&nbsp Suspensión de actividades" runat="server" GroupName="grupofinal"/>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="text-center">
                                        <asp:RadioButton Text="&nbsp Reinicio  de actividades" runat="server" GroupName="grupofinal" />
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Width="20%" CssClass="text-center">
                                    <asp:RadioButton Text="&nbsp Baja definitiva del establecimiento" runat="server" GroupName="grupofinal" />
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow ID="TableRow106" runat="server">
                                <asp:TableCell CssClass="text-center">
                                          
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                 <label>De</label>
                                    <asp:TextBox runat="server" type="date" CssClass="form-control"></asp:TextBox> 
                                            </div>
                                            </div>
                                    
                                         <div class="col">
                                             <div class="form-group">
                                                 <label>A</label>
                                    <asp:TextBox runat="server" type="date" CssClass="form-control"></asp:TextBox>
                                                 </div>
                                        </div>
                                        </div>
                                </asp:TableCell>
                                <asp:TableCell CssClass="text-center">
                                     <div class="form-group">
                                                 <label>Fecha</label>
                                         <asp:TextBox runat="server" type="date" CssClass="form-control"></asp:TextBox>
                                             </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <div class="form-group text-center">
                            <button class="boton-azo"  id="Finalizar">Finalizar</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <%-- MODAL --%>




    <div id="Modal_Clavesscian" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Agregar clave scian</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label><small>Clave SCIAN:</small></label>
                                <asp:TextBox ID="txt3Clave" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxt3Clave" ValidationGroup="Add2" Display="None" ControlToValidate="txt3Clave" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="reqtxt3Clave" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label><small>Descripción del SCIAN:</small></label>
                                <asp:TextBox ID="txt3Descripcion" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxt3Descripcion" ValidationGroup="Add2" ControlToValidate="txt3Descripcion" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" TargetControlID="reqtxt3Descripcion" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_modal_regresar2" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-chevron-left"></i>Regresar</button>
                    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" RenderMode="Inline" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_modal_agregar2" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:LinkButton ID="btn_modal_agregar2" CssClass="btn btn-primary" ValidationGroup="Add2" OnClick="btn_modal_agregar2_Click" runat="server"><i class="fa fa-save"></i> Agregar</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <div id="Modal_3Representantes" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Agregar Representante(s) legal(es) y persona(s) autorizada(s)</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label><small>CURP:</small></label>
                                <asp:TextBox ID="txtCURP3Representantes" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtCURP3Representantes" ValidationGroup="Add3" Display="None" ControlToValidate="txtCURP3Representantes" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" TargetControlID="reqtxtCURP3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label><small>Nombre(s):</small></label>
                                <asp:TextBox ID="txtNombre3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtNombre3Representantes" ValidationGroup="Add3" ControlToValidate="txtNombre3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" TargetControlID="reqtxtNombre3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <label><small>Primer apellido:</small></label>
                                <asp:TextBox ID="txtApellidop3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtApellidop3Representantes" ValidationGroup="Add3" ControlToValidate="txtApellidop3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" TargetControlID="reqtxtApellidop3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <label><small>Primer apellido:</small></label>
                                <asp:TextBox ID="txtApellidom3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtApellidom3Representantes" ValidationGroup="Add3" ControlToValidate="txtApellidom3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" TargetControlID="reqtxtApellidom3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label><small>Lada:</small></label>
                                <asp:TextBox ID="txtLada3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtLada3Representantes" ValidationGroup="Add3" ControlToValidate="txtLada3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" TargetControlID="reqtxtLada3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label><small>Teléfono:</small></label>
                                <asp:TextBox ID="txtTel3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtTel3Representantes" ValidationGroup="Add3" ControlToValidate="txtTel3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" TargetControlID="reqtxtTel3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                        <div class="col-sm-2">
                            <div class="form-group">
                                <label><small>Extensión:</small></label>
                                <asp:TextBox ID="txtExt3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtExt3Representantes" ValidationGroup="Add3" ControlToValidate="txtExt3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" TargetControlID="reqtxtExt3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>
                        <div class="col-sm-5">
                            <div class="form-group">
                                <label><small>Correo electrónico:</small></label>
                                <asp:TextBox ID="txtCorreo3Representantes" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="reqtxtCorreo3Representantes" ValidationGroup="Add3" ControlToValidate="txtCorreo3Representantes" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" TargetControlID="reqtxtCorreo3Representantes" runat="server">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                    </div>


                </div>

                <div class="modal-footer">
                    <button type="button" id="btn_modal_regresar3Representantes" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-chevron-left"></i>Regresar</button>
                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" RenderMode="Inline" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_modal_agregar3Representantes" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:LinkButton ID="btn_modal_agregar3Representantes" CssClass="btn btn-primary" ValidationGroup="Add3" OnClick="btn_modal_agregar3Representantes_Click" runat="server"><i class="fa fa-save"></i> Agregar</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>
    </div>


    <%--FIN DE MODALES--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <%-- <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>--%>


    <script>
        var top = ($(".apps_intro_wrapper_inner").offset() || { "top": NaN }).top + 800;
        $(".boton-azo").on('click', function () {

            var input = $(this).attr('id');


            switch (input) {
                case 'seguir1':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').addClass('show');
                    $('#collapse3').collapse('hide');
                    $('#collapse4').collapse('hide');
                    $('#collapse5').collapse('hide');
                    $('#collapse6').collapse('hide');
                    $('#collapse7').collapse('hide');
                    $('#btn2').focus();
                    // code block
                    break;
                case 'seguir2':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').collapse('hide');
                    $('#collapse3').addClass('show');
                    $('#collapse4').collapse('hide');
                    $('#collapse5').collapse('hide');
                    $('#collapse6').collapse('hide');
                    $('#collapse7').collapse('hide');
                    $('#btn3').focus();
                    break;

                case 'seguir3':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').collapse('hide');
                    $('#collapse3').collapse('hide');
                    $('#collapse4').addClass('show');
                    $('#collapse5').collapse('hide');
                    $('#collapse6').collapse('hide');
                    $('#collapse7').collapse('hide');
                    $('#btn4').focus();
                    break;
                case 'seguir4':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').collapse('hide');
                    $('#collapse3').collapse('hide');
                    $('#collapse4').collapse('hide');
                    $('#collapse5').addClass('show');
                    $('#collapse6').collapse('hide');
                    $('#collapse7').collapse('hide');
                    $('#btn5').focus();
                    break;
                case 'seguir5':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').collapse('hide');
                    $('#collapse3').collapse('hide');
                    $('#collapse4').collapse('hide');
                    $('#collapse5').collapse('hide');
                    $('#collapse6').addClass('show');
                    $('#collapse7').collapse('hide');
                    $('#btn6').focus();
                    break;
                case 'seguir6':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').collapse('hide');
                    $('#collapse3').collapse('hide');
                    $('#collapse4').collapse('hide');
                    $('#collapse5').collapse('hide');
                    $('#collapse6').collapse('hide');
                    $('#collapse7').addClass('show');
                    $('#btn7').focus();
                    break;
                case 'Finalizar':
                    $('#collapse1').collapse('hide');
                    $('#collapse2').collapse('hide');
                    $('#collapse3').collapse('hide');
                    $('#collapse4').collapse('hide');
                    $('#collapse5').collapse('hide');
                    $('#collapse6').collapse('hide');
                    $('#collapse7').collapse('hide');
                    alert('Tramite Finalizado');
                    break;

                default:
                // code block
            }



            //var g = $('#collapse3').attr('class');
            //alert(g);
            //$(this).addClass('current');
        });

    </script>
    <script>
        function limpiar_modal2() {
            $("#<%=txt3Clave.ClientID%>").val("");
            $("#<%=txt3Descripcion.ClientID%>").val("");

        };
        function limpiar_modal3Representantes() {
            $("#<%=txtCURP3Representantes.ClientID%>").val("");
            $("#<%=txtNombre3Representantes.ClientID%>").val("");
            $("#<%=txtApellidop3Representantes.ClientID%>").val("");
            $("#<%=txtApellidom3Representantes.ClientID%>").val("");
            $("#<%=txtLada3Representantes.ClientID%>").val("");
            $("#<%=txtTel3Representantes.ClientID%>").val("");
            $("#<%=txtExt3Representantes.ClientID%>").val("");
            $("#<%=txtCorreo3Representantes.ClientID%>").val("");

        };
    </script>
    <script>
        $(document).keydown(function (event) {
            if (event.keyCode == 27) {
                $('#Modal_Clavesscian').modal('hide');
                $('#Modal_3Representantes').modal('hide');
            }
        });
    </script>




</asp:Content>

