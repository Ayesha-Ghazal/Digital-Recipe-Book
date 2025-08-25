<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_recipe.aspx.cs" Inherits="sdaproject.update_recipe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Recipe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 18px;
            margin: 0;
            background: url('https://www.shutterstock.com/image-photo/tablet-on-table-next-tomatoes-260nw-2262898341.jpg') center center / cover no-repeat fixed;
        }

        .edit-container {
            width: 500px;
            padding: 35px;
            background-color: #a04040;
            color: white;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            margin: 50px auto; /* Center horizontally with margin on top */
        }

        .edit-header {
            text-align: center;
            font-size: 2em;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .form-group,
        .dropdown-group,
        .update-group {
            margin-bottom: 18px;
        }

        .label-title {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        textarea, input[type="text"], select, asp\\:TextBox {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 10px;
            font-size: 1em;
            border-radius: 6px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .asp-button {
            padding: 12px 24px;
            background-color: #ff8c00;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 1em;
            cursor: pointer;
            margin-right: 10px;
        }

        .asp-button:hover {
            background-color: #e07b00;
        }

        .button-group {
            text-align: center;
            margin-top: 25px;
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
    </style>
    <script type="text/javascript">
        function onFieldChange() {
            var ddl = document.getElementById('<%= ddlField.ClientID %>');
            var txt = document.getElementById('<%= txtNewValue.ClientID %>');
            var ddlCategory = document.getElementById('<%= ddlCategory.ClientID %>');

            if (ddl.value === 'CategoryId') {
                txt.style.display = 'none';
                ddlCategory.style.display = 'block';
            } else {
                txt.style.display = 'block';
                ddlCategory.style.display = 'none';
            }
        }
        window.onload = function () {
            onFieldChange();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="nav">
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="user_profile.aspx">Profile</a></li>
                <li><a class="active" href="My_Recipes.aspx">My Recipes</a></li>
                <li><a href="favourite.aspx">Favourites</a></li>
            </ul>
        </div>

        <div class="edit-container">
            <div class="edit-header">Update Recipe</div>

            <div class="form-group">
                <span class="label-title">Recipe Name:</span>
                <asp:Label ID="lblName" runat="server" ForeColor="White" Font-Bold="true"></asp:Label>
            </div>

            <div class="form-group">
                <span class="label-title">Category:</span>
                <asp:Label ID="lblCategory" runat="server" ForeColor="White" Font-Bold="true"></asp:Label>
            </div>

            <div class="form-group">
                <span class="label-title">Ingredients:</span>
                <asp:Label ID="lblIngredients" runat="server" ForeColor="White" Font-Bold="true" />
            </div>

            <div class="form-group">
                <span class="label-title">Steps to Cook:</span>
                <asp:Label ID="lblSteps" runat="server" ForeColor="White" Font-Bold="true" />
            </div>

            <div class="dropdown-group">
                <asp:Label ID="lblSelect" runat="server" Text="Select Field to Update:" CssClass="label-title" />
                <asp:DropDownList ID="ddlField" runat="server" AutoPostBack="true" Width="100%" Height="35px" >
                    <asp:ListItem Text="Recipe Name" Value="RecipeName" />
                    <asp:ListItem Text="Category" Value="CategoryId" />
                    <asp:ListItem Text="Ingredients" Value="Ingredients" />
                    <asp:ListItem Text="Steps to Cook" Value="StepsToCook" />
                </asp:DropDownList>
            </div>

            <div class="update-group">
                <asp:Label ID="lblNewValue" runat="server" Text="Enter New Value:" AssociatedControlID="txtNewValue" CssClass="label-title" />
                <asp:TextBox ID="txtNewValue" runat="server" Width="100%" TextMode="MultiLine" Rows="5" />
                <asp:DropDownList ID="ddlCategory" runat="server" Width="100%" Height="35px" style="display:none;" />
            </div>

            <div class="button-group">
                <asp:Button ID="btnUpdateRecipe" runat="server" Text="Update Recipe" CssClass="asp-button"  OnClick="btnUpdateRecipe_Click"  />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="asp-button" CausesValidation="false" OnClick="btnCancel_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="White" CssClass="text-success" />
        </div>
    </form>
</body>
</html>
