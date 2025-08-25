<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_recipe.aspx.cs" Inherits="sdaproject.Add_recipe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Recipe</title>
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

        .add-container {
            width: 700px;
            padding: 25px;
            background-color: #a04040;
            color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            position: absolute;
            top: 80px;
            left: 50%;
            transform: translateX(-50%);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .asp-textbox, textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
            font-size: 1em;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 25px;
        }

        .asp-button {
            flex: 1;
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

        .asp-button:hover {
            background-color: #e07b00;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="add-container">
            <h2>Add Recipe</h2>

            <div class="form-group">
                <label class="form-label" for="RecipeNameTxt">Recipe Name:</label>
                <asp:TextBox ID="RecipeNameTxt" runat="server" CssClass="asp-textbox" />
            </div>

            <div class="form-group">
                <label class="form-label" for="CategoryDropdown">Category:</label>
                <asp:DropDownList ID="CategoryDropdown" runat="server" CssClass="asp-textbox" AppendDataBoundItems="True">
                    <asp:ListItem Text="-- Select Category --" Value="" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label class="form-label" for="IngredientsTxt">Ingredients:</label>
                <asp:TextBox ID="IngredientsTxt" runat="server" TextMode="MultiLine" Rows="5" CssClass="asp-textbox" />
            </div>

            <div class="form-group">
                <label class="form-label" for="StepsTxt">Steps to Cook:</label>
                <asp:TextBox ID="StepsTxt" runat="server" TextMode="MultiLine" Rows="5" CssClass="asp-textbox" />
            </div>

            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="Cancel" CssClass="asp-button" OnClick="Button1_Click" />
                <asp:Button ID="AddRecipeBtn" runat="server" Text="Add Recipe" CssClass="asp-button" OnClick="AddRecipeBtn_Click" />
            </div>
        </div>
        </div>
    </form>
</body>
</html>
