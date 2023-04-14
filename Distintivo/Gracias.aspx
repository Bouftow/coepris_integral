<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Gracias.aspx.cs" Inherits="Gracias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style type="text/css">
        @font-face {
            font-family: 'Novecentowide-Bold';
            font-size: 1000px;
            src: url('../fonts/Novecentowide-Bold.otf') format('opentype');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'HelveticaNeueLTStd-Bd';
            src: url('../font/HelveticaNeueLTStd-Bd.otf') format('opentype');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'HelveticaNeueLTStd-Lt';
            src: url('../fonts/HelveticaNeueLTStd-Lt.otf') format('opentype');
            font-weight: normal;
            font-style: normal;
        }

        .card-block {
            border: none
        }

        .card {
            border: none
        }

        .rbl input[type="radio"] {
            margin-right: 10px;
        }

        .radioButtonList label {
        }

        .f {
            margin-top: 7px
        }

        .tamaño {
            font-size: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Distintivos.ShowMenu(String.Format("gracias.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <script type="text/javascript" language="javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }


    </script>
   

    <input type="text" value="0" id="hidden" style="display:none" />
    <asp:TextBox runat="server" ID="Gise" style="display:none"></asp:TextBox>
    <asp:Label runat="server" ID="LblMsg"></asp:Label>
    <div class="col-sm-12">
        <button id="btnPDF" clientidmode="Static" class="btn btn-secondary" onserverclick="btnPDF_ServerClick" runat="server"><i class="fa fa-download"></i>&nbsp;Descargar Acuse</button>
    </div>
    
  

    <div class="col-sm-12">
        <div style="text-align: center;" class="alert alert-primary header-block" runat="server">
            <p style="font-family: Novecentowide-Bold; font-size: 40px; color: white;">¡Gracias por tu registro!</p>
            <p style="font-family: HelveticaNeueLTStd-Lt; font-size: 25px; color: white;">Pronto la COEPRIS estará dando seguimiento a tu solicitud</p>
            <p style="font-family: HelveticaNeueLTStd-Lt; font-size: 18px; color: white; text-align: center">Recuerda que debes cumplir tus responsabilidades como establecimiento</p>
            <%--<p style="font-family: HelveticaNeueLTStd-Lt; font-size: 18px; color: white; text-align: center">Al registrarte promueves el cuidado sanitario de nuestro estado.</p>--%>


        </div>
    </div>
    <div class="modal fade" id="ModalSolLicSan" tabindex="-1" role="dialog" aria-labelledby="ModalSolLicSanlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="ModalSolLicSanlabel">Registro de establecimientos seguros</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <asp:Label runat="server" ID="lblErrorModal">No se ha podido recuperar el número de registro de su solicitud y será redirigido a la página de inicio</asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="container">

                        <div class="col text-center">
                            <button runat="server" id="btn_registro" onserverclick="btn_registro_ServerClick" type="button" class="btn btn-success ">Regresar a inicio</button>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Modal_Registrar_Otro" tabindex="-1" role="dialog" aria-labelledby="Modal_Registrar_Otro_label" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="Modal_Registrar_Otro_label">Registro de escuela segura</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <asp:Label runat="server" ID="Label1">Se ha descargado su comprobante de registro de solicitud. Muchas gracias por completar el registro, si desea capturar otros niveles educativos, de clic en el botón "Capturar otra escuela"</asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="container">

                        <div class="col text-center">
                            <button runat="server" id="btn_regresar" onserverclick="btn_registro_escuelas_ServerClick" type="button" class="btn btn-success">Capturar otra escuela</button>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script type="text/javascript">
        $("#menu_gracias").show();
        //$("#menu_registro").show();
    </script>
    <script>
        $('#ModalSolLicSan').on('hide.bs.modal', function (e) { window.location.replace("default.aspx"); })
    </script>
  
    <script>
        //if (!$.cookie("DescargarArchivo")) {
        //    // do your stuff

        //    // set cookie now
        //    $.cookie("DescargarArchivo", "Descargado", { "expires": 7 })
        //}


        //$('#btnPDF').click(); 

        $("#btnPDF").click(function () {
            if ($("#<%=Gise.ClientID%>").val() == "") {
            $("#<%=LblMsg.ClientID%>").append(" <div class='alert alert-success'>Se ha descargado el archivo satisfactoriamente, por favor verifica tu carpeta de descargas.</div >");
                $("#<%=Gise.ClientID%>").val("1");
            }
            });



    </script>
    <script>
        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;  

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
            return false;
        };
    </script>
    <script>
        var id_g = getUrlParameter('id_g');if (id_g == 14) {$('#Modal_Registrar_Otro').modal("show");}
    </script>
  
</asp:Content>

