<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="favourite.aspx.cs" Inherits="sdaproject.favourite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Favourites</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #e26a5e, #f29b56, #f7d8b2, #fff0c1);
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
.nav {
            font-family: 'Open Sans', sans-serif;
            background-color: #a04040;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 15px;
        }

        .nav a {
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-weight: bold;
            font-size: 17px;
        }

        .nav a:hover {
            background-color: #8a3030;
        }

        .nav a.active {
            background-color: #ff8c00;
        }

        .search-container {
            margin-left: auto;
            display: flex;
        }

        .search-container input[type="text"] {
            padding: 8px;
            border: none;
            border-radius: 5px 0 0 5px;
            background-color: white;
            color: #333;
            font-size: 0.95em;
            width: 180px;
        }

        .search-btn {
            padding: 8px 15px;
            background-color: #ff8c00;
            color: white;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .search-btn:hover {
            background-color: #e07b00;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #8a3030;
            border: 1px solid #8a3030;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .fav-header {
            background-color: transparent; /* Made transparent so label color is visible */
            padding: 10px; /* Adjusted padding */
            border-radius: 5px;
            margin-bottom: 20px; /* Adjusted margin-bottom */
            text-align: center;
            color: white; /* White text for better contrast */
            font-weight: bold;
            font-size: 1.5em; /* Adjusted font size for header */
        }

        .gridview {
            display: grid;
            grid-template-columns: repeat(1, 1fr);
            gap: 10px;
        }

        .gridview div {
            background-color: #8a3030;
            padding: 20px;
            border: 1px solid #0a0a0a;
            border-radius: 5px;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="nav">
            <ul>
                <li><a  href="Home.aspx">Home</a></li>
                <li><a href="user_profile.aspx">Profile</a></li>
                <li><a href="My_Recipes.aspx">My Recipes</a></li>
                <li><a class="active" href="favourite.aspx">Favourites</a></li>
            </ul>
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search..." />
                <asp:Button ID="btnSearch" runat="server" Text="Submit" CssClass="search-btn" OnClick="btnSearch_Click" />
            </div>
        </div>
        </div>
        <div class="container">
            <div class="fav-header">
                <label>Favourite Recipe</label>
            </div>
            <div class="gridview">
               <asp:Repeater ID="rptFavourites" runat="server" OnItemCommand="rptFavourites_ItemCommand">

    <ItemTemplate>
        <div>
            <h3><%# Eval("RecipeName") %></h3>
            <p><strong>Ingredients:</strong> <%# Eval("Ingredients") %></p>
            <p><strong>Steps To Cook:</strong> <%# Eval("StepsToCook") %></p>

            <asp:Button ID="btnRemove" runat="server" 
                Text="Remove" 
                CommandName="Remove" 
                CommandArgument='<%# Eval("RecipeId") %>' 
                Style="background-color:#ff6347; color:white; border:none; padding:5px 10px; border-radius:5px; cursor:pointer;" />
        </div>
    </ItemTemplate>
</asp:Repeater>

            </div>
        </div>
    </form>
</body>
</html>
