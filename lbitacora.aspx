<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lbitacora.aspx.cs" Inherits="ListaSolicitudes" %>

<!DOCTYPE html>
<style>


    body {
        background-image: url(http://localhost/BitacoradeSeguimiento/img/Fondoz.png);
        background-repeat: repeat;
    }
    .center-pills {  display: flex;
    justify-content: center; }

</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="refresh" content="30"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
       <title>Lista de trámites.</title>
    <%--<script src="http://code.jquery.com/jquery-1.10.2.js"></script>--%>
   <%-- <link href="css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="js/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
    <link href="../themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/plugins/sortable.js" type="text/javascript"></script>
    <script src="../js/fileinput.js" type="text/javascript"></script>
    <script src="../js/locales/fr.js" type="text/javascript"></script>
    <script src="../js/locales/es.js" type="text/javascript"></script>
    <script src="../themes/fas/theme.js" type="text/javascript"></script>
    <script src="../themes/explorer-fas/theme.js" type="text/javascript"></script>
    <link href="../css/ListaSol.css" rel="stylesheet" />

</head>

<body>




    <form id="frmListaTramites" runat="server" class="container-fluid " >
        <a class="<%=String.Format("{0}", Convert.ToBoolean(cis.Text) ?"":"kv-hidden") %>" style=" font-family: Arial; font-weight: bold; font-style: italic; color: white;" href="CapturaTramites.aspx?id=0&s=<%=Session.SessionID%>">Capturar Nuevo Trámite</a>
        <br class="<%=String.Format("{0}", Convert.ToBoolean(cis.Text) ?"":"kv-hidden") %>"/>
        <a style="font-family: Arial; font-weight: bold; font-style: italic; color: white;" href="lBusqueda.aspx">Busqueda</a>
        
        <br />
        <%
//Tramites tramite = new Tramites();
            %>
        <ul class="nav nav-pills center-pills" style="text-align:center;  margin: auto; padding-left: 9%">

            <li class="nav-item  <%=String.Format("{0}", Convert.ToBoolean(cis.Text) ?"":"kv-hidden") %>">
                <a class="nav-link" style="color: white; margin-left: 15px" data-toggle="pill" href="#CIS">CIS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(ueas.Text) ?"":"kv-hidden") %>">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#UEAS">UEAS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(coor.Text)?"":"kv-hidden") %>">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#COORDINACION">Coordinación</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(uos.Text)?"":"kv-hidden") %>">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#UOS">UOS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(dictaminador.Text)?"":"kv-hidden") %>">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#DICTAMINADOR">Dictaminador</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(dds.Text)?"":"kv-hidden") %>">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#DDS">DDS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}",Convert.ToBoolean(dos.Text)?"":"kv-hidden") %>"">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#DOS">DOS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(deas.Text)?"":"kv-hidden") %>"">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#DEAS">DEAS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(das.Text)?"":"kv-hidden") %>"">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#DAS">DAS</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(corr.Text)?"":"kv-hidden") %>"">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#CORRESPONDENCIA">Correspondencia</a>
            </li>
            <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(rech.Text)?"":"kv-hidden") %>"">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#CANCELADOS">Rechazados</a>
            </li>
             <li class="nav-item <%=String.Format("{0}", Convert.ToBoolean(entr.Text)?"":"kv-hidden") %>"">
                <a class="nav-link" style="color: white;" data-toggle="pill" href="#ENTREGADOS">Entregados</a>
            </li>
        </ul>




        <div class="tab-content text-center">


            <div class="tab-pane container col-sm-12" id="CIS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Centro Integral de Servicios</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidos</div>

                <asp:GridView ID="grdCIS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'EditarBitacora.aspx?id={0}'>Editar</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />



                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Listos para Notificar/Entregar</div>

                <asp:GridView ID="grdCIScor"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'CIS.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />



                    </Columns>

                </asp:GridView>

                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Capturados</div>
                <asp:GridView ID="grdCISH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'VerDatos.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy }" />



                    </Columns>

                </asp:GridView>
            </div>




            <div class="tab-pane container fade col-sm-12" id="UEAS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Unidad de Evaluación y Autorización Sanitaria</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidos para Evaluar</div>
                <asp:GridView ID="grdUEAS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'UEAS.aspx?id={0}'>Evaluar</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdUEASH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>














            <div class="tab-pane container fade col-sm-12" id="COORDINACION">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Coordinación</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidos</div>
                <asp:GridView ID="grdCOOR"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'Coordinacion.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdCOORH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>












            <div class="tab-pane container fade col-sm-12" id="UOS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Unidad de Operación Sanitaria</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Pendientes de verificar</div>
                <asp:GridView ID="grdUOS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'UOS.aspx?id={0}'>Evaluar</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdUOSH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="DICTAMINADOR">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Dictaminador</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Pendientes de Dictaminar</div>
                <asp:GridView ID="grdDictamen"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'Dictamen.aspx?id={0}'>Evaluar</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdDictamenH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="DDS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Departamento de Dictamen Sanitario</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidas</div>
                <asp:GridView ID="grdDDS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'DDS.aspx?id={0}'>Evaluar</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdDDSH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="DOS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Dirección de Operación Sanitaria</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidas</div>
                <asp:GridView ID="grdDOS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'DOS.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdDOSH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="DEAS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Dirección de Evaluación y Autorización Sanitaria</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidas</div>
                <asp:GridView ID="grdDEAS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'DEAS.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdDEASH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="DAS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Departamento Autorización Sanitaria</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidas</div>
                <asp:GridView ID="grdDAS"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'DAS.aspx?id={0}'>Evaluar</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdDASH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="CORRESPONDENCIA">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Correspondencia</div>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Recibidas</div>
                <asp:GridView ID="grdCORR"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'Correspondencia.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
                <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="grdCORRH"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>
            </div>
            <div class="tab-pane container fade col-sm-12" id="CANCELADOS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Rechazados</div>

                <asp:GridView ID="grdCancelados"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'VerDatos.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                       <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>


                    </Columns>

                </asp:GridView>
                </div>
                 <div class="tab-pane container fade col-sm-12" id="ENTREGADOS">
                <div class="input btn-success" style="width: 100%; padding: 10px; font-size: 18px; font-family: Arial; font-weight: 600; border: 2px solid green; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Entregados</div>

                <asp:GridView ID="grdEntregados"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>


                        <asp:TemplateField>
                            <ItemTemplate>


                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'VerDatos.aspx?id={0}'>Ver Datos</a>", Eval("folio")) %>
                                </button>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Estado Actual" DataField="statos" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <%--<asp:BoundField HeaderText="Fecha de Última Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>
                       <%-- <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />--%>


                    </Columns>

                </asp:GridView>
                     </div>
   <%--             <div class="input btn-info" style="width: 100%; padding: 5px; font-family: Arial; font-weight: 600; border: 2px solid #3a8a9e; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 10px;">Evaluados</div>
                <asp:GridView ID="GridView2"
                    AutoGenerateColumns="false"
                    runat="server"
                    GridLines="None"
                    CssClass="table table-bordered"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    PageSize="7"
                    Style="background: white;">


                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <button type="submit" class="Editar">
                                    <%#String.Format("<a class='btn' href= 'lBusqueda.aspx?id={0}'>Ver Histórico</a>", Eval("folio")) %>
                                </button>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>


                            <ItemTemplate>
                                <%#String.Format("{0}", Funciones.LSCMGcerosizq(Convert.ToInt32( Eval("folio")))) %>
                            </ItemTemplate>

                            <HeaderTemplate>Folio</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Razón Social" DataField="razonsocial" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha de Actualización" DataField="fecha_act_status" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        <asp:BoundField HeaderText="Estado Puesto" DataField="estatus_puesto" ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Fecha Límite del trámite" DataField="fecha_lim" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />


                    </Columns>

                </asp:GridView>--%>
            </div>

        <p style="visibility: hidden">
         <asp:TextBox id="cis" runat="server"/>
         <asp:TextBox id="ueas" runat="server"/>
         <asp:TextBox id="coor" runat="server"/>
         <asp:TextBox id="uos" runat="server"/>
         <asp:TextBox id="dictaminador" runat="server"/>
         <asp:TextBox id="dos" runat="server"/>
         <asp:TextBox id="dds" runat="server"/>
         <asp:TextBox id="deas" runat="server"/>
         <asp:TextBox id="das" runat="server"/>
         <asp:TextBox id="corr" runat="server"/>
         <asp:TextBox id="rech" runat="server"/>
         <asp:TextBox id="entr" runat="server"/>
           </p> 
       
    </form>
</body>
    
<%--      <script type="text/javascript">

    var id_usuario = document.getElementById("id_usuario").value;
    var cis = document.getElementById("cis").value;
    var ueas = document.getElementById("ueas").value;
    var coor = document.getElementById("coor").value;
    var uos = document.getElementById("uos").value;
    var dictaminador = document.getElementById("dictaminador").value;
    var dos = document.getElementById("dos").value;
    var dds = document.getElementById("dds").value;
    var deas = document.getElementById("deas").value;
    var das = document.getElementById("das").value;
    var corr = document.getElementById("corr").value;
    var rech = document.getElementById("rech").value;
    var entr = document.getElementById("entr").value;
 </script>--%>
</html>
