<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="PrvdrsCptr.aspx.cs" Inherits="_default" %>

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

        .centrar {
            text-align: center;
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



    <script>
        $.noConflict();
        jQuery(document).ready(function ($) {

            //alert(a);

        });

    </script>


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
                                <h3 style="margin-left: 5%">Fecha de facturación:</h3>

                                <div style="padding-left: 95px">
                                    <asp:TextBox ToolTip="Año/Mes/Día" class="form-control css-input" CssClass="oro" ReadOnly="true" ID="Fecha1" runat="server" Width="100px"></asp:TextBox>
                                </div>

                                <asp:Calendar ID="Calendar1" runat="server"
                                    OnSelectionChanged="Selection_Change">
                                    <SelectedDayStyle BackColor="#b0e5fb"
                                        ForeColor="black"></SelectedDayStyle>
                                </asp:Calendar>

                                     <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="Fecha1"
                                    Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                            </div>

                            <div class="row col-sm-7">
                                <div class="col-sm-12">
                                    Nombre del proveedor:
                             <asp:DropDownList ID="DropDownList1" runat="server"
                                 Width="100%"
                                 DataTextField="nombre_proveedor"
                                 AutoPostBack="True"
                                 OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                 DataValueField="id_proveedor">
                             </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RQDropDownList1" Text="Selecione Persona" InitialValue="-1" ControlToValidate="DropDownList1" runat="server" />
                                    <br />
                                </div>

                                <div class="col-sm-9">
                                    Insumos adquiridos:<br />
                                    <asp:TextBox ID="txtInsumo" class="form-control css-input" runat="server"
                                        AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    Monto:<br />
                                    <asp:TextBox ID="txtMonto" onpaste="return false"
                                        placeholder="$$$$"
                                        oninput="myFunction();"
                                        onkeypress="return numbersonly(event)" class="form-control css-input oro" runat="server"
                                        AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
                                </div>

                                <div class="col-sm-6">
                                    Municipio:<br />
                                    <asp:TextBox ID="txtMunicipio" class="form-control css-input centrar" ReadOnly="true" runat="server"></asp:TextBox><br />
                                </div>
                                <div class="col-sm-4">
                                    Teléfono:<br />
                                    <asp:TextBox ID="txtTelefono"  TextMode="multiline"  class="form-control css-input centrar oro" OnInput="" ReadOnly="true" runat="server"></asp:TextBox><br />

                                </div>
                                <div class="col-sm-6">
                                    Dirección:<br />
                                    <asp:TextBox ID="txtDireccion" TextMode="multiline" class="form-control css-input centrar" ReadOnly="true" runat="server"></asp:TextBox><br />
                                </div>
                                <div class="col-sm-6">
                                    Referencias:<br />
                                    <asp:TextBox ID="txtReferencias" TextMode="multiline" class="form-control css-input centrar oro" ReadOnly="true" runat="server"></asp:TextBox><br />
                                </div>

                            </div>
                        </div>

                        <div style="text-align: center">
                            <asp:Button ID="Buttona" Text="Guardar" runat="server" class="boton-azo" OnClick="Button_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <label id="lblmsg" runat="server"></label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <%--  <script>
        function myFunction() { var a = document.getElementById("<%=txtCilindraje.ClientID%>").value; var b = document.getElementById("<%=txtCantidad.ClientID%>").value; if (a == 4) { document.getElementById("<%=txtRendimiento.ClientID%>").value = b / 20 * 15; } if (a == 6) { document.getElementById("<%=txtRendimiento.ClientID%>").value = b / 20 * 12; } if (a == 8) { document.getElementById("<%=txtRendimiento.ClientID%>").value = b / 20 * 9; } }
    </script>--%>

    <script>
        function myFunction() {
            var x = document.getElementById("<%=txtMonto.ClientID%>").value;

        var cadena = x,

            separador = "$", // un espacio en blanco
            arregloDeSubCadenas = cadena.replace(separador, "");


        document.getElementById("<%=txtMonto.ClientID%>").value = '$' + arregloDeSubCadenas;
        }

    </script>
    <script>
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }
    </script>

</asp:Content>
