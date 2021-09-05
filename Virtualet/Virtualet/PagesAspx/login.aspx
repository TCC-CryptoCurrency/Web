<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Virtualet.PagesAspx.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login - Virtua'let</title>
    <link rel="stylesheet" type="text/css" href="login.css"/>
    <script>
        function fecha() {
            var elemento = document.getElementById("fecha");
            elemento.style.display = "none"
        }

        function ToggleSenha() {
            var elemento = document.getElementById("txtSenha");

            if (elemento.type === "text") {
                elemento.type = "password";
            }
            else {
                elemento.type = "text";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
            <div class="tip" id="fecha">
                <div class="btnfecha" onclick="fecha()">
                    <div>
                    </div>
                </div>
                <div class="texto">
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/icone1.png"/>
                        <h1>
                            Conecte a sua conta no seu celular
                        </h1>
                        <p>
                            Tenha mais segurança e um acesso mais fácil para a plataforma
                        </p>
                        <asp:Button ID="Button1" runat="server" Text="Baixar agora" CssClass="btnBaixar" />
                </div>
            </div>
            <div class="screen">
                <div class="loginwin">
                    <h1>
                        Login
                    </h1>
                    <h2>
                        Código da carteira
                    </h2>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="txt"></asp:TextBox>
                    <br/>
                    <br/>
                    <h2>
                        Senha
                    </h2>
                    <div class="alignbtn">
                        <asp:TextBox ID="txtSenha" runat="server" CssClass="txt" type="password"></asp:TextBox>
                        <div class="btnToggleSenha" onclick="ToggleSenha()">
                            <img src="Images/olho.png"/>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <asp:Button ID="btnLogin" runat="server" Text="Fazer login" CssClass="botaologin" OnClick="btnLogin_Click" />

                    <asp:Label ID="lblMsg" runat="server" Text=" " CssClass="erro"></asp:Label>
                    
                    <br/><br/><br/>
                    
                    <p>
                        <a href="index.aspx">Esqueceu a senha?</a>
                    </p>

                    <p>
                        Não possui uma conta? <a href="cadastro.aspx">Cadastre-se.</a>
                    </p>


                </div>
            </div>
        </div>
    </form>
</body>
</html>
