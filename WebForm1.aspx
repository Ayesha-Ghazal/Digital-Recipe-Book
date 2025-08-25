<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="sdaproject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Digital Recipe Book</title>
    <style>
      html, body, form {
         height: 100%;
         margin: 0;
         padding: 0;
      }

      body {
         font-family: Arial, sans-serif;
         background-color: #fce8d6;
         background-image: url('https://media.istockphoto.com/id/478776508/photo/blank-cookbook-and-spices.jpg?s=612x612&w=0&k=20&c=hM08Ccu4XPwYVvXdxgvsGuhtDf8jtjrXm7NkaeAC-RM=');
         background-size: cover;
         background-position: center;
         background-repeat: no-repeat;
         position: relative;
       }

      form {
         display: flex;
         justify-content: center;
         align-items: center;
         height: 100%;
         width: 100%;
         position: relative;
       }

      body::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.4);
          z-index: -1;
      }

        .container {
            width: 80%;
            max-width: 900px;
            padding: 40px;
            background-color: rgba(160, 64, 64, 0.9);
            border: 1px solid #8a3030;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
            color: white;
            text-align: center;
            box-sizing: border-box;
            min-height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .header {
            margin-bottom: 30px;
        }

        .header h2 {
            color: white;
            margin-bottom: 15px;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .header p {
            color: #ffe0b3;
            font-size: 1.2em;
            line-height: 1.6;
            max-width: 600px;
            margin: 0 auto;
        }

        .form-actions {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-top: 40px;
        }

        .btn {
            min-width: 180px;
            height: 55px;
            background-color: #ff8c00;
            color: #fff;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.3em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn:hover {
            background-color: #e07b00;
            transform: translateY(-2px);
        }

        .btn.register {
            background-color: #a04040;
            border: 2px solid #ff8c00;
        }

        .btn.register:hover {
            background-color: #8a3030;
            border-color: #e07b00;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Welcome To Digital Recipe Book</h2>
                <p>Your personal hub for discovering, creating, and sharing delicious recipes from around the world. Get started on your culinary journey now!</p>
            </div>
            <div class="form-actions">
                <asp:Button ID="Button2" runat="server" Text="Login" CssClass="btn" OnClick="Button2_Click" />
                <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn register" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
