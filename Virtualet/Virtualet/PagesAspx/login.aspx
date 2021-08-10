<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Virtualet.PagesAspx.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Virtua'let - login</title>
    <link rel="stylesheet" type="text/css" href="login.css"/>
    <script>
        function fecha() {
            var elemento = document.getElementById("fecha");
            elemento.style.display = "none"
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
            <div class="tip" id="fecha">
                <div class="btnfecha" onclick="fecha()">
                </div>
            </div>
            <div class="screen">
                <div class="loginwin">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
