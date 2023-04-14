<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="SolucionarProblemas.aspx.cs" Inherits="_default" %>

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
                <div class="header-block" style="text-align:center;">
                    <h3>Bitácora de Seguimiento</h3>
                    <h4>Solucionador de Problemas</h4>
                    
                </div>
                <ul class="nav nav-tabs pull-right" role="tablist">
                    <li class="nav-item"><a class="nav-link active" href="#Requisitos" role="tab" data-toggle="tab">Tipo de Trámtie</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#DatosSol" role="tab" data-toggle="tab">Datos del Solicitante</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#DatosEst" role="tab" data-toggle="tab">Datos del Establecimiento</a> </li>


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
                        PageSize="7"
                        Style="background: white;">

                        <HeaderStyle
                            BackColor="#337ab7"
                            Font-Bold="True"
                            ForeColor="White" />
                        <Columns>

                            <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                            <asp:BoundField HeaderText="Tipo de Trámite" DataField="nombre_tramite" ItemStyle-Wrap="false" />


                        </Columns>

                    </asp:GridView>
               
             
      



                </div>
                <div role="tabpanel" class="tab-pane fade in" id="DatosSol">


                    <h3>Datos del Solicitante:</h3>
                    <div class="form-group col-sm-12">

                        <label>
                            CURP:<br />
                            <asp:TextBox ID="txtCurp" class="form-control" Style="text-transform: uppercase;"
                                runat="server" oninput="validarInput(this)"
                                onkeypress="return curpValida(event)"
                                MaxLength="18" MinLength="18" autocomplete="true"
                                disabled="true"></asp:TextBox>
                        </label>
                        <p id="resultado"></p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ControlToValidate="txtCurp"
                            ErrorMessage="Porfavor ingrese su curp."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        <%--  </div>--%>


                        <div class="row">

                            <div class="col-sm-4 ">
                                Nombre(s):
                                <asp:TextBox ID="txtNombre" disabled="true" class="form-control css-input" runat="server" onkeypress="return sololetras(event)" 
                                    ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="txtNombre"
                                    ErrorMessage="Campo requerido."
                                    ForeColor="Red">
                                    
                                </asp:RequiredFieldValidator>




                            </div>

                            <div class="col-sm-4">
                                Apellido Paterno:
                                 <asp:TextBox ID="txtApellidop" disabled="true" class="form-control css-input" onkeypress="return sololetras(event)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                    ControlToValidate="txtApellidop"
                                    ErrorMessage="Campo requerido."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>

                            </div>


                            <div class="col-sm-4">
                                Apellido Materno:
                                 <asp:TextBox ID="txtApellidom" disabled="true" class="form-control css-input" onkeypress="return sololetras(event)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                    ControlToValidate="txtApellidom"
                                    ErrorMessage="Campo requerido."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>

                            </div>

                        </div>





                        <div class="row">
                            <div class="col-sm-4">
                                (*) Telefono Movil:
                              <asp:TextBox ID="txtTelmov" MaxLength="10" disabled="true" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete=""></asp:TextBox>
                            </div>

                            <div class="col-sm-3">
                                (*)Telefono Fijo:<br />
                                <asp:TextBox ID="txtTelfij" MaxLength="10" disabled="true" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete=""></asp:TextBox>
                            </div>



                        </div>



                        <br />
                        (*)Correo Electronico:<br />
                        <asp:TextBox ID="txtCorreo" disabled="true" class="form-control css-input" autocomplete="off" onkeypress="email(event)" runat="server"></asp:TextBox><br />


                        RUI:<br />
                        <asp:TextBox ID="txtRui" disabled="true" class="form-control css-input col-sm-4" runat="server" onkeypress="return numbersonly(event)"></asp:TextBox>
                        <br />

                    </div>


                </div>
                <div role="tabpanel" class="tab-pane fade in" id="DatosEst">

                    <h3>Datos del Establecimiento:</h3>


                    <div class="form-group">

                        <div class="row">
                            <div class="col-sm-6">





                                <%--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                                <label>
                                    RFC:<br />
                                    <asp:TextBox ID="txtRfc" disabled="true" class="form-control" Style="text-transform: uppercase;"
                                        runat="server" oninput="validarInput2(this)"
                                        onkeypress="return rfcValido2(event)"
                                        MaxLength="14" MinLength="13" autocomplete="off"> </asp:TextBox>
                                </label>
                                <p id="resultado2"></p>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="txtRfc"
                                    ErrorMessage="Se necesita del RFC."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>






                            </div>
                            <br />
                            <div class="col-sm-6">
                                Nombre del Establecimiento: 
                                <asp:TextBox ID="txtNombreest" disabled="true" class="css-input form-control " runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtNombreest"
                                    ErrorMessage="Nombre Requerido."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>







                        </div>

                        Razón Social:<br />
                        <asp:TextBox ID="txtRazonsocial" disabled="true" class="form-control css-input col-sm-6" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="txtRazonsocial"
                            ErrorMessage="Porfavor ingrese la Razón Social."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>




                        <h5>Domicilio:</h5>


                        Municipio:<br />
                        <asp:TextBox ID="txtMunicipio" disabled="true" class="form-control css-input col-sm-6" runat="server"></asp:TextBox>


                        <div class="row">
                            <div class="col-sm-6">
                                Colonia:<br />
                                <asp:TextBox ID="txtColonia" disabled="true" class="form-control css-input" runat="server"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtColonia"
                                    ErrorMessage="Porfavor ingrese la colonia."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>

                            </div>

                            <div class="col-sm-6">
                                Calle:<br />
                                <asp:TextBox ID="txtCalle" disabled="true" class="form-control css-input" runat="server"></asp:TextBox>


                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtCalle"
                                    ErrorMessage="Porfavor ingrese la calle."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div style="align-content:center; padding-right:10px">
           <br />
      <asp:TextBox ID="x" class="form-control css-input fe" Width="200px"
          placeholder="Ingrese el nuevo estado"
          runat="server"></asp:TextBox>

            </div>
           
              

                <asp:Button ID="btnAprobado5"
                    OnClick="btnAprobado_Click"
                    runat="server" class="myButtonAprobar" CausesValidation="false"
                    Text="Cambiar Estado" />
                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
            
            </div>

            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
            <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5--%>
     


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
        $(document).on('ready', function () {
            $("#file-0b").fileinput();
        });
    </script>



    <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>
    <script type="text/javascript">
        var x = document.getElementById("riesgo").value;
        if (x == '2') {
            //document.getElementsByClassName("mDiv").style.display = 'none'; 
            //$(".mDiv").hide();

            $(".mDiv").addClass("z");

            //$(".clase-del-div").removeClass("N");


            $(".grid-container").addClass("ngrid-container");
            $(".ngrid-container").removeClass("grid-container");

        }






    </script>

    <script type="text/javascript">

        //var sol = document.getElementById("sol").value;
        //var tit = document.getElementById("tit").value;
        //var ced = document.getElementById("ced").value;
        //var dip = document.getElementById("dip").value;
        //var curr = document.getElementById("curr").value;
        //var prog = document.getElementById("prog").value;
        //var rel = document.getElementById("rel").value;
        //var plano = document.getElementById("plano").value;
        //var alt = document.getElementById("alt").value;
        //var papel = document.getElementById("papel").value;
        //var form = document.getElementById("form").value;
        //var cop = document.getElementById("cop").value;
        //var lic = document.getElementById("lic").value;
        //var dicdoc = document.getElementById("dicdoc").value;


        //if ($(chkSolLicSan).prop("checked")) {
        //    if (sol != null) {
        //  document.getElementById("FileSolLicSan").style.display = "none";

        //    }

        //} else {

        //   
        document.getElementById("SolLicSan").style.display = "none";
        //}

        //if ($(chkTituloProf).prop("checked")) {
        //  document.getElementById("FileTituloProf").style.display = "none";

        //} else {
        document.getElementById("TituloProf").style.display = "none";
        //}

        //if ($(chkCedulaProf).prop("checked")) {
        // document.getElementById("FileCedulaProf").style.display = "none";
        //} else {

        document.getElementById("CedulaProf").style.display = "none";
        //}


        //if ($(chkDiplomaEspecial).prop("checked")) {
        //   document.getElementById("FileDiplomaEspecial").style.display = "none";

        //} else {
        document.getElementById("DiplomaEspecial").style.display = "none";
        //}

        //if ($(chkCurriculum).prop("checked")) {
        //    document.getElementById("FileCurriculum").style.display = "none";

        //} else {
        document.getElementById("Curriculum").style.display = "none";
        //}

        //if ($(chkProgramaMedico).prop("checked")) {
        //    document.getElementById("FileProgramaMedico").style.display = "none";

        //} else {
        document.getElementById("ProgramaMedico").style.display = "none";
        //}


        //if ($(chkRelacionMaterialEquipo).prop("checked")) {
        //    document.getElementById("FileRelacionMaterialEquipo").style.display = "none";

        //} else {
        document.getElementById("RelacionMaterialEquipo").style.display = "none";
        //}


        //if ($(chkPlanoMemoria).prop("checked")) {
        //    document.getElementById("FilePlanoMemoria").style.display = "none";

        //} else {
        document.getElementById("PlanoMemoria").style.display = "none";
        //}

        //if ($(chkAlta).prop("checked")) {
        //    document.getElementById("FileAlta").style.display = "none";

        //} else {
        document.getElementById("Alta").style.display = "none";
        //}

        //if ($(chkPapelMembretado).prop("checked")) {
        //    document.getElementById("FilePapelMembretado").style.display = "none";

        //} else {
        document.getElementById("PapelMembretado").style.display = "none";
        //}


        //if ($(chkPago).prop("checked")) {
        //    document.getElementById("FilePago").style.display = "none";

        //} else {
        document.getElementById("Pago").style.display = "none";
        //}

        //if ($(chkProgramaMedico).prop("checked")) {
        //    document.getElementById("FileProgramaMedico").style.display = "none";

        //} else {
        document.getElementById("ProgramaMedico").style.display = "none";
        //}

        //if ($(chkCopiaTramiteAnterior).prop("checked")) {
        //    document.getElementById("FileCopiaTramiteAnterior").style.display = "none";

        //} else {
        document.getElementById("CopiaTramiteAnterior").style.display = "none";
        //}

        //if ($(chkLicenciaSanitariaAnterior).prop("checked")) {
        //    document.getElementById("FileLicenciaSanitariaAnterior").style.display = "none";

        //} else {
        document.getElementById("LicenciaSanitariaAnterior").style.display = "none";
        //}


        //if ($(chkDictamenDocumental).prop("checked")) {
        //    document.getElementById("FileDictamenDocumental").style.display = "none";

        //} else {
        document.getElementById("DictamenDocumental").style.display = "none";
    //}
    </script>

    <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

    <script>
        $('#file-fr').fileinput({
            theme: 'fas',
            language: 'fr',
            uploadUrl: '#',
            allowedFileExtensions: ['jpg', 'png', 'gif']
        });
        $('#FileSolLicSan').fileinput({
            theme: 'fas',
            language: 'es',
            uploadUrl: '#'
            //allowedFileExtensions: ['jpg', 'png', 'gif']
        });
        $("#file-0").fileinput({
            theme: 'fas',
            'allowedFileExtensions': ['jpg', 'png', 'gif']
        });
        $("#file-1").fileinput({
            theme: 'fas',
            uploadUrl: '#', // you must set a valid URL here else you will get an error
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            overwriteInitial: false,
            maxFileSize: 1000,
            maxFilesNum: 10,
            //allowedFileTypes: ['image', 'video', 'flash'],
            slugCallback: function (filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });
        /*
         $(".file").on('fileselect', function(event, n, l) {
         alert('File Selected. Name: ' + l + ', Num: ' + n);
         });
         */
        $("#file-3").fileinput({
            theme: 'fas',
            showUpload: false,
            showCaption: false,
            browseClass: "btn btn-primary btn-lg",
            fileType: "any",
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            overwriteInitial: false,
            initialPreviewAsData: true,
            initialPreview: [
                //"http://lorempixel.com/1920/1080/transport/1",
                //"http://lorempixel.com/1920/1080/transport/2",
                //"http://lorempixel.com/1920/1080/transport/3"
            ],
            initialPreviewConfig: [
                { caption: "transport-1.jpg", size: 329892, width: "120px", url: "{$url}", key: 1 },
                { caption: "transport-2.jpg", size: 872378, width: "120px", url: "{$url}", key: 2 },
                { caption: "transport-3.jpg", size: 632762, width: "120px", url: "{$url}", key: 3 }
            ]
        });
        $("#file-4").fileinput({
            theme: 'fas',
            uploadExtraData: { kvId: '10' }
        });
        $(".btn-warning").on('click', function () {
            var $el = $("#file-4");
            if ($el.attr('disabled')) {
                $el.fileinput('enable');
            } else {
                $el.fileinput('disable');
            }
        });
        $(".btn-info").on('click', function () {
            $("#file-4").fileinput('refresh', { previewClass: 'bg-info' });
        });
        /*
         $('#file-4').on('fileselectnone', function() {
         alert('Huh! You selected no files.');
         });
         $('#file-4').on('filebrowse', function() {
         alert('File browse clicked for #file-4');
         });
         */
        $(document).ready(function () {
            $("#test-upload").fileinput({
                'theme': 'fas',
                'showPreview': false,
                'allowedFileExtensions': ['jpg', 'png', 'gif'],
                'elErrorContainer': '#errorBlock'
            });
            $("#kv-explorer").fileinput({
                'theme': 'explorer-fas',
                'uploadUrl': '#',
                overwriteInitial: false,
                initialPreviewAsData: true,
                initialPreview: [
                    //"http://lorempixel.com/1920/1080/nature/1",
                    //"http://lorempixel.com/1920/1080/nature/2",
                    //"http://lorempixel.com/1920/1080/nature/3"
                ],
                initialPreviewConfig: [
                    { caption: "nature-1.jpg", size: 329892, width: "120px", url: "{$url}", key: 1 },
                    { caption: "nature-2.jpg", size: 872378, width: "120px", url: "{$url}", key: 2 },
                    { caption: "nature-3.jpg", size: 632762, width: "120px", url: "{$url}", key: 3 }
                ]
            });
            /*
             $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
             alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
             });
             */
        });
    </script>

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
</asp:Content>

