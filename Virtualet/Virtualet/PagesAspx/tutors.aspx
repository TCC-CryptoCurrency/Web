<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tutors.aspx.cs" Inherits="Virtualet.PagesAspx.tutorbasic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="tutor.css"/>
    <title> Tutorial Básico - Virtua'let</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <a href="index.aspx">
            <div class="logo">
                <asp:Image ID="Image1" runat="server" ImageUrl="Images/logobranco.png" />
                <h1>Virtua'let</h1>
            </div>
            </a>
        </div>
        <div class="content_outlineR"></div>
        <div class="content_outlineR2"></div>
        <div class="content_outline"></div>
        <div class="content_outline2"></div>

        <div class="content">
            <div>
                <h1 style="text-align:center;"> Tutorial Básico </h1>
            </div>
            <div class="teste">
                 <iframe class="tutors" src="index.aspx" style="border:0" allowfullscreen="" loading="lazy">

                </iframe>

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
                            <a href="sobrenos.aspx" target="_blank" style="text-decoration: none;" > <p> Quem somos </p></a>
                            <a href="termos.aspx" target="_blank" style="text-decoration:none;"> <p> Termos de uso e politica de privacidade </p></a>
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
