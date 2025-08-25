<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="sdaproject.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Recipe Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #e26a5e, #f29b56, #f7d8b2, #fff0c1);
        }
        .navbar {
            font-family: 'Open Sans', sans-serif;
            background-color: #a04040;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-weight: bold;
            font-size: 17px;
        }
        .navbar a:hover {
            background-color: #8a3030;
        }
        .home-button {
            background-color: #ff8c00;
        }

        .edit-container {
            width: 700px;
            margin: 50px auto;
            padding: 30px;
            background-color: #a04040;
            color: white;
            border-radius: 8px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
        }

        .edit-title {
            text-align: center;
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-value {
            background-color: #fdf9f9;
            color: #333;
            padding: 10px;
            border-radius: 5px;
            white-space: pre-wrap;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .back-button {
            width: 150px;
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

        .back-button:hover {
            background-color: #e07b00;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
       <div class="navbar">
            <div style="height: 30px; margin-top: 6px">
                <a href="Home.aspx" class="home-button">Home</a>
                <a href="user_profile.aspx">Profile</a>
                <a href="My_Recipes.aspx">My Recipe</a>
                <a href="#">Favourites</a></div>
        </div>

        <div class="edit-container">
            <div class="edit-title">Recipe Details</div>

            <div class="form-group">
                <span class="form-label">Recipe Name:</span>
                <div class="form-value" id="lblName" runat="server"></div>
            </div>

            <div class="form-group">
                <span class="form-label">Category:</span>
                <div class="form-value" id="lblCategory" runat="server"></div>
            </div>

            <div class="form-group">
                <span class="form-label">Ingredients:</span>
                <div class="form-value" id="lblIngredients" runat="server"></div>
            </div>

            <div class="form-group">
                <span class="form-label">Steps to Cook:</span>
                <div class="form-value" id="lblSteps" runat="server"></div>
            </div>

            <div class="button-container">
<asp:Button ID="backBtn" runat="server" Text="Back" CssClass="back-button" OnClientClick="window.history.back(); return false;" />
            </div>
        </div>

    </form>
</body>
</html>
