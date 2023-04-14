<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="ComedoresEscolares_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
    
    
   <div class="container">  
            <h2>Autocomplete Texbox using JQuery Ajax with database in ASP.NET</h2>  
            <label>Country Name</label>  
            <asp:TextBox ID="txtCountry" CssClass="form-control col-md-3" runat="server"></asp:TextBox>  
        </div>  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
    <script type="text/javascript">  
        $(document).ready(function () {
            $("#<%=txtCountry.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "Default2.aspx/GetCountryNames",
                        method: "post",
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify({ term: request.term }),
                        dataType: 'json',
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (err) {
                            alert(err);
                        }
                    });
                }
            });
        });
    </script> 
</asp:Content>

