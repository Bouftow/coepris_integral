<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Reportes.aspx.cs" Inherits="_default" %>

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
                    <h3>Municipio</h3>
                </div>
                <ul id="tabs" class="nav nav-tabs pull-right" role="tablist">
                    <li runat="server" id="victoria" class="nav-item"><a class="nav-link active" href="#Vic" role="tab" data-toggle="tab">Victoria</a> </li>
                    <li runat="server" id="casas" class="nav-item"><a class="nav-link" href="#Casas" role="tab" data-toggle="tab">Casas</a> </li>
                    <li runat="server" id="guemez" class="nav-item"><a class="nav-link" href="#Guemez" role="tab" data-toggle="tab">Güemez</a> </li>
                    <li runat="server" id="llera" class="nav-item"><a class="nav-link" href="#Llera" role="tab" data-toggle="tab">Llera</a> </li>
                    <li runat="server" id="hidalgo" class="nav-item"><a class="nav-link" href="#Hgo" role="tab" data-toggle="tab">Hidalgo</a> </li>
                    <li runat="server" id="villagran" class="nav-item"><a class="nav-link" href="#Villagran" role="tab" data-toggle="tab">Villagrán</a> </li>
                    <li runat="server" id="mainero" class="nav-item"><a class="nav-link" href="#Mainero" role="tab" data-toggle="tab">Mainero</a> </li>

                    <li runat="server" id="tampico" class="nav-item"><a class="nav-link" href="#Tam" role="tab" data-toggle="tab">Tampico</a> </li>
                    <li runat="server" id="madero" class="nav-item"><a class="nav-link" href="#Mad" role="tab" data-toggle="tab">Madero</a> </li>

                    <li runat="server" id="matamoros" class="nav-item"><a class="nav-link" href="#Mat" role="tab" data-toggle="tab">Matamoros</a> </li>

                    <li runat="server" id="reynosa" class="nav-item"><a class="nav-link" href="#Rey" role="tab" data-toggle="tab">Reynosa</a> </li>

                    <li runat="server" id="nuevo_laredo" class="nav-item"><a class="nav-link" href="#Nldo" role="tab" data-toggle="tab">Nuevo Laredo</a> </li>

                    <li runat="server" id="mante" class="nav-item"><a class="nav-link" href="#Man" role="tab" data-toggle="tab">Mante</a> </li>
                    <li runat="server" id="nuevo_morelos" class="nav-item"><a class="nav-link" href="#Nvo" role="tab" data-toggle="tab">Nuevo Morelos</a> </li>
                    <li runat="server" id="antiguo_morelos" class="nav-item"><a class="nav-link" href="#Ant" role="tab" data-toggle="tab">Antiguo Morelos</a> </li>
                    <li runat="server" id="ocampo" class="nav-item"><a class="nav-link" href="#Ocampo" role="tab" data-toggle="tab">Ocampo</a> </li>
                    <li runat="server" id="xico" class="nav-item"><a class="nav-link" href="#Xico" role="tab" data-toggle="tab">Xicoténcatl</a> </li>
                    <li runat="server" id="gomez_farias" class="nav-item"><a class="nav-link" href="#GomFar" role="tab" data-toggle="tab">Gómez Farías</a> </li>

                    <li runat="server" id="burgos" class="nav-item"><a class="nav-link" href="#Burg" role="tab" data-toggle="tab">Burgos</a> </li>
                    <li runat="server" id="cruillas" class="nav-item"><a class="nav-link" href="#Cru" role="tab" data-toggle="tab">Cruillas</a> </li>
                    <li runat="server" id="mendez" class="nav-item"><a class="nav-link" href="#Men" role="tab" data-toggle="tab">Méndez</a> </li>
                    <li runat="server" id="sanfer" class="nav-item"><a class="nav-link" href="#Sanfer" role="tab" data-toggle="tab">San Fernando</a> </li>

                    <li runat="server" id="jaumave" class="nav-item"><a class="nav-link" href="#Jve" role="tab" data-toggle="tab">Jaumave</a> </li>
                    <li runat="server" id="tula" class="nav-item"><a class="nav-link" href="#Tula" role="tab" data-toggle="tab">Tula</a> </li>
                    <li runat="server" id="miquihuana" class="nav-item"><a class="nav-link" href="#Miq" role="tab" data-toggle="tab">Miquihuana</a> </li>
                    <li runat="server" id="bustamante" class="nav-item"><a class="nav-link" href="#Bus" role="tab" data-toggle="tab">Bustamante</a> </li>
                    <li runat="server" id="palmillas" class="nav-item"><a class="nav-link" href="#Pal" role="tab" data-toggle="tab">Palmillas</a> </li>

                    <li runat="server" id="guerrero" class="nav-item"><a class="nav-link" href="#Gue" role="tab" data-toggle="tab">Guerrero</a> </li>
                    <li runat="server" id="miguel_aleman" class="nav-item"><a class="nav-link" href="#Malm" role="tab" data-toggle="tab">Miguel Alemán</a> </li>
                    <li runat="server" id="mier" class="nav-item"><a class="nav-link" href="#Mier" role="tab" data-toggle="tab">Mier</a> </li>
                    <li runat="server" id="camargo" class="nav-item"><a class="nav-link" href="#Cam" role="tab" data-toggle="tab">Camargo</a> </li>
                    <li runat="server" id="diaz_ordaz" class="nav-item"><a class="nav-link" href="#GDO" role="tab" data-toggle="tab">Gustavo Díaz Ordaz</a> </li>

                    <li runat="server" id="valle_hermoso" class="nav-item"><a class="nav-link" href="#Vher" role="tab" data-toggle="tab">Valle Hermoso</a> </li>
                    <li runat="server" id="rio_bravo" class="nav-item"><a class="nav-link" href="#RBvo" role="tab" data-toggle="tab">Río Bravo</a> </li>

                    <li runat="server" id="san_nicolas" class="nav-item"><a class="nav-link" href="#SNic" role="tab" data-toggle="tab">San Nicolás</a> </li>
                    <li runat="server" id="san_carlos" class="nav-item"><a class="nav-link" href="#SCar" role="tab" data-toggle="tab">San Carlos</a> </li>
                    <li runat="server" id="jimenez" class="nav-item"><a class="nav-link" href="#Jim" role="tab" data-toggle="tab">Jiménez</a> </li>
                    <li runat="server" id="abasolo" class="nav-item"><a class="nav-link" href="#Abs" role="tab" data-toggle="tab">Abasolo</a> </li>
                    <li runat="server" id="sotolamarina" class="nav-item"><a class="nav-link" href="#SLM" role="tab" data-toggle="tab">Soto la Marina</a> </li>
                    <li runat="server" id="padilla" class="nav-item"><a class="nav-link" href="#Pad" role="tab" data-toggle="tab">Padilla</a> </li>

                    <li runat="server" id="altamira" class="nav-item"><a class="nav-link" href="#Alt" role="tab" data-toggle="tab">Altamira</a> </li>
                    <li runat="server" id="aldama" class="nav-item"><a class="nav-link" href="#Ald" role="tab" data-toggle="tab">Aldama</a> </li>
                    <li runat="server" id="gonzalez" class="nav-item"><a class="nav-link" href="#Glz" role="tab" data-toggle="tab">González</a> </li>
                    
                </ul>
            </div>

            <div class="card-block">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in" id="Vic">
                        <h4><i>Victoria</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Casas"> 
                        <h4><i>Casas</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Guemez">
                        <h4><i>Güemez</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Llera">
                        <h4><i>Llera</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Hgo">
                        <h4><i>Hidalgo</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Villagran">
                        <h4><i>Villagrán</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Mainero">
                        <h4><i>Mainero</i></h4>
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

                    <div role="tabpanel" class="tab-pane fade in" id="Tam">
                        <h4><i>Tampico</i></h4>
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
                    <div role="tabpanel" class="tab-pane fade in" id="Mad"> 
                        <h4><i>Madero</i></h4>
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
        <asp:TextBox ID="id_coordinacion" runat="server" />
    </p>




</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">

    <script>

        var coord = document.getElementById("<%=id_coordinacion.ClientID%>").value;

        switch (coord) {
            case 1:
                $('#tabs a[href="#Vic"]').tab('show');
                break;
            case 2:
                $('#tabs a[href="#Tam"]').tab('show');
                $('#tabs a[href="#Vic"]').tab('hide');
                break;
            default:
                break;

        }
        

    </script>

</asp:Content>

