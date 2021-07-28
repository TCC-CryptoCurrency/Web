<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Virtualet.PagesAspx.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Virtua'let</title>
    <link rel="stylesheet" type="text/css" href="geral.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="Images/logobranco.png" />
            <h1>Virtua'let</h1>
            </div>
        </div>
        <div class="content_outlineR"></div>
        <div class="content_outlineR2"></div>
        <div class="content_outline"></div>
        <div class="content_outline2"></div>
        <div class="content">
            <div class="cardholder">
            <h1>Crie uma conta para aproveitar de todos os nossos recursos</h1>
            </div>
            <div class="cardholder">
                <div>
                    <img src="Images/logolaranja.png"/>
                    <h1>Acessível de qualquer lugar</h1>
                    <p>Vincule sua conta com o seu celular e acesse-a de qualquer lugar</p>
                </div>
                <div>
                    <img src="Images/logolaranja.png"/>
                    <h1>Fácil para qualquer um</h1>
                    <p>Consulte tutoriais e um glossário na palma de sua mão</p>
                </div>
                <div>
                    <img src="Images/logolaranja.png"/>
                    <h1>Acesso à sua carteira</h1>
                    <p>Faça transações rapidamente de forma simples</p>
                </div>
                <div>
                    <img src="Images/logolaranja.png"/>
                    <h1>Valores atuais das moedas</h1>
                    <p>Veja o histórico de cada moeda e seu valor atualizado</p>
                </div>
                <div>
                    <img src="Images/logolaranja.png"/>
                    <h1>Seguro para o seu dinheiro</h1>
                    <p>verificação de duas etapas com o seu dispositivo móvel</p>
                </div>
            </div>
            <hr/>
            <div class="cardholder">
                <asp:Button ID="btnFazerLogin" runat="server" Text="Fazer login" CssClass="login" OnClick="btnFazerLogin_Click" />
            </div>
            <div class="cardholder">
                <h1>Preço atual das principais criptomoedas</h1>
            </div>
            <div class="cardholder">
                <div class="criptotable">
                    <asp:DataList ID="DtCripto" 
                        RepeatDirection="Vertical"
                        RepeatLayout="Table"
                        RepeatColumns="1"
                        RepeatRows="10"
                        runat="server">
                        <HeaderStyle BackColor="#e7ecef">
                        </HeaderStyle>

                        <AlternatingItemStyle BackColor="#d2d5d9">
                        </AlternatingItemStyle>

                        <HeaderTemplate>
                            <div class="DataLine">
                                <div>
                                    <h2>
                                        Nome
                                    </h2>
                                </div>
                                <div>
                                    <h2>
                                        Valor
                                    </h2>
                                </div>
                                <div>
                                    <h2>
                                        Ultimas 24h
                                    </h2>
                                </div>
                            </div>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <div class="DataLine">
                                <div>
                                    <h3>
                                        <%# DataBinder.Eval(Container.DataItem, "NomeMoeda") %>
                                    </h3>
                                </div>
                                <div>
                                    <p>
                                        $ <%# DataBinder.Eval(Container.DataItem, "ValorMoeda", "{0:c}") %>
                                    </p>
                                </div>
                                <div>
                                    <p>
                                        <%# DataBinder.Eval(Container.DataItem, "VariacaoMoeda") %> %
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>


                    </asp:DataList>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
