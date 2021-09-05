<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Virtualet.PagesAspx.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<script src="ScriptCoinVar.js">
</script>
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
                <div class="card">
                    <img src="Images/icone1.png"/>
                    <h1>Acessível de qualquer lugar</h1>
                    <p>Vincule sua conta com o seu celular e acesse-a de qualquer lugar</p>
                </div>
                <div class="card">
                    <img src="Images/icone2.png"/>
                    <h1>Fácil para qualquer um</h1>
                    <p>Consulte tutoriais e um glossário na palma de sua mão</p>
                </div>
                <div class="card">
                    <img src="Images/icone3.png"/>
                    <h1>Acesso à sua carteira</h1>
                    <p>Faça transações rapidamente de forma simples</p>
                </div>
                <div class="card">
                    <img src="Images/icone4.png"/>
                    <h1>Valores atuais das moedas</h1>
                    <p>Veja o histórico de cada moeda e seu valor atualizado</p>
                </div>
                <div class="card">
                    <img src="Images/icone5.png"/>
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
                    <asp:DataList ID="DtCripto" 
                        onitemdatabound="DtCripto_ItemDataBound"
                        RepeatDirection="Vertical"
                        RepeatLayout="Table"
                        RepeatColumns="1"
                        RepeatRows="10"
                        runat="server"
                        class="criptotable">
                        <HeaderStyle BackColor="#e7ecef">
                        </HeaderStyle>
                        
                        <AlternatingItemStyle BackColor="#d2d5d9">
                        </AlternatingItemStyle>

                        <HeaderTemplate>
                                    <h2>
                                        Nome
                                    </h2>

                                    <h2>
                                        Valor Atual
                                    </h2>
                                    <h2>
                                        Ultimas 24h
                                    </h2>
                                    <h2>
                                        Variação (24h)
                                    </h2>
                        </HeaderTemplate>
                        <ItemTemplate>
                                    <h3>
                                        <%# DataBinder.Eval(Container.DataItem, "NomeMoeda") %>
                                    </h3>
                                    <p class="valor">
                                        <%# DataBinder.Eval(Container.DataItem, "ValorMoeda", "{0:f2}") %>
                                    </p>
                                    <p class="valor">
                                        <%# DataBinder.Eval(Container.DataItem, "Valor24h", "{0:f2}") %>
                                    </p>
                                        <asp:Label ID="varia" CssClass="pos" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VariacaoMoeda") + "%" %> '>
                                        </asp:Label>
                        </ItemTemplate>
                    </asp:DataList>
            </div>
            <hr/>
            <div class="cardholder">
                <h1>
                    Não estou entendendo nada, como começar?
                </h1>
            </div>
            <div class="cardholder">
                <a href="tutors.aspx">
                    <div class="tutorCard card">
                        <img src="Images/logolaranja.png" class="tutor"/>
                        <h1>Tutorial Básico </h1>
                        <p>Entenda o básico sobre o mercado de criptoo</p>
                    </div>
                </a>
                <a href="tutorinter.aspx">
                    <div class="tutorCard card">
                        <img src="Images/logolaranja.png" class="tutor"/>
                        <h1>Tutorial Intermediário </h1>
                        <p>Entenda o básico sobre o mercado de criptooEntenda o básico sobre o mercado de criptooEntenda o básico sobre o mercado de criptooEntenda o básico sobre o mercado de criptooEntenda o básico sobre o mercado de criptoo</p>
                    </div>
                </a>
                <a href="tutoradv.aspx">
                    <div class="tutorCard card">
                        <img src="Images/logolaranja.png" class="tutor"/>
                        <h1>Tutorial Avançado </h1>
                        <p>Entenda o básico sobre o mercado de criptoo</p>
                    </div>
                </a>
                <a href="gloss.aspx">
                    <div class="tutorCard card">
                        <img src="Images/logolaranja.png" class="tutor"/>
                        <h1> Glossário </h1>
                        <p>Entenda o básico sobre o mercado de criptoo</p>
                    </div>
                </a>
            </div>
        </div>
        <div class="bottom">
           <div class="cardholder">
                <div class="bottomtitle">
                    <div>
                        <p>Virtua'let</p>
                    </div>
                    <div class="space">
                        <div>
                            <p style="font-size: 1.1vw"> Sobre nós </p>
                            <a href="sobrenos.aspx" style="text-decoration: none;" > <p> Quem somos </p></a>
                            <a href="termos.aspx" style="text-decoration:none;"> <p> Termos de uso e politica de privacidade </p></a>
                            <p style="margin-top: 15vw"> &#169 Todos os direitos reservados </p>
                        </div>
                        <div>
                            <p style="font-size: 1.1vw"> Contato </p>
                            <p> Ouvidoria: +55 (11)93013-0003 </p>
                            <p> Email: contato@virtualet.com.br </p>
                            <div class="contact">
                                <a href="https://www.instagram.com/diix_quartetodemente/" target="_blank">
                                    <img src="Images/iconig.png" class="icon" />
                                </a>
                                <a href="https://twitter.com/_DelgadoBaldo" target="_blank">
                                    <img src="Images/icontt.png" class="icon" />
                                </a>
                                <a href="https://www.facebook.com/lricardo.sp" target="_blank">
                                    <img src="Images/iconfb.png" class="icon" />
                                </a>
                            </div>
                        </div>
                        <div class="local">
                            <p style="font-size: 1.1vw"> Localização </p>
                            <p> Central de atendimento </p>
                            <p> Av. Tiradentes, 615 - São Paulo, SP</p>
                            <div>
                            <iframe class="gmap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3658.0730458911403!2d-46.634605985022745!3d-23.52987503469857!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce585f8b81eb75%3A0xb742158dee17d684!2sFATEC%20S%C3%A3o%20Paulo!5e0!3m2!1spt-BR!2sbr!4v1628689454695!5m2!1spt-BR!2sbr" 
                                style="border:0;" allowfullscreen="" loading="lazy">
                            </iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
    </form>
</body>
</html>
