<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresarPedido.aspx.cs" Inherits="Sandwicheria3.IngresarPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="img/8.png">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleSheet3.css" rel="stylesheet" />
    <title>Ingresar Pedido</title>
    <style type="text/css">
        .gridclass {}
    </style>
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
           <h1>Ingresar Pedidos</h1>

            <!--Cierre de Sesion-->
            <div class="cerrarsesion">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" ForeColor="White" align="right">Cerrar Sesion</asp:HyperLink>
            </div>
            
            <br />
            
            <!--Sub-Titulo-->
            <h2>Datos del Pedido</h2>
            
            <!--Label Sandwich + DropDownList1-->
            <asp:Label ID="Label1" runat="server" Text="Sandwich:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre_ti" DataValueField="nombre_ti">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sandwicheriaConnectionString %>" SelectCommand="SELECT [nombre_ti] FROM [productos]"></asp:SqlDataSource>
            
            <br />
            <br />

            <!--Label Agregado + DropDownList2-->
            <asp:Label ID="Label2" runat="server" Text="Agregado:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre_ag" DataValueField="nombre_ag">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sandwicheriaConnectionString %>" SelectCommand="SELECT [nombre_ag] FROM [agregados]"></asp:SqlDataSource>
            
            <br />
            <br />

            <!--Label Cantidad + TextBox1-->
            <asp:Label ID="Label3" runat="server" Text="Cantidad:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            <br />
            <br />
            
            <!--Boton Agregar-->
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="btnagregar" runat="server" Text="Agregar" OnClick="btnagregar_Click"/>
            
            <br />
            <br />

            <br />
                        <asp:GridView ID="GridView1" runat="server" CellPadding="8" ForeColor="#333333" GridLines="None" CssClass="gridclass" Font-Size="10pt" Height="88px" HorizontalAlign="Center" Width="291px">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <EmptyDataRowStyle ForeColor="#009933" />
                            <EmptyDataTemplate>
                                <asp:Label ID="Label10" runat="server" Font-Names="Cooper Black" ForeColor="White" Text="Ingrese Algun Sandwich para mostrar"></asp:Label>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                <!--Termino Tabla-->

            <br />
            <br />

            <!--label7 and 4 ("Total" and "0") + Label5 Respectivos valores-->
            <asp:Label ID="Label7" runat="server" Text="Total: "></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="0"></asp:Label>
                        &nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Label ID="Label5" runat="server" Text="(Cada Sandwich $800 y cada agregado $200)."></asp:Label>

            <br />
            <br />

            <!--Sub-Titulo-->
            <h2>Datos de Entrega</h2>

            <br />

            <!--Label6 Nombre Cliente + TextBox2 "Nombre del Cliente"-->
            <asp:Label ID="Label6" runat="server" Text="Nombre Cliente: "></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

            <br />
            <br />

            <!--Label8 Direccion + TextBox3 con MultiLine-->
            <asp:Label ID="Label8" runat="server" Text="Direccion: "></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Height="38px" Width="327px"></asp:TextBox>

            <br />
            <br />

            <!--Label9 Telefono + TextBox4 donde ingresamos numero de telefono-->
            <asp:Label ID="Label9" runat="server" Text="Telefono: "></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

            <br />
            <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="Button1" runat="server" Text="Ingresar" BackColor="#FF33CC" Height="53px" OnClick="Button1_Click" Width="106px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" BackColor="#6600FF" Height="53px" Text="Borrar" Width="108px" OnClick="Button2_Click" />
            <br />
            <br />
         
        <!--Cierre div1-->
        </div>
    
    <!--Cierre Form-->
    </form>

</body>
</html>
