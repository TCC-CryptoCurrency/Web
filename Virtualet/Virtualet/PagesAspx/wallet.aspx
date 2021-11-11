<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wallet.aspx.cs" Inherits="Virtualet.PagesAspx.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
        Carteira - Virtua'let
    </title>
    <link rel="stylesheet" href="wallet.css" type="text/css"/>
    <script src="https://kit.fontawesome.com/5bf652a268.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav>
                <a class="logo" href="index.aspx"> 
                    <asp:Image ID="Image1" runat="server" ImageUrl="Images/logobranco.png" />
                </a>
                <div class="mobile-menu">
                    <div class="line1"></div>
                    <div class="line2"></div>
                    <div class="line3"></div>
                </div>
                <ul class="nav-list">
                    <li><a href="homeusuario.aspx"><i class="fas fa-home"></i> Home </a></li>
                    <li><a href=" "><i class="fas fa-user-circle"></i> Perfil </a></li>
                    <li><a href="wallet.aspx"><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href="homenoticias.aspx"><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href=" "><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="menumobile.js"></script>
            <div class="box">
               <asp:DataList ID="DtCripto"
                        RepeatDirection="Vertical"
                        RepeatLayout="Table"
                        RepeatColumns="1"
                        runat="server"
                        class="criptotable"
                        OnItemDataBound="Item_Bound"
                        >
                        <HeaderStyle BackColor="#e7ecef">
                        </HeaderStyle>
                        
                        <AlternatingItemStyle BackColor="#d2d5d9">
                        </AlternatingItemStyle>

                        <HeaderTemplate>
                                    <h2>
                                        <asp:LinkButton ID="LinkButton1" runat="server">Nome</asp:LinkButton>
                                    </h2>
                                    <h2>
                                        <asp:LinkButton ID="LinkButton2" runat="server">Saldo</asp:LinkButton>
                                    </h2>
                                    <h2>
                                        <asp:LinkButton ID="LinkButton3" runat="server">Valor atual</asp:LinkButton>
                                    </h2>
                                    <h2>
                                        Ultimas 24h
                                    </h2>
                                    <h2>
                                        Ultima atualização
                                    </h2>
                                    <h2>
                                        <asp:LinkButton ID="LinkButton5" runat="server">Variação(24h)</asp:LinkButton>
                                    </h2>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <h3>
                                       <%# DataBinder.Eval(Container.DataItem, "NomeMoeda") %>
                                    </h3>
                                    <p class="valor">
                                       <%# DataBinder.Eval(Container.DataItem, "SaldoMoeda") %>
                                    </p>
                                    <p class="valor">
                                       <%# DataBinder.Eval(Container.DataItem, "ValorMoeda", "{0:f2}") %>
                                    </p>
                                    <p class="valor">
                                       <%# DataBinder.Eval(Container.DataItem, "Valor24h", "{0:f2}") %>
                                    </p>
                                    <p class="valor">
                                       <%# DataBinder.Eval(Container.DataItem, "UltimaAtualizacao") %>
                                    </p>
                                    <asp:Label ID="varia" CssClass="pos" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VariacaoMoeda") + "%" %>'>
                                    </asp:Label>
                                    

                        </ItemTemplate>
                </asp:DataList>
                </div>
        </main>
    </form>
</body>
</html>
