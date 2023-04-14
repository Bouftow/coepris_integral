<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">

    <link href="../css/CustomInput.css" rel="stylesheet" />
    <style>
        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }

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

        .helvetica {
            font-family: HelveticaNeueLTStd-Lt;
            font-size: 18px;
        }

        .select {
            margin-bottom: 0;
        }

      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Comedores.ShowMenu(String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server"> 
    <%--<img runat="server" id="imgDistintivo" src="archivos/banner_capacita.jpg" style="width: 100%" />--%>
    <div class="card-block card helvetica" style="margin-bottom: 0px">
        <div class="card sameheight-item" data-exclude="xs">
  
            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            <div class="card-block text-justify">
               

                    
                        <div class="text-center alert alert-light"><strong>CAPACITACIÓN PARA UNIDADES DE CONSUMO ESCOLAR, CAFETERÍAS, COMEDORES Y ANÁLOGOS</strong></div>
                    
                  
                        El regreso a clases presenciales en el Estado, nos obliga a la COEPRIS a tomar acciones para salvaguardar la salud de la comunidad escolar regulando y vigilando que los servicios de alimentación dentro de las instituciones educativas sean los óptimos, para que con ello puedan reiniciar sus labores de manera responsable.
                            <br />
                        <br />
                        Nuestro objetivo es brindar el conocimiento necesario al personal administrador de unidades de consumo escolar sobre las medidas requeridas para poder operar en un ambiente que aminore la posibilidad de transmisión del SARS-CoV-2.
                            <br />
                        <br />
                        <strong style="font-size: 20px">Instrucciones:</strong>
                        <ul class="list-group">
                            <%--  <li class="list-group-item">1.- Lee estas instrucciones<br />
                                <small>Para evitar problemas, errores o confusión en el registro, favor de leer completas las instrucciones</small></li>--%>
                            <li class="list-group-item">1.- Llena los campos requeridos<br />
                               <small>Para llevar a cabo el registro en esta plataforma deberá llenar los siguientes campos:</small>
                                    <ul>
                                        
                                        <li><small>Clave del centro de trabajo.</small></li>
                                        <li><small>Nombre de la institución educativa.</small></li>
                                        <li><small>Nombre del responsable de la unidad de consumo escolar.</small><br />&nbsp <small>En caso de:</small>
                                            <ul>
                                                <li><small>Concesión: El nombre del propietario.</small></li>
                                                <li><small>Cooperativa escolar: Nombre de un representante designado por la comunidad escolar.</small></li>
                                                <li><small>Responsable del comedor o desayunador escolar.</small></li>
                                            </ul>
                                        </li>
                                    </ul>
                            </li>
                            <li class="list-group-item">2.- Visualiza video de capacitación</li>
                            <li class="list-group-item">3.- Lleva a cabo la evaluación del curso de capacitación</li>
                            <li class="list-group-item">4.- Acepta el compromiso</li>
                            <li class="list-group-item">5.- Imprime la constancia<br /><small>Descarga el archivo PDF que se te brindará al terminar la evaluación e imprime el QR. ¡Ese QR será tu constancia!</small></li>
                        </ul>
                        

                            <div class="panel-footer text-center" style="margin-top:2vw">
                                <asp:LinkButton ID="btnEnviar" OnClick="btnEnviar_Click" CssClass="btn btn-primary" runat="server">Comenzar Registro&nbsp;<i class="fa fa-send"></i></asp:LinkButton>
                            </div>

                            <div class="text-justify" style="font-size: 12px; color: red; margin: 2vw">

                                <small>TRÁMITE GRATUITO</small><br />
                                <small>CUALQUIER DUDA ACERCA DE ESTE TRÁMITE FAVOR DE ACUDIR A NUESTROS CENTROS INTEGRALES DE SERVICIOS (CIS) O COMUNICARTE A NUESTROS MEDIOS DE CONTACTO.</small>

                            </div>
                            <div class="row text-center" style="font-size: 18px">
                                <div class="col">
                                    <a class="fa fa-whatsapp" style="font-size: 25px"></a>&nbsp Whatsapp:<br />
                                    834 268 7089
                                </div>
                                <div class="col">
                                    <a class="fa fa-phone"></a>&nbsp Teléfono de contacto:<br />
                                    800 720 3774
                                </div>
                                <div class="col">
                                    <a class="fa fa-google"></a>&nbsp Correo electrónico:<br />
                                    contacto.coepris@tam.gob.mx
                                </div>
                            </div>
            </div>
        </div>
    </div>
    <div class="jumbotron text-center">
        <div class="row">
            <div class="offset-sm-3 col-sm-6">
                <span style="font-size: 8pt;">
                    <strong>COMISIÓN ESTATAL PARA LA PROTECCIÓN</strong>
                    <strong>CONTRA RIESGOS SANITARIOS</strong><br />
                    Calle 8 entre Berriozabal y Anaya #1020 Planta Baja,<br />
                    Zona Centro 87000, Cd. Victoria Tamaulipas<br />
                    800 720 3774</span>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">

    <%--<script>
        var pantalla = function () {
            if (Modernizr.mq('(max-width: 576px)')) {

                alert('ora');
                $("#flechas").css("fa-fa", "0px");
                $("#flechas").removeClass("myClass noClass").addClass("yourClass");

            } else {

                pantalla();//SI DESCOMENTAS ESTA LINEA, JALA but error de autollamarse mucho
                // Clear the settings etc
                //$("#secondary").removeClass("small").css("margin", "");   // <<< whatever the other margin value should be goes here

            }
        }

        // Shortcut for $(document).ready()
        $(function () {
            // Call on every window resize
            $(window).resize(pantalla);
            // Call once on initial load
            pantalla();
        });
    </script>--%>
</asp:Content>
