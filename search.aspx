<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="sdaproject.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Result</title>
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

        .home-button {
            background-color: #ff8c00;
        }

      

        .search-container-wrapper {
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
            border-radius: 10px;
        }

        .recipe-card {
            background-color: #a04040;
            color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .recipe-card p {
            margin: 5px 0;
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

        .search-label {
            font-weight: bold;
            font-size: 1.8em;
            color: #f5f3f3;
            text-align: center;
            margin-bottom: 20px;
            background-color: #a04040;
            padding: 10px;
            border-radius: 5px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="nav">
            <ul>
                <li><a  href="Home.aspx" cssclass="home-button">Home</a></li>
                <li><a  href="user_profile.aspx">Profile</a></li>
                <li><a  href="My_Recipes.aspx">My Recipes</a></li>
                <li><a href="favourite.aspx">Favourites</a></li>
            </ul>
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search..." />
               <asp:Button ID="btnSearch" runat="server" Text="Submit" CssClass="search-btn" OnClick="btnSearch_Click" />
            </div>
</div>

          <div class="search-container-wrapper">
            <div class="search-label">Search Results</div>
              <asp:Label ID="lblNoResults" runat="server" Text="No results found." Visible="false" ForeColor="Black" Font-Bold="True" Font-Size="Large" />

            
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
