﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="LabProject.LogIn" %>

<!DOCTYPE html>
<html>

<head>
    <script type="text/javascript">
    function showAlert() {
        alert("Incorrect Username or Password!! Try Again...");
    }
        </script>
  <meta charset="UTF-8">

  <title>Login </title>

  <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <style>
    	@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  src: local('Lato Regular'), local('Lato-Regular'), url(http://themes.googleusercontent.com/static/fonts/lato/v7/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');
}

body {
	background: #448ed3 ;
	font-family: "Lato" ;
}
.wrap {
	width:250px;
	height: auto;
	margin: auto;
	margin-top: 10%;
}
.avatar {
	width: 100%;
	margin: auto;
	width: 65px;
	border-radius: 100px;
	height: 65px;
	background: #448ed3 ;
	position: relative;
	bottom: -15px;
}
.avatar img {
	width: 55px;
	height: 55px;
	border-radius: 100px;
	margin: auto;
	border:3px solid #fff;
	display: block;
}
.wrap input {
	border: none;
	background: #fff;
  font-family:Lato ;
  font-weight:700 ;
	display: block;
	height: 40px;
	outline: none;
	width: calc(100% - 24px) ;
	margin: auto;
	padding: 6px 12px 6px 12px;
}
.bar {
	width: 100%;
	height: 1px;
	background: #fff ;
}
.bar i {
	width: 95%;
	margin: auto;
	height: 1px ;
	display: block;
	background: #d1d1d1;
}
.wrap input[type="text"] {
	border-radius: 7px 7px 0px 0px ;
}
.wrap input[type="password"] {
	border-radius: 0px 0px 7px 7px ;
}
.forgot_link {
	color: #83afdf ;
	color: #83afdf;
	text-decoration: none;
	font-size: 11px;
	position: relative;
	left: 193px;
	top: -36px;
}
.register{
	color: #83afdf ;
    font-weight:bold;
	color: #93ee65;
	text-decoration: none;
	font-size: 16px;
	position: relative;
	left: 40px;
	top: -36px;
}

        .Bbutton {
            width: 100%;
            height: 20px;
            border-radius: 7px;
            background: #b6ee65;
            text-decoration: center;
            color: #51771a;
            margin-top: 5px;
            padding-top: 14px;
            padding-bottom: 14px;
            outline: none;
            font-size: 12pt;
            border-bottom: 3px solid #307d63;
            cursor: pointer;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }
        .auto-style1 {
            width: 100%;
            height:25px;
            border-radius: 7px;
            background: #b6ee65;
            text-decoration: center;
            color: #51771a;
            margin-top: 5px;
            padding-top: 14px;
            padding-bottom: 14px;
            outline: none;
            font-size: 12pt;
            border-bottom: 3px solid #307d63;
            cursor: pointer;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }
        .auto-style2 {
            margin-top: 0px;
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

  <div class="wrap">
		<div class="avatar">
        <img src="Image/logo.jpg">
		</div>
		<input id="UserName" runat="server" type="text" placeholder="username" required>
		<div class="bar">
			<i></i>
		</div>
		<input id ="password"  runat="server" type="password" placeholder="password" required>
		<a href="" class="forgot_link" onclick ="">forgot ?</a>
        
		
            <div class="auto-style1">
            <asp:Button ID="Button1" runat="server" Text="Sign In"   onclick="btnSignInClicked" Width="250px" BackColor="#B5EC64" BorderStyle="None" Font-Size="12pt" Height="33px" class="Bbutton" CssClass="auto-style2" />
            </div>
      <br /><br /><br />
                <a href="Registration.aspx" class="register"  onclick ="")">Register as a new Admin</a>

	</div>
  <script src="js/index.js"></script>
    </form>

</body>

</html>


