<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homecriptos.aspx.cs" Inherits="Virtualet.PagesAspx.homecriptos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="homecriptos.css" type="text/css" />
    <script src="https://kit.fontawesome.com/5bf652a268.js" crossorigin="anonymous"></script>

    <title> Criptomoedas - Virtua'let </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                    <li><a href="homeperfil.aspx"><i class="fas fa-user-circle"></i> Perfil </a></li>
                    <li><a href="wallet.aspx"><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href="homenoticias.aspx"><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href="homecriptos.aspx"><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="menumobile.js"></script>
            <div class="box">
                <h1 style="font-family: Ebrima; color: #fb8b24;"> Criptomoedas </h1> <br />
            <asp:DataList ID="DtCripto" 
                        onitemdatabound="DtCripto_ItemDataBound"
                        RepeatDirection="Vertical"
                        RepeatLayout="Table"
                        RepeatColumns="1"
                        runat="server"
                        class="criptotable"
                        onItemCommand="DtCripto_ItemCommand">
                        <HeaderStyle BackColor="#e7ecef">
                        </HeaderStyle>
                        
                        <AlternatingItemStyle BackColor="#d2d5d9">
                        </AlternatingItemStyle>

                        <HeaderTemplate>
                                    <h2>
                                        <asp:LinkButton ID="LinkButton2" CommandName="sort" CommandArgument="NomeMoeda ASC" runat="server" Text="Nome"></asp:LinkButton>
                                    </h2>

                                    <h2>
                                        <asp:LinkButton ID="LinkButton3" CommandName="sort"  CommandArgument="ValorMoeda ASC" runat="server" Text="Valor Atual"></asp:LinkButton>
                                    </h2>
                                    <h2>
                                        Ultimas 24h
                                    </h2>
                                    <h2>
                                        Ultima atualização
                                    </h2>
                                    <h2>
                                        <asp:LinkButton ID="LinkButton4" CommandName="sort"  CommandArgument="VariacaoMoeda ASC" runat="server" Text="Variação (24h)"></asp:LinkButton>
                                    </h2>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <!-- <asp:ImageButton ID="imbtnStar" runat="server" CssClass="btnStar" ImageUrl="Images/star.png"/> -->
                                    <h3>
                                        <asp:LinkButton ID="LinkButton1" CommandName="redirect" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomeMoeda") %>'></asp:LinkButton>
                                    </h3>
                                    <p class="valor">
                                        <%# DataBinder.Eval(Container.DataItem, "ValorMoeda", "{0:f2}") %>
                                    </p>
                                    <p class="valor">
                                        <%# DataBinder.Eval(Container.DataItem, "Valor24h", "{0:f2}") %>
                                    </p>
                                    <p class="valor">
                                        <%# DataBinder.Eval(Container.DataItem, "UltimaAtualizacao")%>
                                    </p>
                                        <asp:Label ID="varia" CssClass="pos" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VariacaoMoeda") + "%" %> '>
                                        </asp:Label>

                        </ItemTemplate>
                    </asp:DataList>
                </div>


        </main>
    </form>
</body>
</html>
