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
                    <li><a href="homeperfil.aspx"><i class="fas fa-user-circle"></i> Perfil </a></li>
                    <li><a href="wallet.aspx"><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href="homenoticias.aspx"><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href="homecriptos.aspx"><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="menumobile.js"></script>

            <div class="all">


                <div class="feed">
                    <asp:DataList ID="dlFeed" runat="server" RepeatLayout="Flow" RepeatColumns="1" RepeatDirection="Vertical" 
                        Font-Names="Ebrima" Font-Size="Small">
                        <ItemTemplate>
                            <a href='<%# DataBinder.Eval(Container.DataItem, "LinkNot") %>'>
                            <div id="pricePlans">
                                <ul id="plans">
                                    <li class="plan">
                                        <ul class="planContainer">
                                            <li class="title">
                                                <h2> <%# DataBinder.Eval(Container.DataItem, "Titulo") %> </h2>
                                            </li>
                                            <li class="title">
                                                <asp:Image ID="img1" runat="server" />
                                            </li>
                                            <li>
                                                <ul class="options">
                                                    <li><span><asp:Label ID="lblDescNot" runat="server" Text='<%#Bind("DescNot") %>'></asp:Label></span></li>
                                                    <li><span><asp:Label ID="lblDataNot" runat="server" Text='<%#Bind("DataNot") %>'></asp:Label></span></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            </a>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="tagcontent">
                    <div class="tags">
                        <h1 class="titulo">
                            Tags
                        </h1>
                        <asp:Repeater ID="rpTags" runat="server" OnItemCommand="rpTags_ItemCommand">
                            <HeaderTemplate>
                                <ol>
                                    <ul>
                                        <asp:Button ID="btnAllTags" runat="server" Text="Todas" OnClick="btnAllTags_Click"/>
                                    </ul>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <ul>
                                    <asp:Button runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tag") %>' />
                                </ul>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ol>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="interessetag">
                        <h1> Pesquisar Tag </h1>
                        <asp:TextBox ID="txtTagSearch" CssClass="txtTagSearch" runat="server"></asp:TextBox>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="rpTags_ItemCommand">
                            <HeaderTemplate>
                                <ol>
                                    <ul>
                                        <asp:Button ID="btnAllTags" runat="server" Text="Todas" OnClick="btnAllTags_Click"/>
                                    </ul>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <ul>
                                    <asp:Button runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tag") %>' />
                                </ul>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ol>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </main>
        </div>
    </form>
</body>
</html>
