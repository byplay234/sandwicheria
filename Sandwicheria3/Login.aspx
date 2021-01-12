<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sandwicheria3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="img/8.png">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title>Iniciar Sesion</title>
</head>
<body>
    <form id="form1" runat="server">
        <!--img royal happy-->
        <div class="imgpanelroyalhappy" align="center">
            <img alt="" src="img/1.png" class="imgroyalhappy"/>
        </div>

        <!--panel de iniciar sesion-->
        <div class="panel_login" align="center">
            <asp:Label ID="Label1" runat="server" Text="Autentificación" CssClass="label_titulo"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Rut Cliente:" CssClass="label_Login"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password:" CssClass="label_Login"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Ingresar" OnClick="Button1_Click" />
&nbsp;
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RecuperarClave.aspx">¿Olvido su contraseña?</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Registrarse.aspx">Registrarse</asp:HyperLink>
        </div>
        <!--cierre de panel de inicio de sesion-->
    </form>
</body>
</html>
