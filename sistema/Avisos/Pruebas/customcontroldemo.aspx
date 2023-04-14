<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customcontroldemo.aspx.cs" Inherits="sistema_avfunc_customcontroldemo" %>


<

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >

   <head runat="server">
      <title>
         Untitled Page
      </title>
   </head>
   
   <body>
   
      <form id="form1" runat="server">
         <div>
         
            <asp:Label ID="Label1" runat="server" Text="Welcome to ASP.Net Tutorials "></asp:Label>
            <br />  <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Copyright Info" />
            
         </div>
        <%-- <uc1:footer ID="footer1" runat="server" />--%>
      </form>
      
   </body>
</html>
