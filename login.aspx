<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>


<!doctype html>
<html class="no-js" lang="en">
    <head runat="server">
        <link rel="icon" href="img/ico.png"/>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> <%=Principal.WebConfig("SYS_TITLE") %> </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <script src="js/jquery-1.11.3.min.js"></script>
        <!-- Place favicon.ico in the root directory -->
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/app-blue.css">
        <link rel="stylesheet" href="css/sitio.css">
        <!-- Theme initialization -->
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    </head>

<body>
    <form id="frmLogin" runat="server">
    <div class="auth">
        <div class="auth-container">
            <div class="card2">
                <header class="auth-header">
                    <h1 class="auth-title">
                        SECRETARÍA DE SALUD
                    </h1>
                </header>
                <div class="auth-content">
                    <p class="text-xs-center"><strong style="color:#701d39 !important;">INICIAR SESIÓN</strong></p>
                   
                        <div class="form-group">
                            <label for="username">Nombre de usuario:</label>
                            <asp:TextBox ID="txtUserLogin" autofocus="true" CssClass="form-control underlined2"  placeholder="Su nombre de usuario" required="true" runat="server" ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña:</label>
                            <asp:TextBox ID="txtUserPassword" TextMode="Password" CssClass="form-control underlined2" placeholder="Su contraseña" required="true" runat="server" ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="chkRemember">
                                <asp:CheckBox ID="chkRemember" runat="server" />
                                <span>Recordarme</span>
                            </label>
                        </div>
                        <div class="form-group">
                            <asp:LinkButton ID="btnOk" OnClick="btnOK_Click" CssClass="btn_login4t text-center" runat="server"><strong>Aceptar</strong></asp:LinkButton>
                            <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
                        </div>
                </div>
            </div>
           
        </div>
    </div>
        


    </form>
    <script type="text/javascript">
        function loginFocus() {
            var objLogin = document.getElementById("txtUserLogin");
            objLogin.focus();
        }
        $(document).keypress(function (e) { if (e.which == 13) { __doPostBack('btnOk', ''); } });
    </script>
</body>

</html>