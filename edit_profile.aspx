<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_profile.aspx.cs" Inherits="sdaproject.edit_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
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
    margin: 50px auto;  /* centers it with top spacing */
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <div class="edit-header">My Profile</div>

            <div class="form-group">
                <span class="label-title">Username:</span>
                <asp:Label ID="lblUsername" runat="server" Text="..." />
            </div>

            <div class="form-group">
                <span class="label-title">Full Name:</span>
                <asp:Label ID="lblFullName" runat="server" Text="..." />
            </div>

            <div class="form-group">
                <span class="label-title">Email:</span>
                <asp:Label ID="lblEmail" runat="server" Text="..." />
            </div>

            <div class="form-group">
                <span class="label-title">Password:</span>
                <asp:Label ID="lblPassword" runat="server" Text="********" />
            </div>

            <div class="dropdown-group">
                <asp:Label ID="lblSelect" runat="server" Text="Select Field to Update:" />
                <br />
                <asp:DropDownList ID="ddlField" runat="server" Width="100%">
                    <asp:ListItem Text="Username" Value="Username" />
                    <asp:ListItem Text="Full Name" Value="FullName" />
                    <asp:ListItem Text="Email" Value="Email" />
                    <asp:ListItem Text="Password" Value="Password" />
                </asp:DropDownList>
            </div>

            <div class="update-group">
                <asp:Label ID="lblNewValue" runat="server" Text="Enter New Value:" />
                <br />
                <asp:TextBox ID="txtNewValue" runat="server" Width="100%" />
            </div>

            <div class="button-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="asp-button" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="asp-button" OnClick="btnCancel_Click" />
            </div>

            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success" />
        </div>
    </form>
</body>
</html>
