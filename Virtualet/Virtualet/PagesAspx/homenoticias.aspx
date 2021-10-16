<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homenoticias.aspx.cs" Inherits="Virtualet.PagesAspx.homenoticias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Notícias - Virtua'let </title>
    <link rel="stylesheet" href="homenoticias.css" type="text/css"/>
    <script src="https://kit.fontawesome.com/5bf652a268.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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

            <div class="tags">
                <asp:DataList ID="dlTags" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomeTag") + "%" %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="feed">
                <asp:DataList ID="dlFeed" runat="server"></asp:DataList>
            </div>
        </main>
        </div>
    </form>
</body>
</html>
