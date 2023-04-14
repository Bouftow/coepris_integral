<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="persona-item.aspx.cs" Inherits="admin_persona_item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
   <%-- <link href="../../css/bootstrap-datetimepicker.css" rel="stylesheet" />--%>
    <link href="../css/bootstrap-datetimepicker.css" rel="stylesheet" />

   <%-- <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />--%>
    <style type="text/css">

        .kv-avatar .file-preview-frame, .kv-avatar .file-preview-frame:hover {
            margin: 0;
            padding: 0;
            border: none;
            box-shadow: none;
            text-align: center;
        }

        .kv-avatar .file-input {
            display: table-cell;
            max-width: 220px;

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

        .button_gray {
            display: inline-block;
            padding: 10px 12px;
            font-size: 15px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #000;
            background-color: #CFD2D5;
            border: none;
            border-radius: 10px;
            box-shadow: 0 6px #999;
        }

        .button_gray:hover {
            background-color: #B5B8BA;
        }

        .button_gray:active {
            background-color: #B5B8BA;
            box-shadow: 0 3px #666;
            transform: translateY(4px);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-male"></i>&nbsp;<%=string.Format("{0}",Request.Params["id"]=="0"?"REGISTRAR NUEVA PERSONA":"EDITAR PERSONA") %></h3>
            <hr />
            <a href="persona-lista.aspx#ancla_<%=Request.Params["id"] %>" class="button_gray" style="color:#000"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <asp:LinkButton ID="btnGrabar" OnClick="btnGrabar_Click"  CssClass="button" Style="color:#fff" runat="server"><i class="fa fa-save"></i>&nbsp;Grabar</asp:LinkButton>
        </div>
    </div>

    <asp:Literal ID="lblMessage" runat="server"></asp:Literal>

    <br />

    <div class="card card-block">
        <div class="row">
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>CURP:</label>
                            <asp:TextBox ID="txtCURP" ValidationGroup="GrabarItem" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rtxtCURP" ValidationGroup="GrabarItem" ControlToValidate="txtCURP" runat="server" ErrorMessage="Requerido" Display="None"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="ertxtCURP" TargetControlID="rtxtCURP"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>INE:</label>
                            <asp:TextBox ID="txtINE" ValidationGroup="GrabarItem" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rtxtINE" ValidationGroup="GrabarItem" ControlToValidate="txtINE" runat="server" ErrorMessage="Requerido" Display="None"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="ertxtINE" TargetControlID="rtxtINE"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>RFC:</label>
                            <asp:TextBox ID="txtRFC" ValidationGroup="GrabarItem" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rtxtRFC" ValidationGroup="GrabarItem" ControlToValidate="txtRFC" runat="server" ErrorMessage="Requerido" Display="None"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="ertxtRFC" TargetControlID="rtxtRFC"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label>Grado:</label>
                            <asp:TextBox ID="txtGrado" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Nombre:</label>
                            <asp:TextBox ID="txtNombre" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Paterno:</label>
                            <asp:TextBox ID="txtPaterno" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Materno:</label>
                            <asp:TextBox ID="txtMaterno" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <label for="txtFechaNac">Fecha nac:</label>
                        <div class='input-group date' id='dpFechaNac'>
                            <asp:TextBox ID="txtFechaNac" ValidationGroup="GrabarItem" CssClass="form-control boxed" runat="server"></asp:TextBox>
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </div>
                        <asp:RequiredFieldValidator ID="rtxtFechaNac" ValidationGroup="GrabarItem" ControlToValidate="txtFechaNac" Display="None" runat="server" ErrorMessage="Requerido"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="ertxtFechaNac" TargetControlID="rtxtFechaNac" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Lugar Nac:</label>
                            <asp:TextBox ID="txtLugarNac" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label>Estado Nac:</label>
                            <asp:TextBox ID="txtEstadoNac" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Calle:</label>
                            <asp:TextBox ID="txtCalle" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Num Ext:</label>
                            <asp:TextBox ID="txtNumExt" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Num Int:</label>
                            <asp:TextBox ID="txtNumInt" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-9">
                        <div class="form-group">
                            <label>Colonia:</label>
                            <asp:TextBox ID="txtColonia" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Código Postal:</label>
                            <asp:TextBox ID="txtCP" CssClass="form-control boxed" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="kv-avatar center-block" style="width: 200px">
                    <input id="avatar-1" name="avatar-1" type="file" class="file-loading" />
                </div>
                <br />
                <div class="alert alert-info">
                    <strong>Información</strong><br /> Tamaño de fotografía recomendado:<br /> 200 x 200 pixeles
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label>Estado:</label>
                    <asp:DropDownList ID="cboIdEstado" AutoPostBack="true" OnSelectedIndexChanged="cboIdEstado_SelectedIndexChanged" CssClass="form-control boxed" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label>Municipio:</label>
                    <asp:DropDownList ID="cboIdMun" CssClass="form-control boxed" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label>Localidad:</label>
                    <asp:TextBox ID="txtLocalidad" CssClass="form-control boxed" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-4">
                <label >Teléfono:</label>
                <div class="input-group">
                    <asp:TextBox ID="txtTelefono" CssClass="form-control boxed" runat="server"></asp:TextBox>
                    <span class="input-group-addon">
                        <i class="fa fa-phone"></i>
                    </span>
                </div>
            </div>
            <div class="col-sm-4">
                <label >Tel Celular:</label>
                <div class="input-group">
                    <asp:TextBox ID="txtTelefonoCel" CssClass="form-control boxed" runat="server"></asp:TextBox>
                    <span class="input-group-addon">
                        <i class="fa fa-mobile-phone"></i>
                    </span>
                </div>
            </div>
            <div class="col-sm-4">
                <label>Correo electrónico:</label>
                <div class="input-group">
                    <asp:TextBox ID="txtMail" CssClass="form-control boxed" runat="server"></asp:TextBox>
                    <span class="input-group-addon">
                        <i class="fa fa-envelope"></i>
                    </span>
                </div>
            </div>
        </div>
 
    </div>
    <a href="persona-lista.aspx#ancla_<%=Request.Params["id"] %>" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
    <asp:LinkButton ID="LinkButton1" OnClick="btnGrabar_Click"  CssClass="btn btn-primary" runat="server"><i class="fa fa-save"></i>&nbsp;Grabar</asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
   <%-- <script type="text/javascript" src="../../js/moment.js"></script>
    <script type="text/javascript" src="../../js/transition.js"></script>
    <script type="text/javascript" src="../../js/collapse.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.js"></script>--%>
    
     <script src="../js/moment.min.js"></script>
    <script src="../js/transition.js"></script>
    <script src="../js/collapse.js"></script>
    <script src="../js/bootstrap-datetimepicker.js"></script>
    <script src="../../js/plugins/purify.min.js"></script>
    <script src="../../js/fileinput.min.js" type="text/javascript"></script>
    <script type="text/javascript">



        function pageLoad(sender, args) {
            if (!args.get_isPartialLoad()) { $addHandler(document, "keydown", onKeyDown); }
        }
        function onKeyDown(e) {
            if (e && e.keyCode == Sys.UI.Key.esc) {

            }
        }
        $('#dpFechaNac').datetimepicker({
            format: 'DD/MM/YYYY'
        });
        $('#dpFechaIngreso').datetimepicker({
            format: 'DD/MM/YYYY'
        });
        $('#dpHoraEntrada').datetimepicker({
            format: 'HH:mm'
        });
        $('#dpHoraSalida').datetimepicker({
            format: 'HH:mm'
        });
        var btnCustDel = '<button type="button" class="btn btn-danger btn-sm" title="quitar avatar" onclick="DeleteAvatar('+ <%=Request.Params["id"]%> +');">' +
            '<i class="fa fa-trash"></i>' +
            '</button>';
        $("#avatar-1").fileinput({
            overwriteInitial: true,
            maxFileSize: 1500,
            showZoom: false,
            showClose: false,
            showCaption: false,
            browseLabel: '',
            removeLabel: '',
            browseClass: 'btn btn-primary btn-sm',
            browseIcon: '<i class="fa fa-folder-open"></i>',
            browseTitle: 'Seleccionar imagen',
            removeClass: "btn btn-danger btn-sm",
            removeIcon: '<i class="fa fa-trash"></i>',
            removeTitle: 'Eliminar imagen',
            elErrorContainer: '#kv-avatar-errors-1',
            msgErrorClass: 'alert alert-block alert-danger',
            defaultPreviewContent: '<img src="../../archivos/fotos/personas/<%=new Personas(Convert.ToInt32(Request.Params["id"])).Foto%>" alt="Fotografía" style="width:200px"/>',
            layoutTemplates: { main2: '{preview} ' + btnCustDel + ' {browse}' },
            allowedFileExtensions: ["jpg", "png", "gif"]
        });
        function DeleteAvatar(idPersona) {
            var r = confirm("¿Desea quitar la fotografía?");
            if (r == true) {
                alert('Eliminar: ' + String(idPersona));
            } 
           
        }
    </script>
</asp:Content>

