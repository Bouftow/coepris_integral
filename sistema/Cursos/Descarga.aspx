<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Descarga.aspx.cs" Inherits="sistema_Cursos_Descarga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("admin.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="title"><i class="fa fa-download"></i>&nbsp;Descarga. Cursos buenas prácticas
            </h3><a href="default.aspx" class="btn btn-secondary"><i class="fa fa-chevron-left"></i>&nbsp;Regresar</a>
            <hr />
             
        </div>
    </div>

    <div class="card card-block">
      
       
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

