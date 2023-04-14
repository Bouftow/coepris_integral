<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="C8_jve.aspx.cs" Inherits="_default" %>

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
        <h4><asp:DropDownList ID="DropDownList1" Width="50%" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nombre_coordinacion" DataValueField="id_coordinacion" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        </h4><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCnnStr %>" SelectCommand="SELECT id_coordinacion, ('COORDINACIÓN ' + CONVERT(varchar(max),id_coordinacion) + ' '+ nombre_coordinacion) as nombre_coordinacion FROM bitaseg.Coordinaciones WHERE (id_coordinacion < 13)"></asp:SqlDataSource>
        </div>
        <h2 class="g" style="text-align:center">CONCENTRADO DE DECESOS</h2>

        <div class="card sameheight-item" data-exclude="xs">
            <div class="card-header card-header-sm bordered">
                <div class="header-block">
                    <h3>Municipio</h3>
                </div>
                <ul class="nav nav-tabs pull-right" role="tablist">
                    <li class="nav-item"><a class="nav-link active" href="#Jve" role="tab" data-toggle="tab">Jaumave</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Tula" role="tab" data-toggle="tab">Tula</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Miq" role="tab" data-toggle="tab">Miquihuana</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Bus" role="tab" data-toggle="tab">Bustamante</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#Pal" role="tab" data-toggle="tab">Palmillas</a> </li>
                </ul>
            </div>

            <div class="card-block">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active fade show" id="Jve">
                        <h4><i>Jaumave</i></h4>
                        <br />
                        <p>Número de decesos por tipo de establecimiento:</p>
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">Epidemiología</div>
                            <div class="col-sm-3" style="text-align:center;">Hospitales</div>
                            <div class="col-sm-3" style="text-align:center;">Funerarias</div>
                            <div class="col-sm-3" style="text-align:center;">Panteones</div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-row">
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                            </div>
                    </div>
                  
                    <div role="tabpanel" class="tab-pane fade in" id="Tula"> 
                        <h4><i>Tula</i></h4>
                        <br />
                        <p>Número de decesos por tipo de establecimiento:</p>
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">Epidemiología</div>
                            <div class="col-sm-3" style="text-align:center;">Hospitales</div>
                            <div class="col-sm-3" style="text-align:center;">Funerarias</div>
                            <div class="col-sm-3" style="text-align:center;">Panteones</div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-row">
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                            </div>
                        </div>

                    <div role="tabpanel" class="tab-pane fade in" id="Miq">
                        <h4><i>Miquihuana</i></h4>
                        <br />
                        <p>Número de decesos por tipo de establecimiento:</p>
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">Epidemiología</div>
                            <div class="col-sm-3" style="text-align:center;">Hospitales</div>
                            <div class="col-sm-3" style="text-align:center;">Funerarias</div>
                            <div class="col-sm-3" style="text-align:center;">Panteones</div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-row">
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                            </div>
                    </div>

                    <div role="tabpanel" class="tab-pane fade in" id="Bus">
                        <h4><i>Bustamante</i></h4>
                        <br />
                        <p>Número de decesos por tipo de establecimiento:</p>
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">Epidemiología</div>
                            <div class="col-sm-3" style="text-align:center;">Hospitales</div>
                            <div class="col-sm-3" style="text-align:center;">Funerarias</div>
                            <div class="col-sm-3" style="text-align:center;">Panteones</div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-row">
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                            </div>
                    </div>
                    
                    <div role="tabpanel" class="tab-pane fade in" id="Pal">
                        <h4><i>Palmillas</i></h4>
                        <br />
                        <p>Número de decesos por tipo de establecimiento:</p>
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">Epidemiología</div>
                            <div class="col-sm-3" style="text-align:center;">Hospitales</div>
                            <div class="col-sm-3" style="text-align:center;">Funerarias</div>
                            <div class="col-sm-3" style="text-align:center;">Panteones</div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                            <div class="col-sm-3" style="text-align:center;">
                                <input class="form-control-lg" style="width:130px" placeholder="########" disabled="disabled"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                            <div class="col-sm-3" style="text-align: center;">
                                <input type="month" class="form-control-sm" style="width: 200px" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-row">
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                                <div class="col-sm-3" style="text-align:center">
                                    <a  class="button_gray" style="color: #000; width:130px"> <i class="fa fa-edit"></i>Modificar</a>
                                </div>
                            </div>
                    </div>

            </div>
        </div>
    </div>
</div>







    <p style="visibility: hidden">
        <asp:TextBox ID="cis" runat="server" />
        <asp:TextBox ID="ueas" runat="server" />
        <asp:TextBox ID="coor" runat="server" />
        <asp:TextBox ID="uos" runat="server" />
        <asp:TextBox ID="dictaminador" runat="server" />
        <asp:TextBox ID="dos" runat="server" />
        <asp:TextBox ID="dds" runat="server" />
        <asp:TextBox ID="deas" runat="server" />
        <asp:TextBox ID="das" runat="server" />
        <asp:TextBox ID="corr" runat="server" />
        <asp:TextBox ID="rech" runat="server" />
        <asp:TextBox ID="entr" runat="server" />
    </p>




</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">

</asp:Content>

