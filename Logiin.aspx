<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logiin.aspx.cs" Inherits="AdminItims.Logiin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>İTİMS</title>
    <link rel="icon" href="img/itimsLogo.png" type="image/x-icon" />
    <style>
        body {
            background-image: url(../img/photo.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            height: 100%;
            width: 60%;
        }

        .textbox {
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
        }

            .textbox:focus {
                border: 3px solid #555;
            }

        .button {
            background-color: #55a1d3;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 22px;
            cursor: pointer;
        }

        span.a {
            padding: 18px;
            border: 1px solid #FFC107;
            background-color: #cd9c41;
            color: white;
            margin-left: 50px;
            cursor: pointer;
            font-size: xx-large;
        }

        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #073350;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

                .sidenav a:hover {
                    color: #f1f1f1;
                }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

                .sidenav a {
                    font-size: 18px;
                }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <div style="margin-top: 145px;margin-left: 10px;">
               <h1 style="margin-left: 35px;  color: white;"> İTİMS </h1>
            <asp:TextBox ID="txtLog" CssClass="textbox" runat="server" placeholder="İstifadəçi Adı"></asp:TextBox>
            <asp:TextBox ID="txtPass" CssClass="textbox" TextMode="Password" placeholder="Parol" runat="server"></asp:TextBox>
            <asp:Label ID="txt" runat="server" Style="font-size: xx-large; font-style: italic; margin-left: 22px; color: white;"></asp:Label>
            <asp:TextBox CssClass="textbox" ID="txtCap" placeholder="Verifikasiya kodu" autocomplete="off" runat="server"></asp:TextBox>
                <asp:Label ID="lblerror" runat="server" style="color: red;"></asp:Label>
            <asp:Button ID="btnLogin" CssClass="button" Style="font-size: larger;" runat="server" Text="Daxil Et" OnClick="btnLogin_Click" />
                </div>
        </div>

        <div id="main">
            <div style="font-size: 60px; margin-left: 50px; color: white; margin-top: 155px; width: 150%;">
                İnformasiya Təhlükəsizliyinin İdarəedilməsi və Monitorinqi Sistemi
                             
            </div>
            <h4 style="margin-left: 50px; font-size: 32px; font-weight: 200; color: #99a0a4;">İT aktivlərin qeydiyyatı və nəzarəti üçün vahid sistem</h4>
            <span class="a" onclick="openNav()">Daxil ol</span>
        </div>
    </form>
    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
        }
    </script>

      <script>
          function button_click(objTextBox, objBtnID) {
              if (window.event.keyCode == 13) {
                  document.getElementById(objBtnID).focus();
                  document.getElementById(objBtnID).click();
              }
          }
      </script>
</body>
</html>
