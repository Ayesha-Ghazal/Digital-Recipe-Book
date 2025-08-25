<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="My_Recipes.aspx.cs" Inherits="sdaproject.My_Recipes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Recipes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #fce8d6;
            background-image: url('https://www.escoffieronline.com/wp-content/uploads/2014/04/Top-view-of-a-Mediterranean-meal-on-a-dinner-table-1400.jpeg');
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

.recipe-btn {
    background-color: #ff8c00;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    text-decoration: none;
    margin: 5px 5px 0 0;
    font-weight: bold;
    cursor: pointer;
    border: none;
}

.recipe-btn:hover {
    background-color: #e07b00;
}
        .recipe-section {
            width: 80%;
            margin: 40px auto;
            padding: 30px;
            background-color: transparent;
            color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        .recipe-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: center;
        }

        .recipe-card {
            flex: 1 1 calc(50% - 25px);
            max-width: calc(50% - 25px);
            padding: 25px;
            background-color: #a04040;
            color: white;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0,0,0,0.2);
            box-sizing: border-box;
        }

        .recipe-card h3 {
            margin-top: 0;
            color: #ff8c00;
            font-size: 1.6em;
        }

        .recipe-card p {
            margin-bottom: 15px;
            font-size: 1.1em;
        }

        .recipe-card button {
            background-color: #ff8c00;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin: 5px 5px 0 0;
            font-weight: bold;
            cursor: pointer;
        }

        .recipe-card button:hover {
            background-color: #e07b00;
        }
        .label-addrecipe {
    font-weight: bold;
    font-size: 1.7em;
      color: #4b2e2e; /* Dark brown */
    margin-right: 10px;
    font-family: Elephant;
    vertical-align: middle; /* Align nicely with button */
}
   


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="nav">
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a  href="user_profile.aspx">Profile</a></li>
                <li><a class="active" href="My_Recipes.aspx">My Recipes</a></li>
                <li><a href="favourite.aspx">Favourites</a></li>
            </ul>
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search..." />
               <asp:Button ID="btnSearch" runat="server" Text="Submit" CssClass="search-btn" OnClick="btnSearch_Click" />
            </div>
        </div>
         <div style="margin: 30px auto; width: 80%; padding: 15px; background-color: #f3e1c8; border-radius: 10px;">
         <asp:Label ID="Label2" runat="server" CssClass="label-addrecipe" Text="Add new recipe:"></asp:Label>
         <asp:Button ID="Button2" runat="server" Text="Add" OnClick="Button1_Click" CssClass="recipe-btn" Width="159px" />
        </div>

        <div class="recipe-section">
            <asp:Repeater ID="rptRecipes" runat="server">
                <HeaderTemplate>
                    <div class="recipe-cards">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="recipe-card">
                        <h3><%# Eval("RecipeName") %></h3>
                        <p>Category: <span><%# Eval("CategoryName") %></span></p>
                        <p>Created On: <span><%# Eval("DateCreated", "{0:MMMM dd, yyyy}") %></span></p>
                       <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="recipe-btn"
    OnClientClick='<%# "location.href=\"details.aspx?id=" + Eval("RecipeId") + "\"; return false;" %>' />


               <asp:Button ID="Button1" runat="server" Text="Update" CssClass="recipe-btn"
    CommandName="UpdateRecipe" CommandArgument='<%# Eval("RecipeId") %>' OnCommand="Recipe_Command" />




                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="recipe-btn"
                           CommandName="DeleteRecipe" CommandArgument='<%# Eval("RecipeId") %>' OnCommand="Recipe_Command" />

                    </div>
                </ItemTemplate>
               
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
