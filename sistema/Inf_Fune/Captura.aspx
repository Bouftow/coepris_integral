<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Captura.aspx.cs" Inherits="_default" %>

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
        .wea td{
            border:none;
            padding-bottom:0px;
            padding-top:0px;
        }
        .wea input {
            margin-right:8px;
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
            text-align:center;
        }
        .button:active {
            background-color: #295F7F;
            box-shadow: 0 3px #666;
            transform: translateY(4px);
            text-align:center;
        }
        .calif{
            display:inline-block;
            padding:1.5px 8px;
            font-size:15px;
            text-align:center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #367FA9;
            border-radius: 3px;
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
            text-align:center;
        }
        .button_gray:active {
            background-color: #B5B8BA;
            box-shadow: 0 3px #666;
            transform: translateY(4px);
            text-align:center;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
  <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">





    <div class="card-block card">
       <div class="select" style="text-align:center">
        <%--<h1 class="g" style="font-family:3ds; text-align:center"><label>COORDINACIÓN 1 - VICTORIA</label></h1> --%>

        </div>
            <h2 class="g" style="text-align:center">CONCENTRADO DE DECESOS</h2>

        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Captura</h3>
                </div>
            </div>
            <br />
            <br />
            <div style="text-align:center">
                <a style="padding-right:50px;">Seleccionar mes:</a>
                <input type="month" class="form-control-sm" style="width: 200px" />
            </div>
            <br />
            <br />
            
            <div class="container">
                <button style="width:100%;text-align:left" type="button" class="btn button"  data-toggle="collapse" data-target="#epi">Epidemiología</button>
                <br />
                <div id="epi" class="collapse in">
                    <table class="col-12">
                        <tbody>
                            <tr>
                                <td style="height:60px"></td>
                                <td><input type="number" class="form-control" style="text-align:center"/></td>
                                <td style="text-align:center"><asp:LinkButton ID="btnGrabar"   CssClass="button_gray"  runat="server"><i class="fa fa-check"></i>&nbsp;Cargar</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br />
                <button style="width:100%;text-align:left" type="button" class="btn button" data-toggle="collapse" data-target="#RC">Registro Civil</button>
                <br />
                <div id="RC" class="collapse in">
                    <table class="col-12">
                        <tbody>
                            <tr>
                                <td style="height:60px"></td>
                                <td><input type="number" class="form-control" style="text-align:center"/></td>
                                <td style="text-align:center"><asp:LinkButton ID="LinkButton1"   CssClass="button_gray"  runat="server"><i class="fa fa-check"></i>&nbsp;Cargar</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br />
                <button style="width:100%;text-align:left" type="button" class="btn button" data-toggle="collapse" data-target="#fune">Funerarias</button>
                <br />
                <div id="fune" class="collapse in">
                    <br />
                    <table class="col-12">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Decesos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="height:60px"></td>
                                <td><input type="number" class="form-control" style="text-align:center"/></td>
                                <td style="text-align:center"><asp:LinkButton ID="LinkButton3"   CssClass="button_gray"  runat="server"><i class="fa fa-check"></i>&nbsp;Cargar</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br />
                <button style="width:100%;text-align:left" type="button" class="btn button" data-toggle="collapse" data-target="#pant">Panteones</button>
                <br />
                <div id="pant" class="collapse in">
                    <br />
                    <table class="col-12">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Decesos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="height:60px"></td>
                                <td><input type="number" class="form-control" style="text-align:center"/></td>
                                <td style="text-align:center"><asp:LinkButton ID="LinkButton4"   CssClass="button_gray"  runat="server"><i class="fa fa-check"></i>&nbsp;Cargar</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br />
                <button style="width:100%;text-align:left" type="button" class="btn button" data-toggle="collapse" data-target="#CIS">Centro Integral de Servicios</button>
                <br />
                <div id="CIS" class="collapse in">
                    <br />
                    <table class="col-12">
                        <thead>
                            <tr>
                                <th>Tramite</th>
                                <th>Cantidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="height:60px"></td>
                                <td><input type="number" class="form-control" style="text-align:center"/></td>
                                <td style="text-align:center"><asp:LinkButton ID="LinkButton5"   CssClass="button_gray"  runat="server"><i class="fa fa-check"></i>&nbsp;Cargar</asp:LinkButton></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <br />
            <br />
            <div style="text-align:end">
                <asp:LinkButton ID="LinkButton2"   CssClass="button" Style="color:#fff" runat="server"><i class="fa fa-save"></i>&nbsp;Grabar</asp:LinkButton>
            </div>
    </div>
</div>







    <p style="visibility: hidden">
        <asp:TextBox ID="id_coordinacion" runat="server" />
    </p>




</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">

    <script>


    </script>

</asp:Content>

