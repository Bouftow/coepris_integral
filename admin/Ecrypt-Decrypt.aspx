<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Ecrypt-Decrypt.aspx.cs" Inherits="admin_Ecrypt_Decrypt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">

    <asp:TextBox placeholder="Encriptar y Desencriptar" ID="txt" runat="server"></asp:TextBox>

    <asp:Button Text="Encriptar" ID="encriptar" OnClick="encriptar_Click" runat="server" CssClass="btn btn-success"/>
    <asp:Button Text="Desencriptar" ID="desencriptar" OnClick="desencriptar_Click" runat="server" CssClass="btn btn-primary" />
    
    <div style="margin:2vw">
    <asp:Label runat="server" ID="lbl" CssClass="alert alert-primary"></asp:Label>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

