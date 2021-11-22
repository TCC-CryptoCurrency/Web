<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homeperfil.aspx.cs" Inherits="Virtualet.PagesAspx.homeperfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Perfil - Virtua'let </title>
    <link rel="stylesheet" href="homeperfil.css" type="text/css"/>
    <script src="https://kit.fontawesome.com/5bf652a268.js" crossorigin="anonymous"></script>
      <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
      </script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.js"></script>
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
                        <asp:Label ID="lblNome" runat="server" Text="Nome:" CssClass="lbl col"></asp:Label>  <br /> 
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="lbl col"></asp:Label> <br /> 
                        <asp:Label ID="lblData" runat="server" Text="Data de Nascimento:" CssClass="lbl col"></asp:Label> <br /> 
                        <asp:Label ID="lblCPF" runat="server" Text="CPF:" CssClass="lbl col"></asp:Label> <br /> 
                        <asp:Label ID="lblSenha" runat="server" Text="Senha:" CssClass="lbl col"></asp:Label> <br />  <br /> <br />
                        <asp:Button ID="btnAlterar" CssClass="botao" runat="server" OnClick="btnAlterar_Click" Text="Alterar dados" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CssClass="botao hide" />

                    </div>
                    <div class="datacase">
                        <asp:Label ID="lblNomeEdit" runat="server" Text="Nome" CssClass="lbl"></asp:Label> <asp:TextBox ID="txtNomeEdit" CssClass="textbox hide" runat="server"></asp:TextBox> <br /> 
                        <asp:Label ID="lblEmailEdit" runat="server" Text="Email:" CssClass="lbl"></asp:Label> <asp:TextBox ID="txtEmailEdit" CssClass="textbox hide" runat="server"></asp:TextBox> <br /> 
                        <asp:Label ID="lblDataEdit" runat="server" Text="Data de Nascimento:" CssClass="lbl"></asp:Label> <asp:TextBox ID="txtDataEdit" CssClass="textbox hide" runat="server"></asp:TextBox> <br /> 
                        <asp:Label ID="lblCPFEdit" runat="server" Text="CPF:" CssClass="lbl"></asp:Label> <asp:TextBox ID="txtCPFEdit" CssClass="textbox hide" ClientIDMode="static" runat="server"></asp:TextBox><br /> 
                        <asp:Label ID="lblSenhaEdit" runat="server" Text="Senha:" CssClass="lbl"></asp:Label> <asp:TextBox ID="txtSenhaEdit" CssClass="textbox hide" runat="server"></asp:TextBox> <br />  <br /> <br />
                        <asp:Button ID="btnSalvar" CssClass="botao hide" OnClick="btnSalvar_Click" runat="server" Text="Salvar" /><br />
                    </div>   
                        <script type="text/javascript">
                            $(document).ready(function ($) {
                                $('#txtCPFEdit').mask('999.999.999-99')
                            });
                        </script>
                </div>
                <div class="preferida">
                    <img src="Images/iconeperfil.png" class="imagemicone"/> <br /> <br />
                    <asp:Label ID="lblMoeda" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </main>
        </div>
    </form>
</body>
</html>
