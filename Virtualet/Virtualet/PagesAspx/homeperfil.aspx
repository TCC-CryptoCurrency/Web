<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homeperfil.aspx.cs" Inherits="Virtualet.PagesAspx.homeperfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Perfil - Virtua'let </title>
    <link rel="stylesheet" href="homeperfil.css" type="text/css"/>
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
                    <li><a href="homeperfil.aspx"><i class="fas fa-user-circle"></i> Perfil </a></li>
                    <li><a href="wallet.aspx"><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href="homenoticias.aspx"><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href="homecriptos.aspx"><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="menumobile.js"></script>
            <div class="title">
                <h1> Seus Dados </h1>
            </div>
            <div class="box">
                <div class="dados">
                    <div class="labels">
                        <asp:Label ID="lblNome" runat="server" Text="Nome:" CssClass="lbl"></asp:Label>  <br /> 
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="lbl"></asp:Label> <br /> 
                        <asp:Label ID="lblData" runat="server" Text="Data de Nascimento:" CssClass="lbl"></asp:Label> <br /> 
                        <asp:Label ID="lblCPF" runat="server" Text="CPF:" CssClass="lbl"></asp:Label> <br /> 
                        <asp:Label ID="lblSenha" runat="server" Text="Senha:" CssClass="lbl"></asp:Label> <br />  <br /> <br />
                        <button id="show-or-hide" onclick="togglediv()"> Alterar Dados</button>

                    </div>
                    <div class="datacase">
                        <asp:Label ID="lblNomeEdit" runat="server" Text="Nome:" CssClass="lbl"></asp:Label>  <br /> 
                        <asp:Label ID="lblEmailEdit" runat="server" Text="Email:" CssClass="lbl"></asp:Label> <br /> 
                        <asp:Label ID="lblDataEdit" runat="server" Text="Data de Nascimento:" CssClass="lbl"></asp:Label> <br /> 
                        <asp:Label ID="lblCPFEdit" runat="server" Text="CPF:" CssClass="lbl"></asp:Label> <br /> 
                        <asp:Label ID="lblSenhaEdit" runat="server" Text="Senha:" CssClass="lbl"></asp:Label> <br />  <br /> <br />
                        <asp:Button ID="btnAlterar" runat="server" Text="Salvar" /><br />
                    </div>   
                </div>
                <div class="preferida">
                    <img src=" "/> <br /> <br />
                    <asp:Label ID="lblMoeda" runat="server" Text="Moeda Preferida"></asp:Label>
                </div>
            </div>
        </main>
        </div>
    </form>
</body>
</html>
