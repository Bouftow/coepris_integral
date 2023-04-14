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
      /*  option {
  background-color: #ffdc9c;
}*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Distintivos.ShowMenu(String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="card-block card helvetica">
        <div class="card sameheight-item" style="border-bottom:solid;border-bottom-width:1px" data-exclude="xs">
            <%--<div class="card-header card-header-sm bordered" style="display: unset;" id="SH" runat="server">--%>
            <div class="card text-center" style="display: unset;" id="SH" runat="server">
                
                    <h3><strong> PROGRAMA ESTABLECIMIENTO SEGURO</strong></h3>
               
            </div>
            <asp:Label runat="server" ID="LblMsg"></asp:Label>
            
            </div>
            <div class="card-block">
                <div class="tab-content" id="SG" runat="server">
                    <div runat="server" id="uno">
                        <div runat="server" id="div2" class=" text-justify col-sm-12 alert alert-light">
                            <div class="text-center">Para el otorgamiento del <strong>DISTINTIVO ESTABLECIMIENTO SEGURO</strong> es necesario contar con todos los permisos sanitarios regulados por la COEPRIS.</div>
                        </div>
                        <div runat="server" id="div3" class=" text-justify col-sm-12 alert alert-light">
                            Queremos reconocer el compromiso de los establecimientos que cumplen de forma permanente con los protocolos y medidas sanitarias de salud, que coadyuvan a la contención de la propagación de COVID-19, a través del otorgamiento del <strong>Distintivo Establecimiento Seguro</strong>, que signifique una responsabilidad compartida en pro de crear espacios seguros y saludables para la población. 
                        </div>
                        <div runat="server" id="div1" class=" text-justify col-sm-12 alert alert-light">
                            <div class="text-center" style="font-weight: bold">TRÁMITE GRATUITO</div>
                            <div>CUALQUIER DUDA ACERCA DE ESTE TRÁMITE FAVOR DE ACUDIR A NUESTROS CENTROS INTEGRALES DE SERVICIOS (CIS) O COMUNICARTE A NUESTROS MEDIOS DE CONTACTO.</div>
                            <br />

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
                            <div class="text-center" style="margin: 2vw">
                                <asp:LinkButton ID="btnEnviar" OnClick="btnEnviar_Click" CssClass="btn btn-primary" runat="server">Comenzar Registro&nbsp;<i class="fa fa-send"></i></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                    <div runat="server" id="dos" class="">
                        <div class="col-sm-12 text-justify ">
                            La apertura para la obtención del DISTINTIVO ESTABLECIMIENTO SEGURO está abierta para los siguientes giros: 
                                <ul>
                                    <li>Cines</li>
                                    <li>Restaurantes y servicios de preparación de alimentos con bebidas</li>
                                    <li>Comercio al por menor en tiendas departamentales y plazas comerciales</li>
                                    <li>Gimnasios</li>
                                    <%--<li>Escuelas</li>--%>
                                    <li>Guarderías</li>
                                    <li>Comercio al por menor en tiendas de autoservicio</li>
                                    <li>Comercio al por menor de productos textiles, bisutería, accesorios de vestir y calzado (tiendas de ropa, zapaterías, joyerías, accesorios para el arreglo personal)</li>
                                    <li>Salones de eventos, palapas, jardines y albercas</li>
                                </ul>

                            Próximamente se habilitarán los siguientes giros:
                                  <ul>
                                      <li>Comercio al por menor de abarrotes, alimentos, bebidas, hielo y tabaco para el esparcimiento y otros artículos de uso personal</li>
                                      <li>Depósitos </li>
                                      <li>Servicios culturales, deportivos y extracurriculares</li>
                                  </ul>
                        </div>
                        <strong style="font-size: 20px">Instrucciones:</strong>
                        <ul class="list-group">
                            <%--  <li class="list-group-item">1.- Lee estas instrucciones<br />
                                <small>Para evitar problemas, errores o confusión en el registro, favor de leer completas las instrucciones</small></li>--%>
                            <li class="list-group-item">1.- Elije un giro<br />
                                <small>Selecciona el giro que corresponda al establecimiento que deseas registrar</small></li>
                            <li class="list-group-item">2.- Lee la información proporcionada<br />
                                <small>Al seleccionar el giro correspondiente, se mostrará un documento con los requisitos necesarios que debe contar el establecimiento</small></li>
                            <li class="list-group-item">3.- Da clic en 'Registrarme'<br />
                                <small>Una vez que hayas leido los requisitos para la realización de este registro, presiona el botón verde 'Registrarme' que aparecerá en la parte inferior para comenzar a capturar los datos necesarios</small></li>
                            <li class="list-group-item">4.- Captura los datos<br />
                                <small>Deberás rellenar los campos de captura con la información correspondiente al establecimiento que deseas registrar, al finalizar deberás presionar el botón para enviar la información. <strong>Nota: Habrá un botón de confirmación de envío de información de captura</strong></small></li>
                            <li class="list-group-item">5.-Espera
                                <br />
                                <small>Enhorabuena, has iniciado el proceso para la obtención del <strong>Distintivo Establecimiento Seguro</strong>, espera pacientemente a que tu establecimiento sea visitado por personal capacitado de COEPRIS. <strong>Nota: Al momento de que nuestro personal acuda al establecimiento, se deberán identificar correctamente como miembros de la dependencia</strong></small></li>
                        </ul>
                    </div>

                </div>


                <div id="tres" runat="server" class="select container-fluid">
                <%--    <div class="row">
                        <div class="col-sm-10">--%>
                            <asp:DropDownList ID="ddlGiros" runat="server" AutoPostBack="true"
                                DataTextField="nombre_giro"
                                DataValueField="id_giro"
                                OnSelectedIndexChanged="ddlGiros_SelectedIndexChanged" CssClass="CentrarSelect select" Width="100%">
                            </asp:DropDownList>

                      <%--  </div>--%>

                    <%--    <div class="col-sm-2" style="background: #000000">
                            <a id="flechas" class="fa fa-arrow-left" style="color: white">Da clic en el giro para que se desplieguen más opciones</a>
                        </div>--%>
                   <%-- </div>--%>
                    <div runat="server" id="aparecer">
                        <div class="container col-sm-12">
                            <asp:Literal runat="server" ID="embedvideo"></asp:Literal>
                        </div>
                         <div class="container col-sm-12">
                            <asp:Literal runat="server" ID="embed"></asp:Literal>
                        </div>
                        <div class="text-center" style="margin: 1vw">
                            <button runat="server" id="btn_descargar" onserverclick="btn_descargar_ServerClick" type="button" class="btn btn-primary">Descargar Archivo</button>
                            <button runat="server" id="btn_registro" onserverclick="btn_registro_ServerClick" type="button" class="btn btn-success">Registrarme</button>
                        </div>
                    </div>
                </div>
                 <div class="jumbotron text-center">
                  
                       
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
