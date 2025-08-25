<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BadgeInfo.aspx.cs" Inherits="sdaproject.BadgeInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
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

        .content {
            padding: 40px;
            font-family: 'Open Sans', sans-serif;
            line-height: 1.8;
            font-size: 18px;
            background-color: #fff0e6;
            color: #333;
        }

        .content h2 {
            margin-top: 25px;
            color: #a04040;
            font-size: 24px;
        }

        .content p {
            font-size: 18px;
            color: #333;
        }

        .content img {
            height: 100px;
            margin-top: 10px;
        }

        .badge-title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #a04040;
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
                <li><a href="#favourites">Favourites</a></li>
            </ul>
            <div class="dropdown">
                <div class="user-icon">
                    <span class="middle-line"></span>
                </div>
                <div class="dropdown-content">
                    <a href="edit_profile.aspx">Edit Profile</a>
                    <a href="BadgesInfo.aspx">Badges Info</a>
                    <a href="Login.aspx">Log Out</a>
                </div>
            </div>
        </div>
  
         <div class="content">
            <div class="badge-title">
                <asp:Label ID="Label5" runat="server" Text="Badge Info"></asp:Label>
            </div>

            <p>
                In our recipe platform, users are rewarded for their activity through a points and badge system:
            </p>

            <h2><asp:Label ID="Label6" runat="server" Text="Bronze Badge"></asp:Label></h2>
            <img src="image/bronze_badge.JPG" alt="Bronze Badge" />
            <p>
                Earned after every <strong>50 points</strong>.<br />
                You receive <strong>10 points</strong> for each recipe you add.<br />
                So, after <strong>5 recipes</strong>, you'll earn your first Bronze Badge.
            </p>

            <h2><asp:Label ID="Label7" runat="server" Text="Silver Badge"></asp:Label></h2>
            <img src="image/silver.JPG" alt="Silver Badge" />
            <p>
                Earned after every <strong>100 points</strong>.<br />
                That's equivalent to <strong>10 recipes</strong>.
            </p>

            <h2><asp:Label ID="Label8" runat="server" Text="Gold Badge"></asp:Label></h2>
            <img src="image/gold.JPG" alt="Gold Badge" />
            <p>
                Earned after every <strong>200 points</strong>.<br />
                That’s <strong>20 recipes</strong> submitted.
            </p>

           <h2>Skill Levels</h2>
<p>
    As you contribute more recipes and earn badges, your skill level will automatically upgrade:
</p>
<ul>
    <li><strong>Newbie:</strong> All new users start at this level.</li>
    <li><strong>Home Cook:</strong> Achieved after earning <strong>5 Bronze Badges</strong>.</li>
    <li><strong>Pro:</strong> Achieved after earning <strong>5 Silver Badges</strong>.</li>
    <li><strong>Chef’s Level:</strong> Achieved after earning <strong>5 Gold Badges</strong>.</li>
</ul>
<p>
    Keep submitting delicious recipes and climb the culinary ladder!
</p>
             </div>
    </form>
</body>
</html>
