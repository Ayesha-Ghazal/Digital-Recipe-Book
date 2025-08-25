<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="sdaproject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #fce8d6;
            background-image: url('https://www.shutterstock.com/image-photo/tablet-on-table-next-tomatoes-260nw-2262898341.jpg');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .register-container {
            width: 400px;
            padding: 20px;
            background-color: #a04040;
            color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            height: auto;
        }

        .register-header {
            background-color: transparent;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 1.8em;
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .form-label {
            background-color: #a04040;
            color: white;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
            font-size: 1em;
            box-sizing: border-box;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            width: 48%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #ff8c00;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: bold;
            font-size: 1.1em;
        }

        .btn:hover {
            background-color: #e07b00;
        }

        .message {
            color: yellow;
            margin-top: 10px;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
         <div class="register-header">
                <label>Register Form</label>
            </div>

            <div class="form-group">
                <label for="fullnametxt" class="form-label">Full Name</label>
                <asp:TextBox ID="fullnametxt" runat="server" CssClass="input-text" />
            </div>

            <div class="form-group">
                <label for="usernametxt" class="form-label">Username</label>
                <asp:TextBox ID="usernametxt" runat="server" CssClass="input-text" />
            </div>

            <div class="form-group">
                <label for="emailtxt" class="form-label">Email Address</label>
                <asp:TextBox ID="emailtxt" runat="server" TextMode="Email" CssClass="input-text" />
            </div>

            <div class="form-group">
                <label for="passwordtxt" class="form-label">Password</label>
                <asp:TextBox ID="passwordtxt" runat="server" TextMode="Password" CssClass="input-text" />
            </div>

            <div class="form-group">
                <label for="cpasstxt" class="form-label">Confirm Password</label>
                <asp:TextBox ID="cpasstxt" runat="server" TextMode="Password" CssClass="input-text" />
            </div>
         <div class="button-container">
            <asp:Button ID="Registerbtn" runat="server" Text="Register" CssClass="btn" OnClick="Button1_Click" />
            <asp:Button ID="Cancelbtn" runat="server" Text="Cancel" CssClass="btn" OnClick="Cancelbtn_Click" />
        </div>
            </div>
    </form>
</body>
</html>
