<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EnviarCorreo.aspx.cs" Inherits="sistema_Pruebas_EnviarCorreo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
      <div class="col-sm-12 text-center">
                    <div class="form-group">
                        <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
                    </div>
                </div>

    <div class="col-sm-12  text-center">
                        <asp:LinkButton ID="btnEnviar" OnClick="btnEnviar_Click" ValidationGroup="EnviarDatos" CssClass="btn btn-primary" runat="server">Confirmar pre-registro&nbsp;<i class="fa fa-check"></i></asp:LinkButton>
                    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

