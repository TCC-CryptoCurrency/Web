<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homeusuario.aspx.cs" Inherits="Virtualet.PagesAspx.homeusuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
        Página Inicial - Virtua'let
    </title>
    <link rel="stylesheet" href="homeusuario.css" type="text/css"/>
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
                    <li><a href=" "><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href="homenoticias.aspx"><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href=" "><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="menumobile.js"></script>
            <div class="box">
                <asp:Label ID="lblBemVindo" runat="server" Text="Bem Vindo!" CssClass="lblBemVindo"></asp:Label>
            </div>

            <div class="box">
                <asp:DataList ID="DtCripto"
                        RepeatDirection="Vertical"
                        RepeatLayout="Table"
                        RepeatColumns="1"
                        RepeatRows="10"
                        runat="server"
                        class="criptotable" OnSelectedIndexChanged="DtCripto_SelectedIndexChanged">
                        <HeaderStyle BackColor="#e7ecef">
                        </HeaderStyle>
                        
                        <AlternatingItemStyle BackColor="#d2d5d9">
                        </AlternatingItemStyle>

                        <HeaderTemplate>
                                    <h2>
                                        Nome
                                    </h2>
                                    <h2>
                                        Saldo
                                    </h2>
                                    <h2>
                                        Valor Atual
                                    </h2>
                                    <h2>
                                        Ultimas 24h
                                    </h2>
                                    <h2>
                                        Ultima atualização
                                    </h2>
                                    <h2>
                                        Variação (24h)
                                    </h2>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <i class="fas fa-star"></i>
                                    <h3>
                                       a
                                    </h3>
                                    <p class="valor">
                                        a
                                    </p>
                                    <p class="valor">
                                        a
                                    <p class="valor">
                                        a
                                    </p>
                                    <p class="valor">
                                        a
                                    </p>
                                        <asp:Label ID="varia" CssClass="pos" runat="server" Text="a">
                                        </asp:Label>
                                    

                        </ItemTemplate>
                </asp:DataList>

            </div>

        </main>
    </form>
</body>
</html>
