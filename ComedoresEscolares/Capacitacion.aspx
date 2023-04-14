<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Capacitacion.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link rel="stylesheet" href="https://cdn.plyr.io/3.6.12/plyr.css" />
    <link href="../css/CustomInput.css" rel="stylesheet" />
    <style>
        .boton-azo:disabled {
            font-family: Arial;
            font-size: 13px;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #154682;
            box-shadow: inset 0px 1px 3px 0px #c7c9c9;
            background: #4f574a;
            background-color: #a9b0ae;
            border-radius: 5px;
            border: 1px solid white;
            display: inline-block;
            cursor: pointer;
            color: #515050;
            text-decoration: none;
            text-shadow: 0px -1px 0px #9e9e9e;
            font-style: italic;
        }

        button[disabled]:hover {
        }

        input[type="radio"]:checked + label {
            font-weight: bold;
            color: green;
            text-decoration: underline;
        }

        input {
            position: relative;
            font-weight: normal;
            vertical-align: middle;
        }

        .form-check-label {
            font-weight: lighter;
        }

        label {
            position: relative;
            display: inline-block;
            vertical-align: middle;
        }

        .estil {
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
        .invisible{
            display:none!important;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Comedores.ShowMenu(String.Format("capacitacion.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="card-block card helvetica" style="margin-bottom: 0px">
        <div class="card sameheight-item" data-exclude="xs">

            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            <div class="estil">
                <table class="table table-hover" style="font-size: 15px; border: solid; border-width: 2px; border-color: #b6b2b2">
                    <thead class="text-center">
                        <tr>
                            <td colspan="5" style="font-size: 28px">Capacitación para Unidades de Consumo Escolar</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="5">
                                <script src="https://cdn.plyr.io/3.6.12/plyr.polyfilled.js"></script>
<%--<div class="plyr__video-embed" id="player">
  <iframe
    src="https://www.youtube.com/embed/bTqVqk7FSmY?origin=https://plyr.io&amp;iv_load_policy=3&amp;modestbranding=1&amp;playsinline=1&amp;showinfo=0&amp;rel=0&amp;enablejsapi=1"
    allowfullscreen
    allowtransparency
    allow="autoplay"
  ></iframe>
</div>--%>

                                <video controls crossorigin playsinline data-poster="archivos/portada.jpg" id="player">
                                    <source src="archivos/unidades_consumo_escolar.mp4" type="video/mp4" size="1080" />
                                </video>
                                <%--  <div id="ytplayer"></div>    <%--<textarea style="display:none" id="txtVideo"></textarea>
                                
                    <script>
                        // Load the IFrame Player API code asynchronously.
                        var tag = document.createElement('script');
                        tag.src = "https://www.youtube.com/player_api";
                        var firstScriptTag = document.getElementsByTagName('script')[0];
                        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                        // Replace the 'ytplayer' element with an <iframe> and
                        // YouTube player after the API code downloads.
                        var player;
                        function onYouTubePlayerAPIReady() {

                            player = new YT.Player('ytplayer', {
                                height: '500',
                                width: '100%',
                                videoId: 'dQw4w9WgXcQ',
                                playerVars: { autoplay: 1, controls:2  },
                                events: {
                                    'onReady': onPlayerReady,
                                    'onStateChange': onPlayerStateChange
                                }
                            });

                        }
                        function onPlayerReady(event) {
                            //event.target.playVideo();
                            //setTimeout(playVideo, 1000);
                        }
                        var done = false;
                        function onPlayerStateChange(event) {
                            if (event.data == YT.PlayerState.PLAYING && !done) {
                                //setTimeout(stopVideo, 6000);
                                done = true;
                                
                            }
                            if (player.getPlayerState() == '0') {
                               $('#txtVideo').val('Finalizado');
                                
                            }

                        }
                        function playVideo() {
                            player.playVideo();
                        }
                        function stopVideo() {
                            player.stopVideo();
                        }
                        
                       
                    </script>--%> </td>
                        </tr>
                        <tr style="border-bottom: hidden">
                            <td colspan="5" class="text-center"><strong style="font-size: 18px">¿Que deben de hacer los trabajadores de los establecimientos de consumo escolar y en general, cualquier persona que presente datos de infección de vía respiratoria y/o fiebre?</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P1" id="P1_R1" />
                                    <label class="form-check-label" for="P1_R1">
                                        Ir a trabajar sin avisar a la institución educativa o al concesionario del establecimiento de consumo escolar, de que presenta datos de infección de vía respiratoria y/o fiebre.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P1" id="P1_R2" />
                                    <label class="form-check-label" for="P1_R2">
                                        Ir a trabajar, evitando a toda costa pasar por el filtro sanitario para que no se le detecte fiebre, síntoma asociado a distintos procesos infecciosos, entre estos COVID-19.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P1" id="P1_R3" />
                                    <label class="form-check-label" for="P1_R3">
                                        Dar aviso a la institución educativa o al concesionario del establecimiento de consumo escolar que presenta datos de infección de vía respiratoria y/o fiebre, y de que no acudirá a trabajar hasta no contar con una valoración médica que descarte la presencia de COVID-19.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P1" id="P1_R4" />
                                    <label class="form-check-label" for="P1_R4">
                                        Presentarse a trabajar, usando solo de manera ocasional el cubrebocas mientras maneja o manipula alimentos o no colocárselo de la manera correcta para que no le de calor mientras está cocinando. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P1" id="P1_R5" />
                                    <label class="form-check-label" for="P1_R5">
                                        Notificar a la institución educativa o al concesionario del establecimiento de consumo escolar que presenta síntomas asociados a COVID-19 y tomarse los días que se le otorguen mediante incapacidad médica para realizar trámites personales pendientes.
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr style="border-bottom: hidden">
                            <td colspan="5" class="text-center"><strong style="font-size: 18px">¿Qué es el COVID-19?</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P2" id="P2_R1" />
                                    <label class="form-check-label" for="P2_R1">
                                        Una enfermedad que se presenta en época de invierno para la cual existen un sinfín de tratamientos naturistas que alivian rápidamente a quienes la padecen. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P2" id="P2_R2" />
                                    <label class="form-check-label" for="P2_R2">
                                        Enfermedad infectocontagiosa de que afecta principalmente vía respiratoria y para la cual hasta el momento solo contamos con la vacuna, la vacunación de refuerzo y las medidas de emergencia sanitaria para protegernos.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P2" id="P2_R3" />
                                    <label class="form-check-label" for="P2_R3">
                                        Un reto de moda en las redes sociales, que los estudiantes realizan con el fin de obtener el mayor número de seguidores y me gusta. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P2" id="P2_R4" />
                                    <label class="form-check-label" for="P2_R4">
                                        Una enfermedad infectocontagiosa grave de vía respiratoria que afecta exclusivamente a los adultos mayores que padecen una enfermedad crónico-degenerativa.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P2" id="P2_R5" />
                                    <label class="form-check-label" for="P2_R5">
                                        Una pandemia devastadora, que afectó principalmente a los habitantes de países de Europa y Asia, en el siglo XIV y que, según las investigaciones históricas, alcanzó el punto máximo de mortalidad entre 1347 y 1353. 
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr style="border-bottom: hidden">
                            <td colspan="5" class="text-center"><strong style="font-size: 18px">¿Por qué es importante evitar la aglomeración de personas en los establecimientos de consumo escolar y en las áreas designadas para el consumo de alimentos?</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P3" id="P3_R1" />
                                    <label class="form-check-label" for="P3_R1">
                                        Porque así podemos atender, despachar y servir tranquilamente a los clientes del establecimiento de consumos escolar. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P3" id="P3_R2" />
                                    <label class="form-check-label" for="P3_R2">
                                        Porque evitamos confusiones al momento de servir lo que el cliente ordeno. Esto disminuye los costos de operación, al no tener que desechar un alimento que no fue solicitado por el cliente. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P3" id="P3_R3" />
                                    <label class="form-check-label" for="P3_R3">
                                        Porque así evitamos que el piso del establecimiento de consumo escolar se ensucie a consecuencia del excesivo número de alumnos o clientes. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P3" id="P3_R4" />
                                    <label class="form-check-label" for="P3_R4">
                                        Reducimos el riesgo de transmisión de la enfermedad COVID-19, entre las personas y debido a la dispersión-inhalación de gotículas de saliva contaminadas por el virus SARS-CoV-2 en el aire.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P3" id="P3_R5" />
                                    <label class="form-check-label" for="P3_R5">
                                        Porque la autoridad sanitaria aplicaría una medida de seguridad al establecimiento y esto no convendría a los intereses del mismo, al generarle pérdida económica. 
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr style="border-bottom: hidden">
                            <td colspan="5" class="text-center"><strong style="font-size: 18px">¿Cuáles son las tres medidas de emergencia sanitaria irreductibles que se deben aplicar en todo momento?</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P4" id="P4_R1" />
                                    <label class="form-check-label" for="P4_R1">
                                        Portar cubrebocas en espacios públicos, utilizándolo de la manera correcta. Lavado y la desinfección continua de manos. Evitar aglomeraciones.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P4" id="P4_R2" />
                                    <label class="form-check-label" for="P4_R2">
                                        Portar cubrebocas en espacios públicos, utilizándolo de la manera correcta. Lavado y la desinfección continua de manos. Todo cliente debe utilizar guantes quirúrgicos.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P4" id="P4_R3" />
                                    <label class="form-check-label" for="P4_R3">
                                        Portar careta de protección facial. Lavado y la desinfección continua de manos. Todo cliente debe utilizar guantes quirúrgicos. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P4" id="P4_R4" />
                                    <label class="form-check-label" for="P4_R4">
                                        Portar careta de protección facial. Mantener limpia la indumentaria utilizada por manejadores y manipuladores de alimentos. Todo cliente debe utilizar guantes quirúrgicos. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P4" id="P4_R5" />
                                    <label class="form-check-label" for="P4_R5">
                                        Asistir puntualmente a trabajar. Mantener limpia la indumentaria utilizada por manejadores y manipuladores de alimentos. No hacer uso del celular durante el horario laboral. 
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr style="border-bottom: hidden">
                            <td colspan="5" class="text-center"><strong style="font-size: 18px">¿Por qué debemos de desinfectar de manera continua las superficies duras lisas de contacto frecuente?</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P5" id="P5_R1" />
                                    <label class="form-check-label" for="P5_R1">
                                        Porque aún y cuando estas no representan el mayor riesgo contagio de la enfermedad COVID-19, si pueden contener gotículas de saliva contaminadas con el virus SARS-CoV-2, que al tocar con las manos y posteriormente, llevarnos las manos a la cara, tocándonos la nariz o los ojos tenemos el riesgo de autoinfectarnos. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P5" id="P5_R2" />
                                    <label class="form-check-label" for="P5_R2">
                                        Porque al estar sucias dan un mal aspecto y los alumnos o clientes del establecimiento de consumo escolar, no querrán comer en este lugar.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P5" id="P5_R3" />
                                    <label class="form-check-label" for="P5_R3">
                                        Porque el riesgo de que el virus SARS-CoV-2, atraviese nuestra ropa y luego se absorba a través de nuestra piel y nos contagiemos de COVID-19 es muy alto.
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P5" id="P5_R4" />
                                    <label class="form-check-label" for="P5_R4">
                                        Porque esta científicamente comprobado que el virus SARS-CoV-2 puede saltar desde cualquier superficie hasta nosotros y entrar por los ojos o la nariz e infectarnos. 
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="P5" id="P5_R5" />
                                    <label class="form-check-label" for="P5_R5">
                                        Ninguna de las respuestas anteriores. 
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <script>


</script>
                        <tr class="align-middle">
                            <td colspan="5" class="text-cente align-middler">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="acepto" id="acepto1" />
                                    <label class="form-check-label text-justify" for="acepto1">
                                        <strong style="font-weight: bold">Me comprometo, previo a la apertura de mi Comunidad de Consumo Escolar, a cumplir con la normatividad vigente en materia sanitaria, consistente en la tramitación de Aviso de Funcionamiento, pláticas y tramite de Certificados para Manejadores de Alimentos, expedidos por la Comisión Estatal para la Protección contra Riesgos Sanitarios.</strong>
                                    </label>
                                    <textarea style="display: none" id="txtarea"></textarea>
                                    <script>

                                        var n = $('#txtarea').val();
                                        if (n == '') { n = 0 }
                                        $('#acepto1').change(function () {
                                            if (n == 0) {
                                                $(':input[type="button"]').prop('disabled', false);
                                                $('#btn_acepto').text('Continuar para descargar QR');
                                                n++;

                                            } else {
                                                n--;
                                                $(':input[type="button"]').prop('disabled', true);
                                                $('#btn_acepto').text('De Clic en "Me comprometo" para continuar');
                                            }
                                        });
                                    </script>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="text-center">
            <button id="btn_acepto" class="boton-azo" disabled="disabled" type="button" onclick="func()">De Clic en 'Me comprometo' para continuar</button>

        </div>

    </div>
    <div class="jumbotron bg-azul-tam text-center">
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
    <script>
        const player = new Plyr('#player');
    </script>
    <div class="modal fade" data-keyboard="false" data-backdrop="static" id="ModalSolLicSan" tabindex="-1" role="dialog" aria-labelledby="ModalSolLicSanlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus">
                    <h5 class="modal-title" id="ModalSolLicSanlabel">CAPACITACIÓN PROGRAMA COMEDORES SEGUROS</h5>
                </div>
                <div class="modal-body text-center">
                    <asp:Label runat="server" ID="lblErrorModal"></asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="container">
                        <div class="col text-center">
                            <a id="btn_registro" href="Capacitacion.aspx" type="button" class="btn btn-success" onserverclick="btn_registro_ServerClick" runat="server">Intentar de nuevo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField runat="server" Value="" ID="txtVerif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function func() {

            if (!($('#P1_R3').is(":checked"))) { var $label1 = $("<label>").text('La respuesta a la pregunta 1 es incorrecta.'); $("#<%=lblErrorModal.ClientID%>").append($label1); $("#<%=lblErrorModal.ClientID%>").append('<br/>'); }
            if (!($('#P2_R2').is(":checked"))) { var $label2 = $("<label>").text('La respuesta a la pregunta 2 es incorrecta.'); $("#<%=lblErrorModal.ClientID%>").append($label2); $("#<%=lblErrorModal.ClientID%>").append('<br/>'); }
            if (!($('#P3_R4').is(":checked"))) { var $label3 = $("<label>").text('La respuesta a la pregunta 3 es incorrecta.'); $("#<%=lblErrorModal.ClientID%>").append($label3); $("#<%=lblErrorModal.ClientID%>").append('<br/>'); }
            if (!($('#P4_R1').is(":checked"))) { var $label4 = $("<label>").text('La respuesta a la pregunta 4 es incorrecta.'); $("#<%=lblErrorModal.ClientID%>").append($label4); $("#<%=lblErrorModal.ClientID%>").append('<br/>'); }
            if (!($('#P5_R1').is(":checked"))) { var $label5 = $("<label>").text('La respuesta a la pregunta 5 es incorrecta.'); $("#<%=lblErrorModal.ClientID%>").append($label5); $("#<%=lblErrorModal.ClientID%>").append('<br/>'); }



            $('#ModalSolLicSan').modal("show");

            if ($("#<%=lblErrorModal.ClientID%>").text() == "") {

                var $label6 = $("<label>").text('¡Enhorabuena!');
                $("#<%=lblErrorModal.ClientID%>").append($label6);
                $("#<%=lblErrorModal.ClientID%>").append('<br/>');
                var $p2 = $("<p style='font-size:14px;color:black'>").text('Su información ha sido guardada exitosamente, de clic en el botón siguiente para descargar su QR.');
                $("#<%=lblErrorModal.ClientID%>").append($p2);


                $("#<%=btn_registro.ClientID%>").text('Clic para descargar QR');

                $("#<%=txtVerif.ClientID%>").val('true');

            }


        }

    </script>
</asp:Content>
