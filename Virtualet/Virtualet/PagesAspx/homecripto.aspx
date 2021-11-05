<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homecripto.aspx.cs" Inherits="Virtualet.PagesAspx.homecripto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://kit.fontawesome.com/5bf652a268.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="homecripto.css" type="text/css"/>
    <title> Criptomoeda - Virtua'let </title>
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
                    <li><a href="homeusuario.aspx"><i class="fas fa-home"></i> Home </a></li>
                    <li><a href=" "><i class="fas fa-user-circle"></i> Perfil </a></li>
                    <li><a href=" "><i class="fas fa-wallet"></i> Wallet </a></li>
                    <li><a href="homenoticias.aspx"><i class="fas fa-newspaper"></i> Noticias </a></li>
                    <li><a href="homecripto.aspx"><i class="fab fa-bitcoin"></i> Criptomoedas </a></li>
                </ul>
            </nav>
        </header>
        <main>
            <script src="https://code.highcharts.com/highcharts.js"></script>
            <script src="https://code.highcharts.com/modules/series-label.js"></script>
            <script src="https://code.highcharts.com/modules/exporting.js"></script>
            <script src="https://code.highcharts.com/modules/export-data.js"></script>
            <script src="https://code.highcharts.com/modules/accessibility.js"></script>
            <script src="https://code.highcharts.com/highcharts.src.js"></script>
            <script src="https://code.highcharts.com/highcharts.js"></script>

            <figure class="highcharts-figure">
                <div id="container"></div>
            </figure>
            <script>
                Highcharts.chart('container', {

                    title: {
                        text: 'Solar Employment Growth by Sector, 2010-2016'
                    },

                    subtitle: {
                        text: 'Source: thesolarfoundation.com'
                    },

                    yAxis: {
                        title: {
                            text: 'Number of Employees'
                        }
                    },
                    
                    xAxis: {
                        title: {
                            text: 'Lucas'
                        }
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
                            },
                            pointStart: 2010
                        }
                    },

                    series: [{
                        name: 'Installation',
                        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    
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

            <table>
                <tr>
                    <td>
                        <asp:GridView ID="gvChart" runat="server"></asp:GridView>
                    </td>
                    <td>
                        <figure class="highcharts-figure">
                        <div id="linechart">
                        </div>
                        </figure>
                        <div id="line-chart">

                        </div>
                    </td>
                </tr>
            </table>
            <script>
                Highcharts.chart('linechart',{
                    chart: {
                        type: 'spline'
                    },
                    title: {
                        text: 'Variação de Preço'
                    },
                    xAxis: {
                        title: {
                            text: 'Dia'
                        }
                    },
                    yAxis: {
                        title: {
                            text: 'Preço'
                        }
                    },
                    series: [{
                        type: 'spline',
                        name: 'Moeda',
                        data: [20, 1212][25,3211][23,2131]
                    }]
                });

            </script>
        </main>
    </form>
</body>
</html>
