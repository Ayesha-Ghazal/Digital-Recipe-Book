<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_profile.aspx.cs" Inherits="sdaproject.user_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
     <style>
        body {
         
            margin: 0;
         
        }
        .main-content {
    background-image: url('https://www.shutterstock.com/image-photo/herbs-spices-cookbook-over-black-260nw-431210074.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    min-height: 100vh; /* Ensures it covers the full screen */
    padding: 20px;      /* Optional spacing from nav bar */
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

        .dropdown {
            position: relative;
            margin-left: auto;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
            right: 0;
            top: 100%;
            border-radius: 5px;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .user-icon {
            height: 30px;
            width: 30px;
            background-color: #ff8c00;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            padding: 3px;
            cursor: pointer;
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
        }

        .user-icon::before,
        .user-icon::after,
        .user-icon .middle-line {
            content: '';
            display: block;
            width: 20px;
            height: 2px;
            background-color: white;
        }

        .profile {
            width: 80%;
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background-color: rgba(160, 64, 64, 0.9);
            border-radius: 10px;
            color: white;
            font-size: 24px;
           font-family: Arial;
            line-height: 1.6;
        }

        .profile-row {
            display: flex;
            margin-bottom: 10px;
        }

        .profile-row label:first-child {
            width: 150px;
            font-weight: bold;
        }

        .badges {
            margin-top: 20px;
        }

        .badges img {
            width: 80px;
            height: 89px;
            margin-right: 10px;
            border: 2px solid #fff;
            border-radius: 10px;
             margin-top: 0px;
         }

        .badge-label {
            display: inline-block;
            width: 80px;
            text-align: center;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
 <div class="nav">
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a class="active" href="user_profile.aspx">Profile</a></li>
                <li><a href="My_Recipes.aspx">My Recipes</a></li>
                <li><a href="favourite.aspx">Favourites</a></li>
            </ul>
            <div class="dropdown">
                <div class="user-icon">
                    <span class="middle-line"></span>
                </div>
                <div class="dropdown-content">
                    <a href="edit_profile.aspx">Edit Profile</a>
                    <a href="BadgeInfo.aspx">Badges Info</a>
                    <a href="Logout.aspx">Log Out</a>

                </div>
            </div>
        </div>
        <div class="main-content">
        <div class="profile">
            <div class="profile-row">
                <label>Username:</label>
                <asp:Label ID="Username" runat="server" Text="*"></asp:Label>
            </div>
            <div class="profile-row">
                <label>Full Name:</label>
                <asp:Label ID="fullname" runat="server" Text="*"></asp:Label>
            </div>
            <div class="profile-row">
                <label>Skill Level:</label>
                <asp:Label ID="skill" runat="server" Text="*"></asp:Label>
            </div>
            <div class="profile-row">
                <label>Points:</label>
               <asp:Label ID="pointsLabel" runat="server" Text="*"></asp:Label>
            </div>


            <div class="badges">
                <label style="font-weight: bold;">Badges:</label><br />
                <span class="badge-label">
                    <img src="image/bronze_badge.JPG"alt="Bronze Badge" />
                    <asp:Label ID="bronze" runat="server" Text="*"></asp:Label>
                   
                </span>
                <span class="badge-label">
                     <img src= "image/silver.JPG" alt="Silver Badge" />
                    <asp:Label ID="silver" runat="server" Text="*"></asp:Label>
               
                </span>
                <span class="badge-label">
                    <img src= "image/gold.JPG"  alt="Gold Badge" />
                    <asp:Label ID="gold" runat="server" Text="*"></asp:Label>
                </span>
            </div>
            <hr style="margin-top:30px;" />
<asp:Label ID="lblHistory" runat="server" Text="Profile Update History" Font-Bold="true" ForeColor="White" Font-Size="Large" />
<asp:GridView ID="gvUpdateHistory" runat="server" AutoGenerateColumns="False" CssClass="table" 
              BackColor="White" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"
              CellPadding="4" ForeColor="Black" GridLines="Horizontal" Font-Size="Small">
    <Columns>
        <asp:BoundField DataField="UpdatedColumn" HeaderText="Field Updated" />
        <asp:BoundField DataField="OldValue" HeaderText="Old Value" />
        <asp:BoundField DataField="NewValue" HeaderText="New Value" />
        <asp:BoundField DataField="UpdatedAt" HeaderText="Updated On" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
    </Columns>
</asp:GridView>
        </div>
        </div>
    </form>
</body>
</html>
