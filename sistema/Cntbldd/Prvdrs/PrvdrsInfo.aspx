<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="PrvdrsInfo.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">


    <style>
        select {
            text-align: center;
            text-align-last: center;
            /* webkit*/
        }

        option {
            text-align: left;
            /* reset to left*/
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

        .oro {
            margin-left: 10px;
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
            $('#DropDownList1').selectmenu();


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
                <br />
                <button runat="server" onserverclick="Unnamed_ServerClick" class="newbtn"><i class="fa fa-repeat"></i>Regresar</button>
                <div class="card" runat="server">



                    <div style="text-align: center" class="select container-fluid">
                        Nombre del proveedor:<br />
                        <div class="col-sm-12 select">

                            <asp:DropDownList ID="DropDownList1" CssClass="ddl" runat="server"
                                DataTextField="nombre_proveedor"
                                AutoPostBack="True"
                                DataValueField="id_proveedor">
                            </asp:DropDownList>
                            <br />
                        </div>
                        <asp:Label Visible="false" Font-Size="X-Large" Font-Bold="true" Font-Italic="true" ID="txtnombre_proveedor" runat="server"> </asp:Label>



                    </div>

                <div class="row" style="text-align:center">
                        <div class="offset-sm-2 col-sm-4 centrar">
                            Municipio:<br />
                            <asp:Label ID="txtMunicipio" class="form-control" ReadOnly="true" runat="server"></asp:Label><br />
                        </div>
                        <div class="col-sm-3 centrar">
                            Telefono:<br />
                            <asp:Label ID="txtTelefono" class="form-control" readonly="true" runat="server"></asp:Label><br />

                        </div>
                   
                   
                        <div class="col-sm-6 centrar">
                            Dirección:<br />
                            <asp:Textbox ID="txtDireccion"  TextMode="multiline" class="form-control" ReadOnly="true" runat="server"></asp:Textbox><br />
                        </div>
                        <div class="col-sm-6 centrar">
                            Referencias:<br />
                            <asp:Textbox ID="txtReferencias" TextMode="multiline" class="form-control" ReadOnly="true" runat="server"></asp:Textbox><br />
                        </div>
                    </div>

                    <div style="text-align: center">
                        <asp:Button ID="Buttona" Text="Guardar" runat="server" class="boton-azo" />
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
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }
    </script>

</asp:Content>
