<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Cat-dec-lista.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .estil {
            overflow-y: scroll;
            overflow-x: scroll;
        }


        .FixedHeader {
            position: absolute;
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
        }

        .button:active {
            background-color: #295F7F;
            box-shadow: 0 3px #666;
            transform: translateY(4px);
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
        }

        .button_gray:active {
            background-color: #B5B8BA;
            box-shadow: 0 3px #666;
            transform: translateY(4px);
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Users.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
   
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-clipboard"></i>&nbsp;Editar Catalogos de Decesos</h3>
            <hr />
            <div style="text-align: end">
                <a href="../admin_OS/default.aspx" class="button_gray" style="color:#000"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
                <a class="button" style="color:#fff" href="Cat-dec-item.aspx?id=<%=Server.UrlEncode("ti0i8u6Oh+l2RKo9llO2UQ==") %>"><i class="fa fa-plus"></i>&nbsp;Nuevo Establecimiento</a>
            </div>       
        </div>
    </div>

    <br />
    
    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">

                <div class="header-block col-sm-12 row">
                    <div class="col-sm-3"><h4>Jurisdicción:</h4></div>

                    <div class="col-sm-8">
                    <select id="txtJurs" class="form-control" runat="server">
                        <option value="selected">Elegir Jurisdicción...</option>
                        <option value="1">Victoria</option>
                        <option value="2">Tampico</option>
                        <option value="3">Matamoros</option>
                        <option value="4">Reynosa</option>
                        <option value="5">Nuevo Laredo</option>
                        <option value="6">Mante</option>
                        <option value="7">San Fernando</option>
                        <option value="8">Jaumave</option>
                        <option value="9">Miguel Alemán</option>
                        <option value="10">Valle Hermoso</option>
                        <option value="11">Padilla</option>
                        <option value="12">Altamira</option>
                    </select>
                        </div>
                </div>

            </div>
        </div>

     </div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
     
</asp:Content>

