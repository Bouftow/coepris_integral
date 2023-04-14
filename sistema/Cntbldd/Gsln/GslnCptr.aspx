<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="GslnCptr.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">


    <style>
        select {
            text-align: center;
        }



        .chk label {
            padding-right: 20px;
            display: inline;
        }

        .chk2 label {
            margin-right: 34px;
            display: inline;
        }

        .FixedHeader {
            position: absolute;
        }

        .rbl input[type="radio"] {
            margin-left: 30px;
            margin-right: 1px;
        }


        .oro {
            text-align: center
        }

        .spaced input[type="radio"] {
            margin-right: 5px; /* Or any other value */
        }

        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">

    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <div class="card-block">
        <div class="tab-content">
            <div class="card-block card">
                <div class="card-header card-header-sm bordered">
                    <div class="header-block">

                        <h2 id="NombreDeCoordinacion" runat="server"></h2>

                    </div>
                </div>
                <button runat="server" causesvalidation="false" onserverclick="Unnamed_ServerClick" class="newbtn"><i class="fa fa-repeat"></i>Regresar</button>

                <div class="card" runat="server">
                    <div class="select container-fluid">
                        <div class="row">
                        <div class="col-sm-4">
                            <h3 style="margin-left: 5%">Fecha de Entrega:</h3>

                            <div style="padding-left: 75px">
                                <asp:TextBox ToolTip="Año/Mes/Día" class="form-control css-input" CssClass="oro" ReadOnly="true" ID="Fecha1" runat="server" Width="100px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="Fecha1"
                                    Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                            </div>

                            <asp:Calendar ID="Calendar1" runat="server"
                                OnSelectionChanged="Selection_Change">
                                <SelectedDayStyle BackColor="#b0e5fb"
                                    ForeColor="black"></SelectedDayStyle>
                            </asp:Calendar>
                        </div>
                        <div class="col-sm">
                            Nombre de la persona:
                             <asp:DropDownList ID="DropDownList1" runat="server"
                                 Width="80%"
                                 DataTextField="nombre_completo"
                                 AutoPostBack="true"
                                 OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                 DataValueField="id_empleado">
                             </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RQDropDownList1" Text="Selecione Persona" InitialValue="-1" ControlToValidate="DropDownList1" runat="server" />
                            <br />
                            <br />

                           <div class="row">
                                <div class="select container-fluid ">
                        Actividad:<br />
                        <asp:DropDownList ID="DropDownList2" runat="server"
                            Width="50%"
                            DataTextField="nombre_actividad"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                            DataValueField="nombre_actividad">
                        </asp:DropDownList><br />
                        <div runat="server" id="otra">
                            Especifique:
                            <br />
                            <asp:TextBox Width="40%" ID="txtOtra" class="form-control css-input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                            <div class="col-sm-4">
                                Cantidad en pesos:<br />
                                <asp:TextBox ID="txtCantidad" class="form-control css-input" runat="server"
                                    onkeypress="return numbersonly(event)"
                                    onkeyup="myFunction()"
                                    onclick="myFunction()"
                                    AutoCompleteType="Disabled"
                                    oninput="myFunction()"                              
                                    placeholder="$$$$"
                                    autocomplete="off"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RQCantidad" runat="server"
                                    ControlToValidate="txtCantidad"
                                    ErrorMessage="Ingrese Cantidad"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator><br />
                                Vehículo:<br />
                                <asp:TextBox ID="txtVehiculo" class="form-control css-input" ReadOnly="true" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-sm-4">
                                Oficial/Propio:<br />
                                <asp:TextBox ID="txtOficial" class="form-control css-input" ReadOnly="true" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtOficial"
                                    ErrorMessage="Elija Persona"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                                Cilindraje:<br />
                                <asp:TextBox ID="txtCilindraje" class="form-control css-input" ReadOnly="true" runat="server"></asp:TextBox>
                                <br />
                            </div>
                            <div class="col-sm-4">
                                Rendimiento
                                <br />
                                <asp:TextBox ID="txtRendimiento" onfocus="cleck()" onfocusout="clock()" class="form-control css-input" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtRendimiento"
                                    ErrorMessage="Favor de volver a elegir una cantidad"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div> 

                        </div>

                           
                       

                        </div>
                    </div>
                   


                    <br />
                </div>
                <div style="text-align: center">
                    <asp:Button ID="Buttona" Text="Guardar" runat="server" class="boton-azo" OnClick="Button_Click" />
                </div>
            </div>

        </div>
    </div>
    <label id="lblmsg" runat="server"></label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script>
        function myFunction() {
            var a = document.getElementById("<%=txtCilindraje.ClientID%>").value;
            var x = document.getElementById("<%=txtCantidad.ClientID%>").value;

            var cadena = x,

                separador = "$", // un espacio en blanco
                arregloDeSubCadenas = cadena.replace(separador, "");


            document.getElementById("<%=txtCantidad.ClientID%>").value = '$' + arregloDeSubCadenas;


            var y = document.getElementById("<%=txtCantidad.ClientID%>").value; 
            var b = y.substring(1);
            if (a == 4) { document.getElementById("<%=txtRendimiento.ClientID%>").value = (b / 20 * 15) + ' km'; }
            if (a == 6) { document.getElementById("<%=txtRendimiento.ClientID%>").value = (b / 20 * 12) + ' km'; }
            if (a == 8) { document.getElementById("<%=txtRendimiento.ClientID%>").value = (b / 20 * 9) + ' km'; }
        }

    </script>
   
    <script>
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                {if (unicode != 46) { return false}} //disable key press    
            }
        }
    </script>
    <script>
        function cleck() {

            document.getElementById("<%=txtRendimiento.ClientID%>").readOnly = true;
        } 
        function clock() {
            document.getElementById("<%=txtRendimiento.ClientID%>").readOnly = false;
        }
    </script>
</asp:Content>
