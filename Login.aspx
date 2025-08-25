<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="sdaproject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #fce8d6;
            background-image: url('https://plus.unsplash.com/premium_photo-1681401569921-e3e99499bfe9?fm=jpg&q=60&w=3000');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .login-container {
            width: 50vw;
            padding: 30px;
            background-color: #a04040;
            color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            float: right;
            margin-top: 127px;
            margin-right: 50px;
        }
        .login-header {
            text-align: center;
            font-weight: bold;
            font-size: 1.5em;
            margin-bottom: 20px;
            color: white;
        }
        .label-container {
            margin-bottom: 10px;
        }
        .form-label {
            background-color: #a04040;
            color: white;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
        }
        input[type="text"], input[type="password"], .asp-input {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
            font-size: 1.0em;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }
        .btn-orange {
            width: 45%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #ff8c00;
            color: #fff;
            font-weight: bold;
            font-size: 1em;
            cursor: pointer;
        }
        .btn-orange:hover {
            background-color: #e07b00;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <asp:Label ID="lblHeader" runat="server" Text="Login"></asp:Label>
            </div>
            <div class="label-container">
    <asp:Label ID="lblUsername" runat="server" Text="Username:" ></asp:Label>
</div>
<asp:TextBox ID="usernametxt" runat="server" CssClass="asp-input"></asp:TextBox>

<div class="label-container">
    <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="form-label"></asp:Label>
</div>
<asp:TextBox ID="passwordtxt" runat="server" TextMode="Password" CssClass="asp-input"></asp:TextBox>


            <div class="button-container">
                <asp:Button ID="Loginbtn" runat="server" Text="Login" CssClass="btn-orange" OnClick="Button1_Click" />
                <asp:Button ID="Backbtn" runat="server" Text="Back" CssClass="btn-orange" OnClick="Button2_Click" />
            </div>
        </div>

    </form>
</body>
</html>
