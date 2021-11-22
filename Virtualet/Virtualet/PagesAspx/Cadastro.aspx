<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="Virtualet.PagesAspx.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="login.css"/>
    <link rel="stylesheet" type="text/css" href="cadastro.css"/>
    <title>Cadastro - Virtua'let</title>
    <script>
        function ToggleSenha() {
            var elemento = document.getElementById("txtSenha");

            if (elemento.type === "text") {
                elemento.type = "password";
            }
            else {
                elemento.type = "text";
            }
        }

        function ToggleConfirma() {
            var elemento = document.getElementById("txtConfirma");

            if (elemento.type === "text") {
                elemento.type = "password";
            }
            else {
                elemento.type = "text";
            }
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txtCPF").mask("999.999.999-99");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cadScreen">
                <div class="loginwin">
                    <h1>
                        Cadastro
                    </h1>
                    <h2>
                        Nome
                    </h2>
                    <asp:TextBox ID="txtNome" runat="server" CssClass="txt"></asp:TextBox>
                    <br/>
                    <h2>
                        Email
                    </h2>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="txt"></asp:TextBox>
                    <br/>
                    <h2>
                        Data de Nascimento (dd/mm/yyyy)
                    </h2>
                    <asp:TextBox ID="txtNascimento" runat="server" CssClass="txt"></asp:TextBox>
                    <br/>
                    <h2>
                        CPF (Somente números)
                    </h2>
                    <asp:TextBox ID="txtCPF" runat="server" ClientIDMode="static" CssClass="txt"></asp:TextBox>
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
                        <h2>
                            Confirmar a senha
                        </h2>
                    <div class="alignbtn">
                        <asp:TextBox ID="txtConfirma" runat="server" CssClass="txt" type="password"></asp:TextBox>
                        <div class="btnToggleSenha" onclick="ToggleConfirma()">
                            <img src="Images/olho.png"/>
                        </div>
                    </div>
                    <br/><br/>
                    <asp:Label ID="lblErro" runat="server" Text="" CssClass="erro"></asp:Label>
                    <br/><br/>
                    <p>
                        <asp:CheckBox ID="ckbTermos" runat="server" /> Li e concordo com os <a href="termos.aspx"> Termos e Condições de uso </a>
                    </p>
                    <asp:Button ID="btnCadastra" runat="server" Text="Cadastrar" CssClass="botaologin" OnClick="btnCadastra_Click" />
                    <br/><br/>
                </div>
        </div>
    </form>
</body>
</html>
