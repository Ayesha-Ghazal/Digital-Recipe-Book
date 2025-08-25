<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="sdaproject.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
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

        /* NEW container wrapper added for limiting width and centering */
        .container-wrapper {
            padding: 20px;
             max-width: 1000px; /* increased from 800px */
            margin: 20px auto;      /* center horizontally */
            border-radius: 10px;
        }

        /* recipe-card style reduced width by limiting max-width */
        .recipe-card {
            background-color: #a04040;
            color: white;
            padding: 15px 20px;
            margin-bottom: 20px;
            border-radius: 8px;
           max-width: 900px; /* increased from 600px */
            box-sizing: border-box;
        }

        .recipe-card p {
            margin: 5px 0;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .details-button {
            background-color: #ff8c00;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
        }

        .details-button:hover {
            background-color: #e07b00;
        }



        .filter-container {
    max-width: 250px;
    margin: 20px;
    position: fixed;  /* fixed position keeps it visible while scrolling */
    top: 80px;        /* below the nav bar */
    right: 20px;
    background-color: #a04040;
    padding: 15px 20px;
    border-radius: 8px;
    color: white;
    font-family: 'Open Sans', sans-serif;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.filter-dropdown {
    padding: 6px;
    border-radius: 5px;
    border: none;
    font-size: 1em;
}

.filter-container label {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    font-weight: bold;
    font-size: 1em;
}

.filter-container input[type="checkbox"] {
    width: 18px;
    height: 18px;
    cursor: pointer;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="nav">
            <ul>
                <li><a class="active" href="Home.aspx">Home</a></li>
                <li><a href="user_profile.aspx">Profile</a></li>
                <li><a href="My_Recipes.aspx">My Recipes</a></li>
                <li><a href="favourite.aspx">Favourites</a></li>
            </ul>
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search..." />
                <asp:Button ID="btnSearch" runat="server" Text="Submit" CssClass="search-btn" OnClick="btnSearch_Click" />
            </div>
        </div>


        <div class="filter-container">
            <asp:Label ID="filterlbl" runat="server" Text="Filter Recipe:"></asp:Label>
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
    <asp:ListItem Text="All Categories" Value="" />
</asp:DropDownList>


   
</div>
        <!-- Wrap repeater in container to limit width and center -->
        <div class="container-wrapper">
            <asp:Repeater ID="rptSearchResults" runat="server">
                <ItemTemplate>
                    <div class="recipe-card">
                        <p><strong>Username:</strong> <%# Eval("Username") %></p>
                        <p><strong>Skill Level:</strong> <%# Eval("skills") %></p>
                        <p><strong>Recipe Name:</strong> <%# Eval("RecipeName") %></p>
                        <p><strong>Category:</strong> <%# Eval("CategoryName") %></p>
                        <div class="button-group">
                            <a class="details-button" href='details.aspx?id=<%# Eval("RecipeId") %>'>Details</a>
                           <a class="details-button" href='favourite.aspx?id=<%# Eval("RecipeId") %>'>Add to Favourite</a>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
