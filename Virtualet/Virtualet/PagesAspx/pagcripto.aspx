<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagcripto.aspx.cs" Inherits="Virtualet.PagesAspx.pagcripto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://code.highcharts.com/highcharts.src.js"></script>
    <link rel="stylesheet" href="pagcripto.css" type="text/css" />
    <script src="https://kit.fontawesome.com/5bf652a268.js" crossorigin="anonymous"></script>

    <title> Moeda - Virtua'let </title>
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
                    <div class="title">
                        <asp:Button ID="btnStar" runat="server" OnClick="btnStar_Click" Text="&#9733;" CssClass="btnStar" />
                        <asp:Label ID="lblMoeda" runat="server" Text="NomeMoeda" CssClass="titulo"></asp:Label> <br /><br />
                    </div>
                    <div class="content">
                        <div>
                            <h1> Valor </h1>
                            <asp:Label ID="lblValor" runat="server" Text="ValorAtual" CssClass="labels"></asp:Label> <br /><br />
                        </div>
                        <div>
                            <h1> Última Atualização </h1>
                            <asp:Label ID="lblDataAtt" runat="server" Text="DatadeAtualização" CssClass="labels date"></asp:Label> <br /><br />
                        </div>
                    </div>
                    <div id="chart-line"></div>
                </div>

                <script type="text/javascript">
Highcharts.chart('chart-line', {

    title: {
        text: 'Variação de preço'
    },

    yAxis: {
        title: {
            text: 'Preço'
        }
    },

    xAxis: {
        categories: <%=DataRegi%>
    },

    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            }
        }
    },

    colors: ['#EF781C'],

    series: [{
        name: 'Variação do Preço',
        data: <%=lineData%> // [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});
                </script>
            </main>
        </div>
    </form>
</body>
</html>
