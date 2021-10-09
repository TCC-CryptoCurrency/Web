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
                    <li><a href=" "><i class="fas fa-home"></i> Home </a></li>
                    <li><a href=" "><i class="fas fa-user-circle"></i> Perfil </a></li>
                    <li><a href=" "><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href=" "><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href=" "><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                    <li><a href=" "><i class="fas fa-exchange-alt"></i> Transações </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="menumobile.js"></script>
        </main>
    </form>
</body>
</html>
