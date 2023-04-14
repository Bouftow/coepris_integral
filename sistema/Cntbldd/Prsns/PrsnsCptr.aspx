<%@ Page Title="" Language="C#" MasterPageFile="../../../main.master" AutoEventWireup="true" CodeFile="PrsnsCptr.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../../js/jquery-1.11.3.min.js"></script>
    <script src="../../js/jquery-ui-1.12.1.js"></script>
    <script src="../../js/jquery-ui.min-1.12.1.js"></script>


    <script src="../../js/plugins/sortable.js" type="text/javascript"></script>
    <script src="../../js/fileinput.js" type="text/javascript"></script>
    <script src="../../js/locales/fr.js" type="text/javascript"></script>
    <script src="../../js/locales/es.js" type="text/javascript"></script>
    <script src="../../themes/fas/theme.js" type="text/javascript"></script>

    <script src="../../themes/explorer-fas/theme.js" type="text/javascript"></script>
    <link href="../../js/jquery-ui.css" rel="stylesheet" />


    <link href="../../themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css" />
    <%--<link href="css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.css" />
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">--%>
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">--%>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <link href="../../css/sitio.css" rel="stylesheet" />

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

                <div class="card" runat="server">
                    <div class="select container-fluid">
                        <br />
                          
                        <div class="row col-sm-6" >
                            <h3 style="margin-left:5%">Fecha de Entrega:</h3>
                            
                                <div style="padding-left: 85px">
                                    <asp:TextBox ToolTip="Año/Mes/Día" CssClass="oro" ID="Fecha1" runat="server" Width="100px"></asp:TextBox>
                                </div>

                                <asp:Calendar ID="Calendar1" runat="server"
                                    OnSelectionChanged="Selection_Change">
                                    <SelectedDayStyle BackColor="#b0e5fb"
                                        ForeColor="black"></SelectedDayStyle>
                                </asp:Calendar>
                        </div>
                        <div class="row col-sm-6">
                             <asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource1" Width="80%"
                                DataTextField="nombre_coordinacion"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnDataBound="DropDownList1_DataBound"
                                DataValueField="id_coordinacion">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbCnnStr %>"
                                SelectCommand="SELECT top 13 nombre_coordinacion, id_coordinacion FROM bitaseg.Coordinaciones"></asp:SqlDataSource>

                        </div>
                    </div>


                    <br />

                    <label id="lblmsg" runat="server"></label>


                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
</asp:Content>
