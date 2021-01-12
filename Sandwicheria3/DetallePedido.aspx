<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePedido.aspx.cs" Inherits="Sandwicheria3.DetallePedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="img/8.png">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleSheet4.css" rel="stylesheet" />
    <title>Detalle Pedidos</title>
</head>
<body>
    <!--Inicio Form-->
    <form id="form1" runat="server">

        <!--img royal happy-->
        <div class="imgpanelroyalhappy" align="center">
            <img alt="" src="img/1.png" class="imgroyalhappy"/>
        </div>

        <!--inicio div1-->
        <div id="panelpedido">

            <!--Titulo-->
           <h1>Ingreso de Pedidos</h1>

            <!--Cierre de Sesion-->
            <div class="cerrarsesion">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" ForeColor="White" align="right">Cerrar Sesion</asp:HyperLink>
            </div>

            <br />
            
            <!--Inicio de tabla de Detalles de Pedidos-->
            <table>
                <tr>
                    <td>
                        <h2>Datos del Pedido</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Total: "></asp:Label><asp:Label ID="Label2" runat="server" Text="-"></asp:Label><br /><asp:Label ID="Label9" runat="server" Text="(Cada Sandwich $800 y cada agregado $200)."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>Datos Entrega</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Nombre Cliente: "></asp:Label><asp:Label ID="Label4" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Direccion: "></asp:Label><asp:Label ID="Label6" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Telefono: "></asp:Label><asp:Label ID="Label8" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Confirmar" OnClick="Button1_Click" />
                    </td>
                </tr>

            <!--Cierre de detalles de pedidos-->
            </table>

        <!--Cierre div1-->
        </div>

    <!--Cierre Form-->
    </form>
</body>
</html>
